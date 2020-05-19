using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace BS_23.Models
{
    public class Dbcon: DbContext
    {
        public Dbcon() : base("BSEntities")
        {
        }
        public DbSet<User> User { get; set; }
        public DbSet<Post> Post { get; set; }
        public DbSet<Comment> Comment { get; set; }
        public DbSet<Vote> Vote { get; set; }
    }

}