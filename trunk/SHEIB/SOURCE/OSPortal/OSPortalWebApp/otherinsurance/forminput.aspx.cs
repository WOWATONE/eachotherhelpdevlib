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
            //System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("zh-CN");
            //System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("zh-CHS"); 
            //DevExpress.Web.ASPxGridView.Localization.ASPxGridViewLocalizer.Active = new DevExpress.LocalizationCHS.DevExpressWebASPxGridViewLocalizationCHS();         
        }
        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //
        }

        protected void gridPolicyItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //
        }

        protected void gridPolicyItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //
        }

        private void loadPolicyItems()
        {
            
            //System.Data.DataTable _dt = new System.Data.DataTable();
            //_dt.Columns.Add(new System.Data.DataColumn("ID", typeof(System.Int32)));
            //_dt.Columns.Add(new System.Data.DataColumn("Code", typeof(System.String)));
            //_dt.Columns.Add(new System.Data.DataColumn("Caption", typeof(System.String)));
            //_dt.Columns.Add(new System.Data.DataColumn("Premium", typeof(System.Decimal)));
            //_dt.Columns.Add(new System.Data.DataColumn("Rate", typeof(System.Single)));
            //_dt.Columns.Add(new System.Data.DataColumn("Fee", typeof(System.Double)));
            //_dt.Columns.Add(new System.Data.DataColumn("ProcessRate", typeof(System.Single)));
            //_dt.Columns.Add(new System.Data.DataColumn("ProcessFee", typeof(System.Double)));
            //System.Data.DataRow dr = _dt.NewRow();
            //dr[0] = 1;
            //dr[1] = "C1";
            //dr[2] = "Cap";
            //dr[3] = 1000;
            //dr[4] = 0.03;
            //dr[5] = 30;
            //dr[6] = 0.02;
            //dr[7] = 20;
            //_dt.Rows.Add(dr);
            //this.gridPolicyItem.DataSource = _dt;
            //this.gridPolicyItem.DataBind();
        }

    }
}
