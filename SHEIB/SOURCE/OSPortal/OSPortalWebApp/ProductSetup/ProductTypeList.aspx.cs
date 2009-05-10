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

            prodTypeNode = this.CreateNodeCore("L0", "", "所有险种", null);
            prodTypeNode.Expanded = true;
            prodTypeNode = this.CreateNodeCore("L01", "", "财产保险类", this.treeList.FindNodeByKeyValue("L0"));
            prodTypeNode = this.CreateNodeCore("L02", "", "人身保险类", this.treeList.FindNodeByKeyValue("L0"));
            prodTypeNode = this.CreateNodeCore("L03", "", "再保险", this.treeList.FindNodeByKeyValue("L0"));

            prodTypeNode = this.CreateNodeCore("L0101", "", "企业财产保险", this.treeList.FindNodeByKeyValue("L01"));
            prodTypeNode = this.CreateNodeCore("L0102", "", "机动车辆险", this.treeList.FindNodeByKeyValue("L01"));
            prodTypeNode = this.CreateNodeCore("L0103", "", "家庭财产保险", this.treeList.FindNodeByKeyValue("L01"));
            prodTypeNode = this.CreateNodeCore("L0104", "", "货运保险", this.treeList.FindNodeByKeyValue("L01"));
            prodTypeNode = this.CreateNodeCore("L0105", "", "船舶保险", this.treeList.FindNodeByKeyValue("L01"));
            prodTypeNode = this.CreateNodeCore("L0106", "", "能源、核电站保险", this.treeList.FindNodeByKeyValue("L01"));
            prodTypeNode = this.CreateNodeCore("L0107", "", "飞机、飞机责任和航天保险", this.treeList.FindNodeByKeyValue("L01"));
            prodTypeNode = this.CreateNodeCore("L0108", "", "建筑、安装工程险", this.treeList.FindNodeByKeyValue("L01"));
            prodTypeNode = this.CreateNodeCore("L0109", "", "责任保险", this.treeList.FindNodeByKeyValue("L01"));
            prodTypeNode = this.CreateNodeCore("L0110", "", "信用、保证保险", this.treeList.FindNodeByKeyValue("L01"));
            prodTypeNode = this.CreateNodeCore("L0111", "", "农业保险", this.treeList.FindNodeByKeyValue("L01"));
            prodTypeNode = this.CreateNodeCore("L0112", "", "短期健康保险、意外险", this.treeList.FindNodeByKeyValue("L01"));
            prodTypeNode = this.CreateNodeCore("L0113", "", "其他财产保险", this.treeList.FindNodeByKeyValue("L01"));
            prodTypeNode = this.CreateNodeCore("L0114", "", "交强险", this.treeList.FindNodeByKeyValue("L01"));
            prodTypeNode = this.CreateNodeCore("L0201", "", "人寿保险", this.treeList.FindNodeByKeyValue("L02"));
            prodTypeNode = this.CreateNodeCore("L0202", "", "意外伤害保险", this.treeList.FindNodeByKeyValue("L02"));
            prodTypeNode = this.CreateNodeCore("L0203", "", "定期寿险", this.treeList.FindNodeByKeyValue("L02"));
            prodTypeNode = this.CreateNodeCore("L0204", "", "健康保险", this.treeList.FindNodeByKeyValue("L02"));
            prodTypeNode = this.CreateNodeCore("L0205", "", "补充养老保险", this.treeList.FindNodeByKeyValue("L02"));
            prodTypeNode = this.CreateNodeCore("L0206", "", "补充医疗保险", this.treeList.FindNodeByKeyValue("L02"));
            prodTypeNode = this.CreateNodeCore("L0207", "", "其他人身保险", this.treeList.FindNodeByKeyValue("L02"));
            prodTypeNode = this.CreateNodeCore("L0301", "", "再保险业务类", this.treeList.FindNodeByKeyValue("L03"));

            prodTypeNode = this.CreateNodeCore("L010101", "", "企业财产保险", this.treeList.FindNodeByKeyValue("L0101"));
            prodTypeNode = this.CreateNodeCore("L010102", "", "机器损坏险", this.treeList.FindNodeByKeyValue("L0101"));
            prodTypeNode = this.CreateNodeCore("L010103", "", "利润损失险", this.treeList.FindNodeByKeyValue("L0101"));
            prodTypeNode = this.CreateNodeCore("L010104", "", "设备租赁一切险", this.treeList.FindNodeByKeyValue("L0101"));
            prodTypeNode = this.CreateNodeCore("L010105", "", "财产综合险", this.treeList.FindNodeByKeyValue("L0101"));
            prodTypeNode = this.CreateNodeCore("L010106", "", "财产基本险", this.treeList.FindNodeByKeyValue("L0101"));
            prodTypeNode = this.CreateNodeCore("L010201", "", "机动车辆保险（商业险）", this.treeList.FindNodeByKeyValue("L0102"));
            prodTypeNode = this.CreateNodeCore("L010202", "", "机动车辆保险（交强险）", this.treeList.FindNodeByKeyValue("L0102"));
            prodTypeNode = this.CreateNodeCore("L010203", "", "车船税", this.treeList.FindNodeByKeyValue("L0102"));
            prodTypeNode = this.CreateNodeCore("L010301", "", "家庭财产综合保险", this.treeList.FindNodeByKeyValue("L0103"));
            prodTypeNode = this.CreateNodeCore("L010401", "", "国内水路、陆路货物运输保险", this.treeList.FindNodeByKeyValue("L0104"));
            prodTypeNode = this.CreateNodeCore("L010402", "", "航空货物运输保险", this.treeList.FindNodeByKeyValue("L0104"));
            prodTypeNode = this.CreateNodeCore("L010403", "", "海洋货物运输保险", this.treeList.FindNodeByKeyValue("L0104"));
            prodTypeNode = this.CreateNodeCore("L010501", "", "船舶财产保险", this.treeList.FindNodeByKeyValue("L0105"));
            prodTypeNode = this.CreateNodeCore("L010502", "", "船舶建造保险", this.treeList.FindNodeByKeyValue("L0105"));
            prodTypeNode = this.CreateNodeCore("L010901", "", "产品责任保险", this.treeList.FindNodeByKeyValue("L0109"));
            prodTypeNode = this.CreateNodeCore("L010902", "", "雇主责任保险", this.treeList.FindNodeByKeyValue("L0109"));
            prodTypeNode = this.CreateNodeCore("L010903", "", "经纪人责任保险", this.treeList.FindNodeByKeyValue("L0109"));
            prodTypeNode = this.CreateNodeCore("L010904", "", "设计师责任保险", this.treeList.FindNodeByKeyValue("L0109"));
            prodTypeNode = this.CreateNodeCore("L010905", "", "董事责任保险", this.treeList.FindNodeByKeyValue("L0109"));
            prodTypeNode = this.CreateNodeCore("L010906", "", "公众责任保险", this.treeList.FindNodeByKeyValue("L0109"));
            prodTypeNode = this.CreateNodeCore("L020101", "", "非分红产品", this.treeList.FindNodeByKeyValue("L0201"));
            prodTypeNode = this.CreateNodeCore("L020102", "", "分红产品", this.treeList.FindNodeByKeyValue("L0201"));
            prodTypeNode = this.CreateNodeCore("L020103", "", "投资连接产品", this.treeList.FindNodeByKeyValue("L0201"));
            prodTypeNode = this.CreateNodeCore("L020104", "", "万能产品", this.treeList.FindNodeByKeyValue("L0201"));
            prodTypeNode = this.CreateNodeCore("L020201", "", "意外伤害、死亡", this.treeList.FindNodeByKeyValue("L0202"));
            prodTypeNode = this.CreateNodeCore("L020202", "", "意外医疗", this.treeList.FindNodeByKeyValue("L0202"));
            prodTypeNode = this.CreateNodeCore("L020401", "", "重大疾病保险", this.treeList.FindNodeByKeyValue("L0204"));
            prodTypeNode = this.CreateNodeCore("L020402", "", "疾病死亡", this.treeList.FindNodeByKeyValue("L0204"));
            prodTypeNode = this.CreateNodeCore("L020601", "", "门急诊", this.treeList.FindNodeByKeyValue("L0206"));
            prodTypeNode = this.CreateNodeCore("L020602", "", "住院", this.treeList.FindNodeByKeyValue("L0206"));
            prodTypeNode = this.CreateNodeCore("L020603", "", "住院津贴", this.treeList.FindNodeByKeyValue("L0206"));

            prodTypeNode = this.CreateNodeCore("L01020101", "", "车损险", this.treeList.FindNodeByKeyValue("L010201"));
            prodTypeNode = this.CreateNodeCore("L01020102", "", "第三者责任险", this.treeList.FindNodeByKeyValue("L010201"));
            prodTypeNode = this.CreateNodeCore("L01020103", "", "盗抢险", this.treeList.FindNodeByKeyValue("L010201"));
            prodTypeNode = this.CreateNodeCore("L01020104", "", "司乘人员意外险", this.treeList.FindNodeByKeyValue("L010201"));
            prodTypeNode = this.CreateNodeCore("L01020105", "", "玻璃单独破碎险", this.treeList.FindNodeByKeyValue("L010201"));
            prodTypeNode = this.CreateNodeCore("L01020106", "", "自燃险", this.treeList.FindNodeByKeyValue("L010201"));
            prodTypeNode = this.CreateNodeCore("L01020107", "", "不计免赔险", this.treeList.FindNodeByKeyValue("L010201"));
            prodTypeNode = this.CreateNodeCore("L01020108", "", "划痕险", this.treeList.FindNodeByKeyValue("L010201"));
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
