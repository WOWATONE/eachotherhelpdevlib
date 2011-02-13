using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;

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

                //保单类别
                //this.dxeddlPremiumType.Items.Add("(全部)", "");
                DataSet dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.PremiumType.ToString());
                if (dsList.Tables[0] != null)
                {
                    foreach (DataRow row in dsList.Tables[0].Rows)
                    {
                        this.dxeddlPremiumType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                    }
                }
                dxeddlPremiumType.SelectedIndex = 0;
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
            string sPremiumType = "";

            sYear = dxeDllYear.Value.ToString();
            sType = dxeDllType.Value.ToString();

            if (this.dxeddlPremiumType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlPremiumType.SelectedItem.Value.ToString()))
            {
                sPremiumType = this.dxeddlPremiumType.SelectedItem.Value.ToString();
            }


            DataTable dt = BusinessObjects.Budget.BO_SignPremiumBudget.RptSignBudgetGatherBySales(sYear, sType, sPremiumType).Tables[0];
            this.gridSearchResult.DataSource = dt;
            this.gridSearchResult.DataBind();

        }
    }
}
