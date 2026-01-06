<?php
include 'ketnoi.php';

$id = (int)($_GET['id'] ?? 0);
if ($id == 0) {
    die('<div class="container mt-5"><div class="alert alert-danger text-center">Không có sản phẩm!</div></div>');
}

/* ===== LẤY SẢN PHẨM ===== */
$sql = "SELECT sp.*, dm.TenDM 
        FROM SanPham sp 
        LEFT JOIN DanhMucSP dm ON sp.MaDM = dm.MaDM 
        WHERE sp.MaSP = $id";
$result = $conn->query($sql);
if (!$result || $result->num_rows == 0) {
    die('<div class="container mt-5"><div class="alert alert-danger text-center">Sản phẩm không tồn tại!</div></div>');
}
$row = $result->fetch_assoc();

/* ===== ẢNH PHỤ =====*/
$cacHinhAnh = [];
if (!empty($row['CacHinhAnh'])) {
    $decoded = json_decode(trim($row['CacHinhAnh']), true);
    if (is_array($decoded)) {
        $cacHinhAnh = $decoded;
    }
}
/* ===== LOẠI DA ===== */
$loaiDaPhuHop = [];
$sql_ld = "
    SELECT ld.TenLoaiDa 
    FROM SanPham_LoaiDa spl 
    JOIN LoaiDa ld ON spl.MaLoaiDa = ld.MaLoaiDa 
    WHERE spl.MaSP = $id
";
$result_ld = $conn->query($sql_ld);
if ($result_ld) {
    while ($ld = $result_ld->fetch_assoc()) {
        $loaiDaPhuHop[] = $ld['TenLoaiDa'];
    }
}

/* ===== SẢN PHẨM GỢI Ý ===== */
$goiY = [];
$madm = (int)$row['MaDM'];
$sql_goiy = "
    SELECT MaSP, TenSP, HinhAnh 
    FROM SanPham 
    WHERE MaDM = $madm AND MaSP != $id 
    ORDER BY RAND() 
    LIMIT 2
