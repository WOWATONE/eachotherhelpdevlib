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
using DevExpress.Web.ASPxGridView;
using BusinessObjects.Consult;
using System.Runtime.Serialization;
using System.IO;
using System.Text;
using System.Runtime.Serialization.Json;

namespace BrokerWebApp.BusinessConsult
{
    public partial class BusinessConsult : BasePage
    {
        #region 私有变量
        /// <summary>
        /// 咨询号
        /// </summary>
        private string _consultFeeID;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {

                    if (Request.QueryString["ConsultFeeID"] != null && Request.QueryString["ConsultFeeID"].Trim().Length > 0)
                    {
                        this._consultFeeID = Request.QueryString["ConsultFeeID"].Trim();
                        this.ViewState["ConsultFeeID"] = this._consultFeeID;
                    }

                    this.Initialization();

                    CheckPermission();
                }
                else
                {
                    if (this.ViewState["ConsultFeeID"] != null && this.ViewState["ConsultFeeID"].ToString().Length > 0)
                        this._consultFeeID = this.ViewState["ConsultFeeID"].ToString();
                }

                CheckPermission();

                this.gridConsultFeeItem.DataSource = BusinessObjects.Consult.BO_ConsultFeeItem.GetConsultFeeItemByConsultFeeID(this._consultFeeID);
                this.gridConsultFeeItem.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        private void CheckPermission()
        {
            if (!this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.BusinessConsultList_Audit))
            {
                dxebtnConsultCommit.ClientEnabled = false;
            }

