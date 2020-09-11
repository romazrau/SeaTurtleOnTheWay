using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Backstage.Controllers
{
    public class CommunityMemberListController : Controller
    {
        // GET: CommunityMemberList
        public ActionResult Index()
        {
            return View();
        }
        SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
        public ActionResult list()
        {
            var table = from t in db.tMemberList
                        orderby t.fId
                        select t;
            return View(table);
        }
        public ActionResult edit(int? id)
        {
            tMemberList s = db.tMemberList.FirstOrDefault(m => m.fId == id);


            var arr_MemberName = from t in db.tMember
                                 select t;
            ViewBag.fMemberId = arr_MemberName.Select(x => new SelectListItem
            {
                Text = x.fName,
                Value = x.fId.ToString(),
                Selected = s.fMemberId == x.fId,

            });
            var arr_CommunityName = from t in db.tCommunity
                                    select t;
            ViewBag.fCommunityId = arr_CommunityName.Select(x => new SelectListItem
            {
                Text = x.fName,
                Value = x.fId.ToString(),
                Selected = s.fCommunityId == x.fId,
            }
            );
            var arr_AccessName = from t in db.tAccessRight
                                 select t;
            ViewBag.fAccessRightId = arr_AccessName.Select(x => new SelectListItem
            {
                Text = x.fName,
                Value = x.fId.ToString(),
                Selected = s.fAccessRightId == x.fId,

            }
                );
            //var arr = from t in db.tMember
            //          select t;
            //ViewBag.fMemberId = arr.Select(x => new SelectListItem
            //{
            //    Text = x.fName,
            //    Value = x.fId.ToString(),
            //});
            return View(s);
        }
        [HttpPost]
        public ActionResult edit(tMemberList x)
        {
            tMemberList s = db.tMemberList.FirstOrDefault(m => m.fId == x.fId);
            //pass by address
            s.fId = x.fId;
            s.fCommunityId = x.fCommunityId;
            s.fJoinDate = x.fJoinDate;
            s.fMemberId = x.fMemberId;
            s.fAccessRightId = x.fAccessRightId;
            db.SaveChanges();
            return RedirectToAction("list");

        }

        public ActionResult Create()
        {

            //var arr = db.tMember.ToDictionary(x => x.fId, y => y.fName);
            //SelectList sl = new SelectList(arr);
            //ViewBag.optMember = sl;
            var arr = from t in db.tMember
                      select t;
            ViewBag.fMemberId = arr.Select(x => new SelectListItem
            {
                Text = x.fName,
                Value = x.fId.ToString(),
            });


            var arr2 = from t in db.tCommunity
                       select t;
            ViewBag.fCommunityId = arr2.Select(x => new SelectListItem
            {
                Text = x.fName,
                Value = x.fId.ToString(),
            }
            );

            var arr3 = from t in db.tAccessRight
                       select t;
            ViewBag.fAccessRightId = arr3.Select(x => new SelectListItem
            {
                Text = x.fName,
                Value = x.fId.ToString(),
            }
                );


            return View();
        }

        [HttpPost]
        public ActionResult create(tMemberList x)
        {
            db.tMemberList.Add(x);
            db.SaveChanges();
            return RedirectToAction("list");
        }


        //刪除
        public ActionResult delete(int? id)
        {

            tMemberList x = db.tMemberList.FirstOrDefault(s => s.fId == id);
            db.tMemberList.Remove(x);
            db.SaveChanges();
            return RedirectToAction("list");
        }






    }
}