using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;


namespace BrokerWebApp.inoutbalance
{
    public partial class FeeNoticeAdd : System.Web.UI.Page
    {
        #region Variables

        private DataTable _dtGrid;

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.Initialization();
            }
        }

        private void Initialization()
        {

            DataSet list;

            //收费类型
            list = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.GatheringType.ToString());
            if (list.Tables[0] != null)
            {
                foreach (DataRow row in list.Tables[0].Rows)
                {
                    this.ddlFeeType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }
            ddlFeeType.SelectedIndex = 0;
            deNoticeDate.Date = DateTime.Today;

            gridPolicyItem.DataSource = BO_Notice.GetNoticePolicyList("TZSBH");
            gridPolicyItem.DataBind();
        }


        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //DataTable dt = ((DataTable)ViewState["PolicyItemGridData"]);
            //DataRow row = dt.Rows.Find(e.Keys["ID"]);
            //row["Code"] = e.NewValues["Code"];
            //row["Caption"] = e.NewValues["Caption"];
            //row["Premium"] = e.NewValues["Premium"];
            //row["Rate"] = e.NewValues["Rate"];
            //row["Fee"] = e.NewValues["Fee"];
            //row["ProcessRate"] = e.NewValues["ProcessRate"];
            //row["ProcessFee"] = e.NewValues["ProcessFee"];

            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();

        }

        protected void gridPolicyItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        protected void gridPolicyItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //DataTable dt = ((DataTable)ViewState["PolicyItemGridData"]);
            //DataRow[] dr = dt.Select("", "ID Desc");

            //Int32 rowIndex = 1;
            //if (dr == null && dr.Length == 0)
            //{
            //    //do nothing;
            //}
            //else
            //{
            //    rowIndex = Convert.ToInt32(dr[0][0]);
            //}
            ////Int32 rowIndex = ((DataTable)ViewState["PolicyItemGridData"]).Rows.Count;
            //((DataTable)ViewState["PolicyItemGridData"]).Rows.Add(
            //    new object[] {
            //        rowIndex, 
            //        e.NewValues["Code"], 
            //        e.NewValues["Caption"], 
            //        e.NewValues["Premium"],
            //        e.NewValues["Rate"],
            //        e.NewValues["Fee"],
            //        e.NewValues["ProcessRate"],
            //        e.NewValues["ProcessFee"]
            //    }
            //    );
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        protected void gridPolicyItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //DataTable dt = ((DataTable)ViewState["PolicyItemGridData"]);
            //DataRow row = dt.Rows.Find(e.Keys["ID"]);
            //dt.Rows.Remove(row);
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
            _dtGrid.Columns.Add("PolicyID", typeof(Guid)) };

            _dtGrid.Columns.Add("PolicyNo", typeof(String));
            _dtGrid.Columns.Add("CustomerID", typeof(String));
            _dtGrid.Columns.Add("AccountTypeID", typeof(String));

            _dtGrid.Columns.Add("Fee", typeof(Decimal));

            

            _dtGrid.Rows.Add(new object[] { Guid.NewGuid(), "PA0001", "王怡", "2001-01-01", 1000 });
            _dtGrid.Rows.Add(new object[] { Guid.NewGuid(), "PA0003", "王怡", "2001-01-01", 2000 });
            _dtGrid.Rows.Add(new object[] { Guid.NewGuid(), "PA0002", "王怡", "2001-01-01", 3000 });


        }
        


    }
}
