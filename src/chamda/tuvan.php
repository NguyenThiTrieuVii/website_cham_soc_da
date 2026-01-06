<?php 
include 'ketnoi.php'; 
$thongbao = '';
$show_form = true;

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $ten = trim($_POST['ten']);
    $email = trim($_POST['email']);
    $loaida = (int)$_POST['loaida'];
    $mucdo = trim($_POST['mucdo']);
    $noidungkhac = trim($_POST['noidungkhac'] ?? '');

    // Kiểm tra ít nhất 1 vấn đề da được chọn
    $vande_selected = !empty($_POST['vande']);
    
    // Validation chỉ dựa vào required HTML + checkbox
    $errors = [];
    if (empty($ten)) $errors[] = "Họ và tên không được để trống";
    if (empty($email)) $errors[] = "Email không được để trống";
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) $errors[] = "Email không hợp lệ";
    if (empty($loaida)) $errors[] = "Vui lòng chọn loại da";
    if (!$vande_selected) $errors[] = "Vui lòng chọn ít nhất một vấn đề về da";
    if (empty($mucdo)) $errors[] = "Vui lòng chọn mức độ của vấn đề da";

    if (empty($errors)) {
        $vande = [];
        if (!empty($_POST['vande'])) {
            foreach ($_POST['vande'] as $vd) {
                $vande[] = $conn->real_escape_string($vd);
            }
        }
        $vande_str = implode(', ', $vande);

        // INSERT với 2 cột mới: MucDo và NoiDungKhac (giả sử bạn đã thêm vào bảng TuVan)
        $sql_insert = "INSERT INTO TuVan (Ten, Email, VanDeDa, ThoiGian, MaLoaiDa, MucDo, NoiDungKhac) 
                       VALUES (
                           '{$conn->real_escape_string($ten)}', 
                           '{$conn->real_escape_string($email)}', 
                           '{$conn->real_escape_string($vande_str)}', 
                           CURRENT_TIMESTAMP(), 
                           $loaida, 
                           '{$conn->real_escape_string($mucdo)}', 
                           '{$conn->real_escape_string($noidungkhac)}'
                       )";

        if ($conn->query($sql_insert) === TRUE) {
            $thongbao = '<div class="alert alert-success text-center" style="font-size: 1.3rem; padding: 40px; border-radius: 20px; background: linear-gradient(135deg, #e3f2fd, #bbdefb); border: none;">
                            <h4>BẠN ĐÃ GỬI YÊU CẦU TƯ VẤN THÀNH CÔNG!</h4>
                            <p class="mb-4 mt-3" style="font-size: 1.2rem;">Xin vui lòng chờ phản hồi từ chúng tôi qua email trong thời gian sớm nhất.</p>
                            <a href="tuvan.php" class="btn btn-submit btn-lg text-white px-5 py-3" style="font-size: 1.1rem;">Gửi thêm yêu cầu tư vấn khác</a>
                         </div>';
            $show_form = false;
        } else {
            $thongbao = '<div class="alert alert-danger text-center" style="font-size: 1.3rem; padding: 25px;"><h4>❌ LỖI: ' . $conn->error . '</h4><p class="mb-0 mt-3">Vui lòng thử lại hoặc liên hệ admin.</p></div>';
        }
    } else {
        $thongbao = '<div class="alert alert-warning text-center" style="font-size: 1.2rem; padding: 20px;"><h5>Có lỗi:</h5><ul class="mb-0 mt-2 text-start d-inline-block">';
        foreach($errors as $error) {
            $thongbao .= '<li>' . $error . '</li>';
        }
        $thongbao .= '</ul></div>';
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tư Vấn Chăm Sóc Da</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        .form-card { 
            background: #ffffff; 
            border-radius: 22px; 
            box-shadow: 0 15px 40px rgba(70, 130, 180, 0.12); 
            padding: 50px 45px; 
            border: 1px solid #e1edf7;
        }
        .section-title { 
            color: #3b6fa5; 
            font-weight: 700; 
            font-size: 1.4rem;
            margin-bottom: 1.5rem;
            position: relative;
            padding-left: 18px;
            font-family: 'Poppins', sans-serif;
        }
        .section-title::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 6px;
            height: 70%;
            background: linear-gradient(to bottom, #7ca6c9, #4682B4);
            border-radius: 4px;
        }
        .form-check {
            background: #f7fbff;
            padding: 12px 15px;
            border-radius: 12px;
            border: 1px solid #e3eef8;
            transition: all 0.25s ease;
        }
        .form-check:hover {
            background: #eef6fd;
            border-color: #bcd4e6;
        }
        .form-check-input {
            width: 1.15em;
            height: 1.15em;
        }
        .form-check-input:checked {
            background-color: #4682B4;
            border-color: #4682B4;
        }
        .form-check-label {
            color: #2f3e4e;
            font-weight: 500;
            margin-left: 6px;
        }
        .form-control-lg, .form-select-lg, textarea.form-control {
            border-radius: 14px;
            border-color: #bcd4e6;
            padding: 0.9rem 1rem;
            font-size: 1.05rem;
        }
        .form-control-lg:focus, .form-select-lg:focus, textarea.form-control:focus {
            border-color: #4682B4;
            box-shadow: 0 0 0 0.25rem rgba(70, 130, 180, 0.25);
        }
        .btn-submit { 
            background: linear-gradient(135deg, #7ca6c9, #4682B4); 
            border: none; 
            padding: 14px 55px; 
            font-size: 1.2rem; 
            font-weight: 600;
            border-radius: 50px;
            box-shadow: 0 6px 20px rgba(70, 130, 180, 0.35);
            transition: all 0.3s ease;
        }
        .btn-submit:hover { 
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(70, 130, 180, 0.45);
        }
        h2.display-5 {
            color: #3b6fa5;
            letter-spacing: -0.5px;
            font-family: 'Playfair Display', serif;
            font-weight: 700;
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
                    <li class="nav-item"><a class="nav-link fw-semibold" href="index.php">Trang Chủ</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle fw-semibold" href="#" data-bs-toggle="dropdown">Danh Mục Sản Phẩm</a>
                        <ul class="dropdown-menu">
                            <?php
                            $dm_menu = $conn->query("SELECT * FROM DanhMucSP");
                            while($row_menu = $dm_menu->fetch_assoc()){
                                echo '<li><a class="dropdown-item" style="color: #000 !important; font-weight: bold !important;" href="index.php?madm='.$row_menu['MaDM'].'">'.$row_menu['TenDM'].'</a></li>';
                            }
                            ?>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link fw-semibold" href="tatcasanpham.php">Sản Phẩm</a></li>
                    <li class="nav-item"><a class="nav-link fw-semibold active" href="tuvan.php">Tư vấn</a></li>
                </ul>
                <form class="d-flex ms-auto" method="GET" action="index.php">
                    <input class="form-control me-2" type="search" name="timkiem" placeholder="Tìm kiếm" 
                        value="<?= isset($_GET['timkiem']) ? htmlspecialchars($_GET['timkiem']) : '' ?>">
                    <button class="btn btn-outline-light" type="submit">Tìm</button>
                </form>
            </div>
        </div>
    </nav>

    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-9">

                <h2 class="text-center mb-5 fw-bold display-5">Tư Vấn Chăm Sóc Da</h2>

                <?php if ($thongbao): ?>
                    <div style="position: relative; z-index: 1000; margin-bottom: 30px;">
                        <?php echo $thongbao; ?>
                    </div>
                <?php endif; ?>

                <?php if ($show_form): ?>
                <div class="form-card">
                    <form method="POST" novalidate>
                        <div class="mb-5">
                            <label class="section-title">Thông tin liên hệ</label>
                            <div class="mt-3">
                                <div class="mb-3">
                                    <input type="text" name="ten" class="form-control form-control-lg" placeholder="Họ và tên" required value="<?= isset($_POST['ten']) ? htmlspecialchars($_POST['ten']) : '' ?>">
                                </div>
                                <div class="mb-3">
                                    <input type="email" name="email" class="form-control form-control-lg" placeholder="Email" required value="<?= isset($_POST['email']) ? htmlspecialchars($_POST['email']) : '' ?>">
                                </div>
                            </div>
                        </div>

                        <div class="mb-5">
                            <label class="section-title">1. Loại da của bạn</label>
                            <div class="row mt-3">
                                <?php
                                $sql_ld = "SELECT * FROM LoaiDa ORDER BY MaLoaiDa";
                                $result_ld = $conn->query($sql_ld);
                                while($ld = $result_ld->fetch_assoc()):
                                ?>
                                <div class="col-md-6 mb-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="loaida" id="ld<?= $ld['MaLoaiDa'] ?>" value="<?= $ld['MaLoaiDa'] ?>" <?= isset($_POST['loaida']) && $_POST['loaida']==$ld['MaLoaiDa'] ? 'checked' : '' ?> required>
                                        <label class="form-check-label fw-medium" for="ld<?= $ld['MaLoaiDa'] ?>">
                                            <?= htmlspecialchars($ld['TenLoaiDa']) ?> <small class="text-muted">(<?= htmlspecialchars($ld['MoTa']) ?>)</small>
                                        </label>
                                    </div>
                                </div>
                                <?php endwhile; ?>
                            </div>
                        </div>

                        <div class="mb-5">
                            <label class="section-title">2. Bạn đang gặp vấn đề gì về da?</label>
                            <div class="row mt-3">
                                <?php
                                $vande_list = [
                                    'Mụn đầu đen', 'Mụn nội tiết', 'Da xỉn màu', 'Lỗ chân lông to', 
                                    'Thâm mụn', 'Nám da, tàn nhang', 'Da kích ứng', 'Da sần sùi', 'Da kém đàn hồi'
                                ];
                                foreach ($vande_list as $index => $vd):
                                    $checked = isset($_POST['vande']) && in_array($vd, $_POST['vande']) ? 'checked' : '';
                                ?>
                                <div class="col-md-6 col-lg-4 mb-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="vande[]" id="vd<?= $index ?>" value="<?= htmlspecialchars($vd) ?>" <?= $checked ?>>
                                        <label class="form-check-label" for="vd<?= $index ?>"><?= $vd ?></label>
                                    </div>
                                </div>
                                <?php endforeach; ?>
                            </div>
                        </div>

                        <div class="mb-5">
                            <label class="section-title">3. Mức độ của vấn đề da</label>
                            <select name="mucdo" class="form-select form-select-lg mt-3" required>
                                <option value="">-- Chọn mức độ --</option>
                                <option value="Nhẹ" <?= isset($_POST['mucdo']) && $_POST['mucdo']=='Nhẹ' ? 'selected' : '' ?>>Nhẹ (mới xuất hiện, ít)</option>
                                <option value="Trung bình" <?= isset($_POST['mucdo']) && $_POST['mucdo']=='Trung bình' ? 'selected' : '' ?>>Trung bình (thường xuyên, rõ rệt)</option>
                                <option value="Nặng" <?= isset($_POST['mucdo']) && $_POST['mucdo']=='Nặng' ? 'selected' : '' ?>>Nặng (nhiều, ảnh hưởng lớn đến da)</option>
                            </select>
                        </div>

                        <div class="mb-5">
                            <label class="section-title">4. Nội dung khác (nếu có)</label>
                            <textarea name="noidungkhac" class="form-control form-control-lg mt-3" rows="4" placeholder="Bạn có thể chia sẻ thêm về tình trạng da hoặc bất kỳ thông tin nào giúp chúng tôi tư vấn chính xác hơn..."><?= isset($_POST['noidungkhac']) ? htmlspecialchars($_POST['noidungkhac']) : '' ?></textarea>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-submit btn-lg text-white">Gửi Tư Vấn</button>
                        </div>
                    </form>
                </div>
                <?php endif; ?>

            </div>
        </div>
    </div>

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
<script>
<?php if ($thongbao): ?>
window.scrollTo(0, 0);
document.querySelector('.alert')?.scrollIntoView({ behavior: 'smooth', block: 'center' });
<?php endif; ?>
</script>
</body>
</html>

<?php $conn->close(); ?>