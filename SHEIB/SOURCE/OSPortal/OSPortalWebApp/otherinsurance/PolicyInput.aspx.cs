using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxHtmlEditor;
using DevExpress.Web.ASPxEditors;

namespace OSPortalWebApp.otherinsurance
{
    public partial class PolicyInput : System.Web.UI.Page
    {
        #region Variables

        private DataTable _dtGridPolicyItem;

        private DataTable _dtGridCarrier;

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            //GridPolicyItem
            if (ViewState["GridPolicyItem"] == null)
            {
                GetPolicyItemDataForGrid();
                ViewState["GridPolicyItem"] = _dtGridPolicyItem;
            }

            this.gridPolicyItem.DataSource = ViewState["GridPolicyItem"];

            if (!IsPostBack && !IsCallback)
                this.gridPolicyItem.DataBind();



            //GridCarrier
            if (ViewState["GridCarrier"] == null)
            {
                GetCarrierDataForGrid();
                ViewState["GridCarrier"] = _dtGridCarrier;
            }

            this.gridCarrier.DataSource = ViewState["GridCarrier"];

            if (!IsPostBack && !IsCallback)
                this.gridCarrier.DataBind();

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //  
        }

        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            DataTable dt = _dtGridPolicyItem;
            DataRow row = dt.Rows.Find(e.Keys["ItemID"]);
            //
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            TextBox txtGridItemID = tblEditorTemplate.FindControl("txtGridItemID") as TextBox;
            
            ASPxComboBox decbGridProdID = tblEditorTemplate.FindControl("decbGridProdID") as ASPxComboBox;
            row["ProdID"] = decbGridProdID.SelectedItem.Text;//ddlGridProdID.SelectedValue;

            ASPxTextBox detxtGridProdName = tblEditorTemplate.FindControl("detxtGridProdName") as ASPxTextBox;
            row["ProdName"] = detxtGridProdName.Text;

            TextBox txtGridCoverage = tblEditorTemplate.FindControl("txtGridCoverage") as TextBox;
            row["Coverage"] = txtGridCoverage.Text;

            TextBox txtGridPremium = tblEditorTemplate.FindControl("txtGridPremium") as TextBox;
            row["Premium"] = txtGridPremium.Text;

            TextBox txtGridProcRate = tblEditorTemplate.FindControl("txtGridProcRate") as TextBox;
            row["ProcRate"] = txtGridProcRate.Text;

