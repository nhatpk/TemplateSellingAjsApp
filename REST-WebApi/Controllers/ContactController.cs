using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using REST_WebApi.Models;
namespace REST_WebApi.Controllers
{
    public class ContactController : ApiController
    {
        // GET: api/Contact
        public IEnumerable<Contact> Get()
        {
            using (ContactDataContext entities = new ContactDataContext())
            {
                return entities.Contacts.ToList<Contact>();
            }
        }

        // GET: api/Contact/5
        public Contact Get(int id)
        {
            using (ContactDataContext entities = new ContactDataContext())
            {
                return entities.Contacts.SingleOrDefault<Contact>(b => b.Id == id);
            }
        }

        // POST: api/Contact
        public HttpResponseMessage Post(Contact value)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (ContactDataContext entities = new ContactDataContext())
                    {
                        entities.Contacts.Add(value);
                        entities.SaveChanges();
                        return Request.CreateResponse(HttpStatusCode.OK);
                    }
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.InternalServerError, "Invalid Model");
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }        
    }
}
