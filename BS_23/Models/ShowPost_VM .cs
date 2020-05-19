using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BS_23.Models
{
    public class ShowPost_VM
    {

        public string Post { get; set; }
        public string Username { get; set; }
        public int ComentCount { get; set; }
        public List<ShowReport_VM> CommentList { get; set; }
       


        public Nullable<System.DateTime> PostDate { get; set; }
   


    }
}