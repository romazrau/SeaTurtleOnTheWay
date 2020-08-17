using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Backstage.Models
{
    public class ActivityListDetail
    {
        public int fId { get; set; }
        public string fActName { get; set; }
        public System.DateTime fCreatDate { get; set; }
        public System.DateTime fActivityDate { get; set; }
        
        public Nullable<int> fMinLimit { get; set; }
        public string fAttestName { get; set; }
        public string fStatusName { get; set; }
        public string fLabelName { get; set; }
    }
}