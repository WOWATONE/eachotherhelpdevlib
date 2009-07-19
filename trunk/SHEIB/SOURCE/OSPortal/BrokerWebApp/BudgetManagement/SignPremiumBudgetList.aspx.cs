using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data;
using BusinessObjects;

namespace BrokerWebApp.BudgetManagement
{
    public partial class SignPremiumBudgetList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    this.Initialization();
                }

                if (this.Page.IsCallback)
                {
                    this.BindGrid();
                }
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 初始化控件
        /// </summary>
        private void Initialization()
        {
            DataSet dsList;

            //客户经理
            this.dxeddlSalesID.Items.Add("(全部)", "");
            dsList = BO_P_User.GetUserByUserID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlSalesID.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
                }
            }
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.BindGrid();
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int signPremiumBudgetID = Convert.ToInt32(e.Keys["SignPremiumBudgetID"]);
            BusinessObjects.Budget.BO_SignPremiumBudget.Delete(signPremiumBudgetID);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
            this.BindGrid();
        }

        protected void gridSearchResult_CustomCallBack(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            //                       
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
            System.Text.StringBuilder sbWhere = new System.Text.StringBuilder();
            if (this.dxeddlSalesID.SelectedItem.Value.ToString().Length > 0)
                sbWhere.Append(" And S.SalesID='" + this.dxeddlSalesID.SelectedItem.Value.ToString() + "' ");
            if(this.hidCustID.Value.Length>0)
                sbWhere.Append(" And S.CustomerID='" + this.hidCustID.Value + "' ");
            if(this.ptid.Value.Length>0)
                sbWhere.Append(" And S.ProdTypeID='" + this.ptid.Value + "' ");
            if (this.dxeddlOperationType.SelectedItem.Value.ToString().Length > 0)
                sbWhere.Append(" And S.OperationType='" + this.dxeddlOperationType.SelectedItem.Value.ToString() + "' ");
            if (this.dxetxtNY.Text.Trim().Length > 0)
                sbWhere.Append(" And S.NY='" + this.dxetxtNY.Text.Trim() + "' ");

            this.gridSearchResult.DataSource = BusinessObjects.Budget.BO_SignPremiumBudget.GetConsultFeeList(sbWhere.ToString()).Tables[0];
            this.gridSearchResult.DataBind();
        }
    }
}
