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
    public partial class Branch : System.Web.UI.Page
    {
        #region 私有变量
        /// <summary>
        /// 分支机构编号
        /// </summary>
        private string _branchID;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    if (Request.QueryString["BranchID"] != null && Request.QueryString["BranchID"].Trim().Length > 0)
                    {
                        this._branchID = Request.QueryString["BranchID"].Trim();
                        this.ViewState["BranchID"] = this._branchID;
                    }

                    this.Initialization();
                }
                else
                {
                    if (this.ViewState["BranchID"] != null && this.ViewState["BranchID"].ToString().Length > 0)
                        this._branchID = this.ViewState["BranchID"].ToString();
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
            if (String.IsNullOrEmpty(this._branchID))
            {//没有传入分支机构编号, 认为是新增分支机构
                //保险公司
                this.SetddlCarrier("");
                //所在省
                this.SetddlProvince("");
            }
            else
            {//编辑分支机构
                this.lblerrmsg.Visible = false;
                BusinessObjects.SchemaSetting.BO_Branch branch = new BusinessObjects.SchemaSetting.BO_Branch(this._branchID);
                if (string.IsNullOrEmpty(branch.BranchID))
                {
                    this.lblerrmsg.InnerText = "没有取得该分支机构信息。";
                    this.lblerrmsg.Visible = true;
                    this.dxebtnBottomSave.Enabled = false;
                    return;
                }

                this.SetddlCarrier(branch.CarrierID);
                this.SetddlProvince(branch.Province);
                this.dxetxtShortName.Text = branch.ShortName;
                this.dxetxtBranchID.Text = branch.BranchID;
                this.dxetxtBranchName.Text = branch.BranchName;
                this.dxetxtAddress.Text = branch.Address;
                this.dxetxtContact.Text = branch.Contact;
                this.dxetxtPostCode.Text = branch.PostCode;
                this.dxetxtTel.Text = branch.Tel;
                this.dxetxtFax.Text = branch.Fax;
                this.dxetxtEMail.Text = branch.EMail;
                this.dxetxtBankName.Text = branch.BankName;
                this.dxetxtBankAccount.Text = branch.BankAccount;
                this.txtRemark.Text = branch.Remark;
            }
        }

        /// <summary>
        /// 设置保险公司
        /// </summary>
        /// <param name="value"></param>
        private void SetddlCarrier(string value)
        {
            DataSet dsList = BusinessObjects.SchemaSetting.BO_Carrier.GetCarrierList("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlCarrier.Items.Add(row["CarrierNameCn"].ToString().Trim(), row["CarrierID"].ToString().Trim());
                }
                this.dxeddlCarrier.SelectedIndex = this.dxeddlCarrier.Items.IndexOf(this.dxeddlCarrier.Items.FindByValue(value));
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
        /// 保存分支机构信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxebtnBottomSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (String.IsNullOrEmpty(this._branchID))
                {//新增分支机构
                    this.lblerrmsg.Visible = false;
                    if (BusinessObjects.SchemaSetting.BO_Branch.IfExistsBranchID(this.dxetxtBranchID.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "该分支机构编号已存在。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }
                    BusinessObjects.SchemaSetting.BO_Branch branch = new BusinessObjects.SchemaSetting.BO_Branch();
                    if (this.dxeddlCarrier.SelectedIndex >= 0)
                        branch.CarrierID = this.dxeddlCarrier.SelectedItem.Value.ToString();
                    else
                        branch.CarrierID = "";
                    if (this.dxeddlProvince.SelectedIndex >= 0)
                        branch.Province = this.dxeddlProvince.SelectedItem.Value.ToString();
                    else
                        branch.Province = "";
                    branch.ShortName=this.dxetxtShortName.Text.Trim();
                    branch.BranchID = this.dxetxtBranchID.Text.Trim();
                    branch.BranchName = this.dxetxtBranchName.Text.Trim();
                    branch.Address = this.dxetxtAddress.Text.Trim();
                    branch.Contact = this.dxetxtContact.Text.Trim();
                    branch.PostCode = this.dxetxtPostCode.Text.Trim();
                    branch.Tel = this.dxetxtTel.Text.Trim();
                    branch.Fax = this.dxetxtFax.Text.Trim();
                    branch.EMail = this.dxetxtEMail.Text.Trim();
                    branch.BankName = this.dxetxtBankName.Text.Trim();
                    branch.BankAccount = this.dxetxtBankAccount.Text.Trim();
                    branch.Remark = this.txtRemark.Text.Trim();
                    branch.Save(ModifiedAction.Insert);

                    this.Response.Redirect("Branch.aspx");
                }
                else
                {//修改客户
                    if (this._branchID != this.dxetxtBranchID.Text.Trim() &&
                            BusinessObjects.SchemaSetting.BO_Branch.IfExistsBranchID(this.dxetxtBranchID.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "该分支机构编号已存在。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    BusinessObjects.SchemaSetting.BO_Branch branch = new BusinessObjects.SchemaSetting.BO_Branch();
                    if (this.dxeddlCarrier.SelectedIndex >= 0)
                        branch.CarrierID = this.dxeddlCarrier.SelectedItem.Value.ToString();
                    else
                        branch.CarrierID = "";
                    if (this.dxeddlProvince.SelectedIndex >= 0)
                        branch.Province = this.dxeddlProvince.SelectedItem.Value.ToString();
                    else
                        branch.Province = "";
                    branch.ShortName = this.dxetxtShortName.Text.Trim();
                    branch.NewBranchID = this.dxetxtBranchID.Text.Trim();
                    branch.BranchID = this._branchID;
                    branch.BranchName = this.dxetxtBranchName.Text.Trim();
                    branch.Address = this.dxetxtAddress.Text.Trim();
                    branch.Contact = this.dxetxtContact.Text.Trim();
                    branch.PostCode = this.dxetxtPostCode.Text.Trim();
                    branch.Tel = this.dxetxtTel.Text.Trim();
                    branch.Fax = this.dxetxtFax.Text.Trim();
                    branch.EMail = this.dxetxtEMail.Text.Trim();
                    branch.BankName = this.dxetxtBankName.Text.Trim();
                    branch.BankAccount = this.dxetxtBankAccount.Text.Trim();
                    branch.Remark = this.txtRemark.Text.Trim();
                    branch.Save(ModifiedAction.Update);

                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language=\"javascript\">alert(\"修改完成。\");window.close();</script>", false);
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}
