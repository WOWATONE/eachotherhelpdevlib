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
            String userID, password;
            userID = this.dxetxtUserID.Text;
            password = this.dxetxtPassword.Text;
            if (userID == "admin" && password == "admin")
            {
                FormsAuthentication.SetAuthCookie(userID, false);
                FormsAuthentication.RedirectFromLoginPage(userID, false);
            }
            else
            {
                //
            }
        }

    }
}
