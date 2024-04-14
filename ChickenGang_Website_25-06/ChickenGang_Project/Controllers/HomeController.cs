using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using ChickenGang_Project.Models;
using PagedList;


namespace ChickenGang_Project.Controllers
{
    public class HomeController : Controller
    {
        dbChickenGang db = new dbChickenGang();

        
        public ActionResult Index()
        {
            //Tạo viewbag
            List<SanPham> lst1nguoi = db.SanPhams.Where(n => n.MaLoaiSP == 1).ToList();
            List<SanPham> lstnhom = db.SanPhams.Where(n => n.MaLoaiSP == 2).ToList();
            List<SanPham> lstle = db.SanPhams.Where(n => n.MaLoaiSP > 3).ToList();
            List<SanPham> lstbonus = db.SanPhams.Where(n => n.MaLoaiSP == 6).ToList();
            List<SanPham> listHotPick = db.SanPhams.Where(n => n.SoLanMua > 10).ToList();


            List<SanPham> lstall = db.SanPhams.ToList();


            ViewBag.lstall = lstall;
            ViewBag.lst1nguoi = lst1nguoi;
            ViewBag.lstnhom = lstnhom;
            ViewBag.lstle = lstle;
            ViewBag.lstle = lstbonus;
            ViewBag.lsthot = listHotPick; 

            return View();
        }

        public ActionResult AboutUs()
        {
            return View();
        }


        //public void PhanQuyen(string TaiKhoan, string Quyen)
        //{
        //    FormsAuthentication.Initialize();

        //    var ticket = new FormsAuthenticationTicket(1,
        //                                        TaiKhoan,
        //                                        DateTime.Now,
        //                                        DateTime.Now.AddHours(3),
        //                                        false,
        //                                        Quyen,
        //                                        FormsAuthentication.FormsCookiePath);

        //    var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket));

        //    if(ticket.IsPersistent) cookie.Expires = ticket.Expiration;

        //    Response.Cookies.Add(cookie);
        //}
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            FormsAuthentication.SignOut();
            return RedirectToAction("Index");
        }

        


       
    }
}