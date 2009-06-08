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
    public partial class FeeNoticeAddSelect : System.Web.UI.Page
    {

        #region Variables

        private DataTable _dtGrid;

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {


            this.gridSearchResult.DataSource = BO_Notice.GetCustomerFeeSelectList("") ;

            if (!IsPostBack && !IsCallback)
                this.gridSearchResult.DataBind();
        }


        private void GetPolicyItemDataForGrid()
        {
            

        }


        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //DataTable dt = ((DataTable)ViewState["PolicyItemGridData"]);
            //DataRow row = dt.Rows.Find(e.Keys["ID"]);
            //dt.Rows.Remove(row);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.gridSearchResult.DataBind();
        }

        protected void  btnSubmit_Click(object sender, EventArgs e)
        {
            //List<object> aa = gridSearchResult.GetSelectedFieldValues("PolicyID");
            //for (int i = 0; i < aa.Count; i++)
            //{
            //    String s = (String)aa[i]; 
            //}
        }

        


    }
}
