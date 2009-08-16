using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data;
using BusinessObjects;
using DevExpress.Web.ASPxEditors;

namespace BrokerWebApp.BudgetManagement
{
    public partial class SignPremiumBudgetRpt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    this.Initialization();
                }

                if (this.Page.IsCallback)
                {
                    this.BindGrid();
                }
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 初始化控件
        /// </summary>
        private void Initialization()
        {
            this.dxeddlDeptID.DataSource = BusinessObjects.BO_P_Department.FetchList();
            this.dxeddlDeptID.TextField = "DeptName";
            this.dxeddlDeptID.ValueField = "DeptID";
            this.dxeddlDeptID.DataBind();
            this.dxeddlDeptID.Items.Insert(0, new ListEditItem("(全部)", ""));

            //this.dxeddlSalesID.DataSource = BusinessObjects.BO_P_User.FetchList();
            //this.dxeddlSalesID.TextField = "UserNameCn";
            //this.dxeddlSalesID.ValueField = "UserID";
            //this.dxeddlSalesID.DataBind();


        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.BindGrid();
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int signPremiumBudgetID = Convert.ToInt32(e.Keys["SignPremiumBudgetID"]);
            BusinessObjects.Budget.BO_SignPremiumBudget.Delete(signPremiumBudgetID);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
            this.BindGrid();
        }

        protected void gridSearchResult_CustomCallBack(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            //                       
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.BindGrid();
        }

        /// <summary>
        /// 填充数据
        /// </summary>
        private void BindGrid()
        {
            string sNy = "";
            string sDeptID = "";
            string sSalesID = "";

            if (this.dxetxtNY.Text.Trim().Length > 0)
                sNy = dxetxtNY.Text.Trim();
            if (this.dxeddlDeptID.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlDeptID.SelectedItem.Value.ToString()))
            {
                sDeptID = dxeddlDeptID.SelectedItem.Value.ToString();
            }
            if (this.dxeddlSalesID.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSalesID.SelectedItem.Value.ToString()))
            {
                sSalesID = dxeddlSalesID.SelectedItem.Value.ToString();
            }


            DataTable dt = BusinessObjects.Budget.BO_SignPremiumBudget.RptSignPremiumBudget(sNy,sDeptID,sSalesID).Tables[0];
            this.gridSearchResult.DataSource = dt;
            this.gridSearchResult.DataBind();

            gridSearchResult.GroupBy(gridSearchResult.Columns["DeptName"], 0);
            gridSearchResult.GroupBy(gridSearchResult.Columns["SalesName"], 1);
            gridSearchResult.Columns["DeptName"].Visible = false;
            gridSearchResult.Columns["SalesName"].Visible = false;

        }

        protected void dxeddlSalesIDCallback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(e.Parameter);
            thecb.TextField = "UserNameCn";
            thecb.ValueField = "UserID";
            thecb.DataBind();
            thecb.Items.Insert(0, new ListEditItem("(全部)", ""));
        }
    }
}
