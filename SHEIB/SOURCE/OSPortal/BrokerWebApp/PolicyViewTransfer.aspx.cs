using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObjects.Policy;

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
            String theID = Page.Request.QueryString[inputQueryStringIDKey];
            BusinessObjects.Policy.BO_Policy obj;
            obj = new BusinessObjects.Policy.BO_Policy(theID);
            if (!String.IsNullOrEmpty(obj.PolicyID))
            {
                if (obj.PolicyType == Convert.ToInt32(BO_Policy.PolicyTypeEnum.Vehicle).ToString())
                {
                    Page.Response.Redirect("vehicleinsurance/CarPolicyView.aspx?id=" + obj.PolicyID);
                }
                else
                {
                    Page.Response.Redirect("otherinsurance/PolicyView.aspx?id=" + obj.PolicyID);
                }
            } 
        }

        #endregion Page Events


    }
}
