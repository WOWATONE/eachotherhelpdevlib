using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OSPortalWebApp.vehicleinsurance
{
    public partial class vforminput : System.Web.UI.Page
    {
        #region Variables

        public bool DisplaySelectInsurance
        {
            get;
            set;
        }

        private DataTable _dtGrid;
        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack || Page.IsCallback)
            {
                DisplaySelectInsurance = false;
            }
            else
            {
                DisplaySelectInsurance = true;
            }

            if (ViewState["PolicyItemGridData"] == null)
            {
                GetPolicyItemDataForGrid();
                ViewState["PolicyItemGridData"] = _dtGrid;
            }

            this.gridPolicyItem.DataSource = ViewState["PolicyItemGridData"];

            if (!IsPostBack && !IsCallback)
                this.gridPolicyItem.DataBind();

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //  
        }

        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["PolicyItemGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["ID"]);
            row["Code"] = e.NewValues["Code"];
            row["Caption"] = e.NewValues["Caption"];
            row["Premium"] = e.NewValues["Premium"];
            row["Rate"] = e.NewValues["Rate"];
            row["Fee"] = e.NewValues["Fee"];
            row["ProcessRate"] = e.NewValues["ProcessRate"];
            row["ProcessFee"] = e.NewValues["ProcessFee"];

            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();

        }

        protected void gridPolicyItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        protected void gridPolicyItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["PolicyItemGridData"]);
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
            ((DataTable)ViewState["PolicyItemGridData"]).Rows.Add(
                new object[] {
                    rowIndex, 
                    e.NewValues["Code"], 
                    e.NewValues["Caption"], 
                    e.NewValues["Premium"],
                    e.NewValues["Rate"],
                    e.NewValues["Fee"],
                    e.NewValues["ProcessRate"],
                    e.NewValues["ProcessFee"]
                }
                );
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        protected void gridPolicyItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["PolicyItemGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["ID"]);
            dt.Rows.Remove(row);
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        private void GetPolicyItemDataForGrid()
        {
            _dtGrid = new DataTable();
            _dtGrid.PrimaryKey = new DataColumn[] { 
            _dtGrid.Columns.Add("ID", typeof(Int32)) };

            _dtGrid.Columns.Add("Code", typeof(String));
            _dtGrid.Columns.Add("Caption", typeof(String));

            _dtGrid.Columns.Add("Premium", typeof(Decimal));

            _dtGrid.Columns.Add("Rate", typeof(Double));
            _dtGrid.Columns.Add("Fee", typeof(Double));
            _dtGrid.Columns.Add("ProcessRate", typeof(Double));
            _dtGrid.Columns.Add("ProcessFee", typeof(Double));


            _dtGrid.Rows.Add(new object[] { 1, "Code1", "Caption1", 1000, 0.03, 30, 0.01, 10 });

            DataRow dr = _dtGrid.NewRow();
            dr[0] = 2;
            dr[1] = "Code2";
            dr[2] = "Caption2";
            dr[3] = 2000;
            dr[4] = 0.03;
            dr[5] = 60;
            dr[6] = 0.01;
            dr[7] = 20;
            _dtGrid.Rows.Add(dr);

            _dtGrid.Rows.Add(new object[] { 3, "Code3", "Caption3", 3000, 0.03, 90, 0.01, 30 });


        }

    }
}
