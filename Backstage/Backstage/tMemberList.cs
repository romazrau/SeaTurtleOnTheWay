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

    public partial class tMemberList
    {
        [DisplayName("fid")]
        public int fId { get; set; }
        [DisplayName("社團名稱")]
        public int fCommunityId { get; set; }
        [DisplayName("會員名稱")]
        public int fMemberId { get; set; }
        [DisplayName("加入時間")]
        public string fJoinDate { get; set; }
        [DisplayName("會員等級")]
        public int fAccessRightId { get; set; }

        public virtual tAccessRight tAccessRight { get; set; }
        public virtual tCommunity tCommunity { get; set; }
        public virtual tMember tMember { get; set; }
    }
}
