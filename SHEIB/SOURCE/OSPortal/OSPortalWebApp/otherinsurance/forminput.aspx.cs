using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OSPortalWebApp.otherinsurance
{
    public partial class forminput : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadPolicyItems();
            if (!IsPostBack && !IsCallback)
            {
                //gridPolicyItem.StartEdit(0);
            }
        }
        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //e.NewValues["Notes"] = GetMemoText();
        }
        protected void gridPolicyItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //e.NewValues["Notes"] = GetMemoText();
        }

        private void loadPolicyItems()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            dt.Columns.Add(new System.Data.DataColumn("ID", typeof(System.Int32)));
            dt.Columns.Add(new System.Data.DataColumn("Code", typeof(System.String)));
            dt.Columns.Add(new System.Data.DataColumn("Caption", typeof(System.String)));
            dt.Columns.Add(new System.Data.DataColumn("Premium", typeof(System.Decimal)));
            dt.Columns.Add(new System.Data.DataColumn("Rate", typeof(System.Single)));
            dt.Columns.Add(new System.Data.DataColumn("Fee", typeof(System.Double)));
            dt.Columns.Add(new System.Data.DataColumn("ProcessRate", typeof(System.Single)));
            dt.Columns.Add(new System.Data.DataColumn("ProcessFee", typeof(System.Double)));
            System.Data.DataRow dr =  dt.NewRow();
            dr.ItemArray[0] = 1;
            dr.ItemArray[1] = "C1";
            dr.ItemArray[2] = "Cap";
            dr.ItemArray[3] = 1000;
            dr.ItemArray[4] = 0.03;
            dr.ItemArray[5] = 30;
            dr.ItemArray[6] = 0.02;
            dr.ItemArray[7] = 20;
            dt.Rows.Add(dr);
            this.gridPolicyItem.DataSource = dt;
            this.gridPolicyItem.DataBind();
        }

    }
}
