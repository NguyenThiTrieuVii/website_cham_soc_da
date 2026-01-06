<?php
session_start();
include 'ketnoi.php';

// Xử lý đăng xuất
if (isset($_GET['thoat'])) {
    session_destroy();
    header("Location: admin.php");
    exit();
}

// Xử lý đăng nhập
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $ten = $conn->real_escape_string($_POST['tendangnhap']);
    $mk = md5($_POST['matkhau']);  

    $sql = "SELECT * FROM QuanTri WHERE TenDangNhap = '$ten' AND MatKhau = '$mk'";
    $result = $conn->query($sql);

    if ($result && $result->num_rows > 0) {
        // Đăng nhập thành công
        $_SESSION['admin'] = true;
        $_SESSION['tenqt'] = $ten;  

        header("Location: admin.php");
        exit();
    } else {
        // Sai tài khoản hoặc mật khẩu
        header("Location: admin.php?loi=1");
        exit();
    }
}

$conn->close();
?>