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
using DevExpress.Web.ASPxHtmlEditor;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using BusinessObjects;


namespace BrokerWebApp.otherinsurance
{
    public partial class PolicyInput : System.Web.UI.Page
    {
        #region Variables

        private const string currentPageModeKey = "CurrentPagePolicyMode";
        private const string inputQueryStringIDKey = "id";
        private const string inputQueryStringPageModeKey = "pagemode";
        private const string UploadDirectory = "~/UploadFiles/PolicyUploadFiles/";
        private const int ThumbnailSize = 100;

        private Boolean gridCarrierStartEdit = false;
        private Boolean gridPolicyItemStartEdit = false;
        private Boolean gridPolicyPeriodStartEdit = false;
        
        //enctype="multipart/form-data">

        public enum PageMode
        {
            Input, 
            Alt, 
            Audit
        }

        private Nullable<PageMode> pm;

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

                switch (this.pagemode.Value.ToLower().Trim())
                {
                    case "input":
                        pm = PageMode.Input;
                        break;
                    case "alt":
                        pm = PageMode.Alt;
                        break;
                    case "audit":
                        pm = PageMode.Audit;
                        break;
                    default:
                        pm = PageMode.Input;
                        break;
                }
                ViewState[currentPageModeKey] = pm;   
            }


            bindDropDownLists();

            this.gridCarrier.DataSource = BusinessObjects.Policy.BO_PolicyCarrier.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridPolicyItem.DataSource = BusinessObjects.Policy.BO_PolicyItem.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridPeriod.DataSource = BusinessObjects.Policy.BO_PolicyPeriod.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridDocList.DataSource = BusinessObjects.Policy.BO_PolicyDoc.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            

