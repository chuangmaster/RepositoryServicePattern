using RepositoryServicePattern.Repository.Models;
using RepositoryServicePattern.Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryServicePattern.Service.Service
{
    public class ScheduleClassService : IScheduleClass
    {
        public IResult Create(Course instance)
        {
            throw new NotImplementedException();
        }

        public IResult Delete(int CourseID)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Course> GetAll()
        {
            throw new NotImplementedException();
        }

        public Course GetByID(int CourseID)
        {
            throw new NotImplementedException();
        }

        public bool IsExists(int CourseID)
        {
            throw new NotImplementedException();
        }

        public void Schedule()
        {
            throw new NotImplementedException();
        }

        public IResult Update(Course instance)
        {
            throw new NotImplementedException();
        }
    }
}
