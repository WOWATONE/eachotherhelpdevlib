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
            string sSql = "";
            string conn = ConfigurationManager.ConnectionStrings["broker"].ConnectionString;
            inoutbalance.rpt.dsFeePayinInvoice dFee = new BrokerWebApp.inoutbalance.rpt.dsFeePayinInvoice();

            sSql = sSql + "select VoucherID,(Select CarrierNameCn from Carrier where CarrierID=a.CarrierID) CarrierName,b.BranchName,b.BankName,b.BankAccount,";
            sSql = sSql + "(select SUM(Fee) from Fee where VoucherID=a.VoucherID) PayinFee,";
            sSql = sSql + "(select dbo.MoneyToChinese(SUM(Fee)) from Fee where VoucherID=a.VoucherID) PayinFeeUpper,";
            sSql = sSql + "(select sum(Fee) from VoucherFee where VoucherID=a.VoucherID ) PayProc,";
            sSql = sSql + " dbo.GetYYYYMMDDChinese(a.FeeDate) FeeDate";
            sSql = sSql + " from Voucher a";
            sSql = sSql + " left join branch b";
            sSql = sSql + " on a.BranchID=b.BranchID";
            sSql = sSql + " where VoucherID='" + sVoucherID + "'";
            SqlDataAdapter ad = new SqlDataAdapter(sSql, conn);
            ad.Fill(dFee, "PayinInvoice");

            sSql = "";
            //sSql = sSql + "select PayinID+'('+dbo.GetVoucherPolicyByPayinID('" + sVoucherID + "',PayinID)+')' PolicyNo,ProcessFeeTypeName,Fee";
            //sSql = sSql + " from ";
            //sSql = sSql + " (";
            //sSql = sSql + " select b.PayinID,sum(a.Fee) Fee,max(b.ProcessFeeType) ProcessFeeTypeName";
            //sSql = sSql + " from VoucherFee a";
            //sSql = sSql + " left join PolicyPeriodFee b";
            //sSql = sSql + " on a.PolPeriodID=b.PolPeriodID";
            //sSql = sSql + " where a.VoucherID='" + sVoucherID + "'";
            //sSql = sSql + " group by b.PayinID";
            //sSql = sSql + " ) a";

            sSql = sSql + "select a.VoucherID,b.PayinID,c.PolicyNo,b.PolicyID,(select ProcessFeeTypeName from ProcessFeeType where ProcessFeeTypeID=b.ProcessFeeType) ProcessFeeTypeName,a.Fee";
            sSql = sSql + " from VoucherFee a";
            sSql = sSql + " left join PolicyPeriod b";
            sSql = sSql + " on a.PolPeriodID=b.PolPeriodID";
            sSql = sSql + " left join Policy c";
            sSql = sSql + " on b.PolicyID=c.PolicyID";
            sSql = sSql + " where VoucherID='" + sVoucherID + "'";
            SqlDataAdapter adDetail = new SqlDataAdapter(sSql, conn);
            adDetail.Fill(dFee, "PayinInvoiceDetail");

            ReportViewer1.Visible = true;
            ReportDataSource dsFee = new ReportDataSource("dsFeePayinInvoice_PayinInvoice", dFee.Tables["PayinInvoice"]);
            ReportDataSource dsFeeDetail = new ReportDataSource("dsFeePayinInvoice_PayinInvoiceDetail", dFee.Tables["PayinInvoiceDetail"]);
            //ReportViewer1.LocalReport.ReportPath = "rptNoticeDirect.rdlc";
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(dsFee);
            ReportViewer1.LocalReport.DataSources.Add(dsFeeDetail);
            ReportViewer1.LocalReport.Refresh();
        }

    }
}
