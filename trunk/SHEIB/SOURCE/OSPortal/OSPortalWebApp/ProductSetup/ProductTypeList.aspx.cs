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
    public partial class ProductTypeList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.CreateNodes();
        }

        private void CreateNodes()
        {
            TreeListNode prodTypeNode;

            prodTypeNode = this.CreateNodeCore("0", "", "所有险种", null);
            prodTypeNode.Expanded = true;
            prodTypeNode = this.CreateNodeCore("C00", "", "产险", this.treeList.FindNodeByKeyValue("0"));
            prodTypeNode = this.CreateNodeCore("C00002", "", "家庭财产保险", this.treeList.FindNodeByKeyValue("C00"));
            prodTypeNode = this.CreateNodeCore("C00002001", "", "人保普通型家庭财产综合保险", this.treeList.FindNodeByKeyValue("C00002"));
            prodTypeNode = this.CreateNodeCore("C00002002", "", "平安新世纪安居型家庭保险", this.treeList.FindNodeByKeyValue("C00002"));
            prodTypeNode = this.CreateNodeCore("C00003", "", "机动车辆险", this.treeList.FindNodeByKeyValue("C00"));
            prodTypeNode = this.CreateNodeCore("C00003000", "", "大地机动车辆险", this.treeList.FindNodeByKeyValue("C00003"));
            prodTypeNode = this.CreateNodeCore("C00003001", "", "人保机动车辆险", this.treeList.FindNodeByKeyValue("C00003"));
            prodTypeNode = this.CreateNodeCore("L00", "", "寿险", this.treeList.FindNodeByKeyValue("0"));
            prodTypeNode = this.CreateNodeCore("L00001", "", "人寿保险", this.treeList.FindNodeByKeyValue("L00"));
            prodTypeNode = this.CreateNodeCore("L00001001", "", "平安鸿利两全保险（分红型）", this.treeList.FindNodeByKeyValue("L00001"));
            prodTypeNode = this.CreateNodeCore("L00001002", "", "太保红利来两全保险A款", this.treeList.FindNodeByKeyValue("L00001"));
        }

        private TreeListNode CreateNodeCore(object key, string iconName, string text, TreeListNode parentNode)
        {
            TreeListNode node = this.treeList.AppendNode(key, parentNode);
            node["IconName"] = iconName;
            node["Name"] = text;
            node["Text"] = text;
            return node;
        }

        protected void cpSchemaDetail_Callback(object source, CallbackEventArgsBase e)
        {
            //string[] parameters = e.Parameter.Split(':');
            //int currentPageIndex = int.Parse(parameters[0]);
            //bool isNext = parameters[1] == "next";

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
            //e.Properties["cpPageIndex"] = 1;
            //e.Properties["cpPageCount"] = 4;
        }

    }
}
