using RepositoryServicePattern.Repository.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RepositoryServicePattern.Service.Interface
{
    public interface IPersonService
    {
        IResult Create(Person instance);

        IResult Update(Person instance);

        IResult Delete(int ID);

        bool IsExists(int ID);

        Person GetByID(int ID);

        IEnumerable<Person> GetAll();
    }
}
