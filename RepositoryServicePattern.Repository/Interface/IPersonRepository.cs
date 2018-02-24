using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RepositoryServicePattern.Repository.Models;

namespace RepositoryServicePattern.Repository.Interface
{
    public interface IPersonRepository : IRepository<Person>
    {
    }
}