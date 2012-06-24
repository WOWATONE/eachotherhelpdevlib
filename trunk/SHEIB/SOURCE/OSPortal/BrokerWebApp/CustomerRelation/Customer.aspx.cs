using System;
using System.IO;
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
using DevExpress.Web.ASPxGridView;
using BusinessObjects.CustomerRelation;
using DevExpress.Web.Data;

namespace BrokerWebApp.CustomerRelation
{
    public partial class Customer : BasePage
    {
        #region 私有变量
        /// <summary>
        /// 客户编号
        /// </summary>
        private string _custID;
        private string toadd = string.Empty;
        private const string UploadDirectory = "~/UploadFiles/CustomerUploadFiles/";
        private const string UploadBusDocDirectory = "~/UploadFiles/CustomerBusDocUploadFiles/";
        private const string UploadFollowDirectory = "~/UploadFiles/CustomerFollowUploadFiles/";
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    if (Request.QueryString["custID"] != null && Request.QueryString["custID"].Trim().Length > 0)
                    {
                        this._custID = Request.QueryString["custID"].Trim();
                        this.ViewState["CustID"] = this._custID;
                        btnClaimxls.NavigateUrl = "CustomerClaimToXls.aspx?custID=" + this.ViewState["CustID"];
                       //btnxls.Attributes.Add("OnClick", "window.open(CustomerClaimToXls.aspx?custID=" + this.ViewState["CustID"] + ", 'newwindow', 'height=100; width=400; top=0; left=0; toolbar=no; menubar=no; scrollbars=no; resizable=no;status=no");
                    }

