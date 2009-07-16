using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxEditors;
using System.IO;
using System.Text;
using DevExpress.Web.ASPxUploadControl;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using BusinessObjects;
using BusinessObjects.SchemaSetting;
using BusinessObjects.Policy;

namespace BrokerWebApp.vehicleinsurance
{
    public partial class AskPriceInput : BasePage
    {

        #region Variables


        private const string currentPageModeKey = "CurrentPagePolicyMode";
        
        private const string inputQueryStringIDKey = "id";
        private const string inputQueryStringPageModeKey = "pagemode";
        private const string inputQueryStringPreIDKey = "pid";
        private const string UploadDirectory = "~/UploadFiles/CarPolicyUploadFiles/";
        

        private Boolean gridPolicyItemStartEdit = false;

        public enum PageMode
        {
            Input,
            Audit,
            Query
        }

        private Nullable<PageMode> pm;

        #endregion Variables


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack)
            {
                pm = ViewState[currentPageModeKey] as Nullable<PageMode>;
                if (Page.IsCallback)
                {
                    getCallBackPolicyData();
                }
            }
            else
            {
                this.dxetxtAskPriceID.Text = Page.Request.QueryString[inputQueryStringIDKey];
                this.pagemode.Value = Page.Request.QueryString[inputQueryStringPageModeKey];

                //this.pkid.Value = Page.Request.QueryString[inputQueryStringPreIDKey];

                switch (this.pagemode.Value.ToLower().Trim())
                {
                    case "input":
                        pm = PageMode.Input;
                        break;                    
                    case "audit":
                        pm = PageMode.Audit;
                        break;
                    case "query":
                        pm = PageMode.Query;
                        break;
                    default:
                        pm = PageMode.Input;
                        break;
                }
                ViewState[currentPageModeKey] = pm;

                getInitPolicyData();

                Initialization();

                this.dxetxtCreatePerson.Text = this.CurrentUserName;
                this.dxeCreateTime.Date = DateTime.Now;

                loadCarPolicyValue(this.dxetxtAskPriceID.Text);
            }
            
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (this.pm == PageMode.Audit)
            {
                tbltrAuditExecuteAction.Visible = true;
                npExecuteAction.Visible = false;
            }
            else
            {
                
                tbltrAuditExecuteAction.Visible = false;
                npExecuteAction.Visible = true;
                this.dxetxtAuditPerson.Enabled = false;
                this.dxeAuditTime.Enabled = false;
                this.dxeMemo.Enabled = false;

                if (this.pm == PageMode.Query)
                {
                    dxebtnAuditOk.Visible = false;
                    dxebtnAuditClose.Visible = false;
                    dxebtnBottomAdd.Visible = false;
                    dxebtnBottomCheck.Visible = false;
                    dxebtntopSave.Visible = false;
                    dxebtnBottomSave.Visible = false;
                }
            }
                
        }


        protected void CarrierBranchIDCallback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.SchemaSetting.BO_Branch.FetchListByCarrier(e.Parameter);
            thecb.TextField = "BranchName";
            thecb.ValueField = "BranchID"; 
            thecb.DataBind();
            thecb.Items.Insert(0, new ListEditItem("", ""));
            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }
        }


        protected void dxeddlSalesIdCallback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(e.Parameter);
            thecb.TextField = "UserNameCn";
            thecb.ValueField = "UserID";
            thecb.DataBind();
            thecb.Items.Insert(0, new ListEditItem("", ""));
            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }

        }

        private void Initialization()
        {
            DataSet dsList;

            //dxeddlCarrierId
            List<BO_Carrier> theCarrierList = BO_Carrier.FetchList();
            this.dxeddlCarrierId.DataSource = theCarrierList;
            this.dxeddlCarrierId.ValueField = "CarrierID";
            this.dxeddlCarrierId.TextField = "CarrierNameCn";
            this.dxeddlCarrierId.DataBind();
            this.dxeddlCarrierId.Items.Insert(0, new ListEditItem("(全部)", ""));


            //dxeddlBranchId
            List<BO_Branch> theBranchList = BO_Branch.FetchList();
            this.dxeddlBranchId.DataSource = theBranchList;
            this.dxeddlBranchId.ValueField = "BranchID";
            this.dxeddlBranchId.TextField = "BranchName";
            this.dxeddlBranchId.DataBind();
            this.dxeddlBranchId.Items.Insert(0, new ListEditItem("(全部)", ""));

            //部门
            dsList = BO_P_Department.GetDeptByDeptID("");
            this.dxeddlDeptID.DataSource = dsList;
            this.dxeddlDeptID.ValueField = "DeptID";
            this.dxeddlDeptID.TextField = "DeptName";
            this.dxeddlDeptID.DataBind();
            this.dxeddlDeptID.Items.Insert(0, new ListEditItem("(全部)", ""));
            

            //客户经理
            dsList = BO_P_User.GetUserByUserID("");
            this.dxeddlSalesId.DataSource = dsList;
            this.dxeddlSalesId.ValueField = "UserID";
            this.dxeddlSalesId.TextField = "UserNameCn";
            this.dxeddlSalesId.DataBind();
            this.dxeddlSalesId.Items.Insert(0, new ListEditItem("(全部)", ""));
                        
            //dxeddlSourceTypeID
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.SourceType.ToString());
            this.dxeddlSourceTypeID.DataSource = dsList;
            this.dxeddlSourceTypeID.ValueField = "CodeID";
            this.dxeddlSourceTypeID.TextField = "CodeName";
            this.dxeddlSourceTypeID.DataBind();
            this.dxeddlSourceTypeID.Items.Insert(0, new ListEditItem("(全部)", ""));
              
            //dxeddlOperationType
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.OperationType.ToString());
            this.dxeddlOperationType.DataSource = dsList;
            this.dxeddlOperationType.ValueField = "CodeID";
            this.dxeddlOperationType.TextField = "CodeName";
            this.dxeddlOperationType.DataBind();
            this.dxeddlOperationType.Items.Insert(0, new ListEditItem("(全部)", ""));
              
            //GatheringType
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.GatheringType.ToString());
            this.dxeddlGatheringType.DataSource = dsList;
            this.dxeddlGatheringType.ValueField = "CodeID";
            this.dxeddlGatheringType.TextField = "CodeName";
            this.dxeddlGatheringType.DataBind();
            this.dxeddlGatheringType.Items.Insert(0, new ListEditItem("(全部)", ""));
                        

            


            
        }

        #endregion Page Events


        #region CallBack Events

        protected void dxeSaveCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String policystatus = Convert.ToInt32(BusinessObjects.Policy.BO_CarPolicy.CarPolicyStatusEnum.Input).ToString();
            String thePolicyID = saveCarPolicy(e.Parameter, policystatus);
            e.Result = thePolicyID;
        }


        protected void dxeSaveAndCheckCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String policystatus = Convert.ToInt32(BusinessObjects.Policy.BO_CarPolicy.CarPolicyStatusEnum.AppealAudit).ToString();
            String thePolicyID = saveCarPolicy(e.Parameter, policystatus);            
            e.Result = "complete";
        }

        protected void dxeAuditBackCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            auditBackCarPolicy(e.Parameter);
            e.Result = "complete";
        }

        protected void dxeAuditOkCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            auditCarPolicy(e.Parameter);
            e.Result = "complete";
        }

        #endregion CallBack Events


        #region gridPolicyItem Events

        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();

        }

        protected void gridPolicyItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
            this.gridPolicyItem.DataBind();
        }

        protected void gridPolicyItem_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            String theParam = e.Parameters;                        
            this.gridPolicyItem.DataBind();
        }


        private void getInitPolicyData()
        {
            String where = " and B.AskPriceID != '' and B.AskPriceID = '" + this.dxetxtAskPriceID.Text.Trim() + "'";
            DataTable dt = BusinessObjects.Policy.BO_Policy.FetchPolicyList(where);
            this.gridPolicyItem.DataSource = dt;
            this.gridPolicyItem.DataBind();
            if (String.IsNullOrEmpty(this.dxetxtAskPriceID.Text.Trim()))
            {
                //
            }

        }

        private void getCallBackPolicyData()
        {
            String where = " and B.AskPriceID != '' and B.AskPriceID = '" + this.dxetxtAskPriceID.Text.Trim() + "'";
            DataTable dt = BusinessObjects.Policy.BO_Policy.FetchPolicyList(where);
            this.gridPolicyItem.DataSource = dt;
            this.gridPolicyItem.DataBind();
        }


        private void getPostBackPolicyData()
        {
            String where = " and B.AskPriceID != '' and B.AskPriceID = '" + this.dxetxtAskPriceID.Text.Trim() + "'";
            DataTable dt = BusinessObjects.Policy.BO_Policy.FetchPolicyList(where);
            this.gridPolicyItem.DataSource = dt;
            this.gridPolicyItem.DataBind();
        }

        #endregion gridPolicyItem Events



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
            //string policyFolder = this.dxetxtPolicyID.Text.Trim();
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
            //        pdoc.PolicyID = this.dxetxtPolicyID.Text.Trim();
            //        pdoc.DocURL = UploadDirectory.Replace("~", "") + policyFolder + "/" + fileInfo.Name;
            //        pdoc.Save(ModifiedAction.Insert);
            //    }


            //}
            return ret;
        }



        protected void gridDocList_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            rebindGridDocList();
        }

        private void rebindGridDocList()
        {
            //this.gridDocList.DataSource = BusinessObjects.Policy.BO_PolicyDoc.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            //this.gridDocList.DataBind();
        }


        #endregion Upload File  Events


        #region Privates

        private void loadCarPolicyValue(String carPoliicyID)
        {
            ListEditItem theselected;
            BusinessObjects.Policy.BO_CarPolicy obj;

            obj = new BusinessObjects.Policy.BO_CarPolicy(carPoliicyID);

            this.dxetxtAskPriceID.Text = obj.AskPriceID ;
            
            
                        
            //dxeddlDeptID
            if (!String.IsNullOrEmpty(obj.DeptId))
            {
                theselected = dxeddlDeptID.Items.FindByValue(obj.DeptId);
                if (theselected != null)
                {
                    dxeddlDeptID.SelectedItem = theselected;
                }
            }

            //dxeddlSalesId
            if (!String.IsNullOrEmpty(obj.SalesId))
            {
                theselected = dxeddlSalesId.Items.FindByValue(obj.SalesId);
                if (theselected != null)
                {
                    dxeddlSalesId.SelectedItem = theselected;
                }
            }

            //dxeddlCarrierId
            if (!String.IsNullOrEmpty(obj.CarrierID))
            {
                theselected = dxeddlCarrierId.Items.FindByValue(obj.CarrierID);
                if (theselected != null)
                {
                    dxeddlCarrierId.SelectedItem = theselected;
                }
            }

            //dxeddlBranchId
            if (!String.IsNullOrEmpty(obj.BranchID))
            {
                theselected = dxeddlBranchId.Items.FindByValue(obj.BranchID);
                if (theselected != null)
                {
                    dxeddlBranchId.SelectedItem = theselected;
                }
            }


            this.dxetxtCarrierSales.Text = obj.CarrierSales;

            this.dxetxtCustomer.Text = obj.CustomerName;
            this.cusid.Value = obj.CustomerID;

            //dxeddlSourceTypeID
            if (!String.IsNullOrEmpty(obj.SourceTypeID))
            {
                theselected = dxeddlSourceTypeID.Items.FindByValue(obj.SourceTypeID);
                if (theselected != null)
                {
                    dxeddlSourceTypeID.SelectedItem = theselected;
                }
            }

            //dxeddlOperationType
            if (!String.IsNullOrEmpty(obj.OperationType))
            {
                theselected = dxeddlOperationType.Items.FindByValue(obj.OperationType);
                if (theselected != null)
                {
                    dxeddlOperationType.SelectedItem = theselected;
                }
            }

            //dxeddlGatheringType
            if (!String.IsNullOrEmpty(obj.GatheringType))
            {
                theselected = dxeddlGatheringType.Items.FindByValue(obj.GatheringType);
                if (theselected != null)
                {
                    dxeddlGatheringType.SelectedItem = theselected;
                }
            }

             
        }


        private string saveCarPolicy(String parameter, String policyState)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(AskPriceInputInfo));
            AskPriceInputInfo obj;

            obj = (AskPriceInputInfo)serializer.ReadObject(ms);
            ms.Close();

            BO_CarPolicy carPolicy;
            if (String.IsNullOrEmpty(obj.AskPriceID))
            {
                carPolicy = new BO_CarPolicy();
                carPolicy.AskPriceID = TranUtils.GetAskPriceID();
                carPolicy.PolicyStatus = policyState;

                carPolicy.DeptId = obj.DeptId;
                carPolicy.SalesId = obj.SalesId;
                carPolicy.CarrierID = obj.CarrierID;
                carPolicy.BranchID = obj.BranchID;
                carPolicy.CarrierSales = obj.CarrierSales;
                carPolicy.CustomerID = obj.CustomerID;
                carPolicy.SourceTypeID = obj.SourceTypeID;
                carPolicy.OperationType = obj.OperationTypeID;
                carPolicy.GatheringType = obj.GatheringTypeID;
                
                carPolicy.CreatePerson  = this.CurrentUserID;
                carPolicy.CreateTime = DateTime.Now;               

                carPolicy.Save(ModifiedAction.Insert);
            }
            else
            {
                carPolicy = new BO_CarPolicy(obj.AskPriceID);
                carPolicy.PolicyStatus = policyState;

                carPolicy.DeptId = obj.DeptId;
                carPolicy.SalesId = obj.SalesId;
                carPolicy.CarrierID = obj.CarrierID;
                carPolicy.BranchID = obj.BranchID;
                carPolicy.CarrierSales = obj.CarrierSales;
                carPolicy.CustomerID = obj.CustomerID;
                carPolicy.SourceTypeID = obj.SourceTypeID;
                carPolicy.OperationType = obj.OperationTypeID;
                carPolicy.GatheringType = obj.GatheringTypeID;

                carPolicy.ModifyPerson = this.CurrentUserID;
                carPolicy.ModifyTime = DateTime.Now;

                carPolicy.Save(ModifiedAction.Update);
            }

            return carPolicy.AskPriceID;

        }


        private void auditCarPolicy(String parameter)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(AskPriceInputInfo));
            AskPriceInputInfo obj;

            obj = (AskPriceInputInfo)serializer.ReadObject(ms);
            ms.Close();

            String theAskPriceID = this.dxetxtAskPriceID.Text.Trim();
            BO_CarPolicy objCarPolicy;
            objCarPolicy = new BO_CarPolicy(theAskPriceID);

            if (obj.AuditOrNot)
                objCarPolicy.PolicyStatus = Convert.ToInt32(BusinessObjects.Policy.BO_CarPolicy.CarPolicyStatusEnum.Audit).ToString();
            else
                objCarPolicy.PolicyStatus = Convert.ToInt32(BusinessObjects.Policy.BO_CarPolicy.CarPolicyStatusEnum.AppealAudit).ToString();

            objCarPolicy.AuditTime = DateTime.Now;
            objCarPolicy.AuditPerson = this.CurrentUserID;
            objCarPolicy.Remark = obj.Memo;
            objCarPolicy.Save(ModifiedAction.Update);

        }


        private void auditBackCarPolicy(String parameter)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(AskPriceInputInfo));
            AskPriceInputInfo obj;

            obj = (AskPriceInputInfo)serializer.ReadObject(ms);
            ms.Close();

            String theAskPriceID = this.dxetxtAskPriceID.Text.Trim();
            BO_CarPolicy objCarPolicy;
            objCarPolicy = new BO_CarPolicy(theAskPriceID);

            objCarPolicy.PolicyStatus = Convert.ToInt32(BusinessObjects.Policy.BO_CarPolicy.CarPolicyStatusEnum.Input).ToString();

            //carPolicy.Memo =obj.
            //AuditOrNot
            objCarPolicy.AuditTime = DateTime.Now;
            objCarPolicy.AuditPerson = this.CurrentUserID;
            objCarPolicy.Remark = obj.Memo;
            objCarPolicy.Save(ModifiedAction.Update);
        }

        #endregion Privates


    }


    [DataContract(Namespace = "http://www.sheib.com")]
    public class AskPriceInputInfo
    {
        public AskPriceInputInfo()
        { }

        [DataMember]
        public String AskPriceID { get; set; }

        [DataMember]
        public String DeptId { get; set; }

        [DataMember]
        public String SalesId { get; set; }

        [DataMember]
        public String CarrierID { get; set; }

        [DataMember]
        public String BranchID { get; set; }

        [DataMember]
        public String CarrierSales { get; set; }

        [DataMember]
        public String CustomerID { get; set; }

        [DataMember]
        public String SourceTypeID { get; set; }

        [DataMember]
        public String OperationTypeID { get; set; }

        [DataMember]
        public String GatheringTypeID { get; set; }
        
        [DataMember]
        public string Memo { get; set; }

        [DataMember]
        public Boolean AuditOrNot { get; set; }


    }




}
