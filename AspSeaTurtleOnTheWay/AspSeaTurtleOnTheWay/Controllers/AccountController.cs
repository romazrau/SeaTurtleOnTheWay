using AspSeaTurtleOnTheWay.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Cors;
using System.Web.Mvc;
using System.Net;
using System.Net.Mail;

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


        //測試計信用
        [HttpGet]
        public string SendEmail()
        {
            //設定smtp主機
            string smtpAddress = "smtp.gmail.com";
            //設定Port
            int portNumber = 587;
            bool enableSSL = true;
            //填入寄送方email和密碼
            string emailFrom = "cycle2link@gmail.com";
            string password = "everybodycanuse";
            //收信方email 可以用逗號區分多個收件人
            string emailTo = "cycle2link@gmail.com";
            //主旨
            string subject = "Hello, cycle2link";
            //內容
            string body = "Hello, I'm just writing this to say Hi!";

            try
            {
                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(emailFrom);
                    mail.To.Add(emailTo);
                    mail.Subject = subject;
                    mail.Body = body;
                    // 若你的內容是HTML格式，則為True
                    mail.IsBodyHtml = false;

                    //如果需要夾帶檔案
                    //mail.Attachments.Add(new Attachment("C:\\SomeFile.txt"));
                    //mail.Attachments.Add(new Attachment("C:\\SomeZip.zip"));

                    using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                    {
                        smtp.Credentials = new NetworkCredential(emailFrom, password);
                        smtp.EnableSsl = enableSSL;
                        smtp.Send(mail);
                        return "OK";
                    }
                }
            }catch(Exception ex)
            {
                return ex.Message;
            }
        }






    }
}