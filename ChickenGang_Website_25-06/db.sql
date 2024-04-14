USE [master]
GO
/****** Object:  Database [Chicken_Gang]    Script Date: 4/3/2024 8:20:41 PM ******/
CREATE DATABASE [Chicken_Gang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Chicken_Gang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Chicken_Gang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Chicken_Gang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Chicken_Gang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Chicken_Gang] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chicken_Gang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chicken_Gang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Chicken_Gang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Chicken_Gang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Chicken_Gang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Chicken_Gang] SET ARITHABORT OFF 
GO
ALTER DATABASE [Chicken_Gang] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Chicken_Gang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chicken_Gang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chicken_Gang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chicken_Gang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Chicken_Gang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Chicken_Gang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Chicken_Gang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Chicken_Gang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Chicken_Gang] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Chicken_Gang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Chicken_Gang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Chicken_Gang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Chicken_Gang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Chicken_Gang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Chicken_Gang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Chicken_Gang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Chicken_Gang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Chicken_Gang] SET  MULTI_USER 
GO
ALTER DATABASE [Chicken_Gang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Chicken_Gang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Chicken_Gang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Chicken_Gang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Chicken_Gang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Chicken_Gang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Chicken_Gang] SET QUERY_STORE = OFF
GO
USE [Chicken_Gang]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 4/3/2024 8:20:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[MaThanhVien] [int] NULL,
	[MaSP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonDat]    Script Date: 4/3/2024 8:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonDat](
	[MaChiTietDonDat] [int] IDENTITY(1,1) NOT NULL,
	[MaDDH] [int] NULL,
	[MaSP] [int] NULL,
	[TenSP] [nvarchar](255) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietDonDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 4/3/2024 8:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[MaPN] [int] NULL,
	[MaSP] [int] NULL,
	[DonGiaNhap] [decimal](18, 0) NULL,
	[SoLuongNhap] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 4/3/2024 8:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[NgayGiao] [datetime] NULL,
	[DaThanhToan] [bit] NULL,
	[MaKH] [int] NULL,
	[UuDai] [int] NULL,
	[DiaChiGiaoHang] [nvarchar](max) NULL,
	[Sdt] [varchar](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 4/3/2024 8:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Email] [nvarchar](255) NULL,
	[SoDienThoai] [varchar](11) NULL,
	[MaThanhVien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 4/3/2024 8:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
	[Icon] [nvarchar](max) NULL,
	[BiDanh] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiThanhVien]    Script Date: 4/3/2024 8:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThanhVien](
	[MaLoaiTV] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[UuDai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 4/3/2024 8:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[SoDienThoai] [varchar](11) NULL,
	[Fax] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 4/3/2024 8:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](100) NULL,
	[ThongTin] [nvarchar](255) NULL,
	[Logo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 4/3/2024 8:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [int] NULL,
	[NgayNhap] [datetime] NULL,
	[DaXoa] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 4/3/2024 8:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](255) NULL,
	[DonGia] [decimal](18, 0) NULL,
	[NgayCapNhat] [datetime] NULL,
	[Mota] [nvarchar](max) NULL,
	[Mota2] [nvarchar](max) NULL,
	[Mota3] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[SoLuongTon] [int] NULL,
	[LuotXem] [int] NULL,
	[LuotBinhChon] [int] NULL,
	[LuotBinhLuan] [int] NULL,
	[SoLanMua] [int] NULL,
	[Moi] [int] NULL,
	[MaNCC] [int] NULL,
	[MaNSX] [int] NULL,
	[MaLoaiSP] [int] NULL,
	[DaXoa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 4/3/2024 8:20:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[MaThanhVien] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[HoTen] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](100) NULL,
	[SoDienThoai] [varchar](11) NULL,
	[CauHoi] [nvarchar](max) NULL,
	[CauTraLoi] [nvarchar](max) NULL,
	[MaLoaiTV] [int] NULL,
	[LoaiAccount] [nvarchar](50) NULL,
	[DaKhoa] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonDat] ON 
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1089, 1084, 67, N'Combo Gà Quay', 1, CAST(75000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1090, 1085, 67, N'Combo Gà Quay', 3, CAST(75000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1091, 1085, 70, N'Combo Burger', 1, CAST(72000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1092, 1086, 67, N'Combo Gà Quay', 3, CAST(75000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1093, 1086, 70, N'Combo Burger', 1, CAST(72000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1094, 1087, 108, N'Bánh Trứng (4 Cái)', 1, CAST(54000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1095, 1088, 108, N'Bánh Trứng (4 Cái)', 1, CAST(54000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1096, 1089, 67, N'Combo Gà Quay', 1, CAST(75000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1097, 1090, 70, N'Combo Burger', 3, CAST(72000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1098, 1090, 112, N'Pepsi Vị Chanh Không Calo Lon', 1, CAST(17000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1099, 1091, 71, N'Combo Nhóm 1', 1, CAST(132000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1100, 1092, 112, N'Pepsi Vị Chanh Không Calo Lon', 3, CAST(17000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1101, 1093, 112, N'Pepsi Vị Chanh Không Calo Lon', 3, CAST(17000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1102, 1094, 108, N'Bánh Trứng (4 Cái)', 1, CAST(54000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1103, 1095, 67, N'Combo Gà Quay', 1, CAST(75000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1104, 1095, 107, N'Bánh Trứng (1 cái)', 1, CAST(17000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1105, 1095, 108, N'Bánh Trứng (4 Cái)', 1, CAST(54000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1106, 1095, 109, N'Thanh Bí Phô-mai (2 Thanh)', 2, CAST(26000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1107, 1095, 111, N'Thanh Bí Phô-mai (5 Thanh)', 1, CAST(55000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1108, 1095, 110, N'Thanh Bí Phô-mai (3 Thanh)', 1, CAST(35000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1109, 1096, 68, N'Combo Mì Ý', 1, CAST(68000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1110, 1097, 67, N'Combo Gà Quay', 1, CAST(75000 AS Decimal(18, 0)))
GO
INSERT [dbo].[ChiTietDonDat] ([MaChiTietDonDat], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1111, 1098, 109, N'Thanh Bí Phô-mai (2 Thanh)', 1, CAST(26000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonDat] OFF
GO
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1084, CAST(N'2024-03-23T16:36:47.890' AS DateTime), 1, CAST(N'2024-03-23T00:00:00.000' AS DateTime), 1, 1097, NULL, N'123123', N'0917672477')
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1085, CAST(N'2024-03-23T16:40:14.010' AS DateTime), 0, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 0, 1098, NULL, N'nvs', NULL)
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1086, CAST(N'2024-03-23T16:41:15.000' AS DateTime), 1, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 1, 1099, NULL, N'123', NULL)
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1087, CAST(N'2024-03-23T16:48:17.527' AS DateTime), 0, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 0, 1100, NULL, N'26 đường 34', N'09999999')
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1088, CAST(N'2024-03-23T16:49:10.387' AS DateTime), 0, CAST(N'2024-03-22T00:00:00.000' AS DateTime), 0, 1101, NULL, N'26 đường 34', N'09999999')
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1089, CAST(N'2024-03-24T11:33:20.957' AS DateTime), 0, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 0, 1102, NULL, N'26 đường 34', N'09999999')
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1090, CAST(N'2024-03-24T11:42:17.557' AS DateTime), 0, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 0, 1103, NULL, N'26 đường 34', N'09999999')
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1091, CAST(N'2024-03-24T15:16:05.323' AS DateTime), 1, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 1, 1104, NULL, N'123', NULL)
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1092, CAST(N'2024-03-24T15:18:13.130' AS DateTime), 0, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 0, 1105, NULL, N'26 đường 34', N'09999999')
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1093, CAST(N'2024-03-24T15:18:34.023' AS DateTime), 1, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 1, 1106, NULL, N'26 đường 34', N'09999999')
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1094, CAST(N'2024-03-26T13:32:04.983' AS DateTime), 1, CAST(N'2024-03-28T00:00:00.000' AS DateTime), 1, 1108, NULL, N'26 đường 34', N'09999998')
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1095, CAST(N'2024-03-26T13:52:32.577' AS DateTime), 0, CAST(N'2024-03-27T00:00:00.000' AS DateTime), 0, 1109, NULL, N'26 đường 34', N'09999998')
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1096, CAST(N'2024-03-26T16:39:12.317' AS DateTime), 0, CAST(N'2024-03-26T00:00:00.000' AS DateTime), 0, 1110, NULL, N'26 đường 34', N'09999998')
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1097, CAST(N'2024-03-26T17:05:29.073' AS DateTime), 0, CAST(N'2024-03-26T00:00:00.000' AS DateTime), 0, 1113, NULL, NULL, NULL)
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DiaChiGiaoHang], [Sdt]) VALUES (1098, CAST(N'2024-03-26T20:54:12.327' AS DateTime), 0, CAST(N'2024-03-26T00:00:00.000' AS DateTime), 0, 1116, NULL, N'26 đường 34', N'09999998')
GO
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1097, N'6559- Nguyễn Văn Sĩ', NULL, N'vansi18042001@gmail.com', NULL, NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1098, N'nvs', N'nvs', N'vansi1804@gmail.com', N'099999999', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1099, N'nvs', N'123', N'vansi1804@gmail.com', N'099999999', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1100, N'User', N'26 đường 34', N'user@gmail.com', N'09999999', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1101, N'User', N'26 đường 34', N'user@gmail.com', N'09999999', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1102, N'User', N'26 đường 34', N'user@gmail.com', N'09999999', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1103, N'User', N'26 đường 34', N'user@gmail.com', N'09999999', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1104, N'nvs', N'123', N'vansi1804@gmail.com', N'099999999', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1105, N'User', N'26 đường 34', N'user@gmail.com', N'09999999', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1106, N'User', N'26 đường 34', N'user@gmail.com', N'09999999', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1107, N'nvs', N'123', N'221', N'123123123', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1108, N'User', N'26 đường 34', N'user@gmail.com', N'09999998', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1109, N'User', N'26 đường 34', N'user@gmail.com', N'09999998', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1110, N'User', N'26 đường 34', N'user@gmail.com', N'09999998', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1111, NULL, NULL, NULL, N'123123123', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1112, NULL, NULL, NULL, N'123123123', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1113, N'User', N'26 đường 34', N'user@gmail.com', N'09999998', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1114, NULL, NULL, NULL, N'0999999999', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1115, NULL, NULL, NULL, N'0999999999', NULL)
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1116, N'User', N'26 đường 34', N'user@gmail.com', N'09999998', NULL)
GO
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (1, N'Combo 1 Người', NULL, NULL)
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (2, N'Combo Nhóm', NULL, NULL)
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (3, N'Gà Rán - Quay', NULL, NULL)
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (4, N'Cơm - Burger - Mì Ý', NULL, NULL)
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (5, N'Thức Ăn Nhẹ - Món Thêm', NULL, NULL)
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (6, N'Tráng Miệng - Thức Uống', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiThanhVien] ON 
GO
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (1, N'vip', NULL)
GO
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (2, N'thuong', NULL)
GO
SET IDENTITY_INSERT [dbo].[LoaiThanhVien] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (1, N'tuan', N'hcm', NULL, NULL, NULL)
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (2, N'nien', N'hcm', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 
GO
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (1, N'tuan', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (66, N'Combo Gà Rán', CAST(63000 AS Decimal(18, 0)), NULL, N'2 Miếng Gà Giòn Cay / 2 Miếng Gà Giòn Không Cay / 2 Miếng Gà Truyền', N'1 Pepsi Lon', NULL, N'Content/images/KFC/garan1.png', 20, 2, 10, 10, 12, 0, 1, 1, 1, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (67, N'Combo Gà Quay', CAST(75000 AS Decimal(18, 0)), NULL, N'1 Miếng Đùi Gà Quay Giấy Bạc / 1 Miếng Đùi Gà Quay Tiêu', N'1 Cơm Trắng', N'1 Pepsi Lon', N'Content/images/KFC/gaquay1.png', 7, 2, 10, 10, 20, 0, 1, 1, 1, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (68, N'Combo Mì Ý', CAST(68000 AS Decimal(18, 0)), NULL, N'1 Mì Ý Xốt Cà Gà Viên', N'1 Miếng Gà Giòn Cay / 1 Miếng Gà Giòn Không Cay / 1 Miếng Gà Truyền Thống / 2 Xiên Gà Tenderods', N'1 Pepsi Lon', N'Content/images/KFC/miy1.png', 12, 2, 10, 10, 14, 0, 1, 1, 1, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (69, N'Combo Cơm Gà Rán', CAST(53000 AS Decimal(18, 0)), NULL, N'1 Cơm Gà Giòn Cay / 1 Cơm Gà Giòn Không Cay / 1 Cơm Gà Truyền', N'1 Súp Rong Biển', N'1 Pepsi Lon', N'Content/images//KFC/comga1.png', 17, 2, 10, 10, 10, 0, 1, 1, 1, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (70, N'Combo Burger', CAST(72000 AS Decimal(18, 0)), NULL, N'1 Burger Zinger / 1 Burger Tôm / 1 Burger Gà Quay Flava', N'1 Miếng Gà Giòn Cay / 1 Miếng Gà Giòn Không Cay / 1 Miếng Gà Truyền Thống', N'1 Pepsi Lon', N'Content/images/KFC/burger1.png', 11, 2, 10, 10, 13, 0, 1, 1, 1, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (71, N'Combo Nhóm 1', CAST(132000 AS Decimal(18, 0)), NULL, N'3 Miếng Gà Giòn Cay / 3 Miếng Gà Giòn Không Cay / 3 Miếng Gà Truyền Thống', N'1 Burger Zinger / 1 Burger Tôm / 1 Burger Gà Quay Flava', N'2 Pepsi Lon', N'Content/images/KFC/combo1.png', 14, 2, 10, 10, 11, 0, 1, 1, 2, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (72, N'Combo Nhóm 2', CAST(146000 AS Decimal(18, 0)), NULL, N'4 Miếng Gà Giòn Cay / 4 Miếng Gà Giòn Không Cay / 4 Miếng Gà Truyền thống', N'2 Thanh Bí Phô-mai', N'2 Pepsi Lon', N'Content/images/KFC/combo2.png', 20, 2, 10, 10, 10, 0, 1, 1, 2, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (73, N'Combo Nhóm 3', CAST(175000 AS Decimal(18, 0)), NULL, N'5 Miếng Gà Giòn Cay / 5 Miếng Gà Giòn Không Cay / 5 Miếng Gà Truyền Thống', N'1 Popcorn (Vừa) / 2 Xiên Gà Tenderods', N'3 Pepsi Lon', N'Content/images/KFC/combo3.png', 20, 2, 10, 10, 10, 0, 1, 1, 2, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (74, N'Combo Gia Đình', CAST(272000 AS Decimal(18, 0)), NULL, N'5 Miếng Gà Giòn Cay / 5 Miếng Gà Giòn Không Cay / 5 Miếng Gà Truyền Thống', N'2 Burger Zinger / 2 Burger Tôm / 1 Mì Ý Xốt Cà Gà Viên', N'4 Pepsi Lon', N'Content/images/KFC/combogiadinh.png', 20, 2, 10, 10, 10, 0, 1, 1, 2, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (75, N'Gà Rán ( 1 Miếng )', CAST(35000 AS Decimal(18, 0)), NULL, N'1 Miếng Gà Giòn Cay / 1 Miếng Gà Giòn Không Cay / 1 Miếng Gà Truyền Thống', NULL, NULL, N'Content/images/KFC/le_ga1mieng.png', 20, 2, 10, 10, 10, 0, 1, 1, 3, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (76, N'Gà Rán ( 2 Miếng )', CAST(68000 AS Decimal(18, 0)), NULL, N'2 Miếng Gà Giòn Cay / 2 Miếng Gà Giòn Không Cay / 2 Miếng Gà Truyền thống', NULL, NULL, N'Content/images/KFC/le_ga2mieng.png', 20, 2, 10, 10, 10, 0, 1, 1, 3, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (77, N'Gà Rán ( 3 Miếng )', CAST(101000 AS Decimal(18, 0)), NULL, N'3 Miếng Gà Giòn Cay / 3 Miếng Gà Truyền Thống / 3 Miếng Gà Giòn Không Cay', NULL, NULL, N'Content/images/KFC/le_ga3mieng.png', 20, 2, 10, 10, 10, 0, 1, 1, 3, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (78, N'Gà Rán ( 6 Miếng )', CAST(195000 AS Decimal(18, 0)), NULL, N'6 Miếng Gà Giòn Cay / 6 Miếng Gà Truyền thống / 6 Miếng Gà Giòn Không Cay', NULL, NULL, N'Content/images/KFC/le_ga6mieng.png', 20, 2, 10, 10, 10, 0, 1, 1, 3, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (79, N'Đùi Gà Quay ( 1 Miếng )', CAST(67000 AS Decimal(18, 0)), NULL, N'1 Miếng Đùi Gà Quay Giấy Bạc / 1 Miếng Đùi Gà Quay Tiêu', NULL, NULL, N'Content/images/KFC/le_gaquay1mieng.png', 20, 2, 10, 10, 10, 0, 1, 1, 3, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (80, N'Phi-lê Gà Quay ( 1 Miếng )', CAST(35000 AS Decimal(18, 0)), NULL, N'1 Miếng Phi-lê Gà Quay Flava / 1 Miếng Phi-lê Gà Quay Tiêu', NULL, NULL, N'Content/images/KFC/le_philegaquay1mieng.png', 20, 2, 10, 10, 10, 0, 1, 1, 3, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (81, N'Cơm Gà Rán ( 1 Phần )', CAST(42000 AS Decimal(18, 0)), NULL, N'Cơm Gà Giòn Cay (1 Phần) / Cơm Gà Giòn Không Cay (1 Phần) / Cơm Gà Truyền Thống (1 Phần)', NULL, NULL, N'Content/images/KFC/le_comga1phan.png', 20, 2, 10, 110, 10, 0, 1, 1, 4, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (82, N'Cơm Gà Bít-tết ( 1 Phần )', CAST(42000 AS Decimal(18, 0)), NULL, N'Cơm Gà Bít-tết (1 Phần)', NULL, NULL, N'Content/images/KFC/le_comgabittet.png', 20, 2, 10, 10, 10, 0, 1, 1, 4, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (83, N'Gà Bít-tết với Khoai tây chiên', CAST(42000 AS Decimal(18, 0)), NULL, N'Gà Bít-tết với Khoai tây chiên (1 Phần)', NULL, NULL, N'Content/images/KFC/le_gabitet_khoaitaychien.png', 20, 2, 21, 10, 10, 0, 1, 1, 4, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (84, N'Cơm Phi Lê Gà Quay ( 1 Phần )', CAST(42000 AS Decimal(18, 0)), NULL, N'Cơm Phi Lê Gà Quay Flava (1 Phần) / Cơm Phi Lê Gà Quay Tiêu (1 Phần)', NULL, NULL, N'Content/images/KFC/le_comphilegaquay.png', 20, 2, 10, 10, 10, 0, 1, 1, 4, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (85, N'Cơm Phi Lê Gà Giòn ( 1 Phần )', CAST(42000 AS Decimal(18, 0)), NULL, N'Cơm Phi Lê Gà Giòn (1 Phần)', NULL, NULL, N'Content/images/KFC/le_comphilegagion.png', 20, 2, 10, 10, 10, 0, 1, 1, 4, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (86, N'Cơm Gà Xiên Que (1 Phần)', CAST(42000 AS Decimal(18, 0)), NULL, N'Cơm Gà Xiên Que (1 Phần)', NULL, NULL, N'Content/images/KFC/le_comxienqua.png', 20, 2, 10, 10, 10, 0, 1, 1, 4, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (87, N'Burger Tôm (1 Phần)', CAST(41000 AS Decimal(18, 0)), NULL, N'Burger Tôm (1 Phần)', NULL, NULL, N'Content/images/KFC/le_burgertom.png', 20, 2, 10, 10, 10, 0, 1, 1, 4, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (88, N'Burger Gà Quay Flava (1 Phần)', CAST(47000 AS Decimal(18, 0)), NULL, N'Burger Gà Quay Flava (1 Phần)', NULL, NULL, N'Content/images/KFC/le_burgergaquay.png', 20, 2, 10, 10, 10, 0, 1, 1, 4, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (89, N'Burger Zinger (1 Phần)', CAST(50000 AS Decimal(18, 0)), NULL, N'Burger Zinger (1 Phần)', NULL, NULL, N'Content/images/KFC/le_burgerzinger.png', 20, 2, 10, 10, 10, 0, 1, 1, 4, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (90, N'Mì Ý Xốt Cà Gà Viên (1 Phần)', CAST(37000 AS Decimal(18, 0)), NULL, N'Mì Ý Xốt Cà Gà Viên (1 Phần)', NULL, NULL, N'Content/images/KFC/le_miysotca.png', 20, 2, 10, 10, 10, 0, 1, 1, 4, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (91, N'Hot Wings (3 Miếng)', CAST(48000 AS Decimal(18, 0)), NULL, N'Cánh Gà Chiên Giòn 3 miếng Siêu to', NULL, NULL, N'Content/images/KFC/le_hotwings3.png', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (92, N'Hot Wings (5 Miếng)', CAST(75000 AS Decimal(18, 0)), NULL, N'Cánh Gà Chiên Giòn 5 miếng Siêu to', NULL, NULL, N'Content/images/KFC/le_hotwings5.png', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (93, N'Gà Popcorn (Vừa) (1 phần)', CAST(36000 AS Decimal(18, 0)), NULL, N'Sụn Gà Chiên Giòn Đặc Biệt Đã (Size Vừa)', NULL, NULL, N'Content/images/KFC/le_gapopcornM.png', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (94, N'Gà Popcorn (Lớn) (1 Phần)', CAST(58000 AS Decimal(18, 0)), NULL, N'Sụn Gà Chiên Giòn Đặc Biệt Đã (Size Lớn)', NULL, NULL, N'Content/images/KFC/le_gapopcornL.png', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (95, N'Phô mai viên (4 viên)', CAST(30000 AS Decimal(18, 0)), NULL, N'Phô Mai 4 Viên Béo Ngậy Giòn Tan', NULL, NULL, N'Content/images/KFC/le_phomaivien4.png', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (96, N'Phô mai viên (6 viên)', CAST(41000 AS Decimal(18, 0)), NULL, N'Phô Mai 6 Viên Béo Ngậy Giòn Tan', NULL, NULL, N'Content/images/KFC/le_phomaivien6.png', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (97, N'Cá Thanh (3 Thanh)', CAST(40000 AS Decimal(18, 0)), NULL, N'Cá Thanh 3 Miếng Chiên Giòn', NULL, NULL, N'Content/images/KFC/le_cathanh3.png', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (98, N'Gà Xiên Que (2 Thanh)', CAST(33000 AS Decimal(18, 0)), NULL, N'Gà Xiên Que 2 Thanh Siêu Cay', NULL, NULL, N'Content/images/KFC/le_gaxienque2.png', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (99, N'Khoai Tây Chiên (Vừa)', CAST(17000 AS Decimal(18, 0)), NULL, N'Khoai Tây Chiên Size Vừa', NULL, NULL, N'Content/images/KFC/le_khoaitaychienM.png', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (100, N'Khoai Tây Chiên (Lớn)', CAST(28000 AS Decimal(18, 0)), NULL, N'Khoai Tây Chiên Size  Lớn', NULL, NULL, N'Content/images/KFC/le_khoaitaychienL.png', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (101, N'Khoai Tây Chiên (Đại)', CAST(38000 AS Decimal(18, 0)), NULL, N'Khoai Tây Chiên Size Siêu To Khổng Lồ', NULL, NULL, N'Content/images/KFC/le_khoaitaychienXL.png', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (102, N'Bắp cải trộn (Vừa)', CAST(12000 AS Decimal(18, 0)), NULL, N'Bắp Cải Trộn Size Vừa', NULL, NULL, N'Content/images/KFC/le_bapcaitronM.png', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (103, N'Bắp cải trộn (Lớn)', CAST(22000 AS Decimal(18, 0)), NULL, N'Bắp Cải Trộn Size Lớn', NULL, NULL, N'Content/images/KFC/bapcaitronL.png', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (104, N'Bắp Cải Trộn (Đại)', CAST(31000 AS Decimal(18, 0)), NULL, N'Bắp Cải Trộn Size Siêu To Khổng Lồ', NULL, NULL, N'Content/images/KFC/bapcaitronXL.png', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (105, N'Cơm Trắng', CAST(10000 AS Decimal(18, 0)), NULL, N'Cơm Trắng ( Suất Thêm )', NULL, NULL, N'Content/images/KFC/le_comtrang.jpg', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (106, N'Súp rong biển (1 phần)', CAST(14000 AS Decimal(18, 0)), NULL, N'Súp Rong Biển Cá Viên', NULL, NULL, N'Content/images/KFC/le_suprongbien.jpg', 20, 2, 10, 10, 10, 0, 1, 1, 5, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (107, N'Bánh Trứng (1 cái)', CAST(17000 AS Decimal(18, 0)), NULL, N'Bánh Trứng Siêu Ngon Siêu Bổ Dưỡng', N'1 Cái', NULL, N'Content/images/KFC/bonus_banhtrung1.png', 19, 2, 10, 10, 11, 1, 1, 1, 6, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (108, N'Bánh Trứng (4 Cái)', CAST(54000 AS Decimal(18, 0)), NULL, N'Bánh Trứng Siêu Ngon Siêu Bổ Dưỡng', N'4 Cái', NULL, N'Content/images/KFC/bonus_banhtrung4.png', 16, 2, 10, 10, 14, 1, 1, 1, 6, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (109, N'Thanh Bí Phô-mai (2 Thanh)', CAST(26000 AS Decimal(18, 0)), NULL, N'Thanh Bí Phô-Mai Chiên Giòn', N'2 Thanh', NULL, N'Content/images/KFC/bonus_thanhbi2.png', 16, 2, 10, 10, 13, 1, 1, 1, 6, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (110, N'Thanh Bí Phô-mai (3 Thanh)', CAST(35000 AS Decimal(18, 0)), NULL, N'Thanh Bí Phô-Mai Chiên Giòn', N'3 Thanh', NULL, N'Content/images/KFC/bonus_thanhbi3.png', 19, 2, 10, 10, 11, 1, 1, 1, 6, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (111, N'Thanh Bí Phô-mai (5 Thanh)', CAST(55000 AS Decimal(18, 0)), NULL, N'Thanh Bí Phô-Mai Chiên Giòn', N'5 Thanh', NULL, N'Content/images/KFC/bonus_thanhbi5.png', 19, 2, 10, 10, 11, 1, 1, 1, 6, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (112, N'Pepsi Vị Chanh Không Calo Lon', CAST(17000 AS Decimal(18, 0)), NULL, N'Pepsi Vị Chanh Không Calo Lon', NULL, NULL, N'Content/images/KFC/le_pepsivichanh.png', 13, 2, 10, 10, 13, 1, 1, 1, 6, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (113, N'Pepsi Lon', CAST(17000 AS Decimal(18, 0)), NULL, N'Pepsi Lon Thường', NULL, NULL, N'Content/images/KFC/le_pepsilon.png', 20, 2, 10, 10, 10, 0, 1, 1, 6, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (114, N'7Up Lon', CAST(17000 AS Decimal(18, 0)), NULL, N'SevenUp Lon Thường', NULL, NULL, N'Content/images/KFC/le_7uplon.png', 1, 2, 10, 10, 10, 0, 1, 1, 6, 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (115, N'Aquafina', CAST(15000 AS Decimal(18, 0)), NULL, N'Nước Suối Aquafina', NULL, NULL, N'Content/images/KFC/le_aquafina.png', 11, 2, 10, 10, 10, 0, 1, 1, 6, 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (116, N'Trà đào', CAST(24000 AS Decimal(18, 0)), NULL, N'Trà Đào Siêu Tươi Mát', NULL, NULL, N'Content/images/KFC/le_tradao.png', 20, 2, 10, 10, 10, 0, 1, 1, 6, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (117, N'BÁNH TRỨNG SÔ-CÔ-LA HẠNH NHÂN (1 CÁI)', CAST(19000 AS Decimal(18, 0)), NULL, N'1 Bánh Trứng Sô-Cô-La Hạnh Nhân', NULL, NULL, N'Content/images/KFC/monmoi1.jpg', 20, 2, 10, 10, 10, 1, 1, 1, 6, NULL)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [Mota], [Mota2], [Mota3], [HinhAnh], [SoLuongTon], [LuotXem], [LuotBinhChon], [LuotBinhLuan], [SoLanMua], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (118, N'BÁNH TRỨNG SÔ-CÔ-LA HẠNH NHÂN (4 CÁI)', CAST(61000 AS Decimal(18, 0)), NULL, N'4 Bánh Trứng Sô-Cô-La Hạnh Nhân', NULL, NULL, N'Content/images/KFC/monmoi2.jpg', 20, 2, 10, 10, 10, 1, 1, 1, 6, NULL)
GO
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[ThanhVien] ON 
GO
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV], [LoaiAccount], [DaKhoa]) VALUES (1, N'user', N'c37c6474f327735b620b4d4a3f684560', N'User', N'26 đường 34', N'user@gmail.com', N'09999998', N'', N'', NULL, NULL, 0)
GO
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV], [LoaiAccount], [DaKhoa]) VALUES (2, N'admin', N'd138768d3b5eca407f0dd579c5ca3767', N'Admin', N'26 đường 34', N'admin@gmail.com', N'09999999', N'', N'', NULL, N'1', 0)
GO
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV], [LoaiAccount], [DaKhoa]) VALUES (3, N'vansi18042001@gmail.com', NULL, N'6559- Nguyễn Văn Sĩ', NULL, N'vansi18042001@gmail.com', NULL, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV], [LoaiAccount], [DaKhoa]) VALUES (4, N'vansi1804@gmail.com', NULL, N'Nguyễn Văn Sĩ', NULL, N'vansi1804@gmail.com', NULL, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV], [LoaiAccount], [DaKhoa]) VALUES (5, N'nvs01', N'e3305c3800bbf56aaa021fb8f6b5e26d', N'NVS', N'26 đường 34', N'vansi180401@gmail.com', N'09999999', N'', N'', NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[ThanhVien] OFF
GO
ALTER TABLE [dbo].[ThanhVien] ADD  CONSTRAINT [DF__ThanhVien__DaKho__49C3F6B7]  DEFAULT ((0)) FOR [DaKhoa]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[ThanhVien] ([MaThanhVien])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDonDat]  WITH CHECK ADD FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDatHang] ([MaDDH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDonDat]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[ThanhVien] ([MaThanhVien])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[ThanhVien]  WITH CHECK ADD FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiThanhVien] ([MaLoaiTV])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [Chicken_Gang] SET  READ_WRITE 
GO
