//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Backstage
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.Web;

    public partial class tCommunity
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tCommunity()
        {
            this.tMemberList = new HashSet<tMemberList>();
            this.tPost = new HashSet<tPost>();
        }
        [DisplayName("序號")]
        public int fId { get; set; }
        [DisplayName("社團名稱")]
        public string fName { get; set; }
        [DisplayName("創建日期")]
        public System.DateTime fDate { get; set; }
        [DisplayName("介紹")]
        public string fInfo { get; set; }
        [DisplayName("狀態")]
        public int fStatusId { get; set; }
        [DisplayName("社團圖片路徑")]
        public string fImgPath { get; set; }

        public HttpPostedFileBase fImage { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tMemberList> tMemberList { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tPost> tPost { get; set; }
        public virtual tStatus tStatus { get; set; }
    }
}
