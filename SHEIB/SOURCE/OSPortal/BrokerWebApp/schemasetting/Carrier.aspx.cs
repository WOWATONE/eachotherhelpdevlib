using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using DevExpress.Web.ASPxEditors;
using BusinessObjects;
using System.Data;

namespace BrokerWebApp.schemasetting
{
    public partial class Carrier : System.Web.UI.Page
    {
        #region 私有变量
        /// <summary>
        /// 客户编号
        /// </summary>
        private string _carrierID;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    if (Request.QueryString["CarrierID"] != null && Request.QueryString["CarrierID"].Trim().Length > 0)
                    {
                        this._carrierID = Request.QueryString["CarrierID"].Trim();
                        this.ViewState["CarrierID"] = this._carrierID;
                    }

                    this.Initialization();
                }
                else
                {
                    if (this.ViewState["CarrierID"] != null && this.ViewState["CarrierID"].ToString().Length > 0)
                        this._carrierID = this.ViewState["CarrierID"].ToString();
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
            if (String.IsNullOrEmpty(this._carrierID))
            {//没有传入保险公司编号, 认为是新增保险公司
                //业务类型
                this.SetddlInsType("");
                //行政级别
                this.SetddlGrdType("");
                //所在省
                this.SetddlProvince("");
            }
            else
            {//编辑保险公司
                this.lblerrmsg.Visible = false;
                BusinessObjects.SchemaSetting.BO_Carrier carrier = BusinessObjects.SchemaSetting.BO_Carrier.GetCarrierByID(this._carrierID);
                if (carrier == null)
                {
                    this.lblerrmsg.InnerText = "没有取得该保险公司信息。";
                    this.lblerrmsg.Visible = true;
                    this.dxebtnBottomSave.Enabled = false;
                    return;
                }

                #region 基本资料
                this.dxetxtCarrierID.Text = carrier.CarrierID;
                this.dxetxtCarrierID.Enabled = false;
                this.dxetxtShortName.Text = carrier.ShortName;
                this.dxetxtCarrierNameCn.Text = carrier.CarrierNameCn;
                this.dxetxtCarrierNameEn.Text = carrier.CarrierNameEn;
                this.SetddlInsType(carrier.InsType);
                this.SetddlGrdType(carrier.GrdType);
                this.SetddlProvince(carrier.Province);
                this.dxetxtAddress.Text = carrier.Address;
                this.dxetxtTel.Text = carrier.Tel;
                this.dxetxtPostcode.Text = carrier.Postcode;
                this.dxetxtFax.Text = carrier.Fax;
                this.dxetxtContact.Text = carrier.Contact;
                this.dxetxtEmail.Text = carrier.Email;
                this.dxetxtURL.Text = carrier.URL;
                this.dxetxtPolicyNoHeader.Text = carrier.PolicyNoHeader;
                #endregion

                #region 附加资料
                this.dxetxtBankName.Text = carrier.BankName;
                this.dxetxtBankAccount.Text = carrier.BankAccount;
                this.dxetxtPayoffLevel.Text = carrier.PayoffLevel;
                this.dxetxtLossRation.Text = carrier.LossRation;
                this.dxetxtPremiumSize.Text = carrier.PremiumSize;
                this.txtProfile.Text = carrier.Profile;
                this.txtRemark.Text = carrier.Remark;
                #endregion
            }
        }

