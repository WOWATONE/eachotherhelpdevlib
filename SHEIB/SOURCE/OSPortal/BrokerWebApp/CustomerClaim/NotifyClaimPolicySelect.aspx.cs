using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;
using BusinessObjects.SchemaSetting;
using DevExpress.Web.ASPxEditors;


namespace BrokerWebApp.CustomerClaim
{
    public partial class NotifyClaimPolicySelect : BasePage
    {

        #region Variables

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Initialization();
            }

            if (IsPostBack && this.Page.IsCallback)
            {
                this.BindGrid();
            }

        }


        private void BindGrid()
        {
            string lsWhere = "";
            if (dxetxtPolicyNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and b.PolicyNo like '%" + dxetxtPolicyNo.Text + "%'";
            }
            if (dxetxtPolicyID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and b.PolicyID like '%" + dxetxtPolicyID.Text + "%'";
            }
            if (this.dxeddlDeptId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlDeptId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.DeptId ='" + dxeddlDeptId.SelectedItem.Value.ToString() + "'";
            }
            if (this.dxeddlSalesId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSalesId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.SalesId ='" + dxeddlSalesId.SelectedItem.Value.ToString() + "'";
            }
            if (dxetxtCustomerID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and  exists( select 1 from Customer where CustName like '%" + dxetxtCustomerID.Text + "%' and CustID=b.CustomerID) ";
            }
            if (this.dxeddlCarrier.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlCarrier.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.PolicyID in (select PolicyID from PolicyCarrier where CarrierID ='" + dxeddlCarrier.SelectedItem.Value.ToString() + "') ";
            }
            if (this.dxeddlBranch.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlBranch.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.PolicyID in (select  PolicyID from PolicyCarrier where BranchID ='" + dxeddlBranch.SelectedItem.Value.ToString() + "') ";
            }
            if (this.dxeddlPolicyType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlPolicyType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and  b.PolicyType ='" + dxeddlPolicyType.SelectedItem.Value.ToString().Trim() + "'";
            }

            this.gridSearchResult.DataSource = BO_NotifyClaim.GetSelectPolicyList(lsWhere);
            this.gridSearchResult.DataBind();

        }

        private void Initialization()
        {
            DataSet dsList;

            //Cariier
            this.dxeddlCarrier.Items.Add("(全部)", "");
            dsList = BO_Carrier.GetCarrierList("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlCarrier.Items.Add(row["CarrierNameCn"].ToString().Trim(), row["CarrierID"].ToString().Trim());
                }
            }

            //Branch
            this.dxeddlBranch.Items.Add("(全部)", "");
            dsList = BO_Branch.GetBranchListByCarrierID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlBranch.Items.Add(row["BranchName"].ToString().Trim(), row["BranchID"].ToString().Trim());
                }
            }

            //部门
            this.dxeddlDeptId.Items.Add("(全部)", "");
            dsList = BO_P_Department.GetDeptByDeptID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlDeptId.Items.Add(row["DeptName"].ToString().Trim(), row["DeptID"].ToString().Trim());
                }
            }

            //客户经理
            this.dxeddlSalesId.Items.Add("(全部)", "");
            dsList = BO_P_User.GetUserByUserID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlSalesId.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
                }
            }

            //PolicyType
            this.dxeddlPolicyType.Items.Add("(全部)", "");
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.PolicyType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlPolicyType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void dxeddlSalesIdCallback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(e.Parameter);
            thecb.TextField = "UserNameCn";
            thecb.ValueField = "UserID";
            thecb.DataBind();
            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }
        }

        protected void dxeddlBranch_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.SchemaSetting.BO_Branch.FetchListByCarrier(e.Parameter);
            thecb.TextField = "BranchName";
            thecb.ValueField = "BranchID";
            thecb.DataBind();
            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }
        }

    }
}
