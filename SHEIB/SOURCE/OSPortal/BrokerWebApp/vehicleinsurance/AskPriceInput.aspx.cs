using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxHtmlEditor;
using DevExpress.Web.ASPxEditors;
using System.IO;
using DevExpress.Web.ASPxUploadControl;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using BusinessObjects;

namespace BrokerWebApp.vehicleinsurance
{
    public partial class AskPriceInput : BasePage
    {

        #region Variables
                
        
        private const string UploadDirectory = "~/UploadControl/UploadImages/";
        private const int ThumbnailSize = 100;

        //enctype="multipart/form-data">

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {

            
            if (!IsPostBack && !IsCallback)
                this.gridPolicyItem.DataBind();

            this.gridPolicyItem.Enabled = true;             

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //  
        }

        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();

        }

        protected void gridPolicyItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        protected void gridPolicyItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        protected void gridPolicyItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        


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



        
    }
}
