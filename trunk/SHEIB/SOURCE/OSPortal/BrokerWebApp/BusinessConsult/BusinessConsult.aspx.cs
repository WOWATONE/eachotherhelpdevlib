using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxEditors;
using BusinessObjects;

namespace BrokerWebApp.BusinessConsult
{
    public partial class BusinessConsult : System.Web.UI.Page
    {
        #region 私有变量
        /// <summary>
        /// 咨询号
        /// </summary>
        private string _consultFeeNo;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    if (Request.QueryString["ConsultFeeNo"] != null && Request.QueryString["ConsultFeeNo"].Trim().Length > 0)
                    {
                        this._consultFeeNo = Request.QueryString["ConsultFeeNo"].Trim();
                        this.ViewState["ConsultFeeNo"] = this._consultFeeNo;
                    }

                    this.Initialization();
                }
                else
                {
                    if (this.ViewState["ConsultFeeNo"] != null && this.ViewState["ConsultFeeNo"].ToString().Length > 0)
                        this._consultFeeNo = this.ViewState["ConsultFeeNo"].ToString();
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
            if (String.IsNullOrEmpty(this._consultFeeNo))
            {//没有传入咨询号, 认为是咨询
                //咨询日期
                this.deConsultDate.Text = DateTime.Today.ToShortDateString();
                //客户经理
                this.SetddlSalesID("");
                //制单时间
                this.deCreateTime.Text = DateTime.Today.ToShortDateString();
            }
            else
            {//编辑咨询
                this.lblerrmsg.Visible = false;
                BusinessObjects.Consult.BO_ConsultFee consultFee = BusinessObjects.Consult.BO_ConsultFee.GetConsultFeeByID(this._consultFeeNo);
                if (consultFee == null)
                {
                    this.lblerrmsg.InnerText = "没有咨询费信息。";
                    this.lblerrmsg.Visible = true;
                    this.dxebtnBottomSave.Enabled = false;
                    this.dxebtnSubmit.Enabled = false;
                    return;
                }

                #region 基本信息
                this.dxetxtConsultFeeNo.Text = consultFee.ConsultFeeNo;
                this.deConsultDate.Text = consultFee.ConsultDate.ToShortDateString();
                this.SetddlSalesID(consultFee.SalesID);
                BO_Customer customer = BO_Customer.GetCustomerByID(consultFee.CustID);
                if (customer != null)
                {
                    this.dxetxtCustName.Text = customer.CustName;
                    this.hidCustID.Value = consultFee.CustID;
                }
                this.dxetxtContact.Text = consultFee.Contact;
                this.dxetxtTel.Text = consultFee.Tel;
                #endregion

                #region 咨询费用

                #endregion
            }
        }

        /// <summary>
        /// 设置客户经理
        /// </summary>
        private void SetddlSalesID(string value)
        {
            DataSet dsList = BO_P_User.GetUserByUserID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlSalesID.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
                }
                this.dxeddlSalesID.SelectedIndex = this.dxeddlSalesID.Items.IndexOf(this.dxeddlSalesID.Items.FindByValue(value));
            }
        }

        protected void gridConsultFeeItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
        }

        protected void gridConsultFeeItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //
        }

        protected void gridConsultFeeItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
        }

        protected void gridConsultFeeItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
        }

        protected void gridConsultFeeItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
        }

        protected void gridConsultFeeItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
        }

        /// <summary>
        /// 保存咨询信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxebtnBottomSave_Click(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// 保存审核信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxebtnSubmit_Click(object sender, EventArgs e)
        {
        }
    }
}
