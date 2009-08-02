using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BrokerWebApp.popupselectrefs
{
    public partial class PolicyCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void gridSearchResult_DataBinding(object sender, EventArgs e)
        {
            //
        }

        protected void gridSearchResult_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            //FindControl("");
            //
        }

        protected void gridSearchResult_PageIndexChanged(object sender, EventArgs e)
        {
            //this.gridSearchResult.PageIndex;
            //this.gridSearchResult.VisibleRowCount;
            //this.gridSearchResult.VisibleStartIndex;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string lsWhere = "";
            if (this.dxetxtPolicyID.Text.Trim().Length > 0)
                lsWhere = " And C.CustName like '%" + this.dxetxtPolicyID.Text.Trim() + "%' ";

            Parameter pt;
            pt = this.DataSource.SelectParameters[0];
            pt.DefaultValue = lsWhere;

            this.gridSearchResult.DataBind();
        }

    }
}
