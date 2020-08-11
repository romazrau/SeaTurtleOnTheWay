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
        // GET: api/ApiMember
        public string Get()
        {
            SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
            var s = from t in db.tMember
                    select t;


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




        // GET: api/ApiMember/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/ApiMember
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/ApiMember/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/ApiMember/5
        public void Delete(int id)
        {
        }
    }
}
