using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BrokerWebApp.otherinsurance
{
 
    public partial class PolicyInputList : System.Web.UI.Page
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
            //edit
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {            
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            String where = "0";

            //if (!String.IsNullOrEmpty(this.dxetxtPartNo.Text))
            //{
            //    where += " and part_no='" + this.dxetxtPartNo.Text.Trim() + "'";
            //}

            //if (!String.IsNullOrEmpty(this.dxetxtOrderNo.Text))
            //{
            //    where += " and sgm_order_no='" + this.dxetxtOrderNo.Text.Trim() + "'";
            //}

            Parameter pt;
            pt = this.DataSource.SelectParameters[0];

            pt.DefaultValue = where;

            this.gridSearchResult.DataBind();

        }


    }
}
