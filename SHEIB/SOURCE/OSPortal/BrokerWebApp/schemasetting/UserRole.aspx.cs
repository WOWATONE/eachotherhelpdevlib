using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;
using BusinessObjects;
using System.Data;

namespace BrokerWebApp.schemasetting
{
    public partial class UserRole : System.Web.UI.Page
    {
        private String _ID;        
        private BO_P_User _BO_P_User;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack)
            {
                _ID = this.originalUserID.Value;
            }
            else
            {
                this.originalUserID.Value = Page.Request.QueryString["userid"];
                _ID = this.originalUserID.Value;

                //load data
                loadData();
            }

            if (_ID == null || _ID == "")
            {
                //
            }
            else
            {
                _BO_P_User = new BO_P_User(_ID);
                this.dxelblUserID.Text = _BO_P_User.UserID;
                this.dxelblUserNameCn.Text = _BO_P_User.UserNameCn;
            }


        }


        protected void dxeMoveCallback_Callback(object source, 
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String strDirection = e.Parameter;
            if (strDirection == "movefromrighttoleft")
            {
                BO_P_UserRole.Add(this.dxelbxOther.SelectedItem.Value.ToString(), _ID);
                e.Result = "movefromrighttoleft";  
            }
            else
            {
                BO_P_UserRole.Delete(this.dxelbxIn.SelectedItem.Value.ToString(), _ID);
                e.Result = "movefromlefttoright";
            }
        }


        private void loadData()
        {
            DataTable dt = BO_P_UserRole.UserIncludeRole(this._ID);
            this.dxelbxIn.DataSource = dt;
            this.dxelbxIn.TextField = "RoleName";
            this.dxelbxIn.ValueField = "RoleID";
            this.dxelbxIn.DataBind();

            dt = BO_P_UserRole.UserNotIncludeRole(this._ID);
            this.dxelbxOther.DataSource = dt;
            this.dxelbxOther.TextField = "RoleName";
            this.dxelbxOther.ValueField = "RoleID";
            this.dxelbxOther.DataBind();
        }

    
    }
}
