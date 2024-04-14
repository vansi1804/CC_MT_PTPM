using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ChickenGang_Project.Models;
using System.IO;

namespace ChickenGang_Project.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        dbChickenGang db = new dbChickenGang();

        #region SanPham

        //SanPham
        public ActionResult Index()
        {
            //var sp = db.SanPhams.ToList();
            var sp = db.SanPhams.ToList();
            return View(sp);
        }

        public ActionResult Detail(int id)
        {
            var D_SanPham = db.SanPhams.Where(s => s.MaSP == id).First();
            return View(D_SanPham);
        }

        public ActionResult Delete(int id)
        {
            var D_sach = db.SanPhams.First(m => m.MaSP == id);
            return View(D_sach);
        }

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var D_sach = db.SanPhams.Where(m => m.MaSP == id).First();
            D_sach.DaXoa = 1;
            //db.SanPhams.Remove(D_sach);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var E_sach = db.SanPhams.First(m => m.MaSP == id);
            return View(E_sach);
        }
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            var E_sp = db.SanPhams.First(m => m.MaSP == id);
            var E_tensach = collection["TenSP"];
            var E_hinh = collection["HinhAnh"];
            var E_dongia = collection["DonGia"];
            var E_soluongton = collection["SoLuongTon"];
            var E_mota = collection["MoTa"];
            var E_mota1 = collection["MoTa1"];
            var E_mota2 = collection["MoTa2"];

            E_sp.MaSP = id;
            if (string.IsNullOrEmpty(E_tensach))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                if (Convert.ToInt32(E_soluongton) < 0)
                {
                    ViewBag.ThongBao = "Phải nhập số lượng không âm!";
                }
                else if (Convert.ToDecimal(E_dongia) < 0)
                {
                    ViewBag.ThongBao = "Đơn giá phải không âm!";
                }
                else
                {
                    E_sp.TenSP = E_tensach;
                    E_sp.HinhAnh = E_hinh;
                    E_sp.DonGia = Convert.ToDecimal(E_dongia);
                    E_sp.SoLuongTon = Convert.ToInt32(E_soluongton);
                    E_sp.Mota = E_mota;
                    E_sp.Mota2 = E_mota1;
                    E_sp.Mota3 = E_mota2;
                    if (E_sp.SoLuongTon > 0)
                    {
                        E_sp.DaXoa = 0;
                    }

                    UpdateModel(E_sp);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            return this.Edit(id);
        }
        public string ProcessUpload(HttpPostedFileBase file)
        {
            if (file == null)
            {
                return "";
            }

            // Generate a unique identifier (tail) for the file name
            string tail = Guid.NewGuid().ToString().Substring(0, 5); // Generate a unique 5-character string

            // Get the file extension
            string extension = Path.GetExtension(file.FileName);

            // Combine the original file name, the tail, and the file extension
            string newFileName = Path.GetFileNameWithoutExtension(file.FileName) + "_" + tail + extension;

            String url = "~/Content/images/KFC/" + newFileName;

            // Save the file with the new file name to the specified directory
            file.SaveAs(Server.MapPath(url));

            return url;
        }


        public ActionResult Create()
        {
            dbChickenGang context = new dbChickenGang();
            SanPham objSP = new SanPham();

            objSP.ListNCC = context.NhaCungCaps.ToList();
            objSP.ListNSX = context.NhaSanXuats.ToList();
            objSP.ListLSP = context.LoaiSanPhams.ToList();

            return View(objSP);
        }
        [HttpPost]
        public ActionResult Create(FormCollection collection, SanPham s)
        {
            var E_tensach = collection["TenSP"];
            var E_hinh = collection["HinhAnh"];
            var E_dongia = collection["DonGia"];
            var E_soluongton = collection["SoLuongTon"];
            var E_mota = collection["MoTa"];
            var E_mota1 = collection["MoTa2"];
            var E_mota2 = collection["MoTa3"];
            var E_mancc = collection["NhaCungCap"];
            var E_mansx = collection["NhaSanXuat"];
            var E_maloaisp = collection["LoaiSanPham"];
            if (string.IsNullOrEmpty(E_tensach))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                if (Convert.ToInt32(E_soluongton) < 0)
                {
                    ViewBag.ThongBao = "Phải nhập số lượng dương!";
                }
                else if (Convert.ToDecimal(E_dongia) < 0)
                {
                    ViewBag.ThongBao = "Đơn giá phải là dương!";
                }
                else
                {
                    s.TenSP = E_tensach.ToString();
                    s.HinhAnh = E_hinh.ToString();
                    s.DonGia = Convert.ToDecimal(E_dongia);
                    s.SoLuongTon = Convert.ToInt32(E_soluongton);
                    s.MaNCC = Convert.ToInt32(E_mancc);
                    s.MaNSX = Convert.ToInt32(E_mansx);
                    s.MaLoaiSP = Convert.ToInt32(E_maloaisp);
                    s.NgayCapNhat = DateTime.Now;
                    s.Mota = E_mota;
                    s.Mota2 = E_mota1;
                    s.Mota3 = E_mota2;
                    s.Moi = 1;
                    s.LuotBinhChon = 0;
                    s.LuotXem = 0;
                    db.SanPhams.Add(s);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            return this.Create();
        }
        #endregion


        //Thành viên
        #region KhachHang
        [HttpGet]
        public ActionResult thanhvien()
        {
            var sp = db.ThanhViens.ToList();
            return View(sp);
        }

        public ActionResult Delete_ThanhVien(int id)
        {
            var D_ThanhVien = db.ThanhViens.First(m => m.MaThanhVien == id);
            return View(D_ThanhVien);
        }
        [HttpPost]
        public ActionResult Delete_ThanhVien(int id, FormCollection collection)
        {
            var D_ThanhVien = db.ThanhViens.Where(m => m.MaThanhVien == id).First();
            db.ThanhViens.Remove(D_ThanhVien);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Edit_ThanhVien(int id)
        {
            var E_ThanhVien = db.ThanhViens.First(m => m.MaThanhVien == id);
            return View(E_ThanhVien);
        }
        [HttpPost]
        public ActionResult Edit_ThanhVien(int id, FormCollection collection)
        {
            var E_ThanhVien = db.ThanhViens.First(m => m.MaThanhVien == id);
            try
            {
                E_ThanhVien.LoaiAccount = collection["LoaiAccount"];
                UpdateModel(E_ThanhVien);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return this.Edit(id);
            }
        }
        #endregion
    }
}