using backe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace back.Controllers
{
    public class MembersController : Controller
    {
        SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
        // GET: Member
        public ActionResult MemberList()
        {
            string keyword = Request.Form["txtKeyword"];
            var s = from m in db.tMember
                    select 
                    new backe.Models.MemberListDetail
                    {
                        fId=m.fId,
                        fAccount = m.fAccount,
                        fName = m.fName,
                        fCoins = m.fCoins,
                        fAccountType = m.tAccountType.fAccountType
                    };
            if (string.IsNullOrEmpty(keyword))
            {
                s = from m in db.tMember
                    select
                    new backe.Models.MemberListDetail
                    {
                        fId = m.fId,
                        fAccount = m.fAccount,
                        fName = m.fName,
                        fCoins = m.fCoins,
                        fAccountType = m.tAccountType.fAccountType
                    };
            }
            else
            {
                s = from m in db.tMember
                    where m.fName.Contains(keyword)
                    select
                    new backe.Models.MemberListDetail
                    {
                        fId = m.fId,
                        fAccount = m.fAccount,
                        fName = m.fName,
                        fCoins = m.fCoins,
                        fAccountType = m.tAccountType.fAccountType
                    };
            }
           
            //得到下拉式選單
            var cAccountType = db.tAccountType.ToDictionary(x => x.fId, y => y.fAccountType);
            List<SelectListItem> items = new List<SelectListItem>();


            int count = 0;
            foreach (var ca in cAccountType)
            {
                items.Add(new SelectListItem()
                {
                    Text = ca.Value + "[" + count + ']',

                    Value = ca.Key.ToString()
                });
                count++;
            }
            ViewBag.cAccountType = items;
            //end

             
            return View(s);
        }


      
        public ActionResult AccountTypeEdit(int? id)
        {
            if (id == null)
                return RedirectToAction("MemberList");
           
            var table = from s in db.tMember
                        join p in db.tAccountType on s.fAccountTypeId equals (p.fId)
                        select s;
            ViewBag.fId = id;
            //得到下拉式選單
            var cAccountType = db.tAccountType.ToDictionary(x => x.fId, y => y.fAccountType);
            List<SelectListItem> items = new List<SelectListItem>();


            int count = 0;
            foreach (var ca in cAccountType)
            {
                items.Add(new SelectListItem()
                {
                    Text = ca.Value + "[" + count + ']',

                    Value = ca.Key.ToString()
                });
                count++;
            }
            ViewBag.cAccountType = items;
            //end









            return View(table);
        }
        [HttpPost]
        public ActionResult AccountTypeEdit(int fNumber, int fId)
        {

            
            tMember mem = db.tMember.FirstOrDefault(m => m.fId == fId);
            if (mem != null)
            {
                mem.fAccountTypeId = fNumber;
                db.SaveChanges();
            }


            return RedirectToAction("MemberList");
        }






        public ActionResult AccountProfileEdit(int? id)
        {
            if (id == null)
                return RedirectToAction("MemberList");
            
            tMember mem = db.tMember.FirstOrDefault(m => m.fId == id);
            return View(mem);
        }
        [HttpPost]
        public ActionResult AccountProfileEdit(tMember t)
        {
            
            tMember Newmember = db.tMember.FirstOrDefault(m => m.fId == t.fId);
            if (Newmember != null)
            {
                Newmember.fAccount = t.fAccount;
                Newmember.fPassword = t.fPassword;
                Newmember.fName = t.fName;
                Newmember.fBirthdate = t.fBirthdate;
                Newmember.fIdentifyId = t.fIdentifyId;
                Newmember.fAddress = t.fAddress;
                Newmember.fCity = t.fCity;
                Newmember.fCeilphoneNumber = t.fCeilphoneNumber;
                Newmember.fGender = t.fGender;
                Newmember.fIntroduction = t.fIntroduction;
                Newmember.fPhotoPath = t.fPhotoPath;
                db.SaveChanges();
            }


            return RedirectToAction("MemberList");
        }
        public ActionResult AccountDelete(int? id)
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

