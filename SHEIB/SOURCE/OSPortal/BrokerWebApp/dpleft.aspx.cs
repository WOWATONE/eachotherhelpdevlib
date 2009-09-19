using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace BrokerWebApp
{
    public partial class dpleft : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //
            generateMenus();

        }


        protected virtual void mSelector_ItemDataBound(object source, DevExpress.Web.ASPxMenu.MenuItemEventArgs e)
        {
            if (GetStatus(e.Item.DataItem, "IsUpdated"))
                e.Item.Text += " <span style=\"color: #2D9404;\">(updated)</span>";
            if (GetStatus(e.Item.DataItem, "IsNew"))
                e.Item.Text += " <span style=\"color: #BD0808;\">(new)</span>";
        }

        private void generateMenus()
        {
            //客户关系
            //this.ASPxNavBar1.Groups[0].ClientVisible = false;
            //客户列表
            //this.ASPxNavBar1.Groups[0].Items[0].ClientVisible = false;            
            //联系人
            //this.ASPxNavBar1.Groups[0].Items[1].ClientVisible = false;
            //业务跟进
            //this.ASPxNavBar1.Groups[0].Items[2].ClientVisible = false;

            //非车险保单管理
            //this.ASPxNavBar1.Groups[1].ClientVisible = false;
            //保单录入
            //this.ASPxNavBar1.Groups[1].Items[0].ClientVisible = false;
            //保单批改
            //this.ASPxNavBar1.Groups[1].Items[1].ClientVisible = false;
            //保单审核
            //this.ASPxNavBar1.Groups[1].Items[2].ClientVisible = false;


            //车险保单管理
            //this.ASPxNavBar1.Groups[2].ClientVisible = false;
            //询价单录入
            //this.ASPxNavBar1.Groups[2].Items[0].ClientVisible = false;
            //询价单审核
            //this.ASPxNavBar1.Groups[2].Items[1].ClientVisible = false;
            //保单批改
            //this.ASPxNavBar1.Groups[2].Items[2].ClientVisible = false;
            //批单审核
            //this.ASPxNavBar1.Groups[2].Items[3].ClientVisible = false;
            //保单信息补录
            //this.ASPxNavBar1.Groups[2].Items[4].ClientVisible = false;


            //客户理赔
            //this.ASPxNavBar1.Groups[3].ClientVisible = false;
            //理赔登记


            //业务咨询
            //this.ASPxNavBar1.Groups[4].ClientVisible = false;
            //业务咨询
            //this.ASPxNavBar1.Groups[4].Items[0].ClientVisible = false;


            //收付结算
            //this.ASPxNavBar1.Groups[5].ClientVisible = false;
            //保费通知书
            //this.ASPxNavBar1.Groups[5].Items[0].ClientVisible = false;
            //客户收费
            //this.ASPxNavBar1.Groups[5].Items[1].ClientVisible = false;
            //解付保费
            //this.ASPxNavBar1.Groups[5].Items[2].ClientVisible = false;
            //经纪费开票
            //this.ASPxNavBar1.Groups[5].Items[3].ClientVisible = false;
            //经纪费结算
            //this.ASPxNavBar1.Groups[5].Items[4].ClientVisible = false;
            //已通知未收费清单
            //this.ASPxNavBar1.Groups[5].Items[5].ClientVisible = false;
            //已收费未解付清单
            //this.ASPxNavBar1.Groups[5].Items[6].ClientVisible = false;
            //已解付未开票清单
            //this.ASPxNavBar1.Groups[5].Items[7].ClientVisible = false;
            //已开票未结算清单
            //this.ASPxNavBar1.Groups[5].Items[8].ClientVisible = false;


            //综合查询
            //this.ASPxNavBar1.Groups[6].ClientVisible = false;
            //保单查询
            //this.ASPxNavBar1.Groups[6].Items[0].ClientVisible = false;
            //保单查询(保险公司)
            //this.ASPxNavBar1.Groups[6].Items[1].ClientVisible = false;


            //系统设置
            //this.ASPxNavBar1.Groups[7].ClientVisible = false;            
            //员工管理
            //this.ASPxNavBar1.Groups[7].Items[0].ClientVisible = false;
            //角色管理
            //this.ASPxNavBar1.Groups[7].Items[1].ClientVisible = false;
            //组织机构
            //this.ASPxNavBar1.Groups[7].Items[2].ClientVisible = false;
            //保险公司
            //this.ASPxNavBar1.Groups[7].Items[3].ClientVisible = false;
            //分支机构
            //this.ASPxNavBar1.Groups[7].Items[4].ClientVisible = false;
            //险种定义
            //this.ASPxNavBar1.Groups[7].Items[5].ClientVisible = false;
            //数据字典
            //this.ASPxNavBar1.Groups[7].Items[6].ClientVisible = false;
            //企业目录
            //this.ASPxNavBar1.Groups[7].Items[7].ClientVisible = false;
            //系统选项
            //this.ASPxNavBar1.Groups[7].Items[8].ClientVisible = false;
            //服务提醒
            //this.ASPxNavBar1.Groups[7].Items[9].ClientVisible = false;


            //统计报表
            //this.ASPxNavBar1.Groups[8].ClientVisible = false; 
            //保监会报表1
            //this.ASPxNavBar1.Groups[8].Items[0].ClientVisible = false;
            //保监会报表2
            //this.ASPxNavBar1.Groups[8].Items[1].ClientVisible = false;
            //同业公会报表
            //this.ASPxNavBar1.Groups[8].Items[2].ClientVisible = false;


            //预算管理
            //this.ASPxNavBar1.Groups[9].ClientVisible = false; 
            //签约预算清单
            //this.ASPxNavBar1.Groups[9].Items[0].ClientVisible = false;
            //签约预算完成情况
            //this.ASPxNavBar1.Groups[9].Items[1].ClientVisible = false;
            //签约预算完成汇总
            //this.ASPxNavBar1.Groups[9].Items[2].ClientVisible = false;
            //预算基础表
            //this.ASPxNavBar1.Groups[9].Items[3].ClientVisible = false;


            //台帐
            //this.ASPxNavBar1.Groups[10].ClientVisible = false; 
            //保险经纪业务台帐
            //this.ASPxNavBar1.Groups[10].Items[0].ClientVisible = false;
            //应收保费帐期报表
            //this.ASPxNavBar1.Groups[10].Items[1].ClientVisible = false;
            //应收佣金帐期报表
            //this.ASPxNavBar1.Groups[10].Items[2].ClientVisible = false;
            //实收保费逾期报表
            //this.ASPxNavBar1.Groups[10].Items[3].ClientVisible = false;
            

        }



        protected virtual string GetHeaderTitle(string title, string text)
        {
            string name = title + " - ";
            if (text.IndexOf("<") > 0)
                name += text.Substring(0, text.IndexOf("<"));
            else
                name += text;
            return name;
        }

        protected virtual string GetCurrentAppearanceName()
        {
            return "Appearances/" + GetCurrentAppearanceNameCore() + ".ascx";
        }

        protected virtual string GetCurrentAppearanceNameCore()
        {
            string name = Page.Request.QueryString["Name"];
            if (String.IsNullOrEmpty(name))
                name = "";
            return name;
        }

        protected virtual bool GetStatus(object dataItem, string name)
        {
            IHierarchyData hierarchyData = (dataItem as IHierarchyData);
            XmlElement xmlElement = hierarchyData.Item as XmlElement;
            return GetStatusCore(xmlElement, name);
        }

        private bool GetStatusCore(XmlElement element, string name)
        {
            bool ret = false;

            string value = GetAttributeValue(element.Attributes, name);
            bool.TryParse(value, out ret);
            return ret;
        }

        private bool GetStatusCore(XmlNode node, string name)
        {
            bool ret = false;
            string value = GetAttributeValue(node.Attributes, name);
            bool.TryParse(value, out ret);
            return ret;
        }

        private string GetAttributeValue(XmlAttributeCollection attributes, string name)
        {
            if (attributes[name] != null)
                return attributes[name].Value;
            else
                return "";
        }

    }
}
