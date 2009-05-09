using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OSPortalWebApp.inoutbalance
{
    public partial class FeeCustomer : System.Web.UI.Page
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
            _dtGrid.Columns.Add("NoticeNo", typeof(String));
            _dtGrid.Columns.Add("CreateTime", typeof(DateTime));

            _dtGrid.Columns.Add("FeeType", typeof(String));
            _dtGrid.Columns.Add("CurCode", typeof(String));
            _dtGrid.Columns.Add("Fee", typeof(Double));
            _dtGrid.Columns.Add("FeeBase", typeof(Double));
            _dtGrid.Columns.Add("FeeAdjust", typeof(Double));
            _dtGrid.Columns.Add("AccountType", typeof(String));

            _dtGrid.Columns.Add("SerialNo", typeof(String));
            _dtGrid.Columns.Add("PolicyNo", typeof(String));
            _dtGrid.Columns.Add("CustomerID", typeof(String));
            _dtGrid.Columns.Add("Customer", typeof(String));
            _dtGrid.Columns.Add("SalesId", typeof(String));
            _dtGrid.Columns.Add("Sales", typeof(String));
            _dtGrid.Columns.Add("Audited", typeof(String));
            _dtGrid.Columns.Add("CreatePerson", typeof(String));
            _dtGrid.Columns.Add("CarrierId", typeof(String));
            _dtGrid.Columns.Add("CarrierNameCn", typeof(String));
            _dtGrid.Columns.Add("BranchId", typeof(String));
            _dtGrid.Columns.Add("BranchName", typeof(String));
            _dtGrid.Columns.Add("ProdTypeID", typeof(String));
            _dtGrid.Columns.Add("ProdTypeName", typeof(String));
            _dtGrid.Columns.Add("FeeRemark", typeof(String));
            

            _dtGrid.Rows.Add(new object[] { 
                Guid.NewGuid(), 
                "1",
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1),
                "直付",                
                "人民币",
                1000,
                1000,
                10,
                "现金",
                "Sn001",
                "PN001",
                "C001",
                "王怡",
                "S001",
                "王海",
                "已审核",
                "王海",
                "CM001",
                "平安",
                "CB001",
                "上海",
                "P001",
                "寿险",
                "备注"
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
