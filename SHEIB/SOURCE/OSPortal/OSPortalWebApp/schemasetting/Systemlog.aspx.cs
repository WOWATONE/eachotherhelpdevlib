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

namespace OSPortalWebApp.schemasetting
{
    public partial class Systemlog : System.Web.UI.Page
    {
        #region Variables
        /// <summary>
        /// 联系人
        /// </summary>
        private DataTable _dtSystemLogGrid;
        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["SystemLogGridData"] == null)
            {
                GetSystemLogDataForGrid();
                ViewState["SystemLogGridData"] = _dtSystemLogGrid;
            }
            this.gridSystemLogItem.DataSource = ViewState["SystemLogGridData"];

            if (!IsPostBack && !IsCallback)
            {
                this.gridSystemLogItem.DataBind();
            }
        }

        private void GetSystemLogDataForGrid()
        {
            _dtSystemLogGrid = new DataTable();
            _dtSystemLogGrid.PrimaryKey = new DataColumn[] { _dtSystemLogGrid.Columns.Add("LogID", typeof(String)) };
            _dtSystemLogGrid.Columns.Add("UserName", typeof(String));
            _dtSystemLogGrid.Columns.Add("IpAddress", typeof(String));
            _dtSystemLogGrid.Columns.Add("OpTime", typeof(DateTime));
            _dtSystemLogGrid.Columns.Add("OpContent", typeof(String));

            _dtSystemLogGrid.Rows.Add(new object[] { "1", "张军", "172.16.144.78", DateTime.Now, "登录系统" });
            _dtSystemLogGrid.Rows.Add(new object[] { "2", "王燕", "172.16.144.79", DateTime.Now, "登记客户资料" });
        }
    }
}
