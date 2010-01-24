using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using BusinessObjects;

namespace BrokerWebApp.Report
{

    public partial class PremiumReceivablePeriodReportSum : BasePage
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
            if (Page.IsCallback)
            {
                BindGrid();
            }
        }



        private void CheckPermission()
        {
            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.ReceivablePremiumReport_Personal))
            {
                dxeddlDeptID.Value = this.CurrentUser.DeptID;
                dxeddlSalesId.Value = this.CurrentUser.UserID;

                dxeddlDeptID.ClientEnabled = false;
                dxeddlSalesId.ClientEnabled = false;
            }
            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.ReceivablePremiumReport_Group))
            {
                dxeddlDeptID.Value = this.CurrentUser.DeptID;
                dxeddlDeptID.ClientEnabled = false;

                dxeddlSalesId.Value = this.CurrentUser.UserID;
                dxeddlSalesId.ClientEnabled = true;
            }

            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.ReceivablePremiumReport_All))
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


            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.ReceivablePremiumReport_Group))
            {
                dxeddlSalesId.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(this.CurrentUser.DeptID);
            }
            else if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.ReceivablePremiumReport_All))
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
            
            if (this.dxeddlDeptID.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlDeptID.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.DeptId ='" + dxeddlDeptID.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlSalesId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSalesId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.SalesId ='" + dxeddlSalesId.SelectedItem.Value.ToString() + "'";
            }

           

            DataTable dt =  BO_Report.GetPremiumReceivablePeriodReportSum(lsWhere).Tables[0];
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
