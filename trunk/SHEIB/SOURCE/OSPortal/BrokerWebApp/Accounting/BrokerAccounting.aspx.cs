using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxEditors;
using BusinessObjects;

namespace BrokerWebApp.Accounting
{

    public partial class BrokerAccounting : BasePage
    {

        #region Variables

        private const String gridKeyName = "KeyGUID";
        private string toadd = string.Empty;

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            //
            if (!Page.IsPostBack)
            {
                bindDropDownLists();
                CheckPermission();
            }
            BindGrid();
        }



        private void CheckPermission()
        {
            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.InsuranceBrokerBusinessReport_Personal))
            {
                dxeddlDeptID.Value = this.CurrentUser.DeptID;
                dxeddlSalesId.Value = this.CurrentUser.UserID;

                dxeddlDeptID.ClientEnabled = false;
                dxeddlSalesId.ClientEnabled = false;
            }
            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.InsuranceBrokerBusinessReport_Group))
            {
                dxeddlDeptID.Value = this.CurrentUser.DeptID;
                dxeddlDeptID.ClientEnabled = false;

                dxeddlSalesId.Value = this.CurrentUser.UserID;
                dxeddlSalesId.ClientEnabled = true;
            }

            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.InsuranceBrokerBusinessReport_All))
            {
                dxeddlDeptID.ClientEnabled = true;
                dxeddlSalesId.ClientEnabled = true;
            }
        }


        private void bindDropDownLists()
        {
            DataSet dsList;
            this.dxeddlDeptID.DataSource = BusinessObjects.BO_P_Department.FetchList();
            this.dxeddlDeptID.TextField = "DeptName";
            this.dxeddlDeptID.ValueField = "DeptID";
            this.dxeddlDeptID.DataBind();
            this.dxeddlDeptID.Items.Insert(0, new ListEditItem("(全部)", ""));

            //this.dxeddlSalesId.DataSource = BusinessObjects.BO_P_User.FetchList();
            //this.dxeddlSalesId.TextField = "UserNameCn";
            //this.dxeddlSalesId.ValueField = "UserID";
            //this.dxeddlSalesId.DataBind();



            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.InsuranceBrokerBusinessReport_Group))
            {
                dxeddlSalesId.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(this.CurrentUser.DeptID);
            }
            else if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.InsuranceBrokerBusinessReport_All))
            {
                this.dxeddlSalesId.DataSource = BusinessObjects.BO_P_User.FetchList();
            }
            else
            {
                this.dxeddlSalesId.DataSource = BusinessObjects.BO_P_User.FetchList();
            }
            this.dxeddlSalesId.TextField = "UserNameCn";
            this.dxeddlSalesId.ValueField = "UserID";
            this.dxeddlSalesId.DataBind();
            dxeddlSalesId.Items.Insert(0, new ListEditItem("(全部)", ""));

            this.dxeddlOperationType.DataSource = BusinessObjects.BO_P_Code.GetOperationTypeList();
            this.dxeddlOperationType.TextField = "OperationTypeName";
            this.dxeddlOperationType.ValueField = "OperationTypeID";
            this.dxeddlOperationType.DataBind();

            //this.dxeddlSourceTypeID.DataSource = BusinessObjects.BO_P_Code.GetSourceTypeList();
            //this.dxeddlSourceTypeID.TextField = "SourceTypeName";
            //this.dxeddlSourceTypeID.ValueField = "SourceTypeID";
            //this.dxeddlSourceTypeID.DataBind();

            this.dxeddlCarrierId.DataSource = BusinessObjects.SchemaSetting.BO_Carrier.GetCarrierList("");
            this.dxeddlCarrierId.TextField = "CarrierNameCn";
            this.dxeddlCarrierId.ValueField = "CarrierID";
            this.dxeddlCarrierId.DataBind();


            this.dxeddlBranchId.DataSource = BusinessObjects.SchemaSetting.BO_Branch.GetBranchList("");
            this.dxeddlBranchId.TextField = "BranchName";
            this.dxeddlBranchId.ValueField = "BranchID";
            this.dxeddlBranchId.DataBind();

            //dsList = BusinessObjects.SchemaSetting.BO_Carrier.GetCarrierList("");
            //if (dsList.Tables[0] != null)
            //{
            //    foreach (DataRow row in dsList.Tables[0].Rows)
            //    {
            //        this.dxeddlCarrierId.Items.Add(row["CarrierNameCn"].ToString().Trim(), row["CarrierID"].ToString().Trim());
            //    }
            //}

            //dsList = BusinessObjects.SchemaSetting.BO_Branch.GetBranchList("");
            //if (dsList.Tables[0] != null)
            //{
            //    foreach (DataRow row in dsList.Tables[0].Rows)
            //    {
            //        this.dxeddlBranchId.Items.Add(row["BranchName"].ToString().Trim(), row["BranchID"].ToString().Trim());
            //    }
            //}

            dsList = BusinessObjects.SchemaSetting.BO_ProductType.GetProductTypeList();
            if (dsList.Tables[0] != null && dsList.Tables[0].Rows.Count > 0)
            {
                this.SetProdTypeName(dsList.Tables[0], "0", this.dxeddlProdTypeName);
            }

            this.SetddlCustClassify("");
        }


        private void SetddlCustClassify(string value)
        {
            DataSet dsList = BusinessObjects.SchemaSetting.BO_Carrier.GetCustClassifyByID("");
            if (dsList.Tables[0] != null && dsList.Tables[0].Rows.Count > 0)
            {
                this.SetCustClassify(dsList.Tables[0], "0", this.dxeddlCustClassify);
                if (!string.IsNullOrEmpty(value))
                {
                    this.dxeddlCustClassify.SelectedIndex = this.dxeddlCustClassify.Items.IndexOf(this.dxeddlCustClassify.Items.FindByValue(value));
                    if (this.dxeddlCustClassify.SelectedIndex >= 0)
                        this.dxeddlCustClassify.Text = this.dxeddlCustClassify.SelectedItem.Text.Substring(this.dxeddlCustClassify.SelectedItem.Text.IndexOf("∟") + 1);
                    this.hidCustClassify.Value = value;
                }
            }
        }

        private void SetCustClassify(DataTable table, string parentid, ASPxComboBox comboBox)
        {
            if (parentid == "0")
                this.toadd = "";
            else
                this.toadd += "   ";
            DataRow[] rows = table.Select("ParentID='" + parentid + "'", "OrderNO");
            foreach (DataRow row in rows)
            {
                comboBox.Items.Add(this.toadd + (parentid == "0" ? "" : "∟") + row["CustClassifyName"].ToString(), row["CustClassifyID"].ToString());
                this.SetCustClassify(table, row["CustClassifyID"].ToString(), comboBox);
                this.toadd = this.toadd.Substring(0, this.toadd.Length - 3);
            }
        }

        private void SetProdTypeName(DataTable table, string parentid, ASPxComboBox comboBox)
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

        private void SetddlProdTypeName(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                this.dxeddlProdTypeName.SelectedIndex = this.dxeddlProdTypeName.Items.IndexOf(this.dxeddlProdTypeName.Items.FindByValue(value));
                if (this.dxeddlProdTypeName.SelectedIndex >= 0)
                    this.dxeddlProdTypeName.Text = this.dxeddlProdTypeName.SelectedItem.Text.Substring(this.dxeddlProdTypeName.SelectedItem.Text.IndexOf("∟") + 1);
                ptid.Value = value;
            }
        }



        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String theID = e.Keys[gridKeyName].ToString();
            //edit
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.BindGrid();
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        private void BindGrid()
        {
            string lsWhere = "";
            if (dxetxtPolicyID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and b.PolicyID ='" + dxetxtPolicyID.Text + "'";
            }

            if (dxetxtPolicyNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and b.PolicyNo like '%" + dxetxtPolicyNo.Text + "%'";
            }

            if (this.dxeddlOperationType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlOperationType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.OperationType ='" + dxeddlOperationType.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlDeptID.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlDeptID.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.DeptId ='" + dxeddlDeptID.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlSalesId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSalesId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.SalesId ='" + dxeddlSalesId.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlCarrierId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlCarrierId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.CarrierID ='" + dxeddlCarrierId.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlBranchId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlBranchId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.BranchID ='" + dxeddlBranchId.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlProdTypeName.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlProdTypeName.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and  b.ProdTypeID like ('%" + dxeddlProdTypeName.SelectedItem.Value.ToString() + "%') ";
            }

            if (dxetxtCustomer.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and  exists( select 1 from Customer where CustName like '%" + dxetxtCustomer.Text + "%' and CustID=b.CustomerID) ";
            }

            if (this.dxeddlGatheringType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlGatheringType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.GatheringType ='" + dxeddlGatheringType.SelectedItem.Value.ToString() + "'";
            }

            string lsStartDate = dxeStartDate.Date.ToString("yyyy-MM-dd");
            string lsEndDate = dxeEndDate.Date.ToString("yyyy-MM-dd");
            if ((dxeStartDate.Text.Trim() != "") && (dxeEndDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), b.CreateTime,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), b.CreateTime,21)) <='" + lsEndDate + "'";
            }

            string lsStartPayFeeDate = dxeStartPayFeeDate.Date.ToString("yyyy-MM-dd");
            string lsEndPayFeeDate = dxeEndPayFeeDate.Date.ToString("yyyy-MM-dd");
            if ((dxeStartPayFeeDate.Text.Trim() != "") && (dxeEndPayFeeDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), a.PayFeeDate,21)) >='" + lsStartPayFeeDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), a.PayFeeDate,21)) <='" + lsEndPayFeeDate + "'";
            }
            if (this.dxeddlPayFeeStatus.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlPayFeeStatus.SelectedItem.Value.ToString()))
            {
                string sStatus = dxeddlPayFeeStatus.SelectedItem.Value.ToString();
                if (sStatus == "0")
                {
                    lsWhere = lsWhere + " and a.PayFeeDate is null ";
                }
                if (sStatus == "1")
                {
                    lsWhere = lsWhere + " and a.PayFeeDate is not null ";
                }
            }


            string lsStartPayinDate = dxeStartPayinDate.Date.ToString("yyyy-MM-dd");
            string lsEndPayinDate = dxeEndPayinDate.Date.ToString("yyyy-MM-dd");
            if ((dxeStartPayinDate.Text.Trim() != "") && (dxeEndPayinDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), a.PayinDate,21)) >='" + lsStartPayinDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), a.PayinDate,21)) <='" + lsEndPayinDate + "'";
            }
            if (this.dxeddlPayinStatus.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlPayinStatus.SelectedItem.Value.ToString()))
            {
                string sStatus = dxeddlPayinStatus.SelectedItem.Value.ToString();
                if (sStatus == "0")
                {
                    lsWhere = lsWhere + " and a.PayinDate is null ";
                }
                if (sStatus == "1")
                {
                    lsWhere = lsWhere + " and a.PayinDate is not null ";
                }
            }


            string lsStartInvoiceDate = dxeStartInvoiceDate.Date.ToString("yyyy-MM-dd");
            string lsEndInvoiceDate = dxeEndInvoiceDate.Date.ToString("yyyy-MM-dd");
            if ((dxeStartInvoiceDate.Text.Trim() != "") && (dxeEndInvoiceDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), a.InvoiceDate,21)) >='" + lsStartInvoiceDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), a.InvoiceDate,21)) <='" + lsEndInvoiceDate + "'";
            }
            if (this.dxeddlInvoiceStatus.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlInvoiceStatus.SelectedItem.Value.ToString()))
            {
                string sStatus = dxeddlInvoiceStatus.SelectedItem.Value.ToString();
                if (sStatus == "0")
                {
                    lsWhere = lsWhere + " and a.InvoiceDate is null ";
                }
                if (sStatus == "1")
                {
                    lsWhere = lsWhere + " and a.InvoiceDate is not null ";
                }
            }


            string lsStartPayProcDate = dxeStartPayProcDate.Date.ToString("yyyy-MM-dd");
            string lsEndPayProcDate = dxeEndPayProcDate.Date.ToString("yyyy-MM-dd");
            if ((dxeStartPayProcDate.Text.Trim() != "") && (dxeEndPayProcDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), a.PayProcDate,21)) >='" + lsStartPayProcDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), a.PayProcDate,21)) <='" + lsEndPayProcDate + "'";
            }
            if (this.dxeddlPayProcStatus.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlPayProcStatus.SelectedItem.Value.ToString()))
            {
                string sStatus = dxeddlPayProcStatus.SelectedItem.Value.ToString();
                if (sStatus == "0")
                {
                    lsWhere = lsWhere + " and a.PayProcDate is null ";
                }
                if (sStatus == "1")
                {
                    lsWhere = lsWhere + " and a.PayProcDate is not null ";
                }
            }


            string lsStartPayDate = dxeStartPayDate.Date.ToString("yyyy-MM-dd");
            string lsEndPayDate = dxeEndPayDate.Date.ToString("yyyy-MM-dd");
            if ((dxeStartPayDate.Text.Trim() != "") && (dxeEndPayDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), a.PayDate,21)) >='" + lsStartPayDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), a.PayDate,21)) <='" + lsEndPayDate + "'";
            }

            if (dxetxtCarNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and b.CarNo like '%" + dxetxtCarNo.Text + "%'";
            }


            string sClassify = string.IsNullOrEmpty(this.hidCustClassify.Value) ? "" : this.hidCustClassify.Value;
            if (sClassify != "")
            {
                if (sClassify.Trim().Length == 1)
                    lsWhere = lsWhere + " and c.CustClassifyID like '" + sClassify.Trim()  + "%'";
                else
                    lsWhere = lsWhere + " and c.CustClassifyID = '" + sClassify.Trim() + "'";
            }

            if (dxetxtAciPolicyNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and b.AciPolicyNo like '%" + dxetxtAciPolicyNo.Text + "%'";
            }


            string lsPolicyStartDateStart = dxePolicyStartDateStart.Date.ToString("yyyy-MM-dd");
            string lsPolicyStartDateEnd = dxePolicyStartDateEnd.Date.ToString("yyyy-MM-dd");
            if ((dxePolicyStartDateStart.Text.Trim() != "") && (dxePolicyStartDateEnd.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), b.StartDate,21)) >='" + lsPolicyStartDateStart + "'";
                lsWhere = lsWhere + " and (convert(char(10), b.StartDate,21)) <='" + lsPolicyStartDateEnd + "'";
            }

            DataTable dt = BO_Report.GetAccounting(lsWhere).Tables[0];
            this.gridSearchResult.DataSource = dt;
            this.gridSearchResult.DataBind();

        }


        protected void dxeddlSalesIdCallback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(e.Parameter);
            thecb.TextField = "UserNameCn";
            thecb.ValueField = "UserID";
            thecb.DataBind();
            thecb.Items.Insert(0, new ListEditItem("(全部)", ""));
            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }
        }

        protected void dxeddlBranchId_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
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
