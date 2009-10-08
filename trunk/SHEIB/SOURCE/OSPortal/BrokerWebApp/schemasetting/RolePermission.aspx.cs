using System;
using System.IO;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxClasses;
using BusinessObjects;
using System.Data;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;

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
                
                loadTreeData();
                //treeList.ExpandToLevel(2);
                this.treeList.ExpandAll();
                loadDetailData(_oldID);
                loadMenuOrPrivilege(_oldID);
                this.selectedRoleID.Value = _oldID;
            }
            else
            {
                //
            }

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //List<RolePrivilege> list = new List<RolePrivilege>();

            //RolePrivilege obj = new RolePrivilege();
            //obj.MenuID = "mid";
            //obj.RoleID = "0000000";
            //obj.PrivID = "pid";
            //list.Add(obj);

            //obj = new RolePrivilege();
            //obj.MenuID = "mid1";
            //obj.RoleID = "0000001";
            //obj.PrivID = "pid1";
            //list.Add(obj);

            //RolePrivilegeList x = new RolePrivilegeList();
            //x.RolePrivileges = list;

            //DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(RolePrivilegeList));
            //MemoryStream ms = new MemoryStream();
            //serializer.WriteObject(ms, x);
            //string retVal = Encoding.Default.GetString(ms.ToArray());
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
            String json = e.Parameter;
            
            MemoryStream ms = new MemoryStream(Encoding.Unicode.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(Privilege));
            Privilege obj;

            obj = (Privilege)serializer.ReadObject(ms);
            ms.Close();
            loadDetailData(obj.RoleID);
            loadMenuOrPrivilege(obj.RoleID);
        }

        protected void cpSchemaDetail_CustomJSProperties(object sender, CustomJSPropertiesEventArgs e)
        {
            //
        }

        protected void dxeSaveCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            saveCheckedPrivilege(e.Parameter);
            e.Result = "complete";
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
            this.selectedRoleID.Value = _BO_P_Role.RoleID;
            
        }

        private void loadMenuOrPrivilege(String roleID)
        {
            this.tabPrivilege.TabPages.Clear();
            DataSet ds = BO_P_Menu.FetchMenuOrPrivilege(roleID);
            DevExpress.Web.ASPxTabControl.TabPage tp;

            

            DataRow[] dr;            
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                tp = new DevExpress.Web.ASPxTabControl.TabPage();
                
                tp.TabStyle.HorizontalAlign = HorizontalAlign.Left;
                tp.TabStyle.VerticalAlign = VerticalAlign.Top;
                                                
                tp.Name = item["MenuID"].ToString();
                tp.Text = item["MenuName"].ToString();
                this.tabPrivilege.TabPages.Add(tp);
                
                
                //add checkbox list;
                dr = ds.Tables[1].Select("ParentMenuID='" + tp.Name + "'");
                CheckBox chk;
                
                for (int i = 0; i < dr.Length; i++)
                {
                    chk = new CheckBox();
                    chk.TextAlign = TextAlign.Right;
                    chk.ID = dr[i]["PrivID"].ToString();
                    chk.Text = dr[i]["PrivName"].ToString();
                    Boolean checkedState = Convert.ToBoolean(dr[i]["Checked"]);
                    chk.Checked = checkedState;
                    tp.Controls.Add(chk);
                    
                    Literal ltl = new Literal();
                    ltl.Text = "<br/>";
                    tp.Controls.Add(ltl); 
                    
                }             
            }
        }


        private void saveCheckedPrivilege(String parameter)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(RolePrivilegeList));
            RolePrivilegeList obj;

            obj = (RolePrivilegeList)serializer.ReadObject(ms);
            ms.Close();

            foreach (RolePrivilege item in obj.RolePrivileges)
            {
                if (item.Checked)
                {
                    BO_P_RolePriv.Add(item.RoleID, item.PrivID);
                }
                else
                {
                    BO_P_RolePriv.Delete(item.RoleID, item.PrivID);
                }

            }
            
        }


    }



    [DataContract(Namespace = "http://www.sheib.com")]
    public class RolePrivilegeList
    {
        public RolePrivilegeList()
        { }

        [DataMember]
        public List<RolePrivilege> RolePrivileges { get; set; }

    }


    [DataContract(Namespace = "http://www.sheib.com")]
    public class RolePrivilege
    {
        public RolePrivilege()
        { }

        [DataMember]
        public string RoleID { get; set; }

        [DataMember]
        public string PrivID { get; set; }

        [DataMember]
        public Boolean Checked { get; set; }


    }



    [DataContract(Namespace="http://www.sheib.com")]
    public class Privilege
    {
        public Privilege()
        { }

        [DataMember]
        public string Action { get; set; }

        [DataMember]
        public string RoleID { get; set; }


    }




}
