using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BrokerWebApp.otherinsurance
{
    public partial class PolicyAlterList : System.Web.UI.Page
    {
        #region Variables

        private const String gridKeyName = "KeyGUID";

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            //            
        }


        

        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String theID = e.Keys[gridKeyName].ToString();
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //this.gridSearchResult.DataBind();
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }


    }
}
