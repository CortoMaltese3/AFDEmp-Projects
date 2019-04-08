using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;

namespace BiWeeklyProject6_V4.Models
{
    public class UserManager
    {
        //private List<User> _users = new List<User>();        
        ProjectDbContext _db = new ProjectDbContext();

        public User Login(string username, string password, bool isRegistered)
        {           
            var loggedInUser = _db.Users.FirstOrDefault(u => u.Username == username && u.Password == password && u.IsRegistered == true);
            if (loggedInUser != null)
            {
                var claims = new List<Claim>(new[]
                {
                    // adding following 2 claim just for supporting default antiforgery provider
                    new Claim(ClaimTypes.NameIdentifier, username),
                    new Claim(
                        "http://schemas.microsoft.com/accesscontrolservice/2010/07/claims/identityprovider",
                        "ASP.NET Identity", "http://www.w3.org/2001/XMLSchema#string"),
                    new Claim(ClaimTypes.Name, username),
                    new Claim(ClaimTypes.Role, loggedInUser.UserRole.ToString())
            });

                var identity = new ClaimsIdentity(claims, DefaultAuthenticationTypes.ApplicationCookie);

                HttpContext.Current.GetOwinContext().Authentication.SignIn(
                    new AuthenticationProperties { IsPersistent = false }, identity);
            }

            return loggedInUser;
        }

        public bool UserExists(string username)
        {
            return _db.Users.Any(u => u.Username == username);
        }

        //public IEnumerable<User> Users()
        //{
        //    List<User> _users = new List<User>();
        //    return _users;
        //}
    }
}