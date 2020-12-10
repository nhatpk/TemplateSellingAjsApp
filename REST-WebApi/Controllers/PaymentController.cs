using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using REST_WebApi.Models;

namespace REST_WebApi.Controllers
{
    public class PaymentController : ApiController
    {       
        // POST: api/Payment
        public HttpResponseMessage Post(Payment value)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (ContactDataContext entities = new ContactDataContext())
                    {
                        entities.Payments.Add(value);
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
