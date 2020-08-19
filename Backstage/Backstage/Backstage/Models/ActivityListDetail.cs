using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Backstage.Models
{
    public class ActivityListDetail
    {
        [DisplayName("序號")]
        public int fId { get; set; }
        [DisplayName("活動名稱")]
        public string fActName { get; set; }
        [DisplayName("提交日期")]
        public System.DateTime fCreatDate { get; set; }
        [DisplayName("活動日期")]
        public System.DateTime fActivityDate { get; set; }
        [DisplayName("最小人數限制")]
        public Nullable<int> fMinLimit { get; set; }
        [DisplayName("認證狀態")]
        public string fAttestName { get; set; }
        [DisplayName("活動狀態")]
        public string fStatusName { get; set; }
        [DisplayName("主要類型")]
        public string fLabelName { get; set; }
    }
}