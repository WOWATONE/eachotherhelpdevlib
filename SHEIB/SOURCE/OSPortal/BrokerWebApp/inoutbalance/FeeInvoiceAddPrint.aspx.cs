﻿using System;
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
    public partial class FeeInvoiceAddPrint : BasePage
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
            DataSet dseInvoice = BusinessObjects.Bo_FeeInvoice.GetFeeInvoiceAddPrint(sVoucherID);

            ReportViewer1.Visible = true;
            ReportDataSource dsFee = new ReportDataSource("dsInvoice_Invoice", dseInvoice.Tables[0]);
            ReportDataSource dsFeeDetail = new ReportDataSource("dsInvoice_InvoiceDetail", dseInvoice.Tables[1]);
            //ReportViewer1.LocalReport.ReportPath = "rptNoticeDirect.rdlc";
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(dsFee);
            ReportViewer1.LocalReport.DataSources.Add(dsFeeDetail);
            ReportViewer1.LocalReport.Refresh();
        }

    }
}
