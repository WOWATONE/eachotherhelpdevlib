using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace OSPortalWebApp.accounting
{
    public partial class LifeBrokerageMarkBusiness : System.Web.UI.Page
    {
        #region Variables

        private DataTable _dtGrid;

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            GetPolicyItemDataForGrid();


            this.gridSearchResult.DataSource = _dtGrid;

            if (!IsPostBack && !IsCallback)
                this.gridSearchResult.DataBind();
        }


        private void GetPolicyItemDataForGrid()
        {
            _dtGrid = new DataTable();
            _dtGrid.PrimaryKey = new DataColumn[] { 
            _dtGrid.Columns.Add("Field4", typeof(string)) };

            _dtGrid.Columns.Add("Field1", typeof(string));
            _dtGrid.Columns.Add("Field2", typeof(string));
            _dtGrid.Columns.Add("Field3", typeof(string));

            _dtGrid.Columns.Add("Field5", typeof(string));
            _dtGrid.Columns.Add("Field6", typeof(string));
            _dtGrid.Columns.Add("Field7", typeof(string));
            _dtGrid.Columns.Add("Field8", typeof(string));
            _dtGrid.Columns.Add("Field9", typeof(string));
            _dtGrid.Columns.Add("Field10", typeof(string));
            _dtGrid.Columns.Add("Field11", typeof(string));
            _dtGrid.Columns.Add("Field12", typeof(string));
            _dtGrid.Columns.Add("Field13", typeof(string));
            _dtGrid.Columns.Add("Field14", typeof(string));
            _dtGrid.Columns.Add("Field15", typeof(string));
            _dtGrid.Columns.Add("Field16", typeof(string));

            _dtGrid.Columns.Add("Field17", typeof(string));
            _dtGrid.Columns.Add("Field18", typeof(string));
            _dtGrid.Columns.Add("Field19", typeof(string));
            _dtGrid.Columns.Add("Field20", typeof(string));
            _dtGrid.Columns.Add("Field21", typeof(string));
            _dtGrid.Columns.Add("Field22", typeof(string));
            _dtGrid.Columns.Add("Field23", typeof(string));
            _dtGrid.Columns.Add("Field24", typeof(string));
            _dtGrid.Columns.Add("Field25", typeof(string));

            _dtGrid.Rows.Add(new object[] { 
                "财险", 
                "01",
                "01",
                "01",
                "平安",
                "王怡",
                "王怡",
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1).ToString(),
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1).ToString(),
                "财险1",
                "2000",
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1).ToString(),
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1).ToString(),
                "宝钢",
                "王海",
                "0.02",
                "400",
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1).ToString(),
                "F-001",
                "200",
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1).ToString(),
                "协作单位",
                "500",
                "现金",
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1).ToString()
                
            });

        }


        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //DataTable dt = ((DataTable)ViewState["PolicyItemGridData"]);
            //DataRow row = dt.Rows.Find(e.Keys["ID"]);
            //dt.Rows.Remove(row);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }



    }
}
