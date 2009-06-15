﻿using System;
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

namespace BrokerWebApp.CustomerRelation
{
    public partial class Customer : System.Web.UI.Page
    {
        #region 私有变量
        /// <summary>
        /// 客户编号
        /// </summary>
        private string _custID;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    if (Request.QueryString["custID"] != null && Request.QueryString["custID"].Trim().Length > 0)
                    {
                        this._custID = Request.QueryString["custID"].Trim();
                        this.ViewState["CustID"] = this._custID;
                    }

                    this.Initialization();
                }
                else
                {
                    if (this.ViewState["CustID"] != null && this.ViewState["CustID"].ToString().Length > 0)
                        this._custID = this.ViewState["CustID"].ToString();
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
            if (String.IsNullOrEmpty(this._custID))
            {//没有传入客户编号, 认为是新增客户
                this.customerDetailTabPage.TabPages[2].Visible = false;
                this.customerDetailTabPage.TabPages[3].Visible = false;
                this.customerDetailTabPage.TabPages[4].Visible = false;
                this.customerDetailTabPage.TabPages[5].Visible = false;
                //客户编号
                this.dxetxtCustID.Text = TranUtils.GetCustomerID();
                //所在地区
                this.SetddlArea("");
                //客户分类
                this.SetddlCustClassify("");
                //行业分类
                this.SetddlTradeType("");
                //部门
                this.SetddlDeprtment("");
                //客户经理
                this.SetddlSalesID("");
            }
            else
            {//编辑客户
                this.lblerrmsg.Visible = false;
                BO_Customer customer = BO_Customer.GetCustomerByID(this._custID);
                if (customer == null)
                {
                    this.lblerrmsg.InnerText = "没有取得该客户信息。";
                    this.lblerrmsg.Visible = true;
                    this.dxebtnBottomSave.Enabled = false;
                    return;
                }

                #region 客户资料
                if (customer.CustTypeID == 1)
                    this.radPerson.Checked = true;
                else
                    this.radUnit.Checked = true;
                this.dxetxtCustID.Text = customer.CustID;
                this.dxetxtCustID.Enabled = false;
                this.SetddlArea(customer.Area);
                this.dxetxtCustName.Text = customer.CustName;
                this.dxetxtAddress.Text = customer.Address;
                this.SetddlCustClassify(customer.CustClassifyID);
                this.dxetxtPostCode.Text = customer.PostCode;
                this.SetddlTradeType(customer.TradeTypeID);
                this.dxetxtIDNO.Text = customer.IDNO;
                this.dxetxtContact.Text = customer.Contact;
                this.dxetxtTel.Text = customer.Tel;
                this.SetddlDeprtment(customer.DeprtmentID);
                this.dxetxtMobile.Text = customer.Mobile;
                this.SetddlSalesID(customer.SalesID);
                #endregion

                #region 附加资料
                this.dxetxtMainOper.Text = customer.MainOper;
                this.dxetxtAssetSize.Text = customer.AssetSize;
                this.dxetxtMainProduct.Text = customer.MainProduct;
                this.txtBackground.Text = customer.Background;
                this.txtRisk.Text = customer.Risk;
                this.txtOtherInfo.Text = customer.OtherInfo;
                this.dxetxtRemark.Text = customer.Remark;
                #endregion

                #region 联系人
                this.gridContactItem.DataSource = BO_CustContact.GetCustContactByCustID(this._custID);
                this.gridContactItem.DataBind();
                #endregion



            }
        }

