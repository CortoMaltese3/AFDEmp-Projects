using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BiWeeklyProject6_V4.Models;
using Microsoft.AspNet.Identity;

namespace BiWeeklyProject6_V4.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(User user)
        {
            UserManager manager = new UserManager();
            var loggedInUser = manager.Login(user.Username, user.Password, user.IsRegistered);

            if (loggedInUser != null)
            {
                Session["user"] = loggedInUser;
                return RedirectToAction("Index", "Home");
                //return View("Index", loggedInUser);
            }
            else
            {
                return RedirectToAction("Index");
            }
        }

        public ActionResult Logout()
        {
            Session.Clear();
            Session.Abandon();
            HttpContext.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            return RedirectToAction("Index", "Home");
        }

    }
}