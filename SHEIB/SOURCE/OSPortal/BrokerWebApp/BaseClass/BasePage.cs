using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrokerWebApp
{
    public class BasePage : System.Web.UI.Page
    {
        public static String UserIDCookieName = "UserID";

        public String CurrentUserID
        {
            get
            {
                return "";
            }
        }


        public String CurrentUserName
        {
            get
            {
                return "";                
            }
        }



    }
}
