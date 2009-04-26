using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxClasses;

namespace OSPortalWebApp.schemasetting
{
    public partial class DepartmentManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CreateNodes();

            //if (IsCallback)
            //    System.Threading.Thread.Sleep(500); // Intentionally pauses server-side processing, to demonstrate the Loading Panel functionality.

            //if (IsPostBack)
            //{
            //    //DataBind();
            //}
            //else
            //{
            //    //DataBind();                
            //}

        }

        void CreateNodes()
        {
            TreeListNode localFolders = CreateNodeCore(1, "Folder", "所有部门", null);
            localFolders.Expanded = true;
            CreateNodeCore(2, "Inbox", "工程部", localFolders);
            CreateNodeCore(3, "Outbox", "系统部", localFolders);
            CreateNodeCore(4, "SentItems", "客服部", localFolders);
            CreateNodeCore(5, "DeletedItems", "财务部", localFolders);
            CreateNodeCore(6, "Drafts", "后勤部", localFolders);
            //TreeListNode communityNode = CreateNodeCore(7, "Folder", "<b>community.devexpress.com</b>", null);
            TreeListNode communityNode = CreateNodeCore(7, "Folder", "开发部", localFolders);
            CreateNodeCore(8, "Folder", "测试部", communityNode);
            CreateNodeCore(9, "Folder", "研发部", communityNode);
            CreateNodeCore(10, "Folder", "调研部", communityNode);
        }

        TreeListNode CreateNodeCore(object key, string iconName, string text, TreeListNode parentNode)
        {
            TreeListNode node = treeList.AppendNode(key, parentNode);
            node["IconName"] = iconName;
            node["Name"] = text;
            node["Text"] = text;
            return node;
        }

        protected string GetIconUrl(TreeListDataCellTemplateContainer container)
        {
            return string.Format("~/Images/treeicon/Folder.png", container.GetValue("IconName"));
        }

        protected string GetNodeKey(TreeListDataCellTemplateContainer container)
        {
            return container.NodeKey;
        }


        protected void treeList_CustomDataCallback(object sender, TreeListCustomDataCallbackEventArgs e)
        {
            string key = e.Argument.ToString();
            TreeListNode node = treeList.FindNodeByKeyValue(key);
            e.Result = GetEntryText(node);

        }

        protected void treeList_HtmlDataCellPrepared(object sender, TreeListHtmlDataCellEventArgs e)
        {
            if (Object.Equals(e.GetValue("IsNew"), true))
                e.Cell.Font.Bold = true;
        }

        protected string GetEntryText(TreeListNode node)
        {
            if (node != null)
            {
                string text = node["Text"].ToString();
                return text.Trim().Replace("\r\n", "<br />");
            }
            return string.Empty;
        }

        protected void btnPermissionSave_Click(object sender, EventArgs e)
        {
        }

        protected void cpSchemaDetail_Callback(object source, CallbackEventArgsBase e)
        {
            string[] parameters = e.Parameter.Split(':');
            int currentPageIndex = int.Parse(parameters[0]);
            bool isNext = parameters[1] == "next";

            //if (isNext)
            //{
            //    currentPageIndex += 1;
            //    if (currentPageIndex >= MultiView.Views.Count)
            //        currentPageIndex = MultiView.Views.Count - 1;
            //}
            //else
            //{
            //    currentPageIndex -= 1;
            //    if (currentPageIndex < 0)
            //        currentPageIndex = 0;
            //}
            //MultiView.ActiveViewIndex = currentPageIndex;
        }

        protected void cpSchemaDetail_CustomJSProperties(object sender, CustomJSPropertiesEventArgs e)
        {
            e.Properties["cpPageIndex"] = 1;
            e.Properties["cpPageCount"] = 4;
        }


    }
}
