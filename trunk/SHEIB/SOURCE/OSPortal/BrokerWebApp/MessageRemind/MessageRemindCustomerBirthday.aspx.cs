using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;

namespace BrokerWebApp.MessageRemind
{

    public partial class MessageRemindCustomerBirthday : BasePage
    {

        #region Variables

        private const String gridKeyName = "KeyGUID";
        private string toadd = string.Empty;

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            //
            if (!Page.IsPostBack)
            {
                bindDropDownLists();

                CheckPermission();
               
            }

            if (Page.IsCallback)
            {
                BindGrid();
            }
        }

        private void CheckPermission()
        {
            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.MessageRemindCustomerBirthday_Personal))
            {
                dxeddlDeptID.Value = this.CurrentUser.DeptID;
                dxeddlSalesId.Value = this.CurrentUser.UserID;

                dxeddlDeptID.ClientEnabled = false;
                dxeddlSalesId.ClientEnabled = false;
            }
            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.MessageRemindCustomerBirthday_Group))
            {
                dxeddlDeptID.Value = this.CurrentUser.DeptID;
                dxeddlDeptID.ClientEnabled = false;

                dxeddlSalesId.Value = this.CurrentUser.UserID;
                dxeddlSalesId.ClientEnabled = true;
            }

            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.MessageRemindCustomerBirthday_All))
            {
                dxeddlDeptID.ClientEnabled = true;
                dxeddlSalesId.ClientEnabled = true;
            }
        }

        private void bindDropDownLists()
        {
            this.dxeddlDeptID.DataSource = BusinessObjects.BO_P_Department.FetchList();
            this.dxeddlDeptID.TextField = "DeptName";
            this.dxeddlDeptID.ValueField = "DeptID";
            this.dxeddlDeptID.DataBind();
            this.dxeddlDeptID.Items.Insert(0, new ListEditItem("(全部)", ""));

            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.MessageRemindCustomerBirthday_Group))
            {
                dxeddlSalesId.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(this.CurrentUser.DeptID);
            }
            else if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.MessageRemindCustomerBirthday_All))
            {
                this.dxeddlSalesId.DataSource = BusinessObjects.BO_P_User.FetchList();
            }
            else
            {
                this.dxeddlSalesId.DataSource = BusinessObjects.BO_P_User.FetchList();
            }
            this.dxeddlSalesId.TextField = "UserNameCn";
            this.dxeddlSalesId.ValueField = "UserID";
            this.dxeddlSalesId.DataBind();
            dxeddlSalesId.Items.Insert(0, new ListEditItem("(全部)", ""));
            
        }



        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            BindGrid();
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }

        private void BindGrid()
        {
            string lsWhere = "";
            

            if (this.dxeddlDeptID.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlDeptID.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.DeprtmentID ='" + dxeddlDeptID.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlSalesId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSalesId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.SalesId ='" + dxeddlSalesId.SelectedItem.Value.ToString() + "'";
            }

            DataTable dt = BusinessObjects.BO_SysSet.MessageRemindCustomerBirthday(lsWhere).Tables[0];
            this.gridSearchResult.DataSource = dt;
            this.gridSearchResult.DataBind();


        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }


        protected void dxeddlSalesIdCallback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(e.Parameter);
            thecb.TextField = "UserNameCn";
            thecb.ValueField = "UserID";
            thecb.DataBind();
            thecb.Items.Insert(0, new ListEditItem("(全部)", ""));
        }

        protected void dxeddlBranchId_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
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

    }
}