        /// <summary>
        /// 设置业务类型
        /// </summary>
        private void SetddlInsType(string value)
        {
            DataSet dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.InsType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlInsType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
                this.dxeddlInsType.SelectedIndex = this.dxeddlInsType.Items.IndexOf(this.dxeddlInsType.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 设置业务类型
        /// </summary>
        private void SetddlGrdType(string value)
        {
            DataSet dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.GrdType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlGrdType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
                this.dxeddlGrdType.SelectedIndex = this.dxeddlGrdType.Items.IndexOf(this.dxeddlGrdType.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 设置所在省
        /// </summary>
        private void SetddlProvince(string value)
        {
            DataSet dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.Area.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlProvince.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
                this.dxeddlProvince.SelectedIndex = this.dxeddlProvince.Items.IndexOf(this.dxeddlProvince.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 保存保险公司信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxebtnBottomSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (String.IsNullOrEmpty(this._carrierID))
                {//新增保险公司
                    this.lblerrmsg.Visible = false;
                    if (BusinessObjects.SchemaSetting.BO_Carrier.IfExistsCarrierID(this.dxetxtCarrierID.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "该保险公司编号已存在。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }
                    BusinessObjects.SchemaSetting.BO_Carrier carrier = new BusinessObjects.SchemaSetting.BO_Carrier();
                    carrier.CarrierID = this.dxetxtCarrierID.Text.Trim();
                    carrier.ShortName = this.dxetxtShortName.Text.Trim();
                    carrier.CarrierNameCn = this.dxetxtCarrierNameCn.Text.Trim();
                    carrier.CarrierNameEn = this.dxetxtCarrierNameEn.Text.Trim();
                    if (this.dxeddlInsType.SelectedIndex >= 0)
                        carrier.InsType = this.dxeddlInsType.SelectedItem.Value.ToString();
                    else
                        carrier.InsType = "";
                    if (this.dxeddlGrdType.SelectedIndex >= 0)
                        carrier.GrdType = this.dxeddlGrdType.SelectedItem.Value.ToString();
                    else
                        carrier.GrdType = "";
                    if (this.dxeddlProvince.SelectedIndex >= 0)
                        carrier.Province = this.dxeddlProvince.SelectedItem.Value.ToString();
                    else
                        carrier.Province = "";
                    carrier.Address = this.dxetxtAddress.Text.Trim();
                    carrier.Tel = this.dxetxtTel.Text.Trim();
                    carrier.Postcode = this.dxetxtPostcode.Text.Trim();
                    carrier.Fax = this.dxetxtFax.Text.Trim();
                    carrier.Contact = this.dxetxtContact.Text.Trim();
                    carrier.Email = this.dxetxtEmail.Text.Trim();
                    carrier.URL = this.dxetxtURL.Text.Trim();
                    carrier.PolicyNoHeader = this.dxetxtPolicyNoHeader.Text.Trim();
                    carrier.BankName = this.dxetxtBankName.Text.Trim();
                    carrier.BankAccount = this.dxetxtBankAccount.Text.Trim();
                    carrier.PayoffLevel = this.dxetxtPayoffLevel.Text.Trim();
                    carrier.LossRation = this.dxetxtLossRation.Text.Trim();
                    carrier.PremiumSize = this.dxetxtPremiumSize.Text.Trim();
                    carrier.Profile = this.txtProfile.Text.Trim();
                    carrier.Remark = this.txtRemark.Text.Trim();
                    carrier.Save(ModifiedAction.Insert);

                    this.Response.Redirect("Carrier.aspx");
                }
                else
                {//修改客户
                    BusinessObjects.SchemaSetting.BO_Carrier carrier = new BusinessObjects.SchemaSetting.BO_Carrier();
                    carrier.CarrierID = this._carrierID;
                    carrier.ShortName = this.dxetxtShortName.Text.Trim();
                    carrier.CarrierNameCn = this.dxetxtCarrierNameCn.Text.Trim();
                    carrier.CarrierNameEn = this.dxetxtCarrierNameEn.Text.Trim();
                    if (this.dxeddlInsType.SelectedIndex >= 0)
                        carrier.InsType = this.dxeddlInsType.SelectedItem.Value.ToString();
                    else
                        carrier.InsType = "";
                    if (this.dxeddlGrdType.SelectedIndex >= 0)
                        carrier.GrdType = this.dxeddlGrdType.SelectedItem.Value.ToString();
                    else
                        carrier.GrdType = "";
                    if (this.dxeddlProvince.SelectedIndex >= 0)
                        carrier.Province = this.dxeddlProvince.SelectedItem.Value.ToString();
                    else
                        carrier.Province = "";
                    carrier.Address = this.dxetxtAddress.Text.Trim();
                    carrier.Tel = this.dxetxtTel.Text.Trim();
                    carrier.Postcode = this.dxetxtPostcode.Text.Trim();
                    carrier.Fax = this.dxetxtFax.Text.Trim();
                    carrier.Contact = this.dxetxtContact.Text.Trim();
                    carrier.Email = this.dxetxtEmail.Text.Trim();
                    carrier.URL = this.dxetxtURL.Text.Trim();
                    carrier.PolicyNoHeader = this.dxetxtPolicyNoHeader.Text.Trim();
                    carrier.BankName = this.dxetxtBankName.Text.Trim();
                    carrier.BankAccount = this.dxetxtBankAccount.Text.Trim();
                    carrier.PayoffLevel = this.dxetxtPayoffLevel.Text.Trim();
                    carrier.LossRation = this.dxetxtLossRation.Text.Trim();
                    carrier.PremiumSize = this.dxetxtPremiumSize.Text.Trim();
                    carrier.Profile = this.txtProfile.Text.Trim();
                    carrier.Remark = this.txtRemark.Text.Trim();
                    carrier.Save(ModifiedAction.Update);

                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language=\"javascript\">alert(\"修改完成。\");window.close();</script>", false);
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}