            if (!this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.BusinessConsultList_Modify))
            {
                dxebtnBottomSave.ClientEnabled = false;
            }
        }

        private void RebindgridConsultFeeItem()
        {
            this.gridConsultFeeItem.DataSource = BusinessObjects.Consult.BO_ConsultFeeItem.GetConsultFeeItemByConsultFeeID(this.dxetxtConsultFeeID.Text);
            this.gridConsultFeeItem.DataBind();
        }
        /// <summary>
        /// 初始化控件
        /// </summary>
        private void Initialization()
        {
            if (String.IsNullOrEmpty(this._consultFeeID))
            {//没有传入咨询号, 认为是新增咨询
                //咨询日期
                this.deConsultDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
                //客户经理
                this.SetddlSalesID("");
                //收费人
                this.SetddlFeePersion("");
                //制单人
                this.SetddlCreatePerson(this.CurrentUserID);
                //ListEditItem theselected = dxeddlCreatePerson.Items.FindByValue(this.CurrentUserID);
                //if (theselected != null)
                //{
                //    dxeddlCreatePerson.SelectedItem = theselected;
                //}

                //审核人
                this.SetddlAuditPerson("");
                //制单时间
                this.deCreateTime.Text = DateTime.Today.ToString("yyyy-MM-dd");
            }
            else
            {//编辑咨询
                this.lblerrmsg.Visible = false;
                BusinessObjects.Consult.BO_ConsultFee consultFee = BusinessObjects.Consult.BO_ConsultFee.GetConsultFeeByID(this._consultFeeID);
                if (consultFee == null)
                {
                    this.lblerrmsg.InnerText = "没有咨询费信息。";
                    this.lblerrmsg.Visible = true;
                    this.dxebtnBottomSave.Enabled = false;
                    this.dxebtnConsultCommit.Enabled = false;
                    return;
                }

                #region 基本信息
                this.dxetxtConsultFeeNo.Text = consultFee.ConsultFeeNo;
                this.deConsultDate.Text = consultFee.ConsultDate.ToString("yyyy-MM-dd");
                this.dxetxtConsultFeeID.Text = consultFee.ConsultFeeID;
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
                //this.gridConsultFeeItem.DataSource = BusinessObjects.Consult.BO_ConsultFeeItem.GetConsultFeeItemByConsultFeeID(this._consultFeeID);
                //this.gridConsultFeeItem.DataBind();
                this.dxetxtInvoiceNO.Text = consultFee.InvoiceNO;
                #endregion

                #region 收费信息
                this.SetddlFeePersion(consultFee.FeePersion);
                this.deFeeDate.Text = consultFee.FeeDate.ToString("yyyy-MM-dd");
                #endregion

                #region 其他
                this.SetddlCreatePerson(consultFee.CreatePerson);
                this.deCreateTime.Text = consultFee.CreateTime.ToString("yyyy-MM-dd");
                this.SetddlAuditPerson(consultFee.AuditPerson);
                this.deAuditTime.Text = consultFee.AuditTime.ToString("yyyy-MM-dd");


                if (consultFee.AuditStatus == "1")
                {                  
                    dxebtnConsultCommit.Text = "反审核";
                   //dxebtnBottomSave.ClientEnabled = false;
                }
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

        /// <summary>
        /// 设置收费人
        /// </summary>
        private void SetddlFeePersion(string value)
        {
            DataSet dsList = BO_P_User.GetUserByUserID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlFeePersion.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
                }
                this.dxeddlFeePersion.SelectedIndex = this.dxeddlFeePersion.Items.IndexOf(this.dxeddlFeePersion.Items.FindByValue(value));
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
                //ListEditItem theselected = dxeddlCreatePerson.Items.FindByValue(value);
                //if (theselected != null)
                //{
                //    dxeddlCreatePerson.SelectedItem = theselected;
                //} 
                this.dxeddlCreatePerson.SelectedIndex = this.dxeddlCreatePerson.Items.IndexOf(this.dxeddlCreatePerson.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 设置审核人
        /// </summary>
        private void SetddlAuditPerson(string value)
        {
            DataSet dsList = BO_P_User.GetUserByUserID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlAuditPerson.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
                }
                this.dxeddlAuditPerson.SelectedIndex = this.dxeddlAuditPerson.Items.IndexOf(this.dxeddlAuditPerson.Items.FindByValue(value));
            }
        }

        protected void gridConsultFeeItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridConsultFeeItem.FindEditFormTemplateControl("tblgridContactItemEditorTemplate") as HtmlTable;
            string consultFeeItemID = (tblEditorTemplate.FindControl("dxetxtConsultFeeItemID") as ASPxTextBox).Text.Trim();
            if (consultFeeItemID.Length <= 0)
                throw new Exception("咨询项目编号不能为空。");

            if(!e.Keys["ConsultFeeItemID"].ToString().Equals(consultFeeItemID) &&
                BusinessObjects.Consult.BO_ConsultFeeItem.IfExistsConsultFeeItemID(consultFeeItemID))
                throw new Exception("咨询项目编号已经存在。");

            string ConsultFeeItem = (tblEditorTemplate.FindControl("dxetxtConsultFeeItem") as ASPxTextBox).Text.Trim();
            double consultFee = 0;
            try
            {
                consultFee = Convert.ToDouble((tblEditorTemplate.FindControl("dxetxtConsultFee") as ASPxTextBox).Text);
            }
            catch (Exception)
            {
                throw new Exception("咨询费必须输入数字。");
            }
            

            //保存到咨询项目
            BusinessObjects.Consult.BO_ConsultFeeItem consultFeeItem = new BusinessObjects.Consult.BO_ConsultFeeItem();
            consultFeeItem.ConsultFeeItemID = consultFeeItemID;
            consultFeeItem.ConsultFeeID = _consultFeeID;
            consultFeeItem.ConsultFeeItem = ConsultFeeItem;
            consultFeeItem.ConsultFee = consultFee;
            consultFeeItem.Save(ModifiedAction.Update);
       

            e.Cancel = true;
            this.gridConsultFeeItem.CancelEdit();

            RebindgridConsultFeeItem();
            
        }

        protected void gridConsultFeeItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //
        }

        protected void gridConsultFeeItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridConsultFeeItem.FindEditFormTemplateControl("tblgridContactItemEditorTemplate") as HtmlTable;

            string ConsultFeeItem = (tblEditorTemplate.FindControl("dxetxtConsultFeeItem") as ASPxTextBox).Text.Trim();
            double consultFee = 0;
            try
            {
                consultFee = Convert.ToDouble((tblEditorTemplate.FindControl("dxetxtConsultFee") as ASPxTextBox).Text);
            }
            catch (Exception)
            {
                throw new Exception("咨询费必须输入数字。");
            }

            //保存到咨询项目   
            BusinessObjects.Consult.BO_ConsultFeeItem consultFeeItem = new BusinessObjects.Consult.BO_ConsultFeeItem();
            consultFeeItem.ConsultFeeID = dxetxtConsultFeeID.Text;
            consultFeeItem.ConsultFeeItem = ConsultFeeItem;
            consultFeeItem.ConsultFee = consultFee;
            consultFeeItem.Save(ModifiedAction.Insert);
       

            e.Cancel = true;
            this.gridConsultFeeItem.CancelEdit();


            RebindgridConsultFeeItem();
        }

        protected void gridConsultFeeItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //
        }

        protected void gridConsultFeeItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            string key = e.Keys[0].ToString();


            BusinessObjects.Consult.BO_ConsultFeeItem consultFeeItem = new BusinessObjects.Consult.BO_ConsultFeeItem();
            consultFeeItem.delete(key);
            

            e.Cancel = true;
            this.gridConsultFeeItem.CancelEdit();

            RebindgridConsultFeeItem();
        }

        protected void gridConsultFeeItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
        }

        protected void dxeDeleteConsultFeeItemCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            string key = e.Parameter;

            //保存到咨询项目
            BusinessObjects.Consult.BO_ConsultFeeItem consultFeeItem = new BusinessObjects.Consult.BO_ConsultFeeItem();
            consultFeeItem.delete(key);
            e.Result = "ok";

         }


        protected void gridConsultFeeItem_CallBack(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            RebindgridConsultFeeItem();
        }
        /// <summary>
        /// 保存咨询信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxeConsultSave_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(this.dxetxtConsultFeeID.Text))
                {//新增咨询
                    this.lblerrmsg.Visible = false;
                    if (BusinessObjects.Consult.BO_ConsultFee.IfExistsConsultFeeNo(this.dxetxtConsultFeeNo.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "该咨询号已存在。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    //保存到咨询费
                    BusinessObjects.Consult.BO_ConsultFee consultFee = new BusinessObjects.Consult.BO_ConsultFee();
                    consultFee.ConsultFeeID = TranUtils.GetConsultFeeID();
                    _consultFeeID = consultFee.ConsultFeeID;
                    consultFee.ConsultFeeNo = this.dxetxtConsultFeeNo.Text.Trim();
                    consultFee.ConsultDate = Convert.ToDateTime(this.deConsultDate.Text);
                    consultFee.SalesID = this.dxeddlSalesID.SelectedItem.Value.ToString();
                    consultFee.CustID = this.hidCustID.Value;
                    consultFee.Contact = this.dxetxtContact.Text.Trim();
                    consultFee.Tel = this.dxetxtTel.Text.Trim();
                    //consultFee.ConsultFee = Convert.ToDouble(((DataTable)this.Session["ConsultFeeGridData"]).Compute("sum(ConsultFee)", "1=1"));
                    consultFee.ConsultFee = 0;
                    consultFee.InvoiceNO = this.dxetxtInvoiceNO.Text.Trim();
                    if (this.deAuditTime.Text.Trim().Length > 0)
                        consultFee.AuditTime = Convert.ToDateTime(this.deAuditTime.Text.Trim());
                    if (this.dxeddlAuditPerson.SelectedIndex>=0 &&
                        this.dxeddlAuditPerson.SelectedItem.Value.ToString().Length > 0)
                        consultFee.AuditPerson = this.dxeddlAuditPerson.SelectedItem.Value.ToString();
                    consultFee.CreateTime = DateTime.Now;
                    if (this.dxeddlCreatePerson.SelectedItem.Value.ToString().Length > 0)
                        consultFee.CreatePerson = this.dxeddlCreatePerson.SelectedItem.Value.ToString();
                    consultFee.ModifyTime = DateTime.Now;
                    consultFee.ModifyPerson = "";
                    consultFee.FeeDate = Convert.ToDateTime(this.deFeeDate.Text);
                    if (this.dxeddlFeePersion.SelectedItem.Value.ToString().Length > 0)
                        consultFee.FeePersion = this.dxeddlFeePersion.SelectedItem.Value.ToString();
                    this.dxetxtConsultFeeID.Text = consultFee.ConsultFeeID;
                    consultFee.Save(ModifiedAction.Insert);
                    e.Result = consultFee.ConsultFeeID;
                    //this.Response.Redirect("BusinessConsult.aspx");
                }
                else
                {
                    this.lblerrmsg.Visible = false;

                    if (!BusinessObjects.Consult.BO_ConsultFee.GetConsultFeeNoByConsultFeeID(this._consultFeeID).Equals(this.dxetxtConsultFeeNo.Text.Trim()) &&
                        BusinessObjects.Consult.BO_ConsultFee.IfExistsConsultFeeNo(this.dxetxtConsultFeeNo.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "该咨询号已存在。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }


                    //保存到咨询费
                    BusinessObjects.Consult.BO_ConsultFee consultFee = new BusinessObjects.Consult.BO_ConsultFee();
                    consultFee.ConsultFeeID = this._consultFeeID;
                    consultFee.ConsultFeeNo = this.dxetxtConsultFeeNo.Text.Trim();
                    consultFee.ConsultDate = Convert.ToDateTime(this.deConsultDate.Text);
                    consultFee.SalesID = this.dxeddlSalesID.SelectedItem.Value.ToString();
                    consultFee.CustID = this.hidCustID.Value;
                    consultFee.Contact = this.dxetxtContact.Text.Trim();
                    consultFee.Tel = this.dxetxtTel.Text.Trim();
                    consultFee.ConsultFee = 0;
                    consultFee.InvoiceNO = this.dxetxtInvoiceNO.Text.Trim();
                    if (this.deAuditTime.Text.Trim().Length > 0)
                        consultFee.AuditTime = Convert.ToDateTime(this.deAuditTime.Text.Trim());
                    if (this.dxeddlAuditPerson.SelectedIndex >= 0 &&
                        this.dxeddlAuditPerson.SelectedItem.Value.ToString().Length > 0)
                        consultFee.AuditPerson = this.dxeddlAuditPerson.SelectedItem.Value.ToString();
                    consultFee.CreateTime = DateTime.Now;
                    if (this.dxeddlCreatePerson.SelectedItem.Value.ToString().Length > 0)
                        consultFee.CreatePerson = this.dxeddlCreatePerson.SelectedItem.Value.ToString();
                    consultFee.ModifyTime = DateTime.Now;
                    consultFee.ModifyPerson = "";
                    consultFee.FeeDate = Convert.ToDateTime(this.deFeeDate.Text);
                    if (this.dxeddlFeePersion.SelectedItem.Value.ToString().Length > 0)
                        consultFee.FeePersion = this.dxeddlFeePersion.SelectedItem.Value.ToString();
                    consultFee.Save(ModifiedAction.Update);
                    e.Result = consultFee.ConsultFeeID;
                    //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language=\"javascript\">alert(\"修改完成。\");window.close();</script>", false);
                }
            }
            catch (Exception ex)
            {
                //throw ex.Message;
                e.Result = ex.Message;                

            }
        }

        /// <summary>
        /// 保存审核信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        protected void dxeConsultCommit_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String json = e.Parameter;
            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(ConsultFeeInfo));

            ConsultFeeInfo theJosn;
            theJosn = (ConsultFeeInfo)serializer.ReadObject(ms);
            ms.Close();
            try
            {
                BO_ConsultFee.Commit(theJosn.ConsultFeeID, theJosn.AuditPerson, theJosn.AuditTime, theJosn.AuditStatus);

                //BO_ConsultFee.Commit(theJosn.ConsultFeeID, this.CurrentUserID.ToString(), DateTime.Now, theJosn.AuditStatus);


                switch (theJosn.AuditStatus)
                {
                    case "1":
                        e.Result = "CommitOk";
                        break;
                    case "0":
                        e.Result = "UnCommitOk";
                        break;
                    default:
                        e.Result = "ok";
                        break;
                }
                
            }
            catch (Exception)
            {

                e.Result = "false";
            }    
            

            
        }



        [DataContract(Namespace = "http://www.sheib.com")]
        public class ConsultFeeInfo
        {
            public ConsultFeeInfo()
            { }

            [DataMember]
            public string AuditStatus { get; set; }

            [DataMember]
            public string ConsultFeeID { get; set; }

            [DataMember]
            public string AuditPerson { get; set; }

            [DataMember]
            public DateTime AuditTime { get; set; }

        }

    }
}
