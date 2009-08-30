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
    public partial class FeeCustomerAddSelect : BasePage
    {

        #region Variables

        private const string inputQueryStringIDKey = "ID";
        private string toadd = string.Empty;
        //url

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {                
                Initialization();
                this.txtVoucherId.Value = Page.Request.QueryString[inputQueryStringIDKey];
                if (txtVoucherId.Value == "q")
                {
                    btnOk.Visible = false;
                }
            }
            BindGrid();
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
                lsWhere = lsWhere + " and a.PolicyID like '%" + dxetxtPolicyID.Text + "%'";
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
                lsWhere = lsWhere + " and  exists( select 1 from Customer where CustName like '%" + dxetxtCustomerID.Text + "%' and CustID=c.CustomerID) ";
            }


            if (this.dxeddlPolicyType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlPolicyType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and c.PolicyType ='" + dxeddlPolicyType.SelectedItem.Value.ToString() + "'";

            }


            string lsStartDate = dxeNoticeStartDate.Date.ToString("yyyy-MM-dd");
            string lsEndDate = dxeNoticeEndDate.Date.ToString("yyyy-MM-dd");
            if ((dxeNoticeStartDate.Text.Trim() != "") && (dxeNoticeEndDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), a.NoticeDate,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), a.NoticeDate,21)) <='" + lsEndDate + "'";
            }

            this.gridSearchResult.DataSource = BO_FeeCustomer.GetFeeCustomerAddSelectList(lsWhere);
            this.gridSearchResult.DataBind();
            this.gridSearchResult.ExpandAll();

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
                    if (s.Trim().Length >= 30)
                    {
                        //exist = BusinessObjects.BO_Fee.PolPeriodExist(s, BusinessObjects.BO_P_Code.AccountType.FeeCustomer_Direct);
                        //if (!exist)
                        //{
                        DataTable dt = BO_FeeCustomer.GetFeeCustomerAddSelectList("and PolperiodID='" + s.Trim() + "'").Tables[0];
                        decimal NeedPayFee = decimal.Parse(dt.Rows[0]["Fee"].ToString());
                        obj = new BusinessObjects.Policy.BO_PolicyPeriod(s);
                        objLoad = new BusinessObjects.BO_Fee();
                        objLoad.FeeId = Guid.NewGuid().ToString();
                        objLoad.PolPeriodID = s;
                        objLoad.VoucherID = this.txtVoucherId.Value;
                        //objLoad.Fee = obj.PayFeeBase;
                        objLoad.Fee = NeedPayFee;
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

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            BindGrid();
            this.gridExport.WriteXlsToResponse();
        }



    }
}

