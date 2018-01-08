using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using DbUp;
using WebCore;

namespace Database
{
    class Program
    {
        static void Main(string[] args)
        {

            var connectionString = EnvHelpers.Instance.GetEnvVariable(Global.EnviromentVarNames.MessageConnectionString);
            if (string.IsNullOrEmpty(connectionString))
            {
                Console.WriteLine("Loading connectionString from App.config");
                connectionString = ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            }else
            {
                Console.WriteLine("Loading connectionString from ENV.MessageConnectionString");
            }

            EnsureDatabase.For.SqlDatabase(connectionString);

            var upgrader =
                DeployChanges.To
                    .SqlDatabase(connectionString)
                    .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly())
                    .LogToConsole()
                    .Build();

            var result = upgrader.PerformUpgrade();

            if (!result.Successful)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(result.Error);
                Console.ResetColor();
            }

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Success!");
            Console.ResetColor();
        }
    }
}
