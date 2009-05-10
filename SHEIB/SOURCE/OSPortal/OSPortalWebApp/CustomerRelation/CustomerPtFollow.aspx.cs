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

namespace OSPortalWebApp.CustomerRelation
{
    public partial class CustomerPtFollow : System.Web.UI.Page
    {
        #region Variables
        /// <summary>
        /// 销售跟进
        /// </summary>
        private DataTable _dtCustomerPtGrid;
        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["CustomerPtGridData"] == null)
            {
                GetCustomerPtForGrid();
                ViewState["CustomerPtGridData"] = _dtCustomerPtGrid;
            }
            this.gridCustomerPtItem.DataSource = ViewState["CustomerPtGridData"];

            if (!IsPostBack && !IsCallback)
            {
                this.gridCustomerPtItem.DataBind();
            }
        }

        private void GetCustomerPtForGrid()
        {
            _dtCustomerPtGrid = new DataTable();
            _dtCustomerPtGrid.PrimaryKey = new DataColumn[] { _dtCustomerPtGrid.Columns.Add("FollowID", typeof(String)) };
            _dtCustomerPtGrid.Columns.Add("FollowDate", typeof(DateTime));
            _dtCustomerPtGrid.Columns.Add("CustName", typeof(String));
            _dtCustomerPtGrid.Columns.Add("FollowType", typeof(String));
            _dtCustomerPtGrid.Columns.Add("Sales", typeof(String));
            _dtCustomerPtGrid.Columns.Add("FollowMemo", typeof(String));

            _dtCustomerPtGrid.Rows.Add(new object[] { "1", DateTime.Today, "和记黄浦", "电话", "张三", "商量有关险种的问题！" });
            _dtCustomerPtGrid.Rows.Add(new object[] { "2", DateTime.Today, "大亚湾核电站", "面谈", "李四", "简单的了解的这方面的情况！" });
        }
    }
}
