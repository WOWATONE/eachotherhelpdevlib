using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;

namespace BrokerWebApp.inoutbalance
{
    public partial class FeeNotice : BasePage
    {

        #region Variables

        private DataTable _dtGrid;

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack && !IsCallback)
            {
                Initialization();
                //BindGrid();
                CheckPermission();
            }

            BindGrid();

            LbUserNameTop.Text = this.CurrentUserName;

        }


        private void CheckPermission()
        {
            if (!this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.FeeNotice_Add))
            {
                debtnCreate.Enabled = false;
            }
        }

        private void Initialization()
        {
            dxeNoticeStartDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            dxeNoticeEndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

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
            this.dxeddlAuditStatus.Items.Add("(全部)", "");
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.AuditStatus.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlAuditStatus.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
                dxeddlAuditStatus.SelectedIndex = 0;
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
                lsWhere = lsWhere + " and a.NoticeNo like '%" + dxetxtNoticeNo.Text + "%'";
            }
            if (dxetxtPolicyNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and  exists( select 1 from PolicyPeriodDetail where PolicyNo like '%" + dxetxtPolicyNo.Text + "%' and NoticeNo=a.NoticeNo) ";
            }

            if (this.dxeddlGatheringType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlGatheringType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and  a.GatheringType= '" + dxeddlGatheringType.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlDeptId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlDeptId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and  exists( select 1 from PolicyPeriodDetail where DeptId ='" + dxeddlDeptId.SelectedItem.Value.ToString() + "' and NoticeNo=a.NoticeNo) ";
            }

            if (this.dxeddlSalesId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSalesId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and  exists( select 1 from PolicyPeriodDetail where SalesId ='" + dxeddlSalesId.SelectedItem.Value.ToString() + "' and NoticeNo=a.NoticeNo) ";
            }
            if (dxetxtCustomerID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and  exists( select 1 from PolicyPeriodDetail where CustomerName like '%" + dxetxtCustomerID.Text + "%' and NoticeNo=a.NoticeNo) ";
            }

            if (this.dxeddlAuditStatus.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlAuditStatus.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.AuditStatus ='" + dxeddlAuditStatus.SelectedItem.Value.ToString().Trim() + "'";
            }


            if (this.dxeddlPolicyType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlPolicyType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and  exists( select 1 from PolicyPeriodDetail where PolicyType ='" + dxeddlPolicyType.SelectedItem.Value.ToString().Trim() + "' and NoticeNo=a.NoticeNo) ";
            }


            string lsStartDate = dxeNoticeStartDate.Date.ToString("yyyy-MM-dd");
            string lsEndDate = dxeNoticeEndDate.Date.ToString("yyyy-MM-dd");
            if ((dxeNoticeStartDate.Text.Trim() != "") && (dxeNoticeEndDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), A.NoticeDate,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), A.NoticeDate,21)) <='" + lsEndDate + "'";
            }


            DataTable dt = BO_Notice.GetFeeNoticeList(lsWhere).Tables[0];
            this.gridSearchResult.DataSource = dt;
            this.gridSearchResult.DataBind();

            //gridSearchResult.Columns[0].Width =0;

        }


        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.gridExport.WriteXlsToResponse();
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

        protected void gridSearchResult_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }


        protected void dxeDeleteVoucherCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            string key = e.Parameter;
            e.Result = "";

            if (BusinessObjects.BO_Notice.IfExistsPolicy(key))
            {
                e.Result = "该通知书有相关保单存在，不能删除！";
                return;
            }

            BO_Notice.Delete(key);
            e.Result = "ok";
        }



        protected void gridSearchResult_HtmlRowCreated(object sender,
            ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                if (!this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.FeeNotice_Modify))
                {
                    e.Row.Cells[0].Controls[0].Visible = false;
                    //e.Row.Cells[0].Controls[1].Visible = false;
                }
            }

        }

    }
}
