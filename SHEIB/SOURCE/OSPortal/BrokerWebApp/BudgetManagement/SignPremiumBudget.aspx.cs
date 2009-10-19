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

namespace BrokerWebApp.BudgetManagement
{
    public partial class SignPremiumBudget : System.Web.UI.Page
    {
        #region 私有变量
        /// <summary>
        /// 预算编号
        /// </summary>
        private int _signPremiumBudgetID;
        private string toadd = string.Empty;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    if (Request.QueryString["SignPremiumBudgetID"] != null && Request.QueryString["SignPremiumBudgetID"].Trim().Length > 0)
                    {
                        this._signPremiumBudgetID = Convert.ToInt32(Request.QueryString["SignPremiumBudgetID"]);
                        this.ViewState["SignPremiumBudgetID"] = this._signPremiumBudgetID;
                    }
                    this.BindProdTypeName();
                    this.Initialization();
                }
                else
                {
                    if (this.ViewState["SignPremiumBudgetID"] != null && this.ViewState["SignPremiumBudgetID"].ToString().Length > 0)
                        this._signPremiumBudgetID = Convert.ToInt32(this.ViewState["SignPremiumBudgetID"]);
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
            if (this._signPremiumBudgetID <= 0)
            {
                //客户经理
                this.SetddlSalesID("");
                //业务类型
                this.dxeddlOperationType.SelectedIndex = 0;
                //保单类别
                this.SetddlPremiumType("");

            }
            else
            {
                this.lblerrmsg.Visible = false;
                BusinessObjects.Budget.BO_SignPremiumBudget signPremiumBudget = new BusinessObjects.Budget.BO_SignPremiumBudget(this._signPremiumBudgetID);
                if (signPremiumBudget.SignPremiumBudgetID <= 0)
                {
                    this.lblerrmsg.InnerText = "没有取得该预算管理信息。";
                    this.lblerrmsg.Visible = true;
                    this.dxebtnBottomSave.Enabled = false;
                    return;
                }
                this.dxetxtCustName.Text = signPremiumBudget.CustName;
                this.hidCustID.Value = signPremiumBudget.CustomerID;
                this.SetddlSalesID(signPremiumBudget.SalesID);
                //this.dxetxtProdTypeID.Text = signPremiumBudget.ProdTypeName;

                this.dxeddlProdTypeName.SelectedIndex = this.dxeddlProdTypeName.Items.IndexOf(this.dxeddlProdTypeName.Items.FindByValue(signPremiumBudget.ProdTypeID));
                if (this.dxeddlProdTypeName.SelectedIndex >= 0)
                    this.dxeddlProdTypeName.Text = this.dxeddlProdTypeName.SelectedItem.Text.Substring(this.dxeddlProdTypeName.SelectedItem.Text.IndexOf("∟") + 1);
                this.ptid.Value = signPremiumBudget.ProdTypeID;
                this.dxeddlOperationType.SelectedIndex = this.dxeddlOperationType.Items.IndexOf(this.dxeddlOperationType.Items.FindByValue(signPremiumBudget.OperationType));
                this.dxetxtNY.Text = signPremiumBudget.NY;
                this.SetddlPremiumType(signPremiumBudget.PremiumType);
                this.dxetxtPremiumBudget.Text = signPremiumBudget.PremiumBudget.ToString();
                this.dextxtProcessBudget.Text = signPremiumBudget.ProcessBudget.ToString();
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

        /// <summary>
        /// 设置保单类别
        /// </summary>
        private void SetddlPremiumType(string value)
        {
            DataSet dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.PremiumType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlPremiumType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
                this.dxeddlPremiumType.SelectedIndex = this.dxeddlPremiumType.Items.IndexOf(this.dxeddlPremiumType.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 保存预算管理
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxebtnBottomSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (this._signPremiumBudgetID <= 0)
                {//新增预算管理
                    this.lblerrmsg.Visible = false;
                    if (!this.IsDoubleValue(this.dxetxtPremiumBudget.Text))
                    {
                        this.lblerrmsg.InnerText = "保费预算不正确。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }
                    if (!this.IsDoubleValue(this.dextxtProcessBudget.Text))
                    {
                        this.lblerrmsg.InnerText = "佣金预算不正确。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    BusinessObjects.Budget.BO_SignPremiumBudget signPremiumBudget = new BusinessObjects.Budget.BO_SignPremiumBudget();
                    signPremiumBudget.SalesID = this.dxeddlSalesID.Value.ToString();
                    signPremiumBudget.CustomerID = this.hidCustID.Value;
                    signPremiumBudget.ProdTypeID = ptid.Value;
                    signPremiumBudget.OperationType = this.dxeddlOperationType.Value.ToString();
                    signPremiumBudget.PremiumBudget = Convert.ToDouble(this.dxetxtPremiumBudget.Text);
                    signPremiumBudget.ProcessBudget = Convert.ToDouble(this.dextxtProcessBudget.Text);
                    signPremiumBudget.NY = this.dxetxtNY.Text.Trim();
                    signPremiumBudget.PremiumType = this.dxeddlPremiumType.Value.ToString();
                    signPremiumBudget.Save(ModifiedAction.Insert);

                    this.Response.Redirect("SignPremiumBudget.aspx");
                }
                else
                {//修改预算管理
                    if (!this.IsDoubleValue(this.dxetxtPremiumBudget.Text))
                    {
                        this.lblerrmsg.InnerText = "保费预算不正确。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }
                    if (!this.IsDoubleValue(this.dextxtProcessBudget.Text))
                    {
                        this.lblerrmsg.InnerText = "佣金预算不正确。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    BusinessObjects.Budget.BO_SignPremiumBudget signPremiumBudget = new BusinessObjects.Budget.BO_SignPremiumBudget();
                    signPremiumBudget.SignPremiumBudgetID = this._signPremiumBudgetID;
                    signPremiumBudget.SalesID = this.dxeddlSalesID.Value.ToString();
                    signPremiumBudget.CustomerID = this.hidCustID.Value;
                    signPremiumBudget.ProdTypeID = ptid.Value;
                    signPremiumBudget.OperationType = this.dxeddlOperationType.Value.ToString();
                    signPremiumBudget.PremiumBudget = Convert.ToDouble(this.dxetxtPremiumBudget.Text);
                    signPremiumBudget.ProcessBudget = Convert.ToDouble(this.dextxtProcessBudget.Text);
                    signPremiumBudget.NY = this.dxetxtNY.Text.Trim();
                    signPremiumBudget.PremiumType = this.dxeddlPremiumType.Value.ToString();
                    signPremiumBudget.Save(ModifiedAction.Update);

                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language=\"javascript\">alert(\"修改完成。\");window.close();</script>", false);
                }
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 判断是否是Double类型值
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private bool IsDoubleValue(string value)
        {
            if (string.IsNullOrEmpty(value))
                return false;
            double result = 0;
            return Double.TryParse(value, out result);
        }


        private void BindProdTypeName()
        {
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

    }
}
