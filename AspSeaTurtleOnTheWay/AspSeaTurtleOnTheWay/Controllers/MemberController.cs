using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data.SqlClient;
using System.Data;
using AspSeaTurtleOnTheWay.Models;
using System.Web.Http.Cors;

namespace AspSeaTurtleOnTheWay.Controllers
{
    public class MemberController : ApiController
    {


        // GET: api/Member
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public string Get()
        {
            string s = @"select M.*, T.fAccountType as 'account type', T.fAccountAuthority as 'account authority'
                            from Member.tMember as M
                             LEFT join Member.tAccountType as T
                            on M.fAccountTypeId = T.fId; ";
            return ClsSqlQuery.SqlQuery(s);          
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
