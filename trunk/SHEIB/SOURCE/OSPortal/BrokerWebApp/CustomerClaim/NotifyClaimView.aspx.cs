using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxEditors;
using BusinessObjects;

namespace BrokerWebApp.CustomerClaim
{
    public partial class NotifyClaimView : BasePage
    {
        #region 私有变量
        /// <summary>
        /// 理赔编号
        /// </summary>
        private string _notifyID;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    if (Request.QueryString["id"] != null && Request.QueryString["id"].Trim().Length > 0)
                    {
                        this._notifyID = Request.QueryString["id"].Trim();

                        this.Initialization();
                    }
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
            BusinessObjects.BO_NotifyClaim notifyClaim = BusinessObjects.BO_NotifyClaim.GetNotifyClaimByNotifyID(this._notifyID);
            if (notifyClaim == null)
            {
                this.lblerrmsg.InnerText = "没有理赔信息。";
                this.lblerrmsg.Visible = true;
                return;
            }

            this.dxetxtNotifyPerson.Text = notifyClaim.NotifyPerson;
            this.SetddlNotifyType(notifyClaim.NotifyType);
            if (notifyClaim.NotifyTime != DateTime.MinValue)
                this.deNotifyTime.Text = notifyClaim.NotifyTime.ToString("yyyy-MM-dd");
            this.dxetxtAccidentSpot.Text = notifyClaim.AccidentSpot;
            if (notifyClaim.AccidentTime != DateTime.MinValue)
                this.deAccidentTime.Text = notifyClaim.AccidentTime.ToString("yyyy-MM-dd");
            this.SetddlLossType(notifyClaim.LossType);
            this.dxeddlAccidentReason.SelectedIndex = this.dxeddlAccidentReason.Items.IndexOf(this.dxeddlAccidentReason.Items.FindByValue(notifyClaim.AccidentReason));
            this.dxetxtNotifyLossFee.Text = notifyClaim.NotifyLossFee == -1 ? "" : notifyClaim.NotifyLossFee.ToString();
            this.dxetxtContactPerson.Text = notifyClaim.ContactPerson;
            this.dxetxtContactPhone.Text = notifyClaim.ContactPhone;
            this.txtAccidentProc.Text = notifyClaim.AccidentProc;
            this.txtAccidentDeal.Text = notifyClaim.AccidentDeal;
            if (notifyClaim.NotifyCarrierTime != DateTime.MinValue)
                this.deNotifyCarrierTime.Text = notifyClaim.NotifyCarrierTime.ToString("yyyy-MM-dd");
            this.dxetxtNotifyNo.Text = notifyClaim.NotifyNo;
            this.dxetxtNotifyNo.ReadOnly = true;
            this.dxetxtCarrierContactPerson.Text = notifyClaim.CarrierContactPerson;
            this.dxetxtCarrierContactPhone.Text = notifyClaim.CarrierContactPhone;
            if (notifyClaim.PerambulateTime != DateTime.MinValue)
                this.dePerambulateTime.Text = notifyClaim.PerambulateTime.ToString("yyyy-MM-dd");
            this.txtRequirement.Text = notifyClaim.Requirement;
            //this.SetddlCreatePerson(notifyClaim.CreatePerson);
            this.dxetxtCreatePerson.Text = notifyClaim.CreatePerson;
            if (notifyClaim.CreateDate != DateTime.MinValue)
                this.deCreateDate.Text = notifyClaim.CreateDate.ToString("yyyy-MM-dd");

            this.SetddlPolicyNo(notifyClaim.PolicyNo);
            this.SetPolicyInfo(notifyClaim.PolicyID);
        }

