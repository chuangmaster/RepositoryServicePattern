using RepositoryServicePattern.Repository;
using RepositoryServicePattern.Repository.Interface;
using RepositoryServicePattern.Repository.Models;
using RepositoryServicePattern.Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryServicePattern.Service.Service
{
    public class CourseService : ICourseService
    {
        private ICourseRepository repository;

        public CourseService(ICourseRepository courseRepository)
        {
            repository = courseRepository;
        }

        public IResult Create(Course instance)
        {
            if (instance == null)
            {
                throw new ArgumentNullException();
            }

            IResult result = new Result(false);
            try
            {
                this.repository.Create(instance);
                result.Success = true;
            }
            catch (Exception ex)
            {
                result.Exception = ex;
            }
            return result;
        }

        public IResult Update(Course instance)
        {
            if (instance == null)
            {
                throw new ArgumentNullException();
            }

            IResult result = new Result(false);
            try
            {
                this.repository.Update(instance);
                result.Success = true;
            }
            catch (Exception ex)
            {
                result.Exception = ex;
            }
            return result;
        }

        public IResult Delete(int courseID)
        {
            IResult result = new Result(false);

            if (!this.IsExists(courseID))
            {
                result.Message = "找不到資料";
            }

            try
            {
                var instance = this.GetByID(courseID);
                this.repository.Delete(instance);
                result.Success = true;
            }
            catch (Exception ex)
            {
                result.Exception = ex;
            }
            return result;
        }

        public bool IsExists(int courseID)
        {
            return this.repository.GetAll().Any(x => x.CourseID == courseID);
        }

        public Course GetByID(int courseID)
        {
            return this.repository.Get(x => x.CourseID == courseID);
        }

        public IEnumerable<Course> GetAll()
        {
            return this.repository.GetAll();
        }
    }
}
