using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace OSPortalWebApp.BusinessConsult
{
    public partial class BusinessConsultList : System.Web.UI.Page
    {
        #region Variables

        private DataTable _dtGrid;

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["GridData"] == null)
            {
                GetPolicyItemDataForGrid();
                ViewState["GridData"] = _dtGrid;
            }

            this.gridSearchResult.DataSource = ViewState["GridData"];

            if (!IsPostBack && !IsCallback)
                this.gridSearchResult.DataBind();
        }

        private void GetPolicyItemDataForGrid()
        {
            _dtGrid = new DataTable();
            _dtGrid.PrimaryKey = new DataColumn[] { _dtGrid.Columns.Add("ConsultNO", typeof(Int32)) };

            _dtGrid.Columns.Add("ConsultDate", typeof(DateTime));
            _dtGrid.Columns.Add("Sales", typeof(String));
            _dtGrid.Columns.Add("CustName", typeof(String));
            _dtGrid.Columns.Add("LinkMan", typeof(String));
            _dtGrid.Columns.Add("ContactType", typeof(String));
            _dtGrid.Columns.Add("TotalConsultFee", typeof(Double));
            _dtGrid.Columns.Add("InvoiceNO", typeof(String));
            _dtGrid.Columns.Add("CreatePerson", typeof(String));

            _dtGrid.Rows.Add(new object[] { 1, DateTime.Today, "张三", "李四", "王五", "手机", 13456.6, "0123456789", "严军" });
            _dtGrid.Rows.Add(new object[] { 2, DateTime.Today, "张三", "李四", "王五", "电话", 345534, "0123456789", "严军" });
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
