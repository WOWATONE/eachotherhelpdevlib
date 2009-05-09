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
using System.IO;
using DevExpress.Web.ASPxUploadControl;


namespace OSPortalWebApp.vehicleinsurance
{
    public partial class CarPolicyItemInput : System.Web.UI.Page
    {

        #region Variables

        private DataTable _dtGridPolicyItem;
               

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


        }


        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();

        }

        protected void gridPolicyItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        protected void gridPolicyItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        protected void gridPolicyItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
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
            _dtGridPolicyItem.Columns.Add("CarPolicyItemID", typeof(String)) };

            _dtGridPolicyItem.Columns.Add("CarPolicyItemName", typeof(String));

            _dtGridPolicyItem.Columns.Add("Coverage", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("Premium", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("Memo", typeof(String));

            
            _dtGridPolicyItem.Rows.Add(new object[] { 
                "1", "T001", 1000, 1000, "备注1"
            });

            _dtGridPolicyItem.Rows.Add(new object[] { 
                "2", "S001", 2000, 2000, "备注2"
            });

            _dtGridPolicyItem.Rows.Add(new object[] { 
                "3", "S002", 3000, 3000, "备注3"
            });

        }



    }
}
