using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace BrokerWebApp.inoutbalance
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

            _dtGrid.Columns.Add("NoticeNo", typeof(Int32));
            _dtGrid.Columns.Add("FeeTypeId", typeof(Int32));
            _dtGrid.Columns.Add("FeeTypeName", typeof(String));
            _dtGrid.Columns.Add("Customer", typeof(String));
            _dtGrid.Columns.Add("Sale", typeof(String));
            _dtGrid.Columns.Add("Fee", typeof(double));

            _dtGrid.Columns.Add("NoticeDate", typeof(DateTime));


            _dtGrid.Rows.Add(new object[] { 
                Guid.NewGuid(), 
                1,
                1,
                "直付", 
                "投保客户",
                "客户经理",
                2000,
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1)
            });

            _dtGrid.Rows.Add(new object[] { 
                Guid.NewGuid(), 
                2,
                2,
                "代收", 
                "投保客户",
                "客户经理",                
                2000,
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1)
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