            if (!IsPostBack && !IsCallback)
            {
                this.dxedtCreateTime.Date = DateTime.Today;
                this.gridCarrier.DataBind();
                this.gridPolicyItem.DataBind();
                this.gridPeriod.DataBind();
                this.gridDocList.DataBind();

                if (!string.IsNullOrEmpty(this.dxetxtPolicyID.Text.Trim()))
                {
                    loadPolicyValue(this.dxetxtPolicyID.Text.Trim());
                }
                
            }
            else
            {
                //
            }
            
        }


        protected void dxeSaveCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            //switch (this.pm)
            //{
            //    case PageMode.Input :
            //        obj.PolicyStatus = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Input).ToString();
            //        break;
            //    case PageMode.Alt:
            //        obj.PolicyStatus = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.AppealAudit).ToString();
            //        break;
            //    case PageMode.Audit:
            //        obj.PolicyStatus = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Input).ToString();
            //        break;
            //    default:
            //        obj.PolicyStatus = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Input).ToString();
            //        break;
            //}
            String policystatus = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Input).ToString();
            String thePolicyID = savePolicy(e.Parameter, policystatus);
            e.Result = thePolicyID;
        }


        protected void dxeSaveAndCheckCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String policystatus = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Audit).ToString();
            savePolicy(e.Parameter, policystatus);
            e.Result = "complete";
        }


        protected void Page_PreRender(object sender, EventArgs e)
        {
            //
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

               

        #endregion Page Events


        #region Tab Events
        

        protected void insuranceDetailTabPage_ActiveTabChanged(object source, DevExpress.Web.ASPxTabControl.TabControlEventArgs e)
        {
            if (this.insuranceDetailTabPage.ActiveTabIndex == 1)
            {
                rebindGridDocList();
            }

            if (this.insuranceDetailTabPage.ActiveTabIndex == 2)
            {
                rebindGridPeriod();
            }
        }


        #endregion Tab Events


        #region gridPolicyItem Events

        
        protected void gridPolicyItem_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxComboBox dxecbGridPolicyItemProdID = tblEditorTemplate.FindControl("dxecbGridPolicyItemProdID") as ASPxComboBox;
            String prouctType = this.ptid.Value;
            String sqlfilter = " AND A.ProdTypeID ='" + prouctType + "' ";
            dxecbGridPolicyItemProdID.DataSource = BusinessObjects.SchemaSetting.BO_Product.FetchList(sqlfilter);
            dxecbGridPolicyItemProdID.TextField = "ProdName";
            dxecbGridPolicyItemProdID.ValueField = "ProdID";
            dxecbGridPolicyItemProdID.DataBind();

            ASPxTextBox dxetxtPolicyItemCoverage = tblEditorTemplate.FindControl("dxetxtPolicyItemCoverage") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemPremium = tblEditorTemplate.FindControl("dxetxtPolicyItemPremium") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemProcRate = tblEditorTemplate.FindControl("dxetxtPolicyItemProcRate") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemProcess = tblEditorTemplate.FindControl("dxetxtPolicyItemProcess") as ASPxTextBox;
            

            Int32 editIndex = this.gridPolicyItem.EditingRowVisibleIndex;
            if (editIndex > -1)
            {
                object theValues = this.gridPolicyItem.GetRowValues(editIndex, new String[] { "ItemID", "PolicyId", "ProdID", "Coverage", "Premium", "ProcRate", "Process" });
                object[] theValueList = theValues as object[];

                //String itemID = theValueList[1].ToString();
                //String policyId = theValueList[1].ToString();
                String prodID = theValueList[2].ToString();
                String coverage = theValueList[3].ToString();
                String premium = theValueList[4].ToString();
                String procRate = theValueList[5].ToString();
                String process = theValueList[6].ToString();
                

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


        protected void gridPolicyItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //this.gridPolicyItem.DataBind();
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

        protected void gridPolicyItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //this.gridPolicyItem.DataBind();           
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


        protected void gridPolicyItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
        }

        protected void gridPolicyItem_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            String theWhere="";
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

            theWhere = theWhere + " AND PolicyId = '" + dxecbGridPolicyItemProdID.SelectedItem.Value.ToString() + "'";

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
                e.Errors[this.gridCarrier.Columns[2]] = "已存在";
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

                String carrierID = theValueList[1].ToString();
                String brancheID = theValueList[2].ToString();
                String policyRate = theValueList[3].ToString();
                String premium = theValueList[4].ToString();
                String premiumBase = theValueList[5].ToString();
                String process = theValueList[6].ToString();
                String processRate = theValueList[7].ToString();
                String processBase = theValueList[8].ToString();

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
            catch(Exception ex)
            {
                throw ex;                
            }


            e.Cancel = true;
            this.gridCarrier.CancelEdit();

            rebindGridCarrier();

        }


        protected void gridCarrier_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridCarrier.DataBind();
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

        protected void gridCarrier_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridCarrier.DataBind();
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

        protected void gridCarrier_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
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

        protected void gridPeriod_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //
        }

        protected void gridPeriod_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridPeriod.CancelEdit();
        }

        protected void gridPeriod_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
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

            if (detxtGridPeriodPayDate.Value  == null)
            {
                e.Errors[refObj.Columns[2]] = "必需项";
            }
            if (detxtGridPeriodPayFeeBase.Text.Trim()  == "")
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
                        string resFileName = System.IO.Path.Combine(policyFolderPath,fileInfo.Name);
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


        private string savePolicy(String parameter,String policyState)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(BusinessObjects.Policy.BO_Policy));
            BusinessObjects.Policy.BO_Policy obj;

            obj = (BusinessObjects.Policy.BO_Policy)serializer.ReadObject(ms);
            ms.Close();

            if (String.IsNullOrEmpty(obj.PolicyID))
            {
                obj.PolicyID = TranUtils.GetPolicyID();
                obj.PolicyStatus = policyState;
                obj.Save(ModifiedAction.Insert);
            }
            else
            {
                obj.PolicyStatus = policyState;
                obj.Save(ModifiedAction.Update);
            }

            return obj.PolicyID;

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

            //DateTime.Today.ToString("yyyy-MM-dd");
        }


        private void loadPolicyValue(String poliicyID)
        {

            ListEditItem theselected;
            BusinessObjects.Policy.BO_Policy obj;

            obj = new BusinessObjects.Policy.BO_Policy(poliicyID);

            this.dxetxtPolicyNo.Text = obj.PolicyNo;
            //dxechkTogether
            //dxechkFlagReinsure

            this.dxetxtProdTypeName.Text = obj.ProdTypeName;
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


            this.dxetxtCoverage.Text = obj.Coverage.ToString();
            this.dxetxtPremiumRate.Text = obj.PremiumRate.ToString();
            this.dxetxtProcessRate.Text = obj.ProcessRate.ToString();

            //dxeddlCurrency
            if (!String.IsNullOrEmpty(obj.Currency))
            {
                theselected = dxeddlCurrency.Items.FindByValue(obj.Currency);
                if (theselected != null)
                {
                    dxeddlCurrency.SelectedItem = theselected;
                }
            }
                        
            this.dxetxtPremium.Text = obj.Premium.ToString();
            this.dxetxtProcess.Text = obj.Process.ToString();
            this.dxetxtConversionRate.Text = obj.ConversionRate.ToString();
            this.dxetxtPremiumBase.Text = obj.PremiumBase.ToString();
            this.dxetxtProcessBase.Text = obj.ProcessBase.ToString();
            
        }


        private void toJOSN()
        {
            //MemoryStream ms = new MemoryStream();
            //DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(BusinessObjects.Policy.BO_Policy));
            //BusinessObjects.Policy.BO_Policy obj = new BusinessObjects.Policy.BO_Policy("0903031214");

            //serializer.WriteObject(ms, obj);

            //string retVal = Encoding.UTF8.GetString(ms.ToArray());

            //ms.Close(); 
        }

    }
}
