using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebService.Controllers
{
    public class EchoController : ApiController
    {
        [Route("api/echo/message")]
        public IHttpActionResult GetMessages()
        {
            return Ok("This is a message from the service");
        }
    }
}
