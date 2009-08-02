using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BrokerWebApp
{
    public class BasePage : System.Web.UI.Page
    {
        public static string TheTwoSF = "{0:0.00}";
        public static string TheFourSF = "{0:0.0000}";
        public static string TheFiveSF = "{0:0.00000}";
        public static String TheCustomCookieName = "TheCookieName";

        public String CurrentUserID
        {
            get
            {
                return Page.User.Identity.Name;
            }
        }

        public String CurrentUserName
        {
            get
            {
                if (this.CurrentUser != null)
                    return this.CurrentUser.UserNameCn;
                else
                    return "";
            }
        }

        public BusinessObjects.BO_P_User CurrentUser
        {
            get
            {
                String userID;
                userID = this.CurrentUserID;
                BusinessObjects.BO_P_User theUser = new BusinessObjects.BO_P_User(userID);
                if (theUser.UserID != null)
                    return theUser;
                else
                    return null;
            }
        }



    }
}
