using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;

namespace BrokerWebApp.Report
{

    public partial class InsuranceCommission2 : System.Web.UI.Page
    {

        #region Variables

        
        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            //
            BindGrid();
            
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
            string lsStartDate = dxeStartDate.Date.ToString("yyyy-MM-dd");
            string lsEndDate = dxeEndDate.Date.ToString("yyyy-MM-dd");
            DataTable dt = BO_Report.GetInsuranceCommission2(lsStartDate, lsEndDate).Tables[0];

            this.gridSearchResult.DataSource = dt;
            this.gridSearchResult.DataBind();
        }
    }
}
