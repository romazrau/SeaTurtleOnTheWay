using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace AspSeaTurtleOnTheWay.Controllers
{
    public class MemberController : ApiController
    {
        // GET: api/Member
        public string Get()
        {

            SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
            var t = from ele in db.tMember
                    select ele;

            try
            {
                string jsonData = JsonConvert.SerializeObject(t, Formatting.Indented,
                               new JsonSerializerSettings
                               {
                                   PreserveReferencesHandling = PreserveReferencesHandling.Objects
                               });

                return jsonData;
            }
            catch (Exception e)
            {
                return $"['錯誤訊息': '{e.Message}']";
            }
        }

        // GET: api/Member/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Member
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Member/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Member/5
        public void Delete(int id)
        {
        }
    }
}
