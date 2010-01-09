using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BrokerWebApp.BudgetManagement
{
    public partial class RptSignBudgetGatherBySales : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int Year;
                Year = DateTime.Now.Year;
                dxeDllType.SelectedIndex = 0;
                dxeDllYear.Value = Year.ToString();
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
            string sYear = "";
            string sType = "";

            sYear = dxeDllYear.Value.ToString();
            sType = dxeDllType.Value.ToString();


            DataTable dt = BusinessObjects.Budget.BO_SignPremiumBudget.RptSignBudgetGatherBySales(sYear, sType).Tables[0];
            this.gridSearchResult.DataSource = dt;
            this.gridSearchResult.DataBind();

        }
    }
}
