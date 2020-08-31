using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using test1.Models;
using PagedList;


namespace test1.Controllers
{
    public class test1Controller : Controller
    {
        SeaTurtleOnTheWayEntities1 db = new SeaTurtleOnTheWayEntities1();
        // GET: test1
        public ActionResult Index()
        {

            return View();
        }



        public ActionResult list(int page =1)
        {
            int currentPage = page < 1 ? 1 : page;

            var cust = from t in db.tMember
                       orderby t.fId
                       select new Viewmodel.Memberlist
                       {
                           fId = t.fId,
                           fName = t.fName,
                           fAccount = t.fAccount,
                           fAccountType = t.tAccountType.fAccountType
                       };
            var result = cust.ToPagedList(currentPage, 5);

            return View(result);
        }





        public ActionResult create()
        {
            var arr = db.tAccountType.ToDictionary(x => x.fId, y => y.fAccountType);
            SelectList sl = new SelectList(arr);
            ViewBag.kk = sl;

            return View();
        }

        [HttpPost]
        public ActionResult create(tMember s)
        {
            db.tMember.Add(s);
            db.SaveChanges();
            return View();
        }






        public ActionResult delete(int? id)
        {
            tMember x = db.tMember.FirstOrDefault(s => s.fId == id);
            db.tMember.Remove(x);
            db.SaveChanges();
            return RedirectToAction("list");
        }





        public ActionResult edit(int? id)
        {
            tMember x = db.tMember.FirstOrDefault(m => m.fId == id);

            return View(x);
        }
        [HttpPost]
        public ActionResult edit(tMember x)
        {
            tMember s = db.tMember.FirstOrDefault(m => m.fId == x.fId);
            s.fName = x.fName;
            s.fPassword = x.fPassword;
            s.fMail = x.fMail;
            db.SaveChanges();
            return RedirectToAction("list");
        }
    }
        
}