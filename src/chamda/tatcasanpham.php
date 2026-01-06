<?php include 'ketnoi.php'; session_start(); ?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tất Cả Sản Phẩm - Chăm Sóc Da Học Đường</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        .product-card {
            display: flex;
            flex-direction: column;
            height: 100%;
            border: 1px solid #eee;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.2s, box-shadow 0.2s;
            background-color: #fff;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        .product-card img {
            width: 100%;
            height: 260px;              
            object-fit: contain;      
            background-color: #f8f9fa;
            padding: 15px;
        }
        .product-card .card-body {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 15px;
            text-align: center;
        }
        .product-card h5 {
            min-height: 60px;           
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            font-size: 1rem;
            line-height: 1.4;
            color: #333;
        }
        .product-card .price {
            color: #dc3545;
            font-weight: bold;
            font-size: 1.1rem;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <!-- ===== NAVBAR ===== -->
    <nav class="navbar navbar-expand-lg shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold d-flex align-items-center text-white" href="index.php">
                <img src="images/logo.jpg" width="40" height="40" class="rounded-circle me-2">
                Chăm Da Học Đường
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain">
                <span class="navbar-toggler-icon" style="filter: brightness(0) invert(1);"></span>
            </button>
            <div class="collapse navbar-collapse" id="navMain">
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link fw-semibold text-white" href="index.php">Trang Chủ</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle fw-semibold text-white" href="#" data-bs-toggle="dropdown">
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
                        <a class="nav-link fw-semibold text-white active" href="tatcasanpham.php">Sản Phẩm</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-semibold text-white" href="tuvan.php">Tư vấn</a>
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
    
    <div class="container product-grid my-5">
        <h3 class="mb-4 text-center">Tất Cả Sản Phẩm</h3>

        <?php
        // Xử lý điều kiện lọc
        $where = '';
        $url_params = '';
        if (isset($_GET['madm'])) {
            $madm = (int)$_GET['madm'];
            $where = " WHERE MaDM = $madm";
            $url_params .= '&madm=' . $madm;
        }
        if (isset($_GET['timkiem'])) {
            $timkiem = $conn->real_escape_string($_GET['timkiem']);
            $where = " WHERE TenSP LIKE '%$timkiem%'";
            $url_params .= '&timkiem=' . urlencode($_GET['timkiem']);
        }

        // Phân trang
        $products_per_page = 20;
        $page = max(1, (int)($_GET['page'] ?? 1));
        $offset = ($page - 1) * $products_per_page;

        // Đếm tổng sản phẩm
        $count_sql = "SELECT COUNT(*) as total FROM SanPham $where";
        $count_result = $conn->query($count_sql);
        $total_products = $count_result->fetch_assoc()['total'];
        $total_pages = ceil($total_products / $products_per_page);

        // Lấy sản phẩm trang hiện tại
        $sql = "SELECT * FROM SanPham $where ORDER BY MaSP DESC LIMIT $products_per_page OFFSET $offset";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            echo '<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4 justify-content-center">';
            while($row = $result->fetch_assoc()) {
                echo '<div class="col">
                        <div class="product-card">
                            <img src="' . htmlspecialchars($row['HinhAnh']) . '" alt="' . htmlspecialchars($row['TenSP']) . '">
                            <div class="card-body">
                                <h5>' . htmlspecialchars($row['TenSP']) . '</h5>
                                <p class="price">Giá: ' . number_format($row['Gia'], 0, '', '.') . ' VNĐ</p>
                                <a href="chitiet.php?id=' . $row['MaSP'] . '" class="btn btn-primary w-100">Chi Tiết</a>
                            </div>
                        </div>
                      </div>';
            }
            echo '</div>';

            // Phân trang
            if ($total_pages > 1) {
                echo '<nav aria-label="Page navigation" class="mt-5">
                        <ul class="pagination justify-content-center">';
                
                if ($page > 1) {
                    echo '<li class="page-item">
                            <a class="page-link" href="?page=' . ($page - 1) . $url_params . '">«</a>
                          </li>';
                }

                $start = max(1, $page - 2);
                $end = min($total_pages, $page + 2);
                for ($i = $start; $i <= $end; $i++) {
                    $active = ($i == $page) ? ' active' : '';
                    echo '<li class="page-item' . $active . '">
                            <a class="page-link" href="?page=' . $i . $url_params . '">' . $i . '</a>
                          </li>';
                }

                if ($page < $total_pages) {
                    echo '<li class="page-item">
                            <a class="page-link" href="?page=' . ($page + 1) . $url_params . '">»</a>
                          </li>';
                }

                echo '</ul></nav>';
            }
        } else {
            echo '<p class="text-center fs-4 text-muted">Không có sản phẩm nào.</p>';
        }
        $conn->close();
        ?>
    </div>

    <footer class="py-5 mt-5 border-top">
        <div class="container">
            <div class="row align-items-start small">
                <div class="col-12 text-center mb-4">
                    Website tư vấn và cung cấp thông tin về chăm sóc da dành cho học sinh – sinh viên.
                </div>
                <div class="col-lg-4 col-md-6 mb-3 text-center mx-auto">
                    <h6 class="mb-3 fw-bold">LIÊN HỆ</h6>
                    <p class="lh-sm mb-0 opacity-90">
                        Địa chỉ: 126 Nguyễn Thiện Thành, Phường 5, Trà Vinh<br>
                        Hotline: 0909 999 999<br>
                        Email: chamdahocduong@gmail.com
                    </p>
                </div>
            </div>
            <div class="text-center mt-4 pt-3 border-top small opacity-75">
                © 2025 Chăm da học đường
            </div>
        </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>