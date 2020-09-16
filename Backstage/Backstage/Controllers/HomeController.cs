using Backstage.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Windows;

namespace Backstage.Controllers
{
    public class HomeController : Controller
    {
        SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
        // GET: Home
        public ActionResult Index()
        {
            if (Session[cDictionary.SK_Member] == null)
            {
                MessageBox.Show("請先登入");
                return RedirectToAction("Login", "Login");
            }
            return View();
            
        }
    }
}