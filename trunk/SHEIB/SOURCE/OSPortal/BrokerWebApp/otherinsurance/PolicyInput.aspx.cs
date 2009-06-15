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

        private const string inputQueryStringIDKey = "id";
        private const string UploadDirectory = "~/UploadControl/UploadImages/";
        private const int ThumbnailSize = 100;

        private Boolean gridCarrierStartEdit = false;

        private string theID;
        //enctype="multipart/form-data">

        #endregion Variables


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                theID = this.plcid.Value;
            }
            else
            {
                theID = Page.Request.QueryString[inputQueryStringIDKey];
                if (string.IsNullOrEmpty(theID))
                    theID = BusinessObjects.TranUtils.GetPolicyID();
                this.plcid.Value = theID;
            }
            this.dxetxtPolicyID.Text = this.plcid.Value;
            
            this.gridCarrier.DataSource = BusinessObjects.Policy.BO_PolicyCarrier.FetchListByPolicy(theID);

            if (!IsPostBack && !IsCallback)
                this.gridCarrier.DataBind();
            
        }


        protected void dxeSaveCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            savePolicy(e.Parameter);
            e.Result = "complete";
        }


        protected void dxeSaveAndCheckCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            savePolicy(e.Parameter);
            e.Result = "complete";
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    this.npGridPolicyItemDetail.Enabled = false;
            //    this.npCostSummaryDetail.Enabled = false;
            //    this.npPolicyCompanyDetail.Enabled = false;

            //    this.insuranceDetailTabPage.TabPages[1].Enabled = false;
            //    this.insuranceDetailTabPage.TabPages[2].Enabled = false;
            //    this.insuranceDetailTabPage.TabPages[3].Enabled = false;
            //}
        }

        #endregion Page Events


        #region gridPolicyItem Events

        
        protected void gridPolicyItem_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;
            //Page.IsCallback;
            //Page.IsPostBack;
            //Page.IsPostBackEventControlRegistered;
            ASPxComboBox dxecbGridProdID = tblEditorTemplate.FindControl("dxecbGridProdID") as ASPxComboBox;
            //this.gridPolicyItem.Selection.SelectRow
            //string theProdID = decbGridProdID.SelectedItem.Value.ToString();//ddlGridProdID.SelectedValue;

        }

        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //DataTable dt = _dtGridPolicyItem;
            //DataRow row = dt.Rows.Find(e.Keys["ItemID"]);
            ////
            //HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            //TextBox txtGridItemID = tblEditorTemplate.FindControl("txtGridItemID") as TextBox;
            
            //ASPxComboBox decbGridProdID = tblEditorTemplate.FindControl("decbGridProdID") as ASPxComboBox;
            //row["ProdID"] = decbGridProdID.SelectedItem.Text;//ddlGridProdID.SelectedValue;
                        
            //TextBox txtGridCoverage = tblEditorTemplate.FindControl("txtGridCoverage") as TextBox;
            //row["Coverage"] = txtGridCoverage.Text;

            //TextBox txtGridPremiumRate = tblEditorTemplate.FindControl("txtGridPremiumRate") as TextBox;
            //row["PremiumRate"] = txtGridPremiumRate.Text;

            //TextBox txtGridPremium = tblEditorTemplate.FindControl("txtGridPremium") as TextBox;
            //row["Premium"] = txtGridPremium.Text;

            //TextBox txtGridProcRate = tblEditorTemplate.FindControl("txtGridProcRate") as TextBox;
            //row["ProcRate"] = txtGridProcRate.Text;

            //TextBox txtGridProcess = tblEditorTemplate.FindControl("txtGridProcess") as TextBox;
            //row["Process"] = txtGridProcess.Text;
            
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
            
        }


        protected void gridPolicyItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //this.gridPolicyItem.DataBind();
        }

        protected void gridPolicyItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            
            //DataTable dt = _dtGridPolicyItem;
            //DataRow[] dr = dt.Select("", "ItemID Desc");
            
            //Int32 rowIndex = 1;
            //if (dr == null && dr.Length == 0)
            //{
            //    //do nothing;
            //}
            //else
            //{
            //    rowIndex = Convert.ToInt32(dr[0][0]);
            //}
            ////Int32 rowIndex = _dtGrid.Rows.Count;
            //rowIndex += 1;

            //HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            //TextBox txtGridItemID = tblEditorTemplate.FindControl("txtGridItemID") as TextBox;

            //ASPxComboBox decbGridProdID = tblEditorTemplate.FindControl("decbGridProdID") as ASPxComboBox;
            //string theProdID = decbGridProdID.SelectedItem.Value.ToString();//ddlGridProdID.SelectedValue;

            //ASPxComboBox decbGridProdName = tblEditorTemplate.FindControl("decbGridProdID") as ASPxComboBox;
            //string theProdName = decbGridProdID.SelectedItem.Text;//ddlGridProdID.SelectedValue;

            
            //TextBox txtGridCoverage = tblEditorTemplate.FindControl("txtGridCoverage") as TextBox;
            //string theCoverage = txtGridCoverage.Text;

            //TextBox txtGridPremiumRate = tblEditorTemplate.FindControl("txtGridPremiumRate") as TextBox;
            //string thePremiumRate = txtGridPremiumRate.Text;

            //TextBox txtGridPremium = tblEditorTemplate.FindControl("txtGridPremium") as TextBox;
            //string thePremium = txtGridPremium.Text;

            //TextBox txtGridProcRate = tblEditorTemplate.FindControl("txtGridProcRate") as TextBox;
            //string theProcRate = txtGridProcRate.Text;

            //TextBox txtGridProcess = tblEditorTemplate.FindControl("txtGridProcess") as TextBox;
            //string theProcess = txtGridProcess.Text;

            //_dtGridPolicyItem.Rows.Add(
            //    new object[] {
            //        rowIndex, 
            //        theProdID,
            //        theProdName,
            //        theCoverage,
            //        thePremiumRate,
            //        thePremium,
            //        theProcRate,
            //        theProcess
            //    }
            //    );
            //_dtGridPolicyItem.AcceptChanges();

            //this.plcid.Value;
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //this.gridPolicyItem.DataBind();           
        }

        protected void gridPolicyItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //DataTable dt = _dtGridPolicyItem;
            //DataRow row = dt.Rows.Find(e.Keys["ItemID"]);
            //if (row != null)
            //{
            //    dt.Rows.Remove(row);
            //    _dtGridPolicyItem.AcceptChanges();
            //}
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }


        protected void gridPolicyItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
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
                object theValues = this.gridCarrier.GetRowValues(1, new String[] { "PolicyID", "CarrierID", "BranchID", "PolicyRate", "Premium", "PremiumBase", "Process", "ProcessRate", "ProcessBase" });
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

            this.gridCarrier.DataSource = BusinessObjects.Policy.BO_PolicyCarrier.FetchListByPolicy(theID);

            this.gridCarrier.DataBind();

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

            this.gridCarrier.DataSource = BusinessObjects.Policy.BO_PolicyCarrier.FetchListByPolicy(theID);

            this.gridCarrier.DataBind();

        }

        protected void gridCarrier_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridCarrier.DataBind();
        }

        protected void gridCarrier_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridCarrier.CancelEdit();
        }

        protected void gridCarrier_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridCarrier.DataBind();
        }

        protected void gridCarrier_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
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
                        
            Boolean exists = BusinessObjects.Policy.BO_PolicyCarrier.CheckPolicyCarrierBranchExist(
                this.dxetxtPolicyID.Text, 
                dxecbGridCarrierCarrierID.SelectedItem.Value.ToString(),
                dxecbGridCarrierBranchID.SelectedItem.Value.ToString());
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



        

        #endregion gridCarrier Events


        #region gridPeriod Events

        protected void gridPeriod_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            //
        }
        protected void gridPeriod_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridPeriod.CancelEdit();

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
            this.gridPeriod.DataBind();
        }

        protected void gridPeriod_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridPeriod.CancelEdit();
        }

        protected void gridPeriod_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridPeriod.DataBind();
        }

        #endregion gridPeriod Events


        #region Upload File Events

        protected string SavePostedFiles(UploadedFile uploadedFile)
        {
            string ret = "";
            if (uploadedFile.IsValid)
            {
                //FileInfo fileInfo = new FileInfo(uploadedFile.FileName);
                //string resFileName = MapPath(UploadDirectory) + fileInfo.Name;
                //uploadedFile.SaveAs(resFileName);

                //string fileLabel = fileInfo.Name;
                //string fileType = uploadedFile.PostedFile.ContentType.ToString();
                //string fileLength = uploadedFile.PostedFile.ContentLength / 1024 + "K";
                //ret = string.Format("{0} <i>({1})</i> {2}|{3}", fileLabel, fileType, fileLength, fileInfo.Name);
            }
            return ret;
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

        #endregion Upload File  Events


        private void savePolicy(String parameter)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(BusinessObjects.Policy.BO_Policy));
            BusinessObjects.Policy.BO_Policy obj;

            obj = (BusinessObjects.Policy.BO_Policy)serializer.ReadObject(ms);
            ms.Close();

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
