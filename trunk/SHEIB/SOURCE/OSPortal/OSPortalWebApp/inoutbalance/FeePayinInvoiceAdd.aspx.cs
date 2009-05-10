using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OSPortalWebApp.inoutbalance
{
    public partial class FeePayinInvoiceAdd : System.Web.UI.Page
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
            _dtGrid = new DataTable();
            _dtGrid.PrimaryKey = new DataColumn[] { 
            _dtGrid.Columns.Add("PolicyNo", typeof(Int32)) };

            _dtGrid.Columns.Add("StandardFeeBase", typeof(Double));
            _dtGrid.Columns.Add("GotFeeBase", typeof(Double));
            _dtGrid.Columns.Add("GettingFeeBase", typeof(Double));

            _dtGrid.Columns.Add("StandardProcessFeeBase", typeof(Double));
            _dtGrid.Columns.Add("GotProcessFee", typeof(Double));
            _dtGrid.Columns.Add("GettingProcessFee", typeof(Double));


            _dtGrid.Columns.Add("CustomerID", typeof(String));
            _dtGrid.Columns.Add("ProdTypeID", typeof(String));
            _dtGrid.Columns.Add("CarrierId", typeof(String));
            _dtGrid.Columns.Add("BranchId", typeof(String));


            _dtGrid.Rows.Add(new object[] { "0001", 1000, 1000, 1000, 500, 500, 500, "王怡", "寿险", "平安", "平安上海" });


            _dtGrid.Rows.Add(new object[] { "0002", 2000, 2000, 2000, 500, 500, 500, "王怡", "寿险", "平安", "平安上海" });


        }



    }
}
