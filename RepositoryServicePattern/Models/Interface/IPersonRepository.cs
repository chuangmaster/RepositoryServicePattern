using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepositoryServicePattern.Models.Interface
{
    public interface IPersonRepository:IRepository<Person>
    {
    }
}