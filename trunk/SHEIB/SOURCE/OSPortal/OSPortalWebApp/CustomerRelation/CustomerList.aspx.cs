using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OSPortalWebApp.CustomerRelation
{
    public partial class CustomerList : System.Web.UI.Page
    {
        #region Variables

        private DataTable _dtGrid;

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["GridData"] == null)
            {
                GetCustomerDataForGrid();
                ViewState["GridData"] = _dtGrid;
            }

            this.gridSearchResult.DataSource = ViewState["GridData"];

            if (!IsPostBack && !IsCallback)
                this.gridSearchResult.DataBind();
        }

        private void GetCustomerDataForGrid()
        {
            _dtGrid = new DataTable();
            _dtGrid.PrimaryKey = new DataColumn[] { _dtGrid.Columns.Add("CustNo", typeof(String)) };
            _dtGrid.Columns.Add("CustName", typeof(String));
            _dtGrid.Columns.Add("Area", typeof(String));
            _dtGrid.Columns.Add("Plate", typeof(String));
            _dtGrid.Columns.Add("Address", typeof(String));
            _dtGrid.Columns.Add("PostCode", typeof(String));
            _dtGrid.Columns.Add("TradeType", typeof(String));
            _dtGrid.Columns.Add("IDNO", typeof(String));
            _dtGrid.Columns.Add("Contact", typeof(String));
            _dtGrid.Columns.Add("Tel", typeof(String));
            _dtGrid.Columns.Add("Mobile", typeof(String));
            _dtGrid.Columns.Add("Fax", typeof(String));
            _dtGrid.Columns.Add("Email", typeof(String));
            _dtGrid.Columns.Add("Sales", typeof(String));

            _dtGrid.Rows.Add(new object[] { "C00000045", "广州王老吉药业股份有限公司", "北京市", "", "wwwwww", "201100", "金融证卷", 
                "111111111111111", "李先生", "0755-2985478", "", "0755-2985478", "ripu@vip.sina.com", "王强" });
            _dtGrid.Rows.Add(new object[] { "C00000046", "深圳日普科技有限公司", "上海市", "", "wwwwww", "201100", "政府机关", 
                "111111111111111", "李先生", "0755-2985478", "", "0755-2985478", "ripu@vip.sina.com", "王强" });
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
