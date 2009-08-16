using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;

namespace BrokerWebApp.IntegrateSearch
{

    public partial class PolicyListDetail : System.Web.UI.Page
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
            }
            if (Page.IsCallback)
            {
                BindGrid();
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


            this.dxeddlSalesId.DataSource = BusinessObjects.BO_P_User.FetchList();
            this.dxeddlSalesId.TextField = "UserNameCn";
            this.dxeddlSalesId.ValueField = "UserID";
            this.dxeddlSalesId.DataBind();

            this.dxeddlOperationType.DataSource = BusinessObjects.BO_P_Code.GetOperationTypeList();
            this.dxeddlOperationType.TextField = "OperationTypeName";
            this.dxeddlOperationType.ValueField = "OperationTypeID";
            this.dxeddlOperationType.DataBind();

            this.dxeddlSourceTypeID.DataSource = BusinessObjects.BO_P_Code.GetSourceTypeList();
            this.dxeddlSourceTypeID.TextField = "SourceTypeName";
            this.dxeddlSourceTypeID.ValueField = "SourceTypeID";
            this.dxeddlSourceTypeID.DataBind();

            this.dxeddlCarrierId.DataSource = BusinessObjects.SchemaSetting.BO_Carrier.GetCarrierList("");
            this.dxeddlCarrierId.TextField = "CarrierNameCn";
            this.dxeddlCarrierId.ValueField = "CarrierID";
            this.dxeddlCarrierId.DataBind();


            this.dxeddlBranchId.DataSource = BusinessObjects.SchemaSetting.BO_Branch.GetBranchList("");
            this.dxeddlBranchId.TextField = "BranchName";
            this.dxeddlBranchId.ValueField = "BranchID";
            this.dxeddlBranchId.DataBind();

            this.dxeddlPolicyStatus.DataSource = BusinessObjects.BO_P_Code.GetCodeListByCodeTypeID(BusinessObjects.BO_P_Code.PCodeType.PolicyStatus.ToString());
            this.dxeddlPolicyStatus.TextField = "CodeName";
            this.dxeddlPolicyStatus.ValueField = "CodeID";
            this.dxeddlPolicyStatus.DataBind();

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



        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            BindGrid();
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }

        private void BindGrid()
        {
            string lsWhere = "";
            if (dxetxtPolicyID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and a.PolicyID ='" + dxetxtPolicyID.Text + "'";
            }

            if (dxetxtPolicyNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and a.PolicyNo ='" + dxetxtPolicyNo.Text + "'";
            }

            if (this.dxeddlOperationType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlOperationType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.OperationType ='" + dxeddlOperationType.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlDeptID.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlDeptID.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.DeptId ='" + dxeddlDeptID.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlSalesId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSalesId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.SalesId ='" + dxeddlSalesId.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlCarrierId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlCarrierId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.CarrierID ='" + dxeddlCarrierId.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlProdTypeName.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlProdTypeName.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and  a.ProdTypeID like ('%" + dxeddlProdTypeName.SelectedItem.Value.ToString() + "%') ";
            }

            if (this.dxeddlPolicyStatus.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlPolicyStatus.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " AND ISNULL(a.PolicyStatus,'0') = '" + dxeddlPolicyStatus.SelectedItem.Value.ToString() + "' ";
            }

            if (dxetxtCustomer.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and  exists( select 1 from Customer where CustName like '%" + dxetxtCustomer.Text + "%' and CustID=a.CustomerID) ";
            }

            string lsStartDate = dxeStartDate.Date.ToString("yyyy-MM-dd");
            string lsEndDate = dxeEndDate.Date.ToString("yyyy-MM-dd");
            if ((dxeStartDate.Text.Trim() != "") && (dxeEndDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), a.CreateTime,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), a.CreateTime,21)) <='" + lsEndDate + "'";
            }

            DataTable dt = BusinessObjects.Policy.BO_Policy.GetPolicyByCarrier(lsWhere).Tables[0];
            
            this.gridSearchResult.DataSource = dt;
            this.gridSearchResult.DataBind();


            System.Collections.ArrayList result = new System.Collections.ArrayList();
            foreach (DataRow row in dt.Rows)
            {
                if (row["PolicyID"].ToString() != "00000052")
                    result.Add(row["PolicyID"]);
            }
            Session["SelectResult"] = result;
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void detailGrid_DataSelect(object sender, EventArgs e)
        {
            string PolicyID = (string)(sender as ASPxGridView).GetMasterRowFieldValues("PolicyID");
            DataTable dt = BusinessObjects.Policy.BO_Policy.GetPolicyByCarrier(" and a.PolicyID='" + PolicyID + "'").Tables[0];

            ASPxGridView detailGrid = sender as ASPxGridView;
            detailGrid.SettingsDetail.ExportMode = GridViewDetailExportMode.None;
            detailGrid.DataSource = dt;

            if (PolicyID == "00000052")                
            {
                detailGrid.SettingsDetail.ExportMode = GridViewDetailExportMode.None;
            }

        }


        protected void gridSearchResult_CustomSummaryCalculate(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            //if (e.SummaryProcess == DevExpress.Data.CustomSummaryProcess.Finalize) {
            //    ASPxSummaryItem si = (ASPxSummaryItem)e.Item;
            //    if (si.FieldName == "PolicyNo") {

            //        if (e.IsTotalSummary) {
                    

            //        }
            //        if (e.IsGroupSummary) {
            //            //here I need visible index, but it seems impossible to calculate it
            //            //subTotal = (decimal)ASPxGridView1.GetGroupSummaryValue(visIndex, ASPxGridView1.GroupSummary["SubTotal"]);
            //            //taxAmt = (decimal)ASPxGridView1.GetGroupSummaryValue(visIndex++, ASPxGridView1.GroupSummary["TaxAmt"]);
            //        }
            //        e.TotalValue = 20;
            //    }
            //}
        }


        protected void gridSearchResult_DataBinding(object sender, EventArgs e)
        {
            DevExpress.Web.ASPxGridView.ASPxGridView grid = sender as DevExpress.Web.ASPxGridView.ASPxGridView;
            if ((grid != null) )
            {
                int i = (int)grid.GetMasterRowKeyValue();/*取主表记录的Key，主表grid必须设定KeyFieldName*/
                
            }

            
        }
        private void DoSelect()
        {
       
        }


        protected void gridSearchResult_DetailRowGetButtonVisibility(object sender, ASPxGridViewDetailRowButtonEventArgs e)
        {
           // Response.Write(e.KeyValue);

            if (Session["SelectResult"] != null)
            {
                if (!((System.Collections.ArrayList)Session["SelectResult"]).Contains(e.KeyValue))
                    e.ButtonState = GridViewDetailRowButtonState.Hidden;
            }

            //ASPxGridView detailGrid = sender as ASPxGridView;

        }



        protected void dxeddlSalesIdCallback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(e.Parameter);
            thecb.TextField = "UserNameCn";
            thecb.ValueField = "UserID";
            thecb.DataBind();
            thecb.Items.Insert(0, new ListEditItem("(全部)", ""));
            //if (thecb.Items.Count > 0)
            //{
            //    thecb.SelectedItem = thecb.Items[0];
            //}
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
