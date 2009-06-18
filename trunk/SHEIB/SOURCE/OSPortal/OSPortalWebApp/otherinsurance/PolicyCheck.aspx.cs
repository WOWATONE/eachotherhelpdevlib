﻿using System;
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

namespace OSPortalWebApp.otherinsurance
{
    public partial class PolicyCheck : System.Web.UI.Page
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



            //GridCarrier
            if (ViewState["GridCarrier"] == null)
            {
                GetCarrierDataForGrid();
                ViewState["GridCarrier"] = _dtGridCarrier;
            }

            this.gridCarrier.DataSource = ViewState["GridCarrier"];

            if (!IsPostBack && !IsCallback)
                this.gridCarrier.DataBind();


            //GridPeriod
            if (ViewState["GridPeriod"] == null)
            {
                GetPeriodDataForGrid();
                ViewState["GridPeriod"] = _dtGridPeriod;
            }

            this.gridPeriod.DataSource = ViewState["GridPeriod"];

            if (!IsPostBack && !IsCallback)
                this.gridPeriod.DataBind();

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
            _dtGridPolicyItem.Columns.Add("ItemID", typeof(string)) };

            _dtGridPolicyItem.Columns.Add("ProdID", typeof(String));
            _dtGridPolicyItem.Columns.Add("ProdName", typeof(String));

            _dtGridPolicyItem.Columns.Add("Coverage", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("PremiumRate", typeof(Double));
            _dtGridPolicyItem.Columns.Add("Premium", typeof(Decimal));

            _dtGridPolicyItem.Columns.Add("ProcRate", typeof(Double));
            _dtGridPolicyItem.Columns.Add("Process", typeof(Decimal));


            _dtGridPolicyItem.Rows.Add(new object[] { 1, "Prod1", "Prod1", 1000, 0.01, 800, 0.01, 10 });
                    
            _dtGridPolicyItem.Rows.Add(new object[] { 3, "Prod3", "Prod3", 3000, 0.01, 2700, 0.03, 30 });


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
            _dtGridCarrier.Columns.Add("CarrierID", typeof(Guid)) };

            _dtGridCarrier.Columns.Add("CarrierNo", typeof(String));
            _dtGridCarrier.Columns.Add("CarrierNameCn", typeof(String));
            _dtGridCarrier.Columns.Add("BranchID", typeof(String));
            _dtGridCarrier.Columns.Add("BranchName", typeof(String));

            _dtGridCarrier.Columns.Add("PolicyRate", typeof(Decimal));
            _dtGridCarrier.Columns.Add("Premium", typeof(Decimal));
            _dtGridCarrier.Columns.Add("ProcessRate", typeof(Decimal));
            _dtGridCarrier.Columns.Add("Process", typeof(Decimal));
            _dtGridCarrier.Columns.Add("Poundage", typeof(Decimal));
            _dtGridCarrier.Columns.Add("Tax", typeof(Decimal));

            _dtGridCarrier.Rows.Add(new object[] { Guid.NewGuid(), "1", "中国平安", "01", "上海平安", 24, 3000, 0.2, 60, 50, 40 });

            _dtGridCarrier.Rows.Add(new object[] { Guid.NewGuid(), "2", "中国泰康", "01", "上海泰康", 26, 4000, 0.1, 40, 30, 20 });

            _dtGridCarrier.Rows.Add(new object[] { Guid.NewGuid(), "3", "中国安联", "01", "上海安联", 50, 5000, 0.3, 150, 100, 80 });

        }





        protected void gridPeriod_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            //
        }
        protected void gridPeriod_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridPeriod.CancelEdit();

        }

        protected void gridPeriod_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridPeriod.DataBind();
        }

        protected void gridPeriod_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridPeriod.CancelEdit();
        }

        protected void gridPeriod_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridPeriod.DataBind();
        }

        protected void gridPeriod_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridPeriod.CancelEdit();
        }

        protected void gridPeriod_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridPeriod.DataBind();
        }

        private void GetPeriodDataForGrid()
        {
            _dtGridPeriod = new DataTable();
            _dtGridPeriod.PrimaryKey = new DataColumn[] { 
            _dtGridPeriod.Columns.Add("PolPeriodId", typeof(Guid)) };

            _dtGridPeriod.Columns.Add("Period", typeof(Int32));
            _dtGridPeriod.Columns.Add("CarrierID", typeof(Guid));
            _dtGridPeriod.Columns.Add("CarrierNameCn", typeof(String));
            _dtGridPeriod.Columns.Add("BranchID", typeof(Guid));
            _dtGridPeriod.Columns.Add("BranchName", typeof(String));

            _dtGridPeriod.Columns.Add("PayDate", typeof(DateTime));
            _dtGridPeriod.Columns.Add("PayFeeBase", typeof(Decimal));
            _dtGridPeriod.Columns.Add("PayProcBase", typeof(Decimal));

            _dtGridPeriod.Rows.Add(new object[] { Guid.NewGuid(), 1, Guid.NewGuid(), "中国平安", Guid.NewGuid(), "上海平安", DateTime.Now, 3000, 50 });

        }







    }
}