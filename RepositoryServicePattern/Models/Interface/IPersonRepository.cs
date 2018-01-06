using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepositoryServicePattern.Models.Interface
{
    public interface IPersonRepository
    {
        void Create(Person instance);

        void Update(Person instance);

        void Delete(Person instance);

        Person Get(int categoryID);

        IQueryable<Person> GetAll();

        void SaveChanges();
    }
}