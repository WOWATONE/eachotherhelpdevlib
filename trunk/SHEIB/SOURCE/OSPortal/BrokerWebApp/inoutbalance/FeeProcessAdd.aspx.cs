using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;
using System.Drawing;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;

using System.IO;
using System.Text;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxGridView.Rendering;
using DevExpress.Web.ASPxClasses.Internal;

namespace BrokerWebApp.inoutbalance
{
    public partial class FeeProcessAdd : BasePage
    {

        #region Variables

        private const string inputQueryStringIDKey = "VoucherID";
        private Boolean gridPolicyItemStartEdit = false;

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {
                init();
                this.dxetxtVoucherId.Text = Page.Request.QueryString[inputQueryStringIDKey];
                loadValue(this.dxetxtVoucherId.Text);
                dxetxtVoucherId.BackColor = Color.LightGray;

                CheckPermission();
            }
            string sVocherID = this.dxetxtVoucherId.Text;
            BindGrid(sVocherID);
        }


        private void CheckPermission()
        {
            if (!this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.FeeBalance_Audit))
            {
                dxebtnAudit.ClientEnabled = false;
            }

            if (!this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.FeeBalance_Modify))
            {
                dxebtnSave.ClientEnabled = false;
                dxebtnAddPolicy.ClientEnabled = false;
            }
        }

        protected void dxeSaveCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String id = saveVoucher(e.Parameter);
            e.Result = id;
        }


        protected void dxeAuditCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            int resultSign = 0;
            String resultMSG = "";
            auditVoucher(e.Parameter, ref resultSign, ref resultMSG);
            if (resultSign == 0)
                e.Result = resultSign.ToString();
            else
                e.Result = resultMSG;
        }

        protected void gridPolicyItem_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxTextBox dxetxtPolicyItemFee = tblEditorTemplate.FindControl("dxetxtPolicyItemFee") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemFeeAdjust = tblEditorTemplate.FindControl("dxetxtPolicyItemFeeAdjust") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemInvoiceedFee = tblEditorTemplate.FindControl("dxetxtPolicyItemInvoiceedFee") as ASPxTextBox;
            dxetxtPolicyItemInvoiceedFee.BackColor = Color.LightGray;
            dxetxtPolicyItemInvoiceedFee.ReadOnly = true;
            
            Int32 editIndex = this.gridPolicyItem.EditingRowVisibleIndex;
            if (editIndex > -1)
            {
                object theValues = this.gridPolicyItem.GetRowValues(editIndex, new String[] { "FeeId", "Fee", "FeeAdjust", "InvoiceedFee" });
                object[] theValueList = theValues as object[];

                //String FeeId = theValueList[0].ToString();
                String fee = theValueList[1].ToString();
                String FeeAdjust = theValueList[2].ToString();
                String InvoiceedFee = theValueList[3].ToString();
                
                if (this.gridPolicyItemStartEdit)
                {
                    dxetxtPolicyItemFee.Text = fee;
                    dxetxtPolicyItemFeeAdjust.Text = FeeAdjust;
                    dxetxtPolicyItemInvoiceedFee.Text = InvoiceedFee;
                }

            }

        }

        protected void gridPolicyItem_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            this.gridPolicyItemStartEdit = true;
        }



        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            String theKey = e.Keys[0].ToString();
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxTextBox dxetxtPolicyItemFee = tblEditorTemplate.FindControl("dxetxtPolicyItemFee") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemFeeAdjust = tblEditorTemplate.FindControl("dxetxtPolicyItemFeeAdjust") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemInvoiceedFee = tblEditorTemplate.FindControl("dxetxtPolicyItemInvoiceedFee") as ASPxTextBox;
            

            BusinessObjects.BO_Fee newobj = new BusinessObjects.BO_Fee(theKey);


            if (dxetxtPolicyItemFee.Text != String.Empty)
            {
                newobj.Fee = Convert.ToDecimal(dxetxtPolicyItemFee.Text);
            }

            if (dxetxtPolicyItemFeeAdjust.Text != String.Empty)
            {
                newobj.FeeAdjust = Convert.ToDecimal(dxetxtPolicyItemFeeAdjust.Text);
            }

            try
            {
                newobj.Save(ModifiedAction.Update);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
            BindGrid("");
        }

        protected void gridPolicyItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //this.gridPolicyItem.DataBind();
        }

        
        protected void gridPolicyItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String theKey = e.Keys[0].ToString();

            try
            {
                BusinessObjects.BO_Fee.Delete(theKey);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
            BindGrid("");

        }

        protected void gridPolicyItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }


        protected void gridPolicyItem_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            string sVoucherID = e.Parameters;
            BindGrid(sVoucherID);
        }


        protected void gridPolicyItem_HtmlRowCreated(object sender,
            ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                String state = "0";
                object obj = e.GetValue("AuditStatus");
                if (Convert.IsDBNull(obj))
                {
                    state = "0";
                }
                else
                {
                    state = Convert.ToString(obj);
                }

                GridViewCommandColumn objgcc = getCommandColumnLoop(this.gridPolicyItem);
                if (state == "1")
                {
                    //e.Row.Enabled = false;
                    GridViewCommandColumnButtonControl thebtn;
                    thebtn = (GridViewCommandColumnButtonControl)e.Row.Cells[objgcc.VisibleIndex].Controls[0];
                    ((InternalHyperLink)thebtn.Controls[0]).Enabled = false;
                    thebtn.Visible = false;

                    thebtn = (GridViewCommandColumnButtonControl)e.Row.Cells[objgcc.VisibleIndex].Controls[1];
                    thebtn.Visible = false;
                    //InternalHyperLink theIHL = (InternalHyperLink)thebtn.Controls[0];
                    //theIHL.Text = "查看";
                }
                else
                {
                    e.Row.Enabled = true;
                }

                if (!this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.FeeBalance_Modify))
                {
                    e.Row.Cells[0].Controls[0].Visible = false;
                    e.Row.Cells[0].Controls[1].Visible = false;
                }
            }

        }



        private GridViewCommandColumn getCommandColumnLoop(ASPxGridView grid)
        {
            GridViewCommandColumn theCommandColumn = null;
            foreach (GridViewColumn item in grid.VisibleColumns)
            {
                if (item.GetType() == typeof(GridViewCommandColumn))
                {
                    theCommandColumn = (GridViewCommandColumn)item;
                    break;
                }
            }
            return theCommandColumn;
        }


        protected void gridPolicyItem_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {

            String appendDes = "必需项";
            HtmlTable tblEditorTemplate = this.gridPolicyItem.FindEditFormTemplateControl("tblgridPolicyItemEditorTemplate") as HtmlTable;

            ASPxTextBox dxetxtPolicyItemFee = tblEditorTemplate.FindControl("dxetxtPolicyItemFee") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemFeeAdjust = tblEditorTemplate.FindControl("dxetxtPolicyItemFeeAdjust") as ASPxTextBox;
            ASPxTextBox dxetxtPolicyItemInvoiceedFee = tblEditorTemplate.FindControl("dxetxtPolicyItemInvoiceedFee") as ASPxTextBox;




            if (String.IsNullOrEmpty(dxetxtPolicyItemFee.Text.Trim()))
            {
                e.Errors[this.gridPolicyItem.Columns[0]] = appendDes;
            }

            if (String.IsNullOrEmpty(dxetxtPolicyItemFeeAdjust.Text.Trim()))
            {
                e.Errors[this.gridPolicyItem.Columns[1]] = appendDes;
            }

            dxetxtPolicyItemFee.Validate();
            dxetxtPolicyItemFeeAdjust.Validate();

            decimal dFee = 0;
            decimal dFeeAdjust = 0;
            decimal dInvoiceedFee = 0;
            if (dxetxtPolicyItemInvoiceedFee.Text != String.Empty)
            {
                dInvoiceedFee = Convert.ToDecimal(dxetxtPolicyItemInvoiceedFee.Text);
            }
            if (dxetxtPolicyItemFee.Text != String.Empty)
            {
                dFee = Convert.ToDecimal(dxetxtPolicyItemFee.Text);
            }
            if (dxetxtPolicyItemFeeAdjust.Text != String.Empty)
            {
                dFeeAdjust = Convert.ToDecimal(dxetxtPolicyItemFeeAdjust.Text);
            }

            if (dInvoiceedFee != dFee + dFeeAdjust)
            {
                e.RowError = "本期结算金额与调整金额之和必须与开票金额相同,请修改.";
            }
            
            if (string.IsNullOrEmpty(e.RowError) && e.Errors.Count > 0) e.RowError = "请修正所有的错误(" + appendDes + ")。";

        }

        


        private void init()
        {
            
            DataSet dsList;

            this.dxeddlProcessFeeType.Items.Add("(全部)", "");
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.ProcessFeeType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlProcessFeeType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }


            this.dxeddlCarrier.Items.Add("(全部)", "");
            dsList = BusinessObjects.SchemaSetting.BO_Carrier.GetCarrierList("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlCarrier.Items.Add(row["CarrierNameCn"].ToString().Trim(), row["CarrierID"].ToString().Trim());
                }
            }

            this.dxeddlBranch.Items.Add("(全部)", "");
            dsList = BusinessObjects.SchemaSetting.BO_Branch.GetBranchList("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlBranch.Items.Add(row["BranchName"].ToString().Trim(), row["BranchID"].ToString().Trim());
                }
            }

        }

        private void BindGrid(string sVoucherID)
        {
            string lsVocherID = "";
            if (sVoucherID == "")
            {
                lsVocherID = this.dxetxtVoucherId.Text;
            }
            else
            {
                lsVocherID = sVoucherID;
            }
            DataTable dt = BO_FeeProcess.GetFeeProcessAdd(lsVocherID).Tables[0];
            this.gridPolicyItem.DataSource = dt;
            this.gridPolicyItem.DataBind();

            //取应收.
            //dxetxtPayFee.Text = dt.Compute("Sum(PayFeeBase)", "").ToString();
            //dxetxtFeeAdjust.Text = dt.Compute("Sum(FeeAdjust)", "").ToString();
            //dxetxtFee.Text = dt.Compute("Sum(Fee)", "").ToString();
            //dxetxtCiPremium.Text = dt.Compute("Sum(CiPremium)", "").ToString();
            //dxetxtAciPremium.Text = dt.Compute("Sum(AciPremium)", "").ToString();
            //dxetxtCstPremium.Text = dt.Compute("Sum(CstPremium)", "").ToString();

        }


        private string saveVoucher(String parameter)
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

                objLoad.VoucherId = TranUtils.GetVoucherNo(BusinessObjects.BO_P_Code.AccountType.Process);
                objLoad.InvoiceNO = "";
                objLoad.CreateTime = DateTime.Now;
                objLoad.CreatePerson = this.CurrentUserID;
                objLoad.AccountTypeID = Convert.ToInt32(BO_P_Code.AccountType.Process);
                objLoad.FeeDate = dxeReleaseDate.Date;//obj.ReleaseDate;
                objLoad.AuditStatus = Convert.ToInt32(BO_P_Code.AuditStatus.Appeal).ToString();
                objLoad.Remark = obj.Remark;

                objLoad.CarrierID = obj.Carrier;
                objLoad.BranchID = obj.Branch;
                objLoad.ProcessFeeType = obj.ProcessFeeType;
                objLoad.Save(ModifiedAction.Insert);
            }
            else
            {
                objLoad = new BO_Voucher(obj.ID);
                objLoad.FeeDate = dxeReleaseDate.Date;//obj.ReleaseDate;
                objLoad.Remark = obj.Remark;

                objLoad.CarrierID = obj.Carrier;
                objLoad.BranchID = obj.Branch;
                objLoad.ProcessFeeType = obj.ProcessFeeType;
                objLoad.Save(ModifiedAction.Update);
            }

            return objLoad.VoucherId;


        }

        private void auditVoucher(String parameter, ref Int32 resultSign, ref string resultMSG)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(InfoJSON));
            InfoJSON obj;

            obj = (InfoJSON)serializer.ReadObject(ms);
            ms.Close();

            if (String.IsNullOrEmpty(obj.ID))
            {
                //
            }
            else
            {
                BO_Voucher.AuditVoucher(obj.ID, obj.AuditStatus, this.CurrentUserID, ref resultSign, ref resultMSG);
            }
        }

        private void loadValue(String id)
        {
            if (String.IsNullOrEmpty(id)) return;


            BusinessObjects.BO_Voucher obj;

            obj = new BusinessObjects.BO_Voucher(id);

            this.dxeReleaseDate.Date = obj.FeeDate;
            this.dxetxtRemark.Text = obj.Remark;
            
            ListEditItem theselected;

            //processtype
            theselected = this.dxeddlProcessFeeType.Items.FindByValue(obj.ProcessFeeType);
            if (theselected != null)
            {
                dxeddlProcessFeeType.SelectedItem = theselected;
            }

            //carrie
            theselected = this.dxeddlCarrier.Items.FindByValue(obj.CarrierID);
            if (theselected != null)
            {
                dxeddlCarrier.SelectedItem = theselected;
            }

            //branch
            theselected = this.dxeddlBranch.Items.FindByValue(obj.BranchID);
            if (theselected != null)
            {
                dxeddlBranch.SelectedItem = theselected;
            }

            if (obj.AuditStatus == Convert.ToInt32(BO_P_Code.AuditStatus.AuditOk).ToString())
            {
                this.dxebtnAudit.Text = "反审核";
                dxebtnAddPolicy.ClientEnabled = false;
                dxebtnSave.ClientEnabled = false;
                dxebtnPrint.ClientEnabled = false;
            }
            else
            {
                this.dxebtnAudit.Text = "审核";
                dxebtnAddPolicy.ClientEnabled = true;
                dxebtnSave.ClientEnabled = true;
                dxebtnPrint.ClientEnabled = true;
            }

        }



        protected void dxeddlBranch_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.SchemaSetting.BO_Branch.FetchListByCarrier(e.Parameter);
            thecb.TextField = "BranchName";
            thecb.ValueField = "BranchID";
            thecb.DataBind();
            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
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
            public DateTime ReleaseDate { get; set; }

            [DataMember]
            public string AuditStatus { get; set; }

            [DataMember]
            public string ProcessFeeType { get; set; }

            [DataMember]
            public string Carrier { get; set; }

            [DataMember]
            public string Branch { get; set; }
            

        }



    }
}
