using Backstage.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Windows;

namespace Backstage.Controllers
{

    public class LoginController : Controller
    {
        SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(int? a )
        {
            string id = Request.Form["txtAccount"];
            string pwd= Request.Form["txtPassword"];
            tMember cust = db.tMember.FirstOrDefault(t => t.fAccount == id && t.fPassword.Equals(pwd));
            if (cust == null)
                return View();
            Session[cDictionary.SK_Member] = cust;
            return RedirectToAction("Home");
        }

        public ActionResult Home()
        {
            if (Session[cDictionary.SK_Member] == null)
            {
                MessageBox.Show("請先登入");
                return RedirectToAction("Login");
            }
                return View();
        }
    }
}