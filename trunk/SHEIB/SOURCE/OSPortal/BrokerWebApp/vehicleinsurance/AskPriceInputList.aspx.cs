using System;
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

namespace BrokerWebApp.vehicleinsurance
{
    public partial class AskPriceInputList : BasePage
    {

        #region Variables

        private const String gridKeyName = "AskPriceID";

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
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


        
        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
        }

        
        protected void gridSearchResult_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }

        protected void gridSearchResult_HtmlRowCreated(object sender,
            ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                DataRow dr = this.gridSearchResult.GetDataRow(e.VisibleIndex);

                if (!String.IsNullOrEmpty(dr["Remark"].ToString()))
                {
                    e.Row.Style.Add(HtmlTextWriterStyle.Color, "red");
                }
            }
        }


        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.gridExport.WriteXlsToResponse();
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            String where = " and ISNULL(A1.PolicyStatus,'0') = '0' ";

            if (!String.IsNullOrEmpty(this.dxetxtAskPriceID.Text))
            {
                where += " and A1.AskPriceID='" + this.dxetxtAskPriceID.Text.Trim() + "'";
            }

            if (!String.IsNullOrEmpty(this.dxetxtPolicyID.Text))
            {
                //where += " and ='" + this.dxetxtPolicyID.Text.Trim() + "'";
            }

            if (!String.IsNullOrEmpty(this.dxetxtCustomer.Text))
            {
                where += " and G.CustName='" + this.dxetxtCustomer.Text.Trim() + "'";
            }

            if (this.dxeddlDeptID.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlDeptID.SelectedItem.Value.ToString()))
            {
                where += " and A1.DeptId='" + this.dxeddlDeptID.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlSalesId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSalesId.SelectedItem.Value.ToString()))
            {
                where += " and A1.SalesId='" + this.dxeddlSalesId.SelectedItem.Value.ToString() + "'";
            }


            if (!String.IsNullOrEmpty(this.dxetxtCarCount.Text.Trim()) && Information.IsNumeric(this.dxetxtCarCount.Text.Trim()))
            {
                where += " and A1.CarCount=" + this.dxetxtCarCount.Text.Trim();
            }

            if (this.dxeddlSourceTypeID.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSourceTypeID.SelectedItem.Value.ToString()))
            {
                where += " and A1.SourceTypeID='" + this.dxeddlSourceTypeID.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlOperationType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlOperationType.SelectedItem.Value.ToString()))
            {
                where += " and A1.OperationType='" + this.dxeddlOperationType.SelectedItem.Value.ToString() + "'";
            }

            if (!String.IsNullOrEmpty(this.dxetxtCreatePerson.Text.Trim()))
            {
                where += " and A1.CreatePerson='" + this.dxetxtCreatePerson.Text.Trim() + "'";
            }

            if (this.dxeddlCarrierId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlCarrierId.SelectedItem.Value.ToString()))
            {
                where += " and A1.CarrierID='" + this.dxeddlCarrierId.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeddlBranchId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlBranchId.SelectedItem.Value.ToString()))
            {
                where += " and A1.BranchID='" + this.dxeddlBranchId.SelectedItem.Value.ToString() + "'";
            }

            if (this.dxeStartDate.Date > DateTime.MinValue && this.dxeStartDate.Date < DateTime.MaxValue)
            {
                where += " and A1.CreateTime>='" + this.dxeStartDate.Date + "'";
            }

            if (this.dxeEndDate.Date > DateTime.MinValue && this.dxeEndDate.Date < DateTime.MaxValue)
            {
                where += " and A1.CreateTime<='" + this.dxeEndDate.Date + "'";
            }

            Parameter pt;
            pt = this.ds_gridSearchResult.SelectParameters[0];

            pt.DefaultValue = where;

            this.gridSearchResult.DataBind();

        }


        protected void CarrierBranchIDCallback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.SchemaSetting.BO_Branch.FetchListByCarrier(e.Parameter);
            thecb.TextField = "BranchName";
            thecb.ValueField = "BranchID";
            thecb.DataBind(); thecb.Items.Insert(0, new ListEditItem("", ""));
                        
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



        protected void dxeddlSalesIdCallback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(e.Parameter);
            thecb.TextField = "UserNameCn";
            thecb.ValueField = "UserID";
            thecb.DataBind();
            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }

        }



    }
}
