using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Drawing;
using System.IO;
using System.Text;
using DevExpress.Web.ASPxHtmlEditor;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;

namespace BrokerWebApp.inoutbalance
{
    public partial class FeeCustomerAdd : BasePage
    {

        #region Variables

        
        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            init();
            if (!IsPostBack && !IsCallback)
            {                
                BindGrid();
            }
        }

        private void init()
        {
            dxetxtPayFee.BackColor = Color.LightGray;
            dxetxtFeeAdjust.BackColor = Color.LightGray;
            dxetxtFee.BackColor = Color.LightGray;
            dxetxtCiPremium.BackColor = Color.LightGray;
            dxetxtAciPremium.BackColor = Color.LightGray;
            dxetxtCstPremium.BackColor = Color.LightGray;

            dxetxtPayFee.ReadOnly = true;
            dxetxtFeeAdjust.ReadOnly = true;
            dxetxtFee.ReadOnly = true;
            dxetxtCiPremium.ReadOnly = true;
            dxetxtAciPremium.ReadOnly = true;
            dxetxtCstPremium.ReadOnly = true;

        }



        protected void dxeSaveCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String thenoticeNo = saveNotice(e.Parameter);
            e.Result = thenoticeNo;
        }


        protected void dxeAuditCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            auditNotice(e.Parameter);
            e.Result = "ok";
        }


        protected void gridPolicyItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
            
        }


        private void BindGrid()
        {
            string sVocherID = "";
            sVocherID = "0903052101";
            DataTable dt =  BO_FeeCustomer.GetFeeCustomerAdd(sVocherID).Tables[0];
            this.gridPolicyItem.DataSource = dt;
            this.gridPolicyItem.DataBind();

            //取应收.
            dxetxtPayFee.Text = dt.Compute("Sum(PayFeeBase)", "").ToString();
            dxetxtFeeAdjust.Text = dt.Compute("Sum(FeeAdjust)", "").ToString();
            dxetxtFee.Text = dt.Compute("Sum(Fee)", "").ToString();
            dxetxtCiPremium.Text = dt.Compute("Sum(CiPremium)", "").ToString();
            dxetxtAciPremium.Text = dt.Compute("Sum(AciPremium)", "").ToString();
            dxetxtCstPremium.Text = dt.Compute("Sum(CstPremium)", "").ToString();

        }


        private string saveNotice(String parameter)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(InfoJSON));
            InfoJSON obj;

            obj = (InfoJSON)serializer.ReadObject(ms);
            ms.Close();

            BusinessObjects.BO_Voucher objLoad;
            if (String.IsNullOrEmpty(obj.ID))
            {
                objLoad = new BO_Voucher();
                
                objLoad.VoucherId = TranUtils.GetVoucherNo();
                objLoad.InvoiceNO = "";
                objLoad.CreateTime = DateTime.Now;
                objLoad.CreatePerson = this.CurrentUserID;
                objLoad.AccountTypeID = Convert.ToInt32(BO_P_Code.AccountType.FeeCustomer_Direct);
                objLoad.FeeDate = obj.GotDate;
                objLoad.AuditStatus = Convert.ToInt32(BO_P_Code.AuditStatus.Appeal).ToString();
                objLoad.Remark = obj.Remark;
                objLoad.Save(ModifiedAction.Insert);
            }
            else
            {
                objLoad = new BO_Voucher(obj.ID);
                objLoad.FeeDate = obj.GotDate;
                objLoad.Remark  = obj.Remark;
                objLoad.Save(ModifiedAction.Update);
            }                      

            return objLoad.VoucherId;
            

        }

        private void auditNotice(String parameter)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(InfoJSON));
            InfoJSON obj;

            obj = (InfoJSON)serializer.ReadObject(ms);
            ms.Close();

            BusinessObjects.BO_Voucher objLoad;
            if (String.IsNullOrEmpty(obj.ID))
            {
                //
            }
            else
            {
                objLoad = new BO_Voucher(obj.ID);
                objLoad.AuditStatus = obj.AuditStatus;
                objLoad.Save(ModifiedAction.Update);
            }

        }

        private void loadValue(String id)
        {
            if (String.IsNullOrEmpty(id.Trim())) return;

            
            BusinessObjects.BO_Voucher obj;

            obj = new BusinessObjects.BO_Voucher(id);

            this.dxeGotDate.Date = obj.FeeDate;
            if (obj.AuditStatus == Convert.ToInt32(BO_P_Code.AuditStatus.AuditOk).ToString())
            {
                this.dxebtnAudit.Text = "反审核";
            }
            else
            {
                this.dxebtnAudit.Text = "审核";
            }

        }


        [DataContract(Namespace = "http://www.sheib.com")]
        public class InfoJSON
        {
            public InfoJSON()
            { }


            [DataMember]
            public string Remark { get; set; }

            [DataMember]
            public string ID { get; set; }

            [DataMember]
            public DateTime GotDate { get; set; }

            [DataMember]
            public string AuditStatus { get; set; }


        }



    }
}