        /// <summary>
        /// 设置所在地区
        /// </summary>
        private void SetddlArea(string value)
        {
            DataSet dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.Area.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlArea.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
                this.dxeddlArea.SelectedIndex = this.dxeddlArea.Items.IndexOf(this.dxeddlArea.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 设置客户分类
        /// </summary>
        private void SetddlCustClassify(string value)
        {
            DataSet dsList = BusinessObjects.SchemaSetting.BO_Carrier.GetCustClassifyByID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlCustClassify.Items.Add(row["CustClassifyName"].ToString().Trim(), row["CustClassifyID"].ToString().Trim());
                }
                this.dxeddlCustClassify.SelectedIndex = this.dxeddlCustClassify.Items.IndexOf(this.dxeddlCustClassify.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 设置行业分类
        /// </summary>
        private void SetddlTradeType(string value)
        {
            DataSet dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.TradeName.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlTradeType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
                this.dxeddlTradeType.SelectedIndex = this.dxeddlTradeType.Items.IndexOf(this.dxeddlTradeType.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 设置部门
        /// </summary>
        private void SetddlDeprtment(string value)
        {
            DataSet dsList = BO_P_Department.GetDeptByDeptID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlDepartment.Items.Add(row["DeptName"].ToString().Trim(), row["DeptID"].ToString().Trim());
                }
                this.dxeddlDepartment.SelectedIndex = this.dxeddlDepartment.Items.IndexOf(this.dxeddlDepartment.Items.FindByValue(value));
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
        /// 保存客户信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxebtnBottomSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (String.IsNullOrEmpty(this._custID))
                {//新增客户
                    this.lblerrmsg.Visible = false;
                    if (BO_Customer.IfExistsCustID(this.dxetxtCustID.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "该客户编号已存在。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }
                    BO_Customer customer = new BO_Customer();
                    customer.CustID = this.dxetxtCustID.Text.Trim();
                    customer.CustName = this.dxetxtCustName.Text.Trim();
                    customer.TradeTypeID = this.dxeddlTradeType.SelectedItem.Value.ToString();
                    customer.Area = this.dxeddlArea.SelectedItem.Value.ToString();
                    customer.Address = this.dxetxtAddress.Text.Trim();
                    customer.PostCode = this.dxetxtPostCode.Text.Trim();
                    customer.CustTypeID = this.radPerson.Checked ? 1 : 0;
                    customer.DeprtmentID = this.dxeddlDepartment.SelectedItem.Value.ToString();
                    customer.SalesID = this.dxeddlSalesID.Value.ToString();
                    customer.CustClassifyID = this.dxeddlCustClassify.SelectedItem.Value.ToString();
                    customer.Tel = this.dxetxtTel.Text.Trim();
                    customer.Mobile = this.dxetxtMobile.Text.Trim();
                    customer.IDNO = this.dxetxtIDNO.Text.Trim();
                    customer.MainOper = this.dxetxtMainOper.Text.Trim();
                    customer.AssetSize = this.dxetxtAssetSize.Text.Trim();
                    customer.MainProduct = this.dxetxtMainProduct.Text.Trim();
                    customer.Background = this.txtBackground.Text.Trim();
                    customer.OtherInfo = this.txtOtherInfo.Text.Trim();
                    customer.Risk = this.txtRisk.Text.Trim();
                    customer.Remark = this.dxetxtRemark.Text.Trim();
                    customer.Contact = this.dxetxtContact.Text.Trim();
                    customer.Save(ModifiedAction.Insert);

                    this.Response.Redirect("Customer.aspx");
                }
            }
            catch (Exception ex)
            {
            }
        }

        #region 附加资料
        protected void UploadControl_AddInfoUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            try
            {
                e.CallbackData = SavePostedFiles(e.UploadedFile);
            }
            catch (Exception ex)
            {
                e.IsValid = false;
                e.ErrorText = ex.Message;
            }
        }
        #endregion

        #region 联系人
        protected void gridContactItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //
            string a = "1";
        }

        protected void gridContactItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //
            string a = "1";
        }

        protected void gridContactItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridContactItem.FindEditFormTemplateControl("tblgridContactItemEditorTemplate") as HtmlTable;
            string contactID = (tblEditorTemplate.FindControl("dxetxtContactID") as ASPxTextBox).Text.Trim();
            if (contactID.Length <= 0)
                throw new Exception("联系人编号不能为空。");

            if (BO_CustContact.IfExistsContactID(contactID))
                throw new Exception("联系人编号已经存在。");

            BO_CustContact custContact = new BO_CustContact();
            custContact.ContactID = contactID;
            custContact.ContactName = (tblEditorTemplate.FindControl("dxetxtContactName") as ASPxTextBox).Text.Trim();
            custContact.CustID = this._custID;
            custContact.Position = (tblEditorTemplate.FindControl("dxetxtPosition") as ASPxTextBox).Text.Trim();
            custContact.Sex = (tblEditorTemplate.FindControl("dxeddlSex") as ASPxComboBox).SelectedItem.Value.ToString();
            custContact.Tel = (tblEditorTemplate.FindControl("dxetxtTel") as ASPxTextBox).Text.Trim();
            custContact.Fax = (tblEditorTemplate.FindControl("dxetxtFax") as ASPxTextBox).Text.Trim();
            custContact.MobilePhone = (tblEditorTemplate.FindControl("dxetxtMobilePhone") as ASPxTextBox).Text.Trim();
            custContact.Email = (tblEditorTemplate.FindControl("dxetxtEmail") as ASPxTextBox).Text.Trim();
            custContact.Interest = (tblEditorTemplate.FindControl("txtInterest") as TextBox).Text.Trim();
            custContact.Remark = (tblEditorTemplate.FindControl("txtRemark") as TextBox).Text.Trim();
            custContact.Save(ModifiedAction.Insert);

            e.Cancel = true;
            this.gridContactItem.CancelEdit();
            this.gridContactItem.DataSource = BO_CustContact.GetCustContactByCustID(this._custID);
            this.gridContactItem.DataBind();
        }

        protected void gridContactItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //
            string a = "1";
        }

        protected void gridContactItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //
            string a = "1";
        }

        protected void gridContactItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
            string a = "1";
        }
        #endregion

        #region 销售跟进
        protected void gridCustomerPtItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //
        }

        protected void gridCustomerPtItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //
        }

        protected void gridCustomerPtItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //
        }

        protected void gridCustomerPtItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //
        }

        protected void gridCustomerPtItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //
        }

        protected void gridCustomerPtItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
        }

        protected void UploadControl_CustomerPTUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            try
            {
                e.CallbackData = SavePostedFiles(e.UploadedFile);
            }
            catch (Exception ex)
            {
                e.IsValid = false;
                e.ErrorText = ex.Message;
            }
        }
        #endregion

        #region 签单记录
        private void GetPolicyForGrid()
        {
            //
        }
        #endregion

        protected string SavePostedFiles(UploadedFile uploadedFile)
        {
            string ret = "";
            if (uploadedFile.IsValid)
            {
                //FileInfo fileInfo = new FileInfo(uploadedFile.FileName);
                //string resFileName = MapPath(UploadDirectory) + fileInfo.Name;
                //uploadedFile.SaveAs(resFileName);

                //string fileLabel = fileInfo.Name;
                //string fileType = uploadedFile.PostedFile.ContentType.ToString();
                //string fileLength = uploadedFile.PostedFile.ContentLength / 1024 + "K";
                //ret = string.Format("{0} <i>({1})</i> {2}|{3}", fileLabel, fileType, fileLength, fileInfo.Name);
            }
            return ret;
        }

        /// <summary>
        /// 取得性别编号
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        protected int GetSexIndex(object obj)
        {
            if (obj == null || obj.ToString() == "男")
                return 0;
            else
                return 1;
        }
    }
}
