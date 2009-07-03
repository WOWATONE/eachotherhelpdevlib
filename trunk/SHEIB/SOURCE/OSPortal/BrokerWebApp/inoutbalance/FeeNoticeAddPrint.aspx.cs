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
    public partial class FeeNoticeAddPrint : BasePage
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
            inoutbalance.rpt.dsPayin dPayin = new BrokerWebApp.inoutbalance.rpt.dsPayin();

            sSql = sSql + "select VoucherID,(select CarrierNameCn from Carrier where CarrierID=a.CarrierID) CarrierName,";
            sSql = sSql + "(select SUM(Fee) from Fee where VoucherID=a.VoucherID) PayinFee,";
            sSql = sSql + "(select dbo.MoneyToChinese(SUM(Fee)) from Fee where VoucherID=a.VoucherID) PayinFeeUpper,";
            sSql = sSql + "(select sum(PayProcBase) from VoucherFee where VoucherID=a.VoucherID ) PayProc,";
            sSql = sSql + "dbo.GetVoucherCustomer(a.VoucherID) Customer,";
            sSql = sSql + "dbo.GetYYYYMMDDChinese(a.FeeDate) FeeDate";
            sSql = sSql + " from Voucher a";
            sSql = sSql + " left join branch b";
            sSql = sSql + " on a.BranchID=b.BranchID";
            sSql = sSql + " where VoucherID='" + sVoucherID + "'";
            SqlDataAdapter ad = new SqlDataAdapter(sSql, conn);
            ad.Fill(dPayin, "Payin");

            sSql = "";
            sSql = sSql + "select NoticeNo+'('+dbo.GetVoucherPolicyByNoticeNo('" + sVoucherID + "',NoticeNo)+')'  as NoticeNo,PayFee";
            sSql = sSql + " from ";
            sSql = sSql + " (";
            sSql = sSql + " select NoticeNo,sum(PayFee) PayFee";
            sSql = sSql + " from voucherfee a";
            sSql = sSql + " where VoucherID ='00000004' ";
            sSql = sSql + " group by NoticeNo";
            sSql = sSql + ") a";

            SqlDataAdapter adDetail = new SqlDataAdapter(sSql, conn);
            adDetail.Fill(dPayin, "PayinDetail");

            ReportViewer1.Visible = true;
            ReportDataSource dataSourcePayin = new ReportDataSource("dsPayin_Payin", dPayin.Tables["Payin"]);
            ReportDataSource dataSourcePayinDetail = new ReportDataSource("dsPayin_PayinDetail", dPayin.Tables["PayinDetail"]);
            //ReportViewer1.LocalReport.ReportPath = "rptNoticeDirect.rdlc";
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(dataSourcePayin);
            ReportViewer1.LocalReport.DataSources.Add(dataSourcePayinDetail);
            ReportViewer1.LocalReport.Refresh();
        }
    }
}
