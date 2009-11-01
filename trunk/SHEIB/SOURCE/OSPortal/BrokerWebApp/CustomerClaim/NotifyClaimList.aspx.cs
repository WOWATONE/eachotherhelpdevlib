using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data;
using BusinessObjects;

namespace BrokerWebApp.CustomerClaim
{
    public partial class NotifyClaimList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    this.Initialization();
                }

                if (this.Page.IsCallback)
                {
                    this.BindGrid();
                }
            }
            catch
            { }
        }

        /// <summary>
        /// 初始化控件
        /// </summary>
        private void Initialization()
        {
           //
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.BindGrid();
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String notifyID = e.Keys["NotifyID"].ToString();
            BusinessObjects.BO_NotifyClaim.Delete(notifyID);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
            this.BindGrid();
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.BindGrid();
        }

        /// <summary>
        /// 填充数据
        /// </summary>
        private void BindGrid()
        {
            System.Text.StringBuilder sbWhere = new System.Text.StringBuilder();

            //保单编号
            if (this.dxetxtPolicyNo.Text.Trim().Length > 0)
                sbWhere.Append(" And B.PolicyNo='" + this.dxetxtPolicyNo.Text.Trim() + "' ");

            //报案号
            if (this.dxetxtNotifyNo.Text.Trim().Length > 0)
                sbWhere.Append(" And A.NotifyNo='" + this.dxetxtNotifyNo.Text.Trim() + "' ");

            //报案开始日期
            if (this.deStartNotifyTime.Text.Trim().Length>0)
                sbWhere.Append(" And A.NotifyTime>='" + this.deStartNotifyTime.Text.Trim() + "' ");

            //报案结束日期
            if (this.deEndNotifyTime.Text.Trim().Length>0)
                sbWhere.Append(" And A.NotifyTime<='" + this.deEndNotifyTime.Text.Trim() + "' ");

            //出险开始日期
            if (this.deStartAccidentTime.Text.Trim().Length>0)
                sbWhere.Append(" And A.AccidentTime>='" + this.deStartAccidentTime.Text.Trim() + "' ");

            //出险结束日期
            if (this.deEndAccidentTime.Text.Trim().Length>0)
                sbWhere.Append(" And A.AccidentTime<='" + this.deEndAccidentTime.Text.Trim() + "' ");

            //报案人
            if (this.dxetxtNotifyPerson.Text.Trim().Length>0)
                sbWhere.Append(" And A.NotifyPerson like '%" + this.dxetxtNotifyPerson.Text.Trim() + "%' ");

            //联系人
            if (this.dxetxtContactPerson.Text.Trim().Length>0)
                sbWhere.Append(" And A.ContactPerson like '%" + this.dxetxtContactPerson.Text.Trim() + "%' ");

            this.gridSearchResult.DataSource = BusinessObjects.BO_NotifyClaim.GetNotifyClaimList(sbWhere.ToString()).Tables[0];
            this.gridSearchResult.DataBind();
        }
    }
}
