using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;

using System.Data.SqlClient;
using System.Configuration;
using Microsoft.Reporting.WebForms;


namespace BrokerWebApp.Report
{

    public partial class TYGH : System.Web.UI.Page
    {

        #region Variables

        
        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            //
            BindGrid();

        }

                
        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
         
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {            
            //this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        private void BindGrid()
        {
            string sSql = "";
            string conn = ConfigurationManager.ConnectionStrings["broker"].ConnectionString;
            Report.rpt.dsTYGH dFee = new Report.rpt.dsTYGH();

            sSql = "";
            sSql = sSql + "select *";
            sSql = sSql + " from TYGH a";
            SqlDataAdapter ad = new SqlDataAdapter(sSql, conn);
            ad.Fill(dFee, "TYGH");


            ReportViewer1.Visible = true;
            ReportDataSource dsFee = new ReportDataSource("dsTYGH_TYGH", dFee.Tables["TYGH"]);
            //ReportViewer1.LocalReport.ReportPath = "rptNoticeDirect.rdlc";
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(dsFee);
            ReportViewer1.LocalReport.Refresh();
        }
    }
}
