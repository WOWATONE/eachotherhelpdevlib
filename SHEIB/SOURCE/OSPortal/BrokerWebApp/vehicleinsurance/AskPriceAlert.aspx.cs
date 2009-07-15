using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxEditors;
using System.IO;
using DevExpress.Web.ASPxUploadControl;


namespace BrokerWebApp.vehicleinsurance
{
    public partial class AskPriceAlert : BasePage
    {
        #region Variables

        private DataTable _dtGridPolicyItem;
        private DataTable _dtGridCarrier;
        
        private DataTable _dtGridPeriod;

        private const string UploadDirectory = "~/UploadControl/UploadImages/";
        private const int ThumbnailSize = 100;

        //enctype="multipart/form-data">

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




        protected void Page_PreRender(object sender, EventArgs e)
        {
            //  
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
            _dtGridPolicyItem.Columns.Add("CarPolicyID", typeof(String)) };

            _dtGridPolicyItem.Columns.Add("CarNo", typeof(String));

            _dtGridPolicyItem.Columns.Add("CiPremium", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("CiProcessRate", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("CiProcess", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("AciPremium", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("AciProcessRate", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("AciProcess", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("CstPremium", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("CstProcessRate", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("CstProcess", typeof(Decimal));


            _dtGridPolicyItem.Rows.Add(new object[] { "1", "T001", 1000, 0.03, 30, 1000, 0.03, 30, 1000, 0.03, 30 });

            _dtGridPolicyItem.Rows.Add(new object[] { "2", "S001", 2000, 0.03, 30, 2000, 0.03, 30, 2000, 0.03, 30 });

            _dtGridPolicyItem.Rows.Add(new object[] { "3", "S002", 3000, 0.03, 30, 3000, 0.03, 30, 3000, 0.03, 30 });


        }


        
    }
}
