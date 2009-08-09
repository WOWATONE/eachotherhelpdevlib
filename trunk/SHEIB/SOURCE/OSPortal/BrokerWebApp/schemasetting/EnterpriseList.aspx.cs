using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxClasses;
using BusinessObjects;

namespace BrokerWebApp.schemasetting
{
    public partial class EnterpriseList : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.SetCustClassifyTreeList("");
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 设置客户分类
        /// </summary>
        private void SetCustClassifyTreeList(string value)
        {
            this.treeList.ClearNodes();
            TreeListNode custClassifyNode;
            custClassifyNode = this.CreateNodeCore("L0", "", "所有目录", null);
            custClassifyNode.Expanded = true;

            DataSet dsList = BusinessObjects.SchemaSetting.BO_CustClassify.GetCustClassifyList();
            if (dsList.Tables[0] != null && dsList.Tables[0].Rows.Count > 0)
            {
                this.SetCustClassify(dsList.Tables[0], "0");
            }
        }

        private void SetCustClassify(DataTable table, string parentid)
        {
            DataRow[] rows = table.Select("ParentID='" + parentid + "'", "OrderNO");
            foreach (DataRow row in rows)
            {
                if (parentid=="0")
                    this.CreateNodeCore(row["CustClassifyID"].ToString(), "", row["CustClassifyName"].ToString(), this.treeList.FindNodeByKeyValue("L0"));
                else
                    this.CreateNodeCore(row["CustClassifyID"].ToString(), "", row["CustClassifyName"].ToString(), this.treeList.FindNodeByKeyValue(row["ParentId"].ToString()));

                this.SetCustClassify(table, row["CustClassifyID"].ToString());
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

        protected void dxeDeleteCustClassifyCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            string key = e.Parameter;
            e.Result = "";

            if (BusinessObjects.SchemaSetting.BO_CustClassify.IfHasChildCustClassify(key))
            {
                e.Result = "企业目录删除错误！";
                return;
            }

            BusinessObjects.SchemaSetting.BO_CustClassify.Delete(key);
            e.Result = "ok";
        }
    }
}
