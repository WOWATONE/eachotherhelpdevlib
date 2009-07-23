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
    public partial class FeeCustomer : System.Web.UI.Page
    {

        #region Variables
        private string toadd = string.Empty;
        
        #endregion Variables

        public DataTable FeeDataTable
        {
            get { return (DataTable)ViewState["FeeDataTable"]; }

            set { ViewState["FeeDataTable"] = value; }

        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {
                Initialization();
                dxeddlAuditStatus.SelectedIndex = 0;
                
            }
            if (IsCallback)
            {
                BindGrid();
            }
        }

        private void Initialization()
        {
            DataSet dsList;

            //GatheringType
            this.dxeddlGatheringType.Items.Add("(全部)", "");
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.GatheringType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlGatheringType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }

            //AuditStatus
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.AuditStatus.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlAuditStatus.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
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

            dsList = BusinessObjects.SchemaSetting.BO_ProductType.GetProductTypeList();
            if (dsList.Tables[0] != null && dsList.Tables[0].Rows.Count > 0)
            {
                this.SetProdTypeName(dsList.Tables[0], "0", this.dxeddlProdTypeName);
            }
        }



        private void SetProdTypeName(DataTable table, string parentid, DevExpress.Web.ASPxEditors.ASPxComboBox comboBox)
        {
            if (parentid == "0")
                this.toadd = "";
            else
                this.toadd += "   ";
            DataRow[] rows = table.Select("ParentID='" + parentid + "'", "ProdClass");
            foreach (DataRow row in rows)
            {
                comboBox.Items.Add(this.toadd + (parentid == "0" ? "" : "∟") + row["ProdTypeName"].ToString(), row["ProdTypeID"].ToString());
                this.SetProdTypeName(table, row["ProdTypeID"].ToString(), comboBox);
                this.toadd = this.toadd.Substring(0, this.toadd.Length - 3);
            }
        }



        private void BindGrid()
        {
            string lsWhere = "";

            if (dxetxtNoticeNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and a.NoticeNo like '%" + dxetxtNoticeNo.Text + "%'";
            }
            if (dxetxtPolicyNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and c.PolicyNo like '%" + dxetxtPolicyNo.Text + "%'";
            }
            if (dxetxtPolicyID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and a.PolicyID like '%" + dxetxtPolicyID.Text + "%'";
            }
            if (this.dxeddlDeptId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlDeptId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and c.DeptId ='" + dxeddlDeptId.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlSalesID.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSalesID.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and c.SalesId ='" + dxeddlSalesID.SelectedItem.Value.ToString() + "'";
            }

            if (dxetxtCustomerID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and  exists( select 1 from Customer where CustName like '%" + dxetxtCustomerID.Text + "%' and CustID=c.CustomerID) ";
            }

            if (this.dxeddlGatheringType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlGatheringType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and d.GatheringTypeID ='" + dxeddlGatheringType.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlPolicyType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlPolicyType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and c.PolicyType ='" + dxeddlPolicyType.SelectedItem.Value.ToString() + "'";

            }

            if (this.dxeddlProdTypeName.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlProdTypeName.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and  c.ProdTypeID like ('%" + dxeddlProdTypeName.SelectedItem.Value.ToString() + "%') ";

            }

            string lsStartDate = dxeStartFeeDate.Date.ToString("yyyy-MM-dd");
            string lsEndDate = dxeEndFeeDate.Date.ToString("yyyy-MM-dd");
            if ((dxeStartFeeDate.Text.Trim() != "") && (dxeStartFeeDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), A.FeeDate,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), A.FeeDate,21)) <='" + lsEndDate + "'";
            }

            //if (dxeddlAuditStatus.SelectedItem.Value.ToString().Trim() != "")
            //{
            //    lsWhere = lsWhere + " and a.AuditStatus ='" + dxeddlAuditStatus.SelectedItem.Value.ToString() + "'";
            //}
            DataTable dt = BO_FeeCustomer.GetFeeCustomerList(lsWhere).Tables[0];
            this.gridSearchResult.DataSource = dt;
            this.gridSearchResult.DataBind();
            
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
            //this.gridSearchResult.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
           BindGrid();
        }

        protected void gridSearchResult_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            BindGrid();
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.gridExport.WriteXlsToResponse();
        }



    }
}
