using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Backstage.viewmodel
{
    public class active_list_detail
    {   
        [DisplayName("序")]
        public int fId { get; set; }
        [DisplayName("活動名稱")]
        public string fActName { get; set; }
        [DisplayName("申請日期")]
        public string fCreatDate { get; set; }
        [DisplayName("活動開始時間")]
        public string fActivityDate { get; set; }
        [DisplayName("活動結束時間")]
        public string fActivityEndDate { get; set; }

        //社團未有關聯?
        //public string fCommunityName { get; set; }
        [DisplayName("發起人")]
        public string fMemberName { get; set; }
        [DisplayName("詳細介紹")]
        public string fIntroduction { get; set; }
        [DisplayName("最大人數限制")]
        public int? fMaxLimit { get; set; }
        [DisplayName("最小人數限制")]
        public int? fMinLimit { get; set; }
        [DisplayName("活動等級")]
        public string fAttestName { get; set; }
        [DisplayName("活動狀態")]
        public string fStatusName { get; set; }
        [DisplayName("城市")]
        public string fActLocation { get; set; }
        [DisplayName("經度")]

        public string fCoordinateX { get; set; }
        [DisplayName("緯度")]

        public string fCoordinateY { get; set; }
        [DisplayName("主類別")]

        public string fLabelName { get; set; }
        [DisplayName("路徑")]

        public string fImgPath { get; set; }
    }
}