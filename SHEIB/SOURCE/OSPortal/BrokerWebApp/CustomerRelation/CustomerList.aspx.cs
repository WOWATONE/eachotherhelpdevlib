﻿using System;
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
    public partial class CustomerList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.Initialization();
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

            //客户经理
            this.dxeddlSalesID.Items.Add("(全部)", "");
            dsList = BO_P_User.GetUserByUserID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlSalesID.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
                }
            }
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String custID = e.Keys["CustID"].ToString();
            BO_Customer.Delete(custID);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
            this.FillGridSearchResult();
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //  
        }

        protected void gridSearchResult_CustomCallBack(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            //                       
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.FillGridSearchResult();
        }

        /// <summary>
        /// 填充数据
        /// </summary>
        private void FillGridSearchResult()
        {
            BO_Customer customer = new BO_Customer();
            customer.CustTypeID = this.radPerson.Checked ? 1 : 0;
            if (this.dxetxtCustID.Text.Trim().Length > 0)
                customer.CustID = this.dxetxtCustID.Text.Trim();
            if (this.dxeddlArea.SelectedItem.Value.ToString().Length > 0)
                customer.Area = this.dxeddlArea.SelectedItem.Value.ToString();
            if (this.dxetxtAddress.Text.Trim().Length > 0)
                customer.Address = this.dxetxtAddress.Text.Trim();
            if (this.dxetxtCustName.Text.Trim().Length > 0)
                customer.CustName = this.dxetxtCustName.Text.Trim();
            if (this.dxeddlTradeType.SelectedItem.Value.ToString().Length > 0)
                customer.TradeTypeID = this.dxeddlTradeType.SelectedItem.Value.ToString();
            if (this.dxeddlDepartment.SelectedItem.Value.ToString().Length > 0)
                customer.DeprtmentID = this.dxeddlDepartment.SelectedItem.Value.ToString();
            if (this.dxetxtIDNO.Text.Trim().Length > 0)
                customer.IDNO = this.dxetxtIDNO.Text.Trim();
            if (this.dxeddlSalesID.SelectedItem.Value.ToString().Length > 0)
                customer.SalesID = this.dxeddlSalesID.SelectedItem.Value.ToString();

            this.gridSearchResult.DataSource = customer.GetCustomerList();
            this.gridSearchResult.DataBind();
        }
    }
}
