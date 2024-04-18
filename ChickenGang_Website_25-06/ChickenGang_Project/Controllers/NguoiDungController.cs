using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ChickenGang_Project.Models;
using CaptchaMvc;
using CaptchaMvc.HtmlHelpers;
using System.Text;
using System.Security.Cryptography;
using System.Security.Policy;
using System.IO;
using Facebook;
using System.Configuration;
using Microsoft.AspNet.Membership.OpenAuth;
using DotNetOpenAuth.GoogleOAuth2;
using System.Collections.Specialized;

namespace ChickenGang_Project.Controllers
{
    public class NguoiDungController : Controller
    {
        dbChickenGang db = new dbChickenGang();

        // GET: NguoiDung

        static ThanhVien user = new ThanhVien();


        //Dang Ky
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Dangky(FormCollection f, ThanhVien tv)
        {

            var HoTen = f["HoTen"];
            var TaiKhoan = f["TaiKhoan"];
            var MatKhau = f["MatKhau"];
            var XacNhanMatKhau = f["XacNhanMatKhau"];
            var DiaChi = f["DiaChi"];
            var Email = f["Email"];
            var SoDienThoai = f["SoDienThoai"];
            var CauHoi = f["CauHoi"];
            var CauTraLoi = f["CauTraLoi"];


            // Code for validating the CAPTCHA  
            if (this.IsCaptchaValid("Captcha is not valid"))
            {
                var check = db.ThanhViens.FirstOrDefault(s => s.Email == tv.Email);
                if (check != null)
                {
                    ViewBag.error = "Email tồn tại";
                    return View();
                }
                else if (String.IsNullOrEmpty(XacNhanMatKhau))
                {
                    ViewData["NhapMKXN"] = "Phải nhập mật khẩu xác nhận!";
                }

                else
                {
                    if (!MatKhau.Equals(XacNhanMatKhau))
                    {
                        ViewData["MatKhauGiongNhau"] = "Mật khẩu và mật khẩu xác nhận phải giống nhau";
                    }
                    else
                    {
                        tv.HoTen = HoTen;
                        tv.TaiKhoan = TaiKhoan;
                        tv.MatKhau = GetMD5(MatKhau).ToString();
                        tv.DiaChi = DiaChi;
                        tv.Email = Email;
                        tv.SoDienThoai = SoDienThoai;
                        tv.CauHoi = CauHoi;
                        tv.CauTraLoi = CauTraLoi;
                        tv.MaLoaiTV = 2;
                        var mail = new MailInfo();
                        mail.SendEmail(Email, HoTen);
                        db.Configuration.ValidateOnSaveEnabled = false;
                        db.ThanhViens.Add(tv);
                        db.SaveChanges();
                        ViewBag.ThongBao = "Thêm thành công";
                        return RedirectToAction("Index", "Home");
                    }
                }

            }
            ViewBag.ThongBao = "Sai mã Captcha";
            return View();
        }
        //[HttpGet]
        //public ActionResult DangNhap()
        //{
        //    return View();
        //}

        //Dang Nhap
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            //Kiem tra UserName & Password
            string sTaiKhoan = f["uname"];
            string sMatKhau = GetMD5(f["psw"]).ToString();

