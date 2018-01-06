using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepositoryServicePattern.Models.Interface
{
    public interface ICourseRepository
    {
        void Create(Course instance);

        void Update(Course instance);

        void Delete(Course instance);

        Course Get(int categoryID);

        IQueryable<Course> GetAll();

        void SaveChanges();
    }
}