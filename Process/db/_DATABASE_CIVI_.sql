-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 14, 2021 lúc 02:35 PM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `beustore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdathang`
--

CREATE TABLE `chitietdathang` (
  `MaChiTiet` int(11) NOT NULL,
  `SoDonDH` int(11) NOT NULL,
  `MSHH` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `GiaTien` int(11) NOT NULL,
  `GiamGia` int(11) DEFAULT NULL,
  `ThanhTien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdathang`
--

INSERT INTO `chitietdathang` (`MaChiTiet`, `SoDonDH`, `MSHH`, `SoLuong`, `GiaTien`, `GiamGia`, `ThanhTien`) VALUES
(1, 1, 1, 2, 3290000, 0, 6580000),
(2, 2, 7, 1, 6290000, 20, 5032000),
(3, 3, 4, 2, 9690000, 0, 19380000),
(4, 3, 3, 1, 5590000, 0, 5590000),
(5, 12, 1, 2, 3290000, 0, 6580000),
(6, 12, 5, 4, 1490000, 0, 5960000),
(7, 12, 4, 1, 9690000, 0, 9690000),
(8, 12, 3, 2, 5590000, 0, 11180000),
(9, 13, 1, 2, 3290000, 0, 6580000),
(10, 13, 5, 4, 1490000, 0, 5960000),
(11, 13, 4, 1, 9690000, 0, 9690000),
(12, 13, 3, 2, 5590000, 0, 11180000),
(13, 14, 6, 1, 1605500, 5, 1605500),
(14, 15, 6, 2, 1690000, 5, 3380000),
(15, 16, 7, 2, 6290000, 0, 12580000),
(16, 17, 6, 3, 1352000, 20, 4056000),
(17, 18, 1, 1, 3290000, 0, 3290000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietnhaphang`
--

CREATE TABLE `chitietnhaphang` (
  `SoDonNhapHang` int(11) NOT NULL,
  `MSHH` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `DonGiaNhap` int(11) NOT NULL,
  `ThanhTien` int(11) NOT NULL,
  `NoiSanXuat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dathang`
--

CREATE TABLE `dathang` (
  `SoDonDH` int(11) NOT NULL,
  `TaiKhoanKH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MSNV` int(11) DEFAULT NULL,
  `TongCong` int(11) NOT NULL,
  `NgayDH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NgayGH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TrangThaiDH` int(11) NOT NULL,
  `DiaChi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PTThanhToan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `dathang`
--

INSERT INTO `dathang` (`SoDonDH`, `TaiKhoanKH`, `MSNV`, `TongCong`, `NgayDH`, `NgayGH`, `TrangThaiDH`, `DiaChi`, `PTThanhToan`) VALUES
(1, 'Quoc', 2, 6580000, '22/11/2021', '27/12/2021', 1, 'Hồ Chí Minh', 1),
(2, 'Bun', 2, 5032000, '31/1/2021', '1/4/2021', 2, 'Cần Thơ', 1),
(3, 'Quoc', 0, 24970000, '11/11/2021', '12/12/2021', 3, 'Hồ Chí Minh', 1),
(12, 'Quoc', 2, 20090000, '20/11/2021', '1/12/2021', 3, 'Hồ Chí Minh', 1),
(13, 'Quoc', 0, 20090000, '20/11/2021', '1/12/2021', 4, 'Hồ Chí Minh', 1),
(14, 'Quoc', 2, 1635500, '21/11/2021', '2/12/2021', 2, 'Hồ Chí Minh', 1),
(15, 'Bun', 0, 1720000, '22/11/2021', '3/12/2021', 4, 'Cần Thơ', 1),
(16, 'Bun', 0, 6320000, '23/11/2021', '4/12/2021', 3, 'Cần Thơ', 1),
(17, 'ChucThay', 4, 1382000, '26/11/2021', '7/12/2021', 3, 'Khu II, Đ. 3/2, Xuân Khánh, Ninh Kiều, Cần Thơ', 1),
(18, 'ChucThay', 0, 3320000, '28/11/2021', '9/12/2021', 4, 'Cần Thơ', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diachikh`
--

CREATE TABLE `diachikh` (
  `MaDC` int(11) NOT NULL,
  `DiaChi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MSKH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `diachikh`
--

INSERT INTO `diachikh` (`MaDC`, `DiaChi`, `MSKH`) VALUES
(1, 'Hồ Chí Minh', 1),
(13, 'Cần Thơ', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diemgame`
--

CREATE TABLE `diemgame` (
  `MaGame` int(11) NOT NULL,
  `MSKH` int(11) NOT NULL,
  `Diem` int(11) NOT NULL,
  `NgayChoi` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `game`
--

CREATE TABLE `game` (
  `MaGame` int(11) NOT NULL,
  `TenGame` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `MaGio` int(11) NOT NULL,
  `TaiKhoanKH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MSHH` int(11) NOT NULL,
  `TenHangHoa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Gia` int(50) NOT NULL,
  `SoLuong` int(10) NOT NULL,
  `PhanLoai` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`MaGio`, `TaiKhoanKH`, `MSHH`, `TenHangHoa`, `Gia`, `SoLuong`, `PhanLoai`) VALUES
(27, 'Quoc', 3, 'AMD Ryzen 5 3600 / 32MB / 4.2GHz / 6 nhân 12 luồng / AM4', 5310500, 1, 'Chip AMD'),
(28, 'Quoc', 8, 'MSI GeForce GTX 1650 SUPER GAMING X 4GB', 8490000, 1, 'GTX 1650 super');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hanghoa`
--

CREATE TABLE `hanghoa` (
  `MSHH` int(11) NOT NULL,
  `TenHH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `QuyCach` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `GiaNhap` int(11) NOT NULL,
  `Gia` int(11) NOT NULL,
  `SoLuongHang` int(11) NOT NULL,
  `MaLoaiHang` int(11) NOT NULL,
  `GiamGia` int(4) NOT NULL DEFAULT 0,
  `LoaiSanPham` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HangHangHoa` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NoiSXHangHoa` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TinhTrang` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Mới',
  `BaoHanh` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Đang cập nhật',
  `DacBiet` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Không'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hanghoa`
--

INSERT INTO `hanghoa` (`MSHH`, `TenHH`, `QuyCach`, `GiaNhap`, `Gia`, `SoLuongHang`, `MaLoaiHang`, `GiamGia`, `LoaiSanPham`, `HangHangHoa`, `NoiSXHangHoa`, `TinhTrang`, `BaoHanh`, `DacBiet`) VALUES
(1, 'ASUS TUF GAMING B460M-PRO', 'món', 0, 3290000, 101, 2, 0, 'Mainboard B460', 'ASUS', 'Đài Loan', 'Mới', 'Đang cập nhật', 'Không'),
(2, 'MSI MAG B560M MORTAR WIFI', 'món', 0, 4490000, 100, 2, 0, 'Mainboard B560M', 'MSI', 'Đài Loan', 'Mới', 'Đang cập nhật', 'Hỗ trợ kết nối wifi'),
(3, 'AMD Ryzen 5 3600 / 32MB / 4.2GHz / 6 nhân 12 luồng / AM4', 'món', 0, 5590000, 100, 1, 5, 'Chip AMD', 'AMD', 'Mỹ', 'Mới', 'Đang cập nhật', 'Không'),
(4, 'Intel Core i7 10700 / 4.8GHz / 8 Nhân 16 Luồng', 'món', 0, 9690000, 100, 1, 0, 'Chip Intel', 'INTEL', 'Mỹ', 'Mới', 'Đang cập nhật', 'Không'),
(5, '(8GB DDR4 1x8G 2666) RAM Kingston HyperX Fury Black', 'món', 0, 1490000, 100, 3, 34, 'RAM 8GB DDR4', 'Kingston', 'Mỹ', 'Mới', 'Đang cập nhật', 'Không'),
(6, '(8GB DDR4 1x8G 3000) RAM G.SKILL Trident Z RGB CL16-18-18-38', 'món', 0, 1690000, 100, 3, 20, 'RAM 8GB DDR4', 'GSKILL', 'Đài Loan', 'Mới', 'Đang cập nhật', 'Led RGB'),
(7, 'GIGABYTE GeForce GTX 1050 Ti D5 4GB', 'món', 0, 6790000, 100, 4, 12, 'GTX 1050ti', 'GIGABYTE', 'Đài Loan', 'Mới', 'Đang cập nhật', 'Phiên bản nâng cấp từ 1050'),
(8, 'MSI GeForce GTX 1650 SUPER GAMING X 4GB', 'món', 0, 8490000, 100, 4, 0, 'GTX 1650 super', 'MSI', 'Đài Loan', 'Mới', 'Đang cập nhật', 'Card chuyên dụng cho gaming');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinhhanghoa`
--

CREATE TABLE `hinhhanghoa` (
  `MaHinh` int(11) NOT NULL,
  `TenHinh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MSHH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hinhhanghoa`
--

INSERT INTO `hinhhanghoa` (`MaHinh`, `TenHinh`, `MSHH`) VALUES
(1, 'asus-tuf-gaming-b460m-pro.png', 1),
(2, 'msi-mag-b560m-mortar-wifi.png', 2),
(3, 'amd-ryzen-5-3600.png', 3),
(4, 'intel-core-i7-10700.png', 4),
(5, 'ram-kingston-hyperx-fury-black.png', 5),
(6, 'ram-g-kill-trident-z-rgb.png', 6),
(7, 'gigabyte-geforce-gtx-1050-ti-d5-4gb.png', 7),
(8, 'msi-gtx-1650-super-gaming-x-4gb.png', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MSKH` int(11) NOT NULL,
  `TaiKhoanKH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MatKhauKH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HoTenKH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TenCongTy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SoDienThoai` int(11) NOT NULL,
  `SoFax` int(11) DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `DOB` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `GioiTinh` varchar(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MSKH`, `TaiKhoanKH`, `MatKhauKH`, `HoTenKH`, `TenCongTy`, `SoDienThoai`, `SoFax`, `Email`, `DOB`, `GioiTinh`) VALUES
(1, 'Quoc', 'Quoc123', 'Quốc Nguyễn', 'Thanh Company', 123, 0, 'quoc@gmail.com', '22/11/2000', 'Nam'),
(2, 'Bun', 'Bun321', 'Bún Măng', NULL, 321, NULL, 'Bunsx@gmail.com', '27/12/2000', 'Nữ'),
(3, 'Thanh', 'Thanh964594', 'Nguyễn Đình Thanh', NULL, 767732712, NULL, 'qsczsemko@gmail.com', '27/12/2000', 'Nam'),
(26, 'ChucThay', 'ThayTrungnumber1', 'Ngày mới tốt lành', NULL, 918058139, NULL, 'thanhb1805813@student.ctu.edu.vn', '2021-11-27', 'Nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichsutimkiem`
--

CREATE TABLE `lichsutimkiem` (
  `MaLichSu` int(11) NOT NULL,
  `MSKH` int(11) NOT NULL,
  `LichSu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lichsutimkiem`
--

INSERT INTO `lichsutimkiem` (`MaLichSu`, `MSKH`, `LichSu`) VALUES
(1, 1, 'Mainboard B360'),
(2, 1, 'Ram 8gb'),
(3, 1, 'VGA 1080'),
(7, 1, 'mainboard'),
(8, 1, 'mainboard'),
(9, 1, 'led RGB'),
(10, 1, 'led'),
(11, 1, 'led'),
(12, 1, 'led'),
(13, 1, 'ram 8gb'),
(14, 1, 'ram 8gb'),
(15, 26, 'led'),
(16, 26, 'led'),
(17, 26, 'led'),
(18, 26, 'led'),
(19, 26, 'led'),
(20, 26, 'ram 8gb'),
(21, 26, 'led rgb'),
(22, 26, 'ram 8gb'),
(23, 26, 'led rgb'),
(24, 26, 'ram 8gb'),
(25, 26, 'led rgb'),
(26, 1, 'Led RGB'),
(27, 1, 'ram'),
(28, 1, 'core'),
(29, 1, 'ry'),
(30, 1, 'amd');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaihanghoa`
--

CREATE TABLE `loaihanghoa` (
  `MaLoaiHang` int(11) NOT NULL,
  `TenLoaiHang` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaihanghoa`
--

INSERT INTO `loaihanghoa` (`MaLoaiHang`, `TenLoaiHang`) VALUES
(1, 'Chip'),
(2, 'MainBoard'),
(3, 'Ram'),
(4, 'VGA');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MSNV` int(11) NOT NULL,
  `TaiKhoanNV` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MatKhauNV` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HoTenNV` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ChucVu` int(11) NOT NULL DEFAULT 3,
  `DiaChi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SoDienThoai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MSNV`, `TaiKhoanNV`, `MatKhauNV`, `HoTenNV`, `ChucVu`, `DiaChi`, `SoDienThoai`) VALUES
(0, 'HT', 'HTBeUSTORE@5813', 'HT', 0, 'HT', 0),
(1, 'Admin', 'Admin', 'Admin', 1, 'Admin', 113),
(2, 'Thanh', 'Thanh123', 'Nguyễn Đình Thanh', 2, 'Cần Thơ', 964594),
(4, 'ThayTrungAdmin', 'ThayTrungAdmin', 'Thầy Trung', 1, 'Cần Thơ', 118058130);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhaphanghoa`
--

CREATE TABLE `nhaphanghoa` (
  `SoDonNhapHang` int(11) NOT NULL,
  `NgayNhap` varchar(20) NOT NULL,
  `MSNV` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phuongthucthanhtoan`
--

CREATE TABLE `phuongthucthanhtoan` (
  `MaPT` int(11) NOT NULL,
  `TenPT` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `phuongthucthanhtoan`
--

INSERT INTO `phuongthucthanhtoan` (`MaPT`, `TenPT`) VALUES
(1, 'Thanh toán khi nhận '),
(2, 'Chuyển khoản ngân hà');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanphamyeuthich`
--

CREATE TABLE `sanphamyeuthich` (
  `MSKH` int(11) NOT NULL,
  `MSHH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanphamyeuthich`
--

INSERT INTO `sanphamyeuthich` (`MSKH`, `MSHH`) VALUES
(1, 2),
(1, 8),
(2, 2),
(2, 5),
(2, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher`
--

CREATE TABLE `voucher` (
  `MSVoucher` int(11) NOT NULL,
  `TenVoucher` varchar(20) NOT NULL,
  `GiaTri` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucherkh`
--

CREATE TABLE `voucherkh` (
  `MSKH` int(11) NOT NULL,
  `MSVoucher` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitietdathang`
--
ALTER TABLE `chitietdathang`
  ADD PRIMARY KEY (`MaChiTiet`),
  ADD KEY `SoDonDH` (`SoDonDH`),
  ADD KEY `MSHH` (`MSHH`);

--
-- Chỉ mục cho bảng `chitietnhaphang`
--
ALTER TABLE `chitietnhaphang`
  ADD KEY `MSHH` (`MSHH`),
  ADD KEY `SoDonNhapHang` (`SoDonNhapHang`);

--
-- Chỉ mục cho bảng `dathang`
--
ALTER TABLE `dathang`
  ADD PRIMARY KEY (`SoDonDH`),
  ADD KEY `TaiKhoanKH` (`TaiKhoanKH`),
  ADD KEY `MSNV` (`MSNV`),
  ADD KEY `PTThanhToan` (`PTThanhToan`);

--
-- Chỉ mục cho bảng `diachikh`
--
ALTER TABLE `diachikh`
  ADD PRIMARY KEY (`MaDC`),
  ADD KEY `MSKH` (`MSKH`);

--
-- Chỉ mục cho bảng `diemgame`
--
ALTER TABLE `diemgame`
  ADD KEY `MSKH` (`MSKH`),
  ADD KEY `MaGame` (`MaGame`);

--
-- Chỉ mục cho bảng `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`MaGame`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`MaGio`),
  ADD KEY `TaiKhoanKH` (`TaiKhoanKH`),
  ADD KEY `MSHH` (`MSHH`);

--
-- Chỉ mục cho bảng `hanghoa`
--
ALTER TABLE `hanghoa`
  ADD PRIMARY KEY (`MSHH`),
  ADD KEY `MaLoaiHang` (`MaLoaiHang`);

--
-- Chỉ mục cho bảng `hinhhanghoa`
--
ALTER TABLE `hinhhanghoa`
  ADD PRIMARY KEY (`MaHinh`),
  ADD KEY `MSHH` (`MSHH`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MSKH`),
  ADD UNIQUE KEY `TaiKhoanKH` (`TaiKhoanKH`);

--
-- Chỉ mục cho bảng `lichsutimkiem`
--
ALTER TABLE `lichsutimkiem`
  ADD PRIMARY KEY (`MaLichSu`),
  ADD KEY `MSKH` (`MSKH`);

--
-- Chỉ mục cho bảng `loaihanghoa`
--
ALTER TABLE `loaihanghoa`
  ADD PRIMARY KEY (`MaLoaiHang`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MSNV`);

--
-- Chỉ mục cho bảng `nhaphanghoa`
--
ALTER TABLE `nhaphanghoa`
  ADD PRIMARY KEY (`SoDonNhapHang`),
  ADD KEY `MSNV` (`MSNV`);

--
-- Chỉ mục cho bảng `phuongthucthanhtoan`
--
ALTER TABLE `phuongthucthanhtoan`
  ADD PRIMARY KEY (`MaPT`);

--
-- Chỉ mục cho bảng `sanphamyeuthich`
--
ALTER TABLE `sanphamyeuthich`
  ADD KEY `MSKH` (`MSKH`),
  ADD KEY `MSHH` (`MSHH`);

--
-- Chỉ mục cho bảng `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`MSVoucher`);

--
-- Chỉ mục cho bảng `voucherkh`
--
ALTER TABLE `voucherkh`
  ADD KEY `MSKH` (`MSKH`),
  ADD KEY `vouckh_ibfk_2` (`MSVoucher`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitietdathang`
--
ALTER TABLE `chitietdathang`
  MODIFY `MaChiTiet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `dathang`
--
ALTER TABLE `dathang`
  MODIFY `SoDonDH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `diachikh`
--
ALTER TABLE `diachikh`
  MODIFY `MaDC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `game`
--
ALTER TABLE `game`
  MODIFY `MaGame` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `MaGio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `hanghoa`
--
ALTER TABLE `hanghoa`
  MODIFY `MSHH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `hinhhanghoa`
--
ALTER TABLE `hinhhanghoa`
  MODIFY `MaHinh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MSKH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `lichsutimkiem`
--
ALTER TABLE `lichsutimkiem`
  MODIFY `MaLichSu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `loaihanghoa`
--
ALTER TABLE `loaihanghoa`
  MODIFY `MaLoaiHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MSNV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `nhaphanghoa`
--
ALTER TABLE `nhaphanghoa`
  MODIFY `SoDonNhapHang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `phuongthucthanhtoan`
--
ALTER TABLE `phuongthucthanhtoan`
  MODIFY `MaPT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `voucher`
--
ALTER TABLE `voucher`
  MODIFY `MSVoucher` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitietdathang`
--
ALTER TABLE `chitietdathang`
  ADD CONSTRAINT `chitietdathang_ibfk_1` FOREIGN KEY (`SoDonDH`) REFERENCES `dathang` (`SoDonDH`),
  ADD CONSTRAINT `chitietdathang_ibfk_2` FOREIGN KEY (`MSHH`) REFERENCES `hanghoa` (`MSHH`);

--
-- Các ràng buộc cho bảng `chitietnhaphang`
--
ALTER TABLE `chitietnhaphang`
  ADD CONSTRAINT `chitietnhaphang_ibfk_1` FOREIGN KEY (`MSHH`) REFERENCES `hanghoa` (`MSHH`),
  ADD CONSTRAINT `chitietnhaphang_ibfk_2` FOREIGN KEY (`SoDonNhapHang`) REFERENCES `nhaphanghoa` (`SoDonNhapHang`);

--
-- Các ràng buộc cho bảng `dathang`
--
ALTER TABLE `dathang`
  ADD CONSTRAINT `dathang_ibfk_1` FOREIGN KEY (`TaiKhoanKH`) REFERENCES `khachhang` (`TaiKhoanKH`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dathang_ibfk_2` FOREIGN KEY (`MSNV`) REFERENCES `nhanvien` (`MSNV`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dathang_ibfk_3` FOREIGN KEY (`PTThanhToan`) REFERENCES `phuongthucthanhtoan` (`MaPT`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `diachikh`
--
ALTER TABLE `diachikh`
  ADD CONSTRAINT `diachikh_ibfk_1` FOREIGN KEY (`MSKH`) REFERENCES `khachhang` (`MSKH`);

--
-- Các ràng buộc cho bảng `diemgame`
--
ALTER TABLE `diemgame`
  ADD CONSTRAINT `diemgame_ibfk_1` FOREIGN KEY (`MSKH`) REFERENCES `khachhang` (`MSKH`),
  ADD CONSTRAINT `diemgame_ibfk_2` FOREIGN KEY (`MaGame`) REFERENCES `game` (`MaGame`);

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`MSHH`) REFERENCES `hanghoa` (`MSHH`);

--
-- Các ràng buộc cho bảng `hanghoa`
--
ALTER TABLE `hanghoa`
  ADD CONSTRAINT `hanghoa_ibfk_1` FOREIGN KEY (`MaLoaiHang`) REFERENCES `loaihanghoa` (`MaLoaiHang`);

--
-- Các ràng buộc cho bảng `hinhhanghoa`
--
ALTER TABLE `hinhhanghoa`
  ADD CONSTRAINT `hinhhanghoa_ibfk_1` FOREIGN KEY (`MSHH`) REFERENCES `hanghoa` (`MSHH`);

--
-- Các ràng buộc cho bảng `lichsutimkiem`
--
ALTER TABLE `lichsutimkiem`
  ADD CONSTRAINT `lichsutimkiem_ibfk_1` FOREIGN KEY (`MSKH`) REFERENCES `khachhang` (`MSKH`);

--
-- Các ràng buộc cho bảng `nhaphanghoa`
--
ALTER TABLE `nhaphanghoa`
  ADD CONSTRAINT `nhaphanghoa_ibfk_1` FOREIGN KEY (`MSNV`) REFERENCES `nhanvien` (`MSNV`);

--
-- Các ràng buộc cho bảng `sanphamyeuthich`
--
ALTER TABLE `sanphamyeuthich`
  ADD CONSTRAINT `sanphamyeuthich_ibfk_1` FOREIGN KEY (`MSKH`) REFERENCES `khachhang` (`MSKH`),
  ADD CONSTRAINT `sanphamyeuthich_ibfk_2` FOREIGN KEY (`MSHH`) REFERENCES `hanghoa` (`MSHH`);

--
-- Các ràng buộc cho bảng `voucherkh`
--
ALTER TABLE `voucherkh`
  ADD CONSTRAINT `voucherkh_ibfk_1` FOREIGN KEY (`MSKH`) REFERENCES `khachhang` (`MSKH`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `voucherkh_ibfk_2` FOREIGN KEY (`MSVoucher`) REFERENCES `voucher` (`MSVoucher`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;