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
    public class PersonService: IPersonService
    {
        private IPersonRepository repository;

        public PersonService(IPersonRepository repository)
        {
            this.repository = repository;
        }

        public IResult Create(Person instance)
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

        public IResult Update(Person instance)
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

        public IResult Delete(int ID)
        {
            IResult result = new Result(false);

            if (!this.IsExists(ID))
            {
                result.Message = "找不到資料";
            }

            try
            {
                var instance = this.GetByID(ID);
                this.repository.Delete(instance);
                result.Success = true;
            }
            catch (Exception ex)
            {
                result.Exception = ex;
            }
            return result;
        }

        public bool IsExists(int ID)
        {
            return this.repository.GetAll().Any(x => x.ID == ID);
        }

        public Person GetByID(int ID)
        {
            return this.repository.Get(x => x.ID == ID);
        }

        public IEnumerable<Person> GetAll()
        {
            return this.repository.GetAll();
        }
    }
}
