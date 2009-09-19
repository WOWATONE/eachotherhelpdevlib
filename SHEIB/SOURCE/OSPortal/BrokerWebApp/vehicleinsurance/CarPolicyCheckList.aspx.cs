﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.VisualBasic;
using BusinessObjects;
using BusinessObjects.SchemaSetting;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxGridView.Rendering;
using DevExpress.Web.ASPxClasses.Internal;


namespace BrokerWebApp.vehicleinsurance
{
    public partial class CarPolicyCheckList : BasePage
    {

        #region Variables

        private const String gridKeyName = "AskPriceID";

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            this.LbUserNameTop.Text = this.CurrentUser.UserNameCn;
            if (Page.IsPostBack)
            {
                if (Page.IsCallback)
                {
                    //
                }
            }
            else
            {
                Initialization();
            }
        }



        protected void gridSearchResult_RowDeleting(object sender, 
            DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String theID = e.Keys[0].ToString();

            if (!String.IsNullOrEmpty(theID))
            {
                BusinessObjects.Policy.BO_Policy.Delete(theID);
            }

            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
        }


        protected void gridSearchResult_CustomCallback(object sender, 
            DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }


        protected void gridSearchResult_HtmlRowCreated(object sender,
            ASPxGridViewTableRowEventArgs e)
        {

            if (e.RowType == GridViewRowType.Data)
            {
                String state = "1";
                object obj = e.GetValue("PolicyStatus");
                if (Convert.IsDBNull(obj))
                {
                    state = "1";
                }
                else
                {
                    state = Convert.ToString(obj);
                }

                GridViewCommandColumn objgcc = getCommandColumnLoop();
                if (state == "2")
                {
                    GridViewCommandColumnButtonControl thebtn;

                    thebtn = (GridViewCommandColumnButtonControl)e.Row.Cells[objgcc.VisibleIndex].Controls[0];
                    //thebtn.Enabled = false;
                    InternalHyperLink theIHL = (InternalHyperLink)thebtn.Controls[0];
                    theIHL.Text = "反审核";
                }
                else
                {
                    //e.Row.Enabled = true;
                }

            }

        }


        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.gridExport.WriteXlsToResponse();
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {

            String where = " AND ISNULL(B.PrevPolicyID,'') !='' AND ISNULL(B.PolicyType,'0') ='1' ";//" and ISNULL(B.PolicyStatus,'0') = '1' and ISNULL(B.AskPriceID,'') != '' ";
            if (this.dxeddlCheckState.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlCheckState.SelectedItem.Value.ToString()))
            {
                where = where + " AND ISNULL(B.PolicyStatus,'0') = '" + dxeddlCheckState.SelectedItem.Value.ToString() + "' ";
            }
            else
            {
                where = where + " AND ISNULL(B.PolicyStatus,'0') = '1' ";
            }

            //询价单号
            if (!String.IsNullOrEmpty(this.dxetxtAskPriceID.Text))
            {
                where += " and B.AskPriceID='" + this.dxetxtAskPriceID.Text.Trim() + "'";
            }

            //投保编号
            if (!String.IsNullOrEmpty(this.dxetxtPolicyID.Text))
            {
                where += " and B.PolicyID ='" + this.dxetxtPolicyID.Text.Trim() + "'";
            }

            //投保客户
            if (!String.IsNullOrEmpty(this.dxetxtCustomer.Text))
            {
                where += " and G.CustName like '%" + this.dxetxtCustomer.Text.Trim() + "%'";
            }

