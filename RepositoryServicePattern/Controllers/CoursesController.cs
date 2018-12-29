using RepositoryServicePattern.Repository;
using RepositoryServicePattern.Repository.Interface;
using RepositoryServicePattern.Repository.Models;
using RepositoryServicePattern.Service.Interface;
using RepositoryServicePattern.Service.Service;
using System.Data;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace RepositoryServicePattern.Controllers
{
    public class CoursesController : Controller
    {
        private ICourseService _CoursesService;
        private IScheduleService _ScheduleService;

        public CoursesController(ICourseService courseService, IScheduleService scheduleService)
        {
            _CoursesService = courseService;
            _ScheduleService = scheduleService;
        }

        // GET: Courses
        public ActionResult Index()
        {
            var course = _CoursesService.GetAll();
            return View(course.ToList());

        }

        // GET: Courses/Details/5
        public ActionResult Details(int? id)
        {
            if (!id.HasValue)
            {
                return RedirectToAction("index");
            }
            else
            {
                var category = this._CoursesService.GetByID(id.Value);
                return View(category);
            }
        }

        // GET: Courses/Create
        public ActionResult Create()
        {
            //ViewBag.DepartmentID = new SelectList(db.Department, "DepartmentID", "Name");
            return View();
        }

        // POST: Courses/Create
        // 若要免於過量張貼攻擊，請啟用想要繫結的特定屬性，如需
        // 詳細資訊，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CourseID,Title,Credits,DepartmentID")] Course course)
        {
            if (ModelState.IsValid)
            {
                _CoursesService.Create(course);
                return RedirectToAction("Index");
            }

            //ViewBag.DepartmentID = new SelectList(db.Department, "DepartmentID", "Name", course.DepartmentID);
            return View(course);
        }

        // GET: Courses/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var course = _CoursesService.GetByID(id.Value);
            if (course == null)
            {
                return HttpNotFound();
            }
            //ViewBag.DepartmentID = new SelectList(db.Department, "DepartmentID", "Name", course.DepartmentID);
            return View(course);
        }

        // POST: Courses/Edit/5
        // 若要免於過量張貼攻擊，請啟用想要繫結的特定屬性，如需
        // 詳細資訊，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CourseID,Title,Credits,DepartmentID")] Course course)
        {
            if (ModelState.IsValid)
            {
                _CoursesService.Update(course);
                return RedirectToAction("Index");
            }
            //ViewBag.DepartmentID = new SelectList(db.Department, "DepartmentID", "Name", course.DepartmentID);
            return View(course);
        }

        // GET: Courses/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var course = _CoursesService.GetByID(id.Value);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: Courses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                _CoursesService.Delete(id);
            }
            catch (DataException)
            {
                return RedirectToAction("Delete", new { id = id });
            }

            return RedirectToAction("Index");
        }
    }
}
