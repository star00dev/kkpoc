using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebCore
{

    public class EnvHelpers
    {
        private static EnvHelpers _instance = null;

        public static EnvHelpers Instance {
            get
            {
                if (_instance == null)
                    return new EnvHelpers();

                return _instance;
            }
        }


        private EnvHelpers()
        {

        }


        public string GetEnvVariable(string name)
        {

            foreach (EnvironmentVariableTarget enumValue in Enum.GetValues(typeof(EnvironmentVariableTarget)))
            {

                var value = Environment.GetEnvironmentVariable(name, enumValue);
                if (!string.IsNullOrEmpty(value))
                {
                    return value;
                }
            }

            return string.Empty;
        }


    }
}