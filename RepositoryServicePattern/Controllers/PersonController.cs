using RepositoryServicePattern.Repository;
using RepositoryServicePattern.Repository.Interface;
using RepositoryServicePattern.Repository.Models;
using RepositoryServicePattern.Service.Interface;
using RepositoryServicePattern.Service.Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace RepositoryServicePattern.Controllers
{
    public class PersonController : Controller
    {
        private IPersonService _PersonService;

        public PersonController(IPersonService personService)
        {
            _PersonService = personService;
        }

        // GET: People
        public ActionResult Index()
        {
            var person = _PersonService.GetAll();
            return View(person.ToList());
        }

        // GET: People/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var person = _PersonService.GetByID(id.Value);
            if (person == null)
            {
                return HttpNotFound();
            }
            return View(person);
        }

        // GET: People/Create
        public ActionResult Create()
        {
            //ViewBag.ID = new SelectList(db.OfficeAssignment, "InstructorID", "Location");
            return View();
        }

        // POST: People/Create
        // 若要免於過量張貼攻擊，請啟用想要繫結的特定屬性，如需
        // 詳細資訊，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,LastName,FirstName,HireDate,EnrollmentDate,Discriminator")] Person person)
        {
            if (ModelState.IsValid)
            {
                _PersonService.Create(person);
                return RedirectToAction("Index");
            }

            //ViewBag.ID = new SelectList(db.OfficeAssignment, "InstructorID", "Location", person.ID);
            return View(person);
        }

        // GET: People/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var person = _PersonService.GetByID(id.Value);
            if (person == null)
            {
                return HttpNotFound();
            }
            //ViewBag.ID = new SelectList(db.OfficeAssignment, "InstructorID", "Location", person.ID);
            return View(person);
        }

        // POST: People/Edit/5
        // 若要免於過量張貼攻擊，請啟用想要繫結的特定屬性，如需
        // 詳細資訊，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,LastName,FirstName,HireDate,EnrollmentDate,Discriminator")] Person person)
        {
            if (ModelState.IsValid)
            {
                _PersonService.Update(person);
                return RedirectToAction("Index");
            }
            //ViewBag.ID = new SelectList(db.OfficeAssignment, "InstructorID", "Location", person.ID);
            return View(person);
        }

        // GET: People/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var person = _PersonService.GetByID(id.Value);
            if (person == null)
            {
                return HttpNotFound();
            }
            return View(person);
        }

        // POST: People/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                _PersonService.Delete(id);
            }
            catch (DataException)
            {
                return RedirectToAction("Delete", new { id = id });
            }
            return RedirectToAction("Index");
        }
    }
}