            //部门
            if (this.dxeddlDeptID.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlDeptID.SelectedItem.Value.ToString()))
            {
                where += " and B.DeptId='" + this.dxeddlDeptID.SelectedItem.Value.ToString() + "'";
            }

            //客户经理
            if (this.dxeddlSalesId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSalesId.SelectedItem.Value.ToString()))
            {
                where += " and B.SalesId='" + this.dxeddlSalesId.SelectedItem.Value.ToString() + "'";
            }


            //车牌号
            if (!String.IsNullOrEmpty(this.dxetxtCarNo.Text.Trim()))
            {
                where += " and B.CarNo like ('%" + this.dxetxtCarNo.Text.Trim() + "%')";
            }

            //业务来源
            if (this.dxeddlSourceTypeID.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSourceTypeID.SelectedItem.Value.ToString()))
            {
                where += " and B.SourceTypeID='" + this.dxeddlSourceTypeID.SelectedItem.Value.ToString() + "'";
            }

            //业务性质
            if (this.dxeddlOperationType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlOperationType.SelectedItem.Value.ToString()))
            {
                where += " and B.OperationType='" + this.dxeddlOperationType.SelectedItem.Value.ToString() + "'";
            }

            //录单人
            if (!String.IsNullOrEmpty(this.dxetxtCreatePerson.Text.Trim()))
            {
                where += " and M.UserNameCn like ('%" + this.dxetxtCreatePerson.Text.Trim() + "%')";
            }

            //保险公司
            if (this.dxeddlCarrierId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlCarrierId.SelectedItem.Value.ToString()))
            {
                where += " and A.CarrierID='" + this.dxeddlCarrierId.SelectedItem.Value.ToString() + "'";
            }

            //分支机构
            if (this.dxeddlBranchId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlBranchId.SelectedItem.Value.ToString()))
            {
                where += " and A.BranchID='" + this.dxeddlBranchId.SelectedItem.Value.ToString() + "'";
            }

            ////保单编号
            //if (!String.IsNullOrEmpty(this.dxetxtPolicyNo.Text))
            //{
            //    where += " and B.PolicyNo ='" + this.dxetxtPolicyNo.Text.Trim() + "'";
            //}

            //录单日期
            if (this.dxeStartDate.Date > DateTime.MinValue && this.dxeStartDate.Date < DateTime.MaxValue)
            {
                where += " and B.CreateTime>='" + this.dxeStartDate.Date + "'";
            }

            if (this.dxeEndDate.Date > DateTime.MinValue && this.dxeEndDate.Date < DateTime.MaxValue)
            {
                where += " and B.CreateTime<='" + this.dxeEndDate.Date + "'";
            }

            Parameter pt;
            pt = this.ds_gridSearchResult.SelectParameters[0];

            pt.DefaultValue = where;

            this.gridSearchResult.DataBind();

        }


        protected void CarrierBranchIDCallback(object source, 
            DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.SchemaSetting.BO_Branch.FetchListByCarrier(e.Parameter);
            thecb.TextField = "BranchName";
            thecb.ValueField = "BranchID";
            thecb.DataBind();
            thecb.Items.Insert(0, new ListEditItem("全部", ""));

            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }
        }



        private void Initialization()
        {
            DataSet dsList;

            //dxeddlCarrierId
            List<BO_Carrier> theCarrierList = BO_Carrier.FetchList();
            this.dxeddlCarrierId.DataSource = theCarrierList;
            this.dxeddlCarrierId.ValueField = "CarrierID";
            this.dxeddlCarrierId.TextField = "CarrierNameCn";
            this.dxeddlCarrierId.DataBind();
            this.dxeddlCarrierId.Items.Insert(0, new ListEditItem("(全部)", ""));


            //dxeddlBranchId
            List<BO_Branch> theBranchList = BO_Branch.FetchList();
            this.dxeddlBranchId.DataSource = theBranchList;
            this.dxeddlBranchId.ValueField = "BranchID";
            this.dxeddlBranchId.TextField = "BranchName";
            this.dxeddlBranchId.DataBind();
            this.dxeddlBranchId.Items.Insert(0, new ListEditItem("(全部)", ""));

            //部门
            dsList = BO_P_Department.GetDeptByDeptID("");
            this.dxeddlDeptID.DataSource = dsList;
            this.dxeddlDeptID.ValueField = "DeptID";
            this.dxeddlDeptID.TextField = "DeptName";
            this.dxeddlDeptID.DataBind();
            this.dxeddlDeptID.Items.Insert(0, new ListEditItem("(全部)", ""));


            //客户经理
            dsList = BO_P_User.GetUserByUserID("");
            this.dxeddlSalesId.DataSource = dsList;
            this.dxeddlSalesId.ValueField = "UserID";
            this.dxeddlSalesId.TextField = "UserNameCn";
            this.dxeddlSalesId.DataBind();
            this.dxeddlSalesId.Items.Insert(0, new ListEditItem("(全部)", ""));

            //dxeddlSourceTypeID
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.SourceType.ToString());
            this.dxeddlSourceTypeID.DataSource = dsList;
            this.dxeddlSourceTypeID.ValueField = "CodeID";
            this.dxeddlSourceTypeID.TextField = "CodeName";
            this.dxeddlSourceTypeID.DataBind();
            this.dxeddlSourceTypeID.Items.Insert(0, new ListEditItem("(全部)", ""));

            //dxeddlOperationType
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.OperationType.ToString());
            this.dxeddlOperationType.DataSource = dsList;
            this.dxeddlOperationType.ValueField = "CodeID";
            this.dxeddlOperationType.TextField = "CodeName";
            this.dxeddlOperationType.DataBind();
            this.dxeddlOperationType.Items.Insert(0, new ListEditItem("(全部)", ""));

            ////GatheringType
            //dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.GatheringType.ToString());
            //this.dxeddlGatheringType.DataSource = dsList;
            //this.dxeddlGatheringType.ValueField = "CodeID";
            //this.dxeddlGatheringType.TextField = "CodeName";
            //this.dxeddlGatheringType.DataBind();
            //this.dxeddlGatheringType.Items.Insert(0, new ListEditItem("(全部)", ""));

        }



        protected void gridAuditSearchResult_CustomCallback(object sender, 
            DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }


        protected void policyTabPage_ActiveTabChanged(object source, 
            DevExpress.Web.ASPxTabControl.TabControlEventArgs e)
        {
            //
        }


        private GridViewCommandColumn getCommandColumnLoop()
        {
            GridViewCommandColumn theCommandColumn = null;
            foreach (GridViewColumn item in gridSearchResult.VisibleColumns)
            {
                if (item.GetType() == typeof(GridViewCommandColumn))
                {
                    theCommandColumn = (GridViewCommandColumn)item;
                    break;
                }
            }
            return theCommandColumn;
        }


        protected void dxeddlSalesIdCallback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(e.Parameter);
            thecb.TextField = "UserNameCn";
            thecb.ValueField = "UserID";
            thecb.DataBind();
            thecb.Items.Insert(0, new ListEditItem("全部", ""));

            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }

        }




    }
}