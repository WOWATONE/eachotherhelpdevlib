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

            DataSet dsNotice = BusinessObjects.BO_Notice.GetFeeNoticeAddPrint(sNoticeNo);
           
            ReportViewer1.Visible = true;


            ReportDataSource dataSourceNotice = new ReportDataSource("dsNotice_Notice", dsNotice.Tables[0]);
            ReportDataSource dataSourceNoticePolicy = new ReportDataSource("dsNotice_NoticePolicy", dsNotice.Tables[1]);
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