";
$result_goiy = $conn->query($sql_goiy);
if ($result_goiy) {
    while ($gy = $result_goiy->fetch_assoc()) {
        $goiY[] = $gy;
    }
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title><?= htmlspecialchars($row['TenSP']) ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        .container {
            max-width: 1200px;
        }
        .carousel-img {
            width: 100%;
            height: 420px;
            object-fit: contain;
            background-color: #ffffff;
            border-radius: 14px;
            border: 1px solid #e5e7eb;
        }
        .thumbnail-vertical {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .product-thumbnail {
            width: 70px;
            height: 70px;
            object-fit: cover;
            border-radius: 10px;
            cursor: pointer;
            border: 1px solid #dcdcdc;
            opacity: 0.7;
            transition: all 0.25s ease;
        }
        .product-thumbnail:hover,
        .product-thumbnail.active {
            opacity: 1;
            border-color: #0d6efd;
        }
        .info-card {
            background-color: #ffffff;
            border-radius: 18px;
            padding: 28px;
            border: 1px solid #e6e9ee;
        }
        .info-card h5 {
            font-size: 0.95rem;
            color: #6b7280;
            font-weight: 500;
            margin-bottom: 6px;
        }
        .info-card h3 {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 12px;
            line-height: 1.3;
        }
        .price-text {
            font-size: 1.75rem;
            font-weight: 700;
            color: #dc2626;
            margin-bottom: 14px;
        }
        .info-card h6 {
            font-weight: 600;
            margin-top: 10px;
        }
        .info-card ul {
            padding-left: 18px;
            margin-top: 6px;
        }
        .info-card ul li {
            font-size: 0.95rem;
            margin-bottom: 6px;
            color: #374151;
        }
        .detail-section {
            padding: 18px 20px;
            background-color: #daeafaff;
            border-radius: 14px;
            border: 1px solid #5a73a6ff;
            margin-bottom: 18px;
        }
        .detail-section h5 {
            font-size: 1.05rem;
            font-weight: 600;
            color: #111827;
            margin-bottom: 8px;
        }
        .detail-section p {
            font-size: 0.95rem;
            line-height: 1.7;
            color: #374151;
        }
        .goiy {
            gap: 32px;
        }
        .goiy img {
            width: 180px;
            height: 180px;
            object-fit: cover;
            border-radius: 16px;
            border: 1px solid #e5e7eb;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }
        .goiy img:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.12);
        }
        .goiy p {
            max-width: 180px;
            margin-top: 10px;
            font-size: 0.95rem;
            text-align: center;
            color: #1f2937;
        }
        .goiy a {
            text-decoration: none;
        }
        .goiy a:hover p {
            color: #2563eb;
        }
        @media (max-width: 992px) {
            .carousel-img {
                height: 360px;
            }
        }
        @media (max-width: 768px) {
            .carousel-img {
                height: 300px;
            }
            .thumbnail-vertical {
                display: none;
            }
        }
        @media (max-width: 576px) {
            .carousel-img {
                height: 260px;
            }
            .goiy {
                flex-direction: column;
                align-items: center;
            }
            .goiy img {
                width: 160px;
                height: 160px;
            }
            .goiy p {
                max-width: 160px;
            }
        }
    </style>
</head>

<body>
    <!-- ===== NAVBAR ===== -->
    <nav class="navbar navbar-expand-lg shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold d-flex align-items-center" href="index.php">
                <img src="images/logo.jpg" width="40" height="40" class="rounded-circle me-2">
                Chăm Da Học Đường
            </a>
            <!-- Nút 3 gạch màu trắng khi responsive -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain">
                <span class="navbar-toggler-icon" style="filter: brightness(0) invert(1);"></span>
            </button>
            <div class="collapse navbar-collapse" id="navMain">
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link fw-semibold" href="index.php">Trang Chủ</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle fw-semibold" href="#" data-bs-toggle="dropdown">
                            Danh Mục Sản Phẩm
                        </a>
                        <ul class="dropdown-menu">
                            <?php
                            $dm_menu = $conn->query("SELECT * FROM DanhMucSP");
                            while($row_menu = $dm_menu->fetch_assoc()){
                                echo '<li><a class="dropdown-item" style="color: #000 !important; font-weight: bold !important;" href="index.php?madm='.$row_menu['MaDM'].'">'.$row_menu['TenDM'].'</a></li>';
                            }
                            ?>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-semibold" href="tatcasanpham.php">Sản Phẩm</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-semibold" href="tuvan.php">Tư vấn</a>
                    </li>
                </ul>
                <form class="d-flex ms-auto" method="GET" action="index.php">
                    <input class="form-control me-2" type="search" name="timkiem" placeholder="Tìm kiếm" 
                        value="<?= isset($_GET['timkiem']) ? htmlspecialchars($_GET['timkiem']) : '' ?>">
                    <button class="btn btn-outline-light" type="submit">Tìm</button>
                </form>
            </div>
        </div>
    </nav>

    <!-- ===== SECTION 1: ẢNH + THÔNG TIN ===== -->
    <div class="container my-4">
    <div class="row g-4 align-items-stretch">

        <!-- ẢNH -->
        <div class="col-lg-5 d-flex gap-3">

            <div class="thumbnail-vertical">
                <img src="<?= htmlspecialchars($row['HinhAnh']) ?>"
                    class="product-thumbnail active"
                    data-bs-target="#carouselSanPham"
                    data-bs-slide-to="0">
                <?php foreach ($cacHinhAnh as $key => $hinh): ?>
                    <img src="<?= htmlspecialchars($hinh) ?>"
                        class="product-thumbnail"
                        data-bs-target="#carouselSanPham"
                        data-bs-slide-to="<?= $key + 1 ?>">
                <?php endforeach; ?>
            </div>

            <div class="flex-grow-1">
                <div id="carouselSanPham" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="<?= htmlspecialchars($row['HinhAnh']) ?>" class="carousel-img">
                        </div>
                        <?php foreach ($cacHinhAnh as $hinh): ?>
                            <div class="carousel-item">
                                <img src="<?= htmlspecialchars($hinh) ?>" class="carousel-img">
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>

        </div>

        <!-- THÔNG TIN -->
        <div class="col-lg-7 d-flex">
            <div class="info-card w-100">

                <h5 class="fw-bold"><?= htmlspecialchars($row['ThuongHieu']) ?></h5>
                <h3><?= htmlspecialchars($row['TenSP']) ?></h3>

                <p class="text-muted mb-1">
                    Danh mục: <?= htmlspecialchars($row['TenDM']) ?>
                </p>

                <div class="price-text mb-3">
                    <?= number_format($row['Gia'], 0, '', '.') ?> VNĐ
                </div>

                <h6>Phù hợp với loại da</h6>
                <?php if (!empty($loaiDaPhuHop)): ?>
                    <ul>
                        <?php foreach ($loaiDaPhuHop as $ld): ?>
                            <li><?= htmlspecialchars($ld) ?></li>
                        <?php endforeach; ?>
                    </ul>
                <?php else: ?>
                    <p class="text-muted">Chưa xác định</p>
                <?php endif; ?>

            </div>
        </div>

    </div>
    </div>

    <!-- ===== SECTION 2: NỘI DUNG CHI TIẾT ===== -->
    <div class="container mb-4">
    <div class="info-card">
        <div class="detail-section">
        <h5 class="fw-semibold mb-2">Công dụng</h5>
        <p><?= nl2br(htmlspecialchars($row['CongDung'])) ?></p>
    </div>

    <div class="detail-section">
        <h5 class="fw-semibold mb-2">Thành phần chính</h5>
        <p><?= nl2br(htmlspecialchars($row['ThanhPhan'])) ?></p>
    </div>

    <div class="detail-section">
        <h5 class="fw-semibold mb-2">Hướng dẫn sử dụng</h5>
        <p><?= nl2br(htmlspecialchars($row['HuongDanSD'])) ?></p>
    </div>

    </div>
    </div>


    <!-- ===== GỢI Ý ===== -->
    <?php if (!empty($goiY)): ?>
    <div class="container mb-5">

        <!-- TIÊU ĐỀ SẢN PHẨM GỢI Ý -->
        <h5 class="text-center mb-3 fw-semibold">
            Sản phẩm gợi ý
        </h5>

        <div class="d-flex justify-content-center goiy">
        <?php foreach ($goiY as $sp): ?>
            <div class="text-center">
                <a href="chitiet.php?id=<?= $sp['MaSP'] ?>">
                    <img src="<?= htmlspecialchars($sp['HinhAnh']) ?>">
                    <p class="mt-2"><?= htmlspecialchars($sp['TenSP']) ?></p>
                </a>
            </div>
        <?php endforeach; ?>
        </div>

    </div>
    <?php endif; ?>
    <footer class="py-5 mt-5 border-top">
        <div class="container">
            <div class="row align-items-start small text-white">
                <!-- Dòng giới thiệu được căn giữa đầy đủ -->
                <div class="col-12 text-center mb-4">
                    Website tư vấn và cung cấp thông tin về chăm sóc da dành cho học sinh – sinh viên.
                </div>
                
                <!-- Phần liên hệ giữ nguyên và vẫn căn giữa -->
                <div class="col-lg-4 col-md-6 mb-3 text-center mx-auto">
                    <h6 class="mb-3 fw-bold" style="color: #ffffff;">LIÊN HỆ</h6>
                    <p class="lh-sm mb-0 opacity-90">
                        Địa chỉ: 126 Nguyễn Thiện Thành, Phường 5, Trà Vinh<br>
                        Hotline: 0909 999 999<br>
                        Email: chamdahocduong@gmail.com
                    </p>
                </div>
            </div>
            <div class="text-center mt-4 pt-3 border-top small" style="border-color: rgba(255,255,255,0.2) !important; color: #bdc3c7;">
                © 2025 Chăm da học đường
            </div>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
    /* ===== ACTIVE THUMBNAIL ===== */
    const carousel = document.querySelector('#carouselSanPham');
    carousel.addEventListener('slid.bs.carousel', function (e) {
        document.querySelectorAll('.product-thumbnail').forEach(t => t.classList.remove('active'));
        document.querySelectorAll('.product-thumbnail')[e.to].classList.add('active');
    });
    </script>

</body>
</html>
<?php $conn->close(); ?>
