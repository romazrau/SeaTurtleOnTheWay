using Backstage.Models;
using System;
using System.Collections.Generic;
using System.IO;
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
        public ActionResult CommunityList(int? ch)
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
            /*排序*/

            switch (ch)
            {
                case 0:
                    t = t.OrderBy(s => s.fId);
                    break;
                case 1:
                    t = t.OrderBy(s => s.fDate);
                    break;
                case 2:
                    t = t.OrderByDescending(s => s.fDate);
                    break;
                case 3:
                    t = t.OrderByDescending(s => s.fStatusName);
                    break;
                
                default:
                    t = t.OrderBy(s => s.fId);
                    break;
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
            /*狀態下拉*/
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
        public ActionResult CommunityDetailsEdit(tCommunity t)
        {
            
            tCommunity A = db.tCommunity.FirstOrDefault(m => m.fId == t.fId);
            if (A != null)
            {
                A.fName = t.fName;
                A.fInfo = t.fInfo;
                A.fDate = t.fDate;
                A.fStatusId = int.Parse(Request["DDL"]);
                if (t.fImage != null)
                {
                    string photoName = Guid.NewGuid().ToString() + Path.GetExtension(t.fImage.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/"), photoName);
                    t.fImage.SaveAs(path);
                    t.fImgPath = "../Content/" + photoName;
                }
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
        public ActionResult CommunityCreate()
        {
            /*取得狀態*/
            var cCommunityType = db.tStatus.ToDictionary(x => x.fId, y => y.fName);
            List<SelectListItem> items = new List<SelectListItem>();
            int count = 0;
            foreach (var ct in cCommunityType)
            {
                items.Add(new SelectListItem()
                {
                    Text = ct.Value + "[" + count + "]",
                    Value = ct.Key.ToString(),
                });
                count++;
            }
            ViewBag.cCommunityType = items;

            return View();
        }
        [HttpPost]
        public ActionResult CommunityCreate(tCommunity x)
        {
            x.fStatusId =int.Parse( Request.Form["StatusDDL"]);
            if (x.fImage != null)
            {
                string photoName = Guid.NewGuid().ToString() + Path.GetExtension(x.fImage.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/"), photoName);
                x.fImage.SaveAs(path);
                x.fImgPath = "../Content/" + photoName;
            }






            db.tCommunity.Add(x);
            db.SaveChanges();

            return RedirectToAction("CommunityList");
        }
    }
}