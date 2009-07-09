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

namespace BrokerWebApp.BusinessConsult
{
    public partial class BusinessConsult : System.Web.UI.Page
    {
        #region 私有变量
        /// <summary>
        /// 咨询号
        /// </summary>
        private string _consultFeeID;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    if (this.Session["ConsultFeeGridData"] != null)
                        this.Session.Remove("ConsultFeeGridData");

                    if (Request.QueryString["ConsultFeeID"] != null && Request.QueryString["ConsultFeeID"].Trim().Length > 0)
                    {
                        this._consultFeeID = Request.QueryString["ConsultFeeID"].Trim();
                        this.ViewState["ConsultFeeID"] = this._consultFeeID;
                    }

                    this.Initialization();
                }
                else
                {
                    if (this.ViewState["ConsultFeeID"] != null && this.ViewState["ConsultFeeID"].ToString().Length > 0)
                        this._consultFeeID = this.ViewState["ConsultFeeID"].ToString();
                }

                if (String.IsNullOrEmpty(this._consultFeeID))
                {
                    if (this.Session["ConsultFeeGridData"] == null)
                        this.Session["ConsultFeeGridData"] = this.GetConsultFeeDataForGrid();
                }
                else
                {
                    if (this.Session["ConsultFeeGridData"] == null)
                        this.Session["ConsultFeeGridData"] = BusinessObjects.Consult.BO_ConsultFeeItem.GetConsultFeeItemByConsultFeeID(this._consultFeeID);
                }
                this.gridConsultFeeItem.DataSource = (DataTable)this.Session["ConsultFeeGridData"];
                this.gridConsultFeeItem.DataBind();
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 初始化控件
        /// </summary>
        private void Initialization()
        {
            if (String.IsNullOrEmpty(this._consultFeeID))
            {//没有传入咨询号, 认为是新增咨询
                //咨询日期
                this.deConsultDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
                //客户经理
                this.SetddlSalesID("");
                //制单时间
                this.deCreateTime.Text = DateTime.Today.ToString("yyyy-MM-dd");
            }
            else
            {//编辑咨询
                this.lblerrmsg.Visible = false;
                BusinessObjects.Consult.BO_ConsultFee consultFee = BusinessObjects.Consult.BO_ConsultFee.GetConsultFeeByID(this._consultFeeID);
                if (consultFee == null)
                {
                    this.lblerrmsg.InnerText = "没有咨询费信息。";
                    this.lblerrmsg.Visible = true;
                    this.dxebtnBottomSave.Enabled = false;
                    this.dxebtnSubmit.Enabled = false;
                    return;
                }

                #region 基本信息
                this.dxetxtConsultFeeNo.Text = consultFee.ConsultFeeNo;
                this.deConsultDate.Text = consultFee.ConsultDate.ToString("yyyy-MM-dd");
                this.SetddlSalesID(consultFee.SalesID);
                BO_Customer customer = BO_Customer.GetCustomerByID(consultFee.CustID);
                if (customer != null)
                {
                    this.dxetxtCustName.Text = customer.CustName;
                    this.hidCustID.Value = consultFee.CustID;
                }
                this.dxetxtContact.Text = consultFee.Contact;
                this.dxetxtTel.Text = consultFee.Tel;
                #endregion

                #region 咨询费用
                //this.gridConsultFeeItem.DataSource = BusinessObjects.Consult.BO_ConsultFeeItem.GetConsultFeeItemByConsultFeeID(this._consultFeeID);
                //this.gridConsultFeeItem.DataBind();
                this.dxetxtInvoiceNO.Text = consultFee.InvoiceNO;
                #endregion

                #region 收费信息
                this.dxetxtFeePersion.Text = consultFee.FeePersion;
                this.deFeeDate.Text = consultFee.FeeDate.ToString("yyyy-MM-dd");
                #endregion

                #region 其他
                this.dxetxtCreatePerson.Text = consultFee.CreatePerson;
                this.deCreateTime.Text = consultFee.CreateTime.ToString("yyyy-MM-dd");
                this.dxetxtAuditPerson.Text = consultFee.AuditPerson;
                this.deAuditTime.Text = consultFee.AuditTime.ToString("yyyy-MM-dd");
                #endregion
            }
        }

