using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxClasses;
using BusinessObjects;

namespace BrokerWebApp.schemasetting
{
    public partial class RolePermission : System.Web.UI.Page
    {
        private String _oldID;
        private BO_P_Role _BO_P_Role;
                
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _oldID = Page.Request.QueryString["id"];
                //this.originalID.Value = _oldID;

                loadTreeData();
                //treeList.ExpandToLevel(2);
                this.treeList.ExpandAll();
                loadDetailData(_oldID);
            }
            else
            {
                this.originalID.Value = _oldID;
            }

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //
        }

        protected void treeList_CustomDataCallback(object sender, TreeListCustomDataCallbackEventArgs e)
        {
            string key = e.Argument.ToString();
            e.Result = key;
        }

        protected void treeList_HtmlDataCellPrepared(object sender, TreeListHtmlDataCellEventArgs e)
        {
            //
        }

        protected void cpSchemaDetail_Callback(object source, CallbackEventArgsBase e)
        {
            loadDetailData(e.Parameter);
        }

        protected void cpSchemaDetail_CustomJSProperties(object sender, CustomJSPropertiesEventArgs e)
        {
            //
        }


        protected void dxeSaveCallback_Callback(object source,
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            //chklSystemStting.Items[0].Selected;
        }


        private void loadTreeData()
        {
            
            List<BO_P_Role> list = BO_P_Role.FetchList();
            
            foreach (BO_P_Role item in list)
            {
                CreateNode(item.RoleID, item.RoleName, null);
            }

            TreeListNode seltn = this.treeList.FindNodeByKeyValue(_oldID);
            seltn.Focus();
            seltn.Selected = true;

        }


        TreeListNode CreateNode(object key, string text, TreeListNode parentNode)
        {
            TreeListNode node = treeList.AppendNode(key, parentNode);
            node["Name"] = text;
            node["Text"] = text;
            return node;
        }

        private void loadDetailData(String id)
        {
            _BO_P_Role = new BO_P_Role(id, "");
            this.dxelblRoleNo.Text = _BO_P_Role.RoleNo;
            this.dxelblRoleName.Text = _BO_P_Role.RoleName;
        }





    }
}
