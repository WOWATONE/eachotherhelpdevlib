﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;
using BusinessObjects.SchemaSetting;

namespace OSPortalWebApp.inoutbalance
{
    public partial class FeeCustomer : System.Web.UI.Page
    {
        #region Variables

        private DataTable _dtGrid;

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {
                Initialization();
                dxeddlAuditStauts.SelectedIndex = 0;
                BindGrid();
            }

        }

        private void Initialization()
        {
            DataSet dsList;

            //GatheringType
            this.dxeddlGatheringType.Items.Add("(全部)", "");
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.GatheringType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlGatheringType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }

            //AuditStatus
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.AuditStatus.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlAuditStauts.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }


            //部门
            this.dxeddlDeptId.Items.Add("(全部)", "");
            dsList = BO_P_Department.GetDeptByDeptID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlDeptId.Items.Add(row["DeptName"].ToString().Trim(), row["DeptID"].ToString().Trim());
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


            //PolicyType
            this.dxeddlPolicyType.Items.Add("(全部)", "");
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.PolicyType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlPolicyType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }
        }



        private void BindGrid()
        {
            string lsWhere = "";

            if (dxetxtNoticeNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and b.NoticeNo ='" + dxetxtNoticeNo.Text + "'";
            }

            if (dxetxtPolicyNo.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and c.PolicyNo ='" + dxetxtPolicyNo.Text + "'";
            }
            if (dxetxtPolicyID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and c.PolicyID ='" + dxetxtPolicyID.Text + "'";
            }
            if (dxeddlGatheringType.SelectedItem.Value.ToString().Trim() != "")
            {
                lsWhere = lsWhere + " and  d.GatheringType= ='" + dxeddlGatheringType.SelectedItem.Value.ToString() + "'";
            }
            if (dxeddlDeptId.SelectedItem.Value.ToString().Trim() != "")
            {
                lsWhere = lsWhere + " and c.DeptId ='" + dxeddlDeptId.SelectedItem.Value.ToString() + "'";
            }
            if (dxeddlSalesID.SelectedItem.Value.ToString().Trim() != "")
            {
                lsWhere = lsWhere + " and c.SalesId ='" + dxeddlSalesID.SelectedItem.Value.ToString() + "'";
            }
            if (dxetxtCustomerID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and  exists( select 1 from Customer where CustName like '%" + dxetxtCustomerID.Text + "%' and CustID=c.CustomerID) ";
            }
            if (dxetxtProdTypeID.Text.Trim() != "")
            {
                lsWhere = lsWhere + " and  exists( select 1 from ProductType where ProdTypeName like '%" + dxetxtProdTypeID.Text + "%' and ProdTypeID=c.ProdTypeID) ";
            }

            string lsStartDate = dxeStartFeeDate.Date.ToString("yyyy-MM-dd");
            string lsEndDate = dxeEndFeeDate.Date.ToString("yyyy-MM-dd");
            if ((dxeStartFeeDate.Text.Trim() != "") && (dxeStartFeeDate.Text.Trim() != ""))
            {
                lsWhere = lsWhere + " and (convert(char(10), A.FeeDate,21)) >='" + lsStartDate + "'";
                lsWhere = lsWhere + " and (convert(char(10), A.FeeDate,21)) <='" + lsEndDate + "'";
            }

            //if (dxeddlAuditStauts.SelectedItem.Value.ToString().Trim() != "")
            //{
            //    lsWhere = lsWhere + " and a.AuditStatus ='" + dxeddlAuditStauts.SelectedItem.Value.ToString() + "'";
            //}
            DataTable dt = BO_FeeCustomer.GetCustomerFeeList(lsWhere).Tables[0];
            this.gridSearchResult.DataSource = dt;
            this.gridSearchResult.DataBind();
            
        }



        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //DataTable dt = ((DataTable)ViewState["PolicyItemGridData"]);
            //DataRow row = dt.Rows.Find(e.Keys["ID"]);
            //dt.Rows.Remove(row);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }



    }
}