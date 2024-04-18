using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ChickenGang_Project.Models;

namespace ChickenGang_Project.Controllers
{
    public class SearchController : Controller
    {
        dbChickenGang db = new dbChickenGang();
        // GET: Search
        public ActionResult KQTimKiem(string sKey)
        {
            var dsSanPham = db.SanPhams.ToList();

            string replacedVietnameseSigns = ReplaceVietnameseSigns(sKey.ToLower());

            var searchResult = dsSanPham.Where(n => ReplaceVietnameseSigns(n.TenSP.ToLower()).Contains(replacedVietnameseSigns));

            ViewBag.Key = sKey;
            return View(searchResult);
        }

        private string ReplaceVietnameseSigns(string str)
        {
            if (string.IsNullOrEmpty(str))
                return str;

            str = str.ToLower();
            
            string[] signs = new string[] { "aeouidy", "áàạảãâấầậẩẫăắằặẳẵ", "éèẹẻẽêếềệểễ", "óòọỏõôốồộổỗơớờợởỡ", "úùụủũưứừựửữ", "íìịỉĩ", "đ", "ýỳỵỷỹ" };

            for (int i = 1; i < signs.Length; i++)
            {
                for (int j = 0; j < signs[i].Length; j++)
                {
                    str = str.Replace(signs[i][j], signs[0][i - 1]);
                }
            }

            return str;
        }
    }
}