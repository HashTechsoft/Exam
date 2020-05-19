using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BS_23.Models
{
    public class ShowReport_VM
    {

        public string Username { get; set; }
        public string Coment { get; set; }
        public Nullable<System.DateTime> CommentDate { get; set; }
 
        public int like { get; set; }
        public int dislike { get; set; }





    }
}