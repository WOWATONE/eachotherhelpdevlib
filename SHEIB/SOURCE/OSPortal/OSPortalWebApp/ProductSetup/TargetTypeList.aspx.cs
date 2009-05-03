using System;
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
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxClasses;

namespace OSPortalWebApp.ProductSetup
{
    public partial class TargetTypeList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.CreateNodes();
        }

        private void CreateNodes()
        {
            TreeListNode targetNode;

            targetNode = this.CreateNodeCore("0", "", "标的描述", null);
            targetNode.Expanded = true;
            targetNode = this.CreateNodeCore("01", "", "标的名称", this.treeList.FindNodeByKeyValue("0"));
            targetNode = this.CreateNodeCore("02", "", "标的号码", this.treeList.FindNodeByKeyValue("0"));
            targetNode = this.CreateNodeCore("03", "", "标的型号", this.treeList.FindNodeByKeyValue("0"));
            targetNode = this.CreateNodeCore("04", "", "保险货物项目", this.treeList.FindNodeByKeyValue("0"));
        }

        private TreeListNode CreateNodeCore(object key, string iconName, string text, TreeListNode parentNode)
        {
            TreeListNode node = this.treeList.AppendNode(key, parentNode);
            node["IconName"] = iconName;
            node["Name"] = text;
            node["Text"] = text;
            return node;
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
    }
}
