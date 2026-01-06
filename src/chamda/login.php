<?php
session_start();
include 'ketnoi.php';

// Nếu đã đăng nhập rồi thì chuyển thẳng vào admin
if (isset($_SESSION['admin']) && $_SESSION['admin'] === true) {
    header("Location: admin.php");
    exit();
}

// Xử lý thông báo đăng xuất (nếu truy cập login.php?thoat=1)
if (isset($_GET['thoat'])) {
// Session đã được destroy ở admin.php trước khi redirect sang đây
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng Nhập Quản Trị</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        .login-card {
            max-width: 450px; 
            border-radius: 20px; 
            overflow: hidden; 
            box-shadow: 0 15px 35px rgba(0,0,0,0.1); 
        }
        .login-header { 
            background: #7ca6c9; 
            color: white; 
            padding: 40px 30px; 
            text-align: center; 
        }
        .login-header h2 { 
            margin: 0; 
            font-weight: 700; 
        }
        .login-body { 
            padding: 50px 40px; 
            background: white; 
        }
        .btn-login { 
            background: #7ca6c9; 
            border: none; 
            padding: 15px; 
            font-size: 1.2rem; 
            border-radius: 50px; 
            font-weight: 600; 
            color: white;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold d-flex align-items-center" href="index.php">
                <img src="images/logo.jpg" width="40" height="40" class="rounded-circle me-2">
                Chăm Da Học Đường
            </a>
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
    <div class="container" style="min-height: calc(100vh - 76px); display: flex; align-items: center; justify-content: center;">
    <div class="login-card">
        <div class="login-header">
            <h2>Đăng nhập tài khoản quản trị</h2>
        </div>
        <div class="login-body">
            <?php if (isset($_GET['loi'])): ?>
                <div class="alert alert-danger text-center mb-4">Sai tên đăng nhập hoặc mật khẩu!</div>
            <?php endif; ?>
            <?php if (isset($_GET['thoat'])): ?>
                <div class="alert alert-info text-center mb-4">Đã đăng xuất thành công!</div>
            <?php endif; ?>

            <form action="dangnhap.php" method="POST">
                <div class="mb-4">
                    <label class="form-label fw-bold">Tên đăng nhập</label>
                    <input type="text" name="tendangnhap" class="form-control form-control-lg" placeholder="Nhập tên đăng nhập" required autofocus>
                </div>
                <div class="mb-4">
                    <label class="form-label fw-bold">Mật khẩu</label>
                    <input type="password" name="matkhau" class="form-control form-control-lg" placeholder="Nhập mật khẩu" required>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary btn-login">Đăng Nhập</button>
                </div>
            </form>
            <div class="text-center mt-4 text-muted">
                <small>© 2025 Chăm Da Học Đường</small>
            </div>
        </div>
    </div>
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