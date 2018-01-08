using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebService.Controllers
{
    [Route("api/env/vars")]
    public class EnvVarsController : ApiController
    {

        public IHttpActionResult GetVars()
        {
            Dictionary<string, object> envVars = new Dictionary<string, object>();

            envVars.Add("Process", Environment.GetEnvironmentVariables(EnvironmentVariableTarget.Process));
            envVars.Add("User", Environment.GetEnvironmentVariables(EnvironmentVariableTarget.User));
            envVars.Add("Machine", Environment.GetEnvironmentVariables(EnvironmentVariableTarget.Machine));

            return Ok(envVars);
        }
    }
}
