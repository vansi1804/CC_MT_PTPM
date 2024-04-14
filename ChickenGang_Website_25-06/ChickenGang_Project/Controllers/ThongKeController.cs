using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ChickenGang_Project.Models;
using OfficeOpenXml;

namespace ChickenGang_Project.Controllers
{
    public class ThongKeController : Controller
    {
        // GET: ThongKe
        dbChickenGang db = new dbChickenGang();
        public ActionResult Index()
        {
            ViewBag.SoNguoiTruyCap = HttpContext.Application["SoNguoiTruyCap"].ToString();
            ViewBag.SoNguoiDangOnline = HttpContext.Application["SoNguoiDangOnline"].ToString();
            ViewBag.TongDoanhThu = ThongKeTongDoanhThu();
            ViewBag.TongDonHang = ThongKeDonHang();
            ViewBag.TongThanhVien = ThongKeThanhVien();
            ViewBag.TongDoanhThuThang = ThongKeTongDoanhThuThang(DateTime.Now.Month, DateTime.Now.Year);

            var sp = db.DonDatHangs.ToList();
            return View(sp);
        }
        public decimal ThongKeTongDoanhThu()
        {
            var lstDDH = db.DonDatHangs.ToList();
            decimal TongTien = 0;
            foreach (var item in lstDDH)
            {
                TongTien += decimal.Parse(item.ChiTietDonDat.Sum(n => n.SoLuong * n.DonGia).Value.ToString());
            }
            return TongTien;
        }
        public decimal ThongKeTongDoanhThuThang(int Thang, int Nam)
        {
            Thang = DateTime.Now.Month;
            Nam = DateTime.Now.Year;
            var lstDDH = db.DonDatHangs.Where(n => n.NgayDat.Value.Month == Thang && n.NgayDat.Value.Year == Nam);
            decimal TongTien = 0;
            foreach (var item in lstDDH)
            {
                TongTien += decimal.Parse(item.ChiTietDonDat.Sum(n => n.SoLuong * n.DonGia).Value.ToString());
            }
            return TongTien;
        }
        public double ThongKeDonHang()
        {
            double slddh = db.DonDatHangs.Count();
            return slddh;
        }
        public double ThongKeThanhVien()
        {
            double sltv = db.ThanhViens.Count();
            return sltv;
        }
        public ActionResult ChiTietDonHang(int id)
        {
            ViewBag.TongTien = TongTienDonHang(id);
            var D_thucAn = db.ChiTietDonDats.Where(m => m.MaDDH == id).ToList();
            return View(D_thucAn);
        }
        private double TongTienDonHang(int id)
        {
            var D_thucAn = db.DonDatHangs.Where(m => m.MaDDH == id);
            double tt = 0;
            foreach (var item in D_thucAn)
            {
                tt += double.Parse(item.ChiTietDonDat.Sum(n => n.SoLuong * n.DonGia).Value.ToString());
            }
            return tt;
        }

        public ActionResult Update(int id)
        {
            DonDatHang update = db.DonDatHangs.SingleOrDefault(m => m.MaDDH == id);
            update.DaThanhToan = true;
            db.SaveChanges();
            return RedirectToAction("Index", "ThongKe");
        }
        public ActionResult UpdateTrangThaiGiaoHang(int id)
        {
            DonDatHang update = db.DonDatHangs.SingleOrDefault(m => m.MaDDH == id);
            update.TinhTrangGiaoHang = true;
            db.SaveChanges();
            return RedirectToAction("Index", "ThongKe");
        }
        public ActionResult ExportToExcel()
        {
            var ds_DDH = db.DonDatHangs.ToList();

            byte[] fileContents;
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            ExcelPackage Ep = new ExcelPackage();
            ExcelWorksheet Sheet = Ep.Workbook.Worksheets.Add("ThongKeDonDatHang");
            Sheet.Cells["A1"].Value = "Name";
            Sheet.Cells["B1"].Value = "Email";
            Sheet.Cells["C1"].Value = "Phone";
            Sheet.Cells["D1"].Value = "Order In";
            Sheet.Cells["E1"].Value = "Get In";
            Sheet.Cells["F1"].Value = "Address";
            Sheet.Cells["G1"].Value = "Total";

            int row = 2;
            foreach (var item in ds_DDH)
            {
                Sheet.Cells[string.Format("A{0}", row)].Value = item.GetTenKh(item);
                Sheet.Cells[string.Format("B{0}", row)].Value = item.GetEmail(item);
                Sheet.Cells[string.Format("C{0}", row)].Value = item.Sdt;
                Sheet.Cells[string.Format("D{0}", row)].Value = item.NgayDat.ToString();
                Sheet.Cells[string.Format("E{0}", row)].Value = item.NgayGiao.ToString();
                Sheet.Cells[string.Format("F{0}", row)].Value = item.DiaChiGiaoHang;
                Sheet.Cells[string.Format("G{0}", row)].Value = TongTienDonHang(item.MaDDH);
                row++;
            }
            Sheet.Cells[string.Format("H{0}", row)].Value = ThongKeTongDoanhThu();


            Sheet.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            fileContents = Ep.GetAsByteArray();

            if (fileContents == null || fileContents.Length == 0)
            {
                return HttpNotFound();
            }

            return File(
                fileContents: fileContents,
                contentType: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                fileDownloadName: "ThongKe.xlsx"
            );
        }

        public ActionResult SanPhamHetHang()
        {
            var D_thucAn = db.SanPhams.Where(m => m.SoLuongTon < 10).ToList();
            return View(D_thucAn);

        }
    }
}