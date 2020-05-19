using BS_23.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;


namespace BS_23.Controllers
{
    public class HomeController : Controller
    {
        Dbcon db = new Dbcon();
        List<User> user = new List<User>();
        public ActionResult Index(string search, int?page)
        {
            var stateList = db.User.ToList();

            var postList = (from u in db.User
                          join p in db.Post on u.Id equals p.UserId
                          select new {p.Id, p.Title,u.Username,p.CrateTime  }
                        ).ToList();

            //ViewBag.StateList = new SelectList(stateList, "CustomerID", "Name");
            //var customList = (from cust in db.Customer1
            //                  join ord in db.Order1 on cust.CustomerID equals ord.CustomerID
            //                  select new { cust.Name, cust.Address, cust.Mobileno, ord.OrderDate, ord.OrderPrice }
            //                    ).ToList();
            List<ShowPost_VM> li = new List<ShowPost_VM>();
            foreach (var i in postList)
            {
                ShowPost_VM post = new ShowPost_VM();
                var comments= this.comentlist(i.Id);
                post.Post = i.Title;
                post.Username = i.Username;
                post.PostDate = i.CrateTime;
                post.CommentList = comments;
                post.ComentCount = comments.Count();
                li.Add(post);
               
            }

            if(search == "" || search== null)
            {
                page = 1;
                return View(li.ToList().ToPagedList(page ?? 1, 2));

            }
            else
            {
                return View(li.Where(X => X.Post == search).ToList().ToPagedList(page ?? 1, 2));

            }

        }
        public List<ShowReport_VM> comentlist(int id)
        {
            var comentList = (from c in db.Comment
                            join u in db.User on c.UserId equals u.Id 
                            join l in db.Vote on c.Id equals l.ComentId into lk
                            
                            where c.PostId==id
                            select new ShowReport_VM { Username=u.Username,Coment=c.Content,CommentDate=c.CrateTime,like=lk.Where(r=> r.Voting==true).Count(), dislike = lk.Where(r => r.Voting == false).Count() }
                       ).ToList();
             

            return comentList;
        }

         

    }
}