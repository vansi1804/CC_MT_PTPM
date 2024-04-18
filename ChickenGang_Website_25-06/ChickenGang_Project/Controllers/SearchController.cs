using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ChickenGang_Project.Helpers;
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

            string replacedVietnameseSigns = ReplaceVietnameseSigns.replace(sKey.ToLower());

            var searchResult = dsSanPham.Where(n => ReplaceVietnameseSigns.replace(n.TenSP.ToLower()).Contains(replacedVietnameseSigns));

            ViewBag.Key = sKey;
            return View(searchResult);
        }

        
    }
}