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

namespace OSPortalWebApp.BudgetManagement
{
    public partial class SignPremiumBudgetSummary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SignPremiumBudgetSummaryReport report = new SignPremiumBudgetSummaryReport();
            this.CrystalReportViewer1.ReportSource = report;
            this.CrystalReportViewer1.DataBind();
        }
    }
}
