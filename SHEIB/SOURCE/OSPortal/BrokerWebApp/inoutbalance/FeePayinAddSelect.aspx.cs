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
    public partial class FeePayinAddSelect : BasePage
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
                this.txtProcessFeeType.Value = Page.Request.QueryString["ProcessFeeType"];
            }
            BindGrid();
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
                lsWhere = lsWhere + " and c.PolicyNo ='" + dxetxtPolicyNo.Text + "'";
            }
            if (dxetxtPolicyID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and c.PolicyID ='" + dxetxtPolicyID.Text + "'";
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


            string lsStartDate = dxeGetStartDate.Date.ToString("yyyy-MM-dd");
            string lsEndDate = dxeGetEndDate.Date.ToString("yyyy-MM-dd");
            if ((dxeGetStartDate.Text.Trim() != "") && (dxeGetEndDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), a.PayFeeDate,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), a.PayFeeDate,21)) <='" + lsEndDate + "'";
            }
     
            this.gridSearchResult.DataSource = BO_FeePayin.GetFeePayinAddSelectList(lsWhere);
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
            String polPeriodIds = e.Parameter;
            saveFee(polPeriodIds);
            e.Result = polPeriodIds;
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
                    if (s.Trim().Length >= 20)
                    {
                        //exist = BusinessObjects.BO_Fee.PolPeriodExist(s,BO_P_Code.AccountType.PayIn_Direct);
                        //if (!exist)
                        //{
                        //1 内扣  	 本期应解付保费=	本期实际解付保费	+	调整金额	+	经纪费
                        //2 不内扣	 本期应解付保费=	本期实际解付保费	+	调整金额
                        string ProcessFeeType = txtProcessFeeType.Value;
                        //DataTable dt = BO_FeePayin.GetFeePayinAddSelectList("and PolperiodID='" + s.Trim() + "'").Tables[0];
                        //decimal NeedPayinFee = decimal.Parse(dt.Rows[0]["Fee"].ToString());
                        obj = new BusinessObjects.Policy.BO_PolicyPeriod(s);
                        objLoad = new BusinessObjects.BO_Fee();
                        objLoad.FeeId = Guid.NewGuid().ToString();
                        objLoad.PolPeriodID = s;
                        objLoad.VoucherID = this.txtVoucherId.Value;
                        //objLoad.Fee = obj.PayFeeBase;
                        if (ProcessFeeType == "2")
                        {
                            objLoad.Fee = obj.PayFeeBase ;
                        }
                        else
                        {
                            objLoad.Fee = obj.PayFeeBase - obj.PayProcBase;
                        }
                        objLoad.FeeAdjust = 0;
                        objLoad.Save(ModifiedAction.Insert);
                        //}
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
