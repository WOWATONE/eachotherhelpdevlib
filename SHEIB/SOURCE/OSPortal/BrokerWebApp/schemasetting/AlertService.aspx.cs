using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;

namespace BrokerWebApp.schemasetting
{
    public partial class AlertService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    this.Initialization();
                }
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 初始化控件
        /// </summary>
        private void Initialization()
        {
            DataTable dtList = BO_SysSet.GetSysSetList(" And ParamId in(10, 11, 12, 13, 14) ");
            if (dtList != null && dtList.Rows.Count > 0)
            {
                foreach (DataRow row in dtList.Rows)
                {
                    switch (Convert.ToInt32(row["ParamId"]))
                    {
                        case 10:
                            this.txtFee.Text = row["ParamData"].ToString();
                            break;
                        case 11:
                            this.txtContinueDays.Text = row["ParamData"].ToString();
                            break;
                        case 12:
                            this.txtPtFollow.Text = row["ParamData"].ToString();
                            break;
                        case 13:
                            this.txtBirthDays.Text = row["ParamData"].ToString();
                            break;
                        case 14:
                            this.txtProcess.Text = row["ParamData"].ToString();
                            break;
                        default:
                            break;
                    }
                }
            }
        }

        protected void dxeSaveCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            try
            {
                BO_SysSet sysSet = new BO_SysSet();
                sysSet.ParamId = 10;
                sysSet.ParamData = this.txtFee.Text;
                sysSet.Save(ModifiedAction.Update);

                sysSet.ParamId = 11;
                sysSet.ParamData = this.txtContinueDays.Text;
                sysSet.Save(ModifiedAction.Update);

                sysSet.ParamId = 12;
                sysSet.ParamData = this.txtPtFollow.Text;
                sysSet.Save(ModifiedAction.Update);

                sysSet.ParamId = 13;
                sysSet.ParamData = this.txtBirthDays.Text;
                sysSet.Save(ModifiedAction.Update);

                sysSet.ParamId = 14;
                sysSet.ParamData = this.txtProcess.Text;
                sysSet.Save(ModifiedAction.Update);

                e.Result = "修改完成。";
            }
            catch (Exception ex)
            {
                e.Result = ex.Message;
            }
        }
    }
}
