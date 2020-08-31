using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Backstage.Models
{
    public class CommunityListDetail
    {
        [DisplayName("序號")]
        public int fId { get; set; }
        [DisplayName("社團名稱")]
        public string fName { get; set; }
        [DisplayName("成立日期")]
        public string fDate { get; set; }
        [DisplayName("簡介")]
        public string fInfo { get; set; }
        [DisplayName("社團狀態")]
        public string fStatusName { get; set; }
        [DisplayName("圖片路徑")]
        public string fImgPath { get; set; }


       
    }
}