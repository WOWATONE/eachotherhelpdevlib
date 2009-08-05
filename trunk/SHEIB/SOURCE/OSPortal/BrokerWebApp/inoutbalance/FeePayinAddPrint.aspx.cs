using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

using System.Configuration;
using Microsoft.Reporting.WebForms;
using System.Data;

namespace BrokerWebApp.inoutbalance
{
    public partial class FeePayinAddPrint : BasePage
    {
        #region Variables

        private const string inputQueryStringIDKey = "ID";
        private string VoucherID = "";
        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            VoucherID = Page.Request.QueryString[inputQueryStringIDKey];
            printVoucher(VoucherID);
        }

        private void printVoucher(string sVoucherID)
        {
 
            DataSet dsPayin = BusinessObjects.BO_FeePayin.GetFeePayinAddPrint(sVoucherID);

            ReportViewer1.Visible = true;
            ReportDataSource dataSourcePayin = new ReportDataSource("dsPayin_Payin", dsPayin.Tables[0]);
            ReportDataSource dataSourcePayinDetail = new ReportDataSource("dsPayin_PayinDetail", dsPayin.Tables[1]);
            //ReportViewer1.LocalReport.ReportPath = "rptNoticeDirect.rdlc";
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(dataSourcePayin);
            ReportViewer1.LocalReport.DataSources.Add(dataSourcePayinDetail);
            ReportViewer1.LocalReport.Refresh();
        }
    }
}
