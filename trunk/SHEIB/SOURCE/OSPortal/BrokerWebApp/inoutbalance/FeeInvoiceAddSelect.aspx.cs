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
    public partial class FeeInvoiceAddSelect : BasePage
    {

        #region Variables

        private const string inputQueryStringIDKey = "ID";

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {
                Initialization();
                this.txtVoucherId.Value = Page.Request.QueryString[inputQueryStringIDKey];
                
            }
            BindGrid();
        }


        private void BindGrid()
        {

            string lsWhere = "";


            if (dxetxtPolicyNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and c.PolicyNo ='" + dxetxtPolicyNo.Text + "'";
            }

            if (dxeddlDeptId.SelectedItem.Value.ToString().Trim() != "")
            {
                lsWhere = lsWhere + " and c.DeptId ='" + dxeddlDeptId.SelectedItem.Value.ToString() + "'";
            }
            if (dxeddlSalesId.SelectedItem.Value.ToString().Trim() != "")
            {
                lsWhere = lsWhere + " and c.SalesId ='" + dxeddlSalesId.SelectedItem.Value.ToString() + "'";
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
                lsWhere = lsWhere + " and  a.GatheringType= '" + dxeddlGatheringType.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlProcessFeeType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlProcessFeeType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.ProcessFeeType ='" + dxeddlProcessFeeType.SelectedItem.Value.ToString() + "'";
            }

            string lsStartDate = dxeGetStartDate.Date.ToString("yyyy-MM-dd");
            string lsEndDate = dxeGetEndDate.Date.ToString("yyyy-MM-dd");
            if ((dxeGetStartDate.Text.Trim() != "") && (dxeGetEndDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), a.PayinDate,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), a.PayinDate,21)) <='" + lsEndDate + "'";
            }

            this.gridSearchResult.DataSource = Bo_FeeInvoice.GetFeeInvoiceSelectList(lsWhere);
            this.gridSearchResult.DataBind();

        }


        private void Initialization()
        {
            DataSet dsList;


            this.dxeddlProcessFeeType.Items.Add("(全部)", "");
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.ProcessFeeType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlProcessFeeType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
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

        protected void dxeSaveCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String thenoticeNo = e.Parameter;
            saveFee(thenoticeNo);
            e.Result = thenoticeNo;
        }

        private void saveFee(String polPeriodIds)
        {
            BusinessObjects.BO_Fee objLoad;
            BusinessObjects.Policy.BO_PolicyPeriod obj;
            String[] ppids;
            ppids = polPeriodIds.Split(new String[] { "," }, StringSplitOptions.None);

            Boolean exist = false;
            foreach (String s in ppids)
            {
                if (s.Trim() != "")
                {
                    if (s.Trim().Length >= 30)
                    {
                        exist = BusinessObjects.BO_Fee.PolPeriodExist(s, BO_P_Code.AccountType.Invoice);
                        if (!exist)
                        {
                            obj = new BusinessObjects.Policy.BO_PolicyPeriod(s);
                            objLoad = new BusinessObjects.BO_Fee();
                            objLoad.FeeId = Guid.NewGuid().ToString();
                            objLoad.PolPeriodID = s;
                            objLoad.VoucherID = this.txtVoucherId.Value;
                            objLoad.Fee = obj.PayProcBase;
                            objLoad.FeeAdjust = 0;
                            objLoad.Save(ModifiedAction.Insert);
                        }
                    }
                }
            }

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
