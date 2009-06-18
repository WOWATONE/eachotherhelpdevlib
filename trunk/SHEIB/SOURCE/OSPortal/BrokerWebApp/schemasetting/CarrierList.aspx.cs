using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using BusinessObjects;

namespace BrokerWebApp.schemasetting
{
    public partial class CarrierList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.Initialization();
            }
        }

        /// <summary>
        /// 初始化控件
        /// </summary>
        private void Initialization()
        {
            //
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String carrierID = e.Keys["CarrierID"].ToString();
            BusinessObjects.SchemaSetting.BO_Carrier.Delete(carrierID);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
            this.BindGrid();
        }

        protected void gridSearchResult_CustomCallBack(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            //                       
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.BindGrid();
        }

        /// <summary>
        /// 填充数据
        /// </summary>
        private void BindGrid()
        {
            System.Text.StringBuilder sbWhere = new System.Text.StringBuilder();
            if (this.dxetxtCarrierID.Text.Trim().Length > 0)
                sbWhere.Append(" And CarrierID=" + this.dxetxtCarrierID.Text.Trim());
            if (this.dxetxtCarrierNameCn.Text.Trim().Length > 0)
                sbWhere.Append(" And CarrierNameCn like '%" + this.dxetxtCarrierNameCn.Text.Trim() + "%'");
            this.gridSearchResult.DataSource = BusinessObjects.SchemaSetting.BO_Carrier.GetCarrierList(sbWhere.ToString());
            this.gridSearchResult.DataBind();
        }
    }
}
