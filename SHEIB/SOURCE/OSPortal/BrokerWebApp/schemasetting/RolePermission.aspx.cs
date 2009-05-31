using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxClasses;
using BusinessObjects;

namespace BrokerWebApp.schemasetting
{
    public partial class RolePermission : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadTreeData();
                //treeList.ExpandToLevel(2);
                this.treeList.ExpandAll();
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //
        }

        protected void treeList_CustomDataCallback(object sender, TreeListCustomDataCallbackEventArgs e)
        {
            string key = e.Argument.ToString();
            //TreeListNode node = treeList.FindNodeByKeyValue(key);
            //e.Result = GetEntryText(node);

        }

        protected void treeList_HtmlDataCellPrepared(object sender, TreeListHtmlDataCellEventArgs e)
        {
            if (Object.Equals(e.GetValue("IsNew"), true))
                e.Cell.Font.Bold = true;
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


        private void loadTreeData()
        {
            
            List<BO_P_Role> list = BO_P_Role.FetchList();
            this.treeList.DataSource = list;
            foreach (BO_P_Role item in list)
            {
                CreateNode(item.RoleID, item.RoleName, null);
            } 

        }


        TreeListNode CreateNode(object key, string text, TreeListNode parentNode)
        {
            TreeListNode node = treeList.AppendNode(key, parentNode);
            node["Name"] = text;
            node["Text"] = text;
            return node;
        }


    }
}
