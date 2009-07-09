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

namespace BrokerWebApp.CustomerClaim
{
    public partial class NotifyClaim : System.Web.UI.Page
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
                    if (Request.QueryString["NotifyID"] != null && Request.QueryString["NotifyID"].Trim().Length > 0)
                    {
                        this._notifyID = Request.QueryString["NotifyID"].Trim();
                        this.ViewState["NotifyID"] = this._notifyID;
                    }

                    this.Initialization();
                }
                else
                {
                    if (this.ViewState["NotifyID"] != null && this.ViewState["NotifyID"].ToString().Length > 0)
                        this._notifyID = this.ViewState["NotifyID"].ToString();
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
            if (string.IsNullOrEmpty(this._notifyID))
            {
                //保单编号
                this.SetddlPolicyNo("");
                //报案方式
                this.SetddlNotifyType("");
                //损失性质
                this.SetddlLossType("");
                //制单人
                this.SetddlCreatePerson("");
            }
            else
            {
                this.lblerrmsg.Visible = false;
                BusinessObjects.BO_NotifyClaim notifyClaim = BusinessObjects.BO_NotifyClaim.GetNotifyClaimByNotifyID(this._notifyID);
                if (notifyClaim == null)
                {
                    this.lblerrmsg.InnerText = "没有理赔信息。";
                    this.lblerrmsg.Visible = true;
                    this.dxebtnBottomSave.Enabled = false;
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
                this.dxetxtNotifyLossFee.Text = notifyClaim.NotifyLossFee.ToString();
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
                this.SetddlCreatePerson(notifyClaim.CreatePerson);
                if (notifyClaim.CreateDate != DateTime.MinValue)
                    this.deCreateDate.Text = notifyClaim.CreateDate.ToString("yyyy-MM-dd");

                this.SetddlPolicyNo(notifyClaim.PolicyNo);
                this.SetPolicyInfo(notifyClaim.PolicyNo);
            }
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
        private void SetddlCreatePerson(string value)
        {
            DataSet dsList = BO_P_User.GetUserByUserID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlCreatePerson.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
                }
                this.dxeddlCreatePerson.SelectedIndex = this.dxeddlCreatePerson.Items.IndexOf(this.dxeddlCreatePerson.Items.FindByValue(value));
            }
        }

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
            this.hidPolicyID.Value = "";
            if (string.IsNullOrEmpty(policyNo))
                return;

            DataTable dt = BusinessObjects.BO_NotifyClaim.GetPolicyByPolicyNo(policyNo);
            if (dt != null && dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["CarrierNameEn"] != DBNull.Value)
                    this.dxetxtCarrierNameCn.Text = dt.Rows[0]["CarrierNameEn"].ToString();
                if (dt.Rows[0]["CustName"] != DBNull.Value)
                    this.dxetxtCustName.Text = dt.Rows[0]["CustName"].ToString();
                if (dt.Rows[0]["BranchName"] != DBNull.Value)
                    this.dxetxtBranchName.Text = dt.Rows[0]["BranchName"].ToString();
                if (dt.Rows[0]["Beneficiary"] != DBNull.Value)
                    this.dxetxtBeneficiary.Text = dt.Rows[0]["Beneficiary"].ToString();
                if (dt.Rows[0]["ProdTypeName"] != DBNull.Value)
                    this.dxetxtProdTypeName.Text = dt.Rows[0]["ProdTypeName"].ToString();
                if (dt.Rows[0]["StartDate"] != DBNull.Value)
                    this.dxetxtStartDate.Text = dt.Rows[0]["StartDate"].ToString();
                if (dt.Rows[0]["EndDate"] != DBNull.Value)
                    this.dxetxtEndDate.Text = dt.Rows[0]["EndDate"].ToString();
                if (dt.Rows[0]["UserNameCn"] != DBNull.Value)
                    this.dxetxtUserNameCn.Text = dt.Rows[0]["UserNameCn"].ToString();
                if (dt.Rows[0]["PolicyID"] != DBNull.Value)
                    this.hidPolicyID.Value = dt.Rows[0]["PolicyID"].ToString();
            }
        }

        /// <summary>
        /// 保存理赔信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxebtnBottomSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(this._notifyID))
                {//新增理赔
                    this.lblerrmsg.Visible = false;
                    if (this.hidPolicyID.Value.Length <= 0)
                    {
                        this.lblerrmsg.InnerText = "请选择保单编号。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    if (BusinessObjects.BO_NotifyClaim.IfExistsNotifyNo(this.dxetxtNotifyNo.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "该报案号已存在。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    BusinessObjects.BO_NotifyClaim notifyClaim = new BO_NotifyClaim();
                    string id = TranUtils.GetCustomerID(); //?//暂用客户编号代替
                    notifyClaim.NotifyID = id;
                    notifyClaim.PolicyID = this.hidPolicyID.Value;
                    notifyClaim.NotifySerialNo = id;
                    notifyClaim.NotifyTime = Convert.ToDateTime(this.deNotifyTime.Text);
                    notifyClaim.AccidentSpot = this.dxetxtAccidentSpot.Text.Trim();
                    notifyClaim.AccidentTime = Convert.ToDateTime(this.deAccidentTime.Text);
                    notifyClaim.NotifyPerson = this.dxetxtNotifyPerson.Text.Trim();
                    notifyClaim.LossType = this.dxeddlLossType.SelectedItem.Value.ToString();
                    notifyClaim.AccidentReason = this.dxeddlAccidentReason.SelectedItem.Value.ToString();
                    notifyClaim.NotifyLossFee = Convert.ToDouble(this.dxetxtNotifyLossFee.Text);
                    notifyClaim.ContactPerson = this.dxetxtContactPerson.Text.Trim();
                    notifyClaim.ContactPhone = this.dxetxtContactPhone.Text.Trim();
                    notifyClaim.NotifyType = this.dxeddlNotifyType.SelectedItem.Value.ToString();
                    notifyClaim.SpotCode = ""; //?//
                    notifyClaim.AccidentProc = this.txtAccidentProc.Text.Trim();
                    notifyClaim.AccidentDeal = this.txtAccidentDeal.Text.Trim();
                    notifyClaim.NotifyRemark = "";//?//
                    notifyClaim.NotifyCarrierTime = Convert.ToDateTime(this.deNotifyCarrierTime.Text);
                    notifyClaim.NotifyNo = this.dxetxtNotifyNo.Text.Trim();
                    notifyClaim.CarrierContactPerson = this.dxetxtCarrierContactPerson.Text.Trim();
                    notifyClaim.CarrierContactPhone = this.dxetxtCarrierContactPhone.Text.Trim();
                    notifyClaim.PerambulateTime = Convert.ToDateTime(this.dePerambulateTime.Text);
                    notifyClaim.Requirement = this.txtRequirement.Text.Trim();
                    notifyClaim.CaseEndTime = DateTime.Today; //?//
                    notifyClaim.LastPayFee = 100; //?//
                    notifyClaim.AcquitFee = 100; //?//
                    notifyClaim.CaseEndRemark = "";//?//
                    notifyClaim.CreatePerson = this.dxeddlCreatePerson.SelectedItem.Value.ToString();
                    notifyClaim.CreateDate = Convert.ToDateTime(this.deCreateDate.Text);
                    notifyClaim.ModifyDate = DateTime.Today;//?//
                    notifyClaim.ModifyPerson = "";//?//
                    notifyClaim.Save(ModifiedAction.Insert);

                    this.Response.Redirect("NotifyClaim.aspx");
                }
                else
                {
                    this.lblerrmsg.Visible = false;
                    if (this.hidPolicyID.Value.Length <= 0)
                    {
                        this.lblerrmsg.InnerText = "请选择保单编号。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    BusinessObjects.BO_NotifyClaim notifyClaim = new BO_NotifyClaim();
                    notifyClaim.NotifyID = this._notifyID;
                    notifyClaim.PolicyID = this.hidPolicyID.Value;
                    notifyClaim.NotifySerialNo = this._notifyID;//?//
                    notifyClaim.NotifyTime = Convert.ToDateTime(this.deNotifyTime.Text);
                    notifyClaim.AccidentSpot = this.dxetxtAccidentSpot.Text.Trim();
                    notifyClaim.AccidentTime = Convert.ToDateTime(this.deAccidentTime.Text);
                    notifyClaim.NotifyPerson = this.dxetxtNotifyPerson.Text.Trim();
                    notifyClaim.LossType = this.dxeddlLossType.SelectedItem.Value.ToString();
                    notifyClaim.AccidentReason = this.dxeddlAccidentReason.SelectedItem.Value.ToString();
                    notifyClaim.NotifyLossFee = Convert.ToDouble(this.dxetxtNotifyLossFee.Text);
                    notifyClaim.ContactPerson = this.dxetxtContactPerson.Text.Trim();
                    notifyClaim.ContactPhone = this.dxetxtContactPhone.Text.Trim();
                    notifyClaim.NotifyType = this.dxeddlNotifyType.SelectedItem.Value.ToString();
                    notifyClaim.SpotCode = ""; //?//
                    notifyClaim.AccidentProc = this.txtAccidentProc.Text.Trim();
                    notifyClaim.AccidentDeal = this.txtAccidentDeal.Text.Trim();
                    notifyClaim.NotifyRemark = "";//?//
                    notifyClaim.NotifyCarrierTime = Convert.ToDateTime(this.deNotifyCarrierTime.Text);
                    notifyClaim.NotifyNo = this.dxetxtNotifyNo.Text.Trim();
                    notifyClaim.CarrierContactPerson = this.dxetxtCarrierContactPerson.Text.Trim();
                    notifyClaim.CarrierContactPhone = this.dxetxtCarrierContactPhone.Text.Trim();
                    notifyClaim.PerambulateTime = Convert.ToDateTime(this.dePerambulateTime.Text);
                    notifyClaim.Requirement = this.txtRequirement.Text.Trim();
                    notifyClaim.CaseEndTime = DateTime.Today; //?//
                    notifyClaim.LastPayFee = 100; //?//
                    notifyClaim.AcquitFee = 100; //?//
                    notifyClaim.CaseEndRemark = "";//?//
                    notifyClaim.CreatePerson = this.dxeddlCreatePerson.SelectedItem.Value.ToString();
                    notifyClaim.CreateDate = Convert.ToDateTime(this.deCreateDate.Text);
                    notifyClaim.ModifyDate = DateTime.Today;//?//
                    notifyClaim.ModifyPerson = "";//?//
                    notifyClaim.Save(ModifiedAction.Update);

                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language=\"javascript\">alert(\"修改完成。\");window.close();</script>", false);
                }
            }
            catch (Exception ex)
            { }
        }
    }
}
