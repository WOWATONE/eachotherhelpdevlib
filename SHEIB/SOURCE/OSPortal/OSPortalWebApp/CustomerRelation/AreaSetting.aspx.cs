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
    public partial class AreaSetting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.CreateNodes();
        }

        private void CreateNodes()
        {
            TreeListNode countryNode;
            TreeListNode provinceNode;
            TreeListNode cityNode;

            countryNode = this.CreateNodeCore("0", "", "中国", null);
            countryNode.Expanded = true;
            provinceNode = this.CreateNodeCore("A01", "", "[A01]-北京市", countryNode);
            provinceNode.Expanded = true;
            cityNode=this.CreateNodeCore("A0100", "", "[A0100]-朝阳区", provinceNode);
            cityNode=this.CreateNodeCore("A02", "", "[A02]-上海市", countryNode);
            provinceNode = this.CreateNodeCore("A03", "", "[A03]-广东省", countryNode);
            cityNode = this.CreateNodeCore("A0301", "", "[A0301]-东莞", provinceNode);
            cityNode = this.CreateNodeCore("A0302", "", "[A0302]-深圳市", provinceNode);
            provinceNode = this.CreateNodeCore("A04", "", "[A04]-陕西省", countryNode);
            provinceNode = this.CreateNodeCore("A05", "", "[A05]-福建省", countryNode);
            provinceNode = this.CreateNodeCore("A06", "", "[A06]-天津市", countryNode);
            provinceNode = this.CreateNodeCore("A07", "", "[A07]-重庆市", countryNode);
            provinceNode = this.CreateNodeCore("A08", "", "[A08]-安徽省", countryNode);
            provinceNode = this.CreateNodeCore("A09", "", "[A09]-湖南省", countryNode);
            provinceNode = this.CreateNodeCore("A10", "", "[A10]-广西自治区", countryNode);
            provinceNode = this.CreateNodeCore("A11", "", "[A11]-贵州省", countryNode);
            provinceNode = this.CreateNodeCore("A12", "", "[A12]-海南省", countryNode);
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
