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

namespace BrokerWebApp.CustomerRelation
{
    public partial class CustomerPtFollow : System.Web.UI.Page
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

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.BindGrid();
            this.gridExport.WriteXlsToResponse();
        }

        /// <summary>
        /// 初始化控件
        /// </summary>
        private void Initialization()
        {
            //客户经理
            DataSet dsList;
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
            if (this.hidCustID.Value.Length > 0)
                sbWhere.Append(" And C.CustID='" + this.hidCustID.Value + "' ");
            if (this.dxeddlSalesID.SelectedItem.Value.ToString().Length > 0)
                sbWhere.Append(" And C.SalesID='" + this.dxeddlSalesID.SelectedItem.Value.ToString() + "' ");
            if (this.deStartFollowDate.Text.Trim().Length > 0)
                sbWhere.Append(" And CP.FollowDate>='" + this.deStartFollowDate.Text.Trim() + "' ");
            if (this.deEndFollowDate.Text.Trim().Length > 0)
                sbWhere.Append(" And CP.FollowDate<='" + this.deEndFollowDate.Text.Trim() + "' ");
            if (this.dexddlFollowType.SelectedItem.Value.ToString().Length > 0)
                sbWhere.Append(" And CP.FollowType='" + this.dexddlFollowType.SelectedItem.Value.ToString() + "' ");
            this.gridSearchResult.DataSource = BusinessObjects.BO_CustomerPtFollow.GetCustomerPtFollowList(sbWhere.ToString()).Tables[0];
            this.gridSearchResult.DataBind();
        }
    }
}
