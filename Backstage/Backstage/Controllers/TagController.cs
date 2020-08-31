using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Windows;
using PagedList;

namespace Backstage.Controllers
{
    public class TagController : Controller
    {
        SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
        // GET: Tag
        public ActionResult TagList(int page=1)
        {
            int currentPage = page < 1 ? 1 : page;       //判斷page
            var ActTag = db.tActivityLabel.OrderBy(x => x.fId);   //一定要先排序
            var result = ActTag.ToPagedList(currentPage, 10);  //使用ToPagedList
                       

            IQueryable<tActivityLabel> t = null;
            IQueryable<tActivityHadLabel> th = null;
            string keyword = Request.Form["txtKeyword"];
            if (string.IsNullOrEmpty(keyword))
            {
                
                t = from s in db.tActivityLabel
                    orderby s.fId
                    select s;
            }
            else
            {
                t = from s in db.tActivityLabel
                    where s.fLabelName.Contains(keyword)
                    orderby s.fId
                    select s;
            }
            
            return View(result);

        }


        public ActionResult TagAdd()
        {
            IQueryable<tActivityLabel> t = null;
            string keyword = Request.Form["txtKeyword"];
            if (string.IsNullOrEmpty(keyword))
            {
                t = from s in db.tActivityLabel
                    orderby s.fId
                    select s;
            }
            else
            {
                t = from s in db.tActivityLabel
                    where s.fLabelName.Contains(keyword)
                    orderby s.fId
                    select s;
            }
            return View(t);
        }

        
        [HttpPost]
        public ActionResult TagAdd(string NewTag)
        {

            tActivityLabel tag = db.tActivityLabel.FirstOrDefault(f => f.fLabelName == NewTag);
            if (tag == null)
            {
                tActivityLabel N = new tActivityLabel();
                N.fLabelName = NewTag;
                db.tActivityLabel.Add(N);
                db.SaveChanges();

            }
            else
            {
                MessageBox.Show("已擁有此標籤");
                return View();
            }
            return RedirectToAction("TagList");
        }




        public ActionResult TagEdit(int? id)
        {
            if (id == null) return RedirectToAction("TagList");

            IQueryable<tActivityLabel> t = null;
            string keyword = Request.Form["txtKeyword"];
            if (string.IsNullOrEmpty(keyword))
            {
                t = from s in db.tActivityLabel
                    orderby s.fId
                    select s;
            }
            else
            {
                t = from s in db.tActivityLabel
                    where s.fLabelName.Contains(keyword)
                    orderby s.fId
                    select s;
            }

            ViewBag.fId = id;
            return View(t);

        }
        [HttpPost]
        public ActionResult TagEdit(string fName,int fId)
        {
            tActivityLabel t = db.tActivityLabel.FirstOrDefault(f => f.fId == fId);
            if (t != null)
            {
                t.fLabelName = fName;
                db.SaveChanges();
            }

            return RedirectToAction("TagList");
        }

        public ActionResult TagDelete(int? id)
        {
            tActivityLabel x = db.tActivityLabel.FirstOrDefault(f => f.fId==id);

            db.tActivityLabel.Remove(x);
            db.SaveChanges();
            return RedirectToAction("TagList");

        }




    }
}