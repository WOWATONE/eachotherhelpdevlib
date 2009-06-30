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
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxClasses;
using BusinessObjects;

namespace BrokerWebApp.schemasetting
{
    public partial class DataDictionary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.Page.IsPostBack)
                {
                    string codeTypeID = string.Empty;
                    this.SetCodeType(out codeTypeID);
                    this.SetCode(codeTypeID);
                }
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 设置代码类型
        /// </summary>
        private void SetCodeType(out string codeTypeID)
        {
            codeTypeID = string.Empty;
            DataTable dtCodeType = BusinessObjects.BO_P_Code.GetCodeTypeList().Tables[0];
            if (dtCodeType != null && dtCodeType.Rows.Count > 0)
            {
                codeTypeID = dtCodeType.Rows[0]["CodeTypeID"].ToString();
            }
            this.gridCodeTypeItem.DataSource = dtCodeType;
            this.gridCodeTypeItem.DataBind();
        }

        /// <summary>
        /// 设置代码表
        /// </summary>
        /// <param name="codeTypeID"></param>
        private void SetCode(string codeTypeID)
        {
            if (string.IsNullOrEmpty(codeTypeID))
            {
                this.gridCodeItem.Enabled = false;
                return;
            }
            this.gridCodeItem.Enabled = true;
            this.gridCodeItem.DataSource = BusinessObjects.BO_P_Code.GetCodeListByCodeTypeID(codeTypeID).Tables[0];
            this.gridCodeItem.DataBind();
        }

        #region 代码类型
        protected void gridCodeTypeItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridCodeTypeItem.FindEditFormTemplateControl("tblgridCodeTypeItemEditorTemplate") as HtmlTable;
            string codeTypeID = e.Keys["CodeTypeID"].ToString();
            string name = (tblEditorTemplate.FindControl("dxetxtName") as ASPxTextBox).Text.Trim();

            if (string.IsNullOrEmpty(name))
                throw new Exception("代码类型名称不能为空。");

            BusinessObjects.BO_P_Code.UpdatePCodeType(codeTypeID, name);

            e.Cancel = true;
            this.gridCodeTypeItem.CancelEdit();
            this.gridCodeTypeItem.DataSource = BusinessObjects.BO_P_Code.GetCodeTypeList().Tables[0];
            this.gridCodeTypeItem.DataBind();
        }

        protected void gridCodeTypeItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridCodeTypeItem.FindEditFormTemplateControl("tblgridCodeTypeItemEditorTemplate") as HtmlTable;
            string codeTypeID = (tblEditorTemplate.FindControl("dxetxtCodeTypeID") as ASPxTextBox).Text.Trim();
            string name = (tblEditorTemplate.FindControl("dxetxtName") as ASPxTextBox).Text.Trim();

            if (string.IsNullOrEmpty(codeTypeID))
                throw new Exception("代码类型编号不能为空。");

            if (BusinessObjects.BO_P_Code.IfExistsCodeTypeID(codeTypeID))
                throw new Exception("代码类型编号已经存在。");

            if (string.IsNullOrEmpty(name))
                throw new Exception("代码类型名称不能为空。");

            BusinessObjects.BO_P_Code.InsertPCodeType(codeTypeID, name);

            e.Cancel = true;
            this.gridCodeTypeItem.CancelEdit();
            this.gridCodeTypeItem.DataSource = BusinessObjects.BO_P_Code.GetCodeTypeList().Tables[0];
            this.gridCodeTypeItem.DataBind();
        }

        protected void gridCodeTypeItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            string codeTypeID = e.Keys["CodeTypeID"].ToString();

            BusinessObjects.BO_P_Code.DeletePCodeType(codeTypeID);

            e.Cancel = true;
            this.gridCodeTypeItem.CancelEdit();
            this.gridCodeTypeItem.DataSource = BusinessObjects.BO_P_Code.GetCodeTypeList().Tables[0];
            this.gridCodeTypeItem.DataBind();
        }
        #endregion

        #region 代码表
        protected void gridCodeItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

        }

        protected void gridCodeItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

        }

        protected void gridCodeItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

        }
        #endregion

        protected void cpSchemaDetail_Callback(object source, CallbackEventArgsBase e)
        {
            this.SetCode(e.Parameter);
        }
    }
}
