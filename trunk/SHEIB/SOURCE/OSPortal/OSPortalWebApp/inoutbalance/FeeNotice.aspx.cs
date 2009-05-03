using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace OSPortalWebApp.inoutbalance
{
    public partial class FeeNotice : System.Web.UI.Page
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
            _dtGrid.Columns.Add("NoticeId", typeof(Guid)) };

            _dtGrid.Columns.Add("CollectNoticeNo", typeof(Int32));
            _dtGrid.Columns.Add("DirectlyNoticeNo", typeof(Int32));
            _dtGrid.Columns.Add("CustomerID", typeof(string));
            _dtGrid.Columns.Add("ProdTypeID", typeof(string));
            _dtGrid.Columns.Add("Fee", typeof(double));

            _dtGrid.Columns.Add("NoticeDate", typeof(DateTime));


            _dtGrid.Rows.Add(new object[] { 
                Guid.NewGuid(), 
                1,
                1,
                "王怡",
                "财险1",
                2000,
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1)
            });

            DataRow dr = _dtGrid.NewRow();
            dr[0] = Guid.NewGuid();
            dr[1] = 2;
            dr[2] = 2;
            dr[3] = "王怡";
            dr[4] = "财险2";
            dr[5] = 3000;
            dr[6] = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 1, 1, 1);
            
            _dtGrid.Rows.Add(dr);

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
