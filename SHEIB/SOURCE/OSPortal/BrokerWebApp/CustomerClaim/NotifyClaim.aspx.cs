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
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxEditors;
using BusinessObjects;

using System.IO;
using System.Text;

namespace BrokerWebApp.CustomerClaim
{
    public partial class NotifyClaim : BasePage
    {

        #region 私有变量
        /// <summary>
        /// 理赔编号
        /// </summary>
        private string _notifyID;

        private const string UploadDirectory = "~/UploadFiles/PolicyUploadFiles/";
        
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    if (Request.QueryString["NotifyID"] != null && Request.QueryString["NotifyID"].Trim().Length > 0)
                    {
                        this._notifyID = Request.QueryString["NotifyID"].Trim();
                        this.ViewState["NotifyID"] = this._notifyID;
                    }

                    this.Initialization();
                }
                else
                {
                    if (this.ViewState["NotifyID"] != null && this.ViewState["NotifyID"].ToString().Length > 0)
                        this._notifyID = this.ViewState["NotifyID"].ToString();
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
            if (string.IsNullOrEmpty(this._notifyID))
            {
                //保单编号
                
                
                //损失性质
                this.SetddlLossType("");
                //制单人
                //this.SetddlCreatePerson("");
                this.dxetxtCreatePerson.Text = this.CurrentUserID;
                //制单日期
                this.deCreateDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
            }
            else
            {
                this.lblerrmsg.Visible = false;
                BusinessObjects.BO_NotifyClaim notifyClaim = BusinessObjects.BO_NotifyClaim.GetNotifyClaimByNotifyID(this._notifyID);
                if (notifyClaim == null)
                {
                    this.lblerrmsg.InnerText = "没有理赔信息。";
                    this.lblerrmsg.Visible = true;
                    this.dxebtnBottomSave.Enabled = false;
                    return;
                }

                this.dxetxtNotifyPerson.Text = notifyClaim.NotifyPerson;
                //this.SetddlNotifyType(notifyClaim.NotifyType);
                if (notifyClaim.NotifyTime != DateTime.MinValue)
                    this.deNotifyTime.Text = notifyClaim.NotifyTime.ToString("yyyy-MM-dd");
                this.dxetxtAccidentSpot.Text = notifyClaim.AccidentSpot;
                if (notifyClaim.AccidentTime != DateTime.MinValue)
                    this.deAccidentTime.Text = notifyClaim.AccidentTime.ToString("yyyy-MM-dd");
                this.SetddlLossType(notifyClaim.LossType);
                this.dxeddlAccidentReason.SelectedIndex = this.dxeddlAccidentReason.Items.IndexOf(this.dxeddlAccidentReason.Items.FindByValue(notifyClaim.AccidentReason));
                this.dxetxtNotifyLossFee.Text = notifyClaim.NotifyLossFee == -1 ? "" : notifyClaim.NotifyLossFee.ToString();
                this.dxetxtContactPerson.Text = notifyClaim.ContactPerson;
                this.dxetxtContactPhone.Text = notifyClaim.ContactPhone;
                this.dxetxtAccidentProc.Text = notifyClaim.AccidentProc;
                //this.txtAccidentDeal.Text = notifyClaim.AccidentDeal;
                if (notifyClaim.NotifyCarrierTime != DateTime.MinValue)
                    this.deNotifyCarrierTime.Text = notifyClaim.NotifyCarrierTime.ToString("yyyy-MM-dd");
                this.dxetxtNotifyNo.Text = notifyClaim.NotifyNo;
                this.dxetxtNotifyNo.ReadOnly = true;
                this.dxetxtCarrierContactPerson.Text = notifyClaim.CarrierContactPerson;
                this.dxetxtCarrierContactPhone.Text = notifyClaim.CarrierContactPhone;
                if (notifyClaim.PerambulateTime != DateTime.MinValue)
                    this.dePerambulateTime.Text = notifyClaim.PerambulateTime.ToString("yyyy-MM-dd");
                //this.txtRequirement.Text = notifyClaim.Requirement;
                //this.SetddlCreatePerson(notifyClaim.CreatePerson);
                this.dxetxtCreatePerson.Text = notifyClaim.CreatePerson;
                if (notifyClaim.CreateDate != DateTime.MinValue)
                    this.deCreateDate.Text = notifyClaim.CreateDate.ToString("yyyy-MM-dd");

                this.SetPolicyInfo(notifyClaim.PolicyNo);
            }
        }

                

