using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;
using DevExpress.Web.ASPxEditors;

namespace BrokerWebApp.inoutbalance
{
    public partial class FeeProcess : BasePage
    {

        #region Variables

        

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack && !IsCallback)
            {                
                //dxeddlAuditStatus.SelectedIndex = 0;    
                Initialization();
            }
            BindGrid();
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

            this.dxeddlProcessFeeType.Items.Add("(全部)", "");
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.ProcessFeeType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlProcessFeeType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
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


            this.dxeddlCarrier.Items.Add("(全部)", "");
            dsList = BusinessObjects.SchemaSetting.BO_Carrier.GetCarrierList("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlCarrier.Items.Add(row["CarrierNameCn"].ToString().Trim(), row["CarrierID"].ToString().Trim());
                }
            }

            this.dxeddlBranch.Items.Add("(全部)", "");
            dsList = BusinessObjects.SchemaSetting.BO_Branch.GetBranchList("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlBranch.Items.Add(row["BranchName"].ToString().Trim(), row["BranchID"].ToString().Trim());
                }
            }


        }



        private void BindGrid()
        {
            string lsWhere = "";


            if (dxetxtProcessID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and a.VoucherID like '%" + dxetxtProcessID.Text + "%'";
            }

            if (dxetxtPolicyNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and c.PolicyNo like '%" + dxetxtPolicyNo.Text + "%'";
            }
            if (dxeddlGatheringType.SelectedItem.Value.ToString().Trim() != "")
            {
                lsWhere = lsWhere + " and  b.GatheringType ='" + dxeddlGatheringType.SelectedItem.Value.ToString() + "'";
            }
            if (dxeddlDeptId.SelectedItem.Value.ToString().Trim() != "")
            {
                lsWhere = lsWhere + " and c.DeptId ='" + dxeddlDeptId.SelectedItem.Value.ToString() + "'";
            }
            if (dxeddlSalesId.SelectedItem.Value.ToString().Trim() != "")
            {
                lsWhere = lsWhere + " and c.SalesId ='" + dxeddlSalesId.SelectedItem.Value.ToString() + "'";
            }
            if (dxetxtCustomerID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and  exists( select 1 from Customer where CustName like '%" + dxetxtCustomerID.Text + "%' and CustID=c.CustomerID) ";
            }

            if (this.dxeddlCarrier.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlCarrier.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.CarrierID ='" + dxeddlCarrier.SelectedItem.Value.ToString() + "'";
            }
            if (this.dxeddlBranch.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlBranch.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.BranchID ='" + dxeddlBranch.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlPolicyType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlPolicyType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and c.PolicyType ='" + dxeddlPolicyType.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlGatheringType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlGatheringType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.GatheringType ='" + dxeddlGatheringType.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlProcessFeeType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlProcessFeeType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.ProcessFeeType ='" + dxeddlProcessFeeType.SelectedItem.Value.ToString() + "'";
            }
            if (this.dxetxtCarrierSales.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and c.CarrierSales like '%" + dxetxtCarrierSales.Text + "%'";
            }


            string lsStartDate = dxeGetStartDate.Date.ToString("yyyy-MM-dd");
            string lsEndDate = dxeGetEndDate.Date.ToString("yyyy-MM-dd");
            if ((dxeGetEndDate.Text.Trim() != "") && (dxeGetEndDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), A.FeeDate,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), A.FeeDate,21)) <='" + lsEndDate + "'";
            }

            if (this.dxeddlAuditStatus.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlAuditStatus.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.AuditStatus ='" + dxeddlAuditStatus.SelectedItem.Value.ToString() + "'";
            }


            DataTable dt = BO_FeeProcess.GetFeeProcessList(lsWhere).Tables[0];
            this.gridSearchResult.DataSource = dt;
            this.gridSearchResult.DataBind();

        }


        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
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
            }
        }




    }
}
