using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using test1.Models;

namespace test1.Viewmodel
{
    public class Memberlist
    {
        public int fId { get; set; }
        public string fAccount { get; set; }
        public string fName { get; set; }

        public string fAccountType { get; set; }
    }
}