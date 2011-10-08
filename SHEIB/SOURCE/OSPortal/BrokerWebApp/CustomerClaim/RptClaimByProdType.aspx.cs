using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;

namespace BrokerWebApp.CustomerClaim
{

    public partial class RptClaimByProdType : BasePage
    {

        #region Variables

        
        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            //
            BindGrid();

            LblUserNameTop.Text = this.CurrentUserName;

            //LbUserNameTop.Text = this.CurrentUserName;

        }

                
        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
         
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
            BindGrid();
        }

        private void BindGrid()
        {
            string lsStartDate = dxeStartDate.Date.ToString("yyyyMMdd");
            string lsEndDate = dxeEndDate.Date.ToString("yyyyMMdd");
            //string sCustID = dxetxtCustID.Text.Trim();
            string sCID = hidCustID.Value;
            string sCName = dxetxtCustName.Text.Trim();
            if (sCName == "") sCID = "";
            DataTable dt = BO_NotifyClaim.GetClaimByProdType(lsStartDate, lsEndDate, sCID);
            this.gridSearchResult.DataSource = dt;
            this.gridSearchResult.DataBind();
        }
    }
}
