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

        private const string inputQueryStringIDKey = "NoticeNo";
        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            string NoticeNo, GatheringType;
            NoticeNo = Page.Request.QueryString["NoticeNo"];
            GatheringType = Page.Request.QueryString["GatheringType"];
            printVoucher(NoticeNo, GatheringType);
        }

        private void printVoucher(string sNoticeNo, string sGatheringType)
        {
            string sSql = "";

            string conn = ConfigurationManager.ConnectionStrings["broker"].ConnectionString;
            inoutbalance.rpt.dsNotice dNotice = new BrokerWebApp.inoutbalance.rpt.dsNotice();

            sSql = sSql + "select NoticeNo,dbo.GetYYYYMMDDChinese(NoticeDate) NoticeDate,";
            sSql = sSql + "(select max(CustomerName) from PolicyPeriodDetail where NoticeNo=a.NoticeNo)  CustomerName,";
            sSql = sSql + "(select max(BranchName) from PolicyPeriodDetail where NoticeNo=a.NoticeNo) Carrier,";
            sSql = sSql + "(select SUM(PayFeeBase) from PolicyPeriodDetail where NoticeNo=a.NoticeNo) PayFee,";
            sSql = sSql + "(select dbo.MoneyToChinese(SUM(PayFeeBase)) from PolicyPeriodDetail where NoticeNo=a.NoticeNo) PayFeeUpper,";
            sSql = sSql + "(select SUM(AciPremium) from PolicyPeriodDetail where NoticeNo=a.NoticeNo) AciPremium,";
            sSql = sSql + "(select SUM(CstPremium) from PolicyPeriodDetail where NoticeNo=a.NoticeNo) CstPremium,";
            sSql = sSql + "(select SUM(CiPremium) from PolicyPeriodDetail where NoticeNo=a.NoticeNo) CiPremium,";
            sSql = sSql + "(select  ParamData from SysSet where ParamName='FeeInc') FeeCompany,";
            sSql = sSql + "(select  ParamData from SysSet where ParamName='FeeIncBankAccount') FeeAccount,";
            sSql = sSql + "(select  ParamData from SysSet where ParamName='FeeIncBankName') FeeBankName";
            sSql = sSql + " from notice a";
            sSql = sSql + " where NoticeNo='" + sNoticeNo + "'";
            SqlDataAdapter ad = new SqlDataAdapter(sSql, conn);
            ad.Fill(dNotice, "Notice");

            sSql = "";
            sSql = sSql + "select ProdTypeName,PolicyNo,PolicyID,PayFee,NoticeNo,CarrierName,BranchName";
            sSql = sSql + " from NoticePolicyPeriod";
            sSql = sSql + " where NoticeNo='" + sNoticeNo + "'";

            SqlDataAdapter adDetail = new SqlDataAdapter(sSql, conn);
            adDetail.Fill(dNotice, "NoticePolicy");
            //            <LocalReport ReportPath="inoutbalance\rpt\rptPayin.rdlc" />
            ReportViewer1.Visible = true;
            ReportDataSource dataSourceNotice = new ReportDataSource("dsNotice_Notice", dNotice.Tables["Notice"]);
            ReportDataSource dataSourceNoticePolicy = new ReportDataSource("dsNotice_NoticePolicy", dNotice.Tables["NoticePolicy"]);
            if (sGatheringType == "2")
            {
                ReportViewer1.LocalReport.ReportPath = "inoutbalance\\rpt\\rptNoticeDirect.rdlc";
            }
            else
            {
                ReportViewer1.LocalReport.ReportPath = "inoutbalance\\rpt\\rptNoticeAgent.rdlc";
            }           
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(dataSourceNotice);
            ReportViewer1.LocalReport.DataSources.Add(dataSourceNoticePolicy);
            ReportViewer1.LocalReport.Refresh();

        }
    }
}
