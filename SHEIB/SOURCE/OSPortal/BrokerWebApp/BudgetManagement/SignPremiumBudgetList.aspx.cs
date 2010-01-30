using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data;
using BusinessObjects;
using DevExpress.Web.ASPxEditors;

namespace BrokerWebApp.BudgetManagement
{
    public partial class SignPremiumBudgetList : BasePage
    {
        #region Variables

        private string toadd = string.Empty;

        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    this.Initialization();
                    CheckPermission();
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
            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.SignupBudget_List_Personal))
            {
                dxeddlDeptID.Value = this.CurrentUser.DeptID;
                dxeddlSalesID.Value = this.CurrentUser.UserID;

                dxeddlDeptID.ClientEnabled = false;
                dxeddlSalesID.ClientEnabled = false;
            }
            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.SignupBudget_List_Group))
            {
                dxeddlDeptID.Value = this.CurrentUser.DeptID;
                dxeddlDeptID.ClientEnabled = false;

                dxeddlSalesID.Value = this.CurrentUser.UserID;
                dxeddlSalesID.ClientEnabled = true;
            }

            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.SignupBudget_List_All))
            {
                dxeddlDeptID.ClientEnabled = true;
                dxeddlSalesID.ClientEnabled = true;
            }
        }

        /// <summary>
        /// 初始化控件
        /// </summary>
        private void Initialization()
        {
            DataSet dsList;

            this.dxeddlDeptID.DataSource = BusinessObjects.BO_P_Department.FetchList();
            this.dxeddlDeptID.TextField = "DeptName";
            this.dxeddlDeptID.ValueField = "DeptID";
            this.dxeddlDeptID.DataBind();
            this.dxeddlDeptID.Items.Insert(0, new ListEditItem("(全部)", ""));

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

            //保单类别
            this.dxeddlPremiumType.Items.Add("(全部)", "");
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.PremiumType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlPremiumType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }

            dsList = BusinessObjects.SchemaSetting.BO_ProductType.GetProductTypeList();
            if (dsList.Tables[0] != null && dsList.Tables[0].Rows.Count > 0)
            {
                this.SetProdTypeName(dsList.Tables[0], "0", this.dxeddlProdTypeName);
            }
            
        }


        private void SetProdTypeName(DataTable table, string parentid, ASPxComboBox comboBox)
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


        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.BindGrid();
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int signPremiumBudgetID = Convert.ToInt32(e.Keys["SignPremiumBudgetID"]);
            BusinessObjects.Budget.BO_SignPremiumBudget.Delete(signPremiumBudgetID);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
            this.BindGrid();
        }

        protected void gridSearchResult_CustomCallBack(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            //                       
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
            if (this.dxeddlSalesID.SelectedItem.Value.ToString().Length > 0)
                sbWhere.Append(" And S.SalesID='" + this.dxeddlSalesID.SelectedItem.Value.ToString() + "' ");
            if(this.hidCustID.Value.Length>0)
                sbWhere.Append(" And S.CustomerID='" + this.hidCustID.Value + "' ");


            //保险险种
            if (this.ptid.Value != null && !String.IsNullOrEmpty(this.ptid.Value))
            {
               sbWhere.Append(" and  S.ProdTypeID like ('%" + this.ptid.Value.Trim() + "%') ");
            }

            if (this.dxetxtNY.Text.Trim().Length > 0)
                sbWhere.Append(" And S.NY='" + this.dxetxtNY.Text.Trim() + "' ");
            if (this.dxeddlPremiumType.SelectedItem.Value.ToString().Length > 0)
                sbWhere.Append(" And S.PremiumType='" + this.dxeddlPremiumType.SelectedItem.Value.ToString() + "' ");

            if (this.dxeddlOperationType.SelectedItem != null && !String.IsNullOrEmpty(this.dxeddlOperationType.SelectedItem.Value.ToString()))
            {
                sbWhere.Append(" and S.OperationType ='" + dxeddlOperationType.SelectedItem.Value.ToString() + "'");
            }
            this.gridSearchResult.DataSource = BusinessObjects.Budget.BO_SignPremiumBudget.GetConsultFeeList(sbWhere.ToString()).Tables[0];
            this.gridSearchResult.DataBind();
        }

        protected void dxeddlSalesIdCallback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(e.Parameter);
            thecb.TextField = "UserNameCn";
            thecb.ValueField = "UserID";
            thecb.DataBind();
            thecb.Items.Insert(0, new ListEditItem("(全部)", ""));
            //if (thecb.Items.Count > 0)
            //{
            //    thecb.SelectedItem = thecb.Items[0];
            //}
        }
    }
}
