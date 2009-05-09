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
using System.Data;

namespace OSPortalWebApp.CustomerRelation
{
    public partial class Customer : System.Web.UI.Page
    {
        #region Variables

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
                this.gridContactItem.DataBind();
        }

        private void GetContactDataForGrid()
        {
            _dtContactGrid = new DataTable();
            _dtContactGrid.PrimaryKey = new DataColumn[] { _dtContactGrid.Columns.Add("ContactID", typeof(String)) };
            _dtContactGrid.Columns.Add("ContactName", typeof(String));
            _dtContactGrid.Columns.Add("CustID", typeof(String));
            _dtContactGrid.Columns.Add("Position", typeof(String));
            _dtContactGrid.Columns.Add("Sex", typeof(String));
            _dtContactGrid.Columns.Add("Tel", typeof(String));
            _dtContactGrid.Columns.Add("Fax", typeof(String));
            _dtContactGrid.Columns.Add("MobilePhone", typeof(String));
            _dtContactGrid.Columns.Add("Email", typeof(String));
            _dtContactGrid.Columns.Add("Interest", typeof(String));
            _dtContactGrid.Columns.Add("Remark", typeof(String));

            _dtContactGrid.Rows.Add(new object[] { "1","张三","1","经理","男","12345678","12345678","13612345678","test@126.com","游泳","无" });
            _dtContactGrid.Rows.Add(new object[] { "2", "王燕", "2", "文员", "女", "12345678", "12345678", "13612345678", "test@126.com", "唱歌", "无" });
        }

        protected void gridContactItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["ContactGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["ContactID"]);
            row["ContactName"] = e.NewValues["ContactName"];
            row["CustID"] = e.NewValues["CustID"];
            row["Position"] = e.NewValues["Position"];
            row["Sex"] = e.NewValues["Sex"];
            row["Tel"] = e.NewValues["Tel"];
            row["Fax"] = e.NewValues["Fax"];
            row["MobilePhone"] = e.NewValues["MobilePhone"];
            row["Email"] = e.NewValues["Email"];
            row["Interest"] = e.NewValues["Interest"];
            row["Remark"] = e.NewValues["Remark"];

            e.Cancel = true;
            this.gridContactItem.CancelEdit();
        }

        protected void gridContactItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridContactItem.DataBind();
        }

        protected void gridContactItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["ContactGridData"]);
            DataRow[] dr = dt.Select("", "ContactID Desc");

            Int32 rowIndex = 1;
            if (dr == null && dr.Length == 0)
            {
                //do nothing;
            }
            else
            {
                rowIndex = Convert.ToInt32(dr[0][0]);
            }
            //Int32 rowIndex = ((DataTable)ViewState["PolicyItemGridData"]).Rows.Count;
            ((DataTable)ViewState["ContactGridData"]).Rows.Add(
                new object[] {
                    rowIndex, 
                    e.NewValues["ContactName"], 
                    e.NewValues["CustID"],

                    e.NewValues["Position"], 
                    e.NewValues["Sex"],
                    e.NewValues["Tel"], 
                    e.NewValues["Fax"],
                    e.NewValues["MobilePhone"], 
                    e.NewValues["Email"],
                    e.NewValues["Interest"], 
                    e.NewValues["Remark"]
                }
                );
            e.Cancel = true;
            this.gridContactItem.CancelEdit();
        }

        protected void gridContactItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridContactItem.DataBind();
        }

        protected void gridContactItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["ContactGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["ContactID"]);
            dt.Rows.Remove(row);
            e.Cancel = true;
            this.gridContactItem.CancelEdit();
        }

        protected void gridContactItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridContactItem.DataBind();
        }
    }
}
