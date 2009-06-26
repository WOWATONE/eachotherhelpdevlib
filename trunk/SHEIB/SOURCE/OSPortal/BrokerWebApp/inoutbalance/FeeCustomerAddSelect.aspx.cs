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
    public partial class FeeCustomerAddSelect : System.Web.UI.Page
    {

        #region Variables

        private DataTable _dtGrid;

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {
                Initialization();
                ckbNeedPayFeePolicy.Checked = true;
                BindGrid();
            }
        }


        private void BindGrid()
        {
            string lsWhere = "";
            if (dxetxtNoticeNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and a.NoticeNo ='" + dxetxtNoticeNo.Text + "'";
            }
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
            if (dxeddlGatheringType.SelectedItem.Value.ToString().Trim() != "")
            {
                lsWhere = lsWhere + " and a.GatheringTypeID ='" + dxeddlGatheringType.SelectedItem.Value.ToString() + "'";
            }
            if (dxetxtProdTypeID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and  exists( select 1 from ProductType where ProdTypeName like '%" + dxetxtProdTypeID.Text + "%' and CustID=a.CustomerID) ";
            }

            string lsStartDate = dxeNoticeStartDate.Date.ToString("yyyy-MM-dd");
            string lsEndDate = dxeNoticeEndDate.Date.ToString("yyyy-MM-dd");
            if ((dxeNoticeStartDate.Text.Trim() != "") && (dxeNoticeEndDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), a.NoticeDate,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), a.NoticeDate,21)) <='" + lsEndDate + "'";
            }

            if (ckbNeedPayFeePolicy.Checked)
            {
                lsWhere = lsWhere + " and (Payfee-PayedFee)<>0";       
            }
            this.gridSearchResult.DataSource = BO_FeeCustomer.GetFeeCustomerAddSelectList(lsWhere);
            this.gridSearchResult.DataBind();

        }

        private void Initialization()
        {
            DataSet dsList;


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

            //dxeddlGatheringType
            this.dxeddlGatheringType.Items.Add("(全部)", "");
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.GatheringType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlGatheringType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
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
