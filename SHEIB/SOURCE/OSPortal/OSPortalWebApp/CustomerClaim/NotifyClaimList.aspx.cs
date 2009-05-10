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

namespace OSPortalWebApp.CustomerClaim
{
    public partial class NotifyClaimList : System.Web.UI.Page
    {
        #region Variables

        private DataTable _dtGrid;

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["GridData"] == null)
            {
                GetNotifyDataForGrid();
                ViewState["GridData"] = _dtGrid;
            }

            this.gridSearchResult.DataSource = ViewState["GridData"];

            if (!IsPostBack && !IsCallback)
                this.gridSearchResult.DataBind();
        }

        private void GetNotifyDataForGrid()
        {
            _dtGrid = new DataTable();
            _dtGrid.PrimaryKey = new DataColumn[] { _dtGrid.Columns.Add("NotifyID", typeof(String)) };
            _dtGrid.Columns.Add("PolicyNo", typeof(String));
            _dtGrid.Columns.Add("NotifySerialNo", typeof(String));
            _dtGrid.Columns.Add("NotifyTime", typeof(DateTime));
            _dtGrid.Columns.Add("AccidentTime", typeof(DateTime));
            _dtGrid.Columns.Add("NotifyPerson", typeof(String));
            _dtGrid.Columns.Add("NotifyLossFee", typeof(Double));
            _dtGrid.Columns.Add("ContactPerson", typeof(String));
            _dtGrid.Columns.Add("NotifyType", typeof(String));
            _dtGrid.Columns.Add("NotifyNo", typeof(String));
            _dtGrid.Columns.Add("PerambulateTime", typeof(DateTime));
            _dtGrid.Columns.Add("CaseEndTime", typeof(DateTime));
            _dtGrid.Columns.Add("LastPayFee", typeof(Double));
            _dtGrid.Columns.Add("AcquitFee", typeof(Double));
            _dtGrid.Columns.Add("CreatePerson", typeof(String));
            _dtGrid.Columns.Add("CreateDate", typeof(DateTime));

            _dtGrid.Rows.Add(new object[] { "pa2006", "POL200506001", "001", DateTime.Today, DateTime.Today, "张三", 1000, "王燕", "电话", "B001", DateTime.Today, DateTime.Today, 1000, 0, "刘强", DateTime.Today });
            _dtGrid.Rows.Add(new object[] { "pa2007", "POL200506002", "002", DateTime.Today, DateTime.Today, "张三", 1000, "王燕", "电话", "B002", DateTime.Today, DateTime.Today, 1000, 0, "刘强", DateTime.Today });
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
