//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace AspSeaTurtleOnTheWay
{
    using System;
    using System.Collections.Generic;
    
    public partial class tMember
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tMember()
        {
            this.tActivity = new HashSet<tActivity>();
            this.tActivityMessage = new HashSet<tActivityMessage>();
            this.tJoinList = new HashSet<tJoinList>();
            this.tScore = new HashSet<tScore>();
            this.tSearchList = new HashSet<tSearchList>();
            this.tFeedback = new HashSet<tFeedback>();
            this.tMemberList = new HashSet<tMemberList>();
            this.tPost = new HashSet<tPost>();
            this.tReply = new HashSet<tReply>();
            this.tAccountLikeList = new HashSet<tAccountLikeList>();
            this.tAccountLikeList1 = new HashSet<tAccountLikeList>();
        }
    
        public int fId { get; set; }
        public string fAccount { get; set; }
        public string fPassword { get; set; }
        public string fName { get; set; }
        public System.DateTime fBirthdate { get; set; }
        public string fIdentifyId { get; set; }
        public string fAddress { get; set; }
        public string fCity { get; set; }
        public int fCeilphoneNumber { get; set; }
        public int fCoins { get; set; }
        public string fGender { get; set; }
        public string fIntroduction { get; set; }
        public int fAccountTypeId { get; set; }
        public string fPhotoPath { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tActivity> tActivity { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tActivityMessage> tActivityMessage { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tJoinList> tJoinList { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tScore> tScore { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tSearchList> tSearchList { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tFeedback> tFeedback { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tMemberList> tMemberList { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tPost> tPost { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tReply> tReply { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tAccountLikeList> tAccountLikeList { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tAccountLikeList> tAccountLikeList1 { get; set; }
        public virtual tAccountType tAccountType { get; set; }
    }
}
