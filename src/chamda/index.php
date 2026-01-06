<?php
include 'ketnoi.php';
session_start();

// Xử lý điều kiện hiển thị sản phẩm
$title = "Sản phẩm nổi bật";
$where = "";
$params = [];
$types = "";

// Biến kiểm tra có đang lọc/tìm kiếm hay không
$showCategories = true;  // Mặc định hiển thị danh mục

// Nếu có tìm kiếm 
if (isset($_GET['timkiem']) && trim($_GET['timkiem']) !== '') {
    $search = '%' . trim($_GET['timkiem']) . '%';
    $where = "WHERE TenSP LIKE ?";
    $params = [$search];
    $types = "s";
    $title = 'Kết quả tìm kiếm cho: "' . htmlspecialchars(trim($_GET['timkiem'])) . '"';
    $showCategories = false;  
}
// Nếu có chọn danh mục
elseif (isset($_GET['madm']) && !empty($_GET['madm'])) {
    $madm = (int)$_GET['madm'];
    $where = "WHERE MaDM = ?";
    $params = [$madm];
    $types = "i";

    // Lấy tên danh mục để làm tiêu đề
    $stmt_dm = $conn->prepare("SELECT TenDM FROM DanhMucSP WHERE MaDM = ?");
    $stmt_dm->bind_param("i", $madm);
    $stmt_dm->execute();
    $result_dm = $stmt_dm->get_result();
    if ($row_dm = $result_dm->fetch_assoc()) {
        $title = "Sản phẩm danh mục: " . htmlspecialchars($row_dm['TenDM']);
    }
    $stmt_dm->close();
    $showCategories = false;  // Ẩn danh mục khi đang xem một danh mục cụ thể
}
// Trang chủ: hiển thị 8 sản phẩm cũ nhất

// Chuẩn bị và thực thi query
$sql = "SELECT * FROM SanPham $where ORDER BY MaSP ASC LIMIT 8";
$stmt = $conn->prepare($sql);
if (!empty($params)) {
    $stmt->bind_param($types, ...$params);
}
$stmt->execute();
$sp = $stmt->get_result();
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chăm Sóc Da Học Đường</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">

    <style>
        /* ===== DANH MỤC ===== */
        .category-card img{
            width:100%;
            height:180px;
            object-fit:cover;
            border-radius:10px;
            transition: transform 0.3s ease;
        }
        .category-card:hover img{
            transform: scale(1.08);
        }
        .category-card h6{
            margin-top:15px;
            font-weight:700;
            font-size:1.15rem;
            color:#333;
        }

        /* ===== SẢN PHẨM NỔI BẬT ===== */
        .product-grid { 
            margin: 40px auto; 
            padding: 0 15px; 
        }
        .product-card{
            background:#fff;
            border-radius:12px;
            padding:20px;
            text-align:center;
            height:100%;
            box-shadow:0 4px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
        }
        .product-card:hover{
            transform: translateY(-10px);
            box-shadow:0 15px 30px rgba(0,0,0,0.15);
        }
        .product-card img{
            width:100%;
            height:300px;
            object-fit:cover;
            border-radius:10px;
        }
        .product-card h5{
            font-size:16px;
            margin:15px 0 10px;
            line-height:1.4;
            height:50px;
            overflow:hidden;
            display:-webkit-box;
            -webkit-line-clamp:2;
            -webkit-box-orient:vertical;
            color:#333;
        }
        .product-card .price{
            color:#e74c3c;
            font-weight:bold;
            font-size:1.3rem;
            margin-bottom:15px;
        }
        .product-card .btn {
            background-color: #7ca6c9;  
            color: white;               
            border: none;
            width: 100%;
            padding: 10px;
            border-radius: 5px;
        }
        .product-card .btn:hover {
            background-color: #007bb5;
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

    <!-- ===== BANNER ===== -->
    <div id="homeCarousel" class="carousel slide shadow-lg" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#homeCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#homeCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#homeCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>

        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/banner1.jpg" class="d-block w-100 img-fluid" alt="Banner 1">
            </div>
            <div class="carousel-item">
                <img src="images/banner2.jpg" class="d-block w-100 img-fluid" alt="Banner 2">
                <div class="carousel-caption d-none d-md-block">
                    <a href="tatcasanpham.php" class="btn btn-primary btn-lg mt-3">Xem Ngay</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/banner3.jpg" class="d-block w-100 img-fluid" alt="Banner 3">
                <div class="carousel-caption d-none d-md-block">
                    <a href="goiy.php" class="btn btn-outline-light btn-lg mt-3">Tư Vấn Ngay</a>
                </div>
            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#homeCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#homeCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <!-- ===== DANH MỤC - CHỈ HIỂN THỊ KHI Ở TRANG CHỦ ===== -->
    <?php if ($showCategories): ?>
    <div class="container my-5">
        <h4 class="text-center fw-bold mb-5">Danh mục sản phẩm</h4>
        <div class="row g-4">
            <?php
            $dm = $conn->query("SELECT MaDM, TenDM FROM DanhMucSP ORDER BY MaDM LIMIT 6");
            $images = ['dm1.jpg', 'dm2.jpg', 'dm3.jpg', 'dm4.jpg', 'dm5.jpg', 'dm6.jpg'];
            $i = 0;
            while($row = $dm->fetch_assoc()):
            ?>
            <div class="col-6 col-md-4">
                <a href="index.php?madm=<?= $row['MaDM'] ?>" class="text-decoration-none text-dark">
                    <div class="category-card text-center">
                        <img src="images/danhmuc/<?= $images[$i] ?>" alt="<?= htmlspecialchars($row['TenDM']) ?>">
                        <h6><?= htmlspecialchars($row['TenDM']) ?></h6>
                    </div>
                </a>
            </div>
            <?php
            $i++;
            endwhile;
            ?>
        </div>
    </div>
    <?php endif; ?>

    <!-- ===== SẢN PHẨM ===== -->
    <div class="container my-5 pb-5">
        <h4 class="text-center fw-bold mb-5"><?= $title ?></h4>

        <?php if ($sp->num_rows > 0): ?>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
                <?php while($row = $sp->fetch_assoc()): ?>
                <div class="col">
                    <div class="product-card">
                        <img src="<?= htmlspecialchars($row['HinhAnh']) ?>" onerror="this.src='images/placeholder.jpg';">
                        <h5><?= htmlspecialchars($row['TenSP']) ?></h5>
                        <p class="price">
                            <?= number_format($row['Gia'],0,'','.') ?> VNĐ
                        </p>
                        <a href="chitiet.php?id=<?= $row['MaSP'] ?>" class="btn btn-outline-primary btn-sm mt-2">
                            Chi tiết
                        </a>
                    </div>
                </div>
                <?php endwhile; ?>
            </div>
        <?php else: ?>
            <div class="text-center py-5">
                <p class="text-muted fs-4">Không có sản phẩm</p>
            </div>
        <?php endif; ?>
    </div>

    <!-- ===== FOOTER ===== -->
    <footer class="py-5 mt-5 border-top">
        <div class="container">
            <div class="row align-items-start small text-white">
                <div class="col-12 text-center mb-4">
                    Website tư vấn và cung cấp thông tin về chăm sóc da dành cho học sinh – sinh viên.
                </div>
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
</body>
</html>
<?php 
    $stmt->close();
    $conn->close(); 
?>