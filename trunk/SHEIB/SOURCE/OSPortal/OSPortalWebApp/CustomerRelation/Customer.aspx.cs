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

namespace OSPortalWebApp.CustomerRelation
{
    public partial class Customer : System.Web.UI.Page
    {
        #region Variables
        /// <summary>
        /// 联系人
        /// </summary>
        private DataTable _dtContactGrid;
        /// <summary>
        /// 销售跟进
        /// </summary>
        private DataTable _dtCustomerPtGrid;
        /// <summary>
        /// 理赔记录
        /// </summary>
        private DataTable _dtNotifyGrid;
        /// <summary>
        /// 签单记录
        /// </summary>
        private DataTable _dtPolicyGrid;
        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["ContactGridData"] == null)
            {
                GetContactDataForGrid();
                ViewState["ContactGridData"] = _dtContactGrid;
            }
            this.gridContactItem.DataSource = ViewState["ContactGridData"];

            if (ViewState["CustomerPtGridData"] == null)
            {
                GetCustomerPtForGrid();
                ViewState["CustomerPtGridData"] = _dtCustomerPtGrid;
            }
            this.gridCustomerPtItem.DataSource = ViewState["CustomerPtGridData"];

            if (ViewState["NotifyGridData"] == null)
            {
                GetNotifyForGrid();
                ViewState["NotifyGridData"] = _dtNotifyGrid;
            }
            this.gridNotifyItem.DataSource = ViewState["NotifyGridData"];

            if (ViewState["PolicyGridData"] == null)
            {
                GetPolicyForGrid();
                ViewState["PolicyGridData"] = _dtPolicyGrid;
            }
            this.gridPolicyItem.DataSource = ViewState["PolicyGridData"];

