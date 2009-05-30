using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;
using BusinessObjects;

namespace BrokerWebApp.schemasetting
{
    public partial class RoleEdit : System.Web.UI.Page
    {
        private String _oldID;
        private BO_P_Role _BO_P_Role;
        private ModifiedAction modifiedAction;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack)
            {
                _oldID = this.originalID.Value;
            }
            else
            {
                this.originalID.Value = Page.Request.QueryString["id"];
                _oldID = this.originalID.Value;
            }


            if (_oldID == null || _oldID == "")
                _BO_P_Role = new BO_P_Role();

            else
                _BO_P_Role = new BO_P_Role(_oldID);



            if (_BO_P_Role.RoleID != null && _BO_P_Role.RoleID != "")
            {
                modifiedAction = ModifiedAction.Update;
            }
            else
            {
                modifiedAction = ModifiedAction.Insert;
            }



        }


        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!Page.IsPostBack && modifiedAction == ModifiedAction.Update)
            {
                loadData();
            }

        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (checkExist()) return;

            if (modifiedAction == ModifiedAction.Insert)
            _BO_P_Role.RoleID = Guid.NewGuid().ToString();
            else
                _BO_P_Role.RoleID = _oldID;

            _BO_P_Role.RoleNo = this.dxetxtRoleNo.Text.Trim();


            _BO_P_Role.RoleName = this.dxetxtRoleName.Text.Trim();

            _BO_P_Role.Remark = this.dxetxtRemark.Text.Trim();

            _BO_P_Role.Save(modifiedAction);

            this.originalID.Value = _BO_P_Role.RoleID;

        }


        private void loadData()
        {
            this.dxetxtRoleNo.Text = _BO_P_Role.RoleNo;
            this.dxetxtRoleName.Text = _BO_P_Role.RoleName;
            this.dxetxtRemark.Text = _BO_P_Role.Remark;
        }


        
        private bool checkExist()
        {
            Boolean vaildResult;
            vaildResult = BO_P_Role.CheckExist(this.dxetxtRoleNo.Text.Trim(), this.dxetxtRoleName.Text.Trim());
            
            BO_P_Role theBO_P_Role;
            theBO_P_Role = new BO_P_Role(this.dxetxtRoleName.Text.Trim());
            
            if (vaildResult)
            {
                this.tblerrmsg.Visible = true;
                return true;                
            }
            else
            {
                this.tblerrmsg.Visible = false;
                return false;
            }
        }





    }
}
