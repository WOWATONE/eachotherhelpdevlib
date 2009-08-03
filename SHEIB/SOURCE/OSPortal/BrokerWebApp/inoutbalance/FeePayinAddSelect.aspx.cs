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
            //if (dxeddlGatheringType.SelectedItem.Value.ToString().Trim() != "")
            //{
            //    lsWhere = lsWhere + " and a.GatheringTypeID ='" + dxeddlGatheringType.SelectedItem.Value.ToString() + "'";
            //}
            //if (dxetxtProdTypeID.Text.Trim() != "")
            //{
            //    lsWhere = lsWhere + " and  exists( select 1 from ProductType where ProdTypeName like '%" + dxetxtProdTypeID.Text + "%' and CustID=a.CustomerID) ";
            //}

            //string lsStartDate = dxe.Date.ToString("yyyy-MM-dd");
            //string lsEndDate = dxeNoticeEndDate.Date.ToString("yyyy-MM-dd");
            //if ((dxeNoticeStartDate.Text.Trim() != "") && (dxeNoticeEndDate.Text.Trim() != ""))
            //{
            //    lsWhere = lsWhere + " and (convert(char(10), a.NoticeDate,21)) >='" + lsStartDate + "'";
            //    lsWhere = lsWhere + " and (convert(char(10), a.NoticeDate,21)) <='" + lsEndDate + "'";
            //}

            //if (ckbPayedNeedPayin.Checked)
            //{
            //    lsWhere = lsWhere + "  and not exists(select 1 from VoucherFee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('5'))";
            //}

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
            this.dxeddlSalesID.Items.Add("(全部)", "");
            dsList = BO_P_User.GetUserByUserID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlSalesID.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
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
