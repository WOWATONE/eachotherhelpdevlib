using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace OSPortalWebApp
{
    public partial class dpleft : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //
        }

        protected virtual void mSelector_ItemDataBound(object source, DevExpress.Web.ASPxMenu.MenuItemEventArgs e)
        {
            if (GetStatus(e.Item.DataItem, "IsUpdated"))
                e.Item.Text += " <span style=\"color: #2D9404;\">(updated)</span>";
            if (GetStatus(e.Item.DataItem, "IsNew"))
                e.Item.Text += " <span style=\"color: #BD0808;\">(new)</span>";
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