        private DataTable GetConsultFeeDataForGrid()
        {
            DataTable dtConsultFeeGrid = new DataTable();
            dtConsultFeeGrid.PrimaryKey = new DataColumn[] { dtConsultFeeGrid.Columns.Add("ConsultFeeItemID", typeof(String)) };
            dtConsultFeeGrid.Columns.Add("SerialNumber", typeof(Int32));
            dtConsultFeeGrid.Columns.Add("ConsultFeeItem", typeof(String));
            dtConsultFeeGrid.Columns.Add("ConsultFee", typeof(Double));

            return dtConsultFeeGrid;
        }

        /// <summary>
        /// 设置客户经理
        /// </summary>
        private void SetddlSalesID(string value)
        {
            DataSet dsList = BO_P_User.GetUserByUserID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlSalesID.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
                }
                this.dxeddlSalesID.SelectedIndex = this.dxeddlSalesID.Items.IndexOf(this.dxeddlSalesID.Items.FindByValue(value));
            }
        }

        protected void gridConsultFeeItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridConsultFeeItem.FindEditFormTemplateControl("tblgridContactItemEditorTemplate") as HtmlTable;
            string consultFeeItemID = (tblEditorTemplate.FindControl("dxetxtConsultFeeItemID") as ASPxTextBox).Text.Trim();
            if (consultFeeItemID.Length <= 0)
                throw new Exception("咨询项目编号不能为空。");

            if(!e.Keys["ConsultFeeItemID"].ToString().Equals(consultFeeItemID) &&
                BusinessObjects.Consult.BO_ConsultFeeItem.IfExistsConsultFeeItemID(consultFeeItemID))
                throw new Exception("咨询项目编号已经存在。");

            int serialNumber = Convert.ToInt32((tblEditorTemplate.FindControl("dxetxtSerialNumber") as ASPxTextBox).Text);
            string ConsultFeeItem = (tblEditorTemplate.FindControl("dxetxtConsultFeeItem") as ASPxTextBox).Text.Trim();
            double consultFee = Convert.ToDouble((tblEditorTemplate.FindControl("dxetxtConsultFee") as ASPxTextBox).Text);

            DataTable dt = (DataTable)this.Session["ConsultFeeGridData"];
            DataRow row = dt.Rows.Find(e.Keys["ConsultFeeItemID"].ToString());
            row["ConsultFeeItemID"] = consultFeeItemID;
            row["SerialNumber"] = serialNumber;
            row["ConsultFeeItem"] = ConsultFeeItem;
            row["ConsultFee"] = consultFee;

            e.Cancel = true;
            this.gridConsultFeeItem.CancelEdit();
            //this.gridConsultFeeItem.DataSource = (DataTable)this.Session["ConsultFeeGridData"];
            //this.gridConsultFeeItem.DataBind();  
        }

        protected void gridConsultFeeItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //
        }

        protected void gridConsultFeeItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridConsultFeeItem.FindEditFormTemplateControl("tblgridContactItemEditorTemplate") as HtmlTable;
            string consultFeeItemID = (tblEditorTemplate.FindControl("dxetxtConsultFeeItemID") as ASPxTextBox).Text.Trim();
            if (consultFeeItemID.Length <= 0)
                throw new Exception("咨询项目编号不能为空。");

            if (BusinessObjects.Consult.BO_ConsultFeeItem.IfExistsConsultFeeItemID(consultFeeItemID))
                throw new Exception("咨询项目编号已经存在。");

            int serialNumber = Convert.ToInt32((tblEditorTemplate.FindControl("dxetxtSerialNumber") as ASPxTextBox).Text);
            string ConsultFeeItem = (tblEditorTemplate.FindControl("dxetxtConsultFeeItem") as ASPxTextBox).Text.Trim();
            double consultFee = Convert.ToDouble((tblEditorTemplate.FindControl("dxetxtConsultFee") as ASPxTextBox).Text);

            ((DataTable)this.Session["ConsultFeeGridData"]).Rows.Add(new object[] { consultFeeItemID, serialNumber, ConsultFeeItem, consultFee });

            e.Cancel = true;
            this.gridConsultFeeItem.CancelEdit();
            //this.gridConsultFeeItem.DataSource = (DataTable)this.Session["ConsultFeeGridData"];
            //this.gridConsultFeeItem.DataBind();
        }

        protected void gridConsultFeeItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //
        }

        protected void gridConsultFeeItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DataTable dt = (DataTable)this.Session["ConsultFeeGridData"];
            DataRow row = dt.Rows.Find(e.Keys["ConsultFeeItemID"].ToString());
            dt.Rows.Remove(row);
            e.Cancel = true;
            this.gridConsultFeeItem.CancelEdit();
        }

        protected void gridConsultFeeItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
        }

        /// <summary>
        /// 保存咨询信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxebtnBottomSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(this._consultFeeID))
                {//新增咨询
                    this.lblerrmsg.Visible = false;
                    if (BusinessObjects.Consult.BO_ConsultFee.IfExistsConsultFeeNo(this.dxetxtConsultFeeNo.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "该咨询号已存在。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    if (this.Session["ConsultFeeGridData"] == null || ((DataTable)this.Session["ConsultFeeGridData"]).Rows.Count <= 0)
                    {
                        this.lblerrmsg.InnerText = "请输入咨询费用。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    //保存到咨询费
                    BusinessObjects.Consult.BO_ConsultFee consultFee = new BusinessObjects.Consult.BO_ConsultFee();
                    consultFee.ConsultFeeID = TranUtils.GetCustomerID(); //?//暂用客户编号代替
                    consultFee.ConsultFeeNo = this.dxetxtConsultFeeNo.Text.Trim();
                    consultFee.ConsultDate = Convert.ToDateTime(this.deConsultDate.Text);
                    consultFee.SalesID = this.dxeddlSalesID.SelectedItem.Value.ToString();
                    consultFee.CustID = this.hidCustID.Value;
                    consultFee.Contact = this.dxetxtContact.Text.Trim();
                    consultFee.Tel = this.dxetxtTel.Text.Trim();
                    consultFee.ConsultFee = Convert.ToDouble(((DataTable)this.Session["ConsultFeeGridData"]).Compute("sum(ConsultFee)", "1=1"));
                    consultFee.InvoiceNO = this.dxetxtInvoiceNO.Text.Trim();
                    if (this.deAuditTime.Text.Trim().Length > 0)
                        consultFee.AuditTime = Convert.ToDateTime(this.deAuditTime.Text.Trim());
                    consultFee.AuditPerson = this.dxetxtAuditPerson.Text.Trim();
                    consultFee.CreateTime = DateTime.Now;
                    consultFee.CreatePerson = this.dxetxtCreatePerson.Text.Trim();
                    consultFee.ModifyTime = DateTime.Now;
                    consultFee.ModifyPerson = "";
                    consultFee.FeeDate = Convert.ToDateTime(this.deFeeDate.Text);
                    consultFee.FeePersion = this.dxetxtFeePersion.Text.Trim();
                    consultFee.Save(ModifiedAction.Insert);

                    //保存到咨询项目
                    BusinessObjects.Consult.BO_ConsultFeeItem.ClearConsultFeeItemByConsultFeeID(consultFee.ConsultFeeID);
                    BusinessObjects.Consult.BO_ConsultFeeItem consultFeeItem = new BusinessObjects.Consult.BO_ConsultFeeItem();
                    foreach (DataRow row in ((DataTable)this.Session["ConsultFeeGridData"]).Rows)
                    {
                        consultFeeItem.ConsultFeeItemID = row["ConsultFeeItemID"].ToString();
                        consultFeeItem.ConsultFeeID = consultFee.ConsultFeeID;
                        consultFeeItem.SerialNumber = Convert.ToInt32(row["SerialNumber"]);
                        consultFeeItem.ConsultFeeItem = row["ConsultFeeItem"].ToString();
                        consultFeeItem.ConsultFee = Convert.ToDouble(row["ConsultFee"]);
                        consultFeeItem.Save(ModifiedAction.Insert);
                    }

                    this.Response.Redirect("BusinessConsult.aspx");
                }
                else
                {
                    this.lblerrmsg.Visible = false;

                    if (!BusinessObjects.Consult.BO_ConsultFee.GetConsultFeeNoByConsultFeeID(this._consultFeeID).Equals(this.dxetxtConsultFeeNo.Text.Trim()) &&
                        BusinessObjects.Consult.BO_ConsultFee.IfExistsConsultFeeNo(this.dxetxtConsultFeeNo.Text.Trim()))
                    {
                        this.lblerrmsg.InnerText = "该咨询号已存在。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    if (this.Session["ConsultFeeGridData"] == null || ((DataTable)this.Session["ConsultFeeGridData"]).Rows.Count <= 0)
                    {
                        this.lblerrmsg.InnerText = "请输入咨询费用。";
                        this.lblerrmsg.Visible = true;
                        return;
                    }

                    //保存到咨询费
                    BusinessObjects.Consult.BO_ConsultFee consultFee = new BusinessObjects.Consult.BO_ConsultFee();
                    consultFee.ConsultFeeID = this._consultFeeID;
                    consultFee.ConsultFeeNo = this.dxetxtConsultFeeNo.Text.Trim();
                    consultFee.ConsultDate = Convert.ToDateTime(this.deConsultDate.Text);
                    consultFee.SalesID = this.dxeddlSalesID.SelectedItem.Value.ToString();
                    consultFee.CustID = this.hidCustID.Value;
                    consultFee.Contact = this.dxetxtContact.Text.Trim();
                    consultFee.Tel = this.dxetxtTel.Text.Trim();
                    consultFee.ConsultFee = Convert.ToDouble(((DataTable)this.Session["ConsultFeeGridData"]).Compute("sum(ConsultFee)", "1=1"));
                    consultFee.InvoiceNO = this.dxetxtInvoiceNO.Text.Trim();
                    if (this.deAuditTime.Text.Trim().Length > 0)
                        consultFee.AuditTime = Convert.ToDateTime(this.deAuditTime.Text.Trim());
                    consultFee.AuditPerson = this.dxetxtAuditPerson.Text.Trim();
                    consultFee.CreateTime = DateTime.Now;
                    consultFee.CreatePerson = this.dxetxtCreatePerson.Text.Trim();
                    consultFee.ModifyTime = DateTime.Now;
                    consultFee.ModifyPerson = "";
                    consultFee.FeeDate = Convert.ToDateTime(this.deFeeDate.Text);
                    consultFee.FeePersion = this.dxetxtFeePersion.Text.Trim();
                    consultFee.Save(ModifiedAction.Update);

                    //保存到咨询项目
                    BusinessObjects.Consult.BO_ConsultFeeItem.ClearConsultFeeItemByConsultFeeID(this._consultFeeID);
                    BusinessObjects.Consult.BO_ConsultFeeItem consultFeeItem = new BusinessObjects.Consult.BO_ConsultFeeItem();
                    foreach (DataRow row in ((DataTable)this.Session["ConsultFeeGridData"]).Rows)
                    {
                        consultFeeItem.ConsultFeeItemID = row["ConsultFeeItemID"].ToString();
                        consultFeeItem.ConsultFeeID = this._consultFeeID;
                        consultFeeItem.SerialNumber = Convert.ToInt32(row["SerialNumber"]);
                        consultFeeItem.ConsultFeeItem = row["ConsultFeeItem"].ToString();
                        consultFeeItem.ConsultFee = Convert.ToDouble(row["ConsultFee"]);
                        consultFeeItem.Save(ModifiedAction.Insert);
                    }

                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language=\"javascript\">alert(\"修改完成。\");window.close();</script>", false);
                }
            }
            catch (Exception ex)
            { }
        }

        /// <summary>
        /// 保存审核信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxebtnSubmit_Click(object sender, EventArgs e)
        {
            
        }
    }
}
