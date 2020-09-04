using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Backstage.viewmodel
{
    public class active_list_detail
    {
        public int fId { get; set; }
        public string fActName { get; set; }
        public string fCreatDate { get; set; }
        public string fActivityDate { get; set; }
        public string fActivityEndDate { get; set; }

        //社團未有關聯?
        //public string fCommunityName { get; set; }
        public string fMemberName { get; set; }
        public string fIntroduction { get; set; }
        public int? fMaxLimit { get; set; }
        public int? fMinLimit { get; set; }
        public string fAttestName { get; set; }
        public string fStatusName { get; set; }
        public string fActLocation { get; set; }

        public string fCoordinateX { get; set; }

        public string fCoordinateY { get; set; }

        public string fLabelName { get; set; }

        public string fImgPath { get; set; }
    }
}