            if (!IsPostBack && !IsCallback)
            {
                this.gridContactItem.DataBind();
                this.gridCustomerPtItem.DataBind();
                this.gridNotifyItem.DataBind();
                this.gridPolicyItem.DataBind();
            }
        }

        #region 联系人
        private void GetContactDataForGrid()
        {
            _dtContactGrid = new DataTable();
            _dtContactGrid.PrimaryKey = new DataColumn[] { _dtContactGrid.Columns.Add("ContactID", typeof(String)) };
            _dtContactGrid.Columns.Add("ContactName", typeof(String));
            _dtContactGrid.Columns.Add("CustID", typeof(String));
            _dtContactGrid.Columns.Add("Position", typeof(String));
            _dtContactGrid.Columns.Add("Sex", typeof(String));
            _dtContactGrid.Columns.Add("Tel", typeof(String));
            _dtContactGrid.Columns.Add("Fax", typeof(String));
            _dtContactGrid.Columns.Add("MobilePhone", typeof(String));
            _dtContactGrid.Columns.Add("Email", typeof(String));
            _dtContactGrid.Columns.Add("Interest", typeof(String));
            _dtContactGrid.Columns.Add("Remark", typeof(String));

            _dtContactGrid.Rows.Add(new object[] { "1","张三","1","经理","男","12345678","12345678","13612345678","test@126.com","游泳","无" });
            _dtContactGrid.Rows.Add(new object[] { "2", "王燕", "2", "文员", "女", "12345678", "12345678", "13612345678", "test@126.com", "唱歌", "无" });
        }

        protected void gridContactItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["ContactGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["ContactID"]);
            row["ContactName"] = e.NewValues["ContactName"];
            row["CustID"] = e.NewValues["CustID"];
            row["Position"] = e.NewValues["Position"];
            row["Sex"] = e.NewValues["Sex"];
            row["Tel"] = e.NewValues["Tel"];
            row["Fax"] = e.NewValues["Fax"];
            row["MobilePhone"] = e.NewValues["MobilePhone"];
            row["Email"] = e.NewValues["Email"];
            row["Interest"] = e.NewValues["Interest"];
            row["Remark"] = e.NewValues["Remark"];

            e.Cancel = true;
            this.gridContactItem.CancelEdit();
        }

        protected void gridContactItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridContactItem.DataBind();
        }

        protected void gridContactItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["ContactGridData"]);
            DataRow[] dr = dt.Select("", "ContactID Desc");

            Int32 rowIndex = 1;
            if (dr == null && dr.Length == 0)
            {
                //do nothing;
            }
            else
            {
                rowIndex = Convert.ToInt32(dr[0][0]);
            }
            //Int32 rowIndex = ((DataTable)ViewState["PolicyItemGridData"]).Rows.Count;
            ((DataTable)ViewState["ContactGridData"]).Rows.Add(
                new object[] {
                    rowIndex, 
                    e.NewValues["ContactName"], 
                    e.NewValues["CustID"],
                    e.NewValues["Position"], 
                    e.NewValues["Sex"],
                    e.NewValues["Tel"], 
                    e.NewValues["Fax"],
                    e.NewValues["MobilePhone"], 
                    e.NewValues["Email"],
                    e.NewValues["Interest"], 
                    e.NewValues["Remark"]
                }
                );
            e.Cancel = true;
            this.gridContactItem.CancelEdit();
        }

        protected void gridContactItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridContactItem.DataBind();
        }

        protected void gridContactItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["ContactGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["ContactID"]);
            dt.Rows.Remove(row);
            e.Cancel = true;
            this.gridContactItem.CancelEdit();
        }

        protected void gridContactItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridContactItem.DataBind();
        }
        #endregion

        #region 销售跟进
        private void GetCustomerPtForGrid()
        {
            _dtCustomerPtGrid = new DataTable();
            _dtCustomerPtGrid.PrimaryKey = new DataColumn[] { _dtCustomerPtGrid.Columns.Add("FollowID", typeof(String)) };
            _dtCustomerPtGrid.Columns.Add("CustID", typeof(String));
            _dtCustomerPtGrid.Columns.Add("FollowType", typeof(String));
            _dtCustomerPtGrid.Columns.Add("FollowStage", typeof(String));
            _dtCustomerPtGrid.Columns.Add("FollowDate", typeof(DateTime));
            _dtCustomerPtGrid.Columns.Add("FollowMemo", typeof(String));
            _dtCustomerPtGrid.Columns.Add("FollowPerson", typeof(String));
            _dtCustomerPtGrid.Columns.Add("NextFollow", typeof(DateTime));

            _dtCustomerPtGrid.Rows.Add(new object[] { "1", "1", "面谈", "接触", DateTime.Today, "", "张三", DateTime.Today.AddDays(1) });
            _dtCustomerPtGrid.Rows.Add(new object[] { "2", "2", "电话", "接触", DateTime.Today, "", "李四", DateTime.Today.AddDays(1) });
        }

        protected void gridCustomerPtItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["CustomerPtGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["FollowID"]);
            row["CustID"] = e.NewValues["CustID"];
            row["FollowType"] = e.NewValues["FollowType"];
            row["FollowStage"] = e.NewValues["FollowStage"];
            row["FollowDate"] = e.NewValues["FollowDate"];
            row["FollowMemo"] = e.NewValues["FollowMemo"];
            row["FollowPerson"] = e.NewValues["FollowPerson"];
            row["NextFollow"] = e.NewValues["NextFollow"];

            e.Cancel = true;
            this.gridCustomerPtItem.CancelEdit();
        }

        protected void gridCustomerPtItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridCustomerPtItem.DataBind();
        }

        protected void gridCustomerPtItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["CustomerPtGridData"]);
            DataRow[] dr = dt.Select("", "FollowID Desc");

            Int32 rowIndex = 1;
            if (dr == null && dr.Length == 0)
            {
                //do nothing;
            }
            else
            {
                rowIndex = Convert.ToInt32(dr[0][0]);
            }
            //Int32 rowIndex = ((DataTable)ViewState["PolicyItemGridData"]).Rows.Count;
            ((DataTable)ViewState["CustomerPtGridData"]).Rows.Add(
                new object[] {
                    rowIndex, 
                    e.NewValues["CustID"],
                    e.NewValues["FollowType"], 
                    e.NewValues["FollowStage"],
                    e.NewValues["FollowDate"], 
                    e.NewValues["FollowMemo"],
                    e.NewValues["FollowPerson"], 
                    e.NewValues["NextFollow"]
                }
                );
            e.Cancel = true;
            this.gridCustomerPtItem.CancelEdit();
        }

        protected void gridCustomerPtItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridCustomerPtItem.DataBind();
        }

        protected void gridCustomerPtItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DataTable dt = ((DataTable)ViewState["CustomerPtGridData"]);
            DataRow row = dt.Rows.Find(e.Keys["FollowID"]);
            dt.Rows.Remove(row);
            e.Cancel = true;
            this.gridCustomerPtItem.CancelEdit();
        }

        protected void gridCustomerPtItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridCustomerPtItem.DataBind();
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

        #region 理赔记录
        private void GetNotifyForGrid()
        {
            _dtNotifyGrid = new DataTable();
            _dtNotifyGrid.PrimaryKey = new DataColumn[] { _dtNotifyGrid.Columns.Add("NotifyID", typeof(String)) };
            _dtNotifyGrid.Columns.Add("PolicyID", typeof(String));
            _dtNotifyGrid.Columns.Add("Carrier", typeof(String));
            _dtNotifyGrid.Columns.Add("ProdTypeName", typeof(String));
            _dtNotifyGrid.Columns.Add("CustName", typeof(String));
            _dtNotifyGrid.Columns.Add("MainTarget", typeof(String));
            _dtNotifyGrid.Columns.Add("SubTarget", typeof(String));

            _dtNotifyGrid.Columns.Add("StartDate", typeof(DateTime));
            _dtNotifyGrid.Columns.Add("NotifyTime", typeof(DateTime));
            _dtNotifyGrid.Columns.Add("NotifyLossFee", typeof(Double));
            _dtNotifyGrid.Columns.Add("LossRation", typeof(Double));
            _dtNotifyGrid.Columns.Add("LastPayFee", typeof(Double));
            _dtNotifyGrid.Columns.Add("CaseEndTime", typeof(DateTime));

            _dtNotifyGrid.Rows.Add(new object[] { "1", "BD20090320", "中国人民保险公司", "人保财产综合险", "北京市大新服裝廠", "商业用房", "办公室", DateTime.Today, DateTime.Today, 50000, 0.12, 40000, DateTime.Today });
            _dtNotifyGrid.Rows.Add(new object[] { "2", "BD20090340", "中国人民保险公司", "人保财产综合险", "北京市大新服裝廠", "商业用房", "办公室", DateTime.Today, DateTime.Today, 50000, 0.12, 40000, DateTime.Today });
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