            TextBox txtGridProcess = tblEditorTemplate.FindControl("txtGridProcess") as TextBox;
            row["Process"] = txtGridProcess.Text;
            
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
            
        }

        protected void gridPolicyItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        protected void gridPolicyItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            DataTable dt = _dtGridPolicyItem;
            DataRow[] dr = dt.Select("", "ItemID Desc");
            
            Int32 rowIndex = 1;
            if (dr == null && dr.Length == 0)
            {
                //do nothing;
            }
            else
            {
                rowIndex = Convert.ToInt32(dr[0][0]);
            }
            //Int32 rowIndex = _dtGrid.Rows.Count;
            rowIndex += 1;

            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            TextBox txtGridItemID = tblEditorTemplate.FindControl("txtGridItemID") as TextBox;

            ASPxComboBox decbGridProdID = tblEditorTemplate.FindControl("decbGridProdID") as ASPxComboBox;
            string theProdID = decbGridProdID.SelectedItem.Text;//ddlGridProdID.SelectedValue;

            ASPxTextBox detxtGridProdName = tblEditorTemplate.FindControl("detxtGridProdName") as ASPxTextBox;
            string theProdName = detxtGridProdName.Text;

            TextBox txtGridCoverage = tblEditorTemplate.FindControl("txtGridCoverage") as TextBox;
            string theCoverage = txtGridCoverage.Text;

            TextBox txtGridPremium = tblEditorTemplate.FindControl("txtGridPremium") as TextBox;
            string thePremium = txtGridPremium.Text;

            TextBox txtGridProcRate = tblEditorTemplate.FindControl("txtGridProcRate") as TextBox;
            string theProcRate = txtGridProcRate.Text;

            TextBox txtGridProcess = tblEditorTemplate.FindControl("txtGridProcess") as TextBox;
            string theProcess = txtGridProcess.Text;

            _dtGridPolicyItem.Rows.Add(
                new object[] {
                    rowIndex, 
                    theProdID, 
                    theProdName, 
                    theCoverage,
                    thePremium,
                    theProcRate,
                    theProcess
                }
                );
            _dtGridPolicyItem.AcceptChanges();
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridPolicyItem.DataBind();           
        }

        protected void gridPolicyItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DataTable dt = _dtGridPolicyItem;
            DataRow row = dt.Rows.Find(e.Keys["ItemID"]);
            if (row != null)
            {
                dt.Rows.Remove(row);
                _dtGridPolicyItem.AcceptChanges();
            }
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        private void GetPolicyItemDataForGrid()
        {
            _dtGridPolicyItem = new DataTable();
            _dtGridPolicyItem.PrimaryKey = new DataColumn[] { 
            _dtGridPolicyItem.Columns.Add("ItemID", typeof(string)) };

            _dtGridPolicyItem.Columns.Add("ProdID", typeof(String));
            _dtGridPolicyItem.Columns.Add("ProdName", typeof(String));

            _dtGridPolicyItem.Columns.Add("Coverage", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("Premium", typeof(Decimal));

            _dtGridPolicyItem.Columns.Add("ProcRate", typeof(Double));
            _dtGridPolicyItem.Columns.Add("Process", typeof(Decimal));


            _dtGridPolicyItem.Rows.Add(new object[] { 1, "Prod1", "Prod1", 1000, 800, 0.01, 10 });

            DataRow dr = _dtGridPolicyItem.NewRow();
            dr[0] = 2;
            dr[1] = "Prod2";
            dr[2] = "Prod2";
            dr[3] = 2000;
            dr[4] = 1800;
            dr[5] = 0.02;
            dr[6] = 20;
            _dtGridPolicyItem.Rows.Add(dr);

            _dtGridPolicyItem.Rows.Add(new object[] { 3, "Prod3", "Prod3", 3000, 2700, 0.03, 30 });

            
        }




        protected void gridCarrier_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            //
        }

        protected void gridCarrier_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridCarrier.CancelEdit();

        }

        protected void gridCarrier_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridCarrier.DataBind();
        }

        protected void gridCarrier_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridCarrier.CancelEdit();
        }

        protected void gridCarrier_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridCarrier.DataBind();
        }

        protected void gridCarrier_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridCarrier.CancelEdit();
        }

        protected void gridCarrier_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridCarrier.DataBind();
        }

        private void GetCarrierDataForGrid()
        {
            _dtGridCarrier = new DataTable();
            _dtGridCarrier.PrimaryKey = new DataColumn[] { 
            _dtGridCarrier.Columns.Add("CarrierNo", typeof(string)) };

            _dtGridCarrier.Columns.Add("CarrierNameCn", typeof(String));
            _dtGridCarrier.Columns.Add("BranchNo", typeof(String));
            _dtGridCarrier.Columns.Add("BranchName", typeof(String));

            _dtGridCarrier.Columns.Add("ShareRate", typeof(Decimal));
            _dtGridCarrier.Columns.Add("CarrierSales", typeof(String));


            _dtGridCarrier.Rows.Add(new object[] { "1", "中国平安", "01", "上海平安", 24, "李明" });

            _dtGridCarrier.Rows.Add(new object[] { "2", "中国泰康", "01", "上海泰康", 26, "王兵" });

            _dtGridCarrier.Rows.Add(new object[] { "3", "中国安联", "01", "上海安联", 50, "王兵" });

        }
        


    }
}
