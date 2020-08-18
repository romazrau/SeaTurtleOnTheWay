using Backstage.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Backstage.Controllers
{
    public class PointController : Controller
    {
        SeaTurtleOnTheWayEntities db =new SeaTurtleOnTheWayEntities();

        
        // GET: Point
        public ActionResult CheckList(int? ch)
        { 
                IQueryable<ActivityListDetail> t = null;
                string keyword = Request.Form["txtKeyword"];

                if (string.IsNullOrEmpty(keyword))
                {
                    t = from a in db.tActivity
                        where a.fActivityEndDate < DateTime.Now
                        select new Models.ActivityListDetail
                        {
                            fId = a.fId,
                            fActName = a.fActName,
                            fCreatDate = a.fCreatDate,
                            fActivityDate = a.fActivityDate,
                            fMinLimit = a.fMinLimit,
                            fAttestName = a.tAttestType.fAttestName,
                            fStatusName = a.tActivityType.fStatusName,
                            fLabelName = a.tActivityMainLabel.fLabelName,
                        };
                }
                else
                {
                    t = from a in db.tActivity
                        where a.fActName.Contains(keyword) && a.fActivityEndDate < DateTime.Now
                        select new Models.ActivityListDetail
                        {
                            fId = a.fId,
                            fActName = a.fActName,
                            fCreatDate = a.fCreatDate,
                            fActivityDate = a.fActivityDate,
                            fMinLimit = a.fMinLimit,
                            fAttestName = a.tAttestType.fAttestName,
                            fStatusName = a.tActivityType.fStatusName,
                            fLabelName = a.tActivityMainLabel.fLabelName,
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
                        t = t.OrderBy(s => s.fActivityDate);
                        break;
                    case 3:
                        t = t.OrderByDescending(s => s.fActivityDate);
                        break;
                    case 4:
                        t = t.OrderByDescending(s => s.fMinLimit);
                        break;
                    case 5:
                        t = t.OrderBy(s => s.fMinLimit);
                        break;
                    default:
                        t = t.OrderBy(s => s.fId);
                        break;
                }



                return View(t);

            }


        
    }
}