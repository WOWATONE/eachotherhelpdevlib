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
    public partial class FeeProcessAddPrint : BasePage
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
            DataSet dsProcess = BusinessObjects.BO_FeeProcess.GetFeeProcessAddPrint(sVoucherID);

            ReportViewer1.Visible = true;
            ReportDataSource dsFee = new ReportDataSource("dsProcess_Process", dsProcess.Tables[0]);
            ReportDataSource dsFeeDetail = new ReportDataSource("dsProcess_ProcessDetail", dsProcess.Tables[1]);
            //ReportViewer1.LocalReport.ReportPath = "rptNoticeDirect.rdlc";
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(dsFee);
            ReportViewer1.LocalReport.DataSources.Add(dsFeeDetail);
            ReportViewer1.LocalReport.Refresh();
        }

    }
}
