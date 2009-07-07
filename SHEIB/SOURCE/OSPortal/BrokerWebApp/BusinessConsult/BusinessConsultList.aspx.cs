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

namespace BrokerWebApp.BusinessConsult
{
    public partial class BusinessConsultList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    this.Initialization();
                }
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 初始化控件
        /// </summary>
        private void Initialization()
        {
            DataSet dsList;

            //客户经理
            this.dxeddlSalesID.Items.Add("(全部)", "");
            dsList = BO_P_User.GetUserByUserID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlSalesID.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
                }
            }
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String consultFeeID = e.Keys["ConsultFeeID"].ToString();
            BusinessObjects.Consult.BO_ConsultFee.Delete(consultFeeID);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
            this.BindGrid();
        }

        protected void gridSearchResult_CustomCallBack(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
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
            if (this.dxetxtConsultFeeNo.Text.Trim().Length > 0)
                sbWhere.Append(" And CF.ConsultFeeNo='" + this.dxetxtConsultFeeNo.Text.Trim() + "' ");
            if (this.dxeddlSalesID.SelectedItem.Value.ToString().Length > 0)
                sbWhere.Append(" And CF.SalesID='" + this.dxeddlSalesID.SelectedItem.Value.ToString() + "' ");
            if (this.deStartConsultDate.Text.Trim().Length > 0)
                sbWhere.Append(" And CF.ConsultDate>='" + this.deStartConsultDate.Text.Trim() + "' ");
            if (this.deEndConsultDate.Text.Trim().Length > 0)
                sbWhere.Append(" And CF.ConsultDate<='" + this.deEndConsultDate.Text.Trim() + "' ");
            if (this.dxetxtContact.Text.Trim().Length > 0)
                sbWhere.Append(" And CF.Contact like '%" + this.dxetxtContact.Text.Trim() + "%' ");
            //if (this.ddlAuditStatus.SelectedItem.Value.ToString().Length > 0) //?//
            //    sbWhere.Append(" And CF.='" + this.ddlAuditStatus.SelectedItem.Value.ToString() + "' ");
            this.gridSearchResult.DataSource = BusinessObjects.Consult.BO_ConsultFee.GetConsultFeeList(sbWhere.ToString()).Tables[0];
            this.gridSearchResult.DataBind();
        }
    }
}
