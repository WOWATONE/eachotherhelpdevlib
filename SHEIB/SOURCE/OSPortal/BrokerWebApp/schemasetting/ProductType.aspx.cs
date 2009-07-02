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
    public partial class ProductType : System.Web.UI.Page
    {
        #region 私有变量
        /// <summary>
        /// 险种/项目
        /// </summary>
        private string _type;
        /// <summary>
        /// 操作
        /// </summary>
        private string _action;
        /// <summary>
        /// 险种ID/项目ID
        /// </summary>
        private string _ID;
        /// <summary>
        /// 页标题
        /// </summary>
        protected string pageTitle = "";
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    if (Request.QueryString["type"] != null && Request.QueryString["type"].Trim().Length > 0)
                    {
                        this._type = Request.QueryString["type"].Trim().ToLower();
                        this.ViewState["Type"] = this._type;
                        if (Request.QueryString["action"] != null && Request.QueryString["action"].Trim().Length > 0)
                        {
                            this._action = Request.QueryString["action"].Trim().ToLower();
                            this.ViewState["Action"] = this._action;

                            if (Request.QueryString["ID"] != null && Request.QueryString["ID"].Trim().Length > 0)
                            {
                                this._ID = Request.QueryString["ID"].Trim().ToLower();
                                this.ViewState["ID"] = this._ID;

                                this.Initialization();
                            }
                        }
                    }
                }
                else
                {
                    if (this.ViewState["Type"] != null && this.ViewState["Type"].ToString().Length > 0)
                    {
                        this._type = this.ViewState["Type"].ToString();
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
            if (this._type == "producttype")
            {
                this.ProductTabPage.TabPages[0].Visible = true;
                this.ProductTabPage.TabPages[1].Visible = false;
                this.ProductTabPage.TabPages[2].Visible = false;

                if (this._action == "add")
                {//增加险种
                    this.pageTitle = "增加险种";
                    if (this._ID == "l0")
                        this.dxetxtParent.Text = "";
                    else
                    {
                        BusinessObjects.SchemaSetting.BO_ProductType productType = new BusinessObjects.SchemaSetting.BO_ProductType(this._ID);
                        this.dxetxtParent.Text = productType.ProdTypeName == null ? "" : productType.ProdTypeName;
                    }
                    this.SetddlProdClass("");

                    this.dxebtnBottomSave.Enabled = true;
                }
                else if (this._action == "edit")
                {//修改险种
                    this.pageTitle = "修改险种";
                    BusinessObjects.SchemaSetting.BO_ProductType productType = new BusinessObjects.SchemaSetting.BO_ProductType(this._ID);
                    this.dxetxtParent.Text = productType.ParentName == null ? "" : productType.ParentName;
                    this.dxetxtProdTypeID.Text = productType.ProdTypeID;
                    this.dxetxtProdTypeName.Text = productType.ProdTypeName;
                    this.SetddlProdClass(productType.ProdClass);

                    this.dxebtnBottomSave.Enabled = true;
                }
            }
            else if (this._type == "product")
            {
                this.ProductTabPage.TabPages[0].Visible = false;
                this.ProductTabPage.TabPages[1].Visible = true;
                this.ProductTabPage.TabPages[2].Visible = true;

                if (this._action == "add")
                {//增加项目
                    this.pageTitle = "增加项目";
                    BusinessObjects.SchemaSetting.BO_ProductType productType = new BusinessObjects.SchemaSetting.BO_ProductType(this._ID);
                    this.dxetxtProdType.Text = productType.ProdTypeName == null ? "" : productType.ProdTypeName;

                    this.dxebtnBottomSave.Enabled = true;
                }
                else if (this._action == "edit")
                {//修改项目
                    this.pageTitle = "修改项目";
                    BusinessObjects.SchemaSetting.BO_Product product = new BusinessObjects.SchemaSetting.BO_Product(this._ID);
                    this.dxetxtProdType.Text = product.ProdTypeName;
                    this.dxetxtProdID.Text = product.ProdID;
                    this.dxetxtProdName.Text = product.ProdName;
                    this.dxetxtPremiumRate.Text = product.PremiumRate.ToString();
                    this.dxetxtProcRate.Text = product.ProcRate.ToString();
                    this.chkFlagMain.Checked = Convert.ToBoolean(product.FlagMain);
                    this.txtRemark.Text = product.Remark;
                    this.txtBrief.Text = product.Brief;

                    this.dxebtnBottomSave.Enabled = true;
                }
            }
        }

        /// <summary>
        /// 设置行业分类
        /// </summary>
        private void SetddlProdClass(string value)
        {
            DataSet dsList = BusinessObjects.SchemaSetting.BO_ProductType.GetProdClassList("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlProdClass.Items.Add(row["ProdClassName"].ToString().Trim(), row["ProdClassNo"].ToString().Trim());
                }
                this.dxeddlProdClass.SelectedIndex = this.dxeddlProdClass.Items.IndexOf(this.dxeddlProdClass.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 保存险种/项目信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxebtnBottomSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (this._type == "producttype")
                {
                    this.lblerrmsg.Visible = false;
                    if (this._action == "add")
                    {//增加险种
                        if (BusinessObjects.SchemaSetting.BO_ProductType.IfExistsProdTypeID(this.dxetxtProdTypeID.Text.Trim()))
                        {
                            this.lblerrmsg.InnerText = "该险种编号已存在。";
                            this.lblerrmsg.Visible = true;
                            return;
                        }

                        BusinessObjects.SchemaSetting.BO_ProductType productType = new BusinessObjects.SchemaSetting.BO_ProductType();
                        productType.ProdTypeID = this.dxetxtProdTypeID.Text.Trim();
                        productType.ProdClass = this.dxeddlProdClass.SelectedItem.Value.ToString();
                        productType.ProdTypeName = this.dxetxtProdTypeName.Text.Trim();
                        if (this._ID == "l0")
                        {
                            productType.ParentId = "";
                            productType.Layer = 1;
                        }
                        else
                        {
                            productType.ParentId = this._ID;
                            productType.Layer = BusinessObjects.SchemaSetting.BO_ProductType.GetLayerByProdTypeID(this._ID) + 1;
                        }
                        productType.Save(ModifiedAction.Insert);

                        this.Response.Redirect("ProductType.aspx?type=" + this._type + "&action=" + this._action + "&ID=" + this._ID);
                    }
                    else if (this._action == "edit")
                    {//修改险种
                        if (this._ID != this.dxetxtProdTypeID.Text.Trim() &&
                            BusinessObjects.SchemaSetting.BO_ProductType.IfExistsProdTypeID(this.dxetxtProdTypeID.Text.Trim()))
                        {
                            this.lblerrmsg.InnerText = "该险种编号已存在。";
                            this.lblerrmsg.Visible = true;
                            return;
                        }

                        BusinessObjects.SchemaSetting.BO_ProductType productType = new BusinessObjects.SchemaSetting.BO_ProductType();
                        productType.NewProdTypeID = this.dxetxtProdTypeID.Text.Trim();
                        productType.ProdTypeID = this._ID;
                        productType.ProdClass = this.dxeddlProdClass.SelectedItem.Value.ToString();
                        productType.ProdTypeName = this.dxetxtProdTypeName.Text.Trim();
                        productType.Save(ModifiedAction.Update);

                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language=\"javascript\">alert(\"修改完成。\");window.close();</script>", false);
                    }
                }
                else if (this._type == "product")
                {
                    this.lblerrmsg2.Visible = false;
                    if (this._action == "add")
                    {//增加项目
                        if (BusinessObjects.SchemaSetting.BO_Product.IfExistsProdID(this.dxetxtProdID.Text.Trim()))
                        {
                            this.lblerrmsg2.InnerText = "该项目编号已存在。";
                            this.lblerrmsg2.Visible = true;
                            this.ProductTabPage.ActiveTabIndex = 1;
                            return;
                        }

                        if (!this.IsDecimalValue(this.dxetxtPremiumRate.Text.Trim()))
                        {
                            this.lblerrmsg2.InnerText = "保费费率不正确。";
                            this.lblerrmsg2.Visible = true;
                            this.ProductTabPage.ActiveTabIndex = 1;
                            return;
                        }

                        if (!this.IsDecimalValue(this.dxetxtProcRate.Text.Trim()))
                        {
                            this.lblerrmsg2.InnerText = "经纪费率不正确。";
                            this.lblerrmsg2.Visible = true;
                            this.ProductTabPage.ActiveTabIndex = 1;
                            return;
                        }

                        BusinessObjects.SchemaSetting.BO_Product product = new BusinessObjects.SchemaSetting.BO_Product();
                        product.ProdID = this.dxetxtProdID.Text.Trim();
                        product.ProdName = this.dxetxtProdName.Text.Trim();
                        product.ProdTypeID = this._ID;
                        product.Brief = this.txtBrief.Text.Trim();
                        product.PremiumRate = Convert.ToDecimal(this.dxetxtPremiumRate.Text.Trim());
                        product.FlagMain = this.chkFlagMain.Checked;
                        product.Remark = this.txtRemark.Text.Trim();
                        product.ProcRate = Convert.ToDecimal(this.dxetxtProcRate.Text.Trim());
                        product.Save(ModifiedAction.Insert);

                        this.Response.Redirect("ProductType.aspx?type=" + this._type + "&action=" + this._action + "&ID=" + this._ID);
                    }
                    else if (this._action == "edit")
                    {//修改项目
                        if (this._ID != this.dxetxtProdID.Text.Trim() &&
                            BusinessObjects.SchemaSetting.BO_Product.IfExistsProdID(this.dxetxtProdID.Text.Trim()))
                        {
                            this.lblerrmsg2.InnerText = "该项目编号已存在。";
                            this.lblerrmsg2.Visible = true;
                            this.ProductTabPage.ActiveTabIndex = 1;
                            return;
                        }

                        if (!this.IsDecimalValue(this.dxetxtPremiumRate.Text.Trim()))
                        {
                            this.lblerrmsg2.InnerText = "保费费率不正确。";
                            this.lblerrmsg2.Visible = true;
                            this.ProductTabPage.ActiveTabIndex = 1;
                            return;
                        }

                        if (!this.IsDecimalValue(this.dxetxtProcRate.Text.Trim()))
                        {
                            this.lblerrmsg2.InnerText = "经纪费率不正确。";
                            this.lblerrmsg2.Visible = true;
                            this.ProductTabPage.ActiveTabIndex = 1;
                            return;
                        }

                        BusinessObjects.SchemaSetting.BO_Product product = new BusinessObjects.SchemaSetting.BO_Product();
                        product.NewProdID = this.dxetxtProdID.Text.Trim();
                        product.ProdID = this._ID;
                        product.ProdName = this.dxetxtProdName.Text.Trim();
                        product.Brief = this.txtBrief.Text.Trim();
                        product.PremiumRate = Convert.ToDecimal(this.dxetxtPremiumRate.Text.Trim());
                        product.FlagMain = this.chkFlagMain.Checked;
                        product.Remark = this.txtRemark.Text.Trim();
                        product.ProcRate = Convert.ToDecimal(this.dxetxtProcRate.Text.Trim());
                        product.Save(ModifiedAction.Update);

                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language=\"javascript\">alert(\"修改完成。\");window.close();</script>", false);
                    }
                }
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 判断是否是Decimal类型值
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private bool IsDecimalValue(string value)
        {
            if (string.IsNullOrEmpty(value))
                return false;
            decimal result = 0M;
            return Decimal.TryParse(value, out result);
        }
    }
}
