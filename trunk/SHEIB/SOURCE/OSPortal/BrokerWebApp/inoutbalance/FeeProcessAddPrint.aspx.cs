using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

using System.Configuration;
using Microsoft.Reporting.WebForms;

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
            string sSql = "";
            string conn = ConfigurationManager.ConnectionStrings["broker"].ConnectionString;
            inoutbalance.rpt.dsProcess dFee = new BrokerWebApp.inoutbalance.rpt.dsProcess();

            sSql = "";
            sSql = sSql + "select VoucherID,(Select CarrierNameCn from Carrier where CarrierID=a.CarrierID) CarrierName,b.BranchName,b.BankName,b.BankAccount,";
            sSql = sSql + " (select SUM(Fee) from Fee where VoucherID=a.VoucherID) Fee,";
            sSql = sSql + " (select dbo.MoneyToChinese(SUM(Fee)) from Fee where VoucherID=a.VoucherID) FeeUpper,";
            sSql = sSql + " (select sum(PayProcBase) from VoucherFee where VoucherID=a.VoucherID ) PayProc";
            sSql = sSql + " from Voucher a";
            sSql = sSql + " left join branch b";
            sSql = sSql + " on a.BranchID=b.BranchID";
            sSql = sSql + " where VoucherID ='" + sVoucherID + "'";
            SqlDataAdapter ad = new SqlDataAdapter(sSql, conn);
            ad.Fill(dFee, "Process");

            sSql = "";
            //sSql = sSql + "select PayinInvoiceID+'('+dbo.GetVoucherPolicy('" + sVoucherID + "')+')' PolicyNo,ProcessFeeTypeName,PayinInvoiceFee,Fee";
            //sSql = sSql + " from ";
            //sSql = sSql + " (";
            //sSql = sSql + " select b.PayinInvoiceID,sum(PayinInvoiceFee) PayinInvoiceFee,sum(a.Fee) Fee,max(b.ProcessFeeType) ProcessFeeTypeName";
            //sSql = sSql + " from VoucherFee a";
            //sSql = sSql + " left join PolicyPeriodFee b";
            //sSql = sSql + " on a.PolPeriodID=b.PolPeriodID";
            //sSql = sSql + " where a.VoucherID='" + sVoucherID + "'";
            //sSql = sSql + " group by b.PayinInvoiceID";
            //sSql = sSql + " ) a";
            sSql = sSql + "select a.VoucherID,b.InvoiceNo,a.PolicyNo,a.PolicyID,a.ProcessFeeTypeName,a.Fee";
            sSql = sSql + " from VoucherFee a";
            sSql = sSql + "  left join PolicyPeriodFee b";
            sSql = sSql + "  on a.PolPeriodID=b.PolPeriodID";
            sSql = sSql + "  where VoucherID ='" + sVoucherID + "'";
 
            SqlDataAdapter adDetail = new SqlDataAdapter(sSql, conn);
            adDetail.Fill(dFee, "ProcessDetail");

            ReportViewer1.Visible = true;
            ReportDataSource dsFee = new ReportDataSource("dsProcess_Process", dFee.Tables["Process"]);
            ReportDataSource dsFeeDetail = new ReportDataSource("dsProcess_ProcessDetail", dFee.Tables["ProcessDetail"]);
            //ReportViewer1.LocalReport.ReportPath = "rptNoticeDirect.rdlc";
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(dsFee);
            ReportViewer1.LocalReport.DataSources.Add(dsFeeDetail);
            ReportViewer1.LocalReport.Refresh();
        }

    }
}
