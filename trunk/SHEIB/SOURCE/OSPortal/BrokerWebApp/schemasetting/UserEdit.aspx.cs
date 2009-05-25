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
    public partial class UserEdit : System.Web.UI.Page
    {
        private String _oldUserID;
        private BO_P_User _BO_P_User;
        private ModifiedAction modifiedAction;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                _oldUserID = this.originalUserID.Value;
            }
            else
            {
                this.originalUserID.Value = Page.Request.QueryString["userid"];
                _oldUserID = this.originalUserID.Value;
            }

            
            if (_oldUserID == null || _oldUserID == "")            
                _BO_P_User = new BO_P_User();
            
            else
                _BO_P_User = new BO_P_User(_oldUserID);



            if (_BO_P_User.UserID != null && _BO_P_User.UserID != "")
            {
                this.dxetxtUserID.Enabled = false;
                modifiedAction = ModifiedAction.Update;
            }
            else
            {
                this.dxetxtUserID.Enabled = true;
                modifiedAction = ModifiedAction.Insert;
            }

            //bind dept
            bindDept();
            
        }



        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                loadData();
            }
            
        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (checkExist()) return;

            _BO_P_User.UserID = this.dxetxtUserID.Text.Trim();
            _BO_P_User.Password = this.dxetxtPassword.Text.Trim();
            if (this.dxeddlDeptID.SelectedItem != null)
                _BO_P_User.DeptID = Convert.ToString(this.dxeddlDeptID.SelectedItem.Value);
            else
                _BO_P_User.DeptID = "";

            _BO_P_User.UserNameCn = this.dxetxtUserNameCn.Text.Trim();
            _BO_P_User.UserNameEn = this.dxetxtUserNameEn.Text.Trim();
            if (this.dxeddlSex.SelectedItem != null)
                _BO_P_User.Sex = Convert.ToString(this.dxeddlSex.SelectedItem.Value);
            else
                _BO_P_User.Sex = "";

            _BO_P_User.IDNo = this.dxetxtIDNo.Text.Trim();
            if (this.dtBirthday.Value != null)
                _BO_P_User.Birthday = this.dtBirthday.Date;
            else
                _BO_P_User.Birthday = DateTime.MinValue;

            if (this.dtJoinDate.Value != null)
                _BO_P_User.JoinDate = this.dtJoinDate.Date;
            else
                _BO_P_User.JoinDate = DateTime.MinValue;

            _BO_P_User.Title = this.dxetxtTitle.Text.Trim();

            if (this.dxeddlStatus.SelectedItem != null)
                _BO_P_User.Status = Convert.ToString(this.dxeddlStatus.SelectedItem.Value);
            else
                _BO_P_User.Status = "";

            _BO_P_User.Address = this.dxetxtAddress.Text.Trim();
            _BO_P_User.PostCode = this.dxetxtPostCode.Text.Trim();
            _BO_P_User.Tel = this.dxetxtTel.Text.Trim();
            _BO_P_User.Fax = this.dxetxtFax.Text.Trim();
            _BO_P_User.Email = this.dxetxtEmail.Text.Trim();
            _BO_P_User.CertNo = this.dxetxtCertNo.Text.Trim();
            _BO_P_User.Mobile = this.dxetxtMobile.Text.Trim();
            _BO_P_User.BankName = this.dxetxtBankName.Text.Trim();
            _BO_P_User.BankAccount = this.dxetxtBankAccount.Text.Trim();
            _BO_P_User.Remark = this.dxetxtRemark.Text.Trim();

            _BO_P_User.Save(modifiedAction);

        }


        private void loadData()
        {
            this.dxetxtUserID.Text = _BO_P_User.UserID;
            this.dxetxtPassword.Text = _BO_P_User.Password;

            this.dxeddlDeptID.SelectedItem = this.dxeddlDeptID.Items.FindByValue(_BO_P_User.DeptID);
                       

            this.dxetxtUserNameCn.Text = _BO_P_User.UserNameCn;
            this.dxetxtUserNameEn.Text = _BO_P_User.UserNameEn;

            this.dxeddlSex.SelectedItem = this.dxeddlSex.Items.FindByValue(_BO_P_User.Sex);

            
            this.dxetxtIDNo.Text = _BO_P_User.IDNo;
            this.dtBirthday.Date = _BO_P_User.Birthday;

            this.dtJoinDate.Date = _BO_P_User.JoinDate;

            this.dxetxtTitle.Text = _BO_P_User.Title;

            this.dxeddlStatus.SelectedItem = this.dxeddlStatus.Items.FindByValue(_BO_P_User.Status);
            
            this.dxetxtAddress.Text = _BO_P_User.Address;
            this.dxetxtPostCode.Text = _BO_P_User.PostCode;
            this.dxetxtTel.Text = _BO_P_User.Tel;
            this.dxetxtFax.Text = _BO_P_User.Fax;
            this.dxetxtEmail.Text = _BO_P_User.Email;
            this.dxetxtCertNo.Text = _BO_P_User.CertNo;
            this.dxetxtMobile.Text = _BO_P_User.Mobile;
            this.dxetxtBankName.Text = _BO_P_User.BankName;
            this.dxetxtBankAccount.Text = _BO_P_User.BankAccount;
            this.dxetxtRemark.Text = _BO_P_User.Remark;

        }


        private void bindDept()
        {
            this.dxeddlDeptID.Items.Clear();
            List<BO_P_Department> _datalist;
            _datalist = BO_P_Department.FetchList();

            this.dxeddlDeptID.DataSource = _datalist;
            this.dxeddlDeptID.TextField = "DeptName";
            this.dxeddlDeptID.ValueField = "DeptID";
            this.dxeddlDeptID.DataBind();
        }


        private bool checkExist()
        {
            BO_P_User theBO_P_User;
            theBO_P_User = new BO_P_User(this.dxetxtUserID.Text.Trim());
            if (theBO_P_User.UserID==null || theBO_P_User.UserID == this.originalUserID.Value)
            {
                this.tblerrmsg.Visible = false;
                return false;
            }
            else
            {
                this.tblerrmsg.Visible = true;
                return true;
            }
        }
    




   }
}
