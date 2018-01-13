using RepositoryServicePattern.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace RepositoryServicePattern.Repository
{
    public class PersonRepository : IPersonRepository, IDisposable
    {
        private ContosoUniversityEntities db;
        public PersonRepository()
        {
            this.db = new ContosoUniversityEntities();
        }
        public void Create(Person instance)
        {
            if (instance == null)
            {
                throw new ArgumentNullException("instance");
            }
            else
            {
                db.Person.Add(instance);
                this.SaveChanges();
            }
        }

        public void Delete(Person instance)
        {
            if (instance == null)
            {
                throw new ArgumentNullException("instance");
            }
            else
            {
                var Person = db.Person.Find(instance.ID);
                db.Person.Remove(Person);
                this.SaveChanges();
            }
        }

        public Person Get(Expression<Func<Person, bool>> predicate)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Person> GetAll()
        {
            return db.Person.OrderBy(x => x.ID);
        }

        public void SaveChanges()
        {
            db.SaveChanges();
        }

        public void Update(Person instance)
        {
            if (instance == null)
            {
                throw new ArgumentNullException("instance");
            }
            else
            {
                db.Entry(instance).State = EntityState.Modified;
                this.SaveChanges();
            }
        }

        #region IDisposable Support
        private bool disposedValue = false; // 偵測多餘的呼叫

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    // TODO: 處置 Managed 狀態 (Managed 物件)。
                }

                // TODO: 釋放 Unmanaged 資源 (Unmanaged 物件) 並覆寫下方的完成項。
                // TODO: 將大型欄位設為 null。

                disposedValue = true;
            }
        }

        // TODO: 僅當上方的 Dispose(bool disposing) 具有會釋放 Unmanaged 資源的程式碼時，才覆寫完成項。
        // ~PersonRepository() {
        //   // 請勿變更這個程式碼。請將清除程式碼放入上方的 Dispose(bool disposing) 中。
        //   Dispose(false);
        // }

        // 加入這個程式碼的目的在正確實作可處置的模式。
        public void Dispose()
        {
            // 請勿變更這個程式碼。請將清除程式碼放入上方的 Dispose(bool disposing) 中。
            Dispose(true);
            // TODO: 如果上方的完成項已被覆寫，即取消下行的註解狀態。
            // GC.SuppressFinalize(this);
        }

        #endregion
    }
}