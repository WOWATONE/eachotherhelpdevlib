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
                
        private string theID;

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.Page.IsPostBack)
            {                
                deNoticeDate.Date = DateTime.Today;
                this.dxetxtNoticeNo.Text = Page.Request.QueryString[inputQueryStringIDKey];
            }
            else
            {
                //do nothing;
            }

            this.Initialization();

            if (!IsPostBack && !IsCallback)
            {
                BindGrid("");
            }

        }

        private void BindGrid(String otherWhere)
        {

            String lsNoticeID = this.dxetxtNoticeNo.Text;
            lsNoticeID = lsNoticeID + otherWhere;
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

            
        }
        

        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();

        }

        protected void gridPolicyItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //this.gridPolicyItem.DataBind();
        }

        protected void gridPolicyItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //this.gridPolicyItem.DataBind();
        }

        protected void gridPolicyItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        

    }
}
