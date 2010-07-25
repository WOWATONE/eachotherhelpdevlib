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

namespace BrokerWebApp.inoutbalance
{
    public partial class FeeCustomer : BasePage
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
                CheckPermission();
            }
            if (IsCallback)
            {
                BindGrid();
            }

            LbUserNameTop.Text = this.CurrentUserName;
        }

        private void CheckPermission()
        {
            if (!this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.FeeCustomer_Add))
            {
                debtnCreate.Enabled = false;
            }

        }

        private void Initialization()
        {
            DataSet dsList;

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



        private void BindGrid()
        {
            string lsWhere = "";

            if (dxetxtNoticeNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and b.NoticeNo like '%" + dxetxtNoticeNo.Text + "%'";
            }
            if (dxetxtPolicyNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and c.PolicyNo like '%" + dxetxtPolicyNo.Text + "%'";
            }
            if (dxetxtPolicyID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and c.PolicyID like '%" + dxetxtPolicyID.Text + "%'";
            }
            if (this.dxeddlDeptId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlDeptId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and c.DeptId ='" + dxeddlDeptId.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlSalesId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSalesId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and c.SalesId ='" + dxeddlSalesId.SelectedItem.Value.ToString() + "'";
            }

            if (dxetxtCustomerID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and  exists (select 1 from Customer where CustName like '%" + dxetxtCustomerID.Text + "%' and CustID=c.CustomerID) ";
            }

            if (this.dxeddlPolicyType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlPolicyType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and c.PolicyType ='" + dxeddlPolicyType.SelectedItem.Value.ToString() + "'";

            }

            string lsStartDate = dxeStartFeeDate.Date.ToString("yyyy-MM-dd");
            string lsEndDate = dxeEndFeeDate.Date.ToString("yyyy-MM-dd");
            if ((dxeStartFeeDate.Text.Trim() != "") && (dxeStartFeeDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), A.FeeDate,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), A.FeeDate,21)) <='" + lsEndDate + "'";
            }

            if (this.dxeddlAuditStatus.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlAuditStatus.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.AuditStatus ='" + dxeddlAuditStatus.SelectedItem.Value.ToString() + "'";
            }

            DataTable dt = BO_FeeCustomer.GetFeeCustomerList(lsWhere).Tables[0];
            this.gridSearchResult.DataSource = dt;
            this.gridSearchResult.DataBind();

        }


        protected void gridSearchResult_HtmlRowCreated(object sender,
            DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {

            if (e.RowType == DevExpress.Web.ASPxGridView.GridViewRowType.Data)
            {
                object objIsAntiAudit = e.GetValue("IsAntiAudit");
                if (!String.IsNullOrEmpty(objIsAntiAudit.ToString()))
                {
                    if (objIsAntiAudit.ToString() == "1")
                    {
                        e.Row.Style.Add(HtmlTextWriterStyle.Color, "red");
                    }
                }

                if (!this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.FeeCustomer_Delete))
                {
                    e.Row.Cells[0].Controls[0].Visible = false;
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


        protected void dxeDeleteVoucherCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            string key = e.Parameter;
            e.Result = "";

            if (BusinessObjects.BO_Voucher.IfExistsPolicy(key))
            {
                e.Result = "该结算单已经有相关保单存在，不能删除！";
                return;
            }

            BO_Voucher.Delete(key);
            e.Result = "ok";
        }

    }
}
