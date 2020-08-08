using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AspSeaTurtleOnTheWay.Controllers
{
    public class MemberController : Controller
    {

        // GET: Account
        public ActionResult Index()
        {
            return View();
        }


        public string Member()
        {
            SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
            var s = from t in db.tMember
                    select t;
            List<tMember> outlist = s.ToList();

            try
            {
                string jsonData = JsonConvert.SerializeObject(s, Formatting.Indented,
                               new JsonSerializerSettings
                               {
                                   PreserveReferencesHandling = PreserveReferencesHandling.Objects
                               });


                return jsonData;
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }


        [HttpPost]
        public string Transcripts(FormCollection post)
        {
            string account = post["account"];
            string password = post["password"];
           
            return $"{account} , {password}";
        }











    }
}