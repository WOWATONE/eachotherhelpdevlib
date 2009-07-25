﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Drawing;
using System.IO;
using System.Text;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;
using System.Web.UI.HtmlControls;

namespace BrokerWebApp.inoutbalance
{
    public partial class FeeCustomerAdd : BasePage
    {

        #region Variables

        private const string inputQueryStringIDKey = "VoucherID";
        private Boolean gridPolicyItemStartEdit = false;
        
        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {           
            if (!IsPostBack && !IsCallback)
            {
                init();
                this.lblVoucherId.InnerHtml = Page.Request.QueryString[inputQueryStringIDKey];
                loadValue(this.lblVoucherId.InnerHtml);
            }
            BindGrid();
            
        }

        private void init()
        {
            dxetxtPayFee.BackColor = Color.LightGray;
            dxetxtFeeAdjust.BackColor = Color.LightGray;
            dxetxtFee.BackColor = Color.LightGray;
            dxetxtCiPremium.BackColor = Color.LightGray;
            dxetxtAciPremium.BackColor = Color.LightGray;
            dxetxtCstPremium.BackColor = Color.LightGray;

            dxetxtPayFee.ReadOnly = true;
            dxetxtFeeAdjust.ReadOnly = true;
            dxetxtFee.ReadOnly = true;
            dxetxtCiPremium.ReadOnly = true;
            dxetxtAciPremium.ReadOnly = true;
            dxetxtCstPremium.ReadOnly = true;

        }



        protected void dxeSaveCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String thenoticeNo = saveVoucher(e.Parameter);
            e.Result = thenoticeNo;
        }


        protected void dxeAuditCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            auditVoucher(e.Parameter);
            e.Result = "ok";
        }

        protected void gridPolicyItem_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxTextBox dxetxtPolicyItemFee = tblEditorTemplate.FindControl("dxetxtPolicyItemFee") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemFeeAdjust = tblEditorTemplate.FindControl("dxetxtPolicyItemFeeAdjust") as ASPxTextBox;
            

            Int32 editIndex = this.gridPolicyItem.EditingRowVisibleIndex;
            if (editIndex > -1)
            {
                object theValues = this.gridPolicyItem.GetRowValues(editIndex, new String[] { "FeeId", "NoticeNo", "PolicyID", "Fee", "FeeAdjust" });
                object[] theValueList = theValues as object[];

                //String feeId = theValueList[0].ToString();
                String fee = theValueList[3].ToString();
                String feeAdjust = theValueList[4].ToString();
                
                if (this.gridPolicyItemStartEdit)
                {
                    dxetxtPolicyItemFee.Text = fee;
                    dxetxtPolicyItemFeeAdjust.Text = feeAdjust;
                }

            }

        }

        protected void gridPolicyItem_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            this.gridPolicyItemStartEdit = true;
        }

        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            String theKey = e.Keys[0].ToString();
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxTextBox dxetxtPolicyItemFee = tblEditorTemplate.FindControl("dxetxtPolicyItemFee") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemFeeAdjust = tblEditorTemplate.FindControl("dxetxtPolicyItemFeeAdjust") as ASPxTextBox;


            BusinessObjects.BO_Fee newobj = new BusinessObjects.BO_Fee(theKey);


            if (dxetxtPolicyItemFee.Text != String.Empty)
            {
                newobj.Fee = Convert.ToDecimal(dxetxtPolicyItemFee.Text);
            }
            if (dxetxtPolicyItemFeeAdjust.Text != String.Empty)
            {
                newobj.FeeAdjust = Convert.ToDecimal(dxetxtPolicyItemFeeAdjust.Text);
            }
            

            try
            {
                newobj.Save(ModifiedAction.Update);
            }
            catch (Exception ex)
            {
                throw ex;
            }


            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();

            BindGrid();

        }

        protected void gridPolicyItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String theKey = e.Keys[0].ToString();

            try
            {
                BusinessObjects.BO_Fee.Delete(theKey);
                
            }
            catch (Exception ex)
            {
                throw ex;
            }

            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
            BindGrid();
        }

        protected void gridPolicyItem_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            
            String appendDes = "必需项";
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxTextBox dxetxtPolicyItemFee = tblEditorTemplate.FindControl("dxetxtPolicyItemFee") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemFeeAdjust = tblEditorTemplate.FindControl("dxetxtPolicyItemFeeAdjust") as ASPxTextBox;


            if (String.IsNullOrEmpty(dxetxtPolicyItemFee.Text.Trim()))
            {
                e.Errors[this.gridPolicyItem.Columns[0]] = appendDes;
            }

            if (String.IsNullOrEmpty(dxetxtPolicyItemFeeAdjust.Text.Trim()))
            {
                e.Errors[this.gridPolicyItem.Columns[1]] = appendDes;
            }

            dxetxtPolicyItemFee.Validate();
            dxetxtPolicyItemFeeAdjust.Validate();

            if (string.IsNullOrEmpty(e.RowError) && e.Errors.Count > 0) e.RowError = "请修正所有的错误(" + appendDes + ")。";

        }
     

        protected void gridPolicyItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
            
        }

        protected void gridPolicyItem_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            BindGrid();
        }

        private void BindGrid()
        {
            string sVocherID = "";
            sVocherID = this.lblVoucherId.InnerHtml;
            DataTable dt =  BO_FeeCustomer.GetFeeCustomerAdd(sVocherID).Tables[0];
            this.gridPolicyItem.DataSource = dt;
            this.gridPolicyItem.DataBind();

            //取应收.
            dxetxtPayFee.Text = dt.Compute("Sum(PayFeeBase)", "").ToString();
            dxetxtFeeAdjust.Text = dt.Compute("Sum(FeeAdjust)", "").ToString();
            dxetxtFee.Text = dt.Compute("Sum(Fee)", "").ToString();
            dxetxtCiPremium.Text = dt.Compute("Sum(CiPremium)", "").ToString();
            dxetxtAciPremium.Text = dt.Compute("Sum(AciPremium)", "").ToString();
            dxetxtCstPremium.Text = dt.Compute("Sum(CstPremium)", "").ToString();

        }


        private string saveVoucher(String parameter)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(InfoJSON));
            InfoJSON obj;

            obj = (InfoJSON)serializer.ReadObject(ms);
            ms.Close();

            BusinessObjects.BO_Voucher objLoad;
            if (String.IsNullOrEmpty(obj.ID))
            {
                objLoad = new BO_Voucher();
                
                objLoad.VoucherId = TranUtils.GetVoucherNo();
                objLoad.InvoiceNO = "";
                objLoad.CreateTime = DateTime.Now;
                objLoad.CreatePerson = this.CurrentUserID;
                objLoad.AccountTypeID = Convert.ToInt32(BO_P_Code.AccountType.FeeCustomer);
                objLoad.FeeDate = obj.GotDate;
                objLoad.AuditStatus = Convert.ToInt32(BO_P_Code.AuditStatus.Appeal).ToString();
                objLoad.Remark = obj.Remark;
                objLoad.Save(ModifiedAction.Insert);
            }
            else
            {
                objLoad = new BO_Voucher(obj.ID);
                objLoad.FeeDate = obj.GotDate;
                objLoad.Remark  = obj.Remark;
                objLoad.Save(ModifiedAction.Update);
            }                      

            return objLoad.VoucherId;
            

        }

        private void auditVoucher(String parameter)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(InfoJSON));
            InfoJSON obj;

            obj = (InfoJSON)serializer.ReadObject(ms);
            ms.Close();

            BusinessObjects.BO_Voucher objLoad;
            if (String.IsNullOrEmpty(obj.ID))
            {
                //
            }
            else
            {
                objLoad = new BO_Voucher(obj.ID);
                objLoad.AuditStatus = obj.AuditStatus;
                objLoad.AuditPerson = this.CurrentUserID;
                objLoad.AuditVoucher();

                //objLoad.Save(ModifiedAction.Update);

                //objLoad = new BO_Voucher(obj.ID);
                //objLoad.AuditStatus = obj.AuditStatus;
                //objLoad.Save(ModifiedAction.Update);
            }

        }

        private void loadValue(String id)
        {
            if (String.IsNullOrEmpty(id.Trim())) return;

            
            BusinessObjects.BO_Voucher obj;

            obj = new BusinessObjects.BO_Voucher(id);

            this.dxeGotDate.Date = obj.FeeDate;
            this.dxetxtRemark.Text = obj.Remark;
            if (obj.AuditStatus == Convert.ToInt32(BO_P_Code.AuditStatus.AuditOk).ToString())
            {
                this.dxebtnAudit.Text = "反审核";
            }
            else
            {
                this.dxebtnAudit.Text = "审核";
            }

        }


        [DataContract(Namespace = "http://www.sheib.com")]
        public class InfoJSON
        {
            public InfoJSON()
            { }


            [DataMember]
            public string Remark { get; set; }

            [DataMember]
            public string ID { get; set; }

            [DataMember]
            public DateTime GotDate { get; set; }

            [DataMember]
            public string AuditStatus { get; set; }


        }



    }
}
