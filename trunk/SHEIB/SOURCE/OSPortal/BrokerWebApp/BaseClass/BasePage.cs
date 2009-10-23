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

        public static String ApplicationRoot = HttpContext.Current.Request.ApplicationPath;

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

        private BusinessObjects.BO_P_User _currentUser;
        public BusinessObjects.BO_P_User CurrentUser
        {
            get
            {
                return _currentUser; 
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            loadCurrentUser();            
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);            
        }


        protected void loadCurrentUser()
        {
            String userID;
            userID = this.CurrentUserID;
            BusinessObjects.BO_P_User theUser = new BusinessObjects.BO_P_User(userID);
            if (theUser.UserID != null)
                _currentUser = theUser;
            else
                _currentUser =  null;
        }


        public static string URLCombine(string uri1, string uri2) 
        { 
            uri1 = uri1.TrimEnd('/'); 
            uri2 = uri2.TrimStart('/'); 
            return string.Format("{0}/{1}", uri1, uri2); 
        }
    }
}
