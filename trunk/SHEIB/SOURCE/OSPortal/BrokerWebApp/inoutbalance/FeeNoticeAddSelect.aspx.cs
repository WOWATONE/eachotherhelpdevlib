using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;
using BusinessObjects.SchemaSetting;


namespace BrokerWebApp.inoutbalance
{
    public partial class FeeNoticeAddSelect : BasePage
    {

        #region Variables

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {
                Initialization();
                BindGrid();
            }
        }


        private void BindGrid()
        {
            string lsWhere = "";
            if (dxetxtPolicyNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and a.PolicyNo ='" + dxetxtPolicyNo.Text + "'";
            }
            if (dxetxtPolicyID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and a.PolicyID ='" + dxetxtPolicyID.Text + "'";
            }
            if (dxeddlDeptId.SelectedItem.Value.ToString().Trim() != "")
            {
                lsWhere = lsWhere + " and a.DeptId ='" + dxeddlDeptId.SelectedItem.Value.ToString() + "'";
            }
            if (dxeddlSalesID.SelectedItem.Value.ToString().Trim() != "")
            {
                lsWhere = lsWhere + " and a.SalesId ='" + dxeddlSalesID.SelectedItem.Value.ToString() + "'";
            }
            if (dxetxtCustomerID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and  exists( select 1 from Customer where CustName like '%" + dxetxtCustomerID.Text + "%' and CustID=a.CustomerID) ";
            }
            if (dxeddlCarrier.SelectedItem.Value.ToString().Trim() != "")
            {
                lsWhere = lsWhere + " and a.CarrierID ='" + dxeddlCarrier.SelectedItem.Value.ToString() + "'";
            }
            if (dxeddlBranch.SelectedItem.Value.ToString().Trim() != "")
            {
                lsWhere = lsWhere + " and a.BranchID ='" + dxeddlBranch.SelectedItem.Value.ToString() + "'";
            }
            if (dxetxtProdTypeID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and  exists( select 1 from ProductType where ProdTypeName like '%" + dxetxtProdTypeID.Text + "%' and CustID=a.CustomerID) ";
            }
            if (ckbPayDate.Checked)
            {
                string lsStartDate = dxeStartPayDate.Date.ToString("yyyy-MM-dd");
                string lsEndDate = dxeEndPayDate.Date.ToString("yyyy-MM-dd");
                lsWhere = lsWhere + " and (convert(char(10), A.PayDate,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), A.PayDate,21)) <='" + lsEndDate + "'";
            }
            if (chkPolicyStartDate.Checked)
            {
                string lsStartDate = dxePolicyStartDateStart.Date.ToString("yyyy-MM-dd");
                string lsEndDate = dxePolicyStartDateEnd.Date.ToString("yyyy-MM-dd");
                lsWhere = lsWhere + " and (convert(char(10), A.StartDate,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), A.StartDate,21)) <='" + lsEndDate + "'";
            }
            if (chkPolicyEndDate.Checked)
            {
                string lsStartDate = dxePolicyEndDateStart.Date.ToString("yyyy-MM-dd");
                string lsEndDate = dxePolicyEndDateEnd.Date.ToString("yyyy-MM-dd");
                lsWhere = lsWhere + " and (convert(char(10), A.EndDate,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), A.EndDate,21)) <='" + lsEndDate + "'";
            }

            this.gridSearchResult.DataSource = BO_Notice.GetFeeNoticeAddSelectList(lsWhere);
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
            this.dxeddlSalesID.Items.Add("(全部)", "");
            dsList = BO_P_User.GetUserByUserID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlSalesID.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
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


        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //DataTable dt = ((DataTable)ViewState["PolicyItemGridData"]);
            //DataRow row = dt.Rows.Find(e.Keys["ID"]);
            //dt.Rows.Remove(row);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        
    }
}
