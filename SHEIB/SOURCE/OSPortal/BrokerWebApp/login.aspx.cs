using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using BusinessObjects;

namespace BrokerWebApp
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
        protected void dxebtnLogin_OnClick(object sender, EventArgs e)
        {
            Boolean existUser = false;
            String userID, password;
            userID = this.dxetxtUserID.Text;
            password = this.dxetxtPassword.Text;
            if (!String.IsNullOrEmpty(userID) && !String.IsNullOrEmpty(password))
            {
                existUser = validUser(userID, password);
                if (existUser)
                {
                    this.lbl_Msg.Visible = false;
                    FormsAuthentication.SetAuthCookie(userID, false);
                    FormsAuthentication.RedirectFromLoginPage(userID, false);
                }
                else
                {
                    //User not exist.
                    this.lbl_Msg.Visible = true;
                }
            }
            else
            {
                //User not exist.
                this.lbl_Msg.Visible = true;
            }
        }

        
        private Boolean validUser(String userID, String password)
        {
            Boolean result = false;
            BO_P_User theUser = new BO_P_User(userID);
            if (theUser.UserID != null)
            {
                if (theUser.Password == password)
                    result = true;
                else
                    result = false;
            }
            else
            {
                result = false;
            }
            return result;
        }
    
    }
}
