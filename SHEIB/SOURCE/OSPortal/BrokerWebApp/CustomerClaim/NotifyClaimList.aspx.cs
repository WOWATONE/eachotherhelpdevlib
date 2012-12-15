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

using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxGridView.Rendering;
using DevExpress.Web.ASPxClasses.Internal;


namespace BrokerWebApp.CustomerClaim
{
    public partial class NotifyClaimList : BasePage
    {

        #region Variables

        private string toadd = string.Empty;

        #endregion Variables

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
            this.dxeddlLoseStatus.DataSource = BusinessObjects.BO_NotifyClaimFollow.GetLoseStatusList();
            this.dxeddlLoseStatus.TextField = "AccountTypeName";
            this.dxeddlLoseStatus.ValueField = "AccountTypeID";
            this.dxeddlLoseStatus.DataBind();
            this.dxeddlLoseStatus.Items.Insert(0, new ListEditItem("(全部)", ""));
            this.dxeddlLoseStatus.Items.Insert(1, new ListEditItem("未结案", "0"));

            DataSet dsList = BusinessObjects.SchemaSetting.BO_ProductType.GetProductTypeList();
            if (dsList.Tables[0] != null && dsList.Tables[0].Rows.Count > 0)
            {
                this.SetProdTypeName(dsList.Tables[0], "0", this.dxeddlProdTypeName);                
            }
        }


        private void SetProdTypeName(DataTable table, string parentid, ASPxComboBox comboBox)
        {
            if (parentid == "0")
                this.toadd = "";
            else
                this.toadd += "   ";
            DataRow[] rows = table.Select("ParentID='" + parentid + "'", "ProdClass");
            foreach (DataRow row in rows)
            {
                comboBox.Items.Add(this.toadd + (parentid == "0" ? "" : "∟") + row["ProdTypeName"].ToString(), row["ProdTypeID"].ToString());
                this.SetProdTypeName(table, row["ProdTypeID"].ToString(), comboBox);
                this.toadd = this.toadd.Substring(0, this.toadd.Length - 3);
            }
        }

        private void SetddlProdTypeName(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                this.dxeddlProdTypeName.SelectedIndex = this.dxeddlProdTypeName.Items.IndexOf(this.dxeddlProdTypeName.Items.FindByValue(value));
                if (this.dxeddlProdTypeName.SelectedIndex >= 0)
                    this.dxeddlProdTypeName.Text = this.dxeddlProdTypeName.SelectedItem.Text.Substring(this.dxeddlProdTypeName.SelectedItem.Text.IndexOf("∟") + 1);

            }
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

