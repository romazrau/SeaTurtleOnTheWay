﻿using Backstage.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Windows;

namespace Backstage.Controllers
{
    public class MemberController : Controller
    {
        int pagesize = 10;
        SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
        // GET: Member

        public ActionResult List(int? ch, int page = 1)
        {
            IQueryable<MemberList> t = null;
            string keyword = Request.Form["txtKeyword"];
            int currentPage = page < 1 ? 1 : page;

            if (string.IsNullOrEmpty(keyword))
            {
                t = from m in db.tMember
                    where m.fId>2
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
                    where m.fAccount.Contains(keyword) && m.fId > 2
                    select new Models.MemberList
                    {
                        fId = m.fId,
                        fAccount = m.fAccount,
                        fCoins = m.fCoins,
                        fAccountType = m.tAccountType.fAccountType,
                        fPhotoPath = m.fPhotoPath,
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
                    t = t.OrderByDescending(s => s.fCoins);
                    
                    break;
                case 3:
                    t = t.OrderBy(s => s.fCoins);
                    break;
                case 4:
                    t = t.OrderByDescending(s => s.fAccountType);
                    break;
                case 5:
                    t = t.OrderBy(s => s.fAccountType);
                    break;
                default:
                    t = t.OrderBy(s => s.fId);
                    break;
            }
            var result = t.ToPagedList(currentPage, pagesize);

            return View(result);
        }
        public ActionResult MemberTypeEdit(int? id,int page=1)
        {
            int currentPage = page < 1 ? 1 : page;
            if (id == null) return RedirectToAction("List");
            var t = from m in db.tMember
                    orderby m.fId
                    where m.fId > 2
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
                });
                count++;
            }
            ViewBag.cAccountType = items;
            var result = t.ToPagedList(currentPage, pagesize);


            return View(result);
        }
        [HttpPost][ValidateInput(false)]
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
            tMember m = db.tMember.FirstOrDefault(f => f.fId == id);
            /*下拉*/
            var cAccountType = db.tAccountType.ToDictionary(x => x.fId, y => y.fAccountType);
            List<SelectListItem> items = new List<SelectListItem>();
            int count = 0;
            foreach (var ca in cAccountType)
            {
                items.Add(new SelectListItem()
                {
                    Text = ca.Value + "[" + count + "]",
                    Value = ca.Key.ToString(),
                });
                count++;
            }
            ViewBag.cAccountType = items;
            return View(m);
        }
        [HttpPost][ValidateInput(false)]
        public ActionResult MemberDetailEdit(tMember nm)
        {
            tMember x = db.tMember.FirstOrDefault(f => f.fId == nm.fId);
            
            if (nm.fImage != null)
            {
                string photoName = Guid.NewGuid().ToString() + Path.GetExtension(nm.fImage.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/"), photoName);
                nm.fImage.SaveAs(path);
                nm.fPhotoPath = "../Content/" + photoName;
            }


            if (x != null)
            {
                x.fAccount = nm.fAccount;
                x.fPassword = nm.fPassword;
                x.fName = nm.fName;
                x.fBirthdate = nm.fBirthdate;
                x.fMail = nm.fMail;
                x.fCoins = nm.fCoins;
                x.fAddress = nm.fAddress;
                x.fCity = nm.fCity;
                x.fCeilphoneNumber = nm.fCeilphoneNumber;
                
                x.fAccountTypeId = int.Parse(Request.Form["AcountType_DDL"]);
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
                return RedirectToAction("List");

            db.tMember.Remove(a);
            db.SaveChanges();
            return RedirectToAction("List");


        }


        public ActionResult MemberDetailsList(int page=1)
        {
            int currentPage = page < 1 ? 1 : page;
            var t = from m in db.tMember
                    orderby m.fId
                    select m;
            var result = t.ToPagedList(currentPage, pagesize);



            return View(result);
        }


        public ActionResult MemberCreate()
        {
            return View();
        }
        [HttpPost][ValidateInput(false)]
        public ActionResult MemberCreate(tMember x)
        {
            tMember check = db.tMember.FirstOrDefault(f => f.fAccount == x.fAccount);
            if (check == null)
            {
                x.fCoins = 100;
                x.fAccountTypeId = 1; 
                if (x.fImage != null)
            {
                string photoName = Guid.NewGuid().ToString() + Path.GetExtension(x.fImage.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/"), photoName);
                x.fImage.SaveAs(path);
                x.fPhotoPath = "../Content/" + photoName;
            }


                db.tMember.Add(x);
                db.SaveChanges();
            }
            else {
                MessageBox.Show("帳號已存在");
                return View();
            }

            return RedirectToAction("List");
        }

        public ActionResult Highchatsyear()
        {
            DateTime nowdate = DateTime.Now;
            //var test = db.tActivity.GroupBy(o =>o.fActivityDate.Substring(0,7)).Select(g=>g.)

            


            int year1020 = db.tMember.AsEnumerable().Where(x => nowdate.Year - int.Parse(x.fBirthdate.Substring(0,4)) < 21).Count();
            int year2130 = db.tMember.AsEnumerable().Where(x => nowdate.Year - int.Parse(x.fBirthdate.Substring(0,4))> 20 && nowdate.Year - int.Parse(x.fBirthdate.Substring(0,4)) < 31).Count();
            int year3140 = db.tMember.AsEnumerable().Where(x => nowdate.Year - int.Parse(x.fBirthdate.Substring(0,4))> 30 && nowdate.Year - int.Parse(x.fBirthdate.Substring(0,4)) < 41).Count();
            int year4150 = db.tMember.AsEnumerable().Where(x => nowdate.Year - int.Parse(x.fBirthdate.Substring(0,4))> 40 && nowdate.Year - int.Parse(x.fBirthdate.Substring(0,4)) < 51).Count();
            int year51 = db.tMember.AsEnumerable().Where(x => nowdate.Year - int.Parse(x.fBirthdate.Substring(0,4))> 50 ).Count();
            ratio obj = new ratio();
            obj.year1020 = year1020;
            obj.year2130 = year2130;
            obj.year3140 = year3140;
            obj.year4150 = year4150;
            obj.year51 = year51;

            return Json(obj, JsonRequestBehavior.AllowGet);
        }


        public class ratio
        {
            public int year1020 { get; set; }
            public int year2130 { get; set; }
            public int year3140 { get; set; }
            public int year4150 { get; set; }
            public int year51 { get; set; }
            //public int oldman { get; set; }

        }

    }
}