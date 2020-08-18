using Backstage.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace Backstage.Controllers
{
    public class CommunityController : Controller
    {
        SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
        // GET: Community
        public ActionResult CommunityList()
        {
            IQueryable<CommunityListDetail> t = null;
            string keyword = Request.Form["txtKeyword"];

            if (string.IsNullOrEmpty(keyword))
            {
                t = from c in db.tCommunity
                        select new Models.CommunityListDetail
                        {
                            fId = c.fId,
                            fName = c.fName,
                            fDate = c.fDate,
                            fInfo = c.fInfo,
                            fStatusName = c.tStatus.fName,
                            fImgPath = c.fImgPath,
                        };
            }
            else
            {
                t = from c in db.tCommunity
                    where c.fName.Contains(keyword)
                    select new Models.CommunityListDetail
                    {
                        fId = c.fId,
                        fName = c.fName,
                        fDate = c.fDate,
                        fInfo = c.fInfo,
                        fStatusName = c.tStatus.fName,
                        fImgPath = c.fImgPath,
                    };
            }






            return View(t);
        }



        public ActionResult CommunityStatusEdit(int? id)
        {
            if (id == null) return RedirectToAction("CommunityList");
            var t = from c in db.tCommunity
                    select new Models.CommunityListDetail
                    {
                        fId = c.fId,
                        fName = c.fName,
                        fDate = c.fDate,
                        fInfo = c.fInfo,
                        fStatusName = c.tStatus.fName,
                        fImgPath = c.fImgPath,
                    };
            ViewBag.fId = id;

            /*下拉*/
            var cCommunityStatus = db.tStatus.ToDictionary(x => x.fId, y => y.fName);
            List<SelectListItem> items = new List<SelectListItem>();
            int count = 0;
            foreach (var cc in cCommunityStatus)
            {
                items.Add(new SelectListItem()
                {
                    Text = cc.Value + "[" + count + "]",
                    Value = cc.Key.ToString(),
                });
                count++;
            }
            ViewBag.cCommunityStatus = items;

            return View(t);


        }
        [HttpPost]
        public ActionResult CommunityStatusEdit(int fId, int fcs)
        {
            tCommunity c = db.tCommunity.FirstOrDefault(f => f.fId == fId);
            if (c != null)
            {

                c.fStatusId = fcs;
                db.SaveChanges();
            }

            return RedirectToAction("CommunityList");


        }

        public ActionResult CommunityDetailsEdit(int? id)
        {
            if (id == null)
                return RedirectToAction("CommunityList");
            tCommunity t = db.tCommunity.FirstOrDefault(m => m.fId == id);

            return View(t);
        }
        [HttpPost]
        public ActionResult CommunityDetailsEdit(tCommunity t)
        {
            tCommunity A = db.tCommunity.FirstOrDefault(m => m.fId == t.fId);
            if (A != null)
            {
                A.fName = t.fName;
                A.fInfo = t.fInfo;
                A.fDate = t.fDate;
                A.fStatusId = t.fStatusId;
                A.fImgPath = t.fImgPath;

                db.SaveChanges();
            }
            return RedirectToAction("CommunityList");

        }
        public ActionResult CommunityDelete(int? id)
        {
            tCommunity c = db.tCommunity.FirstOrDefault(f => f.fId == id);
            if (c == null)
                return RedirectToAction("CommunityList");

            db.tCommunity.Remove(c);
            db.SaveChanges();

            return RedirectToAction("CommunityList");
        }
    }
}