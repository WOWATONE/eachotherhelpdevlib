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


namespace BrokerWebApp.vehicleinsurance
{
    public partial class AskPriceInput : BasePage
    {

        #region Variables
                
        private DataTable _dtGridPolicyItem;
        private DataTable _dtGridCarrier;
        
        private DataTable _dtGridPeriod;

        private const string UploadDirectory = "~/UploadControl/UploadImages/";
        private const int ThumbnailSize = 100;

        //enctype="multipart/form-data">

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {

            //GridPolicyItem
            if (ViewState["GridPolicyItem"] == null)
            {
                GetPolicyItemDataForGrid();
                ViewState["GridPolicyItem"] = _dtGridPolicyItem;
            }

            this.gridPolicyItem.DataSource = ViewState["GridPolicyItem"];

            if (!IsPostBack && !IsCallback)
                this.gridPolicyItem.DataBind();

                        

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

        private void GetPolicyItemDataForGrid()
        {
            _dtGridPolicyItem = new DataTable();
            _dtGridPolicyItem.PrimaryKey = new DataColumn[] { 
            _dtGridPolicyItem.Columns.Add("CarPolicyID", typeof(String)) };

            _dtGridPolicyItem.Columns.Add("CarNo", typeof(String));
            
            _dtGridPolicyItem.Columns.Add("CiPremium", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("CiProcessRate", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("CiProcess", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("AciPremium", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("AciProcessRate", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("AciProcess", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("CstPremium", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("CstProcessRate", typeof(Decimal));
            _dtGridPolicyItem.Columns.Add("CstProcess", typeof(Decimal));

            //_dtGridPolicyItem.Columns.Add("CarcaseNo", typeof(String));
            //_dtGridPolicyItem.Columns.Add("EngineNo", typeof(String));
            //_dtGridPolicyItem.Columns.Add("Capacity", typeof(String));
            //_dtGridPolicyItem.Columns.Add("CarModel", typeof(String));
            //_dtGridPolicyItem.Columns.Add("Character", typeof(String));
            //_dtGridPolicyItem.Columns.Add("RegisterDate", typeof(DateTime));
            //_dtGridPolicyItem.Columns.Add("CarValue", typeof(String));
            //, "C-001", "E-001", "4", "A-01", "CT", DateTime.Now, "40"
            //,"C-002", "E-002", "6", "A-02", "CT", DateTime.Now, "50"
            //,"C-003", "E-003", "8", "A-03", "CT", DateTime.Now, "60"

            _dtGridPolicyItem.Rows.Add(new object[] { 
                "1", "T001", 1000, 0.03, 30, 1000, 0.03, 30, 1000, 0.03, 30
            });

            _dtGridPolicyItem.Rows.Add(new object[] { 
                "2", "S001", 2000, 0.03, 30, 2000, 0.03, 30, 2000, 0.03, 30
            });

            _dtGridPolicyItem.Rows.Add(new object[] { 
                "3", "S002", 3000, 0.03, 30, 3000, 0.03, 30, 3000, 0.03, 30
            });
            
        }





        







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




        
    }
}
