using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using DevExpress.Web.ASPxHtmlEditor;
using DevExpress.Web.ASPxEditors;

namespace BrokerWebApp
{
    public partial class HeaderBroker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dxeLogoutCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            FormsAuthentication.SignOut();
            String theResult = "ok";
            e.Result = theResult;
        }


    }
}
