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
using BusinessObjects;

namespace BrokerWebApp.CustomerRelation
{
    public partial class CustomerList : System.Web.UI.Page
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
            DataSet list;
            //所在地区
            this.dxeddlArea.Items.Add("(全部)", "");
            list = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.Area.ToString());
            if (list.Tables[0] != null)
            {
                foreach (DataRow row in list.Tables[0].Rows)
                {
                    this.dxeddlArea.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }

            //行业类型
            this.dxeddlTradeType.Items.Add("(全部)", "");
            list = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.TradeName.ToString());
            if (list.Tables[0] != null)
            {
                foreach (DataRow row in list.Tables[0].Rows)
                {
                    this.dxeddlTradeType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }

            //所属板块
            this.dxeddlPlate.Items.Add("(全部)", "");

            //客户经理
            this.dxeddlSalesID.Items.Add("(全部)", "");
            list = BO_P_User.GetUserByUserID("");
            if (list.Tables[0] != null)
            {
                foreach (DataRow row in list.Tables[0].Rows)
                {
                    this.dxeddlSalesID.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
                }
            }
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //  
        }

        protected void gridSearchResult_CustomCallBack(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            //                       
        }
    }
}
