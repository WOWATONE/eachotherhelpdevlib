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
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxGridView.Rendering;
using DevExpress.Web.ASPxClasses.Internal;

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

        private const string carpolicyNoExist = "carpolicynoexist";
        private Boolean gridPolicyItemStartEdit = false;

        public enum PageMode
        {
            Input,
            Audit
        }

        private Nullable<PageMode> pm;

        private Boolean gridItemEnabled = true;

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
                    rebindGridDocList();
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
                rebindGridDocList();
            }
            
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (this.pm == PageMode.Audit)
            {
                tbltrAuditExecuteAction.Visible = true;
                npExecuteAction.Visible = false;
                this.gridPolicyItem.Enabled = false;
                this.filesUploadControl.Enabled = false;
                if (String.IsNullOrEmpty(this.dxetxtAuditPerson.Text))
                {
                    this.dxetxtAuditPerson.Text = this.CurrentUserName;
                    this.dxeAuditTime.Date = DateTime.Now;
                }
                BusinessObjects.Policy.BO_CarPolicy obj;
                obj = new BusinessObjects.Policy.BO_CarPolicy(this.dxetxtAskPriceID.Text.Trim());

                if (obj.PolicyStatus == Convert.ToInt32(BusinessObjects.Policy.BO_CarPolicy.CarPolicyStatusEnum.Audit).ToString())
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


        protected void insuranceDetailTabPage_ActiveTabChanged(object source, DevExpress.Web.ASPxTabControl.TabControlEventArgs e)
        {
            BusinessObjects.Policy.BO_CarPolicy obj;
            obj = new BusinessObjects.Policy.BO_CarPolicy(this.dxetxtAskPriceID.Text.Trim());
            String state = Convert.ToInt32(BusinessObjects.Policy.BO_CarPolicy.CarPolicyStatusEnum.AppealAudit).ToString();
            
            if (this.insuranceDetailTabPage.ActiveTabIndex == 1)
            {
                rebindGridDocList();
                if (this.pm == PageMode.Audit || obj.PolicyStatus == state)
                    filesUploadControl.Enabled = false;
            }

            if (this.insuranceDetailTabPage.ActiveTabIndex == 2 || obj.PolicyStatus == state)
            {
                rebindGridDocList();
                if (this.pm == PageMode.Audit)
                    filesUploadControl.Enabled = false;
            }

            
        }


        #endregion Tab Events


        #region CallBack Events

        protected void dxeSaveCallback_Callback(object source, 
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String policystatus = Convert.ToInt32(BusinessObjects.Policy.BO_CarPolicy.CarPolicyStatusEnum.Input).ToString();
            String thePolicyID = saveCarPolicy(e.Parameter, policystatus);
            e.Result = thePolicyID;
        }


        protected void dxeSaveAndCheckCallback_Callback(object source, 
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            int resultSign = 0;
            String resultMSG = "";            
            String policystatus = Convert.ToInt32(BusinessObjects.Policy.BO_CarPolicy.CarPolicyStatusEnum.AppealAudit).ToString();
            String theResult = saveCarPolicy(e.Parameter, policystatus);
            if (theResult != carpolicyNoExist)
            {
                auditCarPolicySubmit(ref resultSign, ref resultMSG);
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
            auditBackCarPolicy(e.Parameter);
            e.Result = "complete";
        }


        protected void dxeAuditOkCallback_Callback(object source, 
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            int resultSign = 0;
            String resultMSG = "";
            auditCarPolicy(e.Parameter, ref resultSign, ref resultMSG);
            if (resultSign == 0)
                e.Result = resultSign.ToString();
            else
                e.Result = resultMSG;
        }

        #endregion CallBack Events



        #region gridPolicyItem Events

        protected void gridPolicyItem_HtmlEditFormCreated(object sender, 
            DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;
            
            ASPxTextBox dxetxtGridPolicyItemCarNo = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCarNo") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiPremium") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiProcessRate = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiProcessRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiProcess = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiProcess") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciPremium") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciProcessRate = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciProcessRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciProcess = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciProcess") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCstPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCstPremium") as ASPxTextBox;


            Int32 editIndex = this.gridPolicyItem.EditingRowVisibleIndex;
            if (editIndex > -1)
            {
                object theValues = this.gridPolicyItem.GetRowValues(editIndex, new String[] { "PolicyID", "CarNo", "CiPremium", "CiProcessRate", "CiProcess", "AciPremium", "AciProcessRate", "AciProcess", "CstPremium" });
                object[] theValueList = theValues as object[];
                if (this.gridPolicyItemStartEdit)
                {
                    dxetxtGridPolicyItemCarNo.Text = theValueList[1].ToString();
                    dxetxtGridPolicyItemCiPremium.Text = theValueList[2].ToString();
                    dxetxtGridPolicyItemCiProcessRate.Text = theValueList[3].ToString();
                    dxetxtGridPolicyItemCiProcess.Text = theValueList[4].ToString();
                    dxetxtGridPolicyItemAciPremium.Text = theValueList[5].ToString();
                    dxetxtGridPolicyItemAciProcessRate.Text = theValueList[6].ToString();
                    dxetxtGridPolicyItemAciProcess.Text = theValueList[7].ToString();
                    dxetxtGridPolicyItemCstPremium.Text = theValueList[8].ToString();
                }
            }

        }

        protected void gridPolicyItem_StartRowEditing(object sender, 
            DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            String theKey = e.EditingKeyValue.ToString();

            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxTextBox dxetxtGridPolicyItemCarNo = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCarNo") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiPremium") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiProcessRate = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiProcessRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiProcess = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiProcess") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciPremium") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciProcessRate = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciProcessRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciProcess = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciProcess") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCstPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCstPremium") as ASPxTextBox;
                        
            this.gridPolicyItemStartEdit = true;
        }


        protected void gridPolicyItem_RowUpdating(object sender, 
            DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            String theKey = e.Keys[0].ToString();
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;
                        
            ASPxTextBox dxetxtGridPolicyItemCarNo = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCarNo") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiPremium") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiProcessRate = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiProcessRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiProcess = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiProcess") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciPremium") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciProcessRate = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciProcessRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciProcess = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciProcess") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCstPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCstPremium") as ASPxTextBox;


            BusinessObjects.Policy.BO_Policy newobj = new BusinessObjects.Policy.BO_Policy(theKey);

            newobj.AskPriceID  = this.dxetxtAskPriceID.Text;


            if (dxetxtGridPolicyItemCarNo.Text != String.Empty)
            {
                newobj.CarNo = dxetxtGridPolicyItemCarNo.Text.Trim();
            }
            if (dxetxtGridPolicyItemCiPremium.Text != String.Empty)
            {
                newobj.CiPremium = Convert.ToDecimal(dxetxtGridPolicyItemCiPremium.Text);
            }
            if (dxetxtGridPolicyItemCiProcessRate.Text != String.Empty)
            {
                newobj.CiProcessRate = Convert.ToDecimal(dxetxtGridPolicyItemCiProcessRate.Text);
            }
            if (dxetxtGridPolicyItemCiProcess.Text != String.Empty)
            {
                newobj.CiProcess = Convert.ToDecimal(dxetxtGridPolicyItemCiProcess.Text);
            }

            if (dxetxtGridPolicyItemAciPremium.Text != String.Empty)
            {
                newobj.AciPremium = Convert.ToDecimal(dxetxtGridPolicyItemAciPremium.Text);
            }

            if (dxetxtGridPolicyItemAciProcessRate.Text != String.Empty)
            {
                newobj.AciProcessRate = Convert.ToDecimal(dxetxtGridPolicyItemAciProcessRate.Text);
            }

            if (dxetxtGridPolicyItemAciProcess.Text != String.Empty)
            {
                newobj.AciProcess = Convert.ToDecimal(dxetxtGridPolicyItemAciProcess.Text);
            }

            if (dxetxtGridPolicyItemCstPremium.Text != String.Empty)
            {
                newobj.CstPremium = Convert.ToDecimal(dxetxtGridPolicyItemCstPremium.Text);
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
            getInitPolicyData();

        }


        protected void gridPolicyItem_RowInserting(object sender, 
            DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxTextBox dxetxtGridPolicyItemCarNo = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCarNo") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiPremium") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiProcessRate = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiProcessRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiProcess = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiProcess") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciPremium") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciProcessRate = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciProcessRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciProcess = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciProcess") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCstPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCstPremium") as ASPxTextBox;


            BusinessObjects.Policy.BO_Policy newobj = new BusinessObjects.Policy.BO_Policy();

            newobj.PolicyID = TranUtils.GetPolicyID();

            newobj.AskPriceID = this.dxetxtAskPriceID.Text;

            if (dxetxtGridPolicyItemCarNo.Text != String.Empty)
            {
                newobj.CarNo = dxetxtGridPolicyItemCarNo.Text.Trim();
            }
            if (dxetxtGridPolicyItemCiPremium.Text != String.Empty)
            {
                newobj.CiPremium = Convert.ToDecimal(dxetxtGridPolicyItemCiPremium.Text);
            }
            if (dxetxtGridPolicyItemCiProcessRate.Text != String.Empty)
            {
                newobj.CiProcessRate = Convert.ToDecimal(dxetxtGridPolicyItemCiProcessRate.Text);
            }
            if (dxetxtGridPolicyItemCiProcess.Text != String.Empty)
            {
                newobj.CiProcess = Convert.ToDecimal(dxetxtGridPolicyItemCiProcess.Text);
            }

            if (dxetxtGridPolicyItemAciPremium.Text != String.Empty)
            {
                newobj.AciPremium = Convert.ToDecimal(dxetxtGridPolicyItemAciPremium.Text);
            }

            if (dxetxtGridPolicyItemAciProcessRate.Text != String.Empty)
            {
                newobj.AciProcessRate = Convert.ToDecimal(dxetxtGridPolicyItemAciProcessRate.Text);
            }

            if (dxetxtGridPolicyItemAciProcess.Text != String.Empty)
            {
                newobj.AciProcess = Convert.ToDecimal(dxetxtGridPolicyItemAciProcess.Text);
            }

            if (dxetxtGridPolicyItemCstPremium.Text != String.Empty)
            {
                newobj.CstPremium = Convert.ToDecimal(dxetxtGridPolicyItemCstPremium.Text);
            }

            try
            {
                BusinessObjects.Policy.BO_CarPolicy objCarPolicy;

                objCarPolicy = new BusinessObjects.Policy.BO_CarPolicy(this.dxetxtAskPriceID.Text.Trim());
                newobj.PolicyType = Convert.ToInt32(BO_Policy.PolicyTypeEnum.Vehicle).ToString();
                newobj.PolicyStatus = Convert.ToInt32(BO_Policy.PolicyStatusEnum.Input).ToString();

                newobj.DeptId = objCarPolicy.DeptId;
                newobj.SalesId = objCarPolicy.SalesId;
                newobj.CarrierSales = objCarPolicy.CarrierSales;
                newobj.CustomerID = objCarPolicy.CustomerID;
                newobj.SourceTypeID = objCarPolicy.SourceTypeID;
                newobj.OperationType = objCarPolicy.OperationType;
                newobj.GatheringType = objCarPolicy.GatheringType;

                newobj.CreatePerson = this.CurrentUserID;
                newobj.CreateTime = DateTime.Now;

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
                BusinessObjects.Policy.BO_Policy.Delete(theKey);
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

            ASPxTextBox dxetxtGridPolicyItemCarNo = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCarNo") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiPremium") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiProcessRate = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiProcessRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCiProcess = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCiProcess") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciPremium") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciProcessRate = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciProcessRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemAciProcess = tblEditorTemplate.FindControl("dxetxtGridPolicyItemAciProcess") as ASPxTextBox;
            ASPxTextBox dxetxtGridPolicyItemCstPremium = tblEditorTemplate.FindControl("dxetxtGridPolicyItemCstPremium") as ASPxTextBox;
                       

            if (String.IsNullOrEmpty(dxetxtGridPolicyItemCarNo.Text))
            {
                e.Errors[this.gridPolicyItem.Columns[1]] = "必需项";
                dxetxtGridPolicyItemCarNo.Validate();
            }
            if (String.IsNullOrEmpty(dxetxtGridPolicyItemCiPremium.Text))
            {
                e.Errors[this.gridPolicyItem.Columns[2]] = "必需项";
                dxetxtGridPolicyItemCiPremium.Validate();
            }
            if (String.IsNullOrEmpty(dxetxtGridPolicyItemCiProcessRate.Text))
            {
                e.Errors[this.gridPolicyItem.Columns[3]] = "必需项";
                dxetxtGridPolicyItemCiProcessRate.Validate();
            }
            if (String.IsNullOrEmpty(dxetxtGridPolicyItemCiProcess.Text))
            {
                e.Errors[this.gridPolicyItem.Columns[4]] = "必需项";
                dxetxtGridPolicyItemCiProcess.Validate();
            }

            if (String.IsNullOrEmpty(dxetxtGridPolicyItemAciPremium.Text))
            {
                e.Errors[this.gridPolicyItem.Columns[5]] = "必需项";
                dxetxtGridPolicyItemAciPremium.Validate();
            }

            if (String.IsNullOrEmpty(dxetxtGridPolicyItemAciProcessRate.Text))
            {
                e.Errors[this.gridPolicyItem.Columns[6]] = "必需项";
                dxetxtGridPolicyItemAciProcessRate.Validate();
            }

            if (String.IsNullOrEmpty(dxetxtGridPolicyItemAciProcess.Text))
            {
                e.Errors[this.gridPolicyItem.Columns[7]] = "必需项";
                dxetxtGridPolicyItemAciProcess.Validate();
            }

            if (String.IsNullOrEmpty(dxetxtGridPolicyItemCstPremium.Text))
            {
                e.Errors[this.gridPolicyItem.Columns[8]] = "必需项";
                dxetxtGridPolicyItemCstPremium.Validate();
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


        protected void gridPolicyItem_HtmlRowCreated(object sender,
            ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                String state ="0";
                object obj = e.GetValue("PolicyStatus");
                if (Convert.IsDBNull(obj))
                {
                    state = "0";
                }
                else
                {
                    state = Convert.ToString(obj);
                }

                GridViewCommandColumn objgcc = getCommandColumnLoop(this.gridPolicyItem);
                if (state == "1" || state == "2")
                {
                    //e.Row.Enabled = false;
                    GridViewCommandColumnButtonControl thebtn;
                    thebtn = (GridViewCommandColumnButtonControl)e.Row.Cells[objgcc.VisibleIndex].Controls[0];
                    thebtn.Enabled = false;

                    thebtn = (GridViewCommandColumnButtonControl)e.Row.Cells[objgcc.VisibleIndex].Controls[1];
                    thebtn.Enabled = false;
                    InternalHyperLink theIHL = (InternalHyperLink)thebtn.Controls[0];
                    theIHL.Text = "查看";
                }
                else
                {
                    e.Row.Enabled = true;
                }


            }
            
        }

        
        private void getInitPolicyData()
        {
            String where = " and B.AskPriceID != '' and B.AskPriceID = '" + this.dxetxtAskPriceID.Text.Trim() + "'";
            DataTable dt = BusinessObjects.Policy.BO_Policy.FetchPolicyList(where);
            this.gridPolicyItem.DataSource = dt;
            this.gridPolicyItem.DataBind();
            
        }

        private void getCallBackPolicyData()
        {
            getInitPolicyData();
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
            string policyFolder = this.dxetxtAskPriceID.Text.Trim();
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

                    //BO_CarPolicyDoc
                    BusinessObjects.Policy.BO_CarPolicyDoc.Delete(this.dxetxtAskPriceID.Text.Trim(), fileInfo.Name);

                    BusinessObjects.Policy.BO_CarPolicyDoc pdoc = new BusinessObjects.Policy.BO_CarPolicyDoc();
                    pdoc.CarPolicyDocID = Guid.NewGuid().ToString();
                    pdoc.DocName = fileInfo.Name;
                    pdoc.AskPriceID = this.dxetxtAskPriceID.Text.Trim();
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
            this.gridDocList.DataSource = BusinessObjects.Policy.BO_CarPolicyDoc.FetchListByCarPolicy(this.dxetxtAskPriceID.Text.Trim());
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

            this.dxetxtAuditPerson.Text = obj.AuditPerson;
            this.dxeAuditTime.Date = obj.AuditTime;
            this.dxeMemo.Text = obj.Remark;
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


        private void auditCarPolicy(String parameter, ref Int32 resultSign, ref string resultMSG)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(AskPriceInputInfo));
            AskPriceInputInfo obj;

            obj = (AskPriceInputInfo)serializer.ReadObject(ms);
            ms.Close();

            String theAskPriceID = this.dxetxtAskPriceID.Text.Trim();
            String state;
            if (obj.AuditOrNot)
                state = Convert.ToInt32(BusinessObjects.Policy.BO_CarPolicy.CarPolicyStatusEnum.Audit).ToString();
            else
                state = Convert.ToInt32(BusinessObjects.Policy.BO_CarPolicy.CarPolicyStatusEnum.AppealAudit).ToString();

            BusinessObjects.Policy.BO_CarPolicy.AuditCarPolicy(theAskPriceID, state, this.CurrentUserID, obj.Remark, ref resultSign, ref resultMSG);
            if (resultSign == 0)
            {
                if (obj.AuditOrNot)
                    state = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Audit).ToString();
                else
                    state = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.AppealAudit).ToString();

                BO_Policy.AuditByAskPriceID(theAskPriceID, state);
            }            
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

            //AuditOrNot
            objCarPolicy.AuditTime = DateTime.Now;
            objCarPolicy.AuditPerson = this.CurrentUserID;
            objCarPolicy.Remark = obj.Remark;
            objCarPolicy.Save(ModifiedAction.Update);

            BO_Policy.AuditByAskPriceID(theAskPriceID, Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Input).ToString());

        }


        private void auditCarPolicySubmit(ref Int32 resultSign, ref string resultMSG)
        {
            String theID = this.dxetxtAskPriceID.Text.Trim();
            String state;

            state = Convert.ToInt32(BusinessObjects.Policy.BO_CarPolicy.CarPolicyStatusEnum.AppealAudit).ToString();

            BusinessObjects.Policy.BO_CarPolicy.AuditCarPolicySubmit(theID, state, this.CurrentUserID, ref resultSign, ref resultMSG);

        }


        private GridViewCommandColumn getCommandColumnLoop(ASPxGridView grid)
        {
            GridViewCommandColumn theCommandColumn = null;
            foreach (GridViewColumn item in grid.VisibleColumns)
            {
                if (item.GetType() == typeof(GridViewCommandColumn))
                {
                    theCommandColumn = (GridViewCommandColumn)item;
                    break;
                }
            }            
            return theCommandColumn;
        }


        #endregion Privates


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
            public string Remark { get; set; }

            [DataMember]
            public Boolean AuditOrNot { get; set; }


        }




    }


   


}