        /// <summary>
        /// 设置损失性质
        /// </summary>
        private void SetddlLossType(string value)
        {
            DataSet dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.LossType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlLossType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
                this.dxeddlLossType.SelectedIndex = this.dxeddlLossType.Items.IndexOf(this.dxeddlLossType.Items.FindByValue(value));
            }
        }

        
        /// <summary>
        /// 设置保单信息
        /// </summary>
        /// <param name="policyNo"></param>
        private void SetPolicyInfo(string policyNo)
        {
            this.dxetxtCarrierNameCn.Text = "";
            this.dxetxtCustName.Text = "";            
            this.dxetxtBeneficiary.Text = "";
            this.dxetxtProdTypeName.Text = "";
            this.dxetxtStartDate.Text = "";
            this.dxetxtEndDate.Text = "";
            this.dxetxtUserNameCn.Text = "";
            this.hidPolicyID.Value = "";
            if (string.IsNullOrEmpty(policyNo))
                return;

            DataTable dt = BusinessObjects.BO_NotifyClaim.GetPolicyByPolicyNo(policyNo);
            if (dt != null && dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["CarrierNameCn"] != DBNull.Value)
                    this.dxetxtCarrierNameCn.Text = dt.Rows[0]["CarrierNameCn"].ToString();
                if (dt.Rows[0]["CustName"] != DBNull.Value)
                    this.dxetxtCustName.Text = dt.Rows[0]["CustName"].ToString();
                if (dt.Rows[0]["Beneficiary"] != DBNull.Value)
                    this.dxetxtBeneficiary.Text = dt.Rows[0]["Beneficiary"].ToString();
                if (dt.Rows[0]["ProdTypeName"] != DBNull.Value)
                    this.dxetxtProdTypeName.Text = dt.Rows[0]["ProdTypeName"].ToString();
                if (dt.Rows[0]["StartDate"] != DBNull.Value)
                    this.dxetxtStartDate.Text = dt.Rows[0]["StartDate"].ToString();
                if (dt.Rows[0]["EndDate"] != DBNull.Value)
                    this.dxetxtEndDate.Text = dt.Rows[0]["EndDate"].ToString();
                if (dt.Rows[0]["UserNameCn"] != DBNull.Value)
                    this.dxetxtUserNameCn.Text = dt.Rows[0]["UserNameCn"].ToString();
                if (dt.Rows[0]["PolicyID"] != DBNull.Value)
                    this.hidPolicyID.Value = dt.Rows[0]["PolicyID"].ToString();
            }
        }

        /// <summary>
        /// 保存理赔信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxebtnBottomSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(this._notifyID))
                {//新增理赔
                    this.lblerrmsg.Visible = false;
                    if (this.hidPolicyID.Value.Length <= 0)
                    {
                        this.lblerrmsg.InnerText = "请选择保单编号。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    if (BusinessObjects.BO_NotifyClaim.IfExistsNotifyNo(this.dxetxtNotifyNo.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "该报案号已存在。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    BusinessObjects.BO_NotifyClaim notifyClaim = new BO_NotifyClaim();
                    string id = TranUtils.GetCustomerID(); //?//暂用客户编号代替
                    notifyClaim.NotifyID = id;
                    notifyClaim.PolicyID = this.hidPolicyID.Value;
                    notifyClaim.NotifySerialNo = id;
                    notifyClaim.NotifyTime = Convert.ToDateTime(this.deNotifyTime.Text);
                    notifyClaim.AccidentSpot = this.dxetxtAccidentSpot.Text.Trim();
                    notifyClaim.AccidentTime = Convert.ToDateTime(this.deAccidentTime.Text);
                    notifyClaim.NotifyPerson = this.dxetxtNotifyPerson.Text.Trim();
                    notifyClaim.LossType = this.dxeddlLossType.SelectedItem.Value.ToString();
                    notifyClaim.AccidentReason = this.dxeddlAccidentReason.SelectedItem.Value.ToString();
                    notifyClaim.NotifyLossFee = this.dxetxtNotifyLossFee.Text.Trim().Length == 0 ? -1 : Convert.ToDouble(this.dxetxtNotifyLossFee.Text);
                    notifyClaim.ContactPerson = this.dxetxtContactPerson.Text.Trim();
                    notifyClaim.ContactPhone = this.dxetxtContactPhone.Text.Trim();
                    //notifyClaim.NotifyType = this.dxeddlNotifyType.SelectedItem.Value.ToString();
                    notifyClaim.SpotCode = ""; //?//
                    notifyClaim.AccidentProc = this.dxetxtAccidentProc.Text.Trim();
                    //notifyClaim.AccidentDeal = this.txtAccidentDeal.Text.Trim();
                    notifyClaim.NotifyRemark = "";//?//
                    notifyClaim.NotifyCarrierTime = Convert.ToDateTime(this.deNotifyCarrierTime.Text);
                    notifyClaim.NotifyNo = this.dxetxtNotifyNo.Text.Trim();
                    notifyClaim.CarrierContactPerson = this.dxetxtCarrierContactPerson.Text.Trim();
                    notifyClaim.CarrierContactPhone = this.dxetxtCarrierContactPhone.Text.Trim();
                    if (this.dePerambulateTime.Text.Trim().Length > 0)
                        notifyClaim.PerambulateTime = Convert.ToDateTime(this.dePerambulateTime.Text);
                    else
                        notifyClaim.PerambulateTime = DateTime.MinValue;
                    //notifyClaim.Requirement = this.txtRequirement.Text.Trim();
                    notifyClaim.CaseEndTime = DateTime.Today; //?//
                    notifyClaim.LastPayFee = 100; //?//
                    notifyClaim.AcquitFee = 100; //?//
                    notifyClaim.CaseEndRemark = "";//?//
                    //notifyClaim.CreatePerson = this.dxeddlCreatePerson.SelectedItem.Value.ToString();
                    notifyClaim.CreatePerson = this.dxetxtCreatePerson.Text.Trim();
                    notifyClaim.CreateDate = Convert.ToDateTime(this.deCreateDate.Text);
                    notifyClaim.ModifyDate = DateTime.Today;//?//
                    notifyClaim.ModifyPerson = "";//?//
                    notifyClaim.Save(ModifiedAction.Insert);

                    this.Response.Redirect("NotifyClaim.aspx");
                }
                else
                {
                    this.lblerrmsg.Visible = false;
                    if (this.hidPolicyID.Value.Length <= 0)
                    {
                        this.lblerrmsg.InnerText = "请选择保单编号。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    BusinessObjects.BO_NotifyClaim notifyClaim = new BO_NotifyClaim();
                    notifyClaim.NotifyID = this._notifyID;
                    notifyClaim.PolicyID = this.hidPolicyID.Value;
                    notifyClaim.NotifySerialNo = this._notifyID;//?//
                    notifyClaim.NotifyTime = Convert.ToDateTime(this.deNotifyTime.Text);
                    notifyClaim.AccidentSpot = this.dxetxtAccidentSpot.Text.Trim();
                    notifyClaim.AccidentTime = Convert.ToDateTime(this.deAccidentTime.Text);
                    notifyClaim.NotifyPerson = this.dxetxtNotifyPerson.Text.Trim();
                    notifyClaim.LossType = this.dxeddlLossType.SelectedItem.Value.ToString();
                    notifyClaim.AccidentReason = this.dxeddlAccidentReason.SelectedItem.Value.ToString();
                    notifyClaim.NotifyLossFee = this.dxetxtNotifyLossFee.Text.Trim().Length == 0 ? -1 : Convert.ToDouble(this.dxetxtNotifyLossFee.Text);
                    notifyClaim.ContactPerson = this.dxetxtContactPerson.Text.Trim();
                    notifyClaim.ContactPhone = this.dxetxtContactPhone.Text.Trim();
                    //notifyClaim.NotifyType = this.dxeddlNotifyType.SelectedItem.Value.ToString();
                    notifyClaim.SpotCode = ""; //?//
                    notifyClaim.AccidentProc = this.dxetxtAccidentProc.Text.Trim();
                    //notifyClaim.AccidentDeal = this.txtAccidentDeal.Text.Trim();
                    notifyClaim.NotifyRemark = "";//?//
                    notifyClaim.NotifyCarrierTime = Convert.ToDateTime(this.deNotifyCarrierTime.Text);
                    notifyClaim.NotifyNo = this.dxetxtNotifyNo.Text.Trim();
                    notifyClaim.CarrierContactPerson = this.dxetxtCarrierContactPerson.Text.Trim();
                    notifyClaim.CarrierContactPhone = this.dxetxtCarrierContactPhone.Text.Trim();
                    if (this.dePerambulateTime.Text.Trim().Length > 0)
                        notifyClaim.PerambulateTime = Convert.ToDateTime(this.dePerambulateTime.Text);
                    else
                        notifyClaim.PerambulateTime = DateTime.MinValue;
                    //notifyClaim.Requirement = this.txtRequirement.Text.Trim();
                    notifyClaim.CaseEndTime = DateTime.Today; //?//
                    notifyClaim.LastPayFee = 100; //?//
                    notifyClaim.AcquitFee = 100; //?//
                    notifyClaim.CaseEndRemark = "";//?//
                    //notifyClaim.CreatePerson = this.dxeddlCreatePerson.SelectedItem.Value.ToString();
                    notifyClaim.CreatePerson = this.dxetxtCreatePerson.Text.Trim();
                    notifyClaim.CreateDate = Convert.ToDateTime(this.deCreateDate.Text);
                    notifyClaim.ModifyDate = DateTime.Today;//?//
                    notifyClaim.ModifyPerson = "";//?//
                    notifyClaim.Save(ModifiedAction.Update);

                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language=\"javascript\">alert(\"修改完成。\");</script>", false);
                }
            }
            catch (Exception ex)
            {
                this.lblerrmsg.InnerText = ex.Message;
                this.lblerrmsg.Visible = true;
            }
        }

        #region Upload File Events

        protected void UploadControl_PreRender(object sender, EventArgs e)
        {
            //
        }


        protected void UploadControl_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            try
            {
                e.CallbackData = SavePostedFiles(e.UploadedFile);
            }
            catch (Exception ex)
            {
                e.IsValid = false;
                e.ErrorText = ex.Message;
            }
        }


        protected string SavePostedFiles(UploadedFile uploadedFile)
        {
            string ret = "";
            string policyFolder = "";// this.dxetxtPolicyID.Text.Trim();
            string policyFolderPath;
            if (uploadedFile.IsValid)
            {
                DirectoryInfo drtInfo = new DirectoryInfo(MapPath(UploadDirectory));
                if (drtInfo.Exists)
                {
                    policyFolderPath = System.IO.Path.Combine(MapPath(UploadDirectory), policyFolder);
                    drtInfo = new DirectoryInfo(policyFolder);
                    FileInfo fileInfo;
                    if (drtInfo.Exists)
                    {
                        fileInfo = new FileInfo(uploadedFile.FileName);
                        string resFileName = System.IO.Path.Combine(policyFolderPath, fileInfo.Name);
                        uploadedFile.SaveAs(resFileName);

                        //string fileLabel = fileInfo.Name;
                        //string fileType = uploadedFile.PostedFile.ContentType.ToString();
                        //string fileLength = uploadedFile.PostedFile.ContentLength / 1024 + "K";
                        //ret = string.Format("{0} <i>({1})</i> {2}|{3}", fileLabel, fileType, fileLength, fileInfo.Name);
                    }
                    else
                    {
                        //create folder
                        drtInfo = System.IO.Directory.CreateDirectory(policyFolderPath);
                        fileInfo = new FileInfo(uploadedFile.FileName);
                        string resFileName = System.IO.Path.Combine(policyFolderPath, fileInfo.Name);
                        uploadedFile.SaveAs(resFileName);
                    }

                    //BO_PolicyDoc
                    BusinessObjects.Policy.BO_PolicyDoc.Delete(this.dxetxtPolicyID.Text.Trim(), fileInfo.Name);

                    BusinessObjects.Policy.BO_PolicyDoc pdoc = new BusinessObjects.Policy.BO_PolicyDoc();
                    pdoc.PolicyDocID = Guid.NewGuid().ToString();
                    pdoc.DocName = fileInfo.Name;
                    //pdoc.PolicyID = this.dxetxtPolicyID.Text.Trim();
                    //pdoc.DocURL = UploadDirectory.Replace("~", "") + policyFolder + "/" + fileInfo.Name;
                    pdoc.Save(ModifiedAction.Insert);
                }


            }
            return ret;
        }


        //protected void gridDocList_HtmlRowCreated(object sender,
        //    ASPxGridViewTableRowEventArgs e)
        //{
        //    if (e.RowType == GridViewRowType.Data)
        //    {
        //        Control thectr;
        //        HyperLink thelnk;
        //        thectr = gridDocList.FindRowCellTemplateControl(e.VisibleIndex, null, "docitemlnk");
        //        //thelnk = gridDocList.FindRowTemplateControl(e.VisibleIndex, "docitemlnk");
        //        if (thectr != null)
        //        {
        //            thelnk = (HyperLink)thectr;
        //            thelnk.ID = "fileurl" + Convert.ToString(e.GetValue("PolicyDocID"));
        //            thelnk.NavigateUrl = "#";
        //            thelnk.Text = Convert.ToString(e.GetValue("DocName"));
        //            String lnkUrl = "";
        //            lnkUrl = Convert.ToString(e.GetValue("DocURL"));
        //            lnkUrl = BasePage.URLCombine(BasePage.ApplicationRoot, lnkUrl);
        //            thelnk.Attributes.Add("onclick", "hlPolicyItemTogetherClick('" + lnkUrl + "');");
        //        }

        //    }
        //}


        //protected void gridDocList_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        //{
        //    rebindGridDocList();
        //}

        //private void rebindGridDocList()
        //{
        //    this.gridDocList.DataSource = BusinessObjects.Policy.BO_PolicyDoc.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
        //    this.gridDocList.DataBind();
        //}


        #endregion Upload File  Events

    }
}
