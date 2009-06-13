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
using BusinessObjects;

namespace BrokerWebApp.CustomerRelation
{
    public partial class Customer : System.Web.UI.Page
    {
        /// <summary>
        /// 签单记录
        /// </summary>
        private DataTable _dtPolicyGrid;

        #region 私有变量
        /// <summary>
        /// 客户编号
        /// </summary>
        private string _custID;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (ViewState["PolicyGridData"] == null)
            //{
            //    GetPolicyForGrid();
            //    ViewState["PolicyGridData"] = _dtPolicyGrid;
            //}
            //this.gridPolicyItem.DataSource = ViewState["PolicyGridData"];

            //if (!IsPostBack && !IsCallback)
            //{
            //    this.gridPolicyItem.DataBind();
            //}
            try
            {
                if (Request.QueryString["custID"] != null)
                {
                    this._custID = Request.QueryString["custID"].Trim();
                }

                this.Initialization();
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 初始化控件
        /// </summary>
        private void Initialization()
        {
            if (String.IsNullOrEmpty(this._custID))
            {//没有传入客户编号, 认为是新增客户
                this.customerDetailTabPage.TabPages[2].Visible = false;
                this.customerDetailTabPage.TabPages[3].Visible = false;
                this.customerDetailTabPage.TabPages[4].Visible = false;
                this.customerDetailTabPage.TabPages[5].Visible = false;
                //客户编号
                this.dxetxtCustID.Text = TranUtils.GetCustomerID();
                //所在地区
                this.SetddlArea();
                //客户分类
                this.SetddlCustClassify();
                //行业分类
                this.SetddlTradeType();
                //部门
                this.SetddlDeprtment();
                //客户经理
                this.SetddlSalesID();
            }
        }

        /// <summary>
        /// 设置所在地区
        /// </summary>
        private void SetddlArea()
        {
            DataSet dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.Area.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlArea.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }
        }

        /// <summary>
        /// 设置客户分类
        /// </summary>
        private void SetddlCustClassify()
        {
            DataSet dsList = BO_Customer.GetCustClassifyByID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlCustClassify.Items.Add(row["CustClassifyName"].ToString().Trim(), row["CustClassifyID"].ToString().Trim());
                }
            }
        }

        /// <summary>
        /// 设置行业分类
        /// </summary>
        private void SetddlTradeType()
        {
            DataSet dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.TradeName.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlTradeType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }
        }

        /// <summary>
        /// 设置部门
        /// </summary>
        private void SetddlDeprtment()
        {
            DataSet dsList = BO_P_Department.GetDeptByDeptID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlDepartment.Items.Add(row["DeptName"].ToString().Trim(), row["DeptID"].ToString().Trim());
                }
            }
        }

        /// <summary>
        /// 设置客户经理
        /// </summary>
        private void SetddlSalesID()
        {
            DataSet dsList = BO_P_User.GetUserByUserID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlSalesID.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
                }
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
