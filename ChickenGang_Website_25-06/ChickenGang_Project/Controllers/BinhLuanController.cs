using ChickenGang_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Windows.Forms;
using FormCollection = System.Web.Mvc.FormCollection;

namespace ChickenGang_Project.Controllers
{
    public class BinhLuanController : Controller
    {
        // GET: BinhLuan
        dbChickenGang db = new dbChickenGang();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ShowComment(int id)
        {
            var commmet = db.BinhLuans.Where(s => s.MaSP == id).ToList();
            return View(commmet);
        }

        public ActionResult CreateComment(int id, FormCollection f)
        {
            ThanhVien tv = (ThanhVien)Session["Taikhoan"];
            BinhLuan bl = new BinhLuan();
            if(tv == null)
            {
                ViewData["RequiredLogin"] = "Bạn cần đăng nhập để bình luận!";
                return RedirectToAction("Index", "Home");

            }
            else { 
                bl.NoiDung = f["NoiDung"];
                bl.MaSP = id;
                bl.MaThanhVien = tv.MaThanhVien;
                db.BinhLuans.Add(bl);
                db.SaveChanges();
            }
            return RedirectToAction("Detail", "SanPham", new { id = id });

        }
    }
}