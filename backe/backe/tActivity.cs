//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace backe
{
    using System;
    using System.Collections.Generic;
    
    public partial class tActivity
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tActivity()
        {
            this.tActivityHadLabel = new HashSet<tActivityHadLabel>();
            this.tScore = new HashSet<tScore>();
            this.tSearchList = new HashSet<tSearchList>();
            this.tJoinList = new HashSet<tJoinList>();
        }
    
        public int fId { get; set; }
        public string fActName { get; set; }
        public System.DateTime fCreatDate { get; set; }
        public System.DateTime fActivityDate { get; set; }
        public int fMemberId { get; set; }
        public string fIntroduction { get; set; }
        public Nullable<int> fLimit { get; set; }
        public int fActAttestId { get; set; }
        public int fActTypeId { get; set; }
        public string fActLocation { get; set; }
        public string fCoordinateX { get; set; }
        public string fCoordinateY { get; set; }
        public int fActLabelId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tActivityHadLabel> tActivityHadLabel { get; set; }
        public virtual tActivityMainLabel tActivityMainLabel { get; set; }
        public virtual tMember tMember { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tScore> tScore { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tSearchList> tSearchList { get; set; }
        public virtual tActivityType tActivityType { get; set; }
        public virtual tAttestType tAttestType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tJoinList> tJoinList { get; set; }
    }
}
