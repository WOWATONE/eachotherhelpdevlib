using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OSPortalWebApp.inoutbalance
{
    public partial class FeePayinInvoice : System.Web.UI.Page
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
            _dtGrid.Columns.Add("FeeId", typeof(Guid)) };

            _dtGrid.Columns.Add("FeeType", typeof(string));
            _dtGrid.Columns.Add("CurCode", typeof(string));
            _dtGrid.Columns.Add("Fee", typeof(double));
            _dtGrid.Columns.Add("FeeBase", typeof(double));
            _dtGrid.Columns.Add("FeeAdjust", typeof(double));
            _dtGrid.Columns.Add("AccountType", typeof(string));

            _dtGrid.Columns.Add("FeeYJF", typeof(double));
            _dtGrid.Columns.Add("FeeBCSF", typeof(double));
            _dtGrid.Columns.Add("FeeBCJF", typeof(double));
            _dtGrid.Columns.Add("ProcessSS", typeof(double));

            _dtGrid.Columns.Add("SerialNo", typeof(string));
            _dtGrid.Columns.Add("Audited", typeof(string));
            _dtGrid.Columns.Add("CreatePerson", typeof(string));
            _dtGrid.Columns.Add("FeeRemark", typeof(string));
            _dtGrid.Columns.Add("CreateTime", typeof(DateTime));
            _dtGrid.Columns.Add("NoticeID", typeof(string));
            _dtGrid.Columns.Add("F1", typeof(String));
            _dtGrid.Columns.Add("F2", typeof(String));
            _dtGrid.Columns.Add("F3", typeof(String));
            _dtGrid.Columns.Add("F4", typeof(String));
            
            _dtGrid.Rows.Add(new object[] { 
                Guid.NewGuid(), 
                "现金",
                "人民币",
                1000,
                1000,
                10,
                "代收",
                1000,
                1000,
                1000,
                50,
                "Sn001",                
                "已审核",
                "王海",
                "备注",
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1),
                "1",
                "FP0001",
                "保险公司",
                "分支机构",
                "代收"
                
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
