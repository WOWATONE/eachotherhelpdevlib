using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObjects;
using System.Data;

namespace BrokerWebApp.CustomerRelation
{
    public partial class CustomerClaimToXls : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //this.BindGrid();
            this.Page.Title = "客户理赔记录导出";
            #region 理赔记录
            if (Request.QueryString["custID"] != null && Request.QueryString["custID"].Trim().Length > 0)
            {
                string scustID = Request.QueryString["custID"].Trim();
                DataTable dt = BO_NotifyClaim.GetCustContactByCustID(scustID);
                ExportExcel(this, dt);
            }
            
            #endregion

            //this.Response.ContentType = "application/vnd.ms-excel ";
            //this.Response.Charset = " ";
            //this.EnableViewState = false;
            //System.IO.StringWriter tw = new System.IO.StringWriter();
            //System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
            //this.gridNotifyClaimItem.RenderControl(hw);
            //this.Response.Write(tw.ToString());
            //this.Response.End(); 

            //Response.ClearContent();
            //Response.Charset = "UTF8";
            //Response.AddHeader("content-disposition", "attachment; filename=PMPM02.xls[sheel$]");
            //Response.ContentType = "application/excel";
            //Response.ContentEncoding = System.Text.Encoding.UTF7;
            //StringWriter o_sw = new StringWriter();
            //HtmlTextWriter o_htw = new HtmlTextWriter(o_sw);
            //gridNotifyClaimItem.RenderControl(o_htw);
            //Response.Write(o_sw.ToString());
            //Response.End();
        }

        public static void ExportExcel(System.Web.UI.Control control, DataTable ds)
        {
            control.Page.Response.Clear();
            control.Page.Response.Buffer = true;
            //control.Page.Response.ContentType = "application/vnd.ms-excel";
            control.Page.Response.ContentType = "application/excel";
            control.Page.Response.Charset = "";
            control.Page.EnableViewState = false;
            control.Page.Response.AddHeader("content-disposition", "attachment; filename=CustomerClaimRecord.xls");


            System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);


            System.Web.UI.WebControls.DataGrid dg = new System.Web.UI.WebControls.DataGrid();
            dg.DataSource = ds;
            dg.DataBind();
            dg.RenderControl(oHtmlTextWriter);
            control.Page.Response.Write(oStringWriter.ToString());
            //control.Page.Response.Write("客户理赔记录");
            control.Page.Response.End();
        }

    }
}
