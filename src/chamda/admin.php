<?php
session_start();
include 'ketnoi.php';

// Xử lý đăng xuất
if (isset($_GET['thoat'])) {
    session_destroy();
    header("Location: login.php");
    exit();
}

// Kiểm tra đăng nhập
if (!isset($_SESSION['admin']) || $_SESSION['admin'] !== true) {
    header("Location: login.php");
    exit();
}

$thongbao = '';
$current_tab = $_GET['tab'] ?? 'danhmuc';

// ==================== XỬ LÝ DANH MỤC ====================
if (isset($_GET['xoa_dm'])) {
    $id = (int)$_GET['xoa_dm'];
    if ($conn->query("DELETE FROM DanhMucSP WHERE MaDM = $id")) {
        $thongbao = '<div class="alert alert-success">Xóa danh mục thành công!</div>';
    }
    header("Location: admin.php?tab=danhmuc");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['form_danhmuc'])) {
    $tendm = $conn->real_escape_string($_POST['tendm']);
    $mota = $conn->real_escape_string($_POST['mota']);
    if (isset($_POST['id_dm'])) {
        $id = (int)$_POST['id_dm'];
        $sql = "UPDATE DanhMucSP SET TenDM='$tendm', MoTa='$mota' WHERE MaDM=$id";
        $msg = "Sửa";
    } else {
        $sql = "INSERT INTO DanhMucSP (TenDM, MoTa) VALUES ('$tendm', '$mota')";
        $msg = "Thêm";
    }
    if ($conn->query($sql)) $thongbao = '<div class="alert alert-success">'.$msg.' danh mục thành công!</div>';
    header("Location: admin.php?tab=danhmuc");
    exit();
}

$sua_dm = [];
if (isset($_GET['sua_dm'])) {
    $id = (int)$_GET['sua_dm'];
    $result = $conn->query("SELECT * FROM DanhMucSP WHERE MaDM = $id");
    $sua_dm = $result->fetch_assoc();
    $current_tab = 'danhmuc';
}

// ==================== XỬ LÝ SẢN PHẨM ====================
if (isset($_GET['xoa_sp'])) {
    $id = (int)$_GET['xoa_sp'];
    $conn->query("DELETE FROM SanPham_LoaiDa WHERE MaSP = $id");
    if ($conn->query("DELETE FROM SanPham WHERE MaSP = $id")) {
        $thongbao = '<div class="alert alert-success">Xóa sản phẩm thành công!</div>';
    }
    header("Location: admin.php?tab=sanpham");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['form_sanpham'])) {
    $tensp = $conn->real_escape_string($_POST['tensp']);
    $thuonghieu = $conn->real_escape_string($_POST['thuonghieu']);
    $thanhphan = $conn->real_escape_string($_POST['thanhphan']);
    $hinhanh = trim($conn->real_escape_string($_POST['hinhanh']));
    $gia = (int)$_POST['gia'];
    $congdung = $conn->real_escape_string($_POST['congdung']);
    $huongdansd = $conn->real_escape_string($_POST['huongdansd']);
    $madm = (int)$_POST['madm'];
    $loaida_arr = isset($_POST['loaida']) ? $_POST['loaida'] : [];

    // XỬ LÝ ẢNH PHỤ: CHUYỂN THÀNH JSON CHUẨN
    $cachinhanh_raw = trim($_POST['cachinhanh']);
    $cac_anh_phu = [];
    if (!empty($cachinhanh_raw)) {
        $arr = array_map('trim', explode(',', $cachinhanh_raw));
        $cac_anh_phu = array_filter($arr, function($item) { return !empty($item); });
    }
    $cachinhanh = $conn->real_escape_string(json_encode(array_values($cac_anh_phu)));

    if (isset($_POST['id_sp'])) {
        $id = (int)$_POST['id_sp'];
        $sql = "UPDATE SanPham SET TenSP='$tensp', ThuongHieu='$thuonghieu', ThanhPhan='$thanhphan', HinhAnh='$hinhanh', CacHinhAnh='$cachinhanh', Gia=$gia, CongDung='$congdung', HuongDanSD='$huongdansd', MaDM=$madm WHERE MaSP=$id";
        $msg = "Sửa";
    } else {
        $sql = "INSERT INTO SanPham (TenSP, ThuongHieu, ThanhPhan, HinhAnh, CacHinhAnh, Gia, CongDung, HuongDanSD, MaDM) VALUES ('$tensp', '$thuonghieu', '$thanhphan', '$hinhanh', '$cachinhanh', $gia, '$congdung', '$huongdansd', $madm)";
        $msg = "Thêm";
    }

    if ($conn->query($sql)) {
        if (!isset($_POST['id_sp'])) $id = $conn->insert_id;
        $conn->query("DELETE FROM SanPham_LoaiDa WHERE MaSP = $id");
        foreach ($loaida_arr as $ld) {
            $ld = (int)$ld;
            $conn->query("INSERT INTO SanPham_LoaiDa (MaSP, MaLoaiDa) VALUES ($id, $ld)");
        }
        $thongbao = '<div class="alert alert-success">'.$msg.' sản phẩm thành công!</div>';
    } else {
        $thongbao = '<div class="alert alert-danger">Lỗi: ' . $conn->error . '</div>';
    }
    header("Location: admin.php?tab=sanpham");
    exit();
}

