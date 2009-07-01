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
            this.hidCodeTypeID.Value = codeTypeID;
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
            string codeTypeID = this.hidCodeTypeID.Value;
            if (string.IsNullOrEmpty(codeTypeID))
            {
                e.Cancel = true;
                this.gridCodeItem.CancelEdit();
                return;
            }

            HtmlTable tblEditorTemplate = this.gridCodeItem.FindEditFormTemplateControl("tblgridCodeItemEditorTemplate") as HtmlTable;
            string codeID = e.Keys["CodeID"].ToString();
            string newCodeID = (tblEditorTemplate.FindControl("dxetxtCodeID") as ASPxTextBox).Text.Trim();

            if (newCodeID.Length <= 0)
                throw new Exception("代码编号不能为空。");

            if (codeID != newCodeID && BusinessObjects.BO_P_Code.IfExistsCodeID(codeTypeID,newCodeID))
                throw new Exception("代码编号已经存在。");

            if((tblEditorTemplate.FindControl("dxetxtCodeName") as ASPxTextBox).Text.Trim().Length<=0)
                throw new Exception("代码名称不能为空。");

            if(!this.IsIntValue((tblEditorTemplate.FindControl("dxetxtSortNo") as ASPxTextBox).Text.Trim()))
                throw new Exception("排序序号格式错误。");

            BusinessObjects.BO_P_Code p_code = new BO_P_Code();
            p_code.CodeType = codeTypeID;
            p_code.CodeID = codeID;
            p_code.CodeName = (tblEditorTemplate.FindControl("dxetxtCodeName") as ASPxTextBox).Text.Trim();
            p_code.SortNo = (tblEditorTemplate.FindControl("dxetxtSortNo") as ASPxTextBox).Text.Trim() == "" ? 0 : Convert.ToDecimal((tblEditorTemplate.FindControl("dxetxtSortNo") as ASPxTextBox).Text.Trim());
            p_code.Content1 = (tblEditorTemplate.FindControl("dxetxtContent1") as ASPxTextBox).Text.Trim();
            p_code.Content2 = (tblEditorTemplate.FindControl("dxetxtContent2") as ASPxTextBox).Text.Trim();
            p_code.Content3 = (tblEditorTemplate.FindControl("dxetxtContent3") as ASPxTextBox).Text.Trim();
            p_code.NewCodeID = newCodeID;
            p_code.Save(ModifiedAction.Update);

            e.Cancel = true;
            this.gridCodeItem.CancelEdit();
            this.gridCodeItem.DataSource = BusinessObjects.BO_P_Code.GetCodeListByCodeTypeID(codeTypeID).Tables[0];
            this.gridCodeItem.DataBind();
        }

        protected void gridCodeItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            string codeTypeID = this.hidCodeTypeID.Value;
            if (string.IsNullOrEmpty(codeTypeID))
            {
                e.Cancel = true;
                this.gridCodeItem.CancelEdit();
                return;
            }

            HtmlTable tblEditorTemplate = this.gridCodeItem.FindEditFormTemplateControl("tblgridCodeItemEditorTemplate") as HtmlTable;
            string codeID = (tblEditorTemplate.FindControl("dxetxtCodeID") as ASPxTextBox).Text.Trim();

            if (codeID.Length <= 0)
                throw new Exception("代码编号不能为空。");

            if (BusinessObjects.BO_P_Code.IfExistsCodeID(codeTypeID, codeID))
                throw new Exception("代码编号已经存在。");

            if ((tblEditorTemplate.FindControl("dxetxtCodeName") as ASPxTextBox).Text.Trim().Length <= 0)
                throw new Exception("代码名称不能为空。");

            if (!this.IsIntValue((tblEditorTemplate.FindControl("dxetxtSortNo") as ASPxTextBox).Text.Trim()))
                throw new Exception("排序序号格式错误。");

            BusinessObjects.BO_P_Code p_code = new BO_P_Code();
            p_code.CodeType = codeTypeID;
            p_code.CodeID = codeID;
            p_code.CodeName = (tblEditorTemplate.FindControl("dxetxtCodeName") as ASPxTextBox).Text.Trim();
            p_code.SortNo = (tblEditorTemplate.FindControl("dxetxtSortNo") as ASPxTextBox).Text.Trim() == "" ? 0 : Convert.ToDecimal((tblEditorTemplate.FindControl("dxetxtSortNo") as ASPxTextBox).Text.Trim());
            p_code.Content1 = (tblEditorTemplate.FindControl("dxetxtContent1") as ASPxTextBox).Text.Trim();
            p_code.Content2 = (tblEditorTemplate.FindControl("dxetxtContent2") as ASPxTextBox).Text.Trim();
            p_code.Content3 = (tblEditorTemplate.FindControl("dxetxtContent3") as ASPxTextBox).Text.Trim();
            p_code.Save(ModifiedAction.Insert);

            e.Cancel = true;
            this.gridCodeItem.CancelEdit();
            this.gridCodeItem.DataSource = BusinessObjects.BO_P_Code.GetCodeListByCodeTypeID(codeTypeID).Tables[0];
            this.gridCodeItem.DataBind();
        }

        protected void gridCodeItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            string codeTypeID = this.hidCodeTypeID.Value;
            if (string.IsNullOrEmpty(codeTypeID))
            {
                e.Cancel = true;
                this.gridCodeItem.CancelEdit();
                return;
            }

            string codeID = e.Keys["CodeID"].ToString();

            BusinessObjects.BO_P_Code.Delete(codeTypeID, codeID);

            e.Cancel = true;
            this.gridCodeItem.CancelEdit();
            this.gridCodeItem.DataSource = BusinessObjects.BO_P_Code.GetCodeListByCodeTypeID(codeTypeID).Tables[0];
            this.gridCodeItem.DataBind();
        }
        #endregion

        protected void cpSchemaDetail_Callback(object source, CallbackEventArgsBase e)
        {
            this.SetCode(e.Parameter);
        }

        /// <summary>
        /// 判断是否是正整数值
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private bool IsIntValue(string value)
        {
            if (string.IsNullOrEmpty(value))
                return false;
            int result = 0;
            return int.TryParse(value, out result);
        }
    }
}
