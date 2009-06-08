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

namespace BrokerWebApp.otherinsurance
{
    public partial class PolicyInput : System.Web.UI.Page
    {
        #region Variables

        private const string inputQueryStringIDKey = "id";
        private const string UploadDirectory = "~/UploadControl/UploadImages/";
        private const int ThumbnailSize = 100;

        private string theID;
        //enctype="multipart/form-data">

        #endregion Variables


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Page.IsPostBack)
            //{
            //    theID = this.plcid.Value;
            //}
            //else
            //{
            //    theID = Page.Request.QueryString[inputQueryStringIDKey];
            //    if (string.IsNullOrEmpty(theID))
            //        theID = BusinessObjects.TranUtils.GetPolicyID();
            //    this.plcid.Value = theID;
            //}
            
            
        }


        protected void dxeSaveCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            //saveCheckedPrivilege(e.Parameter);
            e.Result = "complete";
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            // 
        }

        #endregion Page Events


        #region gridPolicyItem Events

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
            this.gridPolicyItem.DataBind();
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
            
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridPolicyItem.DataBind();           
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

        protected void gridCarrier_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            //
        }

        protected void gridCarrier_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridCarrier.CancelEdit();

        }

        protected void gridCarrier_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridCarrier.DataBind();
        }

        protected void gridCarrier_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridCarrier.CancelEdit();
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
