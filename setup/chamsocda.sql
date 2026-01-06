-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2026 at 04:13 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chamsocda`
--

-- --------------------------------------------------------

--
-- Table structure for table `danhmucsp`
--

CREATE TABLE `danhmucsp` (
  `MaDM` int(11) NOT NULL,
  `TenDM` varchar(100) DEFAULT NULL,
  `MoTa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `danhmucsp`
--

INSERT INTO `danhmucsp` (`MaDM`, `TenDM`, `MoTa`) VALUES
(1, 'Sữa rửa mặt', 'Làm sạch da '),
(2, 'Toner', 'Cân bằng da'),
(3, 'Serum', 'Đặc trị da'),
(4, 'Kem dưỡng', 'Dưỡng ẩm da'),
(5, 'Kem chống nắng', 'Bảo vệ da khỏi tia UV'),
(8, 'Nước tẩy trang', 'Làm sạch makeup, bụi bẩn trên da');

-- --------------------------------------------------------

--
-- Table structure for table `loaida`
--

CREATE TABLE `loaida` (
  `MaLoaiDa` int(11) NOT NULL,
  `TenLoaiDa` varchar(50) DEFAULT NULL,
  `MoTa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loaida`
--

INSERT INTO `loaida` (`MaLoaiDa`, `TenLoaiDa`, `MoTa`) VALUES
(1, 'Da dầu', 'Da tiết nhiều dầu'),
(2, 'Da khô', 'Da thiếu ẩm'),
(3, 'Da hỗn hợp', 'Vùng dầu và vùng khô'),
(4, 'Da nhạy cảm', 'Dễ kích ứng'),
(5, 'Da mụn', 'Da có mụn viêm'),
(10, 'Da thường', 'Da không quá khô cũng không quá dầu');

-- --------------------------------------------------------

--
-- Table structure for table `quantri`
--

CREATE TABLE `quantri` (
  `MaQT` int(11) NOT NULL,
  `TenDangNhap` varchar(50) DEFAULT NULL,
  `MatKhau` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quantri`
--

INSERT INTO `quantri` (`MaQT`, `TenDangNhap`, `MatKhau`) VALUES
(1, 'trieuvi', '21232f297a57a5a743894a0e4a801fc3'),
(2, 'quantri', 'fa246d0262c3925617b0c72bb20eeb1d');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int(11) NOT NULL,
  `TenSP` varchar(200) DEFAULT NULL,
  `ThuongHieu` varchar(200) DEFAULT NULL,
  `ThanhPhan` text DEFAULT NULL,
  `HinhAnh` varchar(255) DEFAULT NULL,
  `CacHinhAnh` text DEFAULT NULL,
  `Gia` decimal(10,0) DEFAULT NULL,
  `CongDung` text DEFAULT NULL,
  `HuongDanSD` text DEFAULT NULL,
  `MaDM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `TenSP`, `ThuongHieu`, `ThanhPhan`, `HinhAnh`, `CacHinhAnh`, `Gia`, `CongDung`, `HuongDanSD`, `MaDM`) VALUES
(11, 'Sữa Rửa Mặt CeraVe Làm Sạch & Tẩy Tế Bào Chết Dịu Nhẹ 236ml', 'CeraVe', 'Chứa Salicylic Acid (BHA): giúp nhẹ nhàng làm sạch, tẩy tế bào chết cho da, giảm mụn ẩn, mụn đầu đen, bã nhờn.\r\nVới thành phần chứa 3 loại Ceramides (1, 3, 6-II) và áp dụng công nghệ MVE độc quyền: có công dụng giữ độ ẩm cho da, không gây ảnh hưởng đến hàng rào bảo vệ da.\r\nHyaluronic Acid: là chất dưỡng ẩm hiệu quả có công dụng giữ ẩm cho da giúp tăng độ đàn hồi, da cải thiện nếp nhăn, ngăn ngừa tình trạng lão hóa da.\r\nNiacinamide (Vitamin B3): giúp làm dịu, giảm mụn, cải thiện lỗ chân lông to và giúp da đều màu hơn. ', 'images/srmcerave1.jpg', '[\"images\\/srmcerave.jpg\",\"images\\/srmcerave2.jpg\"]', 335000, 'Giúp làm sạch và giữ ẩm cho làn da mà không ảnh hưởng đến hàng rào bảo vệ da mặt và cơ thể.', 'Làm ướt da.\r\nMát xa sữa rửa mặt theo chuyển động tròn.\r\nNhẹ nhàng rửa sạch lại với nước.', 1),
(12, 'Sữa rửa mặt dịu lành cho da nhạy cảm Cetaphil Gentle Skin Cleanser 500ml ', 'Cetaphil', 'Glycerin: giúp ngăn ngừa hiện tượng khô da.\r\nNiacinamide (B3): giúp củng cố hàng rào bảo vệ da.\r\nPanthenol (B5): giúp làm dịu và phục hồi làn da.', 'images/srmcetaphil.jpg', '[\"images\\/srmcetaphil1.jpg\",\"images\\/srmcetaphil2.jpg\"]', 315000, 'Được chứng minh lâm sàng có khả năng làm sạch sâu, loại bỏ hoàn toàn bụi bẩn, và tạp chất trên da một cách dịu nhẹ nhưng vẫn duy trì độ ẩm tự nhiên để bảo vệ da khỏi tình trạng khô ráp, sản phẩm sữa rửa mặt cho da nhạy cảm này với công thức lành tính không gây kích ứng sẽ an toàn cho mọi loại da, kể ca da nhạy cảm.', 'Hướng dẫn rửa mặt khô: Lấy một lượng vừa đủ sữa rửa mặt thoa lên da và xoa nhẹ nhàng. Làm sạch phần sữa rửa mặt thừa bằng khăn mềm, để lại trên da cảm giác sạch nhẹ nhàng mà vẫn mịn màng.\r\nHướng dẫn rửa mặt với nước: Thoa đều sữa rửa mặt lên da và massage nhẹ nhàng. Sau đó rửa sạch lại với nước.', 1),
(13, 'Serum Torriden Dưỡng Ẩm Sâu, Sáng Bóng Da 50ml', 'Torriden', 'Công thức Low Molecular Hyaluronic Acid chứa 5 lớp Hyaluronic Acid giúp làm dịu da, cấp ẩm tức thì và tạo màng khoá ẩm bảo vệ da. Đồng thời tái tạo da mạnh mẽ, da dần sáng khoẻ từ bên trong, lúc nào cũng căng mọng ngậm nước.\r\nThành phần được bổ sung Vitamin B5 (D-Panthenol): tăng cường sức khỏe bề mặt da cho các axit hoạt động được tốt hơn mà không gây kích ứng.\r\nPortulaca Oleracea Extract: Chiết xuất từ rau sam làm dịu, hồi phục da và kháng viêm cho da tốt.\r\nBeta – Glucan: Dưỡng ẩm tuyệt vời cho da, thúc đẩy làm lành vết thương, chống oxy hóa và kháng viêm siêu tốt.\r\nTinh chất nọc ong, hắc mai biển, tinh chất rau má và nhiều chiết xuất từ tự nhiên khác giúp hỗ trợ làm khỏe, sáng da.\r\nMadecassoside: Với công dụng làm dịu da kích ứng, mẩn đỏ, phục hồi da sau mụn và dưỡng ẩm cho da.\r\nCeramide NP: Củng cố hàng rào bảo vệ da, xúc tiến quá trình chữa lành vết thương, giúp tăng đề kháng cho da.', 'images/srtorriden2.jpg', '[\"images\\/srtorriden.jpg\",\"images\\/srtorriden1.jpg\"]', 300000, ' Giảm tình trạng căng khô da\r\n Bổ sung độ ẩm cho da bóng ẩm \r\n Dưỡng ẩm và làm dịu da', 'Nhỏ vài giọt serum lên tay hoặc trực tiếp lên da mặt, thoa đều serum lên bề mặt da.\r\nVỗ nhẹ để serum thấm đều vào da.\r\nLặp lại quy trình trên thêm vài lần nữa để bổ sung lớp dưỡng ẩm cho da.\r\nSử dụng như serum dưỡng da hàng ngày cho cả ban ngày và ban đêm.', 3),
(14, 'Kem Dưỡng Ẩm Neutrogena Cấp Nước Cho Da Dầu 50g', ' Neutrogena', '1% phức hợp yếu tố giữ ẩm tự nhiên (NMF): giúp làn da trở nên căng mọng, mềm mại và sáng khỏe tự nhiên\r\nHyaluronic Acid: giúp cấp ẩm và khóa ẩm làm cho dàn da căn mọng dài lâu.\r\nAmino acid: hỗ trợ hàng rào da khỏe mạnh, ngăn thoát nước qua da.\r\nChất điện giải: giúp làn da hấp thu dưỡng chất tối ưu.', 'images/kdneu.jpg', '[\"images\\/kdneu1.jpg\",\"images\\/kdneu2.jpg\"]', 255000, 'Mang lại hiệu quả dưỡng ẩm sâu suốt 72 giờ, cho làn da căng bóng, sáng mịn và đàn hồi. Chất gel tươi mát và mỏng nhẹ, thẩm thấu nhanh, đặc biệt lý tưởng cho làn da dầu đang gặp tình trạng thiếu nước.', 'Sử dụng sau bước tinh chất dưỡng da.\r\nLấy một lượng kem nhỏ thoa trực tiếp lên da mặt, mát xa nhẹ nhàng để sản phẩm thẩm thấu vào da.', 4),
(15, 'Tinh Chất Chống Nắng Senka Nâng Tông Sáng Mượt Da Dầu 50g', 'Senka', 'Tơ Tằm Trắng: Chứa sericine cùng 12 loại Acid Amin đặc biệt với cấu trúc phân tử tương tự cấu trúc collagen của da, giúp khôi phục và kích thích tái tạo các sợi khung Collagen, cho da ẩm mịn, đàn hồi.\r\nGấp đôi Hyaluronic Acid: dưỡng ẩm chuyên sâu cho da, ngăn chặn tình trạng da khô ráp, mất nước do nắng gắt và tia cực tím.\r\nChiết xuất Trà xanh Uji Nhật Bản: Chống lại quá trình oxy hóa do các tác nhân môi trường, hỗ trợ làm chậm quá trình lão hóa, ngăn ngừa sự hình thành đốm nâu và nếp nhăn.\r\nMật Ong: Giàu vitamin và khoáng chất, phục hồi các tế bào bị tổn thương do tia UV gây ra, giúp da mềm mại & giàu sức sống.\r\nCám Gạo: Chứa nhiều lipid tốt, vitamin, chất chống oxy hóa; giúp nuôi dưỡng các tế bào da hiệu quả, mang lại làn da hồng hào và sáng khỏe hơn', 'images/kcnsenka2.jpg', '[\"images\\/kcnsenka.jpg\",\"images\\/kcnsenka1.jpg\"]', 115000, 'Bảo vệ toàn diện với công nghệ TOTAL SKIN DEFENSE ngăn chặn tuyệt đối: \r\nTia cực tím (UVA & UVB)​\r\nBụi mịn PM 2.5\r\nLão hóa\r\nTình trạng da khô​\r\nBí tắt lỗ chân lông​', 'Lắc đều trước khi dùng.\r\nSử dụng sau bước dưỡng da, lấy lượng sản phẩm vừa đủ thoa đều khắp mặt, cổ và toàn thân.\r\nĐể đạt hiệu quả cao nhất, nên thoa lại sau khi da bài tiết nhiều mồ hôi hoặc lau bằng khăn.\r\nTẩy trang và rửa mặt thật sạch vào cuối ngày.', 5),
(16, 'Nước Tẩy Trang L\'Oreal Tươi Mát Cho Da Dầu, Hỗn Hợp 400ml', 'L\'Oreal', 'Nước khoáng lấy từ những ngọn núi ở Pháp: làm dịu và giúp làn da trông tươi tắn lên sau khi tẩy trang.', 'images/nttloreal.jpg', '[\"images\\/nttloreal1.jpg\",\"images\\/nttloreal2.jpg\"]', 135000, 'Giúp làm sạch da, lấy đi bụi bẩn, dầu thừa và cặn trang điểm chỉ trong một bước, mang lại làn da thông thoáng, mềm mượt mà không hề khô căng. ', 'Lắc đều sản phẩm Nước Tẩy Trang L\'Oreal trước khi sử dụng.\r\nĐổ nước tẩy trang thấm ướt vừa đủ lên miếng bông tẩy trang.\r\nNhẹ nhàng lau lên mặt, mắt và môi theo chuyển động tròn (Riêng đối với vùng mắt, bạn hãy giữ miếng bông tẩy trang trên mắt vài giây để nước tẩy trang thấm sâu và cuốn đi lớp make-up dễ dàng hơn).\r\nSử dụng để tẩy trang nhanh (không cần rửa lại với nước) khi bận rộn hoặc ở những nơi thiếu nước: khi đi du lịch, đi spa, đi gym, v.v...\r\nKhuyến khích sử dụng quy trình chăm sóc da hoàn chỉnh để có hiệu quả dưỡng da tốt nhất (Nước tẩy trang - Sữa rửa mặt - Nước hoa hồng - Kem dưỡng).', 8),
(17, 'Serum Tia\'m HA Cấp Nước, Hỗ Trợ Căng Bóng Da 40ml', 'Tia\'m', '7 loại Hyaluronic Acid: cấp ẩm đa tầng, giúp da ngậm nước, căng bóng và đàn hồi.\r\nNiacinamide: làm sáng da, giảm thâm, điều tiết bã nhờn và cải thiện sắc tố.\r\nAllantoin: làm dịu, giảm kích ứng và thúc đẩy tái tạo da.\r\nChiết xuất vỏ cây liễu trắng: làm sạch tế bào chết nhẹ nhàng, hỗ trợ giảm mụn.\r\nBetaine: dưỡng ẩm, làm mềm và bảo vệ da khỏi tác nhân kích ứng.\r\nPanthenol (Vitamin B5): cấp ẩm, làm dịu và phục hồi da tổn thương.', 'images/srtiam3.jpg', '[\"images\\/srtiam.jpg\",\"images\\/srtiam2.jpg\"]', 320000, 'Cung cấp độ ẩm đa tầng, cải thiện độ đàn hồi và giảm tình trạng khô ráp.  Hỗ trợ làm sáng da, củng cố hàng rào bảo vệ tự nhiên. ', 'Sử dụng sau bước toner.\r\nLấy một lượng serum vừa đủ thoa đều để da hấp thụ hoàn toàn.', 3),
(18, 'Serum Skin1004 Cấp Ẩm, Làm Dịu & Dưỡng Sáng Da 50ml', 'Skin1004', 'Rau má Madagascar: giúp làm dịu da, kháng khuẩn những nốt mụn đỏ cho da mụn nhạy cảm.\r\n5 loại Hyaluronic Acid với các phân tử to/vừa/nhỏ: mang đến độ ẩm sâu cho da.\r\nCeramide Biom với kích thước siêu nhỏ, nhỏ hơn lỗ chân lông trên da: tác động sâu vào bên trong da tạo hàng rào bảo vệ da và tăng độ đàn hồi.\r\nNiacinamide và Adenosine: dưỡng sáng da và ngăn ngừa lão hóa.', 'images/srcen1.jpg', '[\"images\\/srcen2.jpg\",\"images\\/srcen.jpg\"]', 350000, ' Giúp cung cấp độ ẩm toàn diện, củng cố hàng rào bảo vệ da, mang đến làn da ngậm nước và sáng khỏe căng bóng, ngăn ngừa lão hóa cũng như các tác nhân gây hại khác từ môi trường.  ', 'Sử dụng sau khi rửa mặt sạch và dùng nước cân bằng da.\r\nLấy một lượng tinh chất vừa đủ thoa đều lên da và vỗ nhẹ để tinh chất thẩm thấu hết vào da.', 3),
(19, 'Sữa Rửa Mặt Simple Giúp Da Sạch Thoáng 150ml', 'Simple', 'Nước tinh khiết lọc 3 lần: hỗ trợ làm dịu làn da nhạy cảm, kích ứng.\r\nPro-Vitamin B5 (Panthenol): giúp phục hồi da, đặc biệt các vùng da bị sần sùi, khô ráp, giúp da mềm và mịn màng hơn, nuôi dưỡng da từ sâu bên trong.\r\nVitamin E: dưỡng ẩm và chống oxy hóa.\r\nBisalolol: chiết xuất từ hoa cúc Chamomile có đặc tính kháng viêm, kháng khuẩn, ngăn ngừa kích ứng và giúp làm dịu làn da bị tổn thương, chống oxy hóa, dưỡng da mịn màng.', 'images/srmsimple2.jpg', '[\"images\\/srmsimple.jpg\",\"images\\/srmsimple1.jpg\"]', 110000, ' Sản phẩm giúp nhẹ nhàng làm sạch da, loại bỏ lớp trang điểm hay bụi bẩn và các tạp chất khác còn sót lại sau khi tẩy trang, đem lại làn da tươi mát và đầy sức sống.', 'Cho một lượng sữa rửa mặt vừa đủ ra tay để tạo bọt cùng với nước, mát-xa sản phẩm lên da và rửa sạch với nước.\r\nSử dụng mỗi ngày hai lần sáng và tối.', 1),
(20, 'Sữa Rửa Mặt Cocoon Sen Hậu Giang Làm Dịu Da Nhạy Cảm 310ml', 'Cocoon', 'Chiết xuất hoa sen:\r\nChứa lượng các flavonoid cao, có tác dụng hạn chế các gốc tự do sinh ra bởi tia UV và các căng thẳng từ môi trường.\r\nChứa các loại đường như fructose và glucose nên có đặc tính giữ ẩm cao, hỗ trợ làm mềm và làm dịu làn da nhạy cảm.\r\nChiết xuất từ rau má: có tác dụng hỗ trợ làm lành da, cấp ẩm và tăng sinh collagen.\r\nBeta-glucan (prebiotic): cân bằng hệ sinh vật trên da, tăng khả năng tự bảo vệ của da, hỗ trợ quá trình phục hồi da.\r\nVitamin B5: có tác dụng dưỡng ẩm, kháng viêm và làm dịu làn da dễ bị kích ứng, da nhạy cảm.\r\nSodium PCA: dưỡng ẩm sâu, giữ ẩm lâu dài và tăng cường sức sống cho da.', 'images/srmcocoon.jpg', '[\"images\\/srmcocoon2.jpg\",\"images\\/srmcocoon1.jpg\"]', 330000, ' Loại bỏ bụi bẩn, dầu thừa một cách hiệu quả, giúp duy trì sự cân bằng độ ẩm tự nhiên trên da, ngăn ngừa khô căng. ', 'Lấy 1 lượng vừa đủ, tạo bọt và mát-xa nhẹ nhàng trên da ướt.\r\nRửa sạch lại với nước.\r\nDùng buổi sáng và tối. ', 1),
(21, 'Sữa Rửa Mặt innisfree Dưỡng Ẩm Từ Trà Xanh 150g', 'innisfree', 'Tinh chất trà xanh tươi: chống oxy hóa da, ngừa ảnh hưởng xấu từ môi trường như ô nhiễm, khói bụi, làm sạch nhẹ nhàng mà không gây căng da. Đặc biệt được cải tiến nhờ công nghệ Dual-Moisture-Rising™ để lưu giữ dưỡng chất trọn vẹn.\r\nVitamin E: phục hồi độ đàn hồi da và sự tươi trẻ của làn da.\r\n16 loại Amino Acid: giàu dưỡng chất gấp 3,5 lần so với trà xanh thông thường, có khả năng phục hồi độ ẩm vượt trội, đem lại làn da sạch và khoẻ.', 'images/srmin2.jpg', '[\"images\\/srmin1.jpg\",\"images\\/srmin.jpg\"]', 250000, 'Sữa rửa mặt được chiết xuất 100% từ lá trà xanh tươi từ đảo Jeju đem lại một làn da sạch và ẩm mịn đầy dưỡng chất, đồng thời dưỡng ẩm cho làn da không bị khô ráp, có khả năng phục hồi độ ẩm vượt trội, đem lại làn da sạch và khoẻ.', 'Cho lượng thích hợp sản phẩm lên tay ướt, tạo bọt và nhẹ nhàng massage toàn mặt.\r\nSau đó rửa mặt sạch với nước ấm.', 1),
(22, 'Sữa Rửa Mặt Tia\'m Ốc Sên Làm Dịu & Phục Hồi Da 200ml', 'Tia\'m', 'Dịch lọc tiết ốc sên giúp làm dịu, cấp ẩm và tăng cường hàng rào bảo vệ da.\r\nChiết xuất từ hoa cúc có khả năng chống oxy hoá và làm dịu da.\r\nChất hoạt động về mặt có chiết xuất từ dừa giúp làm sạch sâu nhưng an toàn và lành tính, không gây bào mòn da', 'images/srmtiam2.jpg', '[\"images\\/srmtiam1.jpg\",\"images\\/srmtiam.jpg\"]', 230000, 'Làm sạch sâu & dịu nhẹ nhưng không làm khô da.\r\nCân bằng độ pH cho làn da, giúp làn da của bạn giữ được độ cân bằng độ pH thích hợp ngay cả sau khi rửa mặt đồng thời bảo vệ hàng rào độ ẩm tự nhiên của da\r\nNgăn  tổn thương hoặc kích ứng da có thể gây ra do rửa mặt', 'Sau khi tẩy trang, lấy một lượng sữa rửa mặt vào lòng bàn tay và một chút nước để tạo bọt.\r\nSau đó thoa đều lên mặt, tiếp tục nhẹ nhàng massage theo chiều kết cấu da và rửa sạch mặt với nước ấm.', 1),
(23, 'Sữa Rửa Mặt Hada Labo Dưỡng Sáng Cao Cấp 100g', 'Hada Labo', 'Citrus Complex được chiết xuất từ Cam Tây và Bưởi Chùm: giàu Vitamin C, có khả năng chống oxi hóa cao.\r\nHạt cám gạo: giúp nhẹ nhàng tẩy tế bào da chết, loại bỏ dầu thừa, phù hợp sử dụng hàng ngày.\r\nAscorbic Acid (Vitamin C tinh khiết) và Niacinamide (Vitamin B3): giúp giảm thâm sạm, đốm nâu, dưỡng da sáng mịn, đều màu.\r\nHệ dưỡng ẩm sâu 3 loại HA: trong đó có Nano HA với phân tử cực nhỏ giúp duy trì độ ẩm, dưỡng da ẩm mịn, căng mượt.\r\nAmino Acid và Fruits Enzyme: giúp nhân đôi khả năng làm sạch.\r\nCông nghệ Max Intensifier từ Nhật Bản: giúp đưa các dưỡng chất thấm sâu vào lớp biểu bì gấp 2 lần, tăng cường hiệu quả dưỡng ẩm.', 'images/srmhada.jpg', '[\"images\\/srmhada1.jpg\",\"images\\/srmhada2.jpg\"]', 115000, 'Sản phẩm sử dụng công nghệ làm sạch tự nhiên với Amino Acid và enzyme trái cây, giúp loại bỏ triệt để bụi bẩn, vi khuẩn cũng như bã nhờn, mang lại làn da tươi trẻ.', 'Làm ướt mặt.\r\nLấy một lượng sữa vừa đủ (khoảng 1cm).\r\nTạo bọt, thoa đều khắp mặt.\r\nRửa sạch với nước.\r\nDùng hàng ngày, sáng và tối.', 1),
(24, 'Sữa Rửa Mặt Skin1004 Làm Sạch Sâu Cho Da Nhạy Cảm 125ml', 'Skin1004', 'Chiết xuất rau má: với khả năng làm sạch, giúp ngăn ngừa mụn, hỗ trợ làm giảm mụn.', 'images/srmskin.jpg', '[\"images\\/srmskin2.jpg\",\"images\\/srmskin1.jpg\"]', 244000, 'Chứa chiết xuất rau má giúp làm sạch da, ngăn ngừa mụn và hỗ trợ điều trị mụn. Lớp bọt mềm mịn giúp lấy sạch bụi bẩn, bã nhờn, dầu thừa từ sâu lỗ chân lông mà không làm da mất nước, lưu giữ được độ ẩm mịn, mềm mại trên da. Với độ pH chuẩn 5.5, không chỉ làm sạch hiệu quả, mà còn bảo vệ lớp màng tế bào mỗi ngày với công thức an toàn, hỗ trợ làm giảm mụn tốt hơn', 'Lấy lượng sữa rửa mặt vừa đủ cho ra bàn tay ướt.\r\nXoa cho đến khi bông bọt.\r\nTrải đều bọt lên da và massage nhẹ nhàng để loại bỏ bụi bẩn.\r\nLàm sạch lại với nước.', 1),
(25, 'Tonner Sen Hậu Giang 310ml', 'Cocoon', 'Chiết xuất hoa sen: Nhờ hàm lượng các flavonoid cao có tác dụng hạn chế các gốc tự do sinh ra bởi tia UV và các căng thẳng từ môi trường. Ngoài ra, trong chiết xuất hoa sen có các loại đường như fructose và glucose nên có đặc tính giữ ẩm cao, hỗ trợ làm mềm và làm dịu làn da nhạy cảm.\r\nBeta-glucan (prebiotic): Cân bằng hệ sinh vật trên da, tăng khả năng tự bảo vệ của da, hỗ trợ quá trình phục hồi da.\r\nMadecassoside: Chiết xuất từ rau má, có tác dụng hỗ trợ làm lành da, cấp ẩm và tăng sinh collagen\r\nVitamin B12: Giúp vệ hàng rào độ ẩm, làm dịu làn da nhạy cảm, giảm mẩn đỏ và ngứa do khô ráp hoặc do thời tiết.\r\nSweetone®: Hoạt chất được chiết xuất từ quả ngũ vị tử hữu cơ, rất giàu peptide giúp làm dịu và giúp da trở nên đều màu.', 'images/tonercocoon.jpg', '[\"images\\/tonercocoon2.jpg\",\"images\\/tonercocoon1.jpg\"]', 290000, 'Giúp bảo vệ hàng rào độ ẩm của làn da nhạy cảm, hỗ trợ và cải thiện da mẩn đỏ, kích ứng, mang lại cảm giác nhẹ nhàng, ẩm mượt.', 'Sau khi làm sạch da bằng tẩy trang và sữa rửa mặt, lấy một lượng sản phẩm vào lòng bàn tay, thoa đều lên da.\r\nVỗ nhẹ nhàng để sản phẩm thẩm thấu vào da. \r\nDùng buổi sáng và tối', 2),
(26, 'Toner Klairs Không Mùi Cho Da Nhạy Cảm 180ml', 'Dear, Klairs', 'Sodium Hyaluronate, β-glucan: Giúp da được cấp ẩm tức thì và giữ ẩm cho da.\r\nChiết xuất rau má: Giúp làm dịu da, giảm mẩn đỏ, sưng viêm và hồi phục da.\r\nLipidure: Dưỡng ẩm sâu và hình thành hàng rào bảo vệ da.\r\nĐặc biệt sản phẩm hoàn toàn không mùi, không chứa hương liệu, phù hợp với những làn da nhạy cảm về hương liệu.', 'images/tonerklairs.jpg', '[\"images\\/tonerklairs1.jpg\",\"images\\/tonerklairs2.jpg\"]', 239000, ' Với bảng thành phần chiết xuất từ thực vật và kết cấu lỏng nhẹ, thấm nhanh trên da, nước hoa hồng Klairs sẽ giúp cân bằng độ pH và cấp ẩm cho làn da hiệu quả, hỗ trợ cho các bước skincare tiếp theo đạt hiệu quả tối ưu.', 'Sau bước làm sạch da, cho một lượng toner vừa đủ ra tay hoặc bông tẩy trang và thoa đều lên da mặt theo chiều vòng tròn.\r\nVỗ hoặc mát-xa nhẹ nhàng để toner thẩm thấu hết vào da.\r\nTiếp tục với các bước chăm sóc tiếp theo như serum, kem dưỡng.\r\nSử dụng mỗi ngày 2 lần vào buổi sáng và tối.', 2),
(27, 'Toner d\'Alba Cải Thiện Lỗ Chân Lông, Dưỡng Ẩm Da 180ml', 'd\'Alba ', 'Chiết xuất Nấm Tuyết Trắng: cung cấp độ ẩm vượt trội, gấp 5 lần Hyaluronic Acid giúp da mềm mại, mịn màng và căng bóng tự nhiên.\r\nChứa 99% vitamin C tinh khiết: hỗ trợ làm sáng da, cải thiện tông da không đều màu và làm mờ thâm nám.\r\nChứa 98% Glutathione tinh khiết: dưỡng da sáng mịn, giảm sạm nám, nếp nhăn, săn chắc da và ngăn ngừa lão hóa.\r\nNiacinamide: làm sáng, đều màu da, giảm thâm sạm, hỗ trợ thu nhỏ lỗ chân lông và điều tiết bã nhờn.\r\nPanthenol: làm dịu da, giảm kích ứng và hỗ trợ phục hồi da tổn thương, giữ ẩm, tăng cường hàng rào bảo vệ da.\r\nVita Boosting Complex (Vitamin Complex): phức hợp nhiều loại vitamin (A, B, C, E...) giúp nuôi dưỡng sâu, tăng độ đàn hồi và sức sống cho làn da mệt mỏi.\r\nChiết xuất từ cây phỉ: giảm viêm, làm dịu da và hỗ trợ se khít lỗ chân lông.\r\nChiết xuất rau má: làm dịu da, hỗ trợ phục hồi da nhạy cảm hoặc đang kích ứng.', 'images/tonerdalba.jpg', '[\"images\\/tonerdalba1.jpg\",\"images\\/tonerdalba2.jpg\"]', 421000, ' Giúp làm sạch sâu, se khít lỗ chân lông và cấp ẩm tối ưu lên tới 100 giờ, sản phẩm hỗ trợ làm sáng da, cải thiện độ đàn hồi và phục hồi làn da mệt mỏi. Kết cấu dạng serum lỏng nhẹ, thẩm thấu nhanh, hứa hẹn mang lại làn da tươi sáng, mịn màng chỉ sau thời gian ngắn sử dụng.\r\n', 'Lấy một lượng thích hợp ra tay và thoa đều lên da.\r\nHoặc làm ướt miếng bông với một lượng vừa đủ, nhẹ nhàng thấm theo chiều kết cấu da.', 2),
(28, 'Toner Pyunkang Yul Cấp Ẩm, Làm Dịu Da 100ml', 'Pyunkang Yul', '94.6% chiết xuất rễ cây Hoàng Kỳ: Kháng khuẩn, kháng viêm, chống oxy hóa.\r\nArigin: Đóng vai trò như một amino axit, giúp tăng sinh collagen, làm dịu da và đẩy nhanh tốc độ lành vết thương.', 'images/toneryul.jpg', '[\"images\\/toneryul2.jpg\",\"images\\/toneryul1.jpg\"]', 209000, 'Sản phẩm sẽ giúp làn da được làm dịu, thư giãn, gạt bỏ những mệt mỏi, muộn phiền. Từ đây, làn da sẽ tìm thấy sự cân bằng hoàn hảo dành cho riêng mình, đem lại cảm giác ẩm mướt, mịn màng cho một khởi đầu chu trình chăm sóc da \"Tối giản chuẩn Pyunkang Yul\".', 'Cách 1: Sau khi rửa mặt, đổ một lượng vừa đủ sản phẩm ra tay và thoa đều khắp mặt. Vỗ nhẹ vào làn da để các hoạt chất thẩm thấu nhanh hơn.\r\nCách 2: Thấm một miếng bông với toner và nhẹ nhàng lau theo chiều của da.\r\nCách 3: Nếu bạn cần làm dịu và dưỡng ẩm, cho một lượng toner lên miếng bông mỏng rồi đắp lên mặt, để 5 - 10 phút như mặt nạ.', 2),
(29, 'Toner Simple Làm Dịu Da & Cấp Ẩm 200ml', 'Simple', 'Allantoin: giữ ẩm, làm dịu, ngăn ngừa tình trạng khô da và kích ứng.\r\nChiết xuất cây Phỉ (Hamamelis Virginiana Leaf Water): có tác dụng kháng khuẩn, kháng viêm, làm se, làm dịu, loại bỏ dầu thừa trên da.\r\nVitamin B5 (Panthenol): dưỡng ẩm, hỗ trợ phục hồi, làm dịu da.', 'images/tonersimple.jpg', '[\"images\\/tonersimple1.jpg\",\"images\\/tonersimple2.jpg\"]', 126000, 'Sản phẩm toner không chứa cồn được thiết kế phù hợp cho làn da nhạy cảm và dễ nổi mụn, giúp làm sạch sâu và cân bằng độ pH, cung cấp độ ẩm dịu nhẹ cho làn da, mang lại cảm giác tươi mát và sảng khoái sau khi sử dụng.', 'Allantoin: giữ ẩm, làm dịu, ngăn ngừa tình trạng khô da và kích ứng.\r\nChiết xuất cây Phỉ (Hamamelis Virginiana Leaf Water): có tác dụng kháng khuẩn, kháng viêm, làm se, làm dịu, loại bỏ dầu thừa trên da.\r\nVitamin B5 (Panthenol): dưỡng ẩm, hỗ trợ phục hồi, làm dịu da.', 2),
(30, 'Toner Torriden Dưỡng Ẩm, Sáng Bóng Da 300ml', 'Torriden ', 'Công thức 5 lớp Hyaluronic Acid +Tiểu phân tử Hyalurosan: mang nước đến từng tế bào da, da được lấp đầy nước trở nên sáng bóng, quá trình lão hóa cũng được kéo chậm lại.\r\nVitamin B5: góp mặt để bảo vệ màng da, điều tiết tuyến dầu, đưa da trở lại trạng thái khỏe mạnh ban đầu. Nhờ đó chúng ta sẽ cảm nhận da có sức sống rõ rệt, giảm hẳn các dấu hiệu mệt mỏi.\r\nBeta Glucan, Ceramide ENP: tăng cường bảo vệ màng tế bào da.\r\nPhức hợp 5 loại HA phân tử nhỏ: giúp cấp ẩm sâu, giữ nước cho da căng mọng.\r\nThành phần Panthenol và Allantoin: giúp dưỡng ẩm và làm dịu làn da, giúp da thoải mái hơn.\r\nAllantoin: là thành phần chiết xuất từ thực vật giúp nhẹ nhàng loại bỏ các tế bào da chết và làm dịu da.', 'images/tonertorri.jpg', '[\"images\\/tonertorri1.jpg\",\"images\\/tonertorri2.jpg\"]', 300000, 'Sản phẩm với công thức Low Molecular Hyaluronic Acid chứa 5 lớp Hyaluronic Acid giúp làm dịu da, cấp ẩm tức thì và tạo màng khoá ẩm bảo vệ da. Đồng thời tái tạo da mạnh mẽ, da dần sáng khoẻ từ bên trong, lúc nào cũng căng mọng ngậm nước.', 'Dùng sau bước làm sạch da bằng sữa rửa mặt.\r\nĐổ toner ra bông tẩy trang, lau nhẹ nhàng trên da, vỗ nhẹ để sản phẩm thẩm thấu sâu hơn.\r\nDùng 2 lần/ ngày để có tác dụng tối ưu. Thoa nhiều lớp để tăng cường khả năng dưỡng ẩm và thư giãn trong những ngày da nhạy cảm.', 2),
(31, 'Toner Round Lab Bổ Sung Độ Ẩm Làm Dịu Da 100ml', 'Round Lab', 'Nước biển sâu Ulleungdo: cung cấp dưỡng chất cần thiết nuôi dưỡng làn da khoẻ đồng thời duy trì sự cân bằng ẩm tối ưu trên da.\r\nThành phần tẩy tế bào chết độc quyền Hatching EX-07: làm sạch tế bào c.hết, dầu thừa và bã nhờn tận sâu các lỗ chân lông đồng thời hỗ trợ làm giảm mụn đầu đen.\r\nPanthenol, Allantoin và Betaine: làm dịu và phục hồi làn da, đặc biệt là da nhạy cảm, mẫn cảm và dễ bị tổn thương.', 'images/tonerlab.jpg', '[\"images\\/tonerlab1.jpg\",\"images\\/tonerlab2.jpg\"]', 215000, 'Round Lab 1025 Dokdo Toner giúp cấp ẩm, cân bằng độ pH tự nhiên đồng thời nhẹ nhàng làm sạch tế bào chết trên da.', 'Lấy một lượng sản phẩm vừa đủ ra tay, vỗ nhẹ và massage trên da mặt cho dưỡng chất thẩm thấu sâu.\r\nHoặc đổ một lượng vừa đủ vào bông tẩy trang và nhẹ nhàng lau đều khắp mặt để làm sạch tế bào chết, bụi bẩn và bã nhờn trên da.\r\nSử dụng 2 lần một ngày, sau bước tẩy trang và làm sạch với sữa rửa mặt để mang lại hiệu quả rõ rệt.', 2),
(32, 'Toner Caryophy Ngừa Mụn Kiềm Dầu Giảm Thâm 300ml', 'Caryophy', 'Tinh Chất Rau Má: Tổng hợp collagen, giảm mụn, mờ thâm, dưỡng sáng da, cấp nước, chống oxy hóa, tăng độ đàn hồi cho da, làm sạch da, hỗ trợ giảm viêm nhiễm, đào thải độc tố cho da.\r\nTinh Chất Rau Sam: Chứa nhiều vitamin C giúp làm sáng và ngăn ngừa lão hóa da, ngoài ra còn có đặc tính kháng khuẩn và kháng viêm.\r\nChiết Xuất Chùm Ngây: Chứa sitokinin: làm da khỏe mạnh, vitamin C chống lão hóa.\r\nChiết Xuất Nhân Sâm: Cấp nước, thúc đẩy tái tạo tế bào da, chống oxy hóa, detox cho da, giúp da sáng hồng rạng rỡ.\r\nGlycerin: Cấp ẩm cho da, ngăn ngừa lão hóa, loại bỏ bụi bẩn và làm mềm da.\r\nButylene Glycol: Giảm độ nhờn rít cho da.\r\nBeta-Glucan: Cấp ẩm, hỗ trợ chữa lành vết thương, ngăn ngừa hình thành nếp nhăn.\r\nHyaluronic Acid (HA): Giữ nước, giữ ẩm cho da, làm đầy nếp nhăn, giúp làn da căng bóng tự nhiên.\r\nBetaine salicylate: Kháng khuẩn, tẩy tế bào chết cho da dịu nhẹ, làm giảm mụn.', 'images/tonercary.jpg', '[\"images\\/tonercary1.jpg\",\"images\\/tonercary2.jpg\"]', 298000, 'Công thức với thành phần 100% chiết xuất dưỡng chất từ thiên nhiên như Rau Má, Rau Sam, Chùm Ngây, Nhân Sâm... giúp mang lại công dụng làm giảm mụn thâm, dưỡng ẩm, tẩy da chết, cân bằng độ pH cho da và là bước đệm hoàn hảo để các dưỡng chất thấm sâu vào da tốt nhất.', 'Sử dụng sau bước sữa rửa mặt. \r\nLấy một lượng toner ra bông cotton nhẹ nhàng lau lên mặt.\r\nMassage để toner thẩm thấu tốt hơn, tránh vùng mắt và vùng miệng.\r\nCó thể sử dụng làm toner mask, giúp giảm kích ứng da.\r\nPha loãng toner với nước theo tỷ lệ 1:9 để thay thế xịt khoáng.\r\nKhuyến khích sử dụng Toner Caryophy cùng với Sữa rửa mặt Caryophy và Serum Caryophy để đạt hiệu quả tốt nhất và rút ngắn thời gian điều trị mụn, thâm.', 2),
(33, 'Serum L\'Oreal Hyaluronic Acid Cấp Ẩm Sáng Da 30ml', 'L\'Oreal ', '1.5 % Hyaluronic Acid (Sodium Hyaluronate): là hợp chất tự nhiên sẵn có trong làn da và cơ thể con người. Phân tử HA có đặc tính thu hút nước, giữ ẩm lên đến hơn 1000 lần trọng lượng của chính nó, giúp tăng cường khả năng tự giữ ẩm của làn da nhằm mang lại hiệu quả dưỡng ẩm lâu dài.\r\nVitamin C (Ascorbyl Glucoside): dưỡng da sáng mịn rạng rỡ.', 'images/srloreal2.jpg', '[\"images\\/srloreal1.jpg\",\"images\\/srloreal.jpg\"]', 350000, ' Với sự kết hợp không chỉ 1 mà đến 2 loại Hyaluronic Acid ưu việt ở nồng độ 1.5% sẽ là giải pháp chăm sóc da hiệu quả dành cho làn da khô & lão hóa, giúp cung cấp độ ẩm tối đa cho da căng mịn và tươi sáng tức thì. Với Revitalift HA đậm đặc, làn da sẽ có sự thay đổi rõ rệt, mang đến vẻ ngoài rạng rỡ cho bạn.', 'Làm sạch da. Cân bằng với nước hoa hồng.\r\nSử dụng nắp bóp nhỏ giọt, chấm đều vài giọt khắp mặt.\r\nNhẹ nhàng thoa đều khắp mặt.\r\nVỗ nhẹ để dưỡng chất còn lại thấm vào da.\r\nKết hợp với kem dưỡng ẩm sau đó để khóa ẩm cho hiệu quả tối ưu nhất.', 3),
(34, 'Serum Garnier Giảm Mụn Mờ Thâm Cho Da Dầu, Mụn 15ml', 'Garnier ', 'Dẫn xuất Vitamin C: có khả năng làm sáng, chống oxy hoá và ngăn ngừa sự xuất hiện của các đốm nâu, cải thiện đều màu da.\r\nBHA (Axit salicylic): làm sạch sâu ngăn bít tắc lỗ chân lông, ngăn ngừa mụn trứng cá.\r\nNiacinamide: có công dụng kháng viêm, kháng khuẩn, làm dịu da, kiểm soát bã nhờn và lượng dầu thừa trên da.\r\nAHA (axit lactic): tẩy tế bào chết, làm thông thoáng lỗ chân lông, ngăn ngừa mụn mới hình thành thành và cải thiện sẹo mụn và vết thâm do mụn để lại.', 'images/srgarnier.jpg', '[\"images\\/srgarnier1.jpg\",\"images\\/srgarnier2.jpg\"]', 136000, 'Có công dụng giảm mụn, mờ vết thâm và vết thâm do mụn đồng thời làn da sẽ được làm dịu, sáng hơn rõ rệt. Sản phẩm hoạt động theo cơ chế 3 tác động làm giảm bã nhờn - tiêu sừng - mờ thâm mang lại làn da sáng mịn, rạng ngời. ', 'Làm sạch da bằng nước tẩy trang và sữa rửa mặt.\r\nSử dụng nắp bóp nhỏ giọt, chấm đều 3-4 giọt khắp mặt.\r\nNhẹ nhàng thoa đều dưỡng chất khắp mặt.\r\nSử dụng hàng ngày để đem lại hiệu quả tối ưu.\r\nNên sử dụng cùng Nước Tẩy Trang Garnier Dành Cho Da Dầu Và Mụn 400ml và Sữa Rửa Mặt Garnier 3 Trong 1 Giảm Mụn & Sáng Da 90ml để đạt được trải nghiệm ngừa mụn sáng da tốt nhất.\r\nLưu ý: Sử dụng thêm kem chống nắng có SPF30 tối thiểu vào buổi sáng để bảo vệ da.', 3),
(35, 'Serum Bio-essence Dưỡng Da Tươi Sáng Căng Mọng 30g', 'Bio-essence', 'Bổ sung 1000mg Tinh chất Collagen: nuôi dưỡng làn da căng mịn, ẩm mượt.\r\nTinh chất Tổ Yến: dưỡng ẩm sâu, tăng cường độ đàn hồi hiệu quả.\r\nPeptide dưỡng sáng: đẩy lùi các sắc tố làm sạm da, dưỡng da sáng hồng rạng rỡ.\r\nCông thức độc quyền Bio-Energy Complex™: giúp da hấp thu dưỡng chất tốt hơn, làn da trở nên khoẻ mạnh, tươi sáng và tràn đầy năng lượng.', 'images/srbio.jpg', '[\"images\\/srbio1.jpg\",\"images\\/srbio2.jpg\"]', 250000, 'Công thức với hàm lượng dồi dào Tinh Chất Tổ Yến & Collagen 1000mg giúp mang lại vẻ săn mịn, tươi sáng cho da. Kết cấu sản phẩm mỏng nhẹ dễ đang thẩm thấu giúp gia hấp thu một cách nhanh chóng. Phù hợp với những làn da đang cần nuôi dưỡng và duy trì căng mịn, đàn hồi.', 'Sau bước làm sạch và cân bằng da, cho một lượng vừa đủ tinh chất Bio-essence Bio Bird\'S Nest Collagen Essence ra tay.\r\nNhẹ nhàng massage lên da mặt và cổ theo chuyển động tròn cho đến khi hấp thu hoàn toàn.', 3),
(36, 'Serum Neutrogena Niacinamide Cấp Ẩm Sáng Da 30ml', 'Neutrogena', '10% Niacinamide: dưỡng sáng da, làm đều màu.\r\nHyaluronic Acid: giữ và khóa độ ẩm, cải thiện làn da khô, nhợt nhạt.\r\nN-acetyl glucosamine: làm căng mọng và đều màu da.', 'images/srneu.jpg', '[\"images\\/srneu1.jpg\",\"images\\/srneu2.jpg\"]', 350000, 'Sản phẩm với công thức chứa 10% Niacinamide và Hyaluronic Acid, giúp cung cấp độ ẩm, cải thiện tình trạng da không đều màu, kiểm soát dầu, thu nhỏ lỗ chân lông và tăng cường hàng rào bảo vệ da, mang lại làn da rạng rỡ, căng mọng.', 'Sử dụng 2 lần/ ngày lên da mặt và cổ đã làm sạch. \r\nThoa nhẹ nhàng dưỡng chất một lượng cỡ hạt ngọc trai, mát xa cho đến khi dưỡng chất thấm hoàn toàn vào da. \r\nSử dụng thêm kem dưỡng ẩm cho da mặt.', 3),
(37, 'Serum Klairs Vitamin C Cho Da Nhạy Cảm 35ml', 'Dear, Klairs ', '5% Vitamin C dạng Acid L-ascorbic: giúp sản xuất collagen, phục hồi và trẻ hóa làn da mà không hề lo kích ứng da, kể cả da nhạy cảm.\r\nCentella Asiatica: giúp tăng cường chất chống oxy hóa và thúc đẩy sự phát triển và tái tạo làn da mới, giúp tổn thương mau lành và lên da non, hỗ trợ giảm mụn hiệu quả.', 'images/srklairs.jpg', '[\"images\\/srklairs1.jpg\",\"images\\/srklairs2.jpg\"]', 270000, ' Sản phẩm tiếp thêm sinh lực trẻ hóa làn da với sức mạnh của 5% Vitamin C dạng Acid L-ascorbic nhẹ dịu; cùng chiết xuất Rau Má không gây kích ứng nhưng vẫn hiệu quả trong việc làm mờ các vết mụn và vết nám, cải thiện làn da xỉn và không đều màu.', 'Sau bước làm sạch và cân bằng da, dùng 2-3 giọt cho toàn bộ vùng mặt. \r\nNhẹ nhàng massage vào toàn bộ khuôn mặt bằng cách sử dụng lòng bàn tay và nhiệt độ cơ thể để sản phẩm dễ dàng hấp thụ vào da.\r\nKlairs Freshly Juiced Vitamin Drop dùng được cho da cả ban ngày và ban đêm. \r\nNên sử dụng kem chống nắng vào ban ngày để tối ưu hóa các chất dinh dưỡng trong Serum cũng như bảo vệ da hiệu quả!', 3),
(38, 'Kem Dưỡng La Roche-Posay Giúp Phục Hồi Da Đa Công Dụng 40ml', 'Roche-Posay', 'TRIBIOMA: phức hợp độc quyền giúp cân bằng hệ vi sinh vật trên da, tăng cường hoạt động của lợi khuẩn & ức chế sự phát triển của hại khuẩn.\r\n5% VITAMIN B5 (PANTHENOL): Tăng cường khả năng tái tạo tế bào trên da, giúp phục hồi nhanh hơn.\r\nMADECASSOSIDE: Giúp giảm sưng, làm dịu và ngăn ngừa các kích ứng trên da.\r\nNƯỚC KHOÁNG LA ROCHE-POSAY: Làm dịu da tức thì khi gặp thương tổn, bảo vệ da trước tác hại của oxy hóa.\r\nBƠ HẠT MỠ: Dưỡng ẩm và củng cố hàng rào bảo vệ da.', 'images/kdposay.jpg', '[\"images\\/kdposay1.jpg\",\"images\\/kdposay2.jpg\"]', 380000, 'Được thiết kế chuyên biệt dành cho làn da khô, kích ứng và thương tổn, giúp phục hồi da sau 1H và bảo vệ hàng rào độ ẩm da với công nghệ cải tiến mới Tribioma và các hoạt chất phục hồi chuyên sâu.', 'Làm sạch vùng da cần thoa kem, lấy một lượng vừa đủ thoa đều lên da và vỗ nhẹ để kem thẩm thấu nhanh hơn.\r\nMỗi ngày nên sử dụng 2 lần vào sáng và tối để đạt được hiệu quả tốt nhất.\r\nLưu ý: Có thể bôi kem lên vùng da tổn thương, giúp da phục hồi nhanh hơn. Tuy nhiên, cần tránh để kem dính vào mắt.', 4),
(39, 'Kem Dưỡng Torriden Làm Dịu Mát, Dưỡng Ẩm, Sáng Bóng Da 100ml', 'Torriden ', 'HA Crosspolymer: Có khả năng giữ nước vượt trội, giúp cung cấp độ ẩm dồi dào và duy trì sự mềm mại cho làn da trong thời gian dài.\r\nHydrolyzed Hyaluronic Acid: Với cấu trúc kích thước phân tử nhỏ, dạng HA thủy phân có khả năng thấm sâu vào lớp thượng bì, mang lại hiệu quả dưỡng ẩm tối ưu.\r\nSodium Hyaluronate: Có khả năng duy trì độ ẩm lâu dài, giúp da luôn tươi mới, căng tràn sức sống.\r\nSodium Acetylated Hyaluronate: Dạng HA acetyl hóa này giúp phân tử HA bám trên da tốt hơn, tăng cường hiệu quả dưỡng ẩm bền vững và lâu dài.\r\nHydrolyzed Sodium Hyaluronate: Phiên bản thủy phân của muối HA với kích thước nhỏ, dễ dàng thẩm thấu sâu, cung cấp độ ẩm tuyệt đối cho làn da.\r\nCeramide NP: Hỗ trợ củng cố hàng rào bảo vệ da, ngăn ngừa tình trạng mất nước và tăng cường khả năng tự bảo vệ tự nhiên của da.\r\nChiết xuất Hoa Cúc La Mã: Giúp giảm sưng viêm, làm dịu các vùng da bị kích ứng.\r\nChiết xuất Hoa Oải Hương: Làm dịu da đồng thời mang lại cảm giác thư giãn tinh thần.\r\nChiết xuất Hoa Thanh Cúc: Chứa chất chống oxy hóa mạnh mẽ, bảo vệ da trước tác động của các gốc tự do cho làn da tươi trẻ, rạng rỡ.\r\nChiết xuất Cây Lưu Ly: Làm dịu da, giảm kích ứng và mẩn đỏ.', 'images/kdtorriden.jpg', '[\"images\\/kdtorriden1.jpg\",\"images\\/kdtorriden2.jpg\"]', 277000, 'Với công thức Low Molecular Hyaluronic Acid chứa 5 loại Hyaluronic Acid phân tử thấp dễ dàng thẩm thấu vào da, mang lại hiệu quả dưỡng ẩm vượt trội giúp da luôn mềm mại và căng mịn. DIVE-IN Soothing Cream không chỉ giữ ẩm lâu dài mà còn hỗ trợ củng cố hàng rào bảo vệ da, giảm thiểu tình trạng kích ứng và khô ráp. Kết cấu mỏng nhẹ, không gây bết dính phù hợp với mọi loại da, đặc biệt là làn da thiếu nước.', 'Thoa đều một vài giọt serum lên mặt\r\nTiếp đó thoa lớp kem làm dịu da lên trên vào mỗi buổi sáng và tối.', 4),
(40, 'Kem Dưỡng CeraVe Cho Da Khô 340g', 'CeraVe ', '3 loại Ceramides (1, 3, 6-II): thiết yếu giúp khôi phục hàng rào độ ẩm da. \r\nCông nghệ MVE độc quyền: khoá ẩm cho da suốt 24 giờ. \r\nHyaluronic Acid: giúp duy trì độ ẩm tự nhiên của da.', 'images/kdcerave.jpg', '[\"images\\/kdcerave1.jpg\",\"images\\/kdcerave2.jpg\"]', 305000, 'Với 3 ceramide tự nhiên và Hyaluronic Acid, những chất cần thiết trong việc hỗ trợ hàng rào bảo vệ da và duy trì độ ẩm. Sử dụng công nghệ phân phối MVE đã được cấp bằng sáng chế để giúp bổ sung ceramides và cung cấp quá trình hydrat hóa lâu dài có kiểm soát, khoá ẩm cho làn da suốt cả ngày.', 'Thoa cho mặt và cơ thể, có thể sử dụng thường xuyên hoặc bất kể lúc nào có nhu cầu dưỡng ẩm.', 4),
(41, 'Gel Dưỡng Hada Labo Sáng Da Chuyên Sâu, Giảm Thâm Sạm 50g', 'Hada Labo', '1% T.X.A: có khả năng làm mờ các đốm nâu, cải thiện đều màu và làm sáng da. \r\nNiacinamide: có hiệu quả dưỡng sáng chuyên sâu và làm mờ thâm nám, thúc đẩy tái tạo tế bào da mới, bật tông da rõ rệt.\r\nVitamin C & E: tăng cường khả năng chống oxy hóa, bảo vệ da khỏi tác hại của tia UV, đồng thời dưỡng sáng các vùng da sậm màu, cho sắc da đều màu rạng rỡ.\r\n2x Hyaluronic Acid: giúp cung cấp độ ẩm sâu, hỗ trợ tái tạo cấu trúc da đàn hồi, dưỡng da ẩm mượt & mềm mịn.\r\nChiết xuất hạt Ý Dĩ: giúp dưỡng ẩm và dưỡng sáng da, giảm viêm và ngăn ngừa các dấu hiệu lão hóa.', 'images/kdhada.jpg', '[\"images\\/kdhada1.jpg\",\"images\\/kdhada2.jpg\"]', 200000, ' Giúp mờ thâm sạm, dưởng da sáng khỏe, rạng rỡ sau 7 ngày, cấp ẩm chuyên sâu, dưỡng da ẩm mịn', 'Làm sạch da mặt với các bước tẩy trang/rửa mặt. \r\nSau bước tinh chất, lấy một lượng kem vừa đủ, chấm 5 điểm lên mặt, massage để dưỡng chất thấm vào da.\r\nSử dụng 2 lần sáng và tối.', 4),
(42, 'Kem Dưỡng Ẩm Klairs Cho Da Khô, Nhạy Cảm 80ml', 'Dear, Klairs', 'Beta Glucan, Shea Butter, dầu Jojoba và các chiết xuất thực vật khác: có tác dụng cấp ẩm, tăng cường khả năng miễn dịch cho da, làm dịu các nốt mụn và hỗ trợ ngăn ngừa tình trạng lão hóa da, giảm thiểu các nếp nhăn nhẹ trên bề mặt da.\r\nTinh dầu oải hương (Lavandula Angustifolia (Lavender) Oil): tạo mùi thơm dễ chịu của thảo mộc, mang đến cảm giác thư giãn khi sử dụng.', 'images/kdklairs.jpg', '[\"images\\/kdklairs1.jpg\",\"images\\/kdklairs2.jpg\"]', 350000, 'Được thiết kế dành riêng cho tình trạng da khô, mất nước & nhạy cảm. Kem dưỡng có kết cấu đặc giúp cấp ẩm sâu nhằm khôi phục cân bằng độ ẩm, giúp da trở nên rạng rỡ và căng bóng hơn. Bên cạnh đó, sản phẩm còn có tác dụng làm dịu da, giảm mẩn đỏ và các nốt mụn, hỗ trợ làm mờ vết thâm.', 'Có thể sử dụng cho cả ngày và đêm.\r\nSử dụng sau các sản phẩm đặc trị (như Toner/Essence/Serum hoặc các sản phẩm tẩy da chết hóa học).\r\nLấy một lượng vừa đủ cho ra lòng bàn tay. Thoa nhẹ, massage đều và vỗ nhẹ nhàng để da dễ dàng hấp thụ dưỡng chất.', 4),
(43, 'Kem Dưỡng Olay Ban Ngày Sáng Da Chống Tia UV SPF15 50g', 'Olay ', 'Niacinamide (Vitamin B3): dưỡng sáng da, hỗ trợ làm mờ vết thâm/đốm nâu/tàn nhang.\r\nTocopheryl Acetate (Vitamin E): dưỡng ẩm, chống oxy hóa, ngăn ngừa lão hóa da.\r\nPanthenol (Vitamin B5): dưỡng ẩm và hỗ trợ phục hồi da.\r\nSPF 15 PA++: bảo vệ da khỏi tác hại của tia UV.', 'images/kdolay.jpg', '[\"images\\/kdolay1.jpg\",\"images\\/kdolay2.jpg\"]', 240000, ' OLAY Luminous sẽ giúp nuôi dưỡng và cải thiện tình trạng da xỉn màu hiệu quả, cho làn da toả sáng rạng rỡ chỉ trong 28 ngày.', 'Thoa đều kem dưỡng sáng da OLAY lên toàn bộ da mặt và cổ, sau bước làm sạch vào buổi sáng và tối (Luminous Light Perfecting Cream SPF 15 vào ban ngày, Luminous Light Perfecting Night Cream vào ban đêm).\r\nTránh để sản phẩm dính vào mắt.\r\nNgưng sử dụng kem nếu da bị ngứa, đỏ hoặc da bị kích ứng.\r\nTránh để da tiếp xúc trực tiếp với ánh nắng mặt trời trong thời gian dài, ngay cả khi đang sử dụng sản phẩm chống nắng.\r\nKhông được sử dụng cho trẻ em dưới ba tuổi.', 4),
(44, 'Kem Dưỡng Garnier Tinh Chất Serum Sáng Da Ban Ngày 50ml', 'Garnier ', 'Chứa Vitamin C và tinh chất quả Yuzu: cải thiện tình trạng thâm mụn, không đều màu, tăng khả năng làm sáng da, giúp da đều màu, rạng rỡ.\r\nThành phần AHA: có công dụng loại bỏ da chết nhẹ nhàng cũng như các lớp sừng gây tối màu da từ đó giúp da trở nên sáng hơn. ', 'images/kdgarnier.jpg', '[\"images\\/kdgarnier1.jpg\",\"images\\/kdgarnier2.jpg\"]', 175000, 'Với thành phần gấp 3 lần vitamin C và tinh chất quả Yuzu mang đến làn da sáng mịn, đều màu, cải thiện những vết thâm sạm, xỉn màu. Ngoài ra, sản phẩm bổ sung chỉ số chống nắng SPF 30 PA+++ hỗ trợ bảo vệ làn da khỏi các tác hại của ánh nắng mặt trời.', 'Dùng sau khi làm sạch da bằng sửa rửa mặt.\r\nKết hợp với Dưỡng chất tăng cường dưỡng sáng da Light Complete Vitamin C Booster Serum để cho hiệu quả tốt.\r\nThoa lượng vừa đủ lên mặt và cổ, massage nhẹ nhàng để sản phẩm thẩm thấu.\r\nThích hợp sử dụng vào ban ngày.\r\nChú ý: Tránh thoa vào vùng mắt.', 4),
(45, 'Kem Chống Nắng L\'Oreal X20 Thoáng Da Mỏng Nhẹ 50ml', 'L\'Oreal ', 'Màng lọc chống nắng Mexoryl XS & XL: bảo vệ da tối đa khỏi tác hại của tia UVA / UVB.', 'images/kcnloreal.jpg', '[\"images\\/kcnloreal1.jpg\",\"images\\/kcnloreal2.jpg\"]', 300000, 'Với sự kết hợp hoàn hảo của công nghệ chống nắng bền bỉ tối đa và thành phần vàng bảo vệ da, dưỡng sáng, hỗ trợ mờ thâm nám. Chống nắng L\'Oreal được trang bị 2 lớp màng bảo vệ: Màng lọc Mexoryl SX và Mexoryl XL giúp cản tia UVA và UVB tối ưu suốt cả ngày dài, hỗ trợ ngăn ngừa da lão hoá lên đến 5 năm.', 'Dùng 1 lượng kem vừa đủ và chia đều trên mặt và cổ, sau đó thoa đều nhẹ nhàng khắp mặt và cổ.\r\nSử dụng vào ban ngày, trước khi ra nắng 30 phút, sau các bước dưỡng da thông thường, và trước các bước trang điểm tiếp theo (nếu có).', 5),
(46, ' Sữa Chống Nắng Sunplay Skin Aqua Dưỡng Da Sáng Mịn 55g', 'Sunplay ', 'Công nghệ chống nắng Watery Capsule: ngăn tia UVA/UVB tối ưu và bền bỉ hơn.\r\nCông nghệ giữ ẩm Ceramide Boost: ngăn ngừa da mất nước, giữ ẩm tối ưu.\r\nVitamin C & B3: làm mờ vùng da sạm màu, dưỡng da sáng mịn.', 'images/kcnskinaqua.jpg', '[\"images\\/kcnskinaqua1.jpg\",\"images\\/kcnskinaqua2.jpg\"]', 150000, 'Sunplay Skin Aqua của Nhật Bản, ứng dụng công nghệ CHỐNG NẮNG - GIỮ ẨM đột phá từ Nhật Bản giúp chống nắng mạnh mẽ và bền bì trên da, đồng thời hạn chế tình trạng mất nước và duy trì độ ẩm tối ưu. Đặc biệt, sản phẩm còn có công dụng kiểm soát bã nhờn và dưỡng da sáng mịn đều màu, là giải pháp lý tưởng dành cho các cô nàng da dầu nhờn trong mùa hè nóng bức.', 'Thoa đều sản phẩm trước khi ra nắng.\r\nDùng hàng ngày để bảo vệ da tốt nhất.\r\nSau khi ra mồ hôi nhiều, thoa lại để có hiệu quả tốt hơn.\r\nLưu ý:\r\nKhông thoa lên vết thương hở hoặc bị bỏng.\r\nNgưng sử dụng và tham khảo ý kiến bác sĩ nếu có dấu hiệu dị ứng như: nổi mẩn đỏ, sưng, ngứa.\r\nKhông ở ngoài nắng quá lâu ngay cả khi đang sử dụng sản phẩm chống nắng.', 5),
(47, 'Sữa Chống Nắng Bioré Kiểm Soát Bóng Nhờn 30ml', 'Bioré ', 'Hyaluronic Acid và Glycerin: dưỡng ẩm và làm mềm mịn da. ', 'images/kcnbiore.jpg', '[\"images\\/kcnbiore1.jpg\",\"images\\/kcnbiore2.jpg\"]', 115000, 'Sản phẩm chống nắng đến từ thương hiệu mỹ phẩm Bioré của Nhật Bản, với chỉ số SPF 50+/PA+++ giúp bảo vệ da mạnh mẽ trước các tia tử ngoại có hại, tác nhân gây ra sạm da, cháy nắng, nếp nhăn, tàn nhang, lão hóa da.', 'Lắc kỹ, lấy một lượng thích hợp, thoa đều trên khắp bề mặt da trước khi đi ra nắng.\r\nĐể đạt hiệu quả tốt hơn, nên thoa lại sau khi ra mồ hôi hoặc bơi lâu dưới nước.\r\nCó thể dùng sữa rửa mặt hoặc sản phẩm tẩy trang Biore để làm sạch.\r\nNhững lưu ý khi sử dụng:\r\nTrong quá trình sử dụng nếu thấy da có các biểu hiện khác thường như: xuất hiện các vết đỏ, ngứa, hay bị kích ứng thì phải ngưng sử dụng ngay và hỏi ý kiến tư vấn từ chuyên gia da liễu.\r\nKhông thoa lên các vùng da bị viêm, bị chàm bội nhiễm hay các vùng da bị thương.', 5),
(48, 'Sữa Chống Nắng Cocoon Bí Đao Quang Phổ Rộng 50ml', 'Cocoon ', 'Synoxyl AZ (Acetyl Zingerone): chất ngừa oxi hóa rất bền quang được chiết xuất từ củ gừng với khả năng trung hòa linh hoạt nhiều dạng gốc tự do khác nhau giúp bảo vệ DNA và duy trì sự toàn vẹn của ma trận ngoại bào.\r\nMelanin: bảo vệ da khỏi ánh sáng năng lượng cao nhìn thấy được (tia HEV), ngừa tình trạng tăng sắc tố và lão hóa tế bào.\r\nHydroxymethoxyphenyl Decanone: là một chất giúp tổng hợp axit hyaluronic ở lớp hạ bì và biểu bì, hỗ trợ bảo vệ da khỏi những tổn thương ngắn hạn và dài hạn. Đồng thời, Hydroxy Methoxy Phenyl Decanone còn giúp bảo vệ sự toàn vẹn của sản phẩm trước tác nhân gây oxi hoá từ môi trường.\r\nChiết xuất bí đao: đây là nguyên liệu lành tính, thanh mát giúp giảm mụn. Dịch chiết từ quả bí đao giúp cải thiện lượng dầu trên da.\r\nVitamin E: là một chất ngừa oxi hoá được chiết xuất hoàn toàn từ đậu nành không biến đổi gen (Non-GMO).', 'images/kcncocoon.jpg', '[\"images\\/kcncocoon1.jpg\",\"images\\/kcncocoon2.jpg\"]', 200000, 'Với 7 màng lọc tiên tiến, sữa chống nắng sẽ bảo vệ làn da của bạn khỏi tác hại của tia UVA, UVB và HEV. Sản phẩm có khả năng bảo vệ rất cao với chỉ số SPF 50+ PA++++, UVA-PF 62.6 cùng finish ráo mịn tự nhiên, không bóng, không tạo vệt trắng, kết cấu không trọng lượng, lướt nhanh và tệp vào tone da.', 'Lắc đều sản phẩm trước khi dùng. Thoa một lượng nhiều, đảm bảo che phủ toàn mặt và cổ. \r\nSử dụng vào buổi sáng, trước khi trang điểm và trước khi ra nắng 15 phút. \r\nThoa lại khi cần để duy trì lớp bảo vệ, đặc biệt là sau khi đổ mồ hôi, bơi lội hoặc dùng khăn lau.', 5),
(49, 'Kem Chống Nắng Beplain Nâng Tông, Cấp Ẩm Căng Bóng 50ml', 'Beplain ', 'Daucus Carota Sativa (Carrot) Root Extract (chiết xuất Cà rốt tím) kết hợp cùng Allantoin: Giúp bổ sung độ ẩm và hỗ trợ làm dịu da. \r\nNiacinamide (Vitamin B3): Hỗ trợ nâng tone da, mang lại làn da sáng mịn và mềm mại.', 'images/kcnbeplain.jpg', '[\"images\\/kcnbeplain1.jpg\",\"images\\/kcnbeplain2.jpg\"]', 310000, ' Bảo vệ da khỏi nắng & lão hoá sớm. Nâng tone, làm đều màu da tự nhiên, hỗ trợ che phủ khuyết điểm nhỏ, tạo nền mịn cho makeup, giữ da thông thoáng, mềm mịn.', 'Sử dụng như bước cuối cùng trong quy trình chăm sóc da buổi sáng. \r\nApply lên mặt 15 phút trước khi ra ngoài. \r\nThoa lại sau mỗi 2 tiếng tiếp xúc trực tiếp dưới ánh nắng mặt trời.', 5),
(50, 'Kem Chống Nắng d\'Alba Nâng Tông Tím Hiệu Chỉnh Sắc Da 50ml', 'd\'Alba ', 'Chiết xuất nấm cục trắng (White Truffle): Được thu hoạch từ vùng Piedmont, Ý, chiết xuất này giàu chất chống oxy hóa, giúp cải thiện độ đàn hồi và làm mờ nếp nhăn, đồng thời cung cấp dưỡng chất cho làn da tươi trẻ.\r\nHoa lavender và rau má giúp dưỡng ẩm và làm dịu da khi tiếp xúc với ánh nắng mặt trời.\r\nCông thức đặc biệt này còn bổ sung nhiều thành phần dưỡng ẩm như Oligo HA và rượu vang Thụy Sĩ.\r\n\r\nChiết xuất Jeju Stellaria Media được bảo hộ bằng sáng chế, kết hợp với Niacinamide và Glutathione giúp chống oxy hóa và hỗ trợ dưỡng sáng, giúp da trở nên tươi tắn hơn.', 'images/kcndalba.jpg', '[\"images\\/kcndalba1.jpg\",\"images\\/kcndalba2.jpg\"]', 400000, 'Sản phẩm được công nhận là thuần chay 100%, không chỉ cung cấp khả năng bảo vệ da mạnh mẽ khỏi tác hại của tia UV mà còn giúp cải thiện độ săn chắc, mang lại làn da trẻ trung. Đồng thời, kem còn có tác dụng làm sáng và đều màu da, giúp da trở nên rạng rỡ hơn mỗi ngày.', 'Lấy lượng kem vừa đủ: \r\nSử dụng khoảng 1-2 hạt đậu xanh (1.5-2ml) cho mặt và cổ để đảm bảo hiệu quả bảo vệ tối ưu. \r\nThoa kem đúng thời điểm: \r\nThoa kem chống nắng ở bước cuối của quy trình dưỡng da buổi sáng, sau kem dưỡng ẩm và trước khi trang điểm (nếu có).\r\nThoa kem 20-30 phút trước khi ra nắng để sản phẩm thẩm thấu và phát huy tác dụng.\r\nCách thoa kem: \r\nChấm kem lên trán, mũi, cằm, hai má.\r\nVỗ nhẹ và tán đều kem theo chuyển động tròn bằng ngón tay hoặc lòng bàn tay, tránh chà xát mạnh. \r\nThoa đều khắp mặt, cổ, và các vùng da tiếp xúc với ánh nắng. ', 5),
(51, 'Sữa Chống Nắng Anessa Dưỡng Da Kiềm Dầu 20ml', 'Anessa ', 'Tinh chất Sun Essence: giúp dưỡng ẩm, chống oxy hóa và ngừa lão hóa da.', 'images/kcnanessa.jpg', '[\"images\\/kcnanessa1.jpg\",\"images\\/kcnanessa2.jpg\"]', 280000, 'Sản phẩm với công nghệ Auto Veil mới giúp cho lớp màng chống UV trở nên bền vững hơn khi gặp nhiệt độ cao, nước và ma sát.. Sản phẩm đặc biệt phù hợp với làn da thiên dầu, đồng thời chống trôi trong nước lên đến 80 phút, chống bụi mịn PM.25 và chống dính cát. Ngoài ra, sự bổ sung của phức hợp 50% thành phần dưỡng da giúp ngăn ngừa lão hoá do tia UV hiệu quả và nuôi dưỡng da ẩm mịn.', 'Lắc thật kỹ trước khi sử dụng.\r\nDùng sau bước dưỡng da buổi sáng, lấy một lượng vừa đủ ra tay và dàn đều lên toàn bộ khuôn mặt và vùng da cần được bảo vệ. \r\nĐể đạt hiệu quả cao nhất, nên thoa lại sau khi tiếp xúc nhiều với nước hoặc lau bằng khăn lau.\r\nLượng sử dụng: 2mg/1cm2 da.', 5),
(52, 'Nước Tẩy Trang Bioderma Dành Cho Da Nhạy Cảm 500ml', 'Bioderma ', 'Công nghệ Micellar: Các hạt micelle, có thành phần được lấy cảm hứng từ lipid của da, là những hạt làm sạch vô hình siêu nhỏ. Chúng có khả năng thu giữ các tạp chất trong khi vẫn duy trì lớp màng bảo vệ tự nhiên của da.\r\nSáng chế D.A.F.: Các tác động từ bên ngoài có thể làm cho da trở nên kích ứng và nhạy cảm. Hợp chất này giúp làm tăng khả năng dung nạp của làn da - bất kể đối với loại da nào - nhằm tăng cường sức đề kháng cho da.', 'images/nttbio.jpg', '[\"images\\/nttbio1.jpg\",\"images\\/nttbio2.jpg\"]', 400000, 'Nước Tẩy Trang Dành Cho Da Nhạy Cảm Bioderma Sensibio H20 là sản phẩm dạng nước có chứa các hạt micelle, tương thích hoàn hảo với làn da. Yếu tố cấu thành nên hạt micelle là các ester acid béo, tương tự như phospholipid của màng tế bào da và giúp tái tạo lớp màng hydrolipid của da một cách tự nhiên.', 'Thấm nước tẩy trang lên bông tẩy trang.\r\nNhẹ nhàng làm sạch vùng mặt và mắt.\r\nKhông cần rửa lại với nước.\r\nSử dụng vào hằng ngày để làm sạch da.', 8),
(53, 'Nước Tẩy Trang Bí Đao Cocoon Làm Sạch & Giảm Dầu 500ml', 'Cocoon ', 'Bí đao: Theo sách y học cổ truyền, bí đao có đặc tính làm mát, làm giảm nhiệt, giúp ngăn ngừa mụn trứng cá.\r\nRau má: Các hợp chất sinh học như axit axetic, asiaticoside, axit madecassic và madecassoside có trong rau má là những chất chính giúp tăng sinh collagen cho làn da, làm dịu các vết đỏ.\r\nTinh dầu tràm trà: Loại tinh dầu có mùi thơm ấm áp, cay nồng giúp ngăn ngừa mụn trứng cá, vết thương, côn trùng cắn.\r\nBetaine: là hoạt chất dưỡng ẩm được chiết xuất từ củ cải đường, có tác dụng bảo vệ tế bào da khỏi căng thẳng từ môi trường bên ngoài như bức xạ UV, ô nhiễm môi trường và tăng khả năng giữ ẩm cho da dưới tác động của nhiệt độ và khói bụi.\r\nO-Cymen-5-Ol và Cetylpyridinium chloride: Có khả năng ngăn ngừa các tác nhân gây mụn.\r\nNatraGem™ S150: Gồm tổ hợp chất Polyglyceryl-4 Laurate/Sebacate và Polyglyceryl-4 Caprylate/Caprate, sở hữu những ưu điểm vượt trội: có nguồn gốc 100% từ thực vật, được chứng nhận hữu cơ bởi Ecocert; có khả năng hòa tan những chất ưa dầu có trong các sản phẩm trang điểm, vì thế có khả năng làm sạch và cuốn trôi nhanh chóng lớp make up, bã nhờn và bụi bẩn trên da; khi so sánh với các chất làm sạch khác, tổ hợp chất này đã được chứng minh hạn chế gây mất nước qua da và rất an toàn trên làn da thông qua các bài test in-Vivo.', 'images/nttcocoon.jpg', '[\"images\\/nttcocoon1.jpg\",\"images\\/nttcocoon2.jpg\"]', 290000, 'Với công nghệ Micellar, nước tẩy trang bí đao giúp làm sạch hiệu quả lớp trang điểm, bụi bẩn và dầu thừa, mang lại làn da sạch hoàn toàn và dịu nhẹ,  cung cấp độ ẩm cho da.\r\n', 'Thấm đều sản phẩm lên bông tẩy trang, nhẹ nhàng lau khắp mặt để làm sạch lớp trang điểm và bụi bẩn. \r\nDịu nhẹ cho vùng môi và mắt.', 8),
(54, 'Nước Tẩy Trang La Roche-Posay 400ml', 'La Roche-Posay ', 'Công nghệ đột phá Glyco Micellar: làm sạch đến 99% lớp trang điểm, 70% mascara và các hạt bụi siêu nhỏ có trong khói xe và môi trường ô nhiễm chỉ sau một lượt bông cotton* nhưng vẫn an toàn cho làn da nhạy cảm.\r\nNước khoáng La Roche-Posay: có nồng độ Selenium tự nhiên cao giúp làm dịu da, giảm kích ứng và chống oxi hóa.\r\nGlycerin: cung cấp độ ẩm, giảm thiểu ma sát gây tổn thương da trong quá trình làm sạch.\r\nKhông paraben / Không chất tạo màu / Không cồn / Không chứa xà phòng.', 'images/nttposay.jpg', '[\"images\\/nttposay1.jpg\",\"images\\/nttposay2.jpg\"]', 450000, 'Dòng sản phẩm tẩy trang dành cho da mặt, vùng mắt và môi, ứng dụng công nghệ Glyco Micellar giúp làm sạch sâu lớp trang điểm và bụi bẩn, bã nhờn trên da vượt trội mà vẫn êm dịu, không gây căng rát hay kích ứng da; đồng thời cung cấp độ ẩm, mang đến làn da mềm mại & thoáng nhẹ sau khi sử dụng.  ', 'Cho nước tẩy trang La Roche-Posay Micellar Water Ultra Sensitive Skin ra bông cotton.\r\nĐầu tiên tẩy trang cho môi, sau đó đến mắt rồi đến phần còn lại của khuôn mặt.\r\nĐể đạt hiệu quả cao hơn và hạn chế chà xát, hãy giữ miếng bông trên da trong vài giây trước khi lau đi.\r\nLặp lại cho đến khi thấy miếng bông đã sạch hoàn toàn, không còn cặn bẩn.\r\nKhông cần rửa lại với nước.\r\nĐược khuyên dùng để làm sạch và tẩy trang nhẹ nhàng, an toàn cho mọi loại da.', 8);
INSERT INTO `sanpham` (`MaSP`, `TenSP`, `ThuongHieu`, `ThanhPhan`, `HinhAnh`, `CacHinhAnh`, `Gia`, `CongDung`, `HuongDanSD`, `MaDM`) VALUES
(55, 'Nước Tẩy Trang Garnier Dành Cho Da Dầu Và Mụn 400ml ', 'Garnier ', 'Công nghệ Micelles (Micellar Technology): phân tử Micelles lấy đi bụi bẩn sâu bên trong lỗ chân lông theo cơ chế hoạt động của nam châm khi lau nhẹ trên da mà không cần chà xát.\r\nThành phần BHA Salicylic Acid: Giúp kiểm soát dầu thừa và hỗ trợ cải thiện tình trạng mụn.\r\nKhông chứa hương liệu, không gây kích ứng da.', 'images/nttgarnier.jpg', '[\"images\\/nttgarnier1.jpg\",\"images\\/nttgarnier2.jpg\"]', 179000, 'Sử dụng công nghệ Micelles (Micellar Technology) có chứa các phân tử mi-xen hoạt động theo cơ chế nam châm giúp nhẹ nhàng làm sạch da và lấy đi bụi bẩn, cặn trang điểm và dầu thừa sâu bên trong lỗ chân lông mà không gây khô da.', 'Đổ Nước Tẩy Trang Garnier thấm ướt vừa đủ lên miếng bông tẩy trang (đối với sản phẩm Nước Tẩy Trang Garnier Micellar Oil Infused Cleansing Wate bạn cần lắc đều để 2 lớp dầu và dung dịch nước tẩy trang hoà vào nhau trước khi thấm ra miếng bông).\r\nNhẹ nhàng lau từ trong ra ngoài, từ dưới lên trên để tránh chảy xệ da mặt, hãy nhớ lau cả vùng cổ.\r\nRiêng đối với vùng mắt, bạn hãy giữ miếng bông tẩy trang trên mắt vài giây để nước tẩy trang thấm sâu và cuốn đi lớp make-up dễ dàng hơn.\r\nSau khi tẩy trang bạn không cần thiết phải rửa lại với nước. Tuy nhiên, bạn cũng có thể dùng sản phẩm sữa rửa mặt dịu nhẹ yêu thích của bạn để nhẹ nhàng làm sạch da một lần nữa.\r\nTiếp tục các bước dưỡng da tiếp theo trong chu trình skincare của bạn.\r\nVì sản phẩm Micellar Cleansing Water an toàn và lành tính cho da nên dùng hằng ngày ngay cả khi không trang điểm.', 8),
(56, 'Nước Tẩy Trang Simple 400ml', 'Simple ', 'Công nghệ làm sạch Micellar: với hàng triệu phân tử Micelles thông minh giúp nhẹ nhàng làm sạch bụi bẩn, dầu thừa trên da, lớp trang điểm kể cả sản phẩm chống thấm nước.\r\nHoa cúc La Mã Chamomile giúp làm dịu và phục hồi da hiệu quả.\r\nNước tinh khiết được lọc 3 lần: cực kì dịu nhẹ và an toàn cho làn da nhạy cảm, hỗ trợ làm dịu da.\r\nVitamin B3 và Vitamin C: có khả năng chống oxy hóa, làm dịu da, giảm viêm sưng và dưỡng da sáng mịn màng.', 'images/nttsimple.jpg', '[\"images\\/nttsimple1.jpg\",\"images\\/nttsimple2.jpg\"]', 156000, 'Công thức cải tiến với công nghệ làm sạch Micellar chứa hàng triệu bong bóng Micelles thông minh giúp loại bỏ lớp trang điểm và bụi bẩn hiệu quả, làm thông thoáng lỗ chân lông, mang lại cảm giác tươi mát cho da sau khi sử dụng, đồng thời cấp ẩm lên đến 4 giờ mà không để lại dư lượng thừa trên da.', 'Thấm nước tẩy trang vào bông cotton và nhẹ nhàng lau khắp mặt, hạn chế chà xát da, tránh dính vào mắt, nếu dính vào mắt cần rửa kỹ lại bằng nước.\r\nSau khi tẩy trang, dùng sữa rửa mặt và toner để làm sạch da tốt nhất có thể và dùng tiếp các bước tiếp theo của chu trình dưỡng da.', 8),
(57, 'Nước Tẩy Trang Neutrogena 400ml', 'Neutrogena ', 'Hạt micelles siêu bé có thể hút được dầu thừa và các chất bẩn nằm dưới lỗ chân lông mà vẫn nhẹ nhàng không gây tổn thương da.\r\nThành phần chủ yếu là nước và các chất có lợi cho da, khá lành tính và an toàn.\r\nNước micellar làm sạch và phục hồi làn da bằng cách loại bỏ lớp trang điểm khó trôi nhất, thậm chí cả mascara không thấm nước, đồng thời loại bỏ bụi bẩn và dầu thừa bị mắc kẹt một cách hiệu quả mà không để lại cặn nhờn. \r\n', 'images/nttneu.jpg', '[\"images\\/nttneu1.jpg\",\"images\\/nttneu2.jpg\"]', 139000, 'Với công nghệ cải tiến Triple Micellar mang đến bước làm sạch 7 trong 1, giúp loại bỏ lớp trang điểm và bụi bẩn cứng đầu mà phương pháp làm sạch thông thường không làm được, mang đến làn da sạch, tươi mát.', 'Làm ướt bông với nước tẩy trang.\r\nNhẹ nhàng lau vùng da mặt và mắt.\r\nGiữ bông 5-10 giây trên vùng da mắt trước khi lau đi (lưu ý nhớ nhắm mắt).\r\nNên sử dụng kèm Sữa rửa mặt Neutrogena để tối ưu hiệu quả.', 8),
(58, 'Nước Tẩy Trang Caryophy 500ml', 'Caryophy ', 'Citric Acid: Là một dạng AHA giúp loại bỏ tế bào chết, dầu thừa, bã nhờn, giữ da thông thoáng\r\nChiết xuất rau sam: Hỗ trợ giảm viêm, tăng khả năng phục hồi, củng cố hàng rào bảo vệ da\r\nChiết xuất rau má: Hạn chế viêm nhiễm, làm dịu da và chống oxy hóa\r\nAsiaticoside, Madecassic Acid, Asiatic Acdi, Madecassoside: Nhóm hợp chất hỗ trợ kháng khuẩn', 'images/nttcary.jpg', '[\"images\\/nttcary1.jpg\",\"images\\/nttcary2.jpg\"]', 250000, 'Sản phẩm tẩy trang làm sạch dành cho da dầu mụn và da nhạy cảm thuộc thương hiệu Caryophy (Hàn Quốc). Công thức sản phẩm an toàn & lành tính, dịu nhẹ cho làn da nhạy cảm, với các chiết xuất thiên nhiên như Rau Sam, Rau Má và thành phần độc đáo Citric Acid giúp làm sạch da tối ưu và hỗ trợ kháng khuẩn, kháng viêm, ngăn ngừa mụn và làm dịu da, giải tỏa căng thẳng trên da.', 'Thấm nước tẩy trang vào bông cotton\r\nLau nhẹ nhàng toàn bộ khuôn mặt và cổ theo chiều từ trong ra ngoài\r\nVới vùng mắt và môi, giữ bông vài giây rồi lau nhẹ để làm sạch hiệu quả hơn', 8);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham_loaida`
--

CREATE TABLE `sanpham_loaida` (
  `MaSP` int(11) NOT NULL,
  `MaLoaiDa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sanpham_loaida`
--

INSERT INTO `sanpham_loaida` (`MaSP`, `MaLoaiDa`) VALUES
(11, 4),
(12, 4),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(17, 5),
(17, 10),
(18, 1),
(18, 2),
(18, 3),
(18, 4),
(18, 5),
(18, 10),
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(19, 5),
(19, 10),
(20, 4),
(21, 2),
(22, 1),
(22, 4),
(22, 5),
(23, 1),
(23, 2),
(23, 3),
(23, 4),
(23, 5),
(23, 10),
(24, 5),
(25, 4),
(26, 4),
(27, 2),
(28, 1),
(28, 2),
(28, 3),
(28, 4),
(28, 5),
(28, 10),
(29, 4),
(30, 1),
(30, 2),
(30, 3),
(30, 4),
(30, 5),
(30, 10),
(31, 1),
(31, 2),
(31, 3),
(31, 4),
(31, 5),
(31, 10),
(32, 1),
(32, 5),
(33, 1),
(33, 2),
(33, 3),
(33, 4),
(33, 5),
(33, 10),
(34, 1),
(34, 5),
(35, 1),
(35, 2),
(35, 3),
(35, 4),
(35, 5),
(35, 10),
(36, 1),
(36, 2),
(36, 3),
(36, 4),
(36, 5),
(36, 10),
(37, 4),
(38, 4),
(39, 1),
(39, 2),
(39, 3),
(39, 4),
(39, 5),
(39, 10),
(40, 2),
(41, 1),
(41, 2),
(41, 3),
(41, 4),
(41, 5),
(41, 10),
(42, 2),
(42, 4),
(43, 1),
(43, 2),
(43, 3),
(43, 4),
(43, 5),
(43, 10),
(44, 1),
(44, 2),
(44, 3),
(44, 4),
(44, 5),
(44, 10),
(45, 1),
(45, 2),
(45, 3),
(45, 4),
(45, 5),
(45, 10),
(46, 1),
(46, 3),
(47, 1),
(47, 2),
(47, 3),
(47, 4),
(47, 5),
(47, 10),
(48, 1),
(48, 3),
(49, 1),
(49, 2),
(49, 3),
(49, 4),
(49, 5),
(49, 10),
(50, 1),
(50, 2),
(50, 3),
(50, 4),
(50, 5),
(50, 10),
(51, 1),
(52, 4),
(53, 1),
(53, 3),
(53, 5),
(54, 1),
(54, 2),
(54, 3),
(54, 4),
(54, 5),
(54, 10),
(55, 1),
(55, 5),
(56, 4),
(57, 1),
(57, 2),
(57, 3),
(57, 4),
(57, 5),
(57, 10),
(58, 1),
(58, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tuvan`
--

CREATE TABLE `tuvan` (
  `MaTuVan` int(11) NOT NULL,
  `Ten` varchar(100) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `VanDeDa` text DEFAULT NULL,
  `MucDo` varchar(50) DEFAULT NULL,
  `NoiDungKhac` text DEFAULT NULL,
  `ThoiGian` datetime DEFAULT current_timestamp(),
  `MaLoaiDa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tuvan`
--

INSERT INTO `tuvan` (`MaTuVan`, `Ten`, `Email`, `VanDeDa`, `MucDo`, `NoiDungKhac`, `ThoiGian`, `MaLoaiDa`) VALUES
(7, 'triệu vi', '', 'mụn', NULL, NULL, '2025-12-21 17:41:49', 2),
(8, 'VI', '', 'ghgg', NULL, NULL, '2025-12-23 19:16:03', 1),
(9, 'vivi', '', 'da mujn', NULL, NULL, '2025-12-30 23:34:42', 2),
(10, 'vivi', '', 'aaaa', NULL, NULL, '2025-12-31 12:14:37', 3),
(11, 'h7u', '', 'da daau', NULL, NULL, '2025-12-31 12:19:42', 3),
(12, 'vivi', 'aaa@gmail.com', 'Da kích ứng', NULL, NULL, '2026-01-03 01:37:24', 1),
(13, 'vivi', 'aa@gmail.com', 'Mụn đầu đen', 'Trung bình', NULL, '2026-01-03 01:53:56', 1),
(14, 'trieuvi', 'trieuvi@gmail.com', 'Mụn đầu đen, Lỗ chân lông to', 'Nhẹ', NULL, '2026-01-03 01:54:27', 1),
(15, 'trieuvi', 'trieuvi@gmail.com', 'Mụn đầu đen, Lỗ chân lông to', 'Nhẹ', NULL, '2026-01-03 01:55:37', 1),
(16, 'trieuvi', 'trieuvi@gmail.com', 'Mụn đầu đen, Lỗ chân lông to', 'Nhẹ', NULL, '2026-01-03 01:55:53', 1),
(17, 'trieuvi', 'aaa@gmail.com', 'Da kích ứng', 'Trung bình', NULL, '2026-01-03 02:01:26', 5),
(18, 'vivi', 'aaa@gmail.com', 'Lỗ chân lông to', 'Trung bình', '', '2026-01-03 02:15:14', 1),
(19, 'trieuvi', 'aaa@gmail.com', 'Da kích ứng', 'Nặng', 'tôi muốn biết nhanh', '2026-01-03 02:20:46', 5),
(20, 'trieuvi', 'aaa@gmail.com', 'Da sần sùi', 'Nhẹ', '', '2026-01-03 02:29:26', 10),
(21, 'trieuvi', 'trieuvi180403@gmail.com', 'Da kích ứng', 'Trung bình', '', '2026-01-03 03:00:38', 3),
(22, 'trieuvi', 'trieuvi180403@gmail.com', 'Mụn đầu đen', 'Nhẹ', 'aa', '2026-01-04 23:08:53', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `danhmucsp`
--
ALTER TABLE `danhmucsp`
  ADD PRIMARY KEY (`MaDM`);

--
-- Indexes for table `loaida`
--
ALTER TABLE `loaida`
  ADD PRIMARY KEY (`MaLoaiDa`);

--
-- Indexes for table `quantri`
--
ALTER TABLE `quantri`
  ADD PRIMARY KEY (`MaQT`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`),
  ADD KEY `MaDM` (`MaDM`);

--
-- Indexes for table `sanpham_loaida`
--
ALTER TABLE `sanpham_loaida`
  ADD PRIMARY KEY (`MaSP`,`MaLoaiDa`),
  ADD KEY `MaLoaiDa` (`MaLoaiDa`);

--
-- Indexes for table `tuvan`
--
ALTER TABLE `tuvan`
  ADD PRIMARY KEY (`MaTuVan`),
  ADD KEY `MaLoaiDa` (`MaLoaiDa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `danhmucsp`
--
ALTER TABLE `danhmucsp`
  MODIFY `MaDM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `loaida`
--
ALTER TABLE `loaida`
  MODIFY `MaLoaiDa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `quantri`
--
ALTER TABLE `quantri`
  MODIFY `MaQT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tuvan`
--
ALTER TABLE `tuvan`
  MODIFY `MaTuVan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`MaDM`) REFERENCES `danhmucsp` (`MaDM`);

--
-- Constraints for table `sanpham_loaida`
--
ALTER TABLE `sanpham_loaida`
  ADD CONSTRAINT `sanpham_loaida_ibfk_1` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE CASCADE,
  ADD CONSTRAINT `sanpham_loaida_ibfk_2` FOREIGN KEY (`MaLoaiDa`) REFERENCES `loaida` (`MaLoaiDa`) ON DELETE CASCADE;

--
-- Constraints for table `tuvan`
--
ALTER TABLE `tuvan`
  ADD CONSTRAINT `tuvan_ibfk_1` FOREIGN KEY (`MaLoaiDa`) REFERENCES `loaida` (`MaLoaiDa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
