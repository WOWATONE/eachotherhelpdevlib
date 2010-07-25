using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxPivotGrid;
using System.Data;
using DevExpress.XtraPivotGrid.Web;
using System.IO;



namespace BrokerWebApp.Report
{
    public partial class RptCustomerProcessStruct : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.BindGrid();

            LblUserNameTop.Text = this.CurrentUserName;
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.BindGrid();

            using (MemoryStream stream = new MemoryStream())
            {
                string contentType = "application/ms-excel";
                gridExport.ExportToXls(stream);
                byte[] buffer = stream.GetBuffer();
                string disposition = "attachment";
                Response.Clear();
                Response.Buffer = false;
                Response.AppendHeader("Content-Type", contentType);
                Response.AppendHeader("Content-Transfer-Encoding", "binary");
                Response.AppendHeader("Content-Disposition", disposition + "; filename=" + "RptCustomerProcessStruct.xls");
                Response.BinaryWrite(buffer);
                Response.End();
            }



        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.BindGrid();
        }

        private void BindGrid()
        {

            string lsStartDate = dxeStartDate.Date.ToString("yyyy-MM-dd");
            string lsEndDate = dxeEndDate.Date.ToString("yyyy-MM-dd");
            DataTable dt = BusinessObjects.BO_Report.RptCustomerProcessStruct(lsStartDate, lsEndDate).Tables[0];

            this.pivotGrid.DataSource = dt;
            this.pivotGrid.DataBind();

        }

    }
}
