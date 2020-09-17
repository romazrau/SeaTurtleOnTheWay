using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Backstage.viewmodel
{
    public class Join_member_list
    {
        [DisplayName("序")]
        public int fId { get; set; }
        [DisplayName("活動名稱")]
        public string fActivityName { get; set; }
        [DisplayName("會員名稱")]

        public string fMemberName { get; set; }
        [DisplayName("加入時間")]
        public string fJoinTime { get; set; }
        [DisplayName("類別")]
        public string fJoinTypeName { get; set; }
    }
}