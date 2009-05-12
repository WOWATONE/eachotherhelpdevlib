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

namespace OSPortalWebApp.CustomerRelation
{
    public partial class EnterpriseList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.CreateNodes();
        }

        private void CreateNodes()
        {
            TreeListNode enterpriseNode;

            enterpriseNode = this.CreateNodeCore("0", "", "集团内", null);
            enterpriseNode.Expanded = true;
            enterpriseNode = this.CreateNodeCore("1", "", "集团外", null);

            enterpriseNode = this.CreateNodeCore("A", "", "股份公司", this.treeList.FindNodeByKeyValue("0"));
            enterpriseNode.Expanded = true;
            enterpriseNode = this.CreateNodeCore("B", "", "管理公司", this.treeList.FindNodeByKeyValue("0"));
            enterpriseNode = this.CreateNodeCore("C", "", "总公司", this.treeList.FindNodeByKeyValue("0"));
            enterpriseNode = this.CreateNodeCore("D", "", "集团外", this.treeList.FindNodeByKeyValue("1"));

            enterpriseNode = this.CreateNodeCore("DZ", "", "电站集团", this.treeList.FindNodeByKeyValue("A"));
            enterpriseNode = this.CreateNodeCore("ZX", "", "重型机器", this.treeList.FindNodeByKeyValue("A"));
            enterpriseNode = this.CreateNodeCore("JD", "", "机电股份", this.treeList.FindNodeByKeyValue("A"));
            enterpriseNode = this.CreateNodeCore("SP", "", "输配电", this.treeList.FindNodeByKeyValue("A"));
            enterpriseNode = this.CreateNodeCore("JC", "", "机床集团", this.treeList.FindNodeByKeyValue("A"));
            enterpriseNode = this.CreateNodeCore("GF", "", "轨发", this.treeList.FindNodeByKeyValue("A"));
            enterpriseNode = this.CreateNodeCore("HB", "", "环保", this.treeList.FindNodeByKeyValue("A"));
            enterpriseNode = this.CreateNodeCore("JR", "", "电气金融", this.treeList.FindNodeByKeyValue("A"));
            enterpriseNode = this.CreateNodeCore("SC", "", "上柴", this.treeList.FindNodeByKeyValue("A"));
            enterpriseNode = this.CreateNodeCore("LG", "", "临港", this.treeList.FindNodeByKeyValue("A"));
            enterpriseNode = this.CreateNodeCore("GM", "", "国贸", this.treeList.FindNodeByKeyValue("A"));
            enterpriseNode = this.CreateNodeCore("ZY", "", "中央研究院", this.treeList.FindNodeByKeyValue("A"));
            enterpriseNode = this.CreateNodeCore("YY", "", "液压气动", this.treeList.FindNodeByKeyValue("A"));
            enterpriseNode = this.CreateNodeCore("B0", "", "上海电气资产管理有限公司本部", this.treeList.FindNodeByKeyValue("B"));
            enterpriseNode = this.CreateNodeCore("BA", "", "一部", this.treeList.FindNodeByKeyValue("B"));
            enterpriseNode = this.CreateNodeCore("BB", "", "二部", this.treeList.FindNodeByKeyValue("B"));
            enterpriseNode = this.CreateNodeCore("BC", "", "三部", this.treeList.FindNodeByKeyValue("B"));
            enterpriseNode = this.CreateNodeCore("BD", "", "四部", this.treeList.FindNodeByKeyValue("B"));
            enterpriseNode = this.CreateNodeCore("BE", "", "五部", this.treeList.FindNodeByKeyValue("B"));
            enterpriseNode = this.CreateNodeCore("BF", "", "集优", this.treeList.FindNodeByKeyValue("B"));
            enterpriseNode = this.CreateNodeCore("BG", "", "投资", this.treeList.FindNodeByKeyValue("B"));
            enterpriseNode = this.CreateNodeCore("BH", "", "功能", this.treeList.FindNodeByKeyValue("B"));
        }

        private TreeListNode CreateNodeCore(object key, string iconName, string text, TreeListNode parentNode)
        {
            TreeListNode node = this.treeList.AppendNode(key, parentNode);
            node["IconName"] = iconName;
            node["Name"] = text;
            node["Text"] = text;
            return node;
        }
    }
}
