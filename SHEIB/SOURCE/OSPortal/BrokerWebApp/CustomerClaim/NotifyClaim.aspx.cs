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

namespace BrokerWebApp.CustomerClaim
{
    public partial class NotifyClaim : BasePage
    {

        #region private

        private const string notifyNoExist = "notifynoexist";

        private const string inputQueryStringIDKey = "id";

        private const string UploadDirectory = "~/UploadFiles/PolicyUploadFiles/";

        
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
        }


        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.lblerrmsg.Visible = false;
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
            String theResult = saveNotifyClaim("","");            
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
            if (!String.IsNullOrEmpty(notifyClaim.CaseEndPerson))
            {
                theselected = dxeddlCaseEndPerson.Items.FindByValue(notifyClaim.CaseEndPerson);
                if (theselected != null)
                {
                    dxeddlCaseEndPerson.SelectedItem = theselected;
                }
            }

            dxetxtCreatePerson.Text = notifyClaim.CreatePerson;
            dxedeCreateDate.Date = notifyClaim.CreateDate;

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
            bool checkresult = BO_NotifyClaim.IfExistsNotifyNo(this.dxetxtNotifyNo.Text.Trim());

            if (checkresult) return notifyNoExist;

            if (String.IsNullOrEmpty(this.dxetxtNotifyID.Text.Trim()))
            {
                obj = new BusinessObjects.BO_NotifyClaim();
                obj.PolicyID = TranUtils.GetPolicyID();
                setData(obj);
                obj.Save(ModifiedAction.Insert);
            }
            else
            {
                obj = BO_NotifyClaim.GetNotifyClaimByNotifyID(this.dxetxtNotifyID.Text.Trim());
                setData(obj);
                obj.Save(ModifiedAction.Update);
            }

            return obj.NotifyID;

        }

        private void setData(BO_NotifyClaim notifyClaim)
        {
            ListEditItem theselected;

            notifyClaim.NotifyPerson = dxetxtNotifyPerson.Text;
            notifyClaim.AccidentSpot = dxetxtAccidentSpot.Text;
            notifyClaim.NotifyTime = dxedeNotifyTime.Date;

            if (!String.IsNullOrEmpty(dxetxtNotifyLossFee.Text.Trim()))
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

            dxetxtLastPayFee.Text = String.Format(BasePage.TheTwoSF, notifyClaim.LastPayFee);
            
            notifyClaim.LastPayDate = dxedeLastPayDate.Date;
            notifyClaim.CaseEndTime = dxedeCaseEndTime.Date;

            //
            theselected = dxeddlCaseEndPerson.SelectedItem;
            if (theselected != null)
                notifyClaim.CaseEndPerson = theselected.Value.ToString();
            
            notifyClaim.CreatePerson = this.CurrentUserID;
            notifyClaim.CreateDate = dxedeCreateDate.Date;

            notifyClaim.ModifyPerson = this.CurrentUserID;
            notifyClaim.ModifyDate  = dxedeCreateDate.Date;
        }
    

        private void bindDropDownLists()
        {
            
            List<BusinessObjects.BO_P_User> userList;
            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.PolicyInput_List_Search_Group))
            {
                userList = BusinessObjects.BO_P_User.FetchDeptUserList(this.CurrentUser.DeptID);
            }
            else if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.PolicyInput_List_Search_All))
            {
                userList = BusinessObjects.BO_P_User.FetchList();
            }
            else
            {
                userList = BusinessObjects.BO_P_User.FetchList();
            }
            this.dxeddlCaseEndPerson.DataSource = userList;
            this.dxeddlCaseEndPerson.TextField = "UserNameCn";
            this.dxeddlCaseEndPerson.ValueField = "UserID";
            this.dxeddlCaseEndPerson.DataBind();
            this.dxeddlCaseEndPerson.Items.Insert(0, new ListEditItem("", ""));

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
            //string policyFolder = "";// this.dxetxtPolicyID.Text.Trim();
            //string policyFolderPath;
            //if (uploadedFile.IsValid)
            //{
            //    DirectoryInfo drtInfo = new DirectoryInfo(MapPath(UploadDirectory));
            //    if (drtInfo.Exists)
            //    {
            //        policyFolderPath = System.IO.Path.Combine(MapPath(UploadDirectory), policyFolder);
            //        drtInfo = new DirectoryInfo(policyFolder);
            //        FileInfo fileInfo;
            //        if (drtInfo.Exists)
            //        {
            //            fileInfo = new FileInfo(uploadedFile.FileName);
            //            string resFileName = System.IO.Path.Combine(policyFolderPath, fileInfo.Name);
            //            uploadedFile.SaveAs(resFileName);

            //            //string fileLabel = fileInfo.Name;
            //            //string fileType = uploadedFile.PostedFile.ContentType.ToString();
            //            //string fileLength = uploadedFile.PostedFile.ContentLength / 1024 + "K";
            //            //ret = string.Format("{0} <i>({1})</i> {2}|{3}", fileLabel, fileType, fileLength, fileInfo.Name);
            //        }
            //        else
            //        {
            //            //create folder
            //            drtInfo = System.IO.Directory.CreateDirectory(policyFolderPath);
            //            fileInfo = new FileInfo(uploadedFile.FileName);
            //            string resFileName = System.IO.Path.Combine(policyFolderPath, fileInfo.Name);
            //            uploadedFile.SaveAs(resFileName);
            //        }

            //        //BO_PolicyDoc
            //        BusinessObjects.Policy.BO_PolicyDoc.Delete(this.dxetxtPolicyID.Text.Trim(), fileInfo.Name);

            //        BusinessObjects.Policy.BO_PolicyDoc pdoc = new BusinessObjects.Policy.BO_PolicyDoc();
            //        pdoc.PolicyDocID = Guid.NewGuid().ToString();
            //        pdoc.DocName = fileInfo.Name;
            //        //pdoc.PolicyID = this.dxetxtPolicyID.Text.Trim();
            //        //pdoc.DocURL = UploadDirectory.Replace("~", "") + policyFolder + "/" + fileInfo.Name;
            //        pdoc.Save(ModifiedAction.Insert);
            //    }


            //}
            return ret;
        }


        //protected void gridDocList_HtmlRowCreated(object sender,
        //    ASPxGridViewTableRowEventArgs e)
        //{
        //    if (e.RowType == GridViewRowType.Data)
        //    {
        //        Control thectr;
        //        HyperLink thelnk;
        //        thectr = gridDocList.FindRowCellTemplateControl(e.VisibleIndex, null, "docitemlnk");
        //        //thelnk = gridDocList.FindRowTemplateControl(e.VisibleIndex, "docitemlnk");
        //        if (thectr != null)
        //        {
        //            thelnk = (HyperLink)thectr;
        //            thelnk.ID = "fileurl" + Convert.ToString(e.GetValue("PolicyDocID"));
        //            thelnk.NavigateUrl = "#";
        //            thelnk.Text = Convert.ToString(e.GetValue("DocName"));
        //            String lnkUrl = "";
        //            lnkUrl = Convert.ToString(e.GetValue("DocURL"));
        //            lnkUrl = BasePage.URLCombine(BasePage.ApplicationRoot, lnkUrl);
        //            thelnk.Attributes.Add("onclick", "hlPolicyItemTogetherClick('" + lnkUrl + "');");
        //        }

        //    }
        //}


        //protected void gridDocList_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        //{
        //    rebindGridDocList();
        //}

        //private void rebindGridDocList()
        //{
        //    this.gridDocList.DataSource = BusinessObjects.Policy.BO_PolicyDoc.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
        //    this.gridDocList.DataBind();
        //}


        #endregion Upload File  Events


    }
}