                    this.Initialization();
                    CheckPermission();


                }
                else
                {
                    if (this.ViewState["CustID"] != null && this.ViewState["CustID"].ToString().Length > 0)
                        this._custID = this.ViewState["CustID"].ToString();
                }
            }
            catch (Exception ex)
            { }
        }

        private void CheckPermission()
        {
            if (!this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.Customer_List_Modify))
            {
                dxebtnBottomSave.Visible = false;
            }
        }

        /// <summary>
        /// 初始化控件
        /// </summary>
        private void Initialization()
        {
            if (String.IsNullOrEmpty(this._custID))
            {//没有传入客户编号, 认为是新增客户
                this.customerDetailTabPage.TabPages[1].Enabled = false;
                this.customerDetailTabPage.TabPages[2].Enabled = false;
                this.customerDetailTabPage.TabPages[3].Enabled = false;
                this.customerDetailTabPage.TabPages[4].Enabled = false;
                this.customerDetailTabPage.TabPages[5].Enabled = false;
                this.customerDetailTabPage.TabPages[6].Enabled = false;
                //客户编号
                //this.dxetxtCustID.Text = TranUtils.GetCustomerID();
                //所在地区
                this.SetddlArea("");
                //客户分类
                this.SetddlCustClassify("");
                //行业分类
                this.SetddlTradeType("");
                //部门
                this.SetddlDeprtment("");



                //客户经理
                //this.SetddlSalesID("");
            }
            else
            {//编辑客户
                this.lblerrmsg.Visible = false;
                BO_Customer customer = BO_Customer.GetCustomerByID(this._custID);
                if (customer == null)
                {
                    this.lblerrmsg.InnerText = "没有取得该客户信息。";
                    this.lblerrmsg.Visible = true;
                    this.dxebtnBottomSave.Enabled = false;
                    return;
                }

                #region 客户资料
                if (customer.CustTypeID == 1)
                {
                    this.radPerson.Checked = true;
                    this.radUnit.Checked = false;
                    this.lblCustType.Text = "身份证号码：";
                }
                else
                {
                    this.radPerson.Checked = true;
                    this.radUnit.Checked = true;
                    this.lblCustType.Text = "组织机构号：";
                }
                this.dxetxtCustID.Text = customer.CustID;
                this.SetddlArea(customer.Area);
                this.dxetxtCustName.Text = customer.CustName;
                this.dxetxtAddress.Text = customer.Address;
                this.SetddlCustClassify(customer.CustClassifyID);
                this.dxetxtPostCode.Text = customer.PostCode;
                this.SetddlTradeType(customer.TradeTypeID);
                this.dxetxtIDNO.Text = customer.IDNO;
                this.dxetxtContact.Text = customer.Contact;
                this.dxetxtTel.Text = customer.Tel;
                this.SetddlDeprtment(customer.DeprtmentID);
                this.dxetxtMobile.Text = customer.Mobile;
                this.SetddlSalesID(customer.DeprtmentID, customer.SalesID);
                #endregion

                #region 附加资料
                this.dxetxtMainOper.Text = customer.MainOper;
                this.dxetxtAssetSize.Text = customer.AssetSize;
                this.dxetxtMainProduct.Text = customer.MainProduct;
                this.txtBackground.Text = customer.Background;
                this.txtRisk.Text = customer.Risk;
                this.txtOtherInfo.Text = customer.OtherInfo;
                this.dxetxtRemark.Text = customer.Remark;
                this.rebindGridAddInfoDocList();
                #endregion

                #region 业务单证
                this.rebindGridBusDocList();
                #endregion

                #region 联系人
                this.gridContactItem.DataSource = BO_CustContact.GetCustContactByCustID(this._custID);
                this.gridContactItem.DataBind();
                #endregion

                #region 销售跟进
                this.gridCustomerPtItem.DataSource = BO_CustomerPtFollow.GetCustPtFollowByCustID(this._custID);
                this.gridCustomerPtItem.DataBind();
                this.rebindGridPtFollowDocList();
                #endregion

                #region 签单记录
                this.gridPolicyItem.DataSource = BusinessObjects.Policy.BO_Policy.GetCustomerPolicy(this._custID);
                this.gridPolicyItem.DataBind();
                #endregion

                #region 理赔记录
                this.gridNotifyClaimItem.DataSource = BO_NotifyClaim.GetCustContactByCustID(this._custID);
                this.gridNotifyClaimItem.DataBind();
                #endregion
            }
        }

        /// <summary>
        /// 设置所在地区
        /// </summary>
        private void SetddlArea(string value)
        {
            DataSet dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.Area.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlArea.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
                this.dxeddlArea.SelectedIndex = this.dxeddlArea.Items.IndexOf(this.dxeddlArea.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 设置客户分类
        /// </summary>
        private void SetddlCustClassify(string value)
        {
            DataSet dsList = BusinessObjects.SchemaSetting.BO_Carrier.GetCustClassifyByID("");
            if (dsList.Tables[0] != null && dsList.Tables[0].Rows.Count > 0)
            {
                this.SetCustClassify(dsList.Tables[0], "0", this.dxeddlCustClassify);
                if (!string.IsNullOrEmpty(value))
                {
                    this.dxeddlCustClassify.SelectedIndex = this.dxeddlCustClassify.Items.IndexOf(this.dxeddlCustClassify.Items.FindByValue(value));
                    if (this.dxeddlCustClassify.SelectedIndex >= 0)
                        this.dxeddlCustClassify.Text = this.dxeddlCustClassify.SelectedItem.Text.Substring(this.dxeddlCustClassify.SelectedItem.Text.IndexOf("∟") + 1);
                    this.hidCustClassify.Value = value;
                }
            }
        }

        private void SetCustClassify(DataTable table, string parentid, ASPxComboBox comboBox)
        {
            if (parentid == "0")
                this.toadd = "";
            else
                this.toadd += "   ";
            DataRow[] rows = table.Select("ParentID='" + parentid + "'", "OrderNO");
            foreach (DataRow row in rows)
            {
                comboBox.Items.Add(this.toadd + (parentid == "0" ? "" : "∟") + row["CustClassifyName"].ToString(), row["CustClassifyID"].ToString());
                this.SetCustClassify(table, row["CustClassifyID"].ToString(), comboBox);
                this.toadd = this.toadd.Substring(0, this.toadd.Length - 3);
            }
        }

        /// <summary>
        /// 设置行业分类
        /// </summary>
        private void SetddlTradeType(string value)
        {
            DataSet dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.TradeName.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlTradeType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
                this.dxeddlTradeType.SelectedIndex = this.dxeddlTradeType.Items.IndexOf(this.dxeddlTradeType.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 设置部门
        /// </summary>
        private void SetddlDeprtment(string value)
        {
            DataSet dsList = BO_P_Department.GetDeptByDeptID("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlDepartment.Items.Add(row["DeptName"].ToString().Trim(), row["DeptID"].ToString().Trim());
                }
                this.dxeddlDepartment.SelectedIndex = this.dxeddlDepartment.Items.IndexOf(this.dxeddlDepartment.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 设置客户经理
        /// </summary>
        private void SetddlSalesID(string deptID, string value)
        {
            this.dxeddlSalesID.Items.Clear();
            DataSet dsList = BO_P_User.GetUserByUserID(deptID, "");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlSalesID.Items.Add(row["UserNameCn"].ToString().Trim(), row["UserID"].ToString().Trim());
                }
                this.dxeddlSalesID.SelectedIndex = this.dxeddlSalesID.Items.IndexOf(this.dxeddlSalesID.Items.FindByValue(value));
            }
        }

        /// <summary>
        /// 保存客户信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dxebtnBottomSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (String.IsNullOrEmpty(this._custID))
                {//新增客户
                    this.lblerrmsg.Visible = false;
                    //if (BO_Customer.IfExistsCustID(this.dxetxtCustID.Text.Trim()))
                    //{
                    //    this.lblerrmsg.InnerText = "该客户编号已存在。";
                    //    this.lblerrmsg.Visible = true;
                    //    return;
                    //}
                    BO_Customer customer = new BO_Customer();
                    customer.CustID = TranUtils.GetCustomerID();
                    customer.CustName = this.dxetxtCustName.Text.Trim();
                    customer.TradeTypeID = this.dxeddlTradeType.SelectedItem.Value.ToString();
                    customer.Area = this.dxeddlArea.SelectedItem.Value.ToString();
                    customer.Address = this.dxetxtAddress.Text.Trim();
                    customer.PostCode = this.dxetxtPostCode.Text.Trim();
                    customer.CustTypeID = this.radPerson.Checked ? 1 : 0;
                    customer.DeprtmentID = this.dxeddlDepartment.SelectedItem.Value.ToString();
                    customer.SalesID = this.dxeddlSalesID.Value.ToString();
                    customer.CustClassifyID = string.IsNullOrEmpty(this.hidCustClassify.Value) ? "" : this.hidCustClassify.Value;
                    customer.Tel = this.dxetxtTel.Text.Trim();
                    customer.Mobile = this.dxetxtMobile.Text.Trim();
                    customer.IDNO = this.dxetxtIDNO.Text.Trim();
                    //customer.MainOper = this.dxetxtMainOper.Text.Trim();
                    //customer.AssetSize = this.dxetxtAssetSize.Text.Trim();
                    //customer.MainProduct = this.dxetxtMainProduct.Text.Trim();
                    //customer.Background = this.txtBackground.Text.Trim();
                    //customer.OtherInfo = this.txtOtherInfo.Text.Trim();
                    //customer.Risk = this.txtRisk.Text.Trim();
                    //customer.Remark = this.dxetxtRemark.Text.Trim();
                    customer.Contact = this.dxetxtContact.Text.Trim();
                    customer.Save(ModifiedAction.Insert);

                    Response.Redirect("Customer.aspx?CustID=" + customer.CustID, false);
                    //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language='javascript'>alert('保存成功。'); window.location.replace('Customer.aspx?CustID=" + customer.CustID + "');</script>", false);

                }
                else
                {//修改客户
                    BO_Customer customer = new BO_Customer();
                    customer.CustID = this._custID;
                    customer.CustName = this.dxetxtCustName.Text.Trim();
                    customer.TradeTypeID = this.dxeddlTradeType.SelectedItem.Value.ToString();
                    customer.Area = this.dxeddlArea.SelectedItem.Value.ToString();
                    customer.Address = this.dxetxtAddress.Text.Trim();
                    customer.PostCode = this.dxetxtPostCode.Text.Trim();
                    customer.CustTypeID = this.radPerson.Checked ? 1 : 0;
                    customer.DeprtmentID = this.dxeddlDepartment.SelectedItem.Value.ToString();
                    customer.SalesID = this.dxeddlSalesID.Value.ToString();
                    customer.CustClassifyID = string.IsNullOrEmpty(this.hidCustClassify.Value) ? "" : this.hidCustClassify.Value;
                    customer.Tel = this.dxetxtTel.Text.Trim();
                    customer.Mobile = this.dxetxtMobile.Text.Trim();
                    customer.IDNO = this.dxetxtIDNO.Text.Trim();
                    customer.MainOper = this.dxetxtMainOper.Text.Trim();
                    customer.AssetSize = this.dxetxtAssetSize.Text.Trim();
                    customer.MainProduct = this.dxetxtMainProduct.Text.Trim();
                    customer.Background = this.txtBackground.Text.Trim();
                    customer.OtherInfo = this.txtOtherInfo.Text.Trim();
                    customer.Risk = this.txtRisk.Text.Trim();
                    customer.Remark = this.dxetxtRemark.Text.Trim();
                    customer.Contact = this.dxetxtContact.Text.Trim();
                    customer.Save(ModifiedAction.Update);

                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language=\"javascript\">alert(\"修改完成。\");</script>", false);
                }
            }
            catch (Exception ex)
            {
            }
        }

        #region 客户资料
        protected void dxeddlSalesID_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            this.SetddlSalesID(e.Parameter.Trim(), "");
        }
        #endregion

        #region 附加资料
        protected void UploadControl_AddInfoUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            try
            {
                e.CallbackData = SavePostedAddInfoFiles(e.UploadedFile);
            }
            catch (Exception ex)
            {
                e.IsValid = false;
                e.ErrorText = ex.Message;
            }
        }

        protected string SavePostedAddInfoFiles(UploadedFile uploadedFile)
        {
            string ret = "";
            string folder = this._custID;
            string folderPath;
            if (uploadedFile.IsValid)
            {
                DirectoryInfo drtInfo = new DirectoryInfo(MapPath(UploadDirectory));
                if (drtInfo.Exists)
                {
                    folderPath = System.IO.Path.Combine(MapPath(UploadDirectory), folder);
                    drtInfo = new DirectoryInfo(folder);
                    FileInfo fileInfo;
                    if (drtInfo.Exists)
                    {
                        fileInfo = new FileInfo(uploadedFile.FileName);
                        string resFileName = System.IO.Path.Combine(folderPath, fileInfo.Name);
                        uploadedFile.SaveAs(resFileName);

                        //string fileLabel = fileInfo.Name;
                        //string fileType = uploadedFile.PostedFile.ContentType.ToString();
                        //string fileLength = uploadedFile.PostedFile.ContentLength / 1024 + "K";
                        //ret = string.Format("{0} <i>({1})</i> {2}|{3}", fileLabel, fileType, fileLength, fileInfo.Name);
                    }
                    else
                    {
                        //create folder
                        drtInfo = System.IO.Directory.CreateDirectory(folderPath);
                        fileInfo = new FileInfo(uploadedFile.FileName);
                        string resFileName = System.IO.Path.Combine(folderPath, fileInfo.Name);
                        uploadedFile.SaveAs(resFileName);
                    }

                    //BO_CustomerDoc
                    BusinessObjects.CustomerRelation.BO_CustomerDoc.Delete(this._custID, fileInfo.Name);
                    BusinessObjects.CustomerRelation.BO_CustomerDoc pdoc = new BusinessObjects.CustomerRelation.BO_CustomerDoc();
                    pdoc.CustDocID = Guid.NewGuid().ToString();
                    pdoc.CustID = this._custID;
                    pdoc.CustDocName = fileInfo.Name;
                    pdoc.CustURL = UploadDirectory.Replace("~", "") + folder + "/" + fileInfo.Name;
                    pdoc.Save(ModifiedAction.Insert);
                }
            }
            return ret;
        }

        protected void gridAddInfoDocList_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            rebindGridAddInfoDocList();
        }

        private void rebindGridAddInfoDocList()
        {
            this.gridAddInfoDocList.DataSource = BusinessObjects.CustomerRelation.BO_CustomerDoc.FetchListByCustomer(this._custID);
            this.gridAddInfoDocList.DataBind();
        }
        #endregion

        #region 业务单证
        protected void UploadControl_BusDocUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            try
            {
                e.CallbackData = SavePostedBusFiles(e.UploadedFile);
            }
            catch (Exception ex)
            {
                e.IsValid = false;
                e.ErrorText = ex.Message;
            }
        }

        protected string SavePostedBusFiles(UploadedFile uploadedFile)
        {
            string ret = "";
            string folder = this._custID;
            string folderPath;
            if (uploadedFile.IsValid)
            {
                DirectoryInfo drtInfo = new DirectoryInfo(MapPath(UploadBusDocDirectory));
                if (drtInfo.Exists)
                {
                    folderPath = System.IO.Path.Combine(MapPath(UploadBusDocDirectory), folder);
                    drtInfo = new DirectoryInfo(folder);
                    FileInfo fileInfo;
                    if (drtInfo.Exists)
                    {
                        fileInfo = new FileInfo(uploadedFile.FileName);
                        string resFileName = System.IO.Path.Combine(folderPath, fileInfo.Name);
                        uploadedFile.SaveAs(resFileName);

                        //string fileLabel = fileInfo.Name;
                        //string fileType = uploadedFile.PostedFile.ContentType.ToString();
                        //string fileLength = uploadedFile.PostedFile.ContentLength / 1024 + "K";
                        //ret = string.Format("{0} <i>({1})</i> {2}|{3}", fileLabel, fileType, fileLength, fileInfo.Name);
                    }
                    else
                    {
                        //create folder
                        drtInfo = System.IO.Directory.CreateDirectory(folderPath);
                        fileInfo = new FileInfo(uploadedFile.FileName);
                        string resFileName = System.IO.Path.Combine(folderPath, fileInfo.Name);
                        uploadedFile.SaveAs(resFileName);
                    }

                    //BO_CustomerDoc
                    BusinessObjects.CustomerRelation.BO_CustomerBusDoc.Delete(this._custID, fileInfo.Name);
                    BusinessObjects.CustomerRelation.BO_CustomerBusDoc pdoc = new BusinessObjects.CustomerRelation.BO_CustomerBusDoc();
                    pdoc.CustBusDocID = Guid.NewGuid().ToString();
                    pdoc.CustID = this._custID;
                    pdoc.CustBusDocName = fileInfo.Name;
                    pdoc.CustBusDocURL = UploadBusDocDirectory.Replace("~", "") + folder + "/" + fileInfo.Name;
                    pdoc.Save(ModifiedAction.Insert);
                }
            }
            return ret;
        }

        protected void gridBusDocList_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            rebindGridBusDocList();
        }

        private void rebindGridBusDocList()
        {
            this.gridBusDocList.DataSource = BusinessObjects.CustomerRelation.BO_CustomerBusDoc.FetchListByCustomer(this._custID);
            this.gridBusDocList.DataBind();
        }



        protected void gridBusDocList_HtmlRowCreated(object sender,
            ASPxGridViewTableRowEventArgs e)
        {
            //if ((e.RowType == GridViewRowType.Data) || (e.RowType == GridViewRowType.Title) || (e.RowType == GridViewRowType.Group)
            //    || (e.RowType == GridViewRowType.Preview)
            //    )
            //{
            //    e.Row.Cells[1].Attributes.Add("style", "display:none;");
            //}
            //e.Row.Cells[1].Attributes.Add("style", "display:none;");


            if (e.RowType == GridViewRowType.Data)
            {
                Control thectr;
                HyperLink thelnk;
                thectr = gridBusDocList.FindRowCellTemplateControl(e.VisibleIndex, null, "docitemlnk");

                //Control thectrID;
                //thectrID = e.Row.Cells[ e.Row.Cells[e.VisibleIndex].Controls[0];
                //thectrID.Visible = false;
                //thelnk = gridDocList.FindRowTemplateControl(e.VisibleIndex, "docitemlnk");
                if (thectr != null)
                {
                    thelnk = (HyperLink)thectr;
                    thelnk.ID = "fileurl" + Convert.ToString(e.GetValue("CustBusDocID"));
                    thelnk.NavigateUrl = "#";
                    thelnk.Text = Convert.ToString(e.GetValue("CustBusDocName"));
                    String lnkUrl = "";
                    lnkUrl = Convert.ToString(e.GetValue("CustBusDocURL"));
                    lnkUrl = BasePage.URLCombine(BasePage.ApplicationRoot, lnkUrl);
                    thelnk.Attributes.Add("onclick", "hlPolicyItemTogetherClick('" + lnkUrl + "');");
                }

            }
        }



        protected void dxeDeleteCustomerBusDocCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            string key = e.Parameter;
            e.Result = "";
            BO_CustomerBusDoc.Delete(key);

            e.Result = "ok";
        }


        protected void gridBusDocList_RowDeleting(object sender,
           ASPxDataDeletingEventArgs e)
        {
            String theID = e.Keys[0].ToString();
            object theValues = this.gridBusDocList.GetRowValuesByKeyValue(theID, new String[] { "CustBusDocID", "CustBusDocName", "CustBusDocURL", "CustID" });
            object[] theValueList = theValues as object[];
            String CustBusDocID, docName, docURL, CustID;
            if (theValueList[0] == null)
                CustBusDocID = "";
            else
                CustBusDocID = theValueList[0].ToString();

            if (theValueList[1] == null)
                docName = "";
            else
                docName = theValueList[1].ToString();

            if (theValueList[2] == null)
                docURL = "";
            else
                docURL = theValueList[2].ToString();

            if (theValueList[3] == null)
                CustID = "";
            else
                CustID = theValueList[3].ToString();

            try
            {
                string FolderPath;
                FolderPath = System.IO.Path.Combine(MapPath(UploadBusDocDirectory), CustID);
                string filePath = System.IO.Path.Combine(FolderPath, docName);

                FileInfo fi = new FileInfo(filePath);
                if (fi.Exists)
                {
                    fi.Delete();
                }
            }
            catch
            {
                //do nothing;
            }
            if (!String.IsNullOrEmpty(theID))
            {
                BO_CustomerBusDoc.Delete(theID);
            }

            e.Cancel = true;
            this.gridBusDocList.CancelEdit();

            rebindGridBusDocList();

        }
        #endregion

        #region 联系人
        protected void gridContactItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridContactItem.FindEditFormTemplateControl("tblgridContactItemEditorTemplate") as HtmlTable;
            string contactID = e.Keys["ContactID"].ToString();
            //string newContactID = (tblEditorTemplate.FindControl("dxetxtContactID") as ASPxTextBox).Text.Trim();

            //if (newContactID.Length <= 0)
            //    throw new Exception("联系人编号不能为空。");

            //if (contactID != newContactID && BO_CustContact.IfExistsContactID(newContactID))
            //    throw new Exception("联系人编号已经存在。");
            if ((tblEditorTemplate.FindControl("dxetxtContactName") as ASPxTextBox).Text.Trim().Length <= 0)
            {
                (tblEditorTemplate.FindControl("dxetxtContactName") as ASPxTextBox).Focus();
                throw new Exception("联系人姓名不能为空。");
            }

            BO_CustContact custContact = new BO_CustContact();
            custContact.ContactID = contactID;
            custContact.ContactName = (tblEditorTemplate.FindControl("dxetxtContactName") as ASPxTextBox).Text.Trim();
            custContact.CustID = this._custID;
            custContact.Position = (tblEditorTemplate.FindControl("dxetxtPosition") as ASPxTextBox).Text.Trim();
            custContact.Sex = (tblEditorTemplate.FindControl("dxeddlSex") as ASPxComboBox).SelectedItem.Value.ToString();
            custContact.Tel = (tblEditorTemplate.FindControl("dxetxtTel") as ASPxTextBox).Text.Trim();
            custContact.Fax = (tblEditorTemplate.FindControl("dxetxtFax") as ASPxTextBox).Text.Trim();
            custContact.MobilePhone = (tblEditorTemplate.FindControl("dxetxtMobilePhone") as ASPxTextBox).Text.Trim();
            custContact.Email = (tblEditorTemplate.FindControl("dxetxtEmail") as ASPxTextBox).Text.Trim();
            custContact.Interest = (tblEditorTemplate.FindControl("txtInterest") as TextBox).Text.Trim();
            custContact.Remark = (tblEditorTemplate.FindControl("txtRemark") as TextBox).Text.Trim();
            custContact.NewContactID = contactID;
            custContact.Save(ModifiedAction.Update);

            e.Cancel = true;
            this.gridContactItem.CancelEdit();
            this.gridContactItem.DataSource = BO_CustContact.GetCustContactByCustID(this._custID);
            this.gridContactItem.DataBind();
        }

        protected void gridContactItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //
        }

        protected void gridContactItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridContactItem.FindEditFormTemplateControl("tblgridContactItemEditorTemplate") as HtmlTable;
            //string contactID = (tblEditorTemplate.FindControl("dxetxtContactID") as ASPxTextBox).Text.Trim();
            //if (contactID.Length <= 0)
            //    throw new Exception("联系人编号不能为空。");

            //if (BO_CustContact.IfExistsContactID(contactID))
            //    throw new Exception("联系人编号已经存在。");
            if ((tblEditorTemplate.FindControl("dxetxtContactName") as ASPxTextBox).Text.Trim().Length <= 0)
            {
                (tblEditorTemplate.FindControl("dxetxtContactName") as ASPxTextBox).Focus();
                throw new Exception("联系人姓名不能为空。");
            }

            BO_CustContact custContact = new BO_CustContact();
            custContact.ContactID = TranUtils.GetContactID();
            custContact.ContactName = (tblEditorTemplate.FindControl("dxetxtContactName") as ASPxTextBox).Text.Trim();
            custContact.CustID = this._custID;
            custContact.Position = (tblEditorTemplate.FindControl("dxetxtPosition") as ASPxTextBox).Text.Trim();
            custContact.Sex = (tblEditorTemplate.FindControl("dxeddlSex") as ASPxComboBox).SelectedItem.Value.ToString();
            custContact.Tel = (tblEditorTemplate.FindControl("dxetxtTel") as ASPxTextBox).Text.Trim();
            custContact.Fax = (tblEditorTemplate.FindControl("dxetxtFax") as ASPxTextBox).Text.Trim();
            custContact.MobilePhone = (tblEditorTemplate.FindControl("dxetxtMobilePhone") as ASPxTextBox).Text.Trim();
            custContact.Email = (tblEditorTemplate.FindControl("dxetxtEmail") as ASPxTextBox).Text.Trim();
            custContact.Interest = (tblEditorTemplate.FindControl("txtInterest") as TextBox).Text.Trim();
            custContact.Remark = (tblEditorTemplate.FindControl("txtRemark") as TextBox).Text.Trim();
            custContact.Save(ModifiedAction.Insert);

            e.Cancel = true;
            this.gridContactItem.CancelEdit();
            this.gridContactItem.DataSource = BO_CustContact.GetCustContactByCustID(this._custID);
            this.gridContactItem.DataBind();
        }

        protected void gridContactItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //
        }

        protected void gridContactItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String contactID = e.Keys["ContactID"].ToString();
            BO_CustContact.Delete(contactID);
            e.Cancel = true;
            this.gridContactItem.CancelEdit();
            this.gridContactItem.DataSource = BO_CustContact.GetCustContactByCustID(this._custID);
            this.gridContactItem.DataBind();
        }

        protected void gridContactItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
        }
        #endregion

        #region 销售跟进
        protected void gridCustomerPtItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridCustomerPtItem.FindEditFormTemplateControl("tblgridPtFollowItemEditorTemplate") as HtmlTable;
            string followID = e.Keys["FollowID"].ToString();
            string newFollowID = (tblEditorTemplate.FindControl("dxetxtFollowID") as ASPxTextBox).Text.Trim();
            if (newFollowID.Length <= 0)
                throw new Exception("销售跟进编号不能为空。");

            if (followID != newFollowID && BO_CustomerPtFollow.IfExistsFollowID(newFollowID))
                throw new Exception("销售跟进编号已经存在。");

            BO_CustomerPtFollow customerPtFollow = new BO_CustomerPtFollow();
            customerPtFollow.FollowID = followID;
            customerPtFollow.CustID = this._custID;
            customerPtFollow.FollowType = (tblEditorTemplate.FindControl("dxeddlFollowType") as ASPxComboBox).SelectedItem.Value.ToString();
            customerPtFollow.FollowStage = (tblEditorTemplate.FindControl("dxeddlFollowStage") as ASPxComboBox).SelectedItem.Value.ToString();
            if ((tblEditorTemplate.FindControl("dxeFollowDate") as ASPxDateEdit).Text.Trim().Length > 0)
                customerPtFollow.FollowDate = Convert.ToDateTime((tblEditorTemplate.FindControl("dxeFollowDate") as ASPxDateEdit).Text.Trim());
            else
                customerPtFollow.FollowDate = DateTime.MinValue;
            customerPtFollow.FollowMemo = (tblEditorTemplate.FindControl("txtFollowMemo") as TextBox).Text.Trim();
            customerPtFollow.FollowPerson = (tblEditorTemplate.FindControl("dxetxtFollowPerson") as ASPxTextBox).Text.Trim();
            if ((tblEditorTemplate.FindControl("dxeNextFollow") as ASPxDateEdit).Text.Trim().Length > 0)
                customerPtFollow.NextFollow = Convert.ToDateTime((tblEditorTemplate.FindControl("dxeNextFollow") as ASPxDateEdit).Text.Trim());
            else
                customerPtFollow.NextFollow = DateTime.MinValue;
            customerPtFollow.NewFollowID = newFollowID;
            customerPtFollow.Save(ModifiedAction.Update);

            e.Cancel = true;
            this.gridCustomerPtItem.CancelEdit();
            this.gridCustomerPtItem.DataSource = BO_CustomerPtFollow.GetCustPtFollowByCustID(this._custID);
            this.gridCustomerPtItem.DataBind();
        }

        protected void gridCustomerPtItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //
        }

        protected void gridCustomerPtItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            HtmlTable tblEditorTemplate = this.gridCustomerPtItem.FindEditFormTemplateControl("tblgridPtFollowItemEditorTemplate") as HtmlTable;
            //string followID = (tblEditorTemplate.FindControl("dxetxtFollowID") as ASPxTextBox).Text.Trim();
            //if (followID.Length <= 0)
            //    throw new Exception("销售跟进编号不能为空。");

            //if (BO_CustomerPtFollow.IfExistsFollowID(followID))
            //    throw new Exception("销售跟进编号已经存在。");

            BO_CustomerPtFollow customerPtFollow = new BO_CustomerPtFollow();
            customerPtFollow.FollowID = TranUtils.GetFollowID();
            customerPtFollow.CustID = this._custID;
            customerPtFollow.FollowType = (tblEditorTemplate.FindControl("dxeddlFollowType") as ASPxComboBox).SelectedItem.Value.ToString();
            customerPtFollow.FollowStage = (tblEditorTemplate.FindControl("dxeddlFollowStage") as ASPxComboBox).SelectedItem.Value.ToString();
            if ((tblEditorTemplate.FindControl("dxeFollowDate") as ASPxDateEdit).Text.Trim().Length > 0)
                customerPtFollow.FollowDate = Convert.ToDateTime((tblEditorTemplate.FindControl("dxeFollowDate") as ASPxDateEdit).Text.Trim());
            else
                customerPtFollow.FollowDate = DateTime.MinValue;
            customerPtFollow.FollowMemo = (tblEditorTemplate.FindControl("txtFollowMemo") as TextBox).Text.Trim();
            customerPtFollow.FollowPerson = (tblEditorTemplate.FindControl("dxetxtFollowPerson") as ASPxTextBox).Text.Trim();
            if ((tblEditorTemplate.FindControl("dxeNextFollow") as ASPxDateEdit).Text.Trim().Length > 0)
                customerPtFollow.NextFollow = Convert.ToDateTime((tblEditorTemplate.FindControl("dxeNextFollow") as ASPxDateEdit).Text.Trim());
            else
                customerPtFollow.NextFollow = DateTime.MinValue;
            customerPtFollow.Save(ModifiedAction.Insert);

            e.Cancel = true;
            this.gridCustomerPtItem.CancelEdit();
            this.gridCustomerPtItem.DataSource = BO_CustomerPtFollow.GetCustPtFollowByCustID(this._custID);
            this.gridCustomerPtItem.DataBind();
        }

        protected void gridCustomerPtItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            //
        }

        protected void gridCustomerPtItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String followID = e.Keys["FollowID"].ToString();
            BO_CustomerPtFollow.Delete(followID);
            e.Cancel = true;
            this.gridCustomerPtItem.CancelEdit();
            this.gridCustomerPtItem.DataSource = BO_CustomerPtFollow.GetCustPtFollowByCustID(this._custID);
            this.gridCustomerPtItem.DataBind();
        }

        protected void gridCustomerPtItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //
        }

        protected void UploadControl_CustomerPTUploadControl(object sender, FileUploadCompleteEventArgs e)
        {
            try
            {
                e.CallbackData = SaveCustomerPTFiles(e.UploadedFile);
            }
            catch (Exception ex)
            {
                e.IsValid = false;
                e.ErrorText = ex.Message;
            }
        }

        protected string SaveCustomerPTFiles(UploadedFile uploadedFile)
        {
            string ret = "";
            string folder = this._custID;
            string folderPath;
            if (uploadedFile.IsValid)
            {
                DirectoryInfo drtInfo = new DirectoryInfo(MapPath(UploadFollowDirectory));
                if (drtInfo.Exists)
                {
                    folderPath = System.IO.Path.Combine(MapPath(UploadFollowDirectory), folder);
                    drtInfo = new DirectoryInfo(folder);
                    FileInfo fileInfo;
                    if (drtInfo.Exists)
                    {
                        fileInfo = new FileInfo(uploadedFile.FileName);
                        string resFileName = System.IO.Path.Combine(folderPath, fileInfo.Name);
                        uploadedFile.SaveAs(resFileName);

                        //string fileLabel = fileInfo.Name;
                        //string fileType = uploadedFile.PostedFile.ContentType.ToString();
                        //string fileLength = uploadedFile.PostedFile.ContentLength / 1024 + "K";
                        //ret = string.Format("{0} <i>({1})</i> {2}|{3}", fileLabel, fileType, fileLength, fileInfo.Name);
                    }
                    else
                    {
                        //create folder
                        drtInfo = System.IO.Directory.CreateDirectory(folderPath);
                        fileInfo = new FileInfo(uploadedFile.FileName);
                        string resFileName = System.IO.Path.Combine(folderPath, fileInfo.Name);
                        uploadedFile.SaveAs(resFileName);
                    }

                    //BO_CustomerDoc
                    BusinessObjects.CustomerRelation.BO_CustomerPtFollowDoc.Delete(this._custID, fileInfo.Name); //?//
                    BusinessObjects.CustomerRelation.BO_CustomerPtFollowDoc pdoc = new BusinessObjects.CustomerRelation.BO_CustomerPtFollowDoc();
                    pdoc.CustomerPtFollowDocID = Guid.NewGuid().ToString();
                    pdoc.FollowID = this._custID; //?//
                    pdoc.FollowDocName = fileInfo.Name;
                    pdoc.FollowDocUrl = UploadFollowDirectory.Replace("~", "") + folder + "/" + fileInfo.Name;
                    pdoc.Save(ModifiedAction.Insert);
                }
            }
            return ret;
        }

        protected void gridPtFollowDocList_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            rebindGridPtFollowDocList();
        }

        protected void gridPtFollowDocList_HtmlRowCreated(object sender,
    ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                Control thectr;
                HyperLink thelnk;
                thectr = gridPtFollowDocList.FindRowCellTemplateControl(e.VisibleIndex, null, "docitemlnk");

                if (thectr != null)
                {
                    thelnk = (HyperLink)thectr;
                    thelnk.ID = "fileurl" + Convert.ToString(e.GetValue("CustomerPtFollowDocID"));
                    thelnk.NavigateUrl = "#";
                    thelnk.Text = Convert.ToString(e.GetValue("FollowDocName"));
                    String lnkUrl = "";
                    lnkUrl = Convert.ToString(e.GetValue("FollowDocUrl"));
                    lnkUrl = BasePage.URLCombine(BasePage.ApplicationRoot, lnkUrl);
                    thelnk.Attributes.Add("onclick", "hlPolicyItemTogetherClick('" + lnkUrl + "');");
                }

            }
        }


        protected void gridPtFollowDocList_RowDeleting(object sender,
           ASPxDataDeletingEventArgs e)
        {
            String theID = e.Keys[0].ToString();
            object theValues = this.gridPtFollowDocList.GetRowValuesByKeyValue(theID, new String[] { "CustomerPtFollowDocID", "FollowDocName", "FollowDocUrl", "FollowID" });
            object[] theValueList = theValues as object[];
            String CustBusDocID, docName, docURL, CustID;
            if (theValueList[0] == null)
                CustBusDocID = "";
            else
                CustBusDocID = theValueList[0].ToString();

            if (theValueList[1] == null)
                docName = "";
            else
                docName = theValueList[1].ToString();

            if (theValueList[2] == null)
                docURL = "";
            else
                docURL = theValueList[2].ToString();

            if (theValueList[3] == null)
                CustID = "";
            else
                CustID = theValueList[3].ToString();

            try
            {
                string FolderPath;
                FolderPath = System.IO.Path.Combine(MapPath(UploadFollowDirectory), CustID);
                string filePath = System.IO.Path.Combine(FolderPath, docName);

                FileInfo fi = new FileInfo(filePath);
                if (fi.Exists)
                {
                    fi.Delete();
                }
            }
            catch
            {
                //do nothing;
            }
            if (!String.IsNullOrEmpty(theID))
            {
                BO_CustomerPtFollowDoc.Delete(theID);
            }

            e.Cancel = true;
            this.gridBusDocList.CancelEdit();

            rebindGridPtFollowDocList();

        }

        private void rebindGridPtFollowDocList()
        {
            this.gridPtFollowDocList.DataSource = BusinessObjects.CustomerRelation.BO_CustomerPtFollowDoc.FetchListByFollowID(this._custID);//?//
            this.gridPtFollowDocList.DataBind();
        }



        #endregion

        #region 签单记录
        private void GetPolicyForGrid()
        {
            //
        }
        #endregion

        /// <summary>
        /// 取得下拉列表编号
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        protected int GetSelectedIndex(object obj, string fieldName)
        {
            if (fieldName == "Sex")
            {
                if (obj == null || obj.ToString().Trim() == "" || obj.ToString() == "男")
                    return 0;
                else
                    return 1;
            }
            else if (fieldName == "FollowType")
            {
                if (obj == null || obj.ToString().Trim() == "" || obj.ToString() == "面谈")
                    return 0;
                else if (obj.ToString() == "电话")
                    return 1;
                else if (obj.ToString() == "Email")
                    return 2;
                else
                    return 3;
            }
            else if (fieldName == "FollowStage")
            {
                if (obj == null || obj.ToString().Trim() == "" || obj.ToString() == "接触")
                    return 0;
                else if (obj.ToString() == "说明")
                    return 1;
                else if (obj.ToString() == "促成")
                    return 2;
                else if (obj.ToString() == "签单")
                    return 3;
                else
                    return 4;
            }
            else
                return 0;
        }

        /// <summary>
        /// 取得日期
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        protected string GetDate(object obj)
        {
            if (obj == null || obj == DBNull.Value)
                return "";
            else
                return Convert.ToDateTime(obj).ToString("yyyy-MM-dd");
        }

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            //this.BindGrid();
            #region 理赔记录
            //this.gridNotifyClaimItem.DataSource = BO_NotifyClaim.GetCustContactByCustID(this._custID);
            //this.gridNotifyClaimItem.DataBind();
            //this.gridExport.WriteXlsToResponse();
            #endregion
            Response.Redirect("CustomerClaimToXls.aspx?custID=" + this.ViewState["CustID"]);

            //this.Response.ContentType = "application/vnd.ms-excel ";
            //this.Response.Charset = " ";
            //this.EnableViewState = false;
            //System.IO.StringWriter tw = new System.IO.StringWriter();
            //System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
            //this.gridNotifyClaimItem.RenderControl(hw);
            //this.Response.Write(tw.ToString());
            //this.Response.End(); 

            //Response.ClearContent();
            //Response.Charset = "UTF8";
            //Response.AddHeader("content-disposition", "attachment; filename=PMPM02.xls[sheel$]");
            //Response.ContentType = "application/excel";
            //Response.ContentEncoding = System.Text.Encoding.UTF7;
            //StringWriter o_sw = new StringWriter();
            //HtmlTextWriter o_htw = new HtmlTextWriter(o_sw);
            //gridNotifyClaimItem.RenderControl(o_htw);
            //Response.Write(o_sw.ToString());
            //Response.End();

        }
    }
}
