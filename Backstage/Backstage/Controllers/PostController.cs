using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Backstage.Controllers
{
    public class PostController : Controller
    {
        // GET: Post
        public ActionResult Index()
        {
            return View();
        }
        SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
        public ActionResult list(int page = 1)
        {
            int currentPage = page < 1 ? 1 : page;
            IQueryable<viewmodel.postDetailViewModel> x = null;
            string txt = Request.Form["txtSearch"];
            if (txt == null)
            {
                x = from t in db.tPost
                    orderby t.fId
                    select new viewmodel.postDetailViewModel
                    {
                        fId = t.fId,
                        fMember = t.tMember.fName,
                        fCommunity = t.tCommunity.fName,
                        fContent = t.fContent,
                        fImgPaths = t.fImgPaths,
                        fPostTime = t.fPostTime
                    };
            }
            else
            {
                x = from t in db.tPost
                    where t.fContent.Contains(txt)
                    orderby t.fId
                    select new viewmodel.postDetailViewModel
                    {
                        fId = t.fId,
                        fMember = t.tMember.fName,
                        fCommunity = t.tCommunity.fName,
                        fContent = t.fContent,
                        fImgPaths = t.fImgPaths,
                        fPostTime = t.fPostTime
                    };
            };



            var result = x.ToPagedList(currentPage, 4);
            return View(result);

        }
        public ActionResult create()
        {

            //會員名稱和社團名稱的下拉選單
            var dropOptMember = db.tMember.ToDictionary(m => m.fId, n => n.fName);
            var dropOptCommunity = db.tCommunity.ToDictionary(m => m.fId, n => n.fName);
            SelectList selMember = new SelectList(dropOptMember.Values);
            SelectList selCommunity = new SelectList(dropOptCommunity.Values);
            ViewBag.KK = selMember;
            ViewBag.QQ = selCommunity;
            //上傳圖片
            //HttpPostedFileBase up = new HttpPostedFileBase();

            return View();
        }
        [HttpPost][ValidateInput(false)]
        public ActionResult create(tPost x)
        {
            db.tPost.Add(x);
            db.SaveChanges();
            return RedirectToAction("list");
        }
        public ActionResult delete(int? id)
        {
            if (id == null)
            {
                return View("list");
            }
            else
            {
                tPost x = db.tPost.FirstOrDefault(m => m.fId == id);
                db.tPost.Remove(x);
                db.SaveChanges();
                return RedirectToAction("list");
            }
        }
        public ActionResult edit(int? id)
        {

            if (id == null)
            {
                return View("list");
            }
            else
            {
                tPost x = db.tPost.FirstOrDefault(m => m.fId == id);
                return View(x);
            }
        }
        [HttpPost][ValidateInput(false)]
        public ActionResult edit(tPost x)
        {
            tPost y = db.tPost.FirstOrDefault(m => m.fId == x.fId);
            if (y == null)
            {
                return View("list");
            }
            else
            {
                y.fMemberId = x.fMemberId;
                y.fCommunityId = x.fCommunityId;
                y.fContent = x.fContent;
                y.fPostTime = x.fPostTime;
                y.fImgPaths = x.fImgPaths;
                db.SaveChanges();
                return RedirectToAction("list");
            }

        }
        public ActionResult replyList(int? id)
        {
            
            var t = from r in db.tReply
                    where r.fPostId == id
                    select r;

            return View(t);
        }

        public ActionResult replyDelete(int? id)
        {

            tReply r = db.tReply.FirstOrDefault(m => m.fId == id);
             db.tReply.Remove(r);
            db.SaveChanges();

            return RedirectToAction("list");
        }

    }
}