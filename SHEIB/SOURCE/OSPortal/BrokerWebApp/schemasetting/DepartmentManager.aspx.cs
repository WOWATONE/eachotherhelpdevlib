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
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxClasses;
using BusinessObjects;

namespace BrokerWebApp.schemasetting
{
    public partial class DepartmentManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    this.SetDeptInfo("");
                }

                this.SetDeptTreeList("");
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 设置险种信息
        /// </summary>
        private void SetDeptTreeList(string oldID)
        {
            this.treeList.ClearNodes();
            TreeListNode deptNode;
            deptNode = this.CreateNodeCore("L0", "", "所有部门", null);
            deptNode.Expanded = true;

            DataSet dsDepartment = BusinessObjects.BO_P_Department.GetDepartment();
            DataTable dtLayer = dsDepartment.Tables[0];
            DataTable dtDepartment = dsDepartment.Tables[1];
            if (dtLayer != null && dtLayer.Rows.Count > 0)
            {
                foreach (DataRow rowLayer in dtLayer.Rows)
                {
                    DataRow[] rows = dtDepartment.Select("Layer=" + rowLayer["Layer"].ToString(), "ShortName");
                    foreach (DataRow row in rows)
                    {
                        if (Convert.ToInt32(row["Layer"]) == 1)
                            deptNode = this.CreateNodeCore(row["DeptID"].ToString(), "Folder", row["DeptName"].ToString(), this.treeList.FindNodeByKeyValue("L0"));
                        else
                            deptNode = this.CreateNodeCore(row["DeptID"].ToString(), "Folder", row["DeptName"].ToString(), this.treeList.FindNodeByKeyValue(row["ParentID"].ToString()));
                    }
                }
            }
        }

        /// <summary>
        /// 设置部门信息
        /// </summary>
        private void SetDeptInfo(string deptID)
        {
            if (string.IsNullOrEmpty(deptID))
                return;

            BusinessObjects.BO_P_Department dept = new BO_P_Department(deptID);
            if (!string.IsNullOrEmpty(dept.DeptID))
            {
                this.lblDeptID.InnerText = dept.DeptID;
                this.lblDeptName.InnerText = dept.DeptName;
                this.lblShortName.InnerText = dept.ShortName;
                this.lblManager.InnerText = dept.Manager;
                this.lblParentID.InnerText = dept.ParentID;
                this.lblParentName.InnerText = dept.ParentName;
                this.lblTel.InnerText = dept.Tel;
                this.lblFax.InnerText = dept.Fax;
            }
        }

        private TreeListNode CreateNodeCore(object key, string iconName, string text, TreeListNode parentNode)
        {
            TreeListNode node = this.treeList.AppendNode(key, parentNode);
            node["IconName"] = iconName;
            node["Name"] = text;
            node["Text"] = text;
            return node;
        }

        protected string GetIconUrl(TreeListDataCellTemplateContainer container)
        {
            return string.Format("~/Images/treeicon/Folder.png", container.GetValue("IconName"));
        }

        protected void cpSchemaDetail_Callback(object source, CallbackEventArgsBase e)
        {
            string key = e.Parameter;
            this.SetDeptInfo(key);
        }

        protected void dxeDeleteDepartmentCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            string key = e.Parameter;
            e.Result = "";

            if (BusinessObjects.BO_P_Department.IfHasChildDepartment(key))
            {
                e.Result = "部门删除错误！";
                return;
            }

            BusinessObjects.BO_P_Department.Delete(key);
            e.Result = "ok";
        }
    }
}
