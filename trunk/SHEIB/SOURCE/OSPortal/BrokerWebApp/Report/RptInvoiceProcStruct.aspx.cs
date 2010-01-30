using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BrokerWebApp.Report
{
    public partial class RptInvoiceProcStruct : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int Year;
                Year = DateTime.Now.Year;
                //dxeDllYear.Value = Year.ToString();
                
            }
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.BindGrid();
            this.gridExport.WriteXlsToResponse();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.BindGrid();
        }

        /// <summary>
        /// 填充数据
        /// </summary>
        private void BindGrid()
        {
            string sStartDate ;
            string sEndDate;
            string sType = "";

            //sYear = dxeDllYear.Value.ToString();

            DataTable dt = BusinessObjects.BO_Report.RptInvoiceProcStruct(dxeStartDate.Date,dxeEndDate.Date).Tables[0];
            this.gridSearchResult.DataSource = dt;
            this.gridSearchResult.DataBind();

        }
    }
}
