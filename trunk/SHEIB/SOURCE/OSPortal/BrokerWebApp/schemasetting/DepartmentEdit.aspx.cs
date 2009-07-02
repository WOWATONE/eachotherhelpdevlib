using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;

namespace BrokerWebApp.schemasetting
{
    public partial class DepartmentEdit : System.Web.UI.Page
    {
        #region 私有变量
        /// 操作
        /// </summary>
        private string _action;
        /// <summary>
        /// 部门编号
        /// </summary>
        private string _ID;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    if (Request.QueryString["action"] != null && Request.QueryString["action"].Trim().Length > 0)
                    {
                        this._action = Request.QueryString["action"].Trim().ToLower();
                        this.ViewState["Action"] = this._action;

                        if (Request.QueryString["ID"] != null && Request.QueryString["ID"].Trim().Length > 0)
                        {
                            this._ID = Request.QueryString["ID"].Trim().ToLower();
                            this.ViewState["ID"] = this._ID;

                            this.Initialization();
                        }
                    }
                }
                else
                {
                    if (this.ViewState["Action"] != null && this.ViewState["Action"].ToString().Length > 0)
                    {
                        this._action = this.ViewState["Action"].ToString();

                        if (this.ViewState["ID"] != null && this.ViewState["ID"].ToString().Length > 0)
                        {
                            this._ID = this.ViewState["ID"].ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 初始化控件
        /// </summary>
        private void Initialization()
        {
            this.dxebtnBottomSave.Enabled = false;
            if (this._action == "add")
            {//增加险种
                if (this._ID == "l0")
                    this.dxetxtParent.Text = "";
                else
                {
                    BusinessObjects.BO_P_Department dept = new BO_P_Department(this._ID);
                    this.dxetxtParent.Text = dept.DeptName == null ? "" : dept.DeptName;
                }

                this.dxebtnBottomSave.Enabled = true;
            }
            else if (this._action == "edit")
            {//修改险种
                BusinessObjects.BO_P_Department dept = new BO_P_Department(this._ID);
                this.dxetxtParent.Text = dept.ParentName == null ? "" : dept.ParentName;
                this.dxetxtDeptID.Text = dept.DeptID;
                this.dxetxtDeptName.Text = dept.DeptName;
                this.dxetxtShortName.Text = dept.ShortName;
                this.dxetxtManager.Text = dept.Manager;
                this.dxetxtTel.Text = dept.Tel;
                this.dxetxtFax.Text = dept.Fax;

                this.dxebtnBottomSave.Enabled = true;
            }
        }

        /// <summary>
        /// 保存部门信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxebtnBottomSave_Click(object sender, EventArgs e)
        {
            try
            {
                this.lblerrmsg.Visible = false;
                if (this._action == "add")
                {//增加部门
                    if (BusinessObjects.BO_P_Department.IfExistsDeptID(this.dxetxtDeptID.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "该部门编号已存在。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    BusinessObjects.BO_P_Department dept = new BO_P_Department();
                    dept.DeptID = this.dxetxtDeptID.Text.Trim();
                    dept.DeptName = this.dxetxtDeptName.Text.Trim();
                    dept.ShortName = this.dxetxtShortName.Text.Trim();
                    dept.Manager = this.dxetxtManager.Text.Trim();
                    dept.ParentID = this._ID;
                    dept.Tel = this.dxetxtTel.Text.Trim();
                    dept.Fax = this.dxetxtFax.Text.Trim();
                    if (this._ID == "l0")
                    {
                        dept.ParentID = "";
                        dept.Layer = 1;
                    }
                    else
                    {
                        dept.ParentID = this._ID;
                        dept.Layer = BusinessObjects.BO_P_Department.GetLayerByDeptID(this._ID) + 1;
                    }
                    dept.Save(ModifiedAction.Insert);

                    this.Response.Redirect("DepartmentEdit.aspx?action=" + this._action + "&ID=" + this._ID);
                }
                else if (this._action == "edit")
                {//修改险种
                    if (this._ID != this.dxetxtDeptID.Text.Trim() &&
                        BusinessObjects.BO_P_Department.IfExistsDeptID(this.dxetxtDeptID.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "该部门编号已存在。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    BusinessObjects.BO_P_Department dept = new BO_P_Department();
                    dept.DeptID = this._ID;
                    dept.NewDeptID = this.dxetxtDeptID.Text.Trim();
                    dept.DeptName = this.dxetxtDeptName.Text.Trim();
                    dept.ShortName = this.dxetxtShortName.Text.Trim();
                    dept.Manager = this.dxetxtManager.Text.Trim();
                    dept.Tel = this.dxetxtTel.Text.Trim();
                    dept.Fax = this.dxetxtFax.Text.Trim();
                    dept.Save(ModifiedAction.Update);

                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language=\"javascript\">alert(\"修改完成。\");window.close();</script>", false);
                }
            }
            catch (Exception ex)
            { }
        }
    }
}
