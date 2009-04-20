using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSPortalWebApp.otherinsurance
{
    public partial class forminput : System.Web.UI.Page
    {
        #region Variables

        public bool DisplaySelectInsurance
        {
            get;
            set;
        }

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack || Page.IsCallback)
            {
                DisplaySelectInsurance = false;
            }
            else
            {
                DisplaySelectInsurance = true;
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //  
        }

        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //
        }

        protected void gridPolicyItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //
        }

        protected void gridPolicyItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //
        }

        protected void gridPolicyItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            ViewState["text"] = "";            
        }
        
    }
}
