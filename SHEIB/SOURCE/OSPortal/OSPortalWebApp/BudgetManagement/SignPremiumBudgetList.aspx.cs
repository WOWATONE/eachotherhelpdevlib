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

namespace OSPortalWebApp.BudgetManagement
{
    public partial class SignPremiumBudgetList : System.Web.UI.Page
    {
        #region Variables

        private DataTable _dtGrid;

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["GridData"] == null)
            {
                GetDataForGrid();
                ViewState["GridData"] = _dtGrid;
            }

            this.gridSearchResult.DataSource = ViewState["GridData"];

            if (!IsPostBack && !IsCallback)
                this.gridSearchResult.DataBind();
        }

        private void GetDataForGrid()
        {
            _dtGrid = new DataTable();
            _dtGrid.PrimaryKey = new DataColumn[] { _dtGrid.Columns.Add("SignPremiumBudgetID", typeof(String)) };
            _dtGrid.Columns.Add("Sales", typeof(String));
            _dtGrid.Columns.Add("CustName", typeof(String));
            _dtGrid.Columns.Add("ProdType", typeof(String));
            _dtGrid.Columns.Add("OperationType", typeof(String));
            _dtGrid.Columns.Add("YN", typeof(String));
            _dtGrid.Columns.Add("PremiumBudget", typeof(Double));
            _dtGrid.Columns.Add("ProcessBudget", typeof(Double));

            _dtGrid.Rows.Add(new object[] { "1", "张三", "广州王老吉药业股份有限公司", "人寿保险", "续保", "200906", 10000, 1000 });
            _dtGrid.Rows.Add(new object[] { "2", "李四", "深圳日普科技有限公司", "企业财产保险", "新增", "200907", 50000, 2000 });
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
