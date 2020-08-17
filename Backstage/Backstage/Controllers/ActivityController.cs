﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Backstage.Controllers
{
    public class ActivityController : Controller
    {
        SeaTurtleOnTheWayEntities1 db = new SeaTurtleOnTheWayEntities1();
        // GET: Activity
        public ActionResult ActivityList()
        {

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
            return View(t);

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
                A.fMemberId = t.fMemberId;
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


    }
}