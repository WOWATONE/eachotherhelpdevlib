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
    public partial class CarPolicyInput : BasePage
    {

        #region Variables


        private const string currentPageModeKey = "CurrentPagePolicyMode";

        private const string inputQueryStringIDKey = "id";
        private const string inputQueryStringPageModeKey = "pagemode";
        private const string inputQueryStringAskPriceidKey = "askpriceid";
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

        public String CustomPageTitle = "车险保单录入";

        #endregion Variables


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack)
            {
                pm = ViewState[currentPageModeKey] as Nullable<PageMode>;                
            }
            else
            {
                this.dxetxtPolicyID.Text = Page.Request.QueryString[inputQueryStringIDKey];
                this.dxetxtAskPriceID.Text = Page.Request.QueryString[inputQueryStringAskPriceidKey];
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

                loadPolicyValue(this.dxetxtPolicyID.Text);
                
            }

            getInitPolicyData();
            rebindGridDocList();

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (this.pm == PageMode.Audit)
            {
                tbltrAuditExecuteAction.Visible = true;
                npExecuteAction.Visible = false;
                this.gridPolicyItem.Enabled = false;
                this.filesUploadControl.Enabled = false;
                switchBasicInfoControlsEnable(false);

                BusinessObjects.Policy.BO_Policy obj;
                obj = new BusinessObjects.Policy.BO_Policy(this.dxetxtPolicyID.Text.Trim());

                this.dxetxtAuditPerson.Text = this.CurrentUserName;
                this.dxeAuditTime.Date = obj.CreateTime;//DateTime.Now;

                //if (String.IsNullOrEmpty(this.dxetxtAuditPerson.Text))
                //{                    
                //}
                
                if (obj.PolicyStatus == Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Audit).ToString())
                {
                    this.dxebtnAuditOk.Text = "反审核";
                    this.dxebtnAuditBack.ClientEnabled = false;
                }
                CustomPageTitle = "车险保单审核";
                
            }
            else
            {
                tbltrAuditExecuteAction.Visible = false;
                npExecuteAction.Visible = true;
                this.dxetxtAuditPerson.Enabled = false;
                this.dxeAuditTime.Enabled = false;
                this.dxeMemo.Enabled = false;
                CustomPageTitle = "车险保单录入";
                
            }

            alwayBasicInfoControlsUnable();

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
                rebindGridDocList();
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


        protected void dxeGetGridPolicyItemTotalSummary_Callback(object source, 
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            object objval;
            objval = gridPolicyItem.GetTotalSummaryValue(gridPolicyItem.TotalSummary["Coverage"]);
            String Coverage = Convert.ToString(objval);
            if (Convert.IsDBNull(objval))
                Coverage = "0";
            else
                Coverage = Convert.ToString(objval);
            
            
            objval = gridPolicyItem.GetTotalSummaryValue(gridPolicyItem.TotalSummary["Premium"]);
            String Premium;
            if (Convert.IsDBNull(objval))
                Premium = "0";
            else
                Premium = Convert.ToString(objval);            
            
            e.Result = Coverage + ";" + Premium;
        }


        #endregion CallBack Events



        #region gridPolicyItem Events

        protected void gridPolicyItem_HtmlEditFormCreated(object sender,
            DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxComboBox dxecbGridPolicyItemProdID = tblEditorTemplate.FindControl("dxecbGridPolicyItemProdID") as ASPxComboBox;
            
            String sqlfilter = " AND A.ProdTypeID ='" + productType + "' ";
            dxecbGridPolicyItemProdID.DataSource = BusinessObjects.SchemaSetting.BO_Product.FetchList(sqlfilter);
            dxecbGridPolicyItemProdID.TextField = "ProdName";
            dxecbGridPolicyItemProdID.ValueField = "ProdID";
            dxecbGridPolicyItemProdID.DataBind();

            ASPxTextBox dxetxtGridPolicyCoverage = tblEditorTemplate.FindControl("dxetxtGridPolicyCoverage") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyPremium") as ASPxTextBox;


            Int32 editIndex = this.gridPolicyItem.EditingRowVisibleIndex;
            if (editIndex > -1)
            {
                object theValues = this.gridPolicyItem.GetRowValues(editIndex, new String[] { "ItemID", "PolicyId", "ProdID", "Coverage", "Premium", "ProcRate", "Process" });
                object[] theValueList = theValues as object[];
                if (this.gridPolicyItemStartEdit)
                {
                    ListEditItem theselected;
                    //String itemID = theValueList[0].ToString();
                    //String policyId = theValueList[1].ToString();
                    String prodID = theValueList[2].ToString();
                    theselected = dxecbGridPolicyItemProdID.Items.FindByValue(prodID);
                    if (theselected != null)
                    {
                        dxecbGridPolicyItemProdID.SelectedItem = theselected;
                    }
                    dxetxtGridPolicyCoverage.Text = theValueList[3].ToString();
                    dxetxtGridPolicyPremium.Text = theValueList[4].ToString();
                }
            }

        }

        protected void gridPolicyItem_StartRowEditing(object sender,
            DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            String theKey = e.EditingKeyValue.ToString();

            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxComboBox dxecbGridPolicyItemProdID = tblEditorTemplate.FindControl("dxecbGridPolicyItemProdID") as ASPxComboBox;
            ASPxTextBox dxetxtGridPolicyCoverage = tblEditorTemplate.FindControl("dxetxtGridPolicyCoverage") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyPremium") as ASPxTextBox;


            this.gridPolicyItemStartEdit = true;
        }


        protected void gridPolicyItem_RowUpdating(object sender,
            DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            String theKey = e.Keys[0].ToString();
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxComboBox dxecbGridPolicyItemProdID = tblEditorTemplate.FindControl("dxecbGridPolicyItemProdID") as ASPxComboBox;
            ASPxTextBox dxetxtGridPolicyCoverage = tblEditorTemplate.FindControl("dxetxtGridPolicyCoverage") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyPremium") as ASPxTextBox;


            BusinessObjects.Policy.BO_PolicyItem newobj = new BusinessObjects.Policy.BO_PolicyItem(theKey);

            newobj.PolicyId = this.dxetxtPolicyID.Text;

            newobj.ProdID = dxecbGridPolicyItemProdID.SelectedItem.Value.ToString();

            if (dxetxtGridPolicyCoverage.Text != String.Empty)
            {
                newobj.Coverage = Convert.ToDecimal(dxetxtGridPolicyCoverage.Text);
            }
            if (dxetxtGridPolicyPremium.Text != String.Empty)
            {
                newobj.Premium = Convert.ToDecimal(dxetxtGridPolicyPremium.Text);
            }
            
            newobj.ProcRate = 0;        
            newobj.Process = 0;
            
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
            getInitPolicyData();

        }


        protected void gridPolicyItem_RowInserting(object sender,
            DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxComboBox dxecbGridPolicyItemProdID = tblEditorTemplate.FindControl("dxecbGridPolicyItemProdID") as ASPxComboBox;
            ASPxTextBox dxetxtGridPolicyCoverage = tblEditorTemplate.FindControl("dxetxtGridPolicyCoverage") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyPremium") as ASPxTextBox;


            BusinessObjects.Policy.BO_PolicyItem newobj = new BusinessObjects.Policy.BO_PolicyItem();
            
            newobj.ItemID = Guid.NewGuid().ToString();
            newobj.PolicyId = this.dxetxtPolicyID.Text;

            newobj.ProdID = dxecbGridPolicyItemProdID.SelectedItem.Value.ToString();

            if (dxetxtGridPolicyCoverage.Text != String.Empty)
            {
                newobj.Coverage = Convert.ToDecimal(dxetxtGridPolicyCoverage.Text);
            }
            if (dxetxtGridPolicyPremium.Text != String.Empty)
            {
                newobj.Premium = Convert.ToDecimal(dxetxtGridPolicyPremium.Text);
            }

            newobj.ProcRate = 0;
            newobj.Process = 0;

            try
            {
                newobj.Save(ModifiedAction.Insert);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
            getInitPolicyData();

        }


        protected void gridPolicyItem_RowDeleting(object sender,
            DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String theKey = e.Keys[0].ToString();

            try
            {
                BusinessObjects.Policy.BO_PolicyItem.Delete(theKey);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
            getInitPolicyData();
        }


        protected void gridPolicyItem_RowValidating(object sender,
            DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            String appendDes = "必需项";
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxComboBox dxecbGridPolicyItemProdID = tblEditorTemplate.FindControl("dxecbGridPolicyItemProdID") as ASPxComboBox;
            ASPxTextBox dxetxtGridPolicyCoverage = tblEditorTemplate.FindControl("dxetxtGridPolicyCoverage") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyPremium") as ASPxTextBox;


            String theWhere = "";
            if (e.Keys.Count > 0)
            {
                theWhere = " AND ItemID !='" + e.Keys[0].ToString() + "'";
                theWhere = theWhere + " AND PolicyId = '" + this.dxetxtPolicyID.Text + "'";
            }
            else
            {
                theWhere = " AND PolicyId = '" + this.dxetxtPolicyID.Text + "'";
            }

            theWhere = theWhere + " AND ProdID = '" + dxecbGridPolicyItemProdID.SelectedItem.Value.ToString() + "'";

            if (dxecbGridPolicyItemProdID.SelectedItem == null)
            {
                e.Errors[this.gridPolicyItem.Columns[1]] = "必需项";

            }
            else
            {
                if (dxecbGridPolicyItemProdID.SelectedItem.Value.ToString() == String.Empty)
                {
                    e.Errors[this.gridPolicyItem.Columns[1]] = "必需项";
                }
                else
                {
                    //do nothing;
                }
            }


            Boolean exists = BusinessObjects.Policy.BO_PolicyItem.CheckPolicyProdtExist(theWhere);
            if (exists)
            {
                e.Errors[this.gridPolicyItem.Columns[2]] = "已存在";
                dxecbGridPolicyItemProdID.ValidationSettings.RegularExpression.ErrorText = "已存在";
                dxecbGridPolicyItemProdID.ValidationSettings.RegularExpression.ValidationExpression = @"^\d+";
                dxecbGridPolicyItemProdID.ValidationSettings.RegularExpression.EvaluateIsValid("abc");
                appendDes = "此保险项目已存在";
            }
            dxecbGridPolicyItemProdID.Validate();


            if (String.IsNullOrEmpty(dxetxtGridPolicyCoverage.Text))
            {
                e.Errors[this.gridPolicyItem.Columns[2]] = "必需项";
                dxetxtGridPolicyCoverage.Validate();
            }

            if (String.IsNullOrEmpty(dxetxtGridPolicyPremium.Text))
            {
                e.Errors[this.gridPolicyItem.Columns[3]] = "必需项";
                dxetxtGridPolicyPremium.Validate();
            }

            if (string.IsNullOrEmpty(e.RowError) && e.Errors.Count > 0) e.RowError = "请修正所有的错误(" + appendDes + ")。";

        }


        protected void gridPolicyItem_CustomCallback(object sender,
            DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            String theParam = e.Parameters;
            if (theParam == "unabled")
                this.gridPolicyItem.Enabled = false; 
            getInitPolicyData();
        }


        private void getInitPolicyData()
        {
            this.gridPolicyItem.DataSource = BusinessObjects.Policy.BO_PolicyItem.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridPolicyItem.DataBind();
        }

        
        #endregion gridPolicyItem Events




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



        protected void gridDocList_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            rebindGridDocList();
        }


        private void rebindGridDocList()
        {
            this.gridDocList.DataSource = BusinessObjects.Policy.BO_PolicyDoc.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
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
            if (String.IsNullOrEmpty(obj.PolicyID))
            {
                if (String.IsNullOrEmpty(this.dxetxtAskPriceID.Text.Trim())) return;
                
                loadDataFromAskPrice(this.dxetxtAskPriceID.Text.Trim());
                
                return;
            }

            

            BusinessObjects.Policy.BO_CarPolicy objCar;
            objCar = new BusinessObjects.Policy.BO_CarPolicy(obj.AskPriceID);

            dxetxtPolicyID.Text = obj.PolicyID ;
            dxetxtPolicyNo.Text = obj.PolicyNo;
            dxetxtAciPolicyNo.Text = obj.AciPolicyNo ;
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

            dxetxtBeneficiary.Text  = obj.Beneficiary;

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

            dxeStartDate.Date  = obj.StartDate ;
            dxeEndDate.Date = obj.EndDate ;
            dxetxtSpecial.Text  = obj.Special ;

            dxetxtCarNo.Text = obj.CarNo;
            dxetxtCarcaseNo.Text = obj.CarcaseNo;
            dxetxtUseCharacter.Text = obj.UseCharacter;
            dxetxtEngineNo.Text = obj.EngineNo;
            dxetxtCarUser.Text = obj.CarUser;
            dxetxtCapacity.Text = obj.Capacity;
            dxeRegisterDate.Date  = obj.RegisterDate;
            dxetxtCarValue.Text = obj.CarValue;

            //
            dxetxtCiPremium.Text = String.Format(BasePage.TheTwoSF, obj.CiPremium);
            dxetxtAciPremium.Text = String.Format(BasePage.TheTwoSF, obj.AciPremium);
            dxetxtCstPremium.Text = String.Format(BasePage.TheTwoSF, obj.CstPremium);
            dxetxtCiProcessRate.Text = String.Format(BasePage.TheFourSF, obj.CiProcessRate);
            dxetxtAciProcessRate.Text = String.Format(BasePage.TheFourSF, obj.AciProcessRate);
            dxetxtCiProcess.Text = String.Format(BasePage.TheTwoSF, obj.CiProcess);
            dxetxtAciProcess.Text = String.Format(BasePage.TheTwoSF, obj.AciProcess);

            dxeCreateTime.Date = obj.CreateTime;
            this.dxeAuditTime.Date = obj.AuditTime;
            this.dxetxtAuditPerson.Text = obj.AuditPerson;
            this.dxeMemo.Text = obj.Remark;

            dxetxtTotalPremium.Text = String.Format(BasePage.TheTwoSF, obj.Premium);            
            dxetxtTotalProcess.Text = String.Format(BasePage.TheTwoSF, obj.Process);

            dxetxtCreatePerson.Text = obj.CreatePerson;
            dxeCreateTime.Date = obj.CreateTime;

        }


        private string savePolicy(String parameter, String policyState)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(CarPriceInputInfo));
            CarPriceInputInfo obj;

            obj = (CarPriceInputInfo)serializer.ReadObject(ms);
            ms.Close();

            BO_Policy theObject;
            if (String.IsNullOrEmpty(obj.PolicyID))
            {
                theObject = new BO_Policy();
                theObject.PolicyID = TranUtils.GetPolicyID();
                theObject.AskPriceID = obj.AskPriceID;
                theObject.PolicyStatus = policyState;
                theObject.PolicyType = Convert.ToInt32(BO_Policy.PolicyTypeEnum.Vehicle).ToString();
                theObject.PolicyNo = obj.PolicyNo;
                theObject.ProdTypeID = productType;
                theObject.AciPolicyNo  = obj.AciPolicyNo ;

                theObject.CarrierSales = obj.CarrierSales;
                theObject.CustomerID = obj.CustomerID;
                theObject.Beneficiary   = obj.Beneficiary;
                
                theObject.DeptId = obj.DeptId;
                theObject.SalesId = obj.SalesId;
                
                theObject.SourceTypeID = obj.SourceTypeID;
                theObject.OperationType = obj.OperationTypeID;
                theObject.GatheringType = obj.GatheringTypeID;
                theObject.StartDate = this.dxeStartDate.Date;//obj.StartDate  ;
                theObject.EndDate = this.dxeEndDate.Date;//obj.EndDate;
                theObject.Special = obj.Special;
                theObject.CarNo = obj.CarNo;
                theObject.CarcaseNo = obj.CarcaseNo;
                theObject.UseCharacter = obj.UseCharacter;
                theObject.EngineNo = obj.EngineNo;
                theObject.CarUser = obj.CarUser;
                theObject.Capacity = obj.Capacity;
                theObject.RegisterDate = obj.RegisterDate;
                theObject.CarValue = obj.CarValue;
                theObject.CiPremium = obj.CiPremium;
                theObject.AciPremium = obj.AciPremium;
                theObject.CstPremium = obj.CstPremium;
                
                theObject.CiProcessRate = obj.CiProcessRate;
                theObject.AciProcessRate = obj.AciProcessRate;
                theObject.CiProcess = obj.CiProcess;
                theObject.AciProcess = obj.AciProcess;

                theObject.Premium = obj.TotalPremium;
                theObject.PremiumBase = obj.TotalPremium;
                theObject.PremiumRate = 0;

                theObject.Process = obj.TotalProcess;
                theObject.ProcessBase = obj.TotalProcess;
                theObject.ProcessRate = 0;
                                
                theObject.CreatePerson = this.CurrentUserID;
                theObject.CreateTime = dxeCreateTime.Date;

                theObject.Save(ModifiedAction.Insert);
                
            }
            else
            {
                theObject = new BO_Policy(obj.PolicyID);

                theObject.PolicyStatus = policyState;

                theObject.PolicyNo = obj.PolicyNo;

                theObject.AciPolicyNo = obj.AciPolicyNo;

                theObject.CarrierSales = obj.CarrierSales;
                theObject.CustomerID = obj.CustomerID;
                theObject.Beneficiary = obj.Beneficiary;

                theObject.DeptId = obj.DeptId;
                theObject.SalesId = obj.SalesId;

                theObject.SourceTypeID = obj.SourceTypeID;
                theObject.OperationType = obj.OperationTypeID;
                theObject.GatheringType = obj.GatheringTypeID;                
                theObject.StartDate = this.dxeStartDate.Date;//obj.StartDate  ;
                theObject.EndDate = this.dxeEndDate.Date;//obj.EndDate;
                theObject.Special = obj.Special;
                theObject.CarNo = obj.CarNo;
                theObject.CarcaseNo = obj.CarcaseNo;
                theObject.UseCharacter = obj.UseCharacter;
                theObject.EngineNo = obj.EngineNo;
                theObject.CarUser = obj.CarUser;
                theObject.Capacity = obj.Capacity;
                theObject.RegisterDate = obj.RegisterDate;
                theObject.CarValue = obj.CarValue;
                theObject.CiPremium = obj.CiPremium;
                theObject.AciPremium = obj.AciPremium;
                theObject.CstPremium = obj.CstPremium;

                theObject.CiProcessRate = obj.CiProcessRate;
                theObject.AciProcessRate = obj.AciProcessRate;
                theObject.CiProcess = obj.CiProcess;
                theObject.AciProcess = obj.AciProcess;

                theObject.Premium = obj.TotalPremium;
                theObject.PremiumBase = obj.TotalPremium;
                theObject.PremiumRate = 0;

                theObject.Process = obj.TotalProcess;
                theObject.ProcessBase = obj.TotalProcess;
                theObject.ProcessRate = 0;

                theObject.ModifyPerson = this.CurrentUserID;
                theObject.ModifyTime = DateTime.Now;
                theObject.CreateTime = dxeCreateTime.Date;

                theObject.Save(ModifiedAction.Update);
            }

            BusinessObjects.Policy.BO_CarPolicy objCar;
            objCar = new BusinessObjects.Policy.BO_CarPolicy(theObject.AskPriceID);
            if (!String.IsNullOrEmpty(objCar.CarrierID) && !String.IsNullOrEmpty(objCar.BranchID))
            {
                BO_PolicyCarrier.DeleteByPolicyId(theObject.PolicyID);
                BO_PolicyPeriod.DeleteByPolicyId(theObject.PolicyID);
                BO_PolicyCarrier.CreateCarrier(objCar.CarrierID, objCar.BranchID, theObject.PolicyID, 
                    100, theObject.Premium, theObject.ProcessRate, theObject.Process);

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
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(CarPriceInputInfo));
            CarPriceInputInfo obj;

            obj = (CarPriceInputInfo)serializer.ReadObject(ms);
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
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(CarPriceInputInfo));
            CarPriceInputInfo obj;

            obj = (CarPriceInputInfo)serializer.ReadObject(ms);
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


        private void switchBasicInfoControlsEnable(Boolean val)
        {
            dxetxtPolicyID.Enabled = val;
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

            dxetxtCarNo.Enabled = val;
            dxetxtCarcaseNo.Enabled = val;
            dxetxtUseCharacter.Enabled = val;
            dxetxtEngineNo.Enabled = val;
            dxetxtCarUser.Enabled = val;
            dxetxtCapacity.Enabled = val;
            dxeRegisterDate.Enabled = val;
            dxetxtCarValue.Enabled = val;

            dxetxtCiPremium.Enabled = val;
            dxetxtAciPremium.Enabled = val;
            dxetxtCstPremium.Enabled = val;
            dxetxtTotalPremium.Enabled = val;
            dxetxtCiProcessRate.Enabled = val;
            dxetxtAciProcessRate.Enabled = val;
            dxetxtCiProcess.Enabled = val;
            dxetxtAciProcess.Enabled = val;
            dxetxtTotalProcess.Enabled = val;
        }


        private void loadDataFromAskPrice(String id)
        {
            ListEditItem theselected;
            BusinessObjects.Policy.BO_CarPolicy objCar;
            objCar = new BusinessObjects.Policy.BO_CarPolicy(id);
            
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


            this.dxetxtCarrierSales.Text = objCar.CarrierSales;

            this.dxetxtCustomer.Text = objCar.CustomerName;
            this.cusid.Value = objCar.CustomerID;

            dxetxtBeneficiary.Text = objCar.Beneficiary;
            if (String.IsNullOrEmpty(dxetxtBeneficiary.Text))
                dxetxtBeneficiary.Text = objCar.CustomerName;

            //dxeddlSourceTypeID
            if (!String.IsNullOrEmpty(objCar.SourceTypeID))
            {
                theselected = dxeddlSourceTypeID.Items.FindByValue(objCar.SourceTypeID);
                if (theselected != null)
                {
                    dxeddlSourceTypeID.SelectedItem = theselected;
                }
            }

            //dxeddlDeptID
            if (!String.IsNullOrEmpty(objCar.DeptId))
            {
                theselected = dxeddlDeptID.Items.FindByValue(objCar.DeptId);
                if (theselected != null)
                {
                    dxeddlDeptID.SelectedItem = theselected;
                }
            }

            //dxeddlSalesId
            if (!String.IsNullOrEmpty(objCar.SalesId))
            {
                theselected = dxeddlSalesId.Items.FindByValue(objCar.SalesId);
                if (theselected != null)
                {
                    dxeddlSalesId.SelectedItem = theselected;
                }
            }

            //dxeddlOperationType
            if (!String.IsNullOrEmpty(objCar.OperationType))
            {
                theselected = dxeddlOperationType.Items.FindByValue(objCar.OperationType);
                if (theselected != null)
                {
                    dxeddlOperationType.SelectedItem = theselected;
                }
            }

            //dxeddlGatheringType
            if (!String.IsNullOrEmpty(objCar.GatheringType))
            {
                theselected = dxeddlGatheringType.Items.FindByValue(objCar.GatheringType);
                if (theselected != null)
                {
                    dxeddlGatheringType.SelectedItem = theselected;
                }
            }

            dxetxtSpecial.Text = objCar.Remark;
            //dxetxtCreatePerson.Text = objCar.CreatePerson;
            dxeCreateTime.Date = objCar.CreateTime;

        }

        private void alwayBasicInfoControlsUnable()
        {
            Boolean val = true;
            dxetxtCreatePerson.ReadOnly = val;
            dxetxtCreatePerson.ClientEnabled = false;
            dxetxtCreatePerson.ReadOnlyStyle.ForeColor = System.Drawing.Color.LightGray;
            dxetxtCreatePerson.ReadOnlyStyle.Border.BorderColor = System.Drawing.Color.LightGray;

            dxeCreateTime.ReadOnly = val;
            dxeCreateTime.ClientEnabled = false;
            dxeCreateTime.ReadOnlyStyle.CopyFrom(dxetxtCreatePerson.ReadOnlyStyle);

        }

        #endregion Privates




        [DataContract(Namespace = "http://www.sheib.com")]
        public class CarPriceInputInfo
        {
            public CarPriceInputInfo()
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