            ThanhVien tv = db.ThanhViens.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan && n.MatKhau == sMatKhau);
            if (tv != null)
            {
                Session["TaiKhoan"] = tv;
                if (tv.LoaiAccount == "1")
                {
                    //return RedirectToAction("Index", "Admin");
                    return Content("<a href ='https://localhost:44325/Admin/Index'>Tiến đến trang admin</a>");
                }
                else
                {
                    return Content("<script>window.location.reload()</script>");
                    //return RedirectToAction("Index", "Home");
                }
            }
            else
            {
                //ViewData["LoginFail"] = "Phải nhập mật khẩu xác nhận!";
                return Content("Tài khoản hoặc mật khẩu không đúng!!!");
            }

        }


        public static string GetMD5(string str)
        {
            if (str == null || str.Trim().Length == 0) {
                return null; 
            }

            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");
            }
            return byte2String;
        }

        public ActionResult dangxuat()
        {
            Session["TaiKhoan"] = null;
            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var nd = db.ThanhViens.First(m => m.MaThanhVien == id);
            return View(nd);
        }

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            var E_ThanhVien = db.ThanhViens.First(m => m.MaThanhVien == id);
            var E_HoTen = collection["HoTen"];
            var E_DiaChi = collection["DiaChi"];
            var Email = collection["Email"];
            var E_SoDienThoai = collection["SoDienThoai"];

            E_ThanhVien.MaThanhVien = id;
            if (string.IsNullOrEmpty(E_HoTen))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                E_ThanhVien.TaiKhoan = E_ThanhVien.TaiKhoan;
                E_ThanhVien.HoTen = E_HoTen;
                E_ThanhVien.DiaChi = E_DiaChi;
                E_ThanhVien.Email = Email;
                E_ThanhVien.SoDienThoai = E_SoDienThoai;
                E_ThanhVien.CauHoi = E_ThanhVien.CauHoi;
                E_ThanhVien.CauTraLoi = E_ThanhVien.CauTraLoi;
                E_ThanhVien.MaLoaiTV = E_ThanhVien.MaLoaiTV;
                E_ThanhVien.LoaiAccount = E_ThanhVien.LoaiAccount;
                db.Configuration.ValidateOnSaveEnabled = false;
                TryUpdateModel(E_ThanhVien);
                db.SaveChanges();

                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("Index", "Home");

        }

        [HttpGet]
        public ActionResult ChangePassword(int id)
        {
            var tv = db.ThanhViens.First(m => m.MaThanhVien == id);
            return View(tv);
        }

        [HttpPost]
        public ActionResult ChangePassword(int id, FormCollection f)
        {
            var E_ThanhVien = db.ThanhViens.First(m => m.MaThanhVien == id);

            var MatKhauCu = GetMD5(f["MatKhauCu"]);
            var MatKhauMoi = f["MatKhauMoi"];
            var XacNhanMatKhau = f["XacNhanMatKhau"];

            E_ThanhVien.MaThanhVien = id;
            if (E_ThanhVien.MatKhau != null && !E_ThanhVien.MatKhau.Equals(MatKhauCu))
            {
                ViewData["NhapMKCu"] = "Mật khẩu không đúng!";
                return View();
            }
            else if (String.IsNullOrEmpty(XacNhanMatKhau))
            {
                ViewData["NhapMKXN"] = "Phải nhập mật khẩu xác nhận!";
            }
            else
            {
                if (MatKhauMoi != XacNhanMatKhau)
                {
                    ViewData["MatKhauGiongNhau"] = "Mật khẩu và mật khẩu xác nhận phải giống nhau";
                }
                else
                {
                    E_ThanhVien.TaiKhoan = E_ThanhVien.TaiKhoan;
                    E_ThanhVien.MatKhau = GetMD5(MatKhauMoi).ToString();
                    db.Configuration.ValidateOnSaveEnabled = false;
                    TryUpdateModel(E_ThanhVien);

                    db.SaveChanges();
                    return RedirectToAction("Index", "Home");
                }
            }
            return View();
        }

        public ActionResult ForgotPassword(FormCollection f)
        {
            var EmailCheck = f["EmailCheck"];
            var CauHoiBiMat = f["CauHoiBiMat"];
            var CauTraLoi = f["CauTraLoi"];

            ThanhVien tv = db.ThanhViens.SingleOrDefault(n => n.Email == EmailCheck  && n.CauTraLoi == CauTraLoi && n.CauHoi == CauHoiBiMat);

            if (tv != null)
            {
                var id = tv.MaThanhVien;
                return Redirect("~/NguoiDung/ResetPassword/" + id);
            }
            else if (EmailCheck == null)
            {
                ViewData["NhapEmail"] = "Mời bạn nhấp Email!!";
                return View();
            }
            else
            {
                ViewData["EmailSai"] = "Email không phù hợp hoặc tài khoản chưa tồn tại !!";
                ViewData["CauHoiSai"] = "Câu hỏi hoặc câu trả lời chưa đúng!!";
                return View();
            }
        }

        public ActionResult ResetPassword(int id, FormCollection f)
        {
            var MatKhauMoi = f["ResetMatKhauMoi"];
            var MatKhauXN = f["MatKhauXN"];
            var E_ThanhVien = db.ThanhViens.First(m => m.MaThanhVien == id);


            if (String.IsNullOrEmpty(MatKhauXN))
            {
                ViewData["NhapMKXN"] = "Phải nhập mật khẩu xác nhận!";
            }
            else
            {
                if (MatKhauMoi != MatKhauXN)
                {
                    ViewData["MatKhauGiongNhau"] = "Mật khẩu và mật khẩu xác nhận phải giống nhau";
                }
                else
                {
                    E_ThanhVien.TaiKhoan = E_ThanhVien.TaiKhoan;
                    E_ThanhVien.MatKhau = GetMD5(MatKhauMoi).ToString();
                    db.Configuration.ValidateOnSaveEnabled = false;
                    TryUpdateModel(E_ThanhVien);
                    db.SaveChanges();
                    return RedirectToAction("Index", "Home");
                }
            }
            return View();
        }

        public ActionResult Feedback(int id, FormCollection f)
        {
            return View();
        }

        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
                return uriBuilder.Uri;
            }
        }



        public ActionResult RedirectToGoogle()
        {
            string provider = "google";
            string returnUrl = "";
            return new ExternalLoginResult(provider, Url.Action("ExternalLoginCallback", new { ReturnUrl = returnUrl }));
        }
        internal class ExternalLoginResult : ActionResult
        {
            public ExternalLoginResult(string provider, string returnUrl)
            {
                Provider = provider;
                ReturnUrl = returnUrl;
            }

            public string Provider { get; private set; }
            public string ReturnUrl { get; private set; }

            public override void ExecuteResult(ControllerContext context)
            {
                OpenAuth.RequestAuthentication(Provider, ReturnUrl);
            }
        }


        [AllowAnonymous]
        public ActionResult ExternalLoginCallback(string returnUrl)
        {
            string ProviderName = OpenAuth.GetProviderNameFromCurrentRequest();

            if (ProviderName == null || ProviderName == "")
            {
                NameValueCollection nvc = Request.QueryString;
                if (nvc.Count > 0)
                {
                    if (nvc["state"] != null)
                    {
                        NameValueCollection provideritem = HttpUtility.ParseQueryString(nvc["state"]);
                        if (provideritem["__provider__"] != null)
                        {
                            ProviderName = provideritem["__provider__"];
                        }
                    }
                }
            }

            GoogleOAuth2Client.RewriteRequest();

            var redirectUrl = Url.Action("ExternalLoginCallback", new { ReturnUrl = returnUrl });
            var retUrl = returnUrl;
            var authResult = OpenAuth.VerifyAuthentication(redirectUrl);

            if (!authResult.IsSuccessful)
            {
                return RedirectToAction("Index", "Home");
                //return Redirect(Url.Action("Account", "Login"));
            }

            // User has logged in with provider successfully

            //Get provider user details
            string ProviderUserId = authResult.ProviderUserId;
            string ProviderUserName = authResult.UserName;

            string Email = null;
            if (Email == null && authResult.ExtraData.ContainsKey("email"))
            {
                Email = authResult.ExtraData["email"];
            }
            var user = new ThanhVien();
            user.TaiKhoan = Email;
            user.Email = Email;
            user.LoaiAccount = null;
            user.HoTen = ProviderUserName;
            user.MaLoaiTV = 2;

            db.Configuration.ValidateOnSaveEnabled = false;
            new ThanhVien().InserForFB(user);

            user = db.ThanhViens.First(tv=>tv.Email == user.Email);
            Session["TaiKhoan"] = user;

            return RedirectToAction("Index", "Home");
        }

    }
}