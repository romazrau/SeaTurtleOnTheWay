using AspSeaTurtleOnTheWay.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Cors;
using System.Web.Mvc;

namespace AspSeaTurtleOnTheWay.Controllers
{
    public class AccountController : Controller
    {
        public class accountLogin
        {
            public string account { get; set; }
            public string password { get; set; }
        }

        [HttpPost]
        public JsonResult Login(accountLogin obj)
        {

            SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
            tMember me = db.tMember.FirstOrDefault(t => t.fAccount == obj.account & t.fPassword == obj.password);
            if (me == null)
            {
                return Json(new { msg= "帳號或密碼錯誤", result = "0" ,  obj.account });
            }

            Session[ClsSessionKey.login_member_Entity_obj] = me;

            return Json( new { result = "1", account = me.fAccount, name = me.fName, id = me.fId });

        }

        [HttpGet]
        public JsonResult Login()
        {
            tMember me = Session[ClsSessionKey.login_member_Entity_obj] as tMember;
            if(me == null)
            {
                return Json(new { msg = "尚未登入", result = "0" }, JsonRequestBehavior.AllowGet);
            }

            return Json(new { msg = $"登入帳號為{me.fName}", result = "1", account = me.fAccount, name = me.fName, id= me.fId }, JsonRequestBehavior.AllowGet);

        }

        [HttpGet]
        public JsonResult Logout()
        {
            Session.Remove(ClsSessionKey.login_member_Entity_obj);
            tMember me = Session[ClsSessionKey.login_member_Entity_obj] as tMember;
            if (me == null)
            {
                return Json(new { msg = "成功登出", result = "1" }, JsonRequestBehavior.AllowGet);
            }

            return Json(new { msg = $"登出失敗???", result = "0", account = me.fAccount , name = me.fName, id = me.fId }, JsonRequestBehavior.AllowGet);

        }







    }
}