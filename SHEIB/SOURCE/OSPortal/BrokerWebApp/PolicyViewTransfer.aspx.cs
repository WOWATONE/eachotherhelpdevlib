using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BrokerWebApp
{
    public partial class PolicyViewTransfer : System.Web.UI.Page
    {

        #region Variables

        private const string inputQueryStringIDKey = "id";

        #endregion Variables


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Response.Redirect("otherinsurance/PolicyView.aspx?id=");
            Page.Response.Redirect("vehicleinsurance/CarPolicyView.aspx?id=");
        }

        #endregion Page Events


    }
}
