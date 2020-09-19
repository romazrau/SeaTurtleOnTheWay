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
        int pages = 10;
        SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
        // GET: Tag
        public ActionResult TagList(int page=1)
        {
            int currentPage = page < 1 ? 1 : page;       //判斷page
            var ActTag = db.tActivityLabel.OrderBy(x => x.fId);   //一定要先排序
            var result = ActTag.ToPagedList(currentPage, pages);  //使用ToPagedList
                       

            IQueryable<tActivityLabel> t = null;
            //IQueryable<tActivityHadLabel> th = null;
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
                    where s.fLabelName.Contains("天")
                    orderby s.fId
                    select s;
            }
            ViewBag.page = currentPage;


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

        
        [HttpPost][ValidateInput(false)]
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




        public ActionResult TagEdit(int? id,int page=1)
        {
            if (id == null) 
                return RedirectToAction("TagList");
            
            int currentPage = page < 1 ? 1 : page;
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
            var r = t.ToPagedList(currentPage, pages);
            return View(r);

        }
        [HttpPost][ValidateInput(false)]
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

        public ActionResult Highchats() 
        {
            return View();
        }


    }
}