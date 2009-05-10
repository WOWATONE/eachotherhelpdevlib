using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OSPortalWebApp.CustomerRelation
{
    public partial class CustContact : System.Web.UI.Page
    {
        #region Variables
        /// <summary>
        /// 联系人
        /// </summary>
        private DataTable _dtContactGrid;
        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["ContactGridData"] == null)
            {
                GetContactDataForGrid();
                ViewState["ContactGridData"] = _dtContactGrid;
            }
            this.gridContactItem.DataSource = ViewState["ContactGridData"];

            if (!IsPostBack && !IsCallback)
            {
                this.gridContactItem.DataBind();
            }
        }

        private void GetContactDataForGrid()
        {
            _dtContactGrid = new DataTable();
            _dtContactGrid.PrimaryKey = new DataColumn[] { _dtContactGrid.Columns.Add("ContactID", typeof(String)) };
            _dtContactGrid.Columns.Add("ContactName", typeof(String));
            _dtContactGrid.Columns.Add("Sex", typeof(String));
            _dtContactGrid.Columns.Add("CustName", typeof(String));
            _dtContactGrid.Columns.Add("Position", typeof(String));
            _dtContactGrid.Columns.Add("Tel", typeof(String));
            _dtContactGrid.Columns.Add("Fax", typeof(String));
            _dtContactGrid.Columns.Add("MobilePhone", typeof(String));
            _dtContactGrid.Columns.Add("Email", typeof(String));
            _dtContactGrid.Columns.Add("Sales", typeof(String));

            _dtContactGrid.Rows.Add(new object[] { "1", "张军", "男", "广州王老吉药业股份有限公司", "经理", "12345678", "12345678", "13612345678", "test@126.com","张三" });
            _dtContactGrid.Rows.Add(new object[] { "2", "王燕", "女", "深圳日普科技有限公司", "文员", "12345678", "12345678", "13612345678", "test@126.com", "李四" });
        }
    }
}
