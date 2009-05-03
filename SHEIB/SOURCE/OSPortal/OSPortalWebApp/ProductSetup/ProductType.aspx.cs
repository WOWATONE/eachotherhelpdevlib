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

namespace OSPortalWebApp.ProductSetup
{
    public partial class ProductType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string type = Request.QueryString["Type"];
            if (type.ToLower() == "addproduct" || type.ToLower() == "editproduct")
            {
                this.ProductTabPage.TabPages[0].Visible = true;
                this.ProductTabPage.TabPages[1].Visible = false;
                this.ProductTabPage.TabPages[2].Visible = false;
            }
            else
            {
                this.ProductTabPage.TabPages[0].Visible = false;
                this.ProductTabPage.TabPages[1].Visible = true;
                this.ProductTabPage.TabPages[2].Visible = true;
            }
        }
    }
}
