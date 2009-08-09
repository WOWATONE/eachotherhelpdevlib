using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;

namespace BrokerWebApp.schemasetting
{
    public partial class Enterprise : System.Web.UI.Page
    {
        #region 私有变量
        /// <summary>
        /// 操作
        /// </summary>
        private string _action;
        /// <summary>
        /// 企业目录ID
        /// </summary>
        private string _ID;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    if (Request.QueryString["action"] != null && Request.QueryString["action"].Trim().Length > 0)
                    {
                        this._action = Request.QueryString["action"].Trim().ToLower();
                        this.ViewState["Action"] = this._action;

                        if (Request.QueryString["ID"] != null && Request.QueryString["ID"].Trim().Length > 0)
                        {
                            this._ID = Request.QueryString["ID"].Trim();
                            this.ViewState["ID"] = this._ID;

                            this.Initialization();
                        }
                    }
                }
                else
                {
                    if (this.ViewState["Action"] != null && this.ViewState["Action"].ToString().Length > 0)
                    {
                        this._action = this.ViewState["Action"].ToString();

                        if (this.ViewState["ID"] != null && this.ViewState["ID"].ToString().Length > 0)
                        {
                            this._ID = this.ViewState["ID"].ToString();
                        }
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
            this.dxebtnBottomSave.Enabled = false;
            if (this._action == "add")
            {//增加企业目录
                this.CustClassifyTabPage.TabPages[0].Text = "增加企业目录";
                if (this._ID == "L0")
                    this.dxetxtParent.Text = "";
                else
                {
                    BusinessObjects.SchemaSetting.BO_CustClassify custClassify = new BusinessObjects.SchemaSetting.BO_CustClassify(this._ID);
                    this.dxetxtParent.Text = custClassify.CustClassifyName == null ? "" : custClassify.CustClassifyName;
                }
                this.hidParentId.Value = this._ID;

                this.dxebtnBottomSave.Enabled = true;
            }
            else if (this._action == "edit")
            {//修改企业目录
                this.CustClassifyTabPage.TabPages[0].Text = "修改企业目录";
                BusinessObjects.SchemaSetting.BO_CustClassify custClassify = new BusinessObjects.SchemaSetting.BO_CustClassify(this._ID);
                this.dxetxtParent.Text = custClassify.ParentName == null ? "" : custClassify.ParentName;
                this.hidParentId.Value = custClassify.ParentID;
                this.dxetxtCustClassifyID.Text = custClassify.CustClassifyID;
                this.dxetxtCustClassifyName.Text = custClassify.CustClassifyName;
                this.dxetxtOrderNo.Text = custClassify.OrderNo.ToString();

                this.dxebtnBottomSave.Enabled = true;
            }
        }

        /// <summary>
        /// 保存企业目录信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxebtnBottomSave_Click(object sender, EventArgs e)
        {
            try
            {
                this.lblerrmsg.Visible = false;
                if (this._action == "add")
                {//增加企业目录
                    if (BusinessObjects.SchemaSetting.BO_CustClassify.IfExistsCustClassifyID(this.dxetxtCustClassifyID.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "该企业目录编号已存在。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    if (!this.IsIntValue(this.dxetxtOrderNo.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "排序号不正确。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    BusinessObjects.SchemaSetting.BO_CustClassify custClassify = new BusinessObjects.SchemaSetting.BO_CustClassify();
                    custClassify.CustClassifyID = this.dxetxtCustClassifyID.Text.Trim();
                    custClassify.CustClassifyName = this.dxetxtCustClassifyName.Text.Trim();
                    custClassify.OrderNo = Convert.ToInt32(this.dxetxtOrderNo.Text);
                    if (this._ID == "L0")
                    {
                        custClassify.ParentID = "0";
                    }
                    else
                    {
                        custClassify.ParentID = this._ID;
                    }
                    custClassify.Save(ModifiedAction.Insert);

                    this.Response.Redirect("Enterprise.aspx?action=Edit&ID=" + custClassify.CustClassifyID);
                }
                else if (this._action == "edit")
                {//修改企业目录
                    if (this._ID != this.dxetxtCustClassifyID.Text.Trim() &&
                        BusinessObjects.SchemaSetting.BO_CustClassify.IfExistsCustClassifyID(this.dxetxtCustClassifyID.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "该险种编号已存在。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    if (!this.IsIntValue(this.dxetxtOrderNo.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "排序号不正确。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    BusinessObjects.SchemaSetting.BO_CustClassify custClassify = new BusinessObjects.SchemaSetting.BO_CustClassify();
                    custClassify.NewCustClassifyID = this.dxetxtCustClassifyID.Text.Trim();
                    custClassify.CustClassifyID = this._ID;
                    custClassify.CustClassifyName = this.dxetxtCustClassifyName.Text.Trim();
                    custClassify.OrderNo = Convert.ToInt32(this.dxetxtOrderNo.Text);
                    custClassify.Save(ModifiedAction.Update);

                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language=\"javascript\">alert(\"修改完成。\");</script>", false);
                }
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 判断是否是正整数值
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private bool IsIntValue(string value)
        {
            if (string.IsNullOrEmpty(value))
                return false;
            int result = 0;
            return int.TryParse(value, out result);
        }
    }
}
