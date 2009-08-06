using System;
using System.IO;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using BusinessObjects;


namespace BrokerWebApp.otherinsurance
{
    public partial class PolicyInput : BasePage
    {

        #region Variables

        private const string currentPageModeKey = "CurrentPagePolicyMode";
        private const string inputQueryStringIDKey = "id";
        private const string inputQueryStringPageModeKey = "pagemode";        
        private const string UploadDirectory = "~/UploadFiles/PolicyUploadFiles/";
        //private const int ThumbnailSize = 100;
        private const string policyNoExist = "policynoexist";

        private Boolean gridCarrierStartEdit = false;
        private Boolean gridPolicyItemStartEdit = false;
        private Boolean gridPolicyPeriodStartEdit = false;

        private string toadd = string.Empty;

        public enum PageMode
        {
            Input,
            Audit
        }

        private Nullable<PageMode> pm;

        public String CustomPageTitle = "非车险保单录入";

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
                this.pagemode.Value = Page.Request.QueryString[inputQueryStringPageModeKey];
                bindDropDownLists();
                
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

                this.dxetxtCreatePerson.Text = this.CurrentUserName;
                this.dxedtCreateTime.Date = DateTime.Today;

                if (!string.IsNullOrEmpty(this.dxetxtPolicyID.Text.Trim()))
                {
                    loadPolicyValue(this.dxetxtPolicyID.Text.Trim());
                }
            }


            

