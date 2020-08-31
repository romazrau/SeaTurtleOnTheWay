using Backstage.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Backstage.Controllers
{
    public class ActivityController : Controller
    {
        SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
        int pagesize=10;
        // GET: Activity
        public ActionResult ActivityList(int? ch,int page=1)
        {
            int currentPage = page < 1 ? 1 : page;
            IQueryable<ActivityListDetail> t = null;
            string keyword = Request.Form["txtKeyword"];

            if (string.IsNullOrEmpty(keyword))
            {
                t = from a in db.tActivity
                    select new Models.ActivityListDetail
                    {
                        fId = a.fId,
                        fActName = a.fActName,
                        fCreatDate = a.fCreatDate,
                        fActivityDate = a.fActivityDate,
                        fMinLimit = a.fMinLimit,
                        fAttestName = a.tAttestType.fAttestName,
                        fStatusName = a.tActivityType.fStatusName,
                        fLabelName = a.tActivityMainLabel.fLabelName,
                    };
            }
            else
            {
                t = from a in db.tActivity
                    where a.fActName.Contains(keyword) 
                    select new Models.ActivityListDetail
                    {
                        fId = a.fId,
                        fActName = a.fActName,
                        fCreatDate = a.fCreatDate,
                        fActivityDate = a.fActivityDate,
                        fMinLimit = a.fMinLimit,
                        fAttestName = a.tAttestType.fAttestName,
                        fStatusName = a.tActivityType.fStatusName,
                        fLabelName = a.tActivityMainLabel.fLabelName,
                    };
            }

            switch (ch)
            {
                case 0:
                    t = t.OrderBy(s => s.fId);
                    break;
                case 1:
                    t = t.OrderByDescending(s => s.fId);
                    break;
                case 2:
                    t = t.OrderBy(s => s.fActivityDate);
                    break;
                case 3:
                    t = t.OrderByDescending(s => s.fActivityDate);
                    break;
                case 4:
                    t = t.OrderByDescending(s => s.fMinLimit);
                    break;
                case 5:
                    t = t.OrderBy(s => s.fMinLimit);
                    break;
                default:
                    t = t.OrderBy(s => s.fId);
                    break;
            }
            var result = t.ToPagedList(currentPage, pagesize);


            return View(result);

        }
        public ActionResult ActivityStatusEdit(int? id)
        {
            if (id == null)
                return RedirectToAction("ActivityList");


            var t = from a in db.tActivity
                    select new Models.ActivityListDetail
                    {
                        fId = a.fId,
                        fActName = a.fActName,
                        fCreatDate = a.fCreatDate,
                        fActivityDate = a.fActivityDate,
                        fMinLimit = a.fMinLimit,
                        fAttestName = a.tAttestType.fAttestName,
                        fStatusName = a.tActivityType.fStatusName,
                        fLabelName = a.tActivityMainLabel.fLabelName,
                    };
            /*下拉式選單*/
            var cActivityType = db.tActivityType.ToDictionary(x => x.fId, y => y.fStatusName);
            var cAttestType = db.tAttestType.ToDictionary(x => x.fId, y => y.fAttestName);
            List<SelectListItem> itemsAct = new List<SelectListItem>();
            List<SelectListItem> itemsAtt = new List<SelectListItem>();
            foreach (var a in cActivityType)
            {
                itemsAct.Add(new SelectListItem()
                {
                    Text = a.Value,
                    Value = a.Key.ToString()
                });
            }
            foreach (var a in cAttestType)
            {
                itemsAtt.Add(new SelectListItem()
                {
                    Text = a.Value,
                    Value = a.Key.ToString()
                });
            }
            ViewBag.ActDrop = itemsAct;
            ViewBag.AttDrop = itemsAtt;

            ViewBag.fId = id;
            return View(t);
        }
        [HttpPost]
        public ActionResult ActivityStatusEdit(int Act, int Att, int fId)
        {
            tActivity a = db.tActivity.FirstOrDefault(m => m.fId == fId);
            a.fActAttestId = Att;
            a.fActTypeId = Act;
            db.SaveChanges();
            return RedirectToAction("ActivityList");
        }



        public ActionResult ActivityDetailsEdit(int? id)
        {
            if (id == null)
                return RedirectToAction("ActivityList");
            tActivity t = db.tActivity.FirstOrDefault(m => m.fId == id);
            var cActivityType = db.tActivityType.ToDictionary(x => x.fId, y => y.fStatusName);
            var cAttestType = db.tAttestType.ToDictionary(x => x.fId, y => y.fAttestName);
            List<SelectListItem> itemsAct = new List<SelectListItem>();
            List<SelectListItem> itemsAtt = new List<SelectListItem>();
            List<SelectListItem> itemsMem = new List<SelectListItem>();
            var cMainLabel = db.tActivityMainLabel.ToDictionary(x => x.fId, y => y.fLabelName);
            SelectList MainLabelList = new SelectList(cMainLabel, cMainLabel.Keys, cMainLabel.Values);


            var cMember = db.tMember.ToDictionary(x => x.fId, y => y.fName);
            foreach (var cm in cMember)
            {
                itemsMem.Add(new SelectListItem()
                {
                    Text = cm.Value,
                    Value = cm.Key.ToString()
                });
            }
            foreach (var a in cActivityType)
            {
                itemsAct.Add(new SelectListItem()
                {
                    Text = a.Value,
                    Value = a.Key.ToString()
                });
            }
            foreach (var a in cAttestType)
            {
                itemsAtt.Add(new SelectListItem()
                {
                    Text = a.Value,
                    Value = a.Key.ToString()
                });
            }
            ViewBag.ActDrop = itemsAct;
            ViewBag.AttDrop = itemsAtt;
            ViewBag.MemDrop = itemsMem;
            ViewBag.MainLabelList = MainLabelList;


            return View(t);
        }
        [HttpPost]
        public ActionResult ActivityDetailsEdit(tActivity t)
        {
            tActivity A = db.tActivity.FirstOrDefault(m => m.fId == t.fId);
            if (A != null)
            {
                A.fActName = t.fActName;
                A.fCreatDate = t.fCreatDate;
                A.fActivityDate = t.fActivityDate;
                A.fIntroduction = t.fIntroduction;
                A.fMaxLimit = t.fMaxLimit;
                A.fMinLimit = t.fMinLimit;
                A.fActLocation = t.fActLocation;
                A.fCoordinateX = t.fCoordinateX;
                A.fCoordinateY = t.fCoordinateY;
                A.fActLabelId = t.fActLabelId;
                A.fActAttestId = int.Parse(Request.Form["AttDrop"]);
                A.fActTypeId = int.Parse(Request.Form["ActDrop"]);
                A.fMemberId = int.Parse(Request.Form["MemDrop"]);
                db.SaveChanges();
            }


            return RedirectToAction("ActivityList");

        }






        public ActionResult ActivityDelete(int? id)
        { 
             tActivity a = db.tActivity.FirstOrDefault(m => m.fId == id);
            if (id == null)
                return RedirectToAction("ActivitiyList");

            db.tActivity.Remove(a);
            db.SaveChanges();
            return RedirectToAction("ActivityList");
        }
        public ActionResult ActivityCreate()
        { 
            var cMember = db.tMember.ToDictionary(x => x.fId, y => y.fName);
            var cLabel = db.tActivityLabel.ToDictionary(x => x.fId, y => y.fLabelName);
            List<SelectListItem> itemsMem = new List<SelectListItem>();
            List<SelectListItem> itemsLab = new List<SelectListItem>();
            foreach (var cm in cMember)
            {
                itemsMem.Add(new SelectListItem()
                {
                    Text = cm.Value,
                    Value = cm.Key.ToString()
                });
            }
            foreach (var cl in cLabel)
            {
                itemsLab.Add(new SelectListItem()
                {
                    Text = cl.Value,
                    Value = cl.Key.ToString()
                });
            }
            ViewBag.MemDrop = itemsMem;
            ViewBag.LabDrop = itemsLab;


            return View();
        }
        [HttpPost]
        public ActionResult ActivityCreate(tActivity a)
        {
            a.fMemberId = int.Parse(Request["MemDrop"]);
            a.fActLabelId = int.Parse(Request["LabDrop"]);
            db.tActivity.Add(a);
            db.SaveChanges();


            return RedirectToAction("ActivityList");
        }
    }

        
}