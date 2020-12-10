using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using REST_WebApi.Models;
namespace REST_WebApi.Controllers
{
    [RoutePrefix("api/{controller}/{action}")]
    public class LogInController : ApiController
    {
        // GET: api/LogIn

        [HttpGet]
        public bool Authenticate(string userName, string password)
        {
            try
            {
                using (ContactDataContext entities = new ContactDataContext())
                {
                    User foundUser = entities.Users.SingleOrDefault<User>(b => b.UserName == userName && b.Password == password);
                    if (foundUser == null) { return false; }
                    else
                    {
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        
    }
}
