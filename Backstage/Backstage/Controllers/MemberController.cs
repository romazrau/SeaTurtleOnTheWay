using Backstage.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Backstage.Controllers
{
    public class MemberController : Controller
    {
        SeaTurtleOnTheWayEntities1 db = new SeaTurtleOnTheWayEntities1();
        // GET: Member
        //public ActionResult List()
        //{
        //    IQueryable<MemberList> t = null;
        //    //string keyword = Request.Form["txtKeyword"];
        //    //if (string.IsNullOrEmpty(keyword))
        //    //{
        //        t = from m in db.tMember
        //            select new Models.MemberList
        //            {
        //                fId = m.fId,
        //                fAccount = m.fAccount,
        //                fCoins = m.fCoins,
        //                fAccountType = m.tAccountType.fAccountType,
        //                fPhotoPath = m.fPhotoPath,
        //            };
        //    //}
        //    //else {
        //    //    t = from m in db.tMember
        //    //        where m.fAccount.Contains(keyword)
        //    //        select new Models.MemberList
        //    //        {
        //    //            fId = m.fId,
        //    //            fAccount = m.fAccount,
        //    //            fCoins = m.fCoins,
        //    //            fAccountType = m.tAccountType.fAccountType,
        //    //            fPhotoPath = m.fPhotoPath,
        //    //        };
        //    //}
            

        //    return View(t);
        //}
        //[HttpPost]
        public ActionResult List(int? changeNumber)
        {
            IQueryable<MemberList> t = null;
            string keyword = Request.Form["txtKeyword"];
            if (string.IsNullOrEmpty(keyword))
            {
                t = from m in db.tMember
                    select new Models.MemberList
                    {
                        fId = m.fId,
                        fAccount = m.fAccount,
                        fCoins = m.fCoins,
                        fAccountType = m.tAccountType.fAccountType,
                        fPhotoPath = m.fPhotoPath,
                    };
            }
            else
            {
                t = from m in db.tMember
                    where m.fAccount.Contains(keyword)
                    select new Models.MemberList
                    {
                        fId = m.fId,
                        fAccount = m.fAccount,
                        fCoins = m.fCoins,
                        fAccountType = m.tAccountType.fAccountType,
                        fPhotoPath = m.fPhotoPath,
                    };
            }
            

            switch (changeNumber)
            {
                case 0:
                    t = t.OrderBy(s => s.fCoins);
                    break;
                case 1:
                    t = t.OrderByDescending(s => s.fCoins);
                    break;
                case 2:
                    t = t.OrderBy(s => s.fId);
                    break;
                case 3:
                    t = t.OrderByDescending(s => s.fId);
                    break;

            }

            return View(t);
        }
        public ActionResult MemberTypeEdit(int? id)
        {
            if (id == null) return RedirectToAction("List");
            var t = from m in db.tMember
                    select new Models.MemberList
                    {
                        fId = m.fId,
                        fAccount = m.fAccount,
                        fCoins = m.fCoins,
                        fAccountType = m.tAccountType.fAccountType,
                        fPhotoPath = m.fPhotoPath,
                    };
            ViewBag.fId = id;
            
            /*會員類別下拉選單*/
            var cAccountType = db.tAccountType.ToDictionary(x => x.fId, y => y.fAccountType);
                List<SelectListItem> items = new List<SelectListItem>();
            int count = 0;
            foreach (var ca in cAccountType)
            {
                items.Add(new SelectListItem()
                {
                    Text = ca.Value + "[" + count + "]",
                    Value = ca.Key.ToString(),
                }) ;
                count++;
            }
            ViewBag.cAccountType = items;



            return View(t);
        }
        [HttpPost]
        public ActionResult MemberTypeEdit(int AccountTypeId, int fId)
        {
            tMember mem = db.tMember.FirstOrDefault(f => f.fId == fId);
                if (mem != null)
            {
                mem.fAccountTypeId = AccountTypeId;
                db.SaveChanges();
            
            }
            return RedirectToAction("List");
        }

        public ActionResult MemberDetailEdit(int? id)
        {
            if (id == null) return RedirectToAction("List");
            tMember x = db.tMember.FirstOrDefault(f => f.fId == id);
            return View(x);
        }
        [HttpPost]
        public ActionResult MemberDetailEdit(tMember nm)
        {
            tMember x = db.tMember.FirstOrDefault(f => f.fId ==nm.fId);

            if (x != null)
            {
                x.fAccount = nm.fAccount;
                x.fPassword = nm.fPassword;
                x.fName = nm.fName;
                x.fBirthdate = nm.fBirthdate;
                x.fIdentifyId = nm.fIdentifyId;
                x.fAddress = nm.fAddress;
                x.fCity = nm.fCity;
                x.fCeilphoneNumber = nm.fCeilphoneNumber;
                x.fGender = nm.fGender;
                x.fIntroduction = nm.fIntroduction;
                x.fPhotoPath = nm.fPhotoPath;
                db.SaveChanges();

            }
            return RedirectToAction("List");
        }

        public ActionResult MemberDelete(int? id)
        {
            tMember a = db.tMember.FirstOrDefault(m => m.fId == id);
            if (id == null)
                return RedirectToAction("MemberList");

            db.tMember.Remove(a);
            db.SaveChanges();
            return RedirectToAction("MemberList");


        }





    }
}