using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Web.Configuration;

namespace BusinessObjects
{
    public class ConfigurationService
    {
        public static string EmailFrom
        {
            get{
                string strFrom;
                //strFrom = WebConfigurationManager.AppSettings["EmailFrom"];
                strFrom = ConfigurationManager.AppSettings["EmailFrom"];
                return strFrom;
            }
        }

       


    }
}
