using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using DevExpress.Web.ASPxUploadControl;

namespace BrokerWebApp.CustomerRelation
{
    public partial class Customer : System.Web.UI.Page
    {
        /// <summary>
        /// 签单记录
        /// </summary>
        private DataTable _dtPolicyGrid;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["PolicyGridData"] == null)
            {
                GetPolicyForGrid();
                ViewState["PolicyGridData"] = _dtPolicyGrid;
            }
            this.gridPolicyItem.DataSource = ViewState["PolicyGridData"];

            if (!IsPostBack && !IsCallback)
            {
                this.gridPolicyItem.DataBind();
            }
        }

        #region 附加资料
        protected void UploadControl_AddInfoUploadComplete(object sender, FileUploadCompleteEventArgs e)
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
        #endregion

        #region 联系人
        protected void gridContactItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //
        }

        protected void gridContactItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //
        }

        protected void gridContactItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //
        }

        protected void gridContactItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //
        }

        protected void gridContactItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //
        }

        protected void gridContactItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
        }
        #endregion

        #region 销售跟进
        protected void gridCustomerPtItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //
        }

        protected void gridCustomerPtItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //
        }

        protected void gridCustomerPtItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //
        }

        protected void gridCustomerPtItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //
        }

        protected void gridCustomerPtItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //
        }

        protected void gridCustomerPtItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
        }

        protected void UploadControl_CustomerPTUploadComplete(object sender, FileUploadCompleteEventArgs e)
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
        #endregion

        #region 签单记录
        private void GetPolicyForGrid()
        {
            _dtPolicyGrid = new DataTable();
            _dtPolicyGrid.PrimaryKey = new DataColumn[] { _dtPolicyGrid.Columns.Add("PolicyID", typeof(String)) };
            _dtPolicyGrid.Columns.Add("StartDate", typeof(DateTime));
            _dtPolicyGrid.Columns.Add("EndDate", typeof(DateTime));
            _dtPolicyGrid.Columns.Add("PolicyNo", typeof(String));
            _dtPolicyGrid.Columns.Add("ProdType", typeof(String));
            _dtPolicyGrid.Columns.Add("Premium", typeof(Double));
            _dtPolicyGrid.Columns.Add("CarrierBranch", typeof(String));
            _dtPolicyGrid.Columns.Add("Sales", typeof(String));

            _dtPolicyGrid.Rows.Add(new object[] { "1", DateTime.Today.AddDays(-100), DateTime.Today, "PQZA20036401905", "财产综合险", 100, "中国人民保险公司（中国人保）", "张三" });
            _dtPolicyGrid.Rows.Add(new object[] { "2", DateTime.Today.AddDays(-100), DateTime.Today, "POL200506230002", "平安机动车辆险", 150, "中国平安保险", "李四" });
        }
        #endregion

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
    }
}
