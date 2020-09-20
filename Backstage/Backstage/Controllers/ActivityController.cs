using Backstage.Models;
using Backstage.viewmodel;
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
        [ValidateInput(false)]
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
        [ValidateInput(false)]
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
            var cLabel = db.tActivityMainLabel.ToDictionary(x => x.fId, y => y.fLabelName);
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
        [HttpPost][ValidateInput(false)]
        public ActionResult ActivityCreate(tActivity a)
        {
            a.fMemberId = int.Parse(Request["MemDrop"]);
            a.fActLabelId = int.Parse(Request["LabDrop"]);
            db.tActivity.Add(a);
            db.SaveChanges();


            return RedirectToAction("ActivityList");
        }
        public ActionResult active_list_detail(int page = 1)
        {
            IQueryable<active_list_detail> x = null;
            string txt = Request.Form["search_active_detail"];

            int currentPage = page < 1 ? 1 : page;
            if (string.IsNullOrEmpty(txt))
            {
                x = from t in db.tActivity
                    orderby t.fId
                    select new viewmodel.active_list_detail
                    {
                        fId = t.fId,
                        fActName = t.fActName,
                        fCreatDate = t.fCreatDate,
                        fActivityDate = t.fActivityDate,
                        fActivityEndDate = t.fActivityEndDate,
                        //fCommunityName = t.
                        fMemberName = t.tMember.fName,
                        fIntroduction = t.fIntroduction,
                        fMaxLimit = t.fMaxLimit,
                        fMinLimit = t.fMinLimit,
                        fAttestName = t.tAttestType.fAttestName,
                        fStatusName = t.tActivityType.fStatusName,
                        fActLocation = t.fActLocation,
                        fCoordinateX = t.fCoordinateX,
                        fCoordinateY = t.fCoordinateY,
                        fLabelName = t.tActivityMainLabel.fLabelName,
                        fImgPath = t.fImgPath
                    };
            }
            else
            {
                x = from t in db.tActivity
                    orderby t.fId
                    where t.fActName.Contains(txt) || t.tMember.fName.Contains(txt)
                    select new viewmodel.active_list_detail
                    {
                        fId = t.fId,
                        fActName = t.fActName,
                        fCreatDate = t.fCreatDate,
                        fActivityDate = t.fActivityDate,
                        fActivityEndDate = t.fActivityEndDate,
                        //fCommunityName = t.
                        fMemberName = t.tMember.fName,
                        fIntroduction = t.fIntroduction,
                        fMaxLimit = t.fMaxLimit,
                        fMinLimit = t.fMinLimit,
                        fAttestName = t.tAttestType.fAttestName,
                        fStatusName = t.tActivityType.fStatusName,
                        fActLocation = t.fActLocation,
                        fCoordinateX = t.fCoordinateX,
                        fCoordinateY = t.fCoordinateY,
                        fLabelName = t.tActivityMainLabel.fLabelName,
                        fImgPath = t.fImgPath
                    };
            }

            var result = x.ToPagedList(currentPage, 5);
            return View(result);
        }


        public ActionResult active_list_detail_Delete(int? id)
        {
            tActivity x = db.tActivity.FirstOrDefault(m => m.fId == id);
            db.tActivity.Remove(x);
            db.SaveChanges();
            return View();
        }


        public ActionResult active_list_detail_Creat()
        {
            return View();
        }
        [HttpPost][ValidateInput(false)]
        public ActionResult active_list_detail_Creat(tActivity x)
        {
            db.tActivity.Add(x);
            db.SaveChanges();
            return RedirectToAction("active_list_detail");
        }

        public ActionResult active_list_detail_edit(int? id)
        {
            tActivity x = db.tActivity.FirstOrDefault(m => m.fId == id);

            return View(x);
        }

        [HttpPost][ValidateInput(false)]
        public ActionResult active_list_detail_edit(tActivity s)
        {
            tActivity m = db.tActivity.FirstOrDefault(z => z.fId == s.fId); 
            m.fActName = s.fActName;
            m.fCreatDate = s.fCreatDate;
            m.fActivityDate = s.fActivityDate;
            m.fActivityEndDate = s.fActivityEndDate;
            m.fMemberId = s.fMemberId;
            m.fIntroduction = s.fIntroduction;
            m.fMaxLimit = s.fMaxLimit;
            m.fMinLimit = s.fMinLimit;
            m.fActAttestId = s.fActAttestId;
            m.fActAttestId = s.fActAttestId;
            m.fActLocation = s.fActLocation;
            m.fCoordinateX = s.fCoordinateX;
            m.fCoordinateY = s.fCoordinateY;
            m.fActLabelId = s.fActLabelId;
            m.fImgPath = s.fImgPath;

            db.SaveChanges();
            return RedirectToAction("active_list_detail");
        }

        public ActionResult join_list_detail(int? id)
        {
            var cust = from t in db.tJoinList
                       where t.fActivityId == id
                       select new viewmodel.Join_member_list
                       {
                           fId = t.fId,
                           fActivityName = t.tActivity.fActName,
                           fMemberName = t.tMember.fName,
                           fJoinTime = t.fJoinTime,
                           fJoinTypeName = t.tJoinType.fJoinName
                       };

            return View(cust);
        }

        public ActionResult join_list_detail_delete(int? id)
        {
            tJoinList x = db.tJoinList.FirstOrDefault(m => m.fId == id);
            db.tJoinList.Remove(x);
            db.SaveChanges();
            return RedirectToAction("join_list_detail");
        }

        public ActionResult join_list_detail_edit(int? id)
        {
            tJoinList s = db.tJoinList.FirstOrDefault(m => m.fId == id);
            return View(s);
        }

        [HttpPost][ValidateInput(false)]
        public ActionResult join_list_detail_edit(tJoinList x)
        {
            tJoinList s = db.tJoinList.FirstOrDefault(m => m.fId == x.fId);
            //s.fId = x.fId;
            //s.fActivityId = x.fActivityId;
            //s.fMemberId = x.fMemberId;
            //s.fJoinTime = x.fJoinTime;
            s.fJoinTypeId = x.fJoinTypeId;
            db.SaveChanges();
            return RedirectToAction("join_list_detail");
        }


        public ActionResult check_statusname()
        {
            DateTime nowdate = DateTime.Now;
            Session["today"] = nowdate.ToString("yyyy/MM/dd");
            var acvdates = from t in db.tActivity
                           select t;

            foreach (tActivity item in acvdates)
            {
                tActivity x = db.tActivity.FirstOrDefault(m => m.fId == item.fId);
                if (string.Compare(item.fActivityDate, nowdate.ToString("yyyy/MM/dd H:mm:ss")) > 0)
                {
                    x.fActTypeId = 1;
                }
                else if (string.Compare(item.fActivityDate, nowdate.ToString("yyyy/MM/dd H:mm:ss")) < 0 && string.Compare(item.fActivityEndDate, nowdate.ToString("yyyy/MM/dd")) > 0)
                {
                    x.fActTypeId = 2;
                }
                else if (string.Compare(item.fActivityDate, nowdate.ToString("yyyy/MM/dd H:mm:ss")) < 0)
                {
                    x.fActTypeId = 3;
                }
            }
            db.SaveChanges();
            return RedirectToAction("ActivityList");
        }

        public ActionResult Highchats()
        {
            DateTime nowdate = DateTime.Now;
            

            int sport = db.tActivity.Where(x => x.fActLabelId == 5 && string.Compare(x.fActivityDate, "2020/09/01") >= 0 && string.Compare(x.fActivityDate, "2020/09/30") <= 0).Count();
            int market = db.tActivity.Where(x => x.fActLabelId == 4 && string.Compare(x.fActivityDate, "2020/09/01") >= 0 && string.Compare(x.fActivityDate, "2020/09/30") <= 0).Count();
            int teach = db.tActivity.Where(x => x.fActLabelId == 3 && string.Compare(x.fActivityDate, "2020/09/01") >= 0 && string.Compare(x.fActivityDate, "2020/09/30") <= 0).Count();
            int clean = db.tActivity.Where(x => x.fActLabelId == 2 && string.Compare(x.fActivityDate, "2020/09/01") >= 0 && string.Compare(x.fActivityDate, "2020/09/30") <= 0).Count();
            int internetact = db.tActivity.Where(x => x.fActLabelId == 6 && string.Compare(x.fActivityDate, "2020/09/01") >= 0 && string.Compare(x.fActivityDate, "2020/09/30") <= 0).Count();
            int freeact = db.tActivity.Where(x => x.fActLabelId == 1 && string.Compare(x.fActivityDate, "2020/09/01") >= 0 && string.Compare(x.fActivityDate, "2020/09/30") <= 0).Count();

            ratio obj = new ratio();
            obj.Sport = sport;
            obj.Market = market;
            obj.Clean = clean;
            obj.Interentact = internetact;
            obj.Freeact = freeact;
            obj.Teach = teach;
            return Json(obj,JsonRequestBehavior.AllowGet);
        }
        public class ratio 
        { 
            public int Sport { get; set; }
            public int Market { get; set; }
            public int Teach { get; set; }
            public int Clean { get; set; }
            public int Interentact { get; set; }
            public int Freeact { get; set; }
        }
        public ActionResult ActLinePic()
        {
            var Actlinepic = db.tActivity.GroupBy(o => o.fActivityDate.Substring(5, 2)).Select(g => new { fOrDateMonth = g.Key, Actcount = g.Count() });
            return Json(Actlinepic, JsonRequestBehavior.AllowGet); 
        }

        public ActionResult ActLinecolum()
        {
            var Actcolumpic = db.tSearchList.GroupBy(o => o.fSearchTime.Substring(5, 2)).Select(g => new { fOrDateMonth = g.Key, Actcount = g.Count() });
            return Json(Actcolumpic, JsonRequestBehavior.AllowGet); ;
        }

    }


}