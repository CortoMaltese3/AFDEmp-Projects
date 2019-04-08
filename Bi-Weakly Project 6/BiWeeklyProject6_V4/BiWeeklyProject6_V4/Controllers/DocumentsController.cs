using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BiWeeklyProject6_V4.Models;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System.Collections.Generic;
using System.Security.Claims;





namespace BiWeeklyProject6_V4.Controllers
{
    public class DocumentsController : Controller
    {
        private ProjectDbContext db = new ProjectDbContext();


        // GET: Documents
        public ActionResult Index()
        {
            // HttpContext.User.IsInRole("Architect");

            if (HttpContext.User.IsInRole(UserRoles.Architect.ToString()))
            {
                return View(db.Documents.Where(doc => doc.UserRoleAssignedTo == UserRoles.Architect).ToList());
            }
            else if (HttpContext.User.IsInRole(UserRoles.Programmer.ToString()))
            {
                return View(db.Documents.Where(doc => doc.UserRoleAssignedTo == UserRoles.Programmer).ToList());
            }
            else if (HttpContext.User.IsInRole(UserRoles.Tester.ToString()))
            {
                return View(db.Documents.Where(doc => doc.UserRoleAssignedTo == UserRoles.Tester).ToList());
            }
            else if (HttpContext.User.IsInRole(UserRoles.Analyst.ToString()))
            {
                return View(db.Documents.Where(doc => doc.UserRoleAssignedTo == UserRoles.Analyst).ToList());
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Documents/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Document document = db.Documents.Find(id);
            if (document == null)
            {
                return HttpNotFound();
            }
            return View(document);
        }

        // GET: Documents/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Documents/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Title,Body,UserRoleAssignedTo")] Document document)
        {
            if (ModelState.IsValid)
            {
                db.Documents.Add(document);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(document);
        }

        // GET: Documents/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Document document = db.Documents.Find(id);
            if (document == null)
            {
                return HttpNotFound();
            }
            return View(document);
        }

        // POST: Documents/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Title,Body,UserRoleAssignedTo")] Document document)
        {
            if (ModelState.IsValid)
            {
                db.Entry(document).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(document);
        }

        // GET: Documents/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Document document = db.Documents.Find(id);
            if (document == null)
            {
                return HttpNotFound();
            }
            return View(document);
        }

        // POST: Documents/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Document document = db.Documents.Find(id);
            db.Documents.Remove(document);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