        /// <summary>
        /// 设置保单编号(临时用)
        /// </summary>
        private void SetddlPolicyNo(string value)
        {
            DataSet dsList = BusinessObjects.BO_NotifyClaim.GetPolicyNoList();
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlPolicyNo.Items.Add(row["PolicyNo"].ToString().Trim(), row["PolicyNo"].ToString().Trim());
                }
                this.dxeddlPolicyNo.SelectedIndex = this.dxeddlPolicyNo.Items.IndexOf(this.dxeddlPolicyNo.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 设置报案方式
        /// </summary>
        private void SetddlNotifyType(string value)
        {
            DataSet dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.NotifyType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlNotifyType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
                this.dxeddlNotifyType.SelectedIndex = this.dxeddlNotifyType.Items.IndexOf(this.dxeddlNotifyType.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 设置损失性质
        /// </summary>
        private void SetddlLossType(string value)
        {
            DataSet dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.LossType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlLossType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
                this.dxeddlLossType.SelectedIndex = this.dxeddlLossType.Items.IndexOf(this.dxeddlLossType.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 设置制单人
        /// </summary>
        //private void SetddlCreatePerson(string value)
        //{
        //    DataSet dsList = BO_P_User.GetUserByUserID("");
        //    if (dsList.Tables[0] != null)
        //    {
        //        foreach (DataRow row in dsList.Tables[0].Rows)
        //        {
        //            this.dxeddlCreatePerson.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
        //        }
        //        this.dxeddlCreatePerson.SelectedIndex = this.dxeddlCreatePerson.Items.IndexOf(this.dxeddlCreatePerson.Items.FindByValue(value));
        //    }
        //}

        protected void dxeddlPolicyNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.dxeddlPolicyNo.Items.Count > 0 &&
                this.dxeddlPolicyNo.SelectedItem.Value.ToString().Length > 0)
            {
                this.SetPolicyInfo(this.dxeddlPolicyNo.SelectedItem.Value.ToString());
            }
        }

        /// <summary>
        /// 设置保单信息
        /// </summary>
        /// <param name="policyNo"></param>
        private void SetPolicyInfo(string policyNo)
        {
            this.dxetxtCarrierNameCn.Text = "";
            this.dxetxtCustName.Text = "";
            this.dxetxtBranchName.Text = "";
            this.dxetxtBeneficiary.Text = "";
            this.dxetxtProdTypeName.Text = "";
            this.dxetxtStartDate.Text = "";
            this.dxetxtEndDate.Text = "";
            this.dxetxtUserNameCn.Text = "";
            if (string.IsNullOrEmpty(policyNo))
                return;

            DataTable dt = BusinessObjects.BO_NotifyClaim.GetPolicyByPolicyID(policyNo);
            if (dt != null && dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["CarrierName"] != DBNull.Value)
                    this.dxetxtCarrierNameCn.Text = dt.Rows[0]["CarrierName"].ToString();
                if (dt.Rows[0]["CustomerName"] != DBNull.Value)
                    this.dxetxtCustName.Text = dt.Rows[0]["CustomerName"].ToString();
                //if (dt.Rows[0]["BranchName"] != DBNull.Value)
                //    this.dxetxtBranchName.Text = dt.Rows[0]["BranchName"].ToString();
                if (dt.Rows[0]["Beneficiary"] != DBNull.Value)
                    this.dxetxtBeneficiary.Text = dt.Rows[0]["Beneficiary"].ToString();
                if (dt.Rows[0]["ProdTypeName"] != DBNull.Value)
                    this.dxetxtProdTypeName.Text = dt.Rows[0]["ProdTypeName"].ToString();
                if (dt.Rows[0]["StartDate"] != DBNull.Value)
                    this.dxetxtStartDate.Text = dt.Rows[0]["StartDate"].ToString();
                if (dt.Rows[0]["EndDate"] != DBNull.Value)
                    this.dxetxtEndDate.Text = dt.Rows[0]["EndDate"].ToString();
                if (dt.Rows[0]["UserName"] != DBNull.Value)
                    this.dxetxtUserNameCn.Text = dt.Rows[0]["UserName"].ToString();
            }
        }
    }
}
