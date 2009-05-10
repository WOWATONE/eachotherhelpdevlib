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

namespace OSPortalWebApp.ProductSetup
{
    public partial class DataDictionary : System.Web.UI.Page
    {
        #region Variables
        /// <summary>
        /// 代码类型
        /// </summary>
        private DataTable _dtCodeTypeGrid;
        /// <summary>
        /// 代码表
        /// </summary>
        private DataTable _dtCodeGrid;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["CodeTypeGridData"] == null)
            {
                GetCodeTypeDataForGrid();
                ViewState["CodeTypeGridData"] = _dtCodeTypeGrid;
            }
            this.gridCodeTypeItem.DataSource = ViewState["CodeTypeGridData"];

            if (ViewState["CodeGridData"] == null)
            {
                GetCodeDataForGrid();
                ViewState["CodeGridData"] = _dtCodeGrid;
            }
            this.gridCodeItem.DataSource = ViewState["CodeGridData"];


            if (!IsPostBack && !IsCallback)
            {
                this.gridCodeTypeItem.DataBind();
                this.gridCodeItem.DataBind();
            }
        }

        #region 代码类型
        private void GetCodeTypeDataForGrid()
        {
            _dtCodeTypeGrid = new DataTable();
            _dtCodeTypeGrid.PrimaryKey = new DataColumn[] { _dtCodeTypeGrid.Columns.Add("CodeTypeID", typeof(String)) };
            _dtCodeTypeGrid.Columns.Add("Name", typeof(String));

            _dtCodeTypeGrid.Rows.Add(new object[] { "Province", "省市" });
            _dtCodeTypeGrid.Rows.Add(new object[] { "Currency", "币种" });
        }

        protected void gridCodeTypeItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["CodeTypeGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["CodeTypeID"]);
            row["Name"] = e.NewValues["Name"];

            e.Cancel = true;
            this.gridCodeTypeItem.CancelEdit();
        }

        protected void gridCodeTypeItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridCodeTypeItem.DataBind();
        }

        protected void gridCodeTypeItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ((DataTable)ViewState["CodeTypeGridData"]).Rows.Add(
                new object[] {
                    e.NewValues["CodeTypeID"], 
                    e.NewValues["Name"]
                }
                );
            e.Cancel = true;
            this.gridCodeTypeItem.CancelEdit();
        }

        protected void gridCodeTypeItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridCodeTypeItem.DataBind();
        }

        protected void gridCodeTypeItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["CodeTypeGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["CodeTypeID"]);
            dt.Rows.Remove(row);
            e.Cancel = true;
            this.gridCodeTypeItem.CancelEdit();
        }

        protected void gridCodeTypeItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridCodeTypeItem.DataBind();
        }
        #endregion

        #region 代码表
        private void GetCodeDataForGrid()
        {
            _dtCodeGrid = new DataTable();
            _dtCodeGrid.PrimaryKey = new DataColumn[] { _dtCodeGrid.Columns.Add("ID", typeof(String)) };
            _dtCodeGrid.Columns.Add("CodeTypeID", typeof(String));
            _dtCodeGrid.Columns.Add("CodeID", typeof(String));
            _dtCodeGrid.Columns.Add("CodeName", typeof(String));
            _dtCodeGrid.Columns.Add("SortNo", typeof(Int32));
            _dtCodeGrid.Columns.Add("Content1", typeof(String));
            _dtCodeGrid.Columns.Add("Content2", typeof(String));
            _dtCodeGrid.Columns.Add("Content3", typeof(String));

            _dtCodeGrid.Rows.Add(new object[] { "1", "Province", "1", "北京", 1, "", "", "" });
            _dtCodeGrid.Rows.Add(new object[] { "2", "Province", "2", "上海", 2, "", "", "" });
            _dtCodeGrid.Rows.Add(new object[] { "3", "Province", "3", "天津", 3, "", "", "" });
        }

        protected void gridCodeItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["CodeGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["ID"]);
            row["CodeTypeID"] = e.NewValues["CodeTypeID"];
            row["CodeID"] = e.NewValues["CodeID"];
            row["CodeName"] = e.NewValues["CodeName"];
            row["SortNo"] = e.NewValues["SortNo"];
            row["Content1"] = e.NewValues["Content1"];
            row["Content2"] = e.NewValues["Content2"];
            row["Content3"] = e.NewValues["Content3"];

            e.Cancel = true;
            this.gridCodeItem.CancelEdit();
        }

        protected void gridCodeItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridCodeItem.DataBind();
        }

        protected void gridCodeItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["CodeGridData"]);
            DataRow[] dr = dt.Select("", "ID Desc");

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
            ((DataTable)ViewState["CodeGridData"]).Rows.Add(
                new object[] {
                    rowIndex, 
                    e.NewValues["CodeTypeID"], 
                    e.NewValues["CodeID"],
                    e.NewValues["CodeName"], 
                    e.NewValues["SortNo"],
                    e.NewValues["Content1"], 
                    e.NewValues["Content2"],
                    e.NewValues["Content3"]
                }
                );
            e.Cancel = true;
            this.gridCodeItem.CancelEdit();
        }

        protected void gridCodeItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridCodeItem.DataBind();
        }

        protected void gridCodeItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["CodeGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["ID"]);
            dt.Rows.Remove(row);
            e.Cancel = true;
            this.gridCodeItem.CancelEdit();
        }

        protected void gridCodeItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridCodeItem.DataBind();
        }
        #endregion
    }
}
