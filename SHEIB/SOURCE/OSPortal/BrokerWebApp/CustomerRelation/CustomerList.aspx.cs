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
using BusinessObjects;

namespace BrokerWebApp.CustomerRelation
{
    public partial class CustomerList : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    this.Initialization();
                    CheckPermission();
                }
                else
                {
                    if (this.dxeddlCustType.SelectedItem.Value.ToString() == "1")
                        this.lblCustType.Text = "身份证号码：";
                    else if (this.dxeddlCustType.SelectedItem.Value.ToString() == "0")
                        this.lblCustType.Text = "组织机构号：";
                    else
                        this.lblCustType.Text = "身份证号码/<br/>组织机构号：";
                }

                if (this.Page.IsCallback)
                {
                    this.BindGrid();
                }
            }
            catch (Exception ex)
            { }
        }


        private void CheckPermission()
        {
            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.Customer_List_Search_Personal))
            {

                dxeddlDepartment.Value = this.CurrentUser.DeptID;
                dxeddlSalesID.Value = this.CurrentUser.UserID;

                dxeddlDepartment.ClientEnabled = false;
                dxeddlSalesID.ClientEnabled = false;
            }
            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.Customer_List_Search_Group))
            {
                dxeddlDepartment.Value = this.CurrentUser.DeptID;
                dxeddlDepartment.ClientEnabled = false;

                dxeddlSalesID.Value = this.CurrentUser.UserID;
                dxeddlSalesID.ClientEnabled = true;
            }

            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.Customer_List_Search_All))
            {
                dxeddlDepartment.ClientEnabled = true;
                dxeddlSalesID.ClientEnabled = true;
            }
        }


        /// <summary>
        /// 初始化控件
        /// </summary>
        private void Initialization()
        {
            DataSet dsList;

            //所在地区
            this.dxeddlArea.Items.Add("(全部)", "");
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.Area.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlArea.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }

            //行业类型
            this.dxeddlTradeType.Items.Add("(全部)", "");
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.TradeName.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlTradeType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }

            //部门
            this.dxeddlDepartment.Items.Add("(全部)", "");
            dsList = BO_P_Department.GetDeptByDeptID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlDepartment.Items.Add(row["DeptName"].ToString().Trim(), row["DeptID"].ToString().Trim());
                }
            }

            ////客户经理
            //this.dxeddlSalesID.Items.Add("(全部)", "");
            //dsList = BO_P_User.GetUserByUserID("");
            //if (dsList.Tables[0] != null)
            //{
            //    foreach (DataRow row in dsList.Tables[0].Rows)
            //    {
            //        this.dxeddlSalesID.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
            //    }
            //}

            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.Customer_List_Search_Group))
            {
                dxeddlSalesID.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(this.CurrentUser.DeptID);
            }
            else if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.Customer_List_Search_All))
            {
                this.dxeddlSalesID.DataSource = BusinessObjects.BO_P_User.FetchList();
            }
            else
            {
                this.dxeddlSalesID.DataSource = BusinessObjects.BO_P_User.FetchList();
            }
            this.dxeddlSalesID.TextField = "UserNameCn";
            this.dxeddlSalesID.ValueField = "UserID";
            this.dxeddlSalesID.DataBind();
            dxeddlSalesID.Items.Insert(0, new DevExpress.Web.ASPxEditors.ListEditItem("(全部)", ""));
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.BindGrid();
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //
        }

        protected void gridSearchResult_CustomCallBack(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            this.BindGrid();                       
        }

        protected void dxeDeleteCustomerCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            string key = e.Parameter;
            e.Result = "";

            if (BusinessObjects.BO_Customer.IfExistsInPolicy(key))
            {
                e.Result = "该客户有相关保单存在，不能删除！";
                return;
            }

            BO_Customer.Delete(key);
            e.Result = "ok";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.BindGrid();
        }

        /// <summary>
        /// 填充数据
        /// </summary>
        private void BindGrid()
        {
            System.Text.StringBuilder sbWhere = new System.Text.StringBuilder();
            if (this.dxeddlCustType.SelectedItem.Value.ToString().Length > 0)
                sbWhere.Append(" And C.CustTypeID=" + this.dxeddlCustType.SelectedItem.Value.ToString() + " ");
            if (this.dxetxtCustID.Text.Trim().Length > 0)
                sbWhere.Append(" And C.CustID='" + this.dxetxtCustID.Text.Trim() + "' ");
            if (this.dxeddlArea.SelectedItem.Value.ToString().Length > 0)
                sbWhere.Append(" And C.Area='" + this.dxeddlArea.SelectedItem.Value.ToString() + "' ");
            if (this.dxetxtAddress.Text.Trim().Length > 0)
                sbWhere.Append(" And C.Address like '%" + this.dxetxtAddress.Text.Trim() + "%'");
            if (this.dxetxtCustName.Text.Trim().Length > 0)
                sbWhere.Append(" And C.CustName like '%" + this.dxetxtCustName.Text.Trim() + "%'");
            if (this.dxeddlTradeType.SelectedItem.Value.ToString().Length > 0)
                sbWhere.Append(" And C.TradeTypeID='" + this.dxeddlTradeType.SelectedItem.Value.ToString() + "' ");
            if (this.dxeddlDepartment.SelectedItem.Value.ToString().Length > 0)
                sbWhere.Append(" And C.DeprtmentID='" + this.dxeddlDepartment.SelectedItem.Value.ToString() + "' ");
            if (this.dxetxtIDNO.Text.Trim().Length > 0)
                sbWhere.Append(" And And C.IDNO='" + this.dxetxtIDNO.Text.Trim() + "' ");
            if (this.dxeddlSalesID.SelectedItem.Value.ToString().Length > 0)
                sbWhere.Append(" And C.SalesID='" + this.dxeddlSalesID.SelectedItem.Value.ToString() + "' ");

            this.gridSearchResult.DataSource = BO_Customer.GetCustomerList(sbWhere.ToString());
            this.gridSearchResult.DataBind();
        }
    }
}
