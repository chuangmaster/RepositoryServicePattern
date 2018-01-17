using RepositoryServicePattern.Repository.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryServicePattern.Service.Interface
{
    /// <summary>
    /// interface ICourseService
    /// </summary>
    public interface ICourseService
    {
        IResult Create(Course instance);

        IResult Update(Course instance);

        IResult Delete(int CourseID);

        bool IsExists(int CourseID);

        Course GetByID(int CourseID);

        IEnumerable<Course> GetAll();
    }
}
