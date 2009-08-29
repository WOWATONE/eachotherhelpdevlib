using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxGridView.Rendering;
using DevExpress.Web.ASPxClasses.Internal;


namespace BrokerWebApp.otherinsurance
{
    public partial class PolicyCheckList : BasePage
    {

        #region Variables

        private string toadd = string.Empty;

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            this.LblUserNameTop.Text = this.CurrentUser.UserNameCn;
            if (!Page.IsPostBack)
            {
                bindDropDownLists();
            }
        }
        
        
        protected void gridSearchResult_RowDeleting(object sender, 
            DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_CustomCallback(object sender, 
            DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string lsWhere = " AND ISNULL(B.PolicyType,'0') ='0' ";

            if (this.dxeddlCheckState.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlCheckState.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " AND ISNULL(B.PolicyStatus,'0') = '" + dxeddlCheckState.SelectedItem.Value.ToString() + "' ";
            }
            else
            {
                lsWhere = lsWhere + " AND ISNULL(B.PolicyStatus,'0') = '1' ";
            }

            //投保编号
            if (dxetxtPolicyID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and b.PolicyID ='" + dxetxtPolicyID.Text + "'";
            }

            //保单编号
            if (dxetxtPolicyNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and b.PolicyNo ='" + dxetxtPolicyNo.Text + "'";
            }

            //批单编号
            if (dxetxtAltNO.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and b.AltNO ='" + dxetxtAltNO.Text + "'";
            }

            //投保客户
            if (this.dxetxtCustomer.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and  G.CustName like ('%" + this.dxetxtCustomer.Text.Trim() + "%') ";
            }

            //部门
            if (this.dxeddlDeptID.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlDeptID.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.DeptId ='" + dxeddlDeptID.SelectedItem.Value.ToString() + "'";
            }

            //客户经理
            if (this.dxeddlSalesId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSalesId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.SalesId ='" + dxeddlSalesId.SelectedItem.Value.ToString() + "'";
            }

            //保险险种
            if (this.ptid.Value != null && !String.IsNullOrEmpty(this.ptid.Value))
            {
                lsWhere = lsWhere + " and  b.ProdTypeID like ('%" + this.ptid.Value.Trim() + "%') ";
            }

            //保险公司
            if (this.dxeddlCarrierId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlCarrierId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.CarrierID ='" + dxeddlCarrierId.SelectedItem.Value.ToString() + "'";
            }

            //分支机构
            if (this.dxeddlBranchId.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlBranchId.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and a.BranchID ='" + dxeddlBranchId.SelectedItem.Value.ToString() + "'";
            }

            //业务员
            if (this.dxetxtCarrierSales.Text.Trim() != "")
            {
                //lsWhere = lsWhere + " and  b.CarrierSales like ('%" + this.dxetxtCarrierSales.Text.Trim() + "%') ";
                lsWhere = lsWhere + " and (";
                lsWhere = lsWhere + " b.CarrierSales like ('%" + this.dxetxtCarrierSales.Text.Trim() + "%') ";
                lsWhere = lsWhere + " or ";
                lsWhere = lsWhere + " A.CarrierSales like ('%" + this.dxetxtCarrierSales.Text.Trim() + "%') ";
                lsWhere = lsWhere + " )";
            }

            //业务来源
            if (this.dxeddlSourceTypeID.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlSourceTypeID.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.SourceTypeID ='" + dxeddlSourceTypeID.SelectedItem.Value.ToString() + "'";
            }

            //业务性质
            if (this.dxeddlOperationType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlOperationType.SelectedItem.Value.ToString()))
            {
                lsWhere = lsWhere + " and b.OperationType ='" + dxeddlOperationType.SelectedItem.Value.ToString() + "'";
            }
                        

            //录单日期
            string lsStartDate = dxeStartDate.Date.ToString("yyyy-MM-dd");
            string lsEndDate = dxeEndDate.Date.ToString("yyyy-MM-dd");
            if ((dxeStartDate.Text.Trim() != "") && (dxeEndDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), B.CreateTime,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), B.CreateTime,21)) <='" + lsEndDate + "'";
            }

            
            Parameter pt;
            pt = this.gd_DataSource.SelectParameters[0];

            pt.DefaultValue = lsWhere;

            this.gridSearchResult.DataBind();

        }


        protected void gridSearchResult_CommandCellPrepared(object sender,
            ASPxGridViewTableCommandCellEventArgs e)
        {
            //
        }

        protected void gridSearchResult_RowPrepared(object sender,
            ASPxGridViewTableRowEventArgs e)
        {
            //          
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
                    thebtn.Enabled = false;
                    InternalHyperLink theIHL = (InternalHyperLink)thebtn.Controls[0];
                    theIHL.Text = "反审核";
                }
                else
                {
                    object objIsAntiAudit = e.GetValue("IsAntiAudit");
                    if (!String.IsNullOrEmpty(objIsAntiAudit.ToString()))
                    {
                        e.Row.Style.Add(HtmlTextWriterStyle.Color, "red");
                    }                     
                }

            }
                        
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


        private void bindDropDownLists()
        {
            DataSet dsList;
            this.dxeddlDeptID.DataSource = BusinessObjects.BO_P_Department.FetchList();
            this.dxeddlDeptID.TextField = "DeptName";
            this.dxeddlDeptID.ValueField = "DeptID";
            this.dxeddlDeptID.DataBind();
            this.dxeddlDeptID.Items.Insert(0, new ListEditItem("全部", ""));

            this.dxeddlSalesId.DataSource = BusinessObjects.BO_P_User.FetchList();
            this.dxeddlSalesId.TextField = "UserNameCn";
            this.dxeddlSalesId.ValueField = "UserID";
            this.dxeddlSalesId.DataBind();
            this.dxeddlSalesId.Items.Insert(0, new ListEditItem("全部", ""));

            this.dxeddlOperationType.DataSource = BusinessObjects.BO_P_Code.GetOperationTypeList();
            this.dxeddlOperationType.TextField = "OperationTypeName";
            this.dxeddlOperationType.ValueField = "OperationTypeID";
            this.dxeddlOperationType.DataBind();
            this.dxeddlOperationType.Items.Insert(0, new ListEditItem("全部", ""));

            this.dxeddlSourceTypeID.DataSource = BusinessObjects.BO_P_Code.GetSourceTypeList();
            this.dxeddlSourceTypeID.TextField = "SourceTypeName";
            this.dxeddlSourceTypeID.ValueField = "SourceTypeID";
            this.dxeddlSourceTypeID.DataBind();
            this.dxeddlSourceTypeID.Items.Insert(0, new ListEditItem("全部", ""));

            this.dxeddlCarrierId.DataSource = BusinessObjects.SchemaSetting.BO_Carrier.GetCarrierList("");
            this.dxeddlCarrierId.TextField = "CarrierNameCn";
            this.dxeddlCarrierId.ValueField = "CarrierID";
            this.dxeddlCarrierId.DataBind();
            this.dxeddlCarrierId.Items.Insert(0, new ListEditItem("全部", ""));


            this.dxeddlBranchId.DataSource = BusinessObjects.SchemaSetting.BO_Branch.GetBranchList("");
            this.dxeddlBranchId.TextField = "BranchName";
            this.dxeddlBranchId.ValueField = "BranchID";
            this.dxeddlBranchId.DataBind();
            this.dxeddlBranchId.Items.Insert(0, new ListEditItem("全部", ""));

            
            dsList = BusinessObjects.SchemaSetting.BO_ProductType.GetProductTypeList();
            if (dsList.Tables[0] != null && dsList.Tables[0].Rows.Count > 0)
            {
                this.SetProdTypeName(dsList.Tables[0], "0", this.dxeddlProdTypeName);
            }
        }

        private void SetProdTypeName(DataTable table, string parentid, 
            ASPxComboBox comboBox)
        {
            if (parentid == "0")
                this.toadd = "";
            else
                this.toadd += "   ";
            DataRow[] rows = table.Select("ParentID='" + parentid + "'", "ProdClass");
            foreach (DataRow row in rows)
            {
                comboBox.Items.Add(this.toadd + (parentid == "0" ? "" : "∟") + row["ProdTypeName"].ToString(), row["ProdTypeID"].ToString());
                this.SetProdTypeName(table, row["ProdTypeID"].ToString(), comboBox);
                this.toadd = this.toadd.Substring(0, this.toadd.Length - 3);
            }
        }

        private void SetddlProdTypeName(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                this.dxeddlProdTypeName.SelectedIndex = this.dxeddlProdTypeName.Items.IndexOf(this.dxeddlProdTypeName.Items.FindByValue(value));
                if (this.dxeddlProdTypeName.SelectedIndex >= 0)
                    this.dxeddlProdTypeName.Text = this.dxeddlProdTypeName.SelectedItem.Text.Substring(this.dxeddlProdTypeName.SelectedItem.Text.IndexOf("∟") + 1);
            }
        }


        protected void dxeddlSalesIdCallback(object source, 
            DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(e.Parameter);
            thecb.TextField = "UserNameCn";
            thecb.ValueField = "UserID";
            thecb.DataBind();
            //thecb.Items.Insert(0, new ListEditItem("全部", ""));
            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }

        }


        protected void CarrierBranchIDCallback(object source, 
            DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.SchemaSetting.BO_Branch.FetchListByCarrier(e.Parameter);
            thecb.TextField = "BranchName";
            thecb.ValueField = "BranchID";
            thecb.DataBind();
            //thecb.Items.Insert(0, new ListEditItem("全部", ""));
            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }
        }


        protected void gridSearchResult_CustomJSProperties(object sender,
            ASPxGridViewClientJSPropertiesEventArgs e)
        {
            object[] titleID = new object[2];
            titleID[0] = "T0";
            titleID[1] = "T1";
            //e.Properties["cpCusJSproperty_IsAlert"] = "1";
            e.Properties["cpCusJSproperty_IsAlert"] = titleID;
        }


    }
}