        protected void gridSearchResult_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }



        protected void gridSearchResult_HtmlRowCreated(object sender,
            ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                bool isEnd = false;
                DataRow dr = this.gridSearchResult.GetDataRow(e.VisibleIndex);
                if (dr != null)
                {
                    if (!String.IsNullOrEmpty(dr["LoseStatusName"].ToString()))
                    {
                        if (dr["LoseStatusName"].ToString().Trim() == "结案")
                        {
                            isEnd = true;
                        }
                    }
                }
                GridViewCommandColumn objgcc = getCommandColumnLoop();
                //Boolean checkPerm = true;
                GridViewCommandColumnButtonControl thebtn;
                InternalHyperLink theIHL;
                
                //delete
                //checkPerm = this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.CarPolicyAlt_Add);
                thebtn = (GridViewCommandColumnButtonControl)e.Row.Cells[objgcc.VisibleIndex].Controls[0];
                thebtn.Enabled = !isEnd;
                thebtn.Visible = !isEnd;
                theIHL = (InternalHyperLink)thebtn.Controls[0];
                theIHL.Enabled = !isEnd;
                theIHL.Visible = !isEnd;


                //modify
                //checkPerm = this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.PolicyInput_Modify);
                thebtn = (GridViewCommandColumnButtonControl)e.Row.Cells[objgcc.VisibleIndex].Controls[1];
                thebtn.Enabled = true;                
                theIHL = (InternalHyperLink)thebtn.Controls[0];
                theIHL.Enabled = true;
                if (isEnd)
                {
                    theIHL.Text = "查看";
                }

            }
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
                sbWhere.Append(" And B.PolicyNo  like '%" + this.dxetxtPolicyNo.Text.Trim() + "%' ");

            //报案号
            if (this.dxetxtNotifyNo.Text.Trim().Length > 0)
                sbWhere.Append(" And A.NotifyNo like '%" + this.dxetxtNotifyNo.Text.Trim() + "%' ");

            //报案日期
            if ((this.deStartNotifyTime.Text.Trim().Length > 0) && (this.deEndNotifyTime.Text.Trim().Length > 0))
            {
                sbWhere.Append(" And A.NotifyTime>='" + this.deStartNotifyTime.Text.Trim() + "' ");
                sbWhere.Append(" And A.NotifyTime<='" + this.deEndNotifyTime.Text.Trim() + "' ");
            }

            //出险开始日期
            if ((this.deStartAccidentTime.Text.Trim().Length>0)&&(this.deEndAccidentTime.Text.Trim().Length>0))
            {
                sbWhere.Append(" And A.AccidentTime>='" + this.deStartAccidentTime.Text.Trim() + "' ");
                sbWhere.Append(" And A.AccidentTime<='" + this.deEndAccidentTime.Text.Trim() + "' ");
            }

            //结案日期
            if ((this.deStartCaseEndTime.Text.Trim().Length > 0) && (this.deEndCaseEndTime.Text.Trim().Length > 0))
            {
                sbWhere.Append(" And A.CaseEndTime>='" + this.deStartCaseEndTime.Text.Trim() + "' ");
                sbWhere.Append(" And A.CaseEndTime<='" + this.deEndCaseEndTime.Text.Trim() + "' ");
            }


            //报案人
            if (this.dxetxtNotifyPerson.Text.Trim().Length>0)
                sbWhere.Append(" And A.NotifyPerson like '%" + this.dxetxtNotifyPerson.Text.Trim() + "%' ");

            //联系人
            if (this.dxetxtContactPerson.Text.Trim().Length>0)
                sbWhere.Append(" And A.ContactPerson like '%" + this.dxetxtContactPerson.Text.Trim() + "%' ");

            //理赔状态
            if (this.dxeddlLoseStatus.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlLoseStatus.SelectedItem.Value.ToString()))
            {
                string sLoseStatus = this.dxeddlLoseStatus.SelectedItem.Value.ToString();
                if (sLoseStatus == "0")
                {
                    sbWhere.Append(" and CaseEndTime is null ");
                }
                else
                {
                    sbWhere.Append(" and (select max(LoseStatus) from NotifyClaimFollow where NotifyID=a.NotifyID) ='" + sLoseStatus + "'");
                }
            }


            //Select CustName from Customer where CustID = B.CustomerID

            //联系人
            if (this.txtCustName.Text.Trim().Length > 0)
                sbWhere.Append(" And exists (select 1 from Customer where  CustID = B.CustomerID and  CustName like '%" + this.txtCustName.Text.Trim() + "%')");
            //ProType
            if (this.ptid.Value != null && !String.IsNullOrEmpty(this.ptid.Value))
                sbWhere.Append(" And exists (select 1 from Policy where  PolicyID = B.PolicyID and  ProdTypeID like '%" + this.ptid.Value.Trim() + "%')");

            //if (this.ptid.Value != null && !String.IsNullOrEmpty(this.ptid.Value))
            //{
            //    lsWhere = lsWhere + " and  b.ProdTypeID like ('%" + this.ptid.Value.Trim() + "%') ";
            //}

            this.gridSearchResult.DataSource = BusinessObjects.BO_NotifyClaim.GetNotifyClaimList(sbWhere.ToString()).Tables[0];
            this.gridSearchResult.DataBind();
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


    
    
    }
}