            rebindGridPolicyItem();
            rebindGridCarrier();
            rebindGridPeriod();
            rebindGridDocList();            
        }


        protected void dxeSaveCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String policystatus = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Input).ToString();
            String theResult = savePolicy(e.Parameter, policystatus);
            e.Result = theResult;
        }


        protected void dxeSaveAndCheckCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
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


        protected void dxeAuditOkCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            int resultSign = 0;
            String resultMSG = "";
            auditPolicy(e.Parameter, ref resultSign, ref resultMSG);
            if (resultSign ==0)
                e.Result = resultSign.ToString();
            else
                e.Result = resultMSG;
        }


        protected void Page_PreRender(object sender, EventArgs e)
        {

            if (this.pm == PageMode.Audit)
            {
                tbltrAuditExecuteAction.Visible = true;
                npNewExecuteAction.Visible = false;
                this.dxebtntopSave.Visible = false;
                this.gridCarrier.Enabled = false;
                this.gridPolicyItem.Enabled = false;
                this.gridPeriod.Enabled = false;
                this.filesUploadControl.Enabled = false;
                CustomPageTitle = "非车险保单审核";
                if (!Page.IsPostBack)
                {
                    if (String.IsNullOrEmpty(this.dxetxtAuditPerson.Text))
                    {
                        this.dxetxtAuditPerson.Text = this.CurrentUserName;
                        this.dxeCheckDate.Date = DateTime.Now;
                    }
                    BusinessObjects.Policy.BO_Policy obj;
                    obj = new BusinessObjects.Policy.BO_Policy(this.dxetxtPolicyID.Text.Trim());

                    if (obj.PolicyStatus == Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Audit).ToString())
                    {
                        this.dxebtnAuditOk.Text = "反审核";
                        this.dxebtnAuditBack.ClientEnabled = false;
                    }
                    
                }
            }
            else
            {
                CustomPageTitle = "非车险保单录入";
                tbltrAuditExecuteAction.Visible = false;
                npNewExecuteAction.Visible = true;
            }

            
        }



        protected void dxeddlSalesIdCallback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(e.Parameter);
            thecb.TextField = "UserNameCn";
            thecb.ValueField = "UserID";
            thecb.DataBind();
            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }

        }


        protected void dxeGetGridPolicyItemTotalSummary_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
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

            objval = gridPolicyItem.GetTotalSummaryValue(gridPolicyItem.TotalSummary["Process"]);
            String Process;
            if (Convert.IsDBNull(objval))
                Process = "0";
            else
                Process = Convert.ToString(objval); 
            

            e.Result = Coverage + ";" + Premium + ";" + Process;
        }


        protected void dxeAuditBackCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            auditBackPolicy(e.Parameter);
            e.Result = "complete";
        }

        #endregion Page Events


        #region Tab Events


        protected void insuranceDetailTabPage_ActiveTabChanged(object source, DevExpress.Web.ASPxTabControl.TabControlEventArgs e)
        {
            if (this.insuranceDetailTabPage.ActiveTabIndex == 1)
            {
                rebindGridDocList();
                if (this.pm == PageMode.Audit)
                    filesUploadControl.Enabled = false;
            }

            if (this.insuranceDetailTabPage.ActiveTabIndex == 2)
            {
                rebindGridPeriod();
                if (this.pm == PageMode.Audit)
                    gridPeriod.Enabled = false;
            }

            if (this.insuranceDetailTabPage.ActiveTabIndex == 3)
            {
                rebindGridPeriod();
                if (this.pm != PageMode.Audit)
                {
                    dxetxtAuditPerson.Enabled = false;
                    dxeCheckDate.Enabled = false;
                    dxeMemo.Enabled = false;
                }

            }
        }


        #endregion Tab Events


        #region gridPolicyItem Events


        protected void gridPolicyItem_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxComboBox dxecbGridPolicyItemProdID = tblEditorTemplate.FindControl("dxecbGridPolicyItemProdID") as ASPxComboBox;
            String prouctType;
            if (this.ptid.Value ==null)
            {
                prouctType = "";
            }
            else
            {
                prouctType = this.ptid.Value.ToString();
            }
            String sqlfilter = " AND A.ProdTypeID ='" + prouctType + "' ";
            dxecbGridPolicyItemProdID.DataSource = BusinessObjects.SchemaSetting.BO_Product.FetchList(sqlfilter);
            dxecbGridPolicyItemProdID.TextField = "ProdName";
            dxecbGridPolicyItemProdID.ValueField = "ProdID";
            dxecbGridPolicyItemProdID.DataBind();

            ASPxTextBox dxetxtPolicyItemCoverage = tblEditorTemplate.FindControl("dxetxtPolicyItemCoverage") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemPremium = tblEditorTemplate.FindControl("dxetxtPolicyItemPremium") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemProcRate = tblEditorTemplate.FindControl("dxetxtPolicyItemProcRate") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemProcess = tblEditorTemplate.FindControl("dxetxtPolicyItemProcess") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemPremiumRate = tblEditorTemplate.FindControl("dxetxtPolicyItemPremiumRate") as ASPxTextBox;
            

            Int32 editIndex = this.gridPolicyItem.EditingRowVisibleIndex;
            if (editIndex > -1)
            {
                object theValues = this.gridPolicyItem.GetRowValues(editIndex, new String[] { "ItemID", "PolicyId", "ProdID", "Coverage", "Premium", "ProcRate", "Process", "PremiumRate" });
                object[] theValueList = theValues as object[];

                //String itemID = theValueList[0].ToString();
                //String policyId = theValueList[1].ToString();
                String prodID, coverage, premium, procRate, process, premiumRate;
                if (theValueList[2] == null)
                    prodID = "";
                else
                    prodID = theValueList[2].ToString();

                if (theValueList[3] == null)
                    coverage = "";
                else
                    coverage = String.Format(BasePage.TheTwoSF, theValueList[3]); //theValueList[3].ToString();

                if (theValueList[4] == null)
                    premium = "";
                else
                    premium = String.Format(BasePage.TheTwoSF, theValueList[4]);

                if (theValueList[5] == null)
                    procRate = "";
                else
                    procRate = String.Format(BasePage.TheTwoSF, theValueList[5]);

                if (theValueList[6] == null)
                    process = "";
                else
                    process = String.Format(BasePage.TheTwoSF, theValueList[6]);

                if (theValueList[7] == null)
                    premiumRate = "";
                else
                    premiumRate = String.Format(BasePage.TheTwoSF, theValueList[7]);

                ListEditItem theselected;
                if (this.gridPolicyItemStartEdit)
                {
                    theselected = dxecbGridPolicyItemProdID.Items.FindByValue(prodID);
                    if (theselected != null)
                    {
                        dxecbGridPolicyItemProdID.SelectedItem = theselected;
                    }
                    
                    dxetxtPolicyItemCoverage.Text = coverage;
                    dxetxtPolicyItemPremium.Text = premium;
                    dxetxtPolicyItemProcRate.Text = procRate;
                    dxetxtPolicyItemProcess.Text = process;
                    dxetxtPolicyItemPremiumRate.Text = premiumRate;

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

            ASPxComboBox dxecbGridPolicyItemProdID = tblEditorTemplate.FindControl("dxecbGridPolicyItemProdID") as ASPxComboBox;
            //
            ASPxTextBox dxetxtPolicyItemCoverage = tblEditorTemplate.FindControl("dxetxtPolicyItemCoverage") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemPremium = tblEditorTemplate.FindControl("dxetxtPolicyItemPremium") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemProcRate = tblEditorTemplate.FindControl("dxetxtPolicyItemProcRate") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemProcess = tblEditorTemplate.FindControl("dxetxtPolicyItemProcess") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemPremiumRate = tblEditorTemplate.FindControl("dxetxtPolicyItemPremiumRate") as ASPxTextBox;
            

            BusinessObjects.Policy.BO_PolicyItem newobj = new BusinessObjects.Policy.BO_PolicyItem(theKey);

            newobj.PolicyId = this.dxetxtPolicyID.Text;

            newobj.ProdID = dxecbGridPolicyItemProdID.SelectedItem.Value.ToString();

            if (dxetxtPolicyItemCoverage.Text != String.Empty)
            {
                newobj.Coverage = Convert.ToDecimal(dxetxtPolicyItemCoverage.Text);
            }
            if (dxetxtPolicyItemPremium.Text != String.Empty)
            {
                newobj.Premium = Convert.ToDecimal(dxetxtPolicyItemPremium.Text);
            }
            if (dxetxtPolicyItemProcRate.Text != String.Empty)
            {
                newobj.ProcRate = Convert.ToDecimal(dxetxtPolicyItemProcRate.Text);
            }
            if (dxetxtPolicyItemProcess.Text != String.Empty)
            {
                newobj.Process = Convert.ToDecimal(dxetxtPolicyItemProcess.Text);
            }

            if (dxetxtPolicyItemPremiumRate.Text != String.Empty)
            {
                newobj.PremiumRate = Convert.ToDecimal(dxetxtPolicyItemPremiumRate.Text);
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

            rebindGridPolicyItem();



        }

        protected void gridPolicyItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxComboBox dxecbGridPolicyItemProdID = tblEditorTemplate.FindControl("dxecbGridPolicyItemProdID") as ASPxComboBox;
            //
            ASPxTextBox dxetxtPolicyItemCoverage = tblEditorTemplate.FindControl("dxetxtPolicyItemCoverage") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemPremium = tblEditorTemplate.FindControl("dxetxtPolicyItemPremium") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemProcRate = tblEditorTemplate.FindControl("dxetxtPolicyItemProcRate") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemProcess = tblEditorTemplate.FindControl("dxetxtPolicyItemProcess") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemPremiumRate = tblEditorTemplate.FindControl("dxetxtPolicyItemPremiumRate") as ASPxTextBox;
            

            BusinessObjects.Policy.BO_PolicyItem newobj = new BusinessObjects.Policy.BO_PolicyItem();

            newobj.ItemID = Guid.NewGuid().ToString();
            newobj.PolicyId = this.dxetxtPolicyID.Text;

            newobj.ProdID = dxecbGridPolicyItemProdID.SelectedItem.Value.ToString();

            if (dxetxtPolicyItemCoverage.Text != String.Empty)
            {
                newobj.Coverage = Convert.ToDecimal(dxetxtPolicyItemCoverage.Text);
            }
            if (dxetxtPolicyItemPremium.Text != String.Empty)
            {
                newobj.Premium = Convert.ToDecimal(dxetxtPolicyItemPremium.Text);
            }
            if (dxetxtPolicyItemProcRate.Text != String.Empty)
            {
                newobj.ProcRate = Convert.ToDecimal(dxetxtPolicyItemProcRate.Text);
            }
            if (dxetxtPolicyItemProcess.Text != String.Empty)
            {
                newobj.Process = Convert.ToDecimal(dxetxtPolicyItemProcess.Text);
            }

            if (dxetxtPolicyItemPremiumRate.Text != String.Empty)
            {
                newobj.PremiumRate = Convert.ToDecimal(dxetxtPolicyItemPremiumRate.Text);
            }

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

            rebindGridPolicyItem();

        }

        protected void gridPolicyItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
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

            rebindGridPolicyItem();

        }

        protected void gridPolicyItem_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
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
            String appendDes = "必需项";
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxComboBox dxecbGridPolicyItemProdID = tblEditorTemplate.FindControl("dxecbGridPolicyItemProdID") as ASPxComboBox;
            
            ASPxTextBox dxetxtPolicyItemCoverage = tblEditorTemplate.FindControl("dxetxtPolicyItemCoverage") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemPremium = tblEditorTemplate.FindControl("dxetxtPolicyItemPremium") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemProcRate = tblEditorTemplate.FindControl("dxetxtPolicyItemProcRate") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemProcess = tblEditorTemplate.FindControl("dxetxtPolicyItemProcess") as ASPxTextBox;
            //ASPxTextBox dxetxtPolicyItemPremiumRate = tblEditorTemplate.FindControl("dxetxtPolicyItemPremiumRate") as ASPxTextBox;
            
            
            if (dxecbGridPolicyItemProdID.SelectedItem == null)
            {
                theWhere = theWhere + " AND ProdID = '-1'";
                e.Errors[this.gridPolicyItem.Columns[1]] = "必需项";
            }
            else
            {
                theWhere = theWhere + " AND ProdID = '" + dxecbGridPolicyItemProdID.SelectedItem.Value.ToString() + "'";
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

            if (string.IsNullOrEmpty(e.RowError) && e.Errors.Count > 0) e.RowError = "请修正所有的错误(" + appendDes + ")。";

        }


        private void rebindGridPolicyItem()
        {
            this.gridPolicyItem.DataSource = BusinessObjects.Policy.BO_PolicyItem.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridPolicyItem.DataBind();
        }

        #endregion gridPolicyItem Events


        #region gridCarrier Events

        protected void gridCarrier_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {

            HtmlTable tblEditorTemplate = this.gridCarrier.FindEditFormTemplateControl("tblgridCarrierEditorTemplate") as HtmlTable;

            ASPxComboBox dxecbGridCarrierCarrierID = tblEditorTemplate.FindControl("dxecbGridCarrierCarrierID") as ASPxComboBox;
            dxecbGridCarrierCarrierID.DataSource = BusinessObjects.SchemaSetting.BO_Carrier.FetchList();
            dxecbGridCarrierCarrierID.TextField = "CarrierNameCn";
            dxecbGridCarrierCarrierID.ValueField = "CarrierID";
            dxecbGridCarrierCarrierID.DataBind();


            ASPxComboBox dxecbGridCarrierBranchID = tblEditorTemplate.FindControl("dxecbGridCarrierBranchID") as ASPxComboBox;

            ASPxTextBox dxetxtGridCarrierPolicyRate = tblEditorTemplate.FindControl("dxetxtGridCarrierPolicyRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierPremium = tblEditorTemplate.FindControl("dxetxtGridCarrierPremium") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierPremiumBase = tblEditorTemplate.FindControl("dxetxtGridCarrierPremiumBase") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierProcessRate = tblEditorTemplate.FindControl("dxetxtGridCarrierProcessRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierProcess = tblEditorTemplate.FindControl("dxetxtGridCarrierProcess") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierProcessBase = tblEditorTemplate.FindControl("dxetxtGridCarrierProcessBase") as ASPxTextBox;

            Int32 editIndex = this.gridCarrier.EditingRowVisibleIndex;
            if (editIndex > -1)
            {
                object theValues = this.gridCarrier.GetRowValues(editIndex, new String[] { "PolicyID", "CarrierID", "BranchID", "PolicyRate", "Premium", "PremiumBase", "Process", "ProcessRate", "ProcessBase" });
                object[] theValueList = theValues as object[];

                String carrierID, brancheID, policyRate, premium, premiumBase, process, processRate, processBase;
                if (theValueList[1] == null)
                    carrierID = "";
                else
                    carrierID = theValueList[1].ToString();

                if (theValueList[2] == null)
                    brancheID = "";
                else
                    brancheID = theValueList[2].ToString();

                if (theValueList[3] == null)
                {
                    policyRate = this.dxetxtProcessRate.Text.Trim();
                }
                else
                    policyRate = String.Format(BasePage.TheTwoSF, theValueList[3]);

                if (theValueList[4] == null)
                    premium = "";
                else
                    premium = String.Format(BasePage.TheTwoSF, theValueList[4]);

                if (theValueList[5] == null)
                    premiumBase = "";
                else
                    premiumBase = String.Format(BasePage.TheTwoSF, theValueList[5]);

                if (theValueList[6] == null)
                    process = "";
                else
                    process = String.Format(BasePage.TheTwoSF, theValueList[6]);

                if (theValueList[7] == null)
                    processRate = "";
                else
                    processRate = String.Format(BasePage.TheTwoSF, theValueList[7]);
                
                if (theValueList[8] == null)
                    processBase = "";
                else
                    processBase = String.Format(BasePage.TheTwoSF, theValueList[8]);
                

                ListEditItem theselected;
                if (this.gridCarrierStartEdit)
                {
                    theselected = dxecbGridCarrierCarrierID.Items.FindByValue(carrierID);
                    if (theselected != null)
                    {
                        dxecbGridCarrierCarrierID.SelectedItem = theselected;
                    }

                    dxecbGridCarrierBranchID.DataSource = BusinessObjects.SchemaSetting.BO_Branch.FetchListByCarrier(carrierID);
                    dxecbGridCarrierBranchID.TextField = "BranchName";
                    dxecbGridCarrierBranchID.ValueField = "BranchID";
                    dxecbGridCarrierBranchID.DataBind();

                    theselected = dxecbGridCarrierBranchID.Items.FindByValue(brancheID);
                    if (theselected != null)
                    {
                        dxecbGridCarrierBranchID.SelectedItem = theselected;
                    }

                    dxetxtGridCarrierPolicyRate.Text = policyRate;
                    dxetxtGridCarrierPremium.Text = premium;
                    dxetxtGridCarrierPremiumBase.Text = premiumBase;
                    dxetxtGridCarrierProcessRate.Text = processRate;
                    dxetxtGridCarrierProcess.Text = process;
                    dxetxtGridCarrierProcessBase.Text = processBase;
                }
                else
                {
                    carrierID = dxecbGridCarrierCarrierID.SelectedItem.Value.ToString();
                    dxecbGridCarrierBranchID.DataSource = BusinessObjects.SchemaSetting.BO_Branch.FetchListByCarrier(carrierID);
                    dxecbGridCarrierBranchID.TextField = "BranchName";
                    dxecbGridCarrierBranchID.ValueField = "BranchID";
                    dxecbGridCarrierBranchID.DataBind();
                }
            }

        }

        protected void gridCarrier_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            this.gridCarrierStartEdit = true;
        }


        protected void gridCarrier_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            String theKey = e.Keys[0].ToString();
            HtmlTable tblEditorTemplate = this.gridCarrier.FindEditFormTemplateControl("tblgridCarrierEditorTemplate") as HtmlTable;

            ASPxComboBox dxecbGridCarrierCarrierID = tblEditorTemplate.FindControl("dxecbGridCarrierCarrierID") as ASPxComboBox;

            ASPxComboBox dxecbGridCarrierBranchID = tblEditorTemplate.FindControl("dxecbGridCarrierBranchID") as ASPxComboBox;

            ASPxTextBox dxetxtGridCarrierPolicyRate = tblEditorTemplate.FindControl("dxetxtGridCarrierPolicyRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierPremium = tblEditorTemplate.FindControl("dxetxtGridCarrierPremium") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierPremiumBase = tblEditorTemplate.FindControl("dxetxtGridCarrierPremiumBase") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierProcessRate = tblEditorTemplate.FindControl("dxetxtGridCarrierProcessRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierProcess = tblEditorTemplate.FindControl("dxetxtGridCarrierProcess") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierProcessBase = tblEditorTemplate.FindControl("dxetxtGridCarrierProcessBase") as ASPxTextBox;

            BusinessObjects.Policy.BO_PolicyCarrier newobj = new BusinessObjects.Policy.BO_PolicyCarrier(theKey);

            newobj.PolicyID = this.dxetxtPolicyID.Text;

            newobj.CarrierID = dxecbGridCarrierCarrierID.SelectedItem.Value.ToString();
            newobj.BranchID = dxecbGridCarrierBranchID.SelectedItem.Value.ToString();

            if (dxetxtGridCarrierPolicyRate.Text != String.Empty)
            {
                newobj.PolicyRate = Convert.ToDecimal(dxetxtGridCarrierPolicyRate.Text);
            }
            if (dxetxtGridCarrierPremium.Text != String.Empty)
            {
                newobj.Premium = Convert.ToDecimal(dxetxtGridCarrierPremium.Text);
            }
            if (dxetxtGridCarrierPremiumBase.Text != String.Empty)
            {
                newobj.PremiumBase = Convert.ToDecimal(dxetxtGridCarrierPremiumBase.Text);
            }
            if (dxetxtGridCarrierProcessRate.Text != String.Empty)
            {
                newobj.ProcessRate = Convert.ToDecimal(dxetxtGridCarrierProcessRate.Text);
            }
            if (dxetxtGridCarrierProcess.Text != String.Empty)
            {
                newobj.Process = Convert.ToDecimal(dxetxtGridCarrierProcess.Text);
            }
            if (dxetxtGridCarrierProcessBase.Text != String.Empty)
            {
                newobj.ProcessBase = Convert.ToDecimal(dxetxtGridCarrierProcessBase.Text);
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
            this.gridCarrier.CancelEdit();

            rebindGridCarrier();

        }

                
        protected void gridCarrier_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridCarrier.FindEditFormTemplateControl("tblgridCarrierEditorTemplate") as HtmlTable;

            ASPxComboBox dxecbGridCarrierCarrierID = tblEditorTemplate.FindControl("dxecbGridCarrierCarrierID") as ASPxComboBox;

            ASPxComboBox dxecbGridCarrierBranchID = tblEditorTemplate.FindControl("dxecbGridCarrierBranchID") as ASPxComboBox;

            ASPxTextBox dxetxtGridCarrierPolicyRate = tblEditorTemplate.FindControl("dxetxtGridCarrierPolicyRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierPremium = tblEditorTemplate.FindControl("dxetxtGridCarrierPremium") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierPremiumBase = tblEditorTemplate.FindControl("dxetxtGridCarrierPremiumBase") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierProcessRate = tblEditorTemplate.FindControl("dxetxtGridCarrierProcessRate") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierProcess = tblEditorTemplate.FindControl("dxetxtGridCarrierProcess") as ASPxTextBox;
            ASPxTextBox dxetxtGridCarrierProcessBase = tblEditorTemplate.FindControl("dxetxtGridCarrierProcessBase") as ASPxTextBox;

            BusinessObjects.Policy.BO_PolicyCarrier newobj = new BusinessObjects.Policy.BO_PolicyCarrier();

            newobj.PolicyCarrierID = Guid.NewGuid().ToString();
            newobj.PolicyID = this.dxetxtPolicyID.Text;

            newobj.CarrierID = dxecbGridCarrierCarrierID.SelectedItem.Value.ToString();
            newobj.BranchID = dxecbGridCarrierBranchID.SelectedItem.Value.ToString();

            if (dxetxtGridCarrierPolicyRate.Text != String.Empty)
            {
                newobj.PolicyRate = Convert.ToDecimal(dxetxtGridCarrierPolicyRate.Text);
            }
            if (dxetxtGridCarrierPremium.Text != String.Empty)
            {
                newobj.Premium = Convert.ToDecimal(dxetxtGridCarrierPremium.Text);
            }
            if (dxetxtGridCarrierPremiumBase.Text != String.Empty)
            {
                newobj.PremiumBase = Convert.ToDecimal(dxetxtGridCarrierPremiumBase.Text);
            }
            if (dxetxtGridCarrierProcessRate.Text != String.Empty)
            {
                newobj.ProcessRate = Convert.ToDecimal(dxetxtGridCarrierProcessRate.Text);
            }
            if (dxetxtGridCarrierProcess.Text != String.Empty)
            {
                newobj.Process = Convert.ToDecimal(dxetxtGridCarrierProcess.Text);
            }
            if (dxetxtGridCarrierProcessBase.Text != String.Empty)
            {
                newobj.ProcessBase = Convert.ToDecimal(dxetxtGridCarrierProcessBase.Text);
            }

            newobj.Save(ModifiedAction.Insert);

            e.Cancel = true;
            this.gridCarrier.CancelEdit();

            rebindGridCarrier();

        }

        
        protected void gridCarrier_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String theKey = e.Keys[0].ToString();

            try
            {
                BusinessObjects.Policy.BO_PolicyCarrier.Delete(theKey);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            e.Cancel = true;
            this.gridCarrier.CancelEdit();

            rebindGridCarrier();

        }

        
        protected void gridCarrier_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            String theWhere = "";
            if (e.Keys.Count > 0)
            {
                theWhere = " AND A.PolicyCarrierID !='" + e.Keys[0].ToString() + "'";
                theWhere = theWhere + " AND A.PolicyID = '" + this.dxetxtPolicyID.Text + "'";
            }
            else
            {
                theWhere = " AND A.PolicyID = '" + this.dxetxtPolicyID.Text + "'";
            }

            String appendDes = "必需项";
            HtmlTable tblEditorTemplate = this.gridCarrier.FindEditFormTemplateControl("tblgridCarrierEditorTemplate") as HtmlTable;

            ASPxComboBox dxecbGridCarrierCarrierID = tblEditorTemplate.FindControl("dxecbGridCarrierCarrierID") as ASPxComboBox;
            dxecbGridCarrierCarrierID.Validate();
            if (dxecbGridCarrierCarrierID.SelectedItem == null)
            {
                e.Errors[this.gridCarrier.Columns[1]] = "必需项";
            }
            else
            {
                if (dxecbGridCarrierCarrierID.SelectedItem.Value.ToString() == String.Empty)
                {
                    e.Errors[this.gridCarrier.Columns[1]] = "必需项";
                }
                else
                {
                    //do nothing;
                }
            }

            ASPxComboBox dxecbGridCarrierBranchID = tblEditorTemplate.FindControl("dxecbGridCarrierBranchID") as ASPxComboBox;

            if (dxecbGridCarrierBranchID.SelectedItem == null)
            {
                e.Errors[this.gridCarrier.Columns[2]] = "必需项";
            }
            else
            {
                if (dxecbGridCarrierBranchID.SelectedItem.Value.ToString() == String.Empty)
                {
                    e.Errors[this.gridCarrier.Columns[2]] = "必需项";
                }
                else
                {
                    //do nothing;
                }
            }

            theWhere = theWhere + " AND A.CarrierID = '" + dxecbGridCarrierCarrierID.SelectedItem.Value.ToString() + "'";
            theWhere = theWhere + " AND A.BranchID = '" + dxecbGridCarrierBranchID.SelectedItem.Value.ToString() + "'";

            Boolean exists = BusinessObjects.Policy.BO_PolicyCarrier.CheckPolicyCarrierBranchExist(theWhere);

            if (exists)
            {
                e.Errors[this.gridCarrier.Columns[2]] = "已存在";
                dxecbGridCarrierBranchID.ValidationSettings.RegularExpression.ErrorText = "已存在";
                dxecbGridCarrierBranchID.ValidationSettings.RegularExpression.ValidationExpression = @"^\d+";
                dxecbGridCarrierBranchID.ValidationSettings.RegularExpression.EvaluateIsValid("abc");
                appendDes = "此保险公司分支机构已存在";
            }
            dxecbGridCarrierBranchID.Validate();

            if (string.IsNullOrEmpty(e.RowError) && e.Errors.Count > 0) e.RowError = "请修正所有的错误(" + appendDes + ")。";

        }




        protected void dxecbGridCarrierBranchIDCallback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.SchemaSetting.BO_Branch.FetchListByCarrier(e.Parameter);
            thecb.TextField = "BranchName";
            thecb.ValueField = "BranchID";
            thecb.DataBind();
            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }
        }


        private void rebindGridCarrier()
        {
            this.gridCarrier.DataSource = BusinessObjects.Policy.BO_PolicyCarrier.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridCarrier.DataBind();
        }


        #endregion gridCarrier Events


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


        #endregion Upload File  Events


        #region Privates

        private string savePolicy(String parameter, String policyState)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(PolicyInfo));
            
            PolicyInfo theJosn;
            theJosn = (PolicyInfo)serializer.ReadObject(ms);
            ms.Close();
            BusinessObjects.Policy.BO_Policy obj;

            //check policyno exist first
            bool checkresult = checkPolicyNoExist(theJosn.PolicyID, theJosn.PolicyNo);

            if (checkresult) return policyNoExist;
            
            if (String.IsNullOrEmpty(theJosn.PolicyID))
            {
                obj = new BusinessObjects.Policy.BO_Policy();
                obj.PolicyID = TranUtils.GetPolicyID();
                obj.PolicyStatus = policyState;
                obj.PolicyType = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyTypeEnum.Other).ToString();
                obj.Beneficiary=theJosn.Beneficiary;
                obj.CarrierSales=theJosn.CarrierSales; 
                obj.ConversionRate=theJosn.ConversionRate;
                obj.Coverage=theJosn.Coverage;
                            
                obj.Currency=theJosn.Currency; 
                obj.CustomerID=theJosn.CustomerID; 
                obj.DeptId=theJosn.DeptId; 
                obj.EndDate=theJosn.EndDate;
                            
                obj.FlagReinsure=theJosn.FlagReinsure; 
                obj.FlagTogether=theJosn.FlagTogether; 
                obj.GatheringType=theJosn.GatheringType;
                            
                obj.OperationType=theJosn.OperationType; 
                obj.PeriodTimes=theJosn.PeriodTimes; 
                obj.PolicyNo=theJosn.PolicyNo;
                            
                obj.Premium=theJosn.Premium; 
                obj.PremiumBase=theJosn.PremiumBase; 
                obj.PremiumRate=theJosn.PremiumRate;
                            
                obj.Process=theJosn.Process; 
                obj.ProcessBase=theJosn.ProcessBase; 
                obj.ProcessRate=theJosn.ProcessRate; 
                obj.ProdTypeID=theJosn.ProdTypeID;
                obj.Remark=theJosn.Remark; 
                obj.SalesId=theJosn.SalesId; 
                obj.SignDate=theJosn.SignDate;
                obj.SourceTypeID=theJosn.SourceTypeID; 
                obj.Special=theJosn.Special;
                obj.StartDate = theJosn.StartDate;

                obj.CreatePerson = this.CurrentUserID;
                obj.CreateTime = DateTime.Now;

                obj.Save(ModifiedAction.Insert);
            }
            else
            {
                obj = new BusinessObjects.Policy.BO_Policy(theJosn.PolicyID);
                obj.PolicyStatus = policyState;
                obj.Beneficiary = theJosn.Beneficiary;
                obj.CarrierSales = theJosn.CarrierSales;
                obj.ConversionRate = theJosn.ConversionRate;
                obj.Coverage = theJosn.Coverage;

                obj.Currency = theJosn.Currency;
                obj.CustomerID = theJosn.CustomerID;
                obj.DeptId = theJosn.DeptId;
                obj.EndDate = theJosn.EndDate;

                obj.FlagReinsure = theJosn.FlagReinsure;
                obj.FlagTogether = theJosn.FlagTogether;
                obj.GatheringType = theJosn.GatheringType;

                obj.OperationType = theJosn.OperationType;
                obj.PeriodTimes = theJosn.PeriodTimes;
                obj.PolicyID = theJosn.PolicyID;
                obj.PolicyNo = theJosn.PolicyNo;

                obj.Premium = theJosn.Premium;
                obj.PremiumBase = theJosn.PremiumBase;
                obj.PremiumRate = theJosn.PremiumRate;

                obj.Process = theJosn.Process;
                obj.ProcessBase = theJosn.ProcessBase;
                obj.ProcessRate = theJosn.ProcessRate;
                obj.ProdTypeID = theJosn.ProdTypeID;
                obj.Remark = theJosn.Remark;
                obj.SalesId = theJosn.SalesId;
                obj.SignDate = theJosn.SignDate;
                obj.SourceTypeID = theJosn.SourceTypeID;
                obj.Special = theJosn.Special;
                obj.StartDate = theJosn.StartDate;

                obj.ModifyPerson  = this.CurrentUserID;
                obj.ModifyTime  = DateTime.Now;

                obj.Save(ModifiedAction.Update);
            }

            return obj.PolicyID;

        }


        private void auditPolicy(String parameter, ref Int32 resultSign, ref string resultMSG)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(PolicyInfo));
            PolicyInfo obj;

            obj = (PolicyInfo)serializer.ReadObject(ms);
            ms.Close();

            String thePolicyID = this.dxetxtPolicyID.Text.Trim();
            String state;
            if (obj.AuditOrNot)
                state = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Audit).ToString();
            else
                state = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.AppealAudit).ToString();

            BusinessObjects.Policy.BO_Policy.AuditPolicy(thePolicyID, state, this.CurrentUserID, obj.Remark, ref resultSign, ref resultMSG);
            
        }


        private void auditPolicySubmit(ref Int32 resultSign, ref string resultMSG)
        {
            String thePolicyID = this.dxetxtPolicyID.Text.Trim();
            String state;
            
            state = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.AppealAudit).ToString();

            BusinessObjects.Policy.BO_Policy.AuditPolicySubmit(thePolicyID, state, this.CurrentUserID, ref resultSign, ref resultMSG);

        }


        private void auditBackPolicy(String parameter)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(PolicyInfo));
            PolicyInfo obj;

            obj = (PolicyInfo)serializer.ReadObject(ms);
            ms.Close();

            String thePolicyID = this.dxetxtPolicyID.Text.Trim();
            BusinessObjects.Policy.BO_Policy objPolicy;
            objPolicy = new BusinessObjects.Policy.BO_Policy(thePolicyID);

            objPolicy.PolicyStatus = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Input).ToString();
            
            objPolicy.AuditTime = DateTime.Now;
            objPolicy.AuditPerson = this.CurrentUserID;
            objPolicy.Remark = obj.Remark;
            objPolicy.Save(ModifiedAction.Update);

        }


        private void bindDropDownLists()
        {
            this.dxeddlDeptID.DataSource = BusinessObjects.BO_P_Department.FetchList();
            this.dxeddlDeptID.TextField = "DeptName";
            this.dxeddlDeptID.ValueField = "DeptID";
            this.dxeddlDeptID.DataBind();

            this.dxeddlSalesId.DataSource = BusinessObjects.BO_P_User.FetchList();
            this.dxeddlSalesId.TextField = "UserNameCn";
            this.dxeddlSalesId.ValueField = "UserID";
            this.dxeddlSalesId.DataBind();

            this.dxeddlGatheringType.DataSource = BusinessObjects.BO_P_Code.GetGatheringTypeList();
            this.dxeddlGatheringType.TextField = "GatheringTypeName";
            this.dxeddlGatheringType.ValueField = "GatheringTypeID";
            this.dxeddlGatheringType.DataBind();

            this.dxeddlOperationType.DataSource = BusinessObjects.BO_P_Code.GetOperationTypeList();
            this.dxeddlOperationType.TextField = "OperationTypeName";
            this.dxeddlOperationType.ValueField = "OperationTypeID";
            this.dxeddlOperationType.DataBind();

            this.dxeddlSourceTypeID.DataSource = BusinessObjects.BO_P_Code.GetSourceTypeList();
            this.dxeddlSourceTypeID.TextField = "SourceTypeName";
            this.dxeddlSourceTypeID.ValueField = "SourceTypeID";
            this.dxeddlSourceTypeID.DataBind();

            this.dxeddlCurrency.DataSource = BusinessObjects.BO_P_Code.GetCurencyList();
            this.dxeddlCurrency.TextField = "CurrencyName";
            this.dxeddlCurrency.ValueField = "CurID";
            this.dxeddlCurrency.DataBind();

            this.BindProdTypeName();

            //DateTime.Today.ToString("yyyy-MM-dd");
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


        private void SetddlProdTypeName(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                this.dxeddlProdTypeName.SelectedIndex = this.dxeddlProdTypeName.Items.IndexOf(this.dxeddlProdTypeName.Items.FindByValue(value));
                if (this.dxeddlProdTypeName.SelectedIndex >= 0)
                    this.dxeddlProdTypeName.Text = this.dxeddlProdTypeName.SelectedItem.Text.Substring(this.dxeddlProdTypeName.SelectedItem.Text.IndexOf("∟") + 1);
            }
        }



        private void loadPolicyValue(String policyID)
        {

            ListEditItem theselected;
            BusinessObjects.Policy.BO_Policy obj;

            obj = new BusinessObjects.Policy.BO_Policy(policyID);

            this.dxetxtPolicyNo.Text = obj.PolicyNo;
            //dxechkTogether
            //dxechkFlagReinsure
                        
            this.dxeddlProdTypeName.SelectedIndex = this.dxeddlProdTypeName.Items.IndexOf(this.dxeddlProdTypeName.Items.FindByValue(obj.ProdTypeID));
            if (this.dxeddlProdTypeName.SelectedIndex >= 0)
                this.dxeddlProdTypeName.Text = this.dxeddlProdTypeName.SelectedItem.Text.Substring(this.dxeddlProdTypeName.SelectedItem.Text.IndexOf("∟") + 1);
            this.ptid.Value = obj.ProdTypeID;
            
            this.dxetxtCustomer.Text = obj.CustomerName;
            this.cusid.Value = obj.CustomerID;

            this.dxetxtBeneficiary.Text = obj.Beneficiary;

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

            //dxeddlGatheringType
            if (!String.IsNullOrEmpty(obj.GatheringType))
            {
                theselected = dxeddlGatheringType.Items.FindByValue(obj.GatheringType);
                if (theselected != null)
                {
                    dxeddlGatheringType.SelectedItem = theselected;
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

            //dxeddlSourceTypeID
            if (!String.IsNullOrEmpty(obj.SourceTypeID))
            {
                theselected = dxeddlSourceTypeID.Items.FindByValue(obj.SourceTypeID);
                if (theselected != null)
                {
                    dxeddlSourceTypeID.SelectedItem = theselected;
                }
            }

            this.dxeStartDate.Date = obj.StartDate;
            this.dxeEndDate.Date = obj.EndDate;
            this.dxetxtCreatePerson.Text = obj.CreatePerson;

            this.dxedtCreateTime.Date = obj.CreateTime;

            this.dxetxtStage.Text = obj.PeriodTimes.ToString();

            this.dxetxtCoverage.Text = String.Format(BasePage.TheTwoSF, obj.Coverage);
            this.dxetxtPremiumRate.Text = String.Format(BasePage.TheFourSF, obj.PremiumRate); 
            this.dxetxtProcessRate.Text = String.Format(BasePage.TheFourSF, obj.ProcessRate);

            //dxeddlCurrency
            if (!String.IsNullOrEmpty(obj.Currency))
            {
                theselected = dxeddlCurrency.Items.FindByValue(obj.Currency);
                if (theselected != null)
                {
                    dxeddlCurrency.SelectedItem = theselected;
                }
            }

            this.dxetxtPremium.Text = String.Format(BasePage.TheTwoSF, obj.Premium); 
            this.dxetxtProcess.Text = String.Format(BasePage.TheTwoSF, obj.Process);
            this.dxetxtConversionRate.Text = String.Format(BasePage.TheFiveSF, obj.ConversionRate);
            this.dxetxtPremiumBase.Text = String.Format(BasePage.TheTwoSF, obj.PremiumBase); 
            this.dxetxtProcessBase.Text = String.Format(BasePage.TheTwoSF, obj.ProcessBase);

            this.dxeCheckDate.Date = obj.AuditTime;
            this.dxetxtAuditPerson.Text = obj.AuditPerson;
            this.dxeMemo.Text = obj.Remark;

            //取得结算信息            
            DataSet dsPolicyFee = BusinessObjects.Policy.BO_Policy.GetPolicyFee(policyID);
            if (dsPolicyFee !=null && dsPolicyFee.Tables.Count > 0 && dsPolicyFee.Tables[0].Rows.Count > 0)
            {
                DataTable dtFee = dsPolicyFee.Tables[0];
                DataTable dsFeeDetail = dsPolicyFee.Tables[1];
                this.dxetxtPayedFee.Text = dtFee.Rows[0]["PayedFee"].ToString();
                this.dextxtNeededPayFee.Text = dtFee.Rows[0]["NeededPayFee"].ToString();
                this.dxetxtPayinedFee.Text = dtFee.Rows[0]["PayinedFee"].ToString();
                this.dxetxtNeededPayinFee.Text = dtFee.Rows[0]["NeededPayinFee"].ToString();
                this.dxetxtPayedProc.Text = dtFee.Rows[0]["PayedProc"].ToString();
                this.dxetxtNeededPayProc.Text = dtFee.Rows[0]["NeededPayProc"].ToString();

                gridInOutBalance.DataSource = dsFeeDetail;
                gridInOutBalance.DataBind();
            }
            
        }


        private bool checkPolicyNoExist(String policyID, String policyNo)
        {
            bool result;
            String swhere = "";
            if (!String.IsNullOrEmpty(policyID))
            {
                swhere += " AND B.PolicyID != '" + policyID.Trim() + "'";
            }

            if (!String.IsNullOrEmpty(policyNo))
            {
                swhere += " AND B.PolicyNo = '" + policyNo.Trim() + "'";
            }
            else
            {
                return false;
            }

            try
            {
                DataTable dt = BusinessObjects.Policy.BO_Policy.FetchPolicyList(swhere);
                if (dt.Rows.Count > 0)
                    result = true;
                else
                    result = false;
            }
            catch (Exception)
            {
                result = true;
            }

            return result;
            
        }


        #endregion Privates


        [DataContract(Namespace = "http://www.sheib.com")]
        public class PolicyInfo
        {
            public PolicyInfo()
            { }

            [DataMember]
            public string Beneficiary { get; set; }

            [DataMember]
            public string CarrierSales { get; set; }

            [DataMember]
            public Decimal ConversionRate { get; set; }

            [DataMember]
            public Decimal Coverage { get; set; }

            [DataMember]
            public string Currency { get; set; }
            
            [DataMember]
            public string CustomerID { get; set; }

            
            [DataMember]
            public string DeptId { get; set; }

            [DataMember]
            public DateTime EndDate { get; set; }

            [DataMember]
            public Int32 FlagReinsure { get; set; }

            [DataMember]
            public Int32 FlagTogether { get; set; }

            [DataMember]
            public string GatheringType { get; set; }

            [DataMember]
            public string OperationType { get; set; }

            [DataMember]
            public Int32 PeriodTimes { get; set; }
                        
            [DataMember]
            public string PolicyID { get; set; }
            
            [DataMember]
            public string PolicyNo { get; set; }
            
            [DataMember]
            public string PolicyStatus { get; set; }

            [DataMember]
            public Decimal Premium { get; set; }

            [DataMember]
            public Decimal PremiumBase { get; set; }

            [DataMember]
            public Decimal PremiumRate { get; set; }

            [DataMember]
            public Decimal Process { get; set; }
            
            [DataMember]
            public Decimal ProcessBase { get; set; }

            [DataMember]
            public Decimal ProcessRate { get; set; }

            [DataMember]
            public string ProdTypeID { get; set; }

            [DataMember]
            public string Remark { get; set; }
                        
             [DataMember]
            public string SalesId { get; set; }

            [DataMember]
            public DateTime SignDate { get; set; }

            [DataMember]
            public string SourceTypeID { get; set; }

            [DataMember]
            public string Special { get; set; }
            
            [DataMember]
            public DateTime StartDate { get; set; }

            [DataMember]
            public Boolean AuditOrNot { get; set; }

        }





    }

}
