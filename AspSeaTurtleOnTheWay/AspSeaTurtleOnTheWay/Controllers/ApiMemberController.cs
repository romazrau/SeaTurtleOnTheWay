using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace AspSeaTurtleOnTheWay.Controllers
{
    public class ApiMemberController : ApiController
    {
        // GET: api/ApiMember
        public List<tMember> Get()
        {
            SeaTurtleOnTheWayEntities db = new SeaTurtleOnTheWayEntities();
            var s = from t in db.tMember
                    select t;
            List<tMember> outlist = s.ToList();
            //因為有null所以噴錯(?


            return outlist;
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
