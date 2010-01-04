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
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxGridView.Rendering;
using DevExpress.Web.ASPxClasses.Internal;

namespace BrokerWebApp.BusinessConsult
{
    public partial class BusinessConsultList : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    this.Initialization();
                    CheckPermission();
                }

                if (this.Page.IsCallback)
                {
                    this.BindGrid();
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

        private void CheckPermission()
        {
            Boolean checkPerm;
            checkPerm = this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.PolicyInput_Add);
            this.debtnCreate.Enabled = checkPerm;
            this.debtnCreate.ClientEnabled = checkPerm;


        }
        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.BindGrid();
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
            this.BindGrid();
        }


        protected void gridSearchResult_HtmlRowCreated(object sender,
            ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                //DataRow dr = this.gridSearchResult.GetDataRow(e.VisibleIndex);
                //if (dr != null)
                //{
                //    if (!String.IsNullOrEmpty(dr["Remark"].ToString()))
                //    {
                //        e.Row.Style.Add(HtmlTextWriterStyle.Color, "red");
                //    }
                //}

                GridViewCommandColumn objgcc = getCommandColumnLoop();
                Boolean checkPerm;
                //checkPerm = this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.PolicyInput_Add);

                GridViewCommandColumnButtonControl thebtn;
                InternalHyperLink theIHL;
                //delete
                checkPerm = this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.BusinessConsultList_Delete);
                thebtn = (GridViewCommandColumnButtonControl)e.Row.Cells[objgcc.VisibleIndex].Controls[0];
                thebtn.Visible = checkPerm;
                theIHL = (InternalHyperLink)thebtn.Controls[0];
                theIHL.Visible = checkPerm;


                //modify
                //checkPerm = this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.PolicyInput_Modify);
                //thebtn = (GridViewCommandColumnButtonControl)e.Row.Cells[objgcc.VisibleIndex].Controls[1];
                //thebtn.Enabled = checkPerm;
                //theIHL = (InternalHyperLink)thebtn.Controls[0];
                //theIHL.Enabled = checkPerm;

            }
        }


        private GridViewCommandColumn getCommandColumnLoop()
        {
            GridViewCommandColumn theCommandColumn = null;
            foreach (GridViewColumn item in gridSearchResult.VisibleColumns)
            {
                if (item.GetType() == typeof(GridViewCommandColumn))
                {
                    theCommandColumn = (GridViewCommandColumn)item;
                    break;
                }
            }
            return theCommandColumn;
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
            if (this.ddlAuditStatus.SelectedItem.Value.ToString().Length > 0) //?//
                sbWhere.Append(" And CF.AuditStatus ='" + this.ddlAuditStatus.SelectedItem.Value.ToString() + "' ");
            this.gridSearchResult.DataSource = BusinessObjects.Consult.BO_ConsultFee.GetConsultFeeList(sbWhere.ToString()).Tables[0];
            this.gridSearchResult.DataBind();
        }
    }
}