$sua_sp = [];
if (isset($_GET['sua_sp'])) {
    $id = (int)$_GET['sua_sp'];
    $result = $conn->query("SELECT * FROM SanPham WHERE MaSP = $id");
    $sua_sp = $result->fetch_assoc();
    $current_tab = 'sanpham';
}

// XỬ LÝ HIỂN THỊ ẢNH PHỤ KHI SỬA
$anh_phu_hien_thi = '';
if (!empty($sua_sp['CacHinhAnh'])) {
    $decoded = json_decode($sua_sp['CacHinhAnh'], true);
    if (is_array($decoded) && !empty($decoded)) {
        $anh_phu_hien_thi = htmlspecialchars(implode(', ', $decoded));
    } else {
        $arr = array_map('trim', explode(',', $sua_sp['CacHinhAnh']));
        $filtered = array_filter($arr, 'strlen');
        if (!empty($filtered)) {
            $anh_phu_hien_thi = htmlspecialchars(implode(', ', $filtered));
        }
    }
}

// ==================== CHI TIẾT TƯ VẤN ====================
$chitiet_tuvan = null;
if (isset($_GET['xem_tuvan'])) {
    $id = (int)$_GET['xem_tuvan'];
    $sql = "SELECT tv.*, ld.TenLoaiDa 
            FROM TuVan tv 
            LEFT JOIN LoaiDa ld ON tv.MaLoaiDa = ld.MaLoaiDa 
            WHERE tv.MaTuVan = $id";
    $result = $conn->query($sql);
    if ($result && $result->num_rows > 0) {
        $chitiet_tuvan = $result->fetch_assoc();
    }
    $current_tab = 'tuvan';
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản Trị Hệ Thống - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        body { 
            background-color: #f4f6f9; 
            margin: 0; 
        }
        header { 
            background-color: #F0F8FF;
            color: black;
            font-weight: bold; 
        }
        .card-header {
            background-color: #4682B4; 
        }
        .btn-success {
            background-color:  #7ca6c9
        }
        .btn-success:hover { 
            background-color: #007bb5; 
        }
        .btn-warning { 
            background-color: #fd7e14; 
        }
        .btn-warning:hover { 
            background-color: #e96b0b; 
        }
        .btn-danger { 
            background-color: #dc3545; 
        }
        .btn-danger:hover { 
            background-color: #c82333; 
        }
        .table {
            background-color: #4682B4;
        }
        #sidebar {
            width: 250px;
            min-height: 100vh;
            background: #4682B4;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        #main-content {
            margin-left: 250px;
            padding: 30px;
            min-height: 100vh;
        }
        .sidebar-link {
            color: white;
            text-decoration: none;
            padding: 16px 20px;
            display: block;
            border-left: 4px solid transparent;
            transition: all 0.3s;
        }
        .sidebar-link:hover {
            background-color: #255290;
            color: black;
        }
        .sidebar-link.active {
            background-color: #255290;
            font-weight: bold;
            border-left-color: white;
        }
        .sidebar-header {
            background: #255290;
            padding: 30px 20px;
            text-align: center;
            font-size: 1.4rem;
            font-weight: bold;
        }
        .card-header.bg-dark { 
            background-color: #4682B4 !important; 
            color: white;
        }
        .no-wrap { white-space: nowrap; }
        .action-buttons { min-width: 130px; white-space: nowrap; }
    </style>
