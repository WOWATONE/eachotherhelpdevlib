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
 
    public partial class PolicyList : BasePage
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

                if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.Policy_Search_Group))
                {
                    dxeddlDeptID.Value = this.CurrentUser.DeptID;                    
                    dxeddlDeptID.ClientEnabled = false;
                }
                if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.Policy_Search_Personal))
                {
                    dxeddlDeptID.Value = this.CurrentUser.DeptID;
                    dxeddlSalesId.Value = this.CurrentUser.UserID;

                    dxeddlDeptID.ClientEnabled = false;
                    dxeddlSalesId.ClientEnabled = false;
                }
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

            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.Policy_Search_Group))
            {
                dxeddlSalesId.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(this.CurrentUser.DeptID);
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
                lsWhere = lsWhere + " and exists (select 1 from PolicyCarrier where policyid=a.PolicyID and CarrierID ='" + dxeddlCarrierId.SelectedItem.Value.ToString() + "')";
            }

            if (this.dxeddlBranchId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlBranchId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and exists (select 1 from PolicyCarrier where PolicyID=a.PolicyID and BranchID ='" + dxeddlBranchId.SelectedItem.Value.ToString() + "')";
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

            DataTable dt = BusinessObjects.Policy.BO_Policy.GetPolicyList(lsWhere).Tables[0];
            this.gridSearchResult.DataSource = dt;

            //经过DataView筛选name 字段不重复的数据
            //DataView dv = new DataView(dt);
            //string[] strComuns = { "PolicyID" };
            //DataTable dtPolicyID = dv.ToTable(true, strComuns);
            //Session["PolicyCount"] = dtPolicyID.Rows.Count;

            this.gridSearchResult.DataBind();


        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }


        protected void gridSearchResult_CustomSummaryCalculate(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
        //    if (e.SummaryProcess == DevExpress.Data.CustomSummaryProcess.Finalize) {
        //        ASPxSummaryItem si = (ASPxSummaryItem)e.Item;
        //        if (si.FieldName == "PolicyID")
        //        {

        //            if (e.IsTotalSummary) {
        //                if (Session["PolicyCount"] != null)
        //                {
        //                    e.TotalValue = int.Parse(Session["PolicyCount"].ToString());
        //                }
        //            }
        //            if (e.IsGroupSummary) {

        //            }

        //        }
        //    }
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
