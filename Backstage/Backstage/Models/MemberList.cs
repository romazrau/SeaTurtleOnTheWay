using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Backstage.Models
{
    public class MemberList
    {
        
        [DisplayName("序號")]
        public int fId { get; set; }
        [DisplayName("帳號")]
        public string fAccount { get; set; }
        [DisplayName("海龜積分")]
        public int fCoins { get; set; }
        [DisplayName("帳號等級")]
        public string fAccountType { get; set; }
        [DisplayName("圖片")]
        public string fPhotoPath { get; set; }

    }
}