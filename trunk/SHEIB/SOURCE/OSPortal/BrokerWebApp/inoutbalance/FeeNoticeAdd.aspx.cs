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

        private const string inputQueryStringIDKey = "NoticeNo";
        
        private DataTable _dtGrid;

        private string theID;

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                //theID = this..Value;
            }
            else
            {
                //theID = Page.Request.QueryString[inputQueryStringIDKey];
                //if (string.IsNullOrEmpty(theID))
                //    theID = BusinessObjects.TranUtils.GetInvoiceID();
                
            }

            if (!this.Page.IsPostBack)
            {
                this.Initialization();
                BindGrid();
            }

        }



        private void BindGrid()
        {
            string lsNoticeID = "TZSBH";

            DataTable dt = BO_Notice.GetFeeNoticeAddList(lsNoticeID).Tables[0];
            this.gridPolicyItem.DataSource = dt;
            this.gridPolicyItem.DataBind();

        }


        private void Initialization()
        {

            DataSet dsList;

            //收费类型
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.GatheringType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlGatheringType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }

            deNoticeDate.Date = DateTime.Today;
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



    }
}
