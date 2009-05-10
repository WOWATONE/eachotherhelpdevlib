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
    public partial class ClaimMaterial : System.Web.UI.Page
    {
        /// <summary>
        /// 理赔所需资料
        /// </summary>
        private DataTable _dtMaterialGrid;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["MaterialGridData"] == null)
            {
                GetMaterialDataForGrid();
                ViewState["MaterialGridData"] = _dtMaterialGrid;
            }
            this.gridMaterial.DataSource = ViewState["MaterialGridData"];

            if (!IsPostBack && !IsCallback)
            {
                this.gridMaterial.DataBind();
            }
        }

        private void GetMaterialDataForGrid()
        {
            _dtMaterialGrid = new DataTable();
            _dtMaterialGrid.PrimaryKey = new DataColumn[] { _dtMaterialGrid.Columns.Add("ID", typeof(String)) };
            _dtMaterialGrid.Columns.Add("Material", typeof(String));
            _dtMaterialGrid.Columns.Add("MaterialStatus", typeof(String));

            _dtMaterialGrid.Rows.Add(new object[] { "1","索赔通知书","已提供"});
            _dtMaterialGrid.Rows.Add(new object[] { "2", "替他材料", "未提供" });
        }

        protected void gridMaterial_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["MaterialGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["ID"]);
            row["Material"] = e.NewValues["Material"];
            row["MaterialStatus"] = e.NewValues["MaterialStatus"];

            e.Cancel = true;
            this.gridMaterial.CancelEdit();
        }

        protected void gridMaterial_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridMaterial.DataBind();
        }

        protected void gridMaterial_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["MaterialGridData"]);
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
            ((DataTable)ViewState["MaterialGridData"]).Rows.Add(
                new object[] {
                    rowIndex, 
                    e.NewValues["Material"], 
                    e.NewValues["MaterialStatus"]
                }
                );
            e.Cancel = true;
            this.gridMaterial.CancelEdit();
        }

        protected void gridMaterial_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridMaterial.DataBind();
        }

        protected void gridMaterial_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["MaterialGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["ID"]);
            dt.Rows.Remove(row);
            e.Cancel = true;
            this.gridMaterial.CancelEdit();
        }

        protected void gridMaterial_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridMaterial.DataBind();
        }
    }
}
