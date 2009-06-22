using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data;
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxClasses;
using BusinessObjects;

namespace BrokerWebApp.schemasetting
{
    public partial class ProductTypeList : System.Web.UI.Page
    {
        #region 私有变量
        /// <summary>
        /// 险种编号
        /// </summary>
        private string _prodTypeID;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    this.SetProductInfo("");
                }

                this.SetProductTypeInfo("");
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 设置险种信息
        /// </summary>
        private void SetProductTypeInfo(string oldID)
        {
            this.treeList.ClearNodes();
            TreeListNode prodTypeNode;
            prodTypeNode = this.CreateNodeCore("L0", "", "所有险种", null);
            prodTypeNode.Expanded = true;

            DataSet dsProductType = BusinessObjects.SchemaSetting.BO_ProductType.GetProductType();
            DataTable dtLayer=dsProductType.Tables[0];
            DataTable dtProductType=dsProductType.Tables[1];
            if (dtLayer != null && dtLayer.Rows.Count > 0)
            {
                foreach (DataRow rowLayer in dtLayer.Rows)
                {
                    DataRow[] rows = dtProductType.Select("Layer=" + rowLayer["Layer"].ToString(), "ProdClass ,ParentId");
                    foreach (DataRow row in rows)
                    {
                        if (Convert.ToInt32(row["Layer"]) == 1)
                            prodTypeNode = this.CreateNodeCore(row["ProdTypeID"].ToString(), "", row["ProdTypeName"].ToString(), this.treeList.FindNodeByKeyValue("L0"));
                        else
                            prodTypeNode = this.CreateNodeCore(row["ProdTypeID"].ToString(), "", row["ProdTypeName"].ToString(), this.treeList.FindNodeByKeyValue(row["ParentId"].ToString()));
                    }
                }
            }
        }

        private TreeListNode CreateNodeCore(object key, string iconName, string text, TreeListNode parentNode)
        {
            TreeListNode node = this.treeList.AppendNode(key, parentNode);
            node["IconName"] = iconName;
            node["Name"] = text;
            node["Text"] = text;
            return node;
        }

        /// <summary>
        /// 设置项目信息
        /// </summary>
        private void SetProductInfo(string prodTypeID)
        {
            if (string.IsNullOrEmpty(prodTypeID))
                return;

            BusinessObjects.SchemaSetting.BO_ProductType productType = new BusinessObjects.SchemaSetting.BO_ProductType(prodTypeID);
            if (!string.IsNullOrEmpty(productType.ProdTypeID))
            {
                this.lblParent.InnerText = productType.ParentName;
                this.lblProdTypeID.InnerText = productType.ProdTypeID;
                this.lblProdTypeName.InnerText = productType.ProdTypeName;
                this.lblProdClassName.InnerText = productType.ProdClassName;
            }
            this.hidProdTypeID.Value = prodTypeID;

            this.gridSearchResult.DataSource = BusinessObjects.SchemaSetting.BO_Product.GetProductByProdTypeID(prodTypeID);
            this.gridSearchResult.DataBind();
        }

        protected void treeList_CustomDataCallback(object sender, TreeListCustomDataCallbackEventArgs e)
        {
            //
        }

        protected void treeList_HtmlDataCellPrepared(object sender, TreeListHtmlDataCellEventArgs e)
        {
            //
        }

        protected void cpSchemaDetail_Callback(object source, CallbackEventArgsBase e)
        {
            string key = e.Parameter;
            this.SetProductInfo(key);
        }

        protected void cpSchemaDetail_CustomJSProperties(object sender, CustomJSPropertiesEventArgs e)
        {
            //
        }

        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String prodID = e.Keys["ProdID"].ToString();
            BusinessObjects.SchemaSetting.BO_Product.Delete(prodID);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
            this.gridSearchResult.DataSource = BusinessObjects.SchemaSetting.BO_Product.GetProductByProdTypeID(this.hidProdTypeID.Value);
            this.gridSearchResult.DataBind();
        }

        protected void gridSearchResult_CustomCallBack(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            //                       
        }
    }
}