</head>
<body>
<div class="d-flex">
    <!-- SIDEBAR -->
    <div id="sidebar" class="d-flex flex-column">
        <div class="sidebar-header">
            TRANG QUẢN TRỊ
        </div>
        
        <div class="flex-grow-1 p-3">
            <a href="admin.php?tab=danhmuc" class="sidebar-link <?= $current_tab == 'danhmuc' ? 'active' : '' ?>">
                <i class="bi bi-grid me-3"></i>Danh Mục
            </a>
            <a href="admin.php?tab=sanpham" class="sidebar-link <?= $current_tab == 'sanpham' ? 'active' : '' ?>">
                <i class="bi bi-bag me-3"></i>Sản Phẩm
            </a>
            <a href="admin.php?tab=tuvan" class="sidebar-link <?= $current_tab == 'tuvan' ? 'active' : '' ?>">
                <i class="bi bi-chat-square-text me-3"></i>Lịch Sử Tư Vấn
            </a>
        </div>
        
        <div class="p-3 border-top border-secondary">
            <a href="admin.php?thoat=1" class="btn btn-outline-light w-100">
                <i class="bi bi-box-arrow-right me-2"></i>Đăng Xuất
            </a>
        </div>
</div>

    <!-- NỘI DUNG CHÍNH -->
    <div id="main-content" class="container-fluid">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="mb-0 text-dark fw-bold">
                <?= $current_tab == 'danhmuc' ? 'Quản Lý Danh Mục' : ($current_tab == 'sanpham' ? 'Quản Lý Sản Phẩm' : 'Lịch Sử Tư Vấn') ?>
            </h3>
        </div>

        <?php if ($thongbao): ?>
            <div class="mb-4"><?= $thongbao ?></div>
        <?php endif; ?>

        <?php if ($current_tab == 'danhmuc'): ?>
            <!-- PHẦN DANH MỤC - GIỮ NGUYÊN -->
            <div class="row g-4">
                <div class="col-lg-6">
                    <div class="card shadow-sm h-100">
                        <div class="card-header bg-dark text-white">
                            <h5 class="mb-0"><?= empty($sua_dm) ? 'Thêm Danh Mục' : 'Sửa Danh Mục' ?></h5>
                        </div>
                        <div class="card-body">
                            <form method="POST">
                                <input type="hidden" name="form_danhmuc" value="1">
                                <?php if (!empty($sua_dm)): ?>
                                    <input type="hidden" name="id_dm" value="<?= $sua_dm['MaDM'] ?>">
                                <?php endif; ?>
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Tên Danh Mục</label>
                                    <input type="text" name="tendm" class="form-control" required value="<?= $sua_dm['TenDM'] ?? '' ?>">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Mô Tả</label>
                                    <textarea name="mota" class="form-control" rows="4"><?= $sua_dm['MoTa'] ?? '' ?></textarea>
                                </div>
                                <button type="submit" class="btn btn-success"><?= empty($sua_dm) ? 'Thêm Mới' : 'Cập Nhật' ?></button>
                                <?php if (!empty($sua_dm)): ?>
                                    <a href="admin.php?tab=danhmuc" class="btn btn-secondary ms-2">Hủy</a>
                                <?php endif; ?>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card shadow-sm h-100">
                        <div class="card-header bg-dark text-white">
                            <h5 class="mb-0">Danh Sách Danh Mục</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0">
                                    <thead class="table-light">
                                        <tr><th>ID</th><th>Tên</th><th>Mô Tả</th><th>Hành Động</th></tr>
                                    </thead>
                                    <tbody>
                                        <?php $result = $conn->query("SELECT * FROM DanhMucSP"); while($row = $result->fetch_assoc()): ?>
                                        <tr>
                                            <td><?= $row['MaDM'] ?></td>
                                            <td><?= htmlspecialchars($row['TenDM']) ?></td>
                                            <td><?= $row['MoTa'] ? htmlspecialchars(substr($row['MoTa'], 0, 50)) . '...' : '<em class="text-muted">Không</em>' ?></td>
                                            <td>
                                                <a href="admin.php?sua_dm=<?= $row['MaDM'] ?>&tab=danhmuc" class="btn btn-warning btn-sm">Sửa</a>
                                                <a href="admin.php?xoa_dm=<?= $row['MaDM'] ?>&tab=danhmuc" class="btn btn-danger btn-sm" onclick="return confirm('Xóa?')">Xóa</a>
                                            </td>
                                        </tr>
                                        <?php endwhile; ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <?php elseif ($current_tab == 'sanpham'): ?>
            <!-- PHẦN QUẢN LÝ SẢN PHẨM - ĐÃ KHÔI PHỤC ĐẦY ĐỦ -->
            <div class="row g-4">
                <div class="col-lg-5">
                    <div class="card shadow-sm h-100">
                        <div class="card-header bg-dark text-white">
                            <h5 class="mb-0"><?= empty($sua_sp) ? 'Thêm Sản Phẩm Mới' : 'Sửa Sản Phẩm' ?></h5>
                        </div>
                        <div class="card-body">
                            <form method="POST">
                                <input type="hidden" name="form_sanpham" value="1">
                                <?php if (!empty($sua_sp)): ?>
                                    <input type="hidden" name="id_sp" value="<?= $sua_sp['MaSP'] ?>">
                                <?php endif; ?>
                                <div class="mb-3"><label>Tên Sản Phẩm</label><input type="text" name="tensp" class="form-control" required value="<?= $sua_sp['TenSP'] ?? '' ?>"></div>
                                <div class="mb-3"><label>Thương Hiệu</label><input type="text" name="thuonghieu" class="form-control" required value="<?= $sua_sp['ThuongHieu'] ?? '' ?>"></div>
                                <div class="mb-3"><label>Thành Phần</label><textarea name="thanhphan" class="form-control" rows="3"><?= $sua_sp['ThanhPhan'] ?? '' ?></textarea></div>
                                <div class="mb-3"><label>Ảnh Chính (đường dẫn)</label><input type="text" name="hinhanh" class="form-control" required value="<?= $sua_sp['HinhAnh'] ?? '' ?>"></div>
                                <div class="mb-3">
                                    <label>Các Ảnh Phụ (cách nhau dấu phẩy)</label>
                                    <input type="text" name="cachinhanh" class="form-control" 
                                           placeholder="images/anh1.jpg, images/anh2.jpg" 
                                           value="<?= $anh_phu_hien_thi ?>">
                                    <small class="text-muted">Ví dụ: images/anh1.jpg, images/anh2.jpg</small>
                                </div>
                                <div class="mb-3"><label>Giá (VNĐ)</label><input type="number" name="gia" class="form-control" required min="0" value="<?= $sua_sp['Gia'] ?? '' ?>"></div>
                                <div class="mb-3"><label>Công Dụng</label><textarea name="congdung" class="form-control" rows="3"><?= $sua_sp['CongDung'] ?? '' ?></textarea></div>
                                <div class="mb-3"><label>Hướng Dẫn Sử Dụng</label><textarea name="huongdansd" class="form-control" rows="3"><?= $sua_sp['HuongDanSD'] ?? '' ?></textarea></div>
                                <div class="mb-3">
                                    <label>Danh Mục</label>
                                    <select name="madm" class="form-select" required>
                                        <?php $dm = $conn->query("SELECT * FROM DanhMucSP"); while($row = $dm->fetch_assoc()): ?>
                                            <option value="<?= $row['MaDM'] ?>" <?= (isset($sua_sp) && $sua_sp['MaDM'] == $row['MaDM']) ? 'selected' : '' ?>><?= $row['TenDM'] ?></option>
                                        <?php endwhile; ?>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="fw-bold">Loại Da Phù Hợp (chọn nhiều)</label>
                                    <div class="border p-3 rounded" style="max-height: 200px; overflow-y: auto;">
                                        <?php 
                                        $result_ld = $conn->query("SELECT * FROM LoaiDa");
                                        while($ld = $result_ld->fetch_assoc()):
                                            $checked = false;
                                            if (!empty($sua_sp)) {
                                                $check = $conn->query("SELECT * FROM SanPham_LoaiDa WHERE MaSP = {$sua_sp['MaSP']} AND MaLoaiDa = {$ld['MaLoaiDa']}");
                                                $checked = $check->num_rows > 0;
                                            }
                                        ?>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="loaida[]" value="<?= $ld['MaLoaiDa'] ?>" id="ld<?= $ld['MaLoaiDa'] ?>" <?= $checked ? 'checked' : '' ?>>
                                            <label class="form-check-label" for="ld<?= $ld['MaLoaiDa'] ?>"><?= $ld['TenLoaiDa'] ?> (<?= $ld['MoTa'] ?>)</label>
                                        </div>
                                        <?php endwhile; ?>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-success"><?= empty($sua_sp) ? 'Thêm Mới' : 'Cập Nhật' ?></button>
                                <?php if (!empty($sua_sp)): ?><a href="admin.php?tab=sanpham" class="btn btn-secondary ms-2">Hủy</a><?php endif; ?>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-lg-7">
                    <div class="card shadow-sm h-100">
                        <div class="card-header bg-dark text-white">
                            <h5 class="mb-0">Danh Sách Sản Phẩm</h5>
                        </div>
                        <div class="card-body p-0 d-flex flex-column">
                            <div class="table-responsive flex-grow-1">
                                <table class="table table-hover mb-0">
                                    <thead class="table-light">
                                        <tr>
                                            <th class="no-wrap">ID</th>
                                            <th>Tên SP</th>
                                            <th class="no-wrap">Thương Hiệu</th>
                                            <th class="no-wrap">Giá</th>
                                            <th>Danh Mục</th>
                                            <th class="no-wrap text-center">Hành Động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                        $items_per_page = 20;
                                        $page = isset($_GET['page']) ? max(1, (int)$_GET['page']) : 1;
                                        $offset = ($page - 1) * $items_per_page;

                                        $total_result = $conn->query("SELECT COUNT(*) as total FROM SanPham");
                                        $total_row = $total_result->fetch_assoc();
                                        $total_items = $total_row['total'];
                                        $total_pages = ceil($total_items / $items_per_page);

                                        $sql = "SELECT sp.*, dm.TenDM FROM SanPham sp LEFT JOIN DanhMucSP dm ON sp.MaDM = dm.MaDM ORDER BY sp.MaSP DESC LIMIT $items_per_page OFFSET $offset";
                                        $result = $conn->query($sql);
                                        while($row = $result->fetch_assoc()): 
                                        ?>
                                        <tr>
                                            <td class="no-wrap"><?= $row['MaSP'] ?></td>
                                            <td><?= htmlspecialchars($row['TenSP']) ?></td>
                                            <td class="no-wrap"><?= htmlspecialchars($row['ThuongHieu']) ?></td>
                                            <td class="no-wrap"><?= number_format($row['Gia'], 0, '', '.') ?>đ</td>
                                            <td><?= $row['TenDM'] ?? 'Chưa có' ?></td>
                                            <td class="action-buttons text-center">
                                                <a href="admin.php?sua_sp=<?= $row['MaSP'] ?>&tab=sanpham" class="btn btn-warning btn-sm">Sửa</a>
                                                <a href="admin.php?xoa_sp=<?= $row['MaSP'] ?>&tab=sanpham" class="btn btn-danger btn-sm" onclick="return confirm('Xóa sản phẩm này?')">Xóa</a>
                                            </td>
                                        </tr>
                                        <?php endwhile; ?>
                                    </tbody>
                                </table>
                            </div>

                            <?php if ($total_pages > 1): ?>
                            <div class="p-3 border-top">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center mb-0">
                                        <?php if ($page > 1): ?>
                                            <li class="page-item"><a class="page-link" href="admin.php?tab=sanpham&page=<?= $page-1 ?>">«</a></li>
                                        <?php endif; ?>
                                        <?php 
                                        $start = max(1, $page - 2);
                                        $end = min($total_pages, $page + 2);
                                        if ($start > 1) echo '<li class="page-item disabled"><span class="page-link">...</span></li>';
                                        for ($i = $start; $i <= $end; $i++): 
                                        ?>
                                            <li class="page-item <?= $i == $page ? 'active' : '' ?>">
                                                <a class="page-link" href="admin.php?tab=sanpham&page=<?= $i ?>"><?= $i ?></a>
                                            </li>
                                        <?php endfor; 
                                        if ($end < $total_pages) echo '<li class="page-item disabled"><span class="page-link">...</span></li>';
                                        ?>
                                        <?php if ($page < $total_pages): ?>
                                            <li class="page-item"><a class="page-link" href="admin.php?tab=sanpham&page=<?= $page+1 ?>">»</a></li>
                                        <?php endif; ?>
                                    </ul>
                                </nav>
                            </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>

        <?php elseif ($current_tab == 'tuvan'): ?>
            <!-- PHẦN LỊCH SỬ TƯ VẤN MỚI -->
            <div class="card shadow-sm">
                <div class="card-header bg-dark text-white">
                    <h5 class="mb-0">Danh Sách Yêu Cầu Tư Vấn</h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Họ Tên</th>
                                    <th>Email</th>
                                    <th>Vấn Đề Da</th>
                                    <th>Mức Độ</th>
                                    <th>Loại Da</th>
                                    <th>Thời Gian</th>
                                    <th class="text-center">Hành Động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                $result = $conn->query("SELECT tv.*, ld.TenLoaiDa 
                                                        FROM TuVan tv 
                                                        LEFT JOIN LoaiDa ld ON tv.MaLoaiDa = ld.MaLoaiDa 
                                                        ORDER BY tv.ThoiGian DESC");
                                while($row = $result->fetch_assoc()): 
                                ?>
                                <tr>
                                    <td><?= $row['MaTuVan'] ?></td>
                                    <td><?= htmlspecialchars($row['Ten']) ?></td>
                                    <td><?= htmlspecialchars($row['Email']) ?></td>
                                    <td><?= $row['VanDeDa'] ? htmlspecialchars(substr($row['VanDeDa'], 0, 50)) . (strlen($row['VanDeDa']) > 50 ? '...' : '') : '<em>Không</em>' ?></td>
                                    <td><?= htmlspecialchars($row['MucDo'] ?? 'Không') ?></td>
                                    <td><?= htmlspecialchars($row['TenLoaiDa'] ?? 'Không xác định') ?></td>
                                    <td class="no-wrap"><?= date('d/m/Y H:i', strtotime($row['ThoiGian'])) ?></td>
                                    <td class="text-center">
                                        <a href="admin.php?xem_tuvan=<?= $row['MaTuVan'] ?>&tab=tuvan" class="btn btn-primary btn-sm">Xem chi tiết</a>
                                    </td>
                                </tr>
                                <?php endwhile; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        <?php endif; ?>
    </div>
</div>

<!-- Modal chi tiết tư vấn -->
<?php if ($chitiet_tuvan): ?>
<div class="modal fade show" id="modalChiTiet" tabindex="-1" style="display: block; background: rgba(0,0,0,0.5);">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-dark text-white">
                <h5 class="modal-title">Chi Tiết Yêu Cầu Tư Vấn #<?= $chitiet_tuvan['MaTuVan'] ?></h5>
                <a href="admin.php?tab=tuvan" class="btn-close btn-close-white"></a>
            </div>
            <div class="modal-body">
                <p><strong>Họ tên:</strong> <?= htmlspecialchars($chitiet_tuvan['Ten']) ?></p>
                <p><strong>Email:</strong> <?= htmlspecialchars($chitiet_tuvan['Email']) ?></p>
                <p><strong>Loại da:</strong> <?= htmlspecialchars($chitiet_tuvan['TenLoaiDa'] ?? 'Không xác định') ?></p>
                <p><strong>Vấn đề da:</strong> <?= $chitiet_tuvan['VanDeDa'] ? htmlspecialchars($chitiet_tuvan['VanDeDa']) : '<em>Không có</em>' ?></p>
                <p><strong>Mức độ:</strong> <?= htmlspecialchars($chitiet_tuvan['MucDo'] ?? 'Không chọn') ?></p>
                <p><strong>Nội dung khác:</strong> <?= $chitiet_tuvan['NoiDungKhac'] ? nl2br(htmlspecialchars($chitiet_tuvan['NoiDungKhac'])) : '<em>Không có</em>' ?></p>
                <p><strong>Thời gian gửi:</strong> <?= date('d/m/Y H:i:s', strtotime($chitiet_tuvan['ThoiGian'])) ?></p>
            </div>
            <div class="modal-footer">
                <a href="admin.php?tab=tuvan" class="btn btn-secondary">Đóng</a>
            </div>
        </div>
    </div>
</div>
<?php endif; ?>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<?php $conn->close(); ?>