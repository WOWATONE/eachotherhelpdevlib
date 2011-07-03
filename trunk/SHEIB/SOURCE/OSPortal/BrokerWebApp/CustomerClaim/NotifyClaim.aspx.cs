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
using System.Collections.Generic;
using System.IO;
using System.Text;

using DevExpress.Web.ASPxGridView;

using DevExpress.Web.ASPxGridView.Rendering;
using DevExpress.Web.ASPxClasses.Internal;


namespace BrokerWebApp.CustomerClaim
{
    public partial class NotifyClaim : BasePage
    {

        #region private

        private const string notifyNoExist = "notifynoexist";

        private const string inputQueryStringIDKey = "id";

        private const string UploadDirectory = "~/UploadFiles/NotifyClaimUploadFiles/";

        private Boolean gridTraceInfoItemStartEdit = false;

        #endregion


        #region events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                //
            }
            else
            {
                this.dxetxtNotifyID.Text = Page.Request.QueryString[inputQueryStringIDKey];
                //
                bindDropDownLists();

                //制单人
                this.dxetxtCreatePerson.Text = this.CurrentUserName;
                //制单日期
                this.dxedeCreateDate.Date = DateTime.Today;

                if (!string.IsNullOrEmpty(this.dxetxtNotifyID.Text.Trim()))
                {
                    loadNotifyClaimValue(this.dxetxtNotifyID.Text.Trim());
                }
            }

            rebindGridTraceInfoItem();
            rebindGridDocList();
        }


        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.lblerrmsg.Visible = false;

            bool isEndCase = BO_NotifyClaim.IsEnd(this.dxetxtNotifyID.Text);

            if (isEndCase)
            {
                this.dxebtnBottomSave.Visible = false;
                this.dxebtnBottomEndCase.Visible = false;
                this.filesUploadControl.Visible = false;
                this.gridTraceInfoItem.Enabled = false;
            }
            else
            {
                //
            }

        }


        protected void dxeNotifyInfoSave_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String theResult = saveNotifyClaim("", "");

            if (theResult != notifyNoExist)
                this.dxetxtNotifyID.Text = theResult;

            e.Result = theResult;
        }


        protected void dxeNotifyInfoSaveEndCase_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String theResult = saveNotifyClaim("","5");            
            e.Result = theResult;
        }
        
        #endregion events


        #region methods

        private void loadNotifyClaimValue(String notifyID)
        {

            ListEditItem theselected;
            BusinessObjects.BO_NotifyClaim notifyClaim = BusinessObjects.BO_NotifyClaim.GetNotifyClaimByNotifyID(notifyID);
            if (notifyClaim == null)
            {
                return;
            }

            dxetxtNotifyPerson.Text = notifyClaim.NotifyPerson;
            dxetxtAccidentSpot.Text = notifyClaim.AccidentSpot;
            dxedeNotifyTime.Date = notifyClaim.NotifyTime;
            dxetxtNotifyLossFee.Text = String.Format(BasePage.TheTwoSF, notifyClaim.NotifyLossFee);
            dxedeAccidentTime.Date = notifyClaim.AccidentTime;
                        
            if (!String.IsNullOrEmpty(notifyClaim.LossType))
            {
                theselected = dxeddlLossType.Items.FindByValue(notifyClaim.LossType);
                if (theselected != null)
                {
                    dxeddlLossType.SelectedItem = theselected;
                }
            }

            //
            if (!String.IsNullOrEmpty(notifyClaim.AccidentReason))
            {
                theselected = dxeddlAccidentReason.Items.FindByValue(notifyClaim.AccidentReason);
                if (theselected != null)
                {
                    dxeddlAccidentReason.SelectedItem = theselected;
                }
            }

            dxetxtContactPhone.Text = notifyClaim.ContactPhone;
            dxetxtContactPerson.Text = notifyClaim.ContactPerson;
            dxetxtAccidentProc.Text = notifyClaim.AccidentProc;
            dxedeNotifyCarrierTime.Date = notifyClaim.NotifyCarrierTime;
            dxetxtNotifyNo.Text = notifyClaim.NotifyNo;
            dxetxtCarrierContactPerson.Text = notifyClaim.CarrierContactPerson;
            dxetxtCarrierContactPhone.Text = notifyClaim.CarrierContactPhone;
            dxedePerambulateTime.Date = notifyClaim.PerambulateTime;

            dxedeDocCompleteDate.Date = notifyClaim.DocCompleteDate;
            
            dxetxtLastPayFee.Text = String.Format(BasePage.TheTwoSF, notifyClaim.LastPayFee);
            
            dxedeLastPayDate.Date = notifyClaim.LastPayDate;
            dxedeCaseEndTime.Date = notifyClaim.CaseEndTime;
            
            //
            //if (!String.IsNullOrEmpty(notifyClaim.CaseEndPerson))
            //{
            //    theselected = dxeddlCaseEndPerson.Items.FindByValue(notifyClaim.CaseEndPerson);
            //    if (theselected != null)
            //    {
            //        dxeddlCaseEndPerson.SelectedItem = theselected;
            //    }
            //}
            dxetxtCaseEndPerson.Text = notifyClaim.CaseEndPerson;

            dxetxtCreatePerson.Text = notifyClaim.CreatePerson;
            dxedeCreateDate.Date = notifyClaim.CreateDate;
            txtCaseEndRemark.Text = notifyClaim.CaseEndRemark;
            setPolicyInfo(notifyClaim.PolicyID);
                        
        }  
                
        private void setPolicyInfo(string policyID)
        {
            this.hidPolicyID.Value = "";
            this.dxetxtPolicyID.Text = "";
            this.dxetxtPolicyNo.Text = "";
            this.dxetxtCarrierNameCn.Text = ""; 
            this.dxetxtCustName.Text = "";
            this.dxetxtProdTypeName.Text = "";
            this.dxetxtBeneficiary.Text = "";
            this.dxetxtUserNameCn.Text = "";

            this.dxetxtStartDate.Text = "";
            this.dxetxtEndDate.Text = "";
            this.dxetxtPremiumBase.Text = "";

            if (string.IsNullOrEmpty(policyID))
                return;

            Object theValue;
            DataTable dt = BusinessObjects.BO_NotifyClaim.GetPolicyByPolicyID(policyID);
            if (dt != null && dt.Rows.Count > 0)
            {
                theValue = dt.Rows[0]["PolicyID"];
                if (theValue != DBNull.Value)
                {
                    this.hidPolicyID.Value = theValue.ToString();
                    this.dxetxtPolicyID.Text = theValue.ToString();
                }

                theValue = dt.Rows[0]["PolicyNo"];
                if (theValue != DBNull.Value)
                    this.dxetxtPolicyNo.Text = theValue.ToString();

                theValue = dt.Rows[0]["CarrierName"];
                if (theValue != DBNull.Value)
                    this.dxetxtCarrierNameCn.Text = theValue.ToString();

                theValue = dt.Rows[0]["CustomerName"];
                if (theValue != DBNull.Value)
                    this.dxetxtCustName.Text = theValue.ToString();

                theValue = dt.Rows[0]["ProdTypeName"];
                if (theValue != DBNull.Value)
                    this.dxetxtProdTypeName.Text = theValue.ToString();

                theValue = dt.Rows[0]["Beneficiary"];
                if (theValue != DBNull.Value)
                    this.dxetxtBeneficiary.Text = theValue.ToString();

                theValue = dt.Rows[0]["UserName"];
                if (theValue != DBNull.Value)
                    this.dxetxtUserNameCn.Text = theValue.ToString();

                theValue = dt.Rows[0]["StartDate"];
                if (theValue != DBNull.Value)
                    this.dxetxtStartDate.Text = theValue.ToString();

                theValue = dt.Rows[0]["EndDate"];
                if (theValue != DBNull.Value)
                    this.dxetxtEndDate.Text = theValue.ToString();

                theValue = dt.Rows[0]["PremiumBase"];
                if (theValue != DBNull.Value)
                    this.dxetxtPremiumBase.Text = theValue.ToString();
                             
            }
        }

        private string saveNotifyClaim(String parameter, String policyState)
        {

            BusinessObjects.BO_NotifyClaim obj;

            //check NotifyNo exist first
            /*
            bool checkresult = BO_NotifyClaim.IfExistsNotifyNo(this.dxetxtNotifyID.Text.Trim(),this.dxetxtNotifyNo.Text.Trim());

            if (checkresult) return notifyNoExist;
             * */
            

            if (String.IsNullOrEmpty(this.dxetxtNotifyID.Text.Trim()))
            {
                obj = new BusinessObjects.BO_NotifyClaim();
                obj.NotifyID = TranUtils.GetContactID();
                setData(obj);
                obj.Save(ModifiedAction.Insert);
            }
            else
            {
                obj = BO_NotifyClaim.GetNotifyClaimByNotifyID(this.dxetxtNotifyID.Text.Trim());
                setData(obj);
                obj.Save(ModifiedAction.Update);

                //结案
                if (policyState == "5")
                {
                    bool existEndCase = BO_NotifyClaim.IsEnd(obj.NotifyID);
                    
                    if (existEndCase == false)
                    {
                        BO_NotifyClaimFollow ncf = new BO_NotifyClaimFollow();
                        ncf.NotifyID = obj.NotifyID;
                        ncf.LoseStatus = "5";
                        ncf.Save(ModifiedAction.Insert);
                    }
                }

            }

            return obj.NotifyID;

        }

        private void setData(BO_NotifyClaim notifyClaim)
        {
            ListEditItem theselected;

            notifyClaim.PolicyID = this.dxetxtPolicyID.Text;                
            notifyClaim.NotifyPerson = dxetxtNotifyPerson.Text;
            notifyClaim.AccidentSpot = dxetxtAccidentSpot.Text;
            notifyClaim.NotifyTime = dxedeNotifyTime.Date;

            if (!String.IsNullOrEmpty(dxetxtNotifyLossFee.Text.Trim()) && BasePage.IsNumeric(dxetxtNotifyLossFee.Text))
                notifyClaim.NotifyLossFee = Convert.ToDouble(dxetxtNotifyLossFee.Text.Trim());
            
            notifyClaim.AccidentTime = dxedeAccidentTime.Date;

            theselected = dxeddlLossType.SelectedItem;
            if (theselected!= null)
                notifyClaim.LossType = theselected.Value.ToString();
            

            //
            theselected = dxeddlAccidentReason.SelectedItem;
            if (theselected != null)
                notifyClaim.AccidentReason = theselected.Value.ToString();
                       

            notifyClaim.ContactPhone = dxetxtContactPhone.Text;
            notifyClaim.ContactPerson = dxetxtContactPerson.Text;
            notifyClaim.AccidentProc = dxetxtAccidentProc.Text;
            notifyClaim.NotifyCarrierTime = dxedeNotifyCarrierTime.Date;
            notifyClaim.NotifyNo = dxetxtNotifyNo.Text;
            notifyClaim.CarrierContactPerson=dxetxtCarrierContactPerson.Text;
            notifyClaim.CarrierContactPhone = dxetxtCarrierContactPhone.Text;
            notifyClaim.PerambulateTime = dxedePerambulateTime.Date;

            notifyClaim.DocCompleteDate = dxedeDocCompleteDate.Date;

            if (!String.IsNullOrEmpty(dxetxtLastPayFee.Text.Trim()) && BasePage.IsNumeric(dxetxtLastPayFee.Text))
                notifyClaim.LastPayFee = Convert.ToDouble(dxetxtLastPayFee.Text.Trim());
            
            notifyClaim.LastPayDate = dxedeLastPayDate.Date;
            notifyClaim.CaseEndTime = dxedeCaseEndTime.Date;

            //
            //theselected = dxeddlCaseEndPerson.SelectedItem;
            //if (theselected != null)
            //    notifyClaim.CaseEndPerson = theselected.Value.ToString();
            notifyClaim.CaseEndPerson = dxetxtCaseEndPerson.Text;

            notifyClaim.CreatePerson = this.CurrentUserID;
            notifyClaim.CreateDate = dxedeCreateDate.Date;

            notifyClaim.ModifyPerson = this.CurrentUserID;
            notifyClaim.ModifyDate  = dxedeCreateDate.Date;

            notifyClaim.CaseEndRemark = this.txtCaseEndRemark.Text;
        }
    

        private void bindDropDownLists()
        {
            
            //List<BusinessObjects.BO_P_User> userList;
            //if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.PolicyInput_List_Search_Group))
            //{
            //    userList = BusinessObjects.BO_P_User.FetchDeptUserList(this.CurrentUser.DeptID);
            //}
            //else if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.PolicyInput_List_Search_All))
            //{
            //    userList = BusinessObjects.BO_P_User.FetchList();
            //}
            //else
            //{
            //    userList = BusinessObjects.BO_P_User.FetchList();
            //}
            //this.dxeddlCaseEndPerson.DataSource = userList;
            //this.dxeddlCaseEndPerson.TextField = "UserNameCn";
            //this.dxeddlCaseEndPerson.ValueField = "UserID";
            //this.dxeddlCaseEndPerson.DataBind();
            //this.dxeddlCaseEndPerson.Items.Insert(0, new ListEditItem("", ""));

            this.dxeddlLossType.DataSource = BusinessObjects.BO_NotifyClaim.GetLossTypeList();
            this.dxeddlLossType.TextField = "AccountTypeName";
            this.dxeddlLossType.ValueField = "AccountTypeID";
            this.dxeddlLossType.DataBind();
            this.dxeddlLossType.Items.Insert(0, new ListEditItem("", ""));


            this.dxeddlAccidentReason.DataSource = BusinessObjects.BO_NotifyClaim.GetAccidentReasonList();
            this.dxeddlAccidentReason.TextField = "AccountTypeName";
            this.dxeddlAccidentReason.ValueField = "AccountTypeID";
            this.dxeddlAccidentReason.DataBind();
            this.dxeddlAccidentReason.Items.Insert(0, new ListEditItem("", ""));

        }

        #endregion methods



        #region gridTraceInfoItem Events

        protected void gridTraceInfoItem_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridTraceInfoItem.FindEditFormTemplateControl("gridTraceInfoItem_EditorTemplate") as HtmlTable;

            ASPxDateEdit gridTraceInfoItem_dxedeFollowDate = tblEditorTemplate.FindControl("gridTraceInfoItem_dxedeFollowDate") as ASPxDateEdit;
            ASPxComboBox gridTraceInfoItem_dxeddlLoseStatus = tblEditorTemplate.FindControl("gridTraceInfoItem_dxeddlLoseStatus") as ASPxComboBox;
            ASPxTextBox gridTraceInfoItem_dxetxtEstimateFeel = tblEditorTemplate.FindControl("gridTraceInfoItem_dxetxtEstimateFeel") as ASPxTextBox;

            ASPxMemo gridTraceInfoItem_dxetxtFollowContent = tblEditorTemplate.FindControl("gridTraceInfoItem_dxetxtFollowContent") as ASPxMemo;
            ASPxMemo gridTraceInfoItem_dxetxtFollowNextContent = tblEditorTemplate.FindControl("gridTraceInfoItem_dxetxtFollowNextContent") as ASPxMemo;
                        
            gridTraceInfoItem_dxeddlLoseStatus.DataSource = BusinessObjects.BO_NotifyClaimFollow.GetLoseStatusList();
            gridTraceInfoItem_dxeddlLoseStatus.TextField = "AccountTypeName";
            gridTraceInfoItem_dxeddlLoseStatus.ValueField = "AccountTypeID";
            gridTraceInfoItem_dxeddlLoseStatus.DataBind();
                        
            Int32 editIndex = this.gridTraceInfoItem.EditingRowVisibleIndex;
            if (editIndex > -1)
            {
                object theValues = this.gridTraceInfoItem.GetRowValues(editIndex, new String[] { "FollowID", "NotifyID", "FollowDate", "FollowContent", "FollowNextContent", "LoseStatus", "EstimateFeel" });
                object[] theValueList = theValues as object[];
                                
                ListEditItem theselected;
                if (this.gridTraceInfoItemStartEdit)
                {
                    if (theValueList[2] != null)
                        gridTraceInfoItem_dxedeFollowDate.Date  = Convert.ToDateTime(theValueList[2]);

                    if (theValueList[3] != null)
                        gridTraceInfoItem_dxetxtFollowContent.Text = theValueList[3].ToString();

                    if (theValueList[4] != null)
                        gridTraceInfoItem_dxetxtFollowNextContent.Text = theValueList[4].ToString();
                                        
                    if (theValueList[5] != null)
                    {
                        theselected = gridTraceInfoItem_dxeddlLoseStatus.Items.FindByValue(theValueList[5].ToString());
                        if (theselected != null)
                        {
                            gridTraceInfoItem_dxeddlLoseStatus.SelectedItem = theselected;
                        }
                    }
                    
                    if (theValueList[6] != null)
                        gridTraceInfoItem_dxetxtEstimateFeel.Text = String.Format(BasePage.TheTwoSF, theValueList[6]);

                }

            }

        }

        protected void gridTraceInfoItem_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            this.gridTraceInfoItemStartEdit = true;
        }

        protected void gridTraceInfoItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            String theKey = e.Keys[0].ToString();
            HtmlTable tblEditorTemplate = this.gridTraceInfoItem.FindEditFormTemplateControl("gridTraceInfoItem_EditorTemplate") as HtmlTable;

            ASPxDateEdit gridTraceInfoItem_dxedeFollowDate = tblEditorTemplate.FindControl("gridTraceInfoItem_dxedeFollowDate") as ASPxDateEdit;
            ASPxComboBox gridTraceInfoItem_dxeddlLoseStatus = tblEditorTemplate.FindControl("gridTraceInfoItem_dxeddlLoseStatus") as ASPxComboBox;
            ASPxTextBox gridTraceInfoItem_dxetxtEstimateFeel = tblEditorTemplate.FindControl("gridTraceInfoItem_dxetxtEstimateFeel") as ASPxTextBox;

            ASPxMemo gridTraceInfoItem_dxetxtFollowContent = tblEditorTemplate.FindControl("gridTraceInfoItem_dxetxtFollowContent") as ASPxMemo;
            ASPxMemo gridTraceInfoItem_dxetxtFollowNextContent = tblEditorTemplate.FindControl("gridTraceInfoItem_dxetxtFollowNextContent") as ASPxMemo;
            
            BusinessObjects.BO_NotifyClaimFollow newobj = new BusinessObjects.BO_NotifyClaimFollow(Convert.ToInt32(theKey));

            newobj.NotifyID = this.dxetxtNotifyID.Text;

            newobj.FollowDate = gridTraceInfoItem_dxedeFollowDate.Date;
            newobj.LoseStatus = gridTraceInfoItem_dxeddlLoseStatus.SelectedItem.Value.ToString();

            if (gridTraceInfoItem_dxetxtEstimateFeel.Text != String.Empty)
            {
                newobj.EstimateFeel = Convert.ToDouble(gridTraceInfoItem_dxetxtEstimateFeel.Text);
            }
            
            newobj.FollowContent = gridTraceInfoItem_dxetxtFollowContent.Text;
            newobj.FollowNextContent = gridTraceInfoItem_dxetxtFollowNextContent.Text;
            
            try
            {
                newobj.Save(ModifiedAction.Update);
            }
            catch (Exception ex)
            {
                throw ex;
            }


            e.Cancel = true;
            this.gridTraceInfoItem.CancelEdit();

            rebindGridTraceInfoItem();

        }

        protected void gridTraceInfoItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

            HtmlTable tblEditorTemplate = this.gridTraceInfoItem.FindEditFormTemplateControl("gridTraceInfoItem_EditorTemplate") as HtmlTable;

            ASPxDateEdit gridTraceInfoItem_dxedeFollowDate = tblEditorTemplate.FindControl("gridTraceInfoItem_dxedeFollowDate") as ASPxDateEdit;
            ASPxComboBox gridTraceInfoItem_dxeddlLoseStatus = tblEditorTemplate.FindControl("gridTraceInfoItem_dxeddlLoseStatus") as ASPxComboBox;
            ASPxTextBox gridTraceInfoItem_dxetxtEstimateFeel = tblEditorTemplate.FindControl("gridTraceInfoItem_dxetxtEstimateFeel") as ASPxTextBox;

            ASPxMemo gridTraceInfoItem_dxetxtFollowContent = tblEditorTemplate.FindControl("gridTraceInfoItem_dxetxtFollowContent") as ASPxMemo;
            ASPxMemo gridTraceInfoItem_dxetxtFollowNextContent = tblEditorTemplate.FindControl("gridTraceInfoItem_dxetxtFollowNextContent") as ASPxMemo;

            BusinessObjects.BO_NotifyClaimFollow newobj = new BusinessObjects.BO_NotifyClaimFollow();

            newobj.NotifyID = this.dxetxtNotifyID.Text;

            newobj.FollowDate = gridTraceInfoItem_dxedeFollowDate.Date;
            newobj.LoseStatus = gridTraceInfoItem_dxeddlLoseStatus.SelectedItem.Value.ToString();

            if (gridTraceInfoItem_dxetxtEstimateFeel.Text != String.Empty)
            {
                newobj.EstimateFeel = Convert.ToDouble(gridTraceInfoItem_dxetxtEstimateFeel.Text);
            }

            newobj.FollowContent = gridTraceInfoItem_dxetxtFollowContent.Text;
            newobj.FollowNextContent = gridTraceInfoItem_dxetxtFollowNextContent.Text;
                        
            try
            {
                newobj.Save(ModifiedAction.Insert);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            e.Cancel = true;
            this.gridTraceInfoItem.CancelEdit();

            rebindGridTraceInfoItem();

        }

        protected void gridTraceInfoItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String theKey = e.Keys[0].ToString();

            try
            {
                if (BasePage.IsNumeric(theKey))
                {
                    BusinessObjects.BO_NotifyClaimFollow.Delete(Convert.ToInt32(theKey));
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            e.Cancel = true;
            this.gridTraceInfoItem.CancelEdit();

            rebindGridTraceInfoItem();

        }

        protected void gridTraceInfoItem_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridTraceInfoItem.FindEditFormTemplateControl("gridTraceInfoItem_EditorTemplate") as HtmlTable;

            ASPxDateEdit gridTraceInfoItem_dxedeFollowDate = tblEditorTemplate.FindControl("gridTraceInfoItem_dxedeFollowDate") as ASPxDateEdit;
            ASPxComboBox gridTraceInfoItem_dxeddlLoseStatus = tblEditorTemplate.FindControl("gridTraceInfoItem_dxeddlLoseStatus") as ASPxComboBox;
            ASPxTextBox gridTraceInfoItem_dxetxtEstimateFeel = tblEditorTemplate.FindControl("gridTraceInfoItem_dxetxtEstimateFeel") as ASPxTextBox;

            ASPxMemo gridTraceInfoItem_dxetxtFollowContent = tblEditorTemplate.FindControl("gridTraceInfoItem_dxetxtFollowContent") as ASPxMemo;
            ASPxMemo gridTraceInfoItem_dxetxtFollowNextContent = tblEditorTemplate.FindControl("gridTraceInfoItem_dxetxtFollowNextContent") as ASPxMemo;

            if (gridTraceInfoItem_dxedeFollowDate.Date == DateTime.MinValue || gridTraceInfoItem_dxedeFollowDate.Date == DateTime.MaxValue)
            {
                e.Errors[this.gridTraceInfoItem.Columns[0]] = "必需项";
            }

            if (gridTraceInfoItem_dxetxtFollowContent.Text.Trim() == "")
            {
                e.Errors[this.gridTraceInfoItem.Columns[1]] = "必需项";
            }

            if (gridTraceInfoItem_dxetxtFollowNextContent.Text.Trim() == "")
            {
                e.Errors[this.gridTraceInfoItem.Columns[2]] = "必需项";
            }

            if (gridTraceInfoItem_dxeddlLoseStatus.SelectedItem == null)
            {
                e.Errors[this.gridTraceInfoItem.Columns[3]] = "必需项";
            }

            //if (gridTraceInfoItem_dxetxtEstimateFeel.Text.Trim() == "")
            //{
            //    e.Errors[this.gridTraceInfoItem.Columns[4]] = "必需项";
            //}

            String appendDes = "必需项";
            gridTraceInfoItem_dxedeFollowDate.Validate();
            gridTraceInfoItem_dxeddlLoseStatus.Validate();
            gridTraceInfoItem_dxetxtEstimateFeel.Validate();
            gridTraceInfoItem_dxetxtFollowContent.Validate();
            gridTraceInfoItem_dxetxtFollowNextContent.Validate();

            if (string.IsNullOrEmpty(e.RowError) && e.Errors.Count > 0) e.RowError = "请修正所有的错误(" + appendDes + ")。";

        }


        private void rebindGridTraceInfoItem()
        {
            this.gridTraceInfoItem.DataSource = BusinessObjects.BO_NotifyClaimFollow.GetNotifyClaimFollowListByNotifyID(this.dxetxtNotifyID.Text.Trim());
            this.gridTraceInfoItem.DataBind();
        }

        #endregion gridTraceInfoItem Events


        #region Upload File Events

        protected void UploadControl_PreRender(object sender, EventArgs e)
        {
            //
        }


        protected void UploadControl_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
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


        protected string SavePostedFiles(UploadedFile uploadedFile)
        {
            string ret = "";
            string notifyFolder = this.dxetxtNotifyID.Text.Trim();
            string notifyFolderPath;
            if (uploadedFile.IsValid)
            {
                DirectoryInfo drtInfo = new DirectoryInfo(MapPath(UploadDirectory));
                if (drtInfo.Exists)
                {
                    notifyFolderPath = System.IO.Path.Combine(MapPath(UploadDirectory), notifyFolder);
                    drtInfo = new DirectoryInfo(notifyFolder);
                    FileInfo fileInfo;
                    if (drtInfo.Exists)
                    {
                        fileInfo = new FileInfo(uploadedFile.FileName);
                        string resFileName = System.IO.Path.Combine(notifyFolderPath, fileInfo.Name);
                        uploadedFile.SaveAs(resFileName);
                    }
                    else
                    {
                        //create folder
                        drtInfo = System.IO.Directory.CreateDirectory(notifyFolderPath);
                        fileInfo = new FileInfo(uploadedFile.FileName);
                        string resFileName = System.IO.Path.Combine(notifyFolderPath, fileInfo.Name);
                        uploadedFile.SaveAs(resFileName);
                    }

                    //BO_PolicyDoc
                    BusinessObjects.BO_NotifyClaimDoc.Delete(this.dxetxtNotifyID.Text.Trim(), fileInfo.Name);

                    BusinessObjects.BO_NotifyClaimDoc pdoc = new BusinessObjects.BO_NotifyClaimDoc();
                    
                    pdoc.DocName = fileInfo.Name;
                    pdoc.NotifyID = this.dxetxtNotifyID.Text.Trim();
                    pdoc.DocURL = UploadDirectory.Replace("~", "") + notifyFolder + "/" + fileInfo.Name;
                    pdoc.Save(ModifiedAction.Insert);
                }                
            }
            return ret;
        }


        protected void gridDocList_HtmlRowCreated(object sender,
            ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                Control thectr;
                HyperLink thelnk;
                thectr = gridDocList.FindRowCellTemplateControl(e.VisibleIndex, null, "docitemlnk");
                //thelnk = gridDocList.FindRowTemplateControl(e.VisibleIndex, "docitemlnk");
                if (thectr != null)
                {
                    thelnk = (HyperLink)thectr;
                    thelnk.ID = "fileurl" + Convert.ToString(e.GetValue("NotifyClaimDocID"));
                    thelnk.NavigateUrl = "#";
                    thelnk.Text = Convert.ToString(e.GetValue("DocName"));
                    String lnkUrl = "";
                    lnkUrl = Convert.ToString(e.GetValue("DocURL"));
                    lnkUrl = BasePage.URLCombine(BasePage.ApplicationRoot, lnkUrl);
                    thelnk.Attributes.Add("onclick", "hlPolicyItemTogetherClick('" + lnkUrl + "');");
                }

                
                //GridViewCommandColumn objgcc = getGridDocListCommandColumnLoop();

                //GridViewCommandColumnButtonControl thebtn;
                //InternalHyperLink theIHL;

                //thebtn = (GridViewCommandColumnButtonControl)e.Row.Cells[objgcc.VisibleIndex].Controls[0];
                //thebtn.Enabled = false;
                //theIHL = (InternalHyperLink)thebtn.Controls[0];
                //theIHL.Enabled = false;
                
            }
        }


        protected void gridDocList_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String theID = e.Keys[0].ToString();
            object theValues = this.gridDocList.GetRowValuesByKeyValue(theID, new String[] { "NotifyClaimDocID", "DocName", "DocURL" });
            object[] theValueList = theValues as object[];
            String notifyClaimDocID, docName, docURL;
            if (theValueList[0] == null)
                notifyClaimDocID = "";
            else
                notifyClaimDocID = theValueList[0].ToString();

            if (theValueList[1] == null)
                docName = "";
            else
                docName = theValueList[1].ToString();

            if (theValueList[2] == null)
                docURL = "";
            else
                docURL = theValueList[2].ToString();

            try
            {
                string policyFolderPath;
                policyFolderPath = System.IO.Path.Combine(MapPath(UploadDirectory), notifyClaimDocID);
                string filePath = System.IO.Path.Combine(policyFolderPath, docName);

                FileInfo fi = new FileInfo(filePath);
                if (fi.Exists)
                {
                    fi.Delete();
                }
            }
            catch
            {
                //do nothing;
            }
            if (!String.IsNullOrEmpty(theID))
            {
                BusinessObjects.BO_NotifyClaimDoc.Delete(Convert.ToInt32(theID));

            }

            e.Cancel = true;
            this.gridDocList.CancelEdit();

            rebindGridDocList();
        }


        protected void gridDocList_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            rebindGridDocList();
        }

        private void rebindGridDocList()
        {
            this.gridDocList.DataSource = BusinessObjects.BO_NotifyClaimDoc.FetchListByNotifyID(this.dxetxtNotifyID.Text.Trim());
            this.gridDocList.DataBind();
        }


        private GridViewCommandColumn getGridDocListCommandColumnLoop()
        {
            GridViewCommandColumn theCommandColumn = null;
            foreach (GridViewColumn item in gridDocList.VisibleColumns)
            {
                if (item.GetType() == typeof(GridViewCommandColumn))
                {
                    theCommandColumn = (GridViewCommandColumn)item;
                    break;
                }
            }
            return theCommandColumn;
        }

        #endregion Upload File  Events


    }
}
