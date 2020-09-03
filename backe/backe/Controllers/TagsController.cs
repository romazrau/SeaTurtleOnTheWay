using backe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace back.Controllers
{
    public class TagsController : Controller
    {
        // GET: Tags
        public ActionResult ProductTagsList()
        {

            SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
            IQueryable<tProductTag> t = null;
            string keyword = Request.Form["txtKeyword"];
            if (string.IsNullOrEmpty(keyword))
            {
                t = from s in db.tProductTag
                    orderby s.fId
                    select s;
            }
            else
            {
                t = from s in db.tProductTag
                    where s.fName.Contains(keyword)
                    orderby s.fId
                    select s;
            }


            return View(t);
        }
        public ActionResult ProductTagsNew()
        {
            SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
            IQueryable<tProductTag> t = null;
            string keyword = Request.Form["txtKeyword"];
            if (string.IsNullOrEmpty(keyword))
            {
                t = from s in db.tProductTag
                    orderby s.fId
                    select s;
            }
            else
            {
                t = from s in db.tProductTag
                    where s.fName.Contains(keyword)
                    orderby s.fId
                    select s;
            }

            return View(t);
        }
        [HttpPost]
        public ActionResult ProductTagsNew(tProductTag x)
        {
            SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();


            x.fName = Request.Form["fName"];
            db.tProductTag.Add(x);
            try
            {
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                throw;
            }

            return RedirectToAction("ProductTagsList");
        }


        public ActionResult ProductTagsEdit(int? id)
        {
            if (id == null)
                return RedirectToAction("ProductTagsList");

            SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
            var t = from s in db.tProductTag
                    orderby s.fId
                    select s;
            tProductTag tag = db.tProductTag.FirstOrDefault(m => m.fId == id);

            ViewBag.fId = id;
            ViewBag.fName = tag.fName;


            return View(t);
        }
        [HttpPost]
        public ActionResult ProductTagsEdit(int fId, string fName)
        {
            SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
            tProductTag target = db.tProductTag.FirstOrDefault(m => m.fId == fId);
            if (target != null)
            {
                target.fName = fName;
                db.SaveChanges();
            }


            return RedirectToAction("ProductTagsList");
        }

        public ActionResult ProductTagsDelete(int? id)
        {
            if (id == null)
                return RedirectToAction("ProductTagsList");
            SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
            tProductTag target = db.tProductTag.FirstOrDefault(m => m.fId == id);
            if (target != null)
            {
                db.tProductTag.Remove(target);
                db.SaveChanges();
            }
            return RedirectToAction("ProductTagsList");

        }













    }
}