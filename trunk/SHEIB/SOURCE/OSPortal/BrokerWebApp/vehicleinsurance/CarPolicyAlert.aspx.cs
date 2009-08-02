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
using DevExpress.Web.ASPxUploadControl;
using System.Text;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using BusinessObjects;
using BusinessObjects.SchemaSetting;
using BusinessObjects.Policy;

namespace BrokerWebApp.vehicleinsurance
{
    public partial class CarPolicyAlert : BasePage
    {


        #region Variables

        private const string currentPageModeKey = "CurrentPagePolicyMode";
        private const string inputQueryStringPageModeKey = "pagemode";
        private const string inputQueryStringIDKey = "id";
        private const string inputQueryStringPreIDKey = "pid";
        private const string UploadDirectory = "~/UploadFiles/PolicyUploadFiles/";

        private const string policyNoExist = "policynoexist";


        private Boolean gridPolicyItemStartEdit = false;

        public enum PageMode
        {
            Input,
            Audit
        }

        private Nullable<PageMode> pm;

        private const String productType = "C00003001";

        private Boolean gridPolicyPeriodStartEdit = false;

        #endregion Variables


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                pm = ViewState[currentPageModeKey] as Nullable<PageMode>;
                if (Page.IsCallback)
                {
                    rebindGridDocList(this.dxetxtPolicyID.Text.Trim());
                }
            }
            else
            {
                this.dxetxtPolicyID.Text = Page.Request.QueryString[inputQueryStringIDKey];
                this.lblSourcePolicyID.Text = Page.Request.QueryString[inputQueryStringPreIDKey];
                
                this.pagemode.Value = Page.Request.QueryString[inputQueryStringPageModeKey];

                switch (this.pagemode.Value.ToLower().Trim())
                {
                    case "input":
                        pm = PageMode.Input;
                        break;
                    case "audit":
                        pm = PageMode.Audit;
                        this.dxetxtAuditPerson.Text = this.CurrentUserName;
                        this.dxeAuditTime.Date = DateTime.Now;
                        break;
                    default:
                        pm = PageMode.Input;
                        break;
                }
                ViewState[currentPageModeKey] = pm;
           
                                
                Initialization();

                this.dxetxtCreatePerson.Text = this.CurrentUserName;
                this.dxeCreateTime.Date = DateTime.Now;

                loadPolicyValue(this.lblSourcePolicyID.Text);
                rebindGridDocList(this.dxetxtPolicyID.Text.Trim());
            }

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (this.pm == PageMode.Audit)
            {
                tbltrAuditExecuteAction.Visible = true;
                npExecuteAction.Visible = false;
                this.filesUploadControl.Enabled = false;
                switchBasicInfoControlsEnable(false);

                if (String.IsNullOrEmpty(this.dxetxtAuditPerson.Text))
                {
                    this.dxetxtAuditPerson.Text = this.CurrentUserName;
                    this.dxeAuditTime.Date = DateTime.Now;
                }
                BusinessObjects.Policy.BO_Policy obj;
                obj = new BusinessObjects.Policy.BO_Policy(this.dxetxtPolicyID.Text.Trim());

                if (obj.PolicyStatus == Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Audit).ToString())
                {
                    this.dxebtnAuditOk.Text = "反审核";
                    this.dxebtnAuditBack.ClientEnabled = false;
                }

            }
            else
            {
                tbltrAuditExecuteAction.Visible = false;
                npExecuteAction.Visible = true;
                this.dxetxtAuditPerson.Enabled = false;
                this.dxeAuditTime.Enabled = false;
                this.dxeMemo.Enabled = false;
            }
        }


        protected void CarrierBranchIDCallback(object source,
            DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
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


        protected void dxeddlSalesIdCallback(object source,
            DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
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



        #region Tab Events


        protected void insuranceDetailTabPage_ActiveTabChanged(object source,
            DevExpress.Web.ASPxTabControl.TabControlEventArgs e)
        {
            BusinessObjects.Policy.BO_Policy obj;
            obj = new BusinessObjects.Policy.BO_Policy(this.dxetxtPolicyID.Text.Trim());
            String state = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.AppealAudit).ToString();

            if (this.insuranceDetailTabPage.ActiveTabIndex == 1)
            {
                rebindGridDocList(this.dxetxtPolicyID.Text.Trim());
                if (this.pm == PageMode.Audit || obj.PolicyStatus == state)
                    filesUploadControl.Enabled = false;
            }

            if (this.insuranceDetailTabPage.ActiveTabIndex == 2)
            {
                rebindGridPeriod(); 
            }


        }


        #endregion Tab Events


        #region CallBack Events

        protected void dxeSaveCallback_Callback(object source,
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String policystatus = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Input).ToString();
            String theID = savePolicy(e.Parameter, policystatus);
            e.Result = theID;
        }


        protected void dxeSaveAndCheckCallback_Callback(object source,
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            int resultSign = 0;
            String resultMSG = "";
            String policystatus = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Input).ToString();
            String theResult = savePolicy(e.Parameter, policystatus);
            if (theResult != policyNoExist)
            {
                auditPolicySubmit(ref resultSign, ref resultMSG);
                if (resultSign == 0)
                    theResult = resultSign.ToString();
                else
                    theResult = resultMSG;
            }

            e.Result = theResult;

        }


        protected void dxeAuditBackCallback_Callback(object source,
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            auditBackPolicy(e.Parameter);
            e.Result = "complete";
        }


        protected void dxeAuditOkCallback_Callback(object source,
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            int resultSign = 0;
            String resultMSG = "";
            auditPolicy(e.Parameter, ref resultSign, ref resultMSG);
            if (resultSign == 0)
                e.Result = resultSign.ToString();
            else
                e.Result = resultMSG;
        }


        #endregion CallBack Events


        #region Upload File Events


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
            string policyFolder = this.dxetxtPolicyID.Text.Trim();
            string policyFolderPath;
            if (uploadedFile.IsValid)
            {
                DirectoryInfo drtInfo = new DirectoryInfo(MapPath(UploadDirectory));
                if (drtInfo.Exists)
                {
                    policyFolderPath = System.IO.Path.Combine(MapPath(UploadDirectory), policyFolder);
                    drtInfo = new DirectoryInfo(policyFolder);
                    FileInfo fileInfo;
                    if (drtInfo.Exists)
                    {
                        fileInfo = new FileInfo(uploadedFile.FileName);
                        string resFileName = System.IO.Path.Combine(policyFolderPath, fileInfo.Name);
                        uploadedFile.SaveAs(resFileName);

                        //string fileLabel = fileInfo.Name;
                        //string fileType = uploadedFile.PostedFile.ContentType.ToString();
                        //string fileLength = uploadedFile.PostedFile.ContentLength / 1024 + "K";
                        //ret = string.Format("{0} <i>({1})</i> {2}|{3}", fileLabel, fileType, fileLength, fileInfo.Name);
                    }
                    else
                    {
                        //create folder
                        drtInfo = System.IO.Directory.CreateDirectory(policyFolderPath);
                        fileInfo = new FileInfo(uploadedFile.FileName);
                        string resFileName = System.IO.Path.Combine(policyFolderPath, fileInfo.Name);
                        uploadedFile.SaveAs(resFileName);
                    }

                    //BO_PolicyDoc
                    BusinessObjects.Policy.BO_PolicyDoc.Delete(this.dxetxtPolicyID.Text.Trim(), fileInfo.Name);

                    BusinessObjects.Policy.BO_PolicyDoc pdoc = new BusinessObjects.Policy.BO_PolicyDoc();
                    pdoc.PolicyDocID = Guid.NewGuid().ToString();
                    pdoc.DocName = fileInfo.Name;
                    pdoc.PolicyID = this.dxetxtPolicyID.Text.Trim();
                    pdoc.DocURL = UploadDirectory.Replace("~", "") + policyFolder + "/" + fileInfo.Name;
                    pdoc.Save(ModifiedAction.Insert);
                }
            }

            return ret;
        }



        protected void gridDocList_CustomCallback(object sender, 
            DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            rebindGridDocList(this.dxetxtPolicyID.Text.Trim());
        }


        private void rebindGridDocList(String id)
        {
            this.gridDocList.DataSource = BusinessObjects.Policy.BO_PolicyDoc.FetchListByPolicy(id);
            this.gridDocList.DataBind();
        }


        protected void filesUploadControlPanel_Callback(object source,
            DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            String theParam = e.Parameter;
            if (theParam == "unabled")
                this.filesUploadControl.Enabled = false;

        }

        #endregion Upload File  Events



        #region gridPeriod Events

        protected void gridPeriod_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            DevExpress.Web.ASPxGridView.ASPxGridView refObj = this.gridPeriod;
            HtmlTable tblEditorTemplate = refObj.FindEditFormTemplateControl("tblgridPeriodEditorTemplate") as HtmlTable;

            ASPxTextBox detxtGridPeriodPeriod = tblEditorTemplate.FindControl("detxtGridPeriodPeriod") as ASPxTextBox;
            ASPxDateEdit detxtGridPeriodPayDate = tblEditorTemplate.FindControl("detxtGridPeriodPayDate") as ASPxDateEdit;
            ASPxTextBox detxtGridPeriodCarrierNameCn = tblEditorTemplate.FindControl("detxtGridPeriodCarrierNameCn") as ASPxTextBox;
            ASPxTextBox detxtGridPeriodBranchName = tblEditorTemplate.FindControl("detxtGridPeriodBranchName") as ASPxTextBox;
            ASPxTextBox detxtGridPeriodPayFeeBase = tblEditorTemplate.FindControl("detxtGridPeriodPayFeeBase") as ASPxTextBox;
            ASPxTextBox detxtGridPeriodPayProcBase = tblEditorTemplate.FindControl("detxtGridPeriodPayProcBase") as ASPxTextBox;

            Int32 editIndex = refObj.EditingRowVisibleIndex;
            if (editIndex > -1)
            {
                object theValues = refObj.GetRowValues(editIndex, new String[] { "PolPeriodId", "Period", "CarrierNameCn", "BranchName", "PayDate", "PayFeeBase", "PayProcBase" });
                object[] theValueList = theValues as object[];

                String period = theValueList[1].ToString();
                String carrierNameCn = theValueList[2].ToString();
                String branchName = theValueList[3].ToString();
                DateTime payDate;
                if ((theValueList[4] != null) && (theValueList[4].ToString() != ""))
                    payDate = Convert.ToDateTime(theValueList[4]);
                else
                    payDate = DateTime.Now;

                String payFeeBase = theValueList[5].ToString();
                String payProcBase = theValueList[6].ToString();


                if (this.gridPolicyPeriodStartEdit)
                {
                    detxtGridPeriodPeriod.Text = period;
                    detxtGridPeriodPayDate.Date = payDate;
                    detxtGridPeriodCarrierNameCn.Text = carrierNameCn;
                    detxtGridPeriodBranchName.Text = branchName;
                    detxtGridPeriodPayFeeBase.Text = payFeeBase;
                    detxtGridPeriodPayProcBase.Text = payProcBase;
                }
                else
                {
                    detxtGridPeriodPeriod.Text = period;
                    detxtGridPeriodCarrierNameCn.Text = carrierNameCn;
                    detxtGridPeriodBranchName.Text = branchName;
                }
            }

        }


        protected void gridPeriod_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            this.gridPolicyPeriodStartEdit = true;
        }


        protected void gridPeriod_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            String theKey = e.Keys[0].ToString();
            DevExpress.Web.ASPxGridView.ASPxGridView refObj = this.gridPeriod;
            HtmlTable tblEditorTemplate = refObj.FindEditFormTemplateControl("tblgridPeriodEditorTemplate") as HtmlTable;

            ASPxTextBox detxtGridPeriodPeriod = tblEditorTemplate.FindControl("detxtGridPeriodPeriod") as ASPxTextBox;
            ASPxDateEdit detxtGridPeriodPayDate = tblEditorTemplate.FindControl("detxtGridPeriodPayDate") as ASPxDateEdit;
            ASPxTextBox detxtGridPeriodCarrierNameCn = tblEditorTemplate.FindControl("detxtGridPeriodCarrierNameCn") as ASPxTextBox;
            ASPxTextBox detxtGridPeriodBranchName = tblEditorTemplate.FindControl("detxtGridPeriodBranchName") as ASPxTextBox;
            ASPxTextBox detxtGridPeriodPayFeeBase = tblEditorTemplate.FindControl("detxtGridPeriodPayFeeBase") as ASPxTextBox;
            ASPxTextBox detxtGridPeriodPayProcBase = tblEditorTemplate.FindControl("detxtGridPeriodPayProcBase") as ASPxTextBox;

            BusinessObjects.Policy.BO_PolicyPeriod newobj = new BusinessObjects.Policy.BO_PolicyPeriod(theKey);

            newobj.PayDate = detxtGridPeriodPayDate.Date;

            if (detxtGridPeriodPayFeeBase.Text != String.Empty)
            {
                newobj.PayFeeBase = Convert.ToDecimal(detxtGridPeriodPayFeeBase.Text);
            }
            if (detxtGridPeriodPayProcBase.Text != String.Empty)
            {
                newobj.PayProcBase = Convert.ToDecimal(detxtGridPeriodPayProcBase.Text);
            }

            try
            {
                newobj.Save(ModifiedAction.Update);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            //
            e.Cancel = true;
            this.gridPeriod.CancelEdit();

            rebindGridPeriod();

        }


        protected void gridPeriod_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridPeriod.DataBind();
        }

        protected void gridPeriod_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridPeriod.CancelEdit();
        }


        protected void gridPeriod_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridPeriod.CancelEdit();
        }


        protected void gridPeriod_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            //
        }


        protected void gridPeriod_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {

            DevExpress.Web.ASPxGridView.ASPxGridView refObj = this.gridPeriod;
            HtmlTable tblEditorTemplate = refObj.FindEditFormTemplateControl("tblgridPeriodEditorTemplate") as HtmlTable;


            ASPxDateEdit detxtGridPeriodPayDate = tblEditorTemplate.FindControl("detxtGridPeriodPayDate") as ASPxDateEdit;

            ASPxTextBox detxtGridPeriodPayFeeBase = tblEditorTemplate.FindControl("detxtGridPeriodPayFeeBase") as ASPxTextBox;
            ASPxTextBox detxtGridPeriodPayProcBase = tblEditorTemplate.FindControl("detxtGridPeriodPayProcBase") as ASPxTextBox;

            if (detxtGridPeriodPayDate.Value == null)
            {
                e.Errors[refObj.Columns[2]] = "必需项";
            }
            if (detxtGridPeriodPayFeeBase.Text.Trim() == "")
            {
                e.Errors[refObj.Columns[5]] = "必需项";
            }
            if (detxtGridPeriodPayFeeBase.Text.Trim() == "")
            {
                e.Errors[refObj.Columns[6]] = "必需项";
            }

            detxtGridPeriodPayDate.Validate();
            detxtGridPeriodPayFeeBase.Validate();
            detxtGridPeriodPayProcBase.Validate();

            if (string.IsNullOrEmpty(e.RowError) && e.Errors.Count > 0)
            {
                //this.gridPolicyPeriodStartEdit = true;
                e.RowError = "请修正所有的错误。";
            }


        }


        private void rebindGridPeriod()
        {
            this.gridPeriod.DataSource = BusinessObjects.Policy.BO_PolicyPeriod.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridPeriod.DataBind();
        }

        #endregion gridPeriod Events



        #region Privates


        private void loadPolicyValue(String id)
        {
            ListEditItem theselected;
            BusinessObjects.Policy.BO_Policy obj;
            obj = new BusinessObjects.Policy.BO_Policy(id);
            if (String.IsNullOrEmpty(obj.PolicyID)) return;

            BusinessObjects.Policy.BO_CarPolicy objCar;
            objCar = new BusinessObjects.Policy.BO_CarPolicy(obj.AskPriceID);

            
            dxetxtPolicyNo.Text = obj.PolicyNo;
            dxetxtAciPolicyNo.Text = obj.AciPolicyNo;
            this.dxetxtAskPriceID.Text = obj.AskPriceID;

            //dxeddlCarrierId
            if (!String.IsNullOrEmpty(objCar.CarrierID))
            {
                theselected = dxeddlCarrierId.Items.FindByValue(objCar.CarrierID);
                if (theselected != null)
                {
                    dxeddlCarrierId.SelectedItem = theselected;
                }
            }

            //dxeddlBranchId
            if (!String.IsNullOrEmpty(objCar.BranchID))
            {
                theselected = dxeddlBranchId.Items.FindByValue(objCar.BranchID);
                if (theselected != null)
                {
                    dxeddlBranchId.SelectedItem = theselected;
                }
            }


            this.dxetxtCarrierSales.Text = obj.CarrierSales;

            this.dxetxtCustomer.Text = obj.CustomerName;
            this.cusid.Value = obj.CustomerID;

            dxetxtBeneficiary.Text = obj.Beneficiary;
            if (String.IsNullOrEmpty(dxetxtBeneficiary.Text))
                dxetxtBeneficiary.Text = objCar.CustomerName;

            //dxeddlSourceTypeID
            if (!String.IsNullOrEmpty(obj.SourceTypeID))
            {
                theselected = dxeddlSourceTypeID.Items.FindByValue(obj.SourceTypeID);
                if (theselected != null)
                {
                    dxeddlSourceTypeID.SelectedItem = theselected;
                }
            }

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

            dxeStartDate.Date = obj.StartDate;
            dxeEndDate.Date = obj.EndDate;
            dxetxtSpecial.Text = obj.Special;

            dxetxtCiPremium.Text = String.Format(BasePage.TheTwoSF, obj.CiPremium);
            dxetxtAciPremium.Text = String.Format(BasePage.TheTwoSF, obj.AciPremium);
            dxetxtCstPremium.Text = String.Format(BasePage.TheTwoSF, obj.CstPremium);
            dxetxtCiProcessRate.Text = String.Format(BasePage.TheFourSF, obj.CiProcessRate);
            dxetxtAciProcessRate.Text = String.Format(BasePage.TheFourSF, obj.AciProcessRate);
            dxetxtCiProcess.Text = String.Format(BasePage.TheTwoSF, obj.CiProcess);
            dxetxtAciProcess.Text = String.Format(BasePage.TheTwoSF, obj.AciProcess);

            this.dxeAuditTime.Date = obj.AuditTime;
            this.dxetxtAuditPerson.Text = obj.AuditPerson;
            this.dxeMemo.Text = obj.Remark;
            
            dxetxtTotalPremium.Text = String.Format(BasePage.TheTwoSF, obj.CiPremium + obj.AciPremium + obj.CstPremium);
            dxetxtTotalProcess.Text = String.Format(BasePage.TheTwoSF, obj.CiProcess + obj.AciProcess);


        }


        private string savePolicy(String parameter, String policyState)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(CarPriceAlertInfo));
            CarPriceAlertInfo obj;

            obj = (CarPriceAlertInfo)serializer.ReadObject(ms);
            ms.Close();
            BO_Policy theSourceObj = new BO_Policy(this.lblSourcePolicyID.Text.Trim());
            BO_Policy theObject;
            if (String.IsNullOrEmpty(obj.PolicyID))
            {
                theObject = new BO_Policy();
                theObject.PolicyID = TranUtils.GetPolicyID();
                theObject.AskPriceID = theSourceObj.AskPriceID;
                theObject.PolicyStatus = policyState;
                theObject.PolicyType = Convert.ToInt32(BO_Policy.PolicyTypeEnum.Vehicle).ToString();
                theObject.ProdTypeID = productType;
                theObject.PolicyNo = theSourceObj.PolicyNo;

                theObject.AciPolicyNo = theSourceObj.AciPolicyNo;

                theObject.CarrierSales = theSourceObj.CarrierSales;
                theObject.CustomerID = theSourceObj.CustomerID;
                theObject.Beneficiary = theSourceObj.Beneficiary;

                theObject.DeptId = theSourceObj.DeptId;
                theObject.SalesId = theSourceObj.SalesId;

                theObject.SourceTypeID = theSourceObj.SourceTypeID;
                theObject.OperationType = theSourceObj.OperationType;
                theObject.GatheringType = theSourceObj.GatheringType;
                theObject.StartDate = theSourceObj.StartDate;
                theObject.EndDate = theSourceObj.EndDate;
                theObject.Special = theSourceObj.Special;
                theObject.CarNo = theSourceObj.CarNo;
                theObject.CarcaseNo = theSourceObj.CarcaseNo;
                theObject.UseCharacter = theSourceObj.UseCharacter;
                theObject.EngineNo = theSourceObj.EngineNo;
                theObject.CarUser = theSourceObj.CarUser;
                theObject.Capacity = theSourceObj.Capacity;
                theObject.RegisterDate = theSourceObj.RegisterDate;
                theObject.CarValue = theSourceObj.CarValue;

                //new value
                theObject.CiPremium = obj.CiPremium;
                theObject.AciPremium = obj.AciPremium;
                theObject.CstPremium = obj.CstPremium;

                theObject.CiProcessRate = obj.CiProcessRate;
                theObject.AciProcessRate = obj.AciProcessRate;
                theObject.CiProcess = obj.CiProcess;
                theObject.AciProcess = obj.AciProcess;

                
                //dxetxtTotalPremium.Text = String.Format(BasePage.TheTwoSF, obj.CiPremium + obj.AciPremium + obj.CstPremium);
                //dxetxtTotalProcess.Text = String.Format(BasePage.TheTwoSF, obj.CiProcess + obj.AciProcess);

                theObject.CreatePerson = this.CurrentUserID;
                theObject.CreateTime = DateTime.Now;

                theObject.Save(ModifiedAction.Insert);
                copyCarrierFromPrePolicy(theObject.PrevPolicyID, theObject.PolicyID);
            }
            else
            {
                theObject = new BO_Policy(obj.PolicyID);

                theObject.PolicyStatus = policyState;
                
                theObject.CiPremium = obj.CiPremium;
                theObject.AciPremium = obj.AciPremium;
                theObject.CstPremium = obj.CstPremium;

                theObject.CiProcessRate = obj.CiProcessRate;
                theObject.AciProcessRate = obj.AciProcessRate;
                theObject.CiProcess = obj.CiProcess;
                theObject.AciProcess = obj.AciProcess;

                theObject.ModifyPerson = this.CurrentUserID;
                theObject.ModifyTime = DateTime.Now;

                theObject.Save(ModifiedAction.Update);
            }

            BusinessObjects.Policy.BO_CarPolicy objCar;
            objCar = new BusinessObjects.Policy.BO_CarPolicy(theObject.AskPriceID);
            if (!String.IsNullOrEmpty(objCar.CarrierID) && !String.IsNullOrEmpty(objCar.BranchID))
            {
                BO_PolicyCarrier.DeleteByPolicyId(theObject.PolicyID);
                BO_PolicyPeriod.DeleteByPolicyId(theObject.PolicyID);
                BO_PolicyCarrier.CreateCarrier(objCar.CarrierID, objCar.BranchID, theObject.PolicyID, theObject.Premium,
                    theObject.PremiumRate, theObject.ProcessRate, theObject.Process);

                BO_Policy.ChangePeriod(theObject.PolicyID);
            }

            return theObject.PolicyID;

        }


        private void auditPolicySubmit(ref Int32 resultSign, ref string resultMSG)
        {
            String thePolicyID = this.dxetxtPolicyID.Text.Trim();
            String state;

            state = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.AppealAudit).ToString();

            BusinessObjects.Policy.BO_Policy.AuditPolicySubmit(thePolicyID, state, this.CurrentUserID, ref resultSign, ref resultMSG);

        }


        private void auditPolicy(String parameter, ref Int32 resultSign, ref string resultMSG)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(CarPriceAlertInfo));
            CarPriceAlertInfo obj;

            obj = (CarPriceAlertInfo)serializer.ReadObject(ms);
            ms.Close();

            String theID = this.dxetxtPolicyID.Text.Trim();


            String state;
            if (obj.AuditOrNot)
                state = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Audit).ToString();
            else
                state = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.AppealAudit).ToString();

            BusinessObjects.Policy.BO_Policy.AuditPolicy(theID, state, this.CurrentUserID, obj.Remark, ref resultSign, ref resultMSG);

        }


        private void auditBackPolicy(String parameter)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(CarPriceAlertInfo));
            CarPriceAlertInfo obj;

            obj = (CarPriceAlertInfo)serializer.ReadObject(ms);
            ms.Close();

            String theID = this.dxetxtPolicyID.Text.Trim();
            BO_Policy theObject;
            theObject = new BO_Policy(theID);

            theObject.PolicyStatus = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Input).ToString();

            //carPolicy.Memo =obj.
            //AuditOrNot
            theObject.AuditTime = DateTime.Now;
            theObject.AuditPerson = this.CurrentUserID;
            theObject.Remark = obj.Remark;
            theObject.Save(ModifiedAction.Update);
        }


        private void copyCarrierFromPrePolicy(String prePolicyID, String curPolicyID)
        {
            BO_PolicyCarrier newobj;

            List<BO_PolicyCarrier> thelist = BO_PolicyCarrier.FetchListByPolicy(prePolicyID);
            foreach (BO_PolicyCarrier item in thelist)
            {
                newobj = new BO_PolicyCarrier();

                newobj.PolicyCarrierID = Guid.NewGuid().ToString();
                newobj.PolicyID = curPolicyID;

                newobj.CarrierID = item.CarrierID;
                newobj.BranchID = item.BranchID;

                newobj.PolicyRate = item.PolicyRate;
                newobj.Premium = 0;
                newobj.PremiumBase = 0;
                newobj.ProcessRate = item.ProcessRate;
                newobj.Process = 0;
                newobj.ProcessBase = 0;
                newobj.Save(ModifiedAction.Insert);
            }
        }



        private void switchBasicInfoControlsEnable(Boolean val)
        {
            //dxetxtPolicyID.Enabled = val;
            dxetxtPolicyNo.Enabled = val;
            dxetxtAciPolicyNo.Enabled = val;
            dxetxtAskPriceID.Enabled = val;
            dxeddlCarrierId.Enabled = val;
            dxeddlBranchId.Enabled = val;
            dxetxtCarrierSales.Enabled = val;

            dxetxtCustomer.Enabled = val;

            dxetxtBeneficiary.Enabled = val;

            dxeddlSourceTypeID.Enabled = val;
            dxeddlDeptID.Enabled = val;
            dxeddlSalesId.Enabled = val;
            dxeddlGatheringType.Enabled = val;
            dxeddlOperationType.Enabled = val;
            dxeStartDate.Enabled = val;
            dxeEndDate.Enabled = val;
            dxetxtSpecial.Enabled = val;
            dxetxtCreatePerson.Enabled = val;
            dxeCreateTime.Enabled = val;
            
            //dxetxtCiPremium.Enabled = val;
            //dxetxtAciPremium.Enabled = val;
            //dxetxtCstPremium.Enabled = val;
            //dxetxtTotalPremium.Enabled = val;
            //dxetxtCiProcessRate.Enabled = val;
            //dxetxtAciProcessRate.Enabled = val;
            //dxetxtCiProcess.Enabled = val;
            //dxetxtAciProcess.Enabled = val;
            //dxetxtTotalProcess.Enabled = val;
        }



        #endregion Privates


        [DataContract(Namespace = "http://www.sheib.com")]
        public class CarPriceAlertInfo
        {
            public CarPriceAlertInfo()
            { }

            [DataMember]
            public String PolicyID { get; set; }

            [DataMember]
            public String PolicyNo { get; set; }

            [DataMember]
            public String AciPolicyNo { get; set; }

            [DataMember]
            public String AskPriceID { get; set; }

            [DataMember]
            public String CarrierID { get; set; }

            [DataMember]
            public String BranchID { get; set; }

            [DataMember]
            public String CarrierSales { get; set; }

            [DataMember]
            public String CustomerID { get; set; }

            [DataMember]
            public String Beneficiary { get; set; }

            [DataMember]
            public String SourceTypeID { get; set; }

            [DataMember]
            public String DeptId { get; set; }

            [DataMember]
            public String SalesId { get; set; }

            [DataMember]
            public String GatheringTypeID { get; set; }

            [DataMember]
            public String OperationTypeID { get; set; }

            [DataMember]
            public DateTime StartDate { get; set; }

            [DataMember]
            public DateTime EndDate { get; set; }

            [DataMember]
            public String Special { get; set; }

            [DataMember]
            public String CarNo { get; set; }

            [DataMember]
            public String CarcaseNo { get; set; }

            [DataMember]
            public String UseCharacter { get; set; }

            [DataMember]
            public String EngineNo { get; set; }

            [DataMember]
            public String CarUser { get; set; }

            [DataMember]
            public String Capacity { get; set; }

            [DataMember]
            public DateTime RegisterDate { get; set; }

            [DataMember]
            public String CarValue { get; set; }

            [DataMember]
            public Decimal CiPremium { get; set; }

            [DataMember]
            public Decimal AciPremium { get; set; }

            [DataMember]
            public Decimal CstPremium { get; set; }

            [DataMember]
            public Decimal TotalPremium { get; set; }

            [DataMember]
            public Decimal CiProcessRate { get; set; }

            [DataMember]
            public Decimal AciProcessRate { get; set; }

            [DataMember]
            public Decimal CiProcess { get; set; }

            [DataMember]
            public Decimal AciProcess { get; set; }

            [DataMember]
            public Decimal TotalProcess { get; set; }

            [DataMember]
            public string Remark { get; set; }

            [DataMember]
            public Boolean AuditOrNot { get; set; }


        }





    }


    

}
