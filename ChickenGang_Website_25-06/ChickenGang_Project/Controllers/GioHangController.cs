using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Windows.Forms;
using ChickenGang_Project.Models;
using Newtonsoft.Json.Linq;
using FormCollection = System.Web.Mvc.FormCollection;

namespace ChickenGang_Project.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        dbChickenGang data = new dbChickenGang();
        static int DonHangId;
        public List<GioHang> Laygiohang()
        {
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang == null)
            {
                lstGiohang = new List<GioHang>();
                Session["Giohang"] = lstGiohang;
            }
            return lstGiohang;
        }
        public ActionResult ThemGioHang(int id, string strURL)
        {
            SanPham sp = data.SanPhams.SingleOrDefault(n => n.MaSP == id);
            if (sp == null)
            {
                //Not Found
                Response.StatusCode = 404;
                return null;
            }
            
            //Lấy giỏ hàng
            List<GioHang> lstGioHang = Laygiohang();


            //Sản phẩm có trong giỏ hàng
            GioHang spCheck = lstGioHang.SingleOrDefault(n => n.id == id);
            if (spCheck != null)
            {
                //kiểm tra số lượng tồn
                if (sp.SoLuongTon < spCheck.isoluong)
                {
                    Response.Write("<script>alert('Sản phầm đã hết hàng!!')</script>");
                }
                spCheck.isoluong++;
                return Redirect(strURL);
            }
            GioHang itemGioHang = new GioHang(id);
            if (sp.SoLuongTon < itemGioHang.isoluong)
            {
                Response.Write("<script>alert('Sản phầm đã hết hàng!!')</script>");
            }
            lstGioHang.Add(itemGioHang);
            return Redirect(strURL);
        }
        private int TongSoLuong()
        {
            int tsl = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                tsl = lstGiohang.Sum(n => n.isoluong);
            }
            return tsl;
        }
        private int TongSoluongSanPham()
        {
            int tsl = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                tsl = lstGiohang.Count;
            }
            return tsl;

        }

        private double TongTien()
        {
            double tt = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                tt = lstGiohang.Sum(n => n.dThanhtien);
            }
            return tt;
        }
        public ActionResult GioHang()
        {
            List<GioHang> lstGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoluongSanPham();
            return View(lstGiohang);
        }
        public ActionResult GioHangPartial()
        {
            ViewBag.Tongsoluon = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoluongSanPham();
            return PartialView();
        }
        public ActionResult XoaGiohang(int id)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.SingleOrDefault(n => n.id == id);
            if (sanpham != null)
            {
                lstGiohang.RemoveAll(n => n.id == id);
                return RedirectToAction("GioHang");
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult CapnhatGiohang(int id, FormCollection collection)
        {
            SanPham sp = data.SanPhams.SingleOrDefault(n => n.MaSP == id);
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.SingleOrDefault(n => n.id == id);
            if (sanpham != null)
            {
                sanpham.isoluong = int.Parse(collection["txtSolg"].ToString());
                if (sp.SoLuongTon < sanpham.isoluong)
                {
                    ViewBag.soluong = "Số lượng " + sp.TenSP + " không đủ!!";
                    
                    sanpham.isoluong = 1;
                    return View("GioHang");
                }
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult XoaTatCaGioHang()
        {
            List<GioHang> lstGiohang = Laygiohang();
            lstGiohang.Clear();
            return RedirectToAction("GioHang");
        }
        [HttpGet]
        public ActionResult DatHang()
        {
            if (Session["Giohang"] == null)
            {
                return RedirectToAction("Index", "Home");

            }
            List<GioHang> lstGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            ViewBag.Tongsoluongsanpham = TongSoluongSanPham();
            return View(lstGiohang);
        }



        public ActionResult DatHang(FormCollection collection)
        {
            List<GioHang> gioHang = Session["GioHang"] as List<GioHang>;
            DonDatHang dh = new DonDatHang();
            ThanhVien tv = (ThanhVien)Session["Taikhoan"];

            if (Session["TaiKhoan"] == null)
            {
                KhachHang kk = new KhachHang();
                kk.TenKH = collection["tenkh"];
                kk.Email = collection["email"];
                var diachi = collection["diachigiao"];
                kk.DiaChi = diachi;
                kk.SoDienThoai = collection["sdt"];
                data.KhachHangs.Add(kk);
                data.SaveChanges();
                SanPham s = new SanPham();
                List<GioHang> gh = Laygiohang();
                var ngaygiao = String.Format("{0:MM/dd/yyyy}", collection["NgayGiao"]);

                dh.DiaChiGiaoHang = diachi;
                dh.MaKH = kk.MaKH;
                dh.NgayDat = DateTime.Now;
                dh.NgayGiao = DateTime.Parse(ngaygiao);
                dh.TinhTrangGiaoHang = false;
                dh.DaThanhToan = false;
                var mail = new MailInfo();
                mail.SendEmailOrder(kk.Email, kk.TenKH);

                data.DonDatHangs.Add(dh);
                data.SaveChanges();
                foreach (var item in gh)
                {
                    ChiTietDonDat ctdh = new ChiTietDonDat();
                    ctdh.MaDDH = dh.MaDDH;
                    ctdh.TenSP = item.ten;
                    ctdh.MaSP = item.id;
                    ctdh.SoLuong = item.isoluong;
                    ctdh.DonGia = (decimal)item.giaban;
                    s = data.SanPhams.Single(n => n.MaSP == item.id);
                    s.SoLuongTon -= ctdh.SoLuong;
                    s.SoLanMua++;
                    data.SaveChanges();
                    data.ChiTietDonDats.Add(ctdh);

                }
                data.SaveChanges();

            }
            else if (Session["TaiKhoan"] != null)
            {
                KhachHang kk = new KhachHang();

                SanPham s = new SanPham();
                List<GioHang> gh = Laygiohang();
                var ngaygiao = String.Format("{0:MM/dd/yyyy}", collection["NgayGiao2"]);
                var diachi = collection["diachigiao"];
                dh.DiaChiGiaoHang = diachi;
                dh.MaKH = kk.MaKH;
                dh.NgayDat = DateTime.Now;
                dh.NgayGiao = DateTime.Parse(ngaygiao);
                dh.TinhTrangGiaoHang = false;
                dh.Sdt = collection["sdt2"];
                dh.DaThanhToan = false;
                kk.TenKH = tv.HoTen;
                kk.Email = tv.Email;
                kk.SoDienThoai = tv.SoDienThoai;
                kk.DiaChi = tv.DiaChi;
                var mail = new MailInfo();
                mail.SendEmailOrder(kk.Email, kk.TenKH);
                data.KhachHangs.Add(kk);
                data.DonDatHangs.Add(dh);
                data.SaveChanges();
                foreach (var item in gh)
                {
                    ChiTietDonDat ctdh = new ChiTietDonDat();
                    ctdh.MaDDH = dh.MaDDH;
                    ctdh.MaSP = item.id;
                    ctdh.TenSP = item.ten;
                    ctdh.SoLuong = item.isoluong;
                    ctdh.DonGia = (decimal)item.giaban;
                    s = data.SanPhams.Single(n => n.MaSP == item.id);
                    s.SoLuongTon -= ctdh.SoLuong;
                    s.SoLanMua++;
                    data.SaveChanges();
                    data.ChiTietDonDats.Add(ctdh);

                }
                data.SaveChanges();
            }
            if (collection["pay"] != "MoMo")
            {
                Session["GioHang"] = new List<GioHang>();
                return RedirectToAction("Index", "Home");
            }
            else if (collection["pay"] == "MoMo")
            {
                string endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
                string partnerCode = "MOMOXEOS20220610";
                string accessKey = "qnhdzzKtFdQTBda2";
                string serectkey = "kAYVTHxSUYadpoHzD60V8imOUphtAe63";
                string orderInfo = "DH" + DateTime.Now.ToString("yyyyMMddHHmmss");
                string returnUrl = "https://localhost:44325/GioHang/ReturnUrl";
                string notifyurl = "https://localhost:44325/GioHang/ReturnUrl"; //lưu ý: notifyurl không được sử dụng localhost, có thể sử dụng ngrok để public localhost trong quá trình test

                List<GioHang> ghtemp = Laygiohang();
                string amount = ghtemp.Sum(n=>n.dThanhtien).ToString();
                //string amount = "5000";
                string orderid = dh.MaDDH.ToString();
                string requestId = dh.MaDDH.ToString();
                string extraData = "";

                //Before sign HMAC SHA256 signature
                string rawHash = "partnerCode=" +
                    partnerCode + "&accessKey=" +
                    accessKey + "&requestId=" +
                    requestId + "&amount=" +
                    amount + "&orderId=" +
                    orderid + "&orderInfo=" +
                    orderInfo + "&returnUrl=" +
                    returnUrl + "&notifyUrl=" +
                    notifyurl + "&extraData=" +
                    extraData;

                MoMoSecurity crypto = new MoMoSecurity();
                //sign signature SHA256
                string signature = crypto.signSHA256(rawHash, serectkey);

                //build body json request
                JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "accessKey", accessKey },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderid },
                { "orderInfo", orderInfo },
                { "returnUrl", returnUrl },
                { "notifyUrl", notifyurl },
                { "extraData", extraData },
                { "requestType", "captureMoMoWallet" },
                { "signature", signature }

            };
                string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());
                JObject jmessage = JObject.Parse(responseFromMomo);
                //Session["idpake"] = dh.MaDDH;
                DonHangId = dh.MaDDH;
                return Redirect(jmessage.GetValue("payUrl").ToString());
            }
            return RedirectToAction("Home", "Index");
        }
        public ActionResult xacnhandonhang()
        {
            return View();
        }
        public ActionResult ReturnUrl(int errorCode)
        {
         
            //int idpake = int.Parse(Session["idpake"].ToString());
            var updh = data.DonDatHangs.SingleOrDefault(n=>n.MaDDH == DonHangId);
            string param = Request.QueryString.ToString().Substring(0, Request.QueryString.ToString().IndexOf("signature") - 1);
            param = Server.UrlDecode(param);
            MoMoSecurity crypto = new MoMoSecurity();
            string serectKey = ConfigurationManager.AppSettings["serectKey"].ToString();
            string signature = crypto.signSHA256(param, serectKey);
            if (signature != Request["signature"].ToString())
            {
                ViewBag.message = "Thông tin request không hợp lệ";
                updh.DaThanhToan = false;
            }
            if (!Request.QueryString["errorCode"].Equals("0"))
            {
                ViewBag.message = "Thanh toán thất bại";
                updh.DaThanhToan = false;
                return RedirectToAction("xacnhandonhang", "GioHang");
            }
            else
            {
                ViewBag.message = "Thanh toán thành công";
                Session["GioHang"] = new List<GioHang>();
                updh.DaThanhToan = true;
            }
            data.SaveChanges();
            return View();
        }
      
    }
}