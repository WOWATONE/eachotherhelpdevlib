using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

namespace OSPortalWebApp.otherinsurance
{
    public partial class PolicyInput : System.Web.UI.Page
    {
        #region Variables

        
        private DataTable _dtGrid;
        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            GetPolicyItemDataForGrid();
            
            this.gridPolicyItem.DataSource = _dtGrid;

            if (!IsPostBack && !IsCallback)
                this.gridPolicyItem.DataBind();
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //  
        }

        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            DataTable dt = _dtGrid;
            DataRow row = dt.Rows.Find(e.Keys["ItemID"]);

            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            TextBox txtGridItemID = tblEditorTemplate.FindControl("txtGridItemID") as TextBox;
            
            DropDownList ddlGridProdID = tblEditorTemplate.FindControl("ddlGridProdID") as DropDownList;
            row["ProdID"] = ddlGridProdID.SelectedItem.Text;//ddlGridProdID.SelectedValue;

            TextBox txtGridProdName = tblEditorTemplate.FindControl("txtGridProdName") as TextBox;
            row["ProdName"] = txtGridProdName.Text;

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
            DataTable dt = _dtGrid;
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

            DropDownList ddlGridProdID = tblEditorTemplate.FindControl("ddlGridProdID") as DropDownList;
            string theProdID = ddlGridProdID.SelectedItem.Text;//ddlGridProdID.SelectedValue;

            TextBox txtGridProdName = tblEditorTemplate.FindControl("txtGridProdName") as TextBox;
            string theProdName = txtGridProdName.Text;

            TextBox txtGridCoverage = tblEditorTemplate.FindControl("txtGridCoverage") as TextBox;
            string theCoverage = txtGridCoverage.Text;

            TextBox txtGridPremium = tblEditorTemplate.FindControl("txtGridPremium") as TextBox;
            string thePremium = txtGridPremium.Text;

            TextBox txtGridProcRate = tblEditorTemplate.FindControl("txtGridProcRate") as TextBox;
            string theProcRate = txtGridProcRate.Text;

            TextBox txtGridProcess = tblEditorTemplate.FindControl("txtGridProcess") as TextBox;
            string theProcess = txtGridProcess.Text;
            
            _dtGrid.Rows.Add(
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
            _dtGrid.AcceptChanges();
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridPolicyItem.DataBind();           
        }

        protected void gridPolicyItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DataTable dt = _dtGrid;
            DataRow row = dt.Rows.Find(e.Keys["ItemID"]);
            if (row != null)
            {
                dt.Rows.Remove(row);
                _dtGrid.AcceptChanges();
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
            _dtGrid = new DataTable();
            _dtGrid.PrimaryKey = new DataColumn[] { 
            _dtGrid.Columns.Add("ItemID", typeof(string)) };

            _dtGrid.Columns.Add("ProdID", typeof(String));
            _dtGrid.Columns.Add("ProdName", typeof(String));

            _dtGrid.Columns.Add("Coverage", typeof(Decimal));
            _dtGrid.Columns.Add("Premium", typeof(Decimal));

            _dtGrid.Columns.Add("ProcRate", typeof(Double));
            _dtGrid.Columns.Add("Process", typeof(Decimal));


            _dtGrid.Rows.Add(new object[] { 1, "Prod1", "Prod1", 1000, 800, 0.01, 10 });

            DataRow dr = _dtGrid.NewRow();
            dr[0] = 2;
            dr[1] = "Prod2";
            dr[2] = "Prod2";
            dr[3] = 2000;
            dr[4] = 1800;
            dr[5] = 0.02;
            dr[6] = 20;
            _dtGrid.Rows.Add(dr);

            _dtGrid.Rows.Add(new object[] { 3, "Prod3", "Prod3", 3000, 2700, 0.03, 30 });

            
        }
        
    }
}
