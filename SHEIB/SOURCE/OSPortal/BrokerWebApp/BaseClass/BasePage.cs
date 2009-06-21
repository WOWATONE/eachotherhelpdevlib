using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrokerWebApp
{
    public class BasePage : System.Web.UI.Page
    {
        public static string UserIDCookieName = "UserID";

        public string CurrentUserID = "";

        public String CurrentUserName = "";

    }
}
