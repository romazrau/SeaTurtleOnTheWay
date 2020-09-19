using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Backstage.viewmodel
{
    public class postDetailViewModel
    {
        [DisplayName("序")]
        public int fId { get; set; }
        [DisplayName("發文者")]
        public string fMember { get; set; }
        [DisplayName("社團")]
        public string fCommunity { get; set; }
        [DisplayName("發表時間")]
        public string fPostTime { get; set; }
        [DisplayName("發文內容")]
        public string fContent { get; set; }
        [DisplayName("照片")]
        public string fImgPaths { get; set; }
    }
}