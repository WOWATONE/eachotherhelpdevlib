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
    public partial class BusinessConsult : System.Web.UI.Page
    {
        #region Variables
        /// <summary>
        /// 咨询费
        /// </summary>
        private DataTable _dtConsultFeeGrid;
        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["ConsultFeeGridData"] == null)
            {
                GetConsultFeeDataForGrid();
                ViewState["ConsultFeeGridData"] = _dtConsultFeeGrid;
            }
            this.gridConsultFeeItem.DataSource = ViewState["ConsultFeeGridData"];

            if (!IsPostBack && !IsCallback)
            {
                this.gridConsultFeeItem.DataBind();
            }
        }

        private void GetConsultFeeDataForGrid()
        {
            _dtConsultFeeGrid = new DataTable();
            _dtConsultFeeGrid.PrimaryKey = new DataColumn[] { _dtConsultFeeGrid.Columns.Add("ConsultFeeID", typeof(String)) };
            _dtConsultFeeGrid.Columns.Add("Product", typeof(String));
            _dtConsultFeeGrid.Columns.Add("ConsultFee", typeof(Double));

            _dtConsultFeeGrid.Rows.Add(new object[] { "1", "项目A", 1000 });
            _dtConsultFeeGrid.Rows.Add(new object[] { "2", "项目B", 2000 });
        }

        protected void gridConsultFeeItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["ConsultFeeGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["ConsultFeeID"]);
            row["Product"] = e.NewValues["Product"];
            row["ConsultFee"] = e.NewValues["ConsultFee"];

            e.Cancel = true;
            this.gridConsultFeeItem.CancelEdit();

        }

        protected void gridConsultFeeItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridConsultFeeItem.DataBind();
        }

        protected void gridConsultFeeItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["ConsultFeeGridData"]);
            DataRow[] dr = dt.Select("", "ConsultFeeID Desc");

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
            ((DataTable)ViewState["ConsultFeeGridData"]).Rows.Add(
                new object[] {
                    rowIndex, 
                    e.NewValues["Product"], 
                    e.NewValues["ConsultFee"]
                }
                );
            e.Cancel = true;
            this.gridConsultFeeItem.CancelEdit();
        }

        protected void gridConsultFeeItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridConsultFeeItem.DataBind();
        }

        protected void gridConsultFeeItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["ConsultFeeGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["ConsultFeeID"]);
            dt.Rows.Remove(row);
            e.Cancel = true;
            this.gridConsultFeeItem.CancelEdit();
        }

        protected void gridConsultFeeItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridConsultFeeItem.DataBind();
        }
    }
}
