using backe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace back.Controllers
{
    public class ActivitiesController : Controller
    {
        // GET: Activities
        SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
        public ActionResult ActivitiesList()
        {
            
            var table = from a in db.tActivity
                        select new backe.Models.ActivityListDetail
                        {
                            fId = a.fId,
                            fActName = a.fActName,
                            fCreatDate = a.fCreatDate,
                            fActivityDate = a.fActivityDate,
                            fName = a.tMember.fName,
                            fLimit = a.fLimit,
                            fAttestName = a.tAttestType.fAttestName,
                            fStatusName = a.tActivityType.fStatusName,
                            fLabelName = a.tActivityMainLabel.fLabelName,
                        };

            string keyword = Request.Form["txtKeyword"];


            if (string.IsNullOrEmpty(keyword))
            {
                table = from a in db.tActivity
                        select new backe.Models.ActivityListDetail
                        {
                            fId = a.fId,
                            fActName = a.fActName,
                            fCreatDate = a.fCreatDate,
                            fActivityDate = a.fActivityDate,
                            fName = a.tMember.fName,
                            fLimit = a.fLimit,
                            fAttestName = a.tAttestType.fAttestName,
                            fStatusName = a.tActivityType.fStatusName,
                            fLabelName = a.tActivityMainLabel.fLabelName,
                        };
            }
            else
            {
       
                table = from a in db.tActivity
                        where a.fActName.Contains(keyword)
                        select new backe.Models.ActivityListDetail
                        {
                            fId = a.fId,
                            fActName = a.fActName,
                            fCreatDate = a.fCreatDate,
                            fActivityDate = a.fActivityDate,
                            fName = a.tMember.fName,
                            fLimit = a.fLimit,
                            fAttestName = a.tAttestType.fAttestName,
                            fStatusName = a.tActivityType.fStatusName,
                            fLabelName = a.tActivityMainLabel.fLabelName,
                        };
            }


            return View(table);
        }
        public ActionResult ActivitiesEdit(int? id)
        {
            if (id == null)
                return RedirectToAction("ActivitiesList");
            
            tActivity t = db.tActivity.FirstOrDefault(m => m.fId == id);

            return View(t);

        }
        [HttpPost]
        public ActionResult ActivitiesEdit(tActivity t)
        {
            SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
            tActivity A = db.tActivity.FirstOrDefault(m => m.fId == t.fId);
            if (A != null)
            {
                A.fActName = t.fActName;
                A.fCreatDate = t.fCreatDate;
                A.fActivityDate = t.fActivityDate;
                A.fIntroduction = t.fIntroduction;
                A.fLimit = t.fLimit;
                A.fActLocation = t.fActLocation;
                A.fCoordinateX = t.fCoordinateX;
                A.fCoordinateY = t.fCoordinateY;
                A.fActLabelId = t.fActLabelId;
                A.fMemberId = t.fMemberId;
                db.SaveChanges();
            }
            return RedirectToAction("ActivitiesList");
        }
        public ActionResult ActivitiesDelete(int? id)
        {
            SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
            tActivity a = db.tActivity.FirstOrDefault(m => m.fId == id);
            if (id == null)
                return RedirectToAction("ActivitiesList");

            db.tActivity.Remove(a);
            db.SaveChanges();
            return RedirectToAction("ActivitiesList");
        }


        public ActionResult ActivitiesStatusEdit(int? id)
        {
            if (id == null)
                return RedirectToAction("ActivitiesList");
            var table = from a in db.tActivity
                        select new backe.Models.ActivityListDetail
                        {
                            fId = a.fId,
                            fActName = a.fActName,
                            fCreatDate = a.fCreatDate,
                            fActivityDate = a.fActivityDate,
                            fName = a.tMember.fName,
                            fLimit = a.fLimit,
                            fAttestName = a.tAttestType.fAttestName,
                            fStatusName = a.tActivityType.fStatusName,
                            fLabelName = a.tActivityMainLabel.fLabelName,
                        };

            string keyword = Request.Form["txtKeyword"];


            if (string.IsNullOrEmpty(keyword))
            {
                table = from a in db.tActivity
                        select new backe.Models.ActivityListDetail
                        {
                            fId = a.fId,
                            fActName = a.fActName,
                            fCreatDate = a.fCreatDate,
                            fActivityDate = a.fActivityDate,
                            fName = a.tMember.fName,
                            fLimit = a.fLimit,
                            fAttestName = a.tAttestType.fAttestName,
                            fStatusName = a.tActivityType.fStatusName,
                            fLabelName = a.tActivityMainLabel.fLabelName,
                        };
            }
            else
            {

                table = from a in db.tActivity
                        where a.fActName.Contains(keyword)
                        select new backe.Models.ActivityListDetail
                        {
                            fId = a.fId,
                            fActName = a.fActName,
                            fCreatDate = a.fCreatDate,
                            fActivityDate = a.fActivityDate,
                            fName = a.tMember.fName,
                            fLimit = a.fLimit,
                            fAttestName = a.tAttestType.fAttestName,
                            fStatusName = a.tActivityType.fStatusName,
                            fLabelName = a.tActivityMainLabel.fLabelName,
                        };
            }
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
            return View(table);
        }
        [HttpPost]
        public ActionResult ActivitiesStatusEdit(int Act,int Att,int fId)
        {
            tActivity a = db.tActivity.FirstOrDefault(m => m.fId == fId);
            a.fActAttestId = Att;
            a.fActTypeId = Act;
            db.SaveChanges();


            return RedirectToAction("ActivitiesList");
        }


    }




}