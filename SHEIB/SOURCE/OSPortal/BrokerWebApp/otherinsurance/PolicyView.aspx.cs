using System;
using System.IO;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using BusinessObjects;

using DevExpress.Web.ASPxGridView;

using DevExpress.Web.ASPxGridView.Rendering;
using DevExpress.Web.ASPxClasses.Internal;

namespace BrokerWebApp.otherinsurance
{
    public partial class PolicyView : BasePage
    {

        #region Variables

        private const string inputQueryStringIDKey = "id";
                
        private string toadd = string.Empty;
        private BO_NotifyClaim m_BO_NotifyClaim;
        
        #endregion Variables


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                //
            }
            else
            {
                this.dxetxtPolicyID.Text = Page.Request.QueryString[inputQueryStringIDKey];
            }


            bindDropDownLists();

            this.gridCarrier.DataSource = BusinessObjects.Policy.BO_PolicyCarrier.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridPolicyItem.DataSource = BusinessObjects.Policy.BO_PolicyItem.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridPeriod.DataSource = BusinessObjects.Policy.BO_PolicyPeriod.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridDocList.DataSource = BusinessObjects.Policy.BO_PolicyDoc.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());


            if (!IsPostBack && !IsCallback)
            { 
                if (!string.IsNullOrEmpty(this.dxetxtPolicyID.Text.Trim()))
                {
                    loadPolicyValue(this.dxetxtPolicyID.Text.Trim());
                }

            }
            else
            {
                //
            }

            notifyClaim();


        }

        protected void Page_PreRender(object sender, EventArgs e)
        {

            //
            
        }

        protected void dxeddlSalesIdCallback(object source, 
            DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(e.Parameter);
            thecb.TextField = "UserNameCn";
            thecb.ValueField = "UserID";
            thecb.DataBind();
            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }

        }


        protected void dxeGetGridPolicyItemTotalSummary_Callback(object source, 
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            object objval;
            objval = gridPolicyItem.GetTotalSummaryValue(gridPolicyItem.TotalSummary["Coverage"]);
            String Coverage = Convert.ToString(objval);
            if (Convert.IsDBNull(objval))
                Coverage = "0";
            else
                Coverage = Convert.ToString(objval);


            objval = gridPolicyItem.GetTotalSummaryValue(gridPolicyItem.TotalSummary["Premium"]);
            String Premium;
            if (Convert.IsDBNull(objval))
                Premium = "0";
            else
                Premium = Convert.ToString(objval);

            objval = gridPolicyItem.GetTotalSummaryValue(gridPolicyItem.TotalSummary["Process"]);
            String Process;
            if (Convert.IsDBNull(objval))
                Process = "0";
            else
                Process = Convert.ToString(objval); 
            

            e.Result = Coverage + ";" + Premium + ";" + Process;
        }

        #endregion Page Events


        #region Tab Events


        protected void insuranceDetailTabPage_ActiveTabChanged(object source, DevExpress.Web.ASPxTabControl.TabControlEventArgs e)
        {
            if (this.insuranceDetailTabPage.ActiveTabIndex == 1)
            {
                rebindGridDocList();
                
            }

            if (this.insuranceDetailTabPage.ActiveTabIndex == 2)
            {
                rebindGridPeriod();                
            }            
        }


        #endregion Tab Events


        #region gridPolicyItem Events

        private void rebindGridPolicyItem()
        {
            this.gridPolicyItem.DataSource = BusinessObjects.Policy.BO_PolicyItem.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridPolicyItem.DataBind();
        }

        #endregion gridPolicyItem Events


        #region gridCarrier Events

        
        private void rebindGridCarrier()
        {
            this.gridCarrier.DataSource = BusinessObjects.Policy.BO_PolicyCarrier.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridCarrier.DataBind();
        }


        #endregion gridCarrier Events


        #region gridPeriod Events
                        
        
        protected void gridPeriod_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            //
        }

        private void rebindGridPeriod()
        {
            this.gridPeriod.DataSource = BusinessObjects.Policy.BO_PolicyPeriod.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridPeriod.DataBind();
        }

        #endregion gridPeriod Events


        #region Upload File Events

        protected void gridDocList_HtmlRowCreated(object sender,
            ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                Control thectr;
                HyperLink thelnk;
                thectr = gridDocList.FindRowCellTemplateControl(e.VisibleIndex, null, "docitemlnk");
                if (thectr != null)
                {
                    thelnk = (HyperLink)thectr;
                    thelnk.ID = "fileurl" + Convert.ToString(e.GetValue("PolicyDocID"));
                    thelnk.NavigateUrl = "#";
                    thelnk.Text = Convert.ToString(e.GetValue("DocName"));
                    String lnkUrl = "";
                    lnkUrl = Convert.ToString(e.GetValue("DocURL"));
                    lnkUrl = BasePage.URLCombine(BasePage.ApplicationRoot, lnkUrl);
                    thelnk.Attributes.Add("onclick", "hlPolicyItemTogetherClick('" + lnkUrl + "');");
                }

            }
        }

        protected void gridDocList_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            rebindGridDocList();
        }

        private void rebindGridDocList()
        {
            this.gridDocList.DataSource = BusinessObjects.Policy.BO_PolicyDoc.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridDocList.DataBind();
        }


        #endregion Upload File  Events


        #region Privates

        private void bindDropDownLists()
        {
            this.dxeddlDeptID.DataSource = BusinessObjects.BO_P_Department.FetchList();
            this.dxeddlDeptID.TextField = "DeptName";
            this.dxeddlDeptID.ValueField = "DeptID";
            this.dxeddlDeptID.DataBind();

            this.dxeddlSalesId.DataSource = BusinessObjects.BO_P_User.FetchList();
            this.dxeddlSalesId.TextField = "UserNameCn";
            this.dxeddlSalesId.ValueField = "UserID";
            this.dxeddlSalesId.DataBind();

            this.dxeddlGatheringType.DataSource = BusinessObjects.BO_P_Code.GetGatheringTypeList();
            this.dxeddlGatheringType.TextField = "GatheringTypeName";
            this.dxeddlGatheringType.ValueField = "GatheringTypeID";
            this.dxeddlGatheringType.DataBind();

            this.dxeddlOperationType.DataSource = BusinessObjects.BO_P_Code.GetOperationTypeList();
            this.dxeddlOperationType.TextField = "OperationTypeName";
            this.dxeddlOperationType.ValueField = "OperationTypeID";
            this.dxeddlOperationType.DataBind();

            this.dxeddlSourceTypeID.DataSource = BusinessObjects.BO_P_Code.GetSourceTypeList();
            this.dxeddlSourceTypeID.TextField = "SourceTypeName";
            this.dxeddlSourceTypeID.ValueField = "SourceTypeID";
            this.dxeddlSourceTypeID.DataBind();

            this.dxeddlCurrency.DataSource = BusinessObjects.BO_P_Code.GetCurencyList();
            this.dxeddlCurrency.TextField = "CurrencyName";
            this.dxeddlCurrency.ValueField = "CurID";
            this.dxeddlCurrency.DataBind();

            this.BindProdTypeName();

            //DateTime.Today.ToString("yyyy-MM-dd");
        }



        private void BindProdTypeName()
        {
            DataSet dsList = BusinessObjects.SchemaSetting.BO_ProductType.GetProductTypeList();
            if (dsList.Tables[0] != null && dsList.Tables[0].Rows.Count > 0)
            {
                this.SetProdTypeName(dsList.Tables[0], "0", this.dxeddlProdTypeName);
            }
        }


        private void SetProdTypeName(DataTable table, string parentid, ASPxComboBox comboBox)
        {
            if (parentid == "0")
                this.toadd = "";
            else
                this.toadd += "   ";
            DataRow[] rows = table.Select("ParentID='" + parentid + "'", "ProdClass");
            foreach (DataRow row in rows)
            {
                comboBox.Items.Add(this.toadd + (parentid == "0" ? "" : "∟") + row["ProdTypeName"].ToString(), row["ProdTypeID"].ToString());
                this.SetProdTypeName(table, row["ProdTypeID"].ToString(), comboBox);
                this.toadd = this.toadd.Substring(0, this.toadd.Length - 3);
            }
        }


        private void SetddlProdTypeName(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                this.dxeddlProdTypeName.SelectedIndex = this.dxeddlProdTypeName.Items.IndexOf(this.dxeddlProdTypeName.Items.FindByValue(value));
                if (this.dxeddlProdTypeName.SelectedIndex >= 0)
                    this.dxeddlProdTypeName.Text = this.dxeddlProdTypeName.SelectedItem.Text.Substring(this.dxeddlProdTypeName.SelectedItem.Text.IndexOf("∟") + 1);
            }
        }



        private void loadPolicyValue(String policyID)
        {

            ListEditItem theselected;
            BusinessObjects.Policy.BO_Policy obj;

            obj = new BusinessObjects.Policy.BO_Policy(policyID);

            this.dxetxtPolicyNo.Text = obj.PolicyNo;

            if (obj.FlagTogether == 1)
            {
                dxechkTogether.Checked = true;
            }
            else
            {
                dxechkTogether.Checked = false;
            }

            if (obj.FlagReinsure == 1)
            {
                dxechkFlagReinsure.Checked = true;
            }
            else
            {
                dxechkFlagReinsure.Checked = false;
            }
                        
            this.dxeddlProdTypeName.SelectedIndex = this.dxeddlProdTypeName.Items.IndexOf(this.dxeddlProdTypeName.Items.FindByValue(obj.ProdTypeID));
            if (this.dxeddlProdTypeName.SelectedIndex >= 0)
                this.dxeddlProdTypeName.Text = this.dxeddlProdTypeName.SelectedItem.Text.Substring(this.dxeddlProdTypeName.SelectedItem.Text.IndexOf("∟") + 1);
            this.ptid.Value = obj.ProdTypeID;
            
            this.dxetxtCustomer.Text = obj.CustomerName;
            this.cusid.Value = obj.CustomerID;

            this.dxetxtBeneficiary.Text = obj.Beneficiary;

            //dxeddlDeptID
            if (!String.IsNullOrEmpty(obj.DeptId))
            {
                theselected = dxeddlDeptID.Items.FindByValue(obj.DeptId);
                if (theselected != null)
                {
                    dxeddlDeptID.SelectedItem = theselected;
                }
            }

            //dxeddlSalesId
            if (!String.IsNullOrEmpty(obj.SalesId))
            {
                theselected = dxeddlSalesId.Items.FindByValue(obj.SalesId);
                if (theselected != null)
                {
                    dxeddlSalesId.SelectedItem = theselected;
                }
            }

            //dxeddlGatheringType
            if (!String.IsNullOrEmpty(obj.GatheringType))
            {
                theselected = dxeddlGatheringType.Items.FindByValue(obj.GatheringType);
                if (theselected != null)
                {
                    dxeddlGatheringType.SelectedItem = theselected;
                }
            }

            //dxeddlOperationType
            if (!String.IsNullOrEmpty(obj.OperationType))
            {
                theselected = dxeddlOperationType.Items.FindByValue(obj.OperationType);
                if (theselected != null)
                {
                    dxeddlOperationType.SelectedItem = theselected;
                }
            }

            //dxeddlSourceTypeID
            if (!String.IsNullOrEmpty(obj.SourceTypeID))
            {
                theselected = dxeddlSourceTypeID.Items.FindByValue(obj.SourceTypeID);
                if (theselected != null)
                {
                    dxeddlSourceTypeID.SelectedItem = theselected;
                }
            }

            this.dxetxtSpecial.Text = obj.Special;

            this.dxeStartDate.Date = obj.StartDate;
            this.dxeEndDate.Date = obj.EndDate;
            this.dxetxtCreatePerson.Text = obj.CreatePersonName;

            this.dxedtCreateTime.Date = obj.CreateTime;

            this.dxetxtStage.Text = obj.PeriodTimes.ToString();


            this.dxetxtCoverage.Text = obj.Coverage.ToString();
            this.dxetxtPremiumRate.Text = obj.PremiumRate.ToString();
            this.dxetxtProcessRate.Text = obj.ProcessRate.ToString();

            //dxeddlCurrency
            if (!String.IsNullOrEmpty(obj.Currency))
            {
                theselected = dxeddlCurrency.Items.FindByValue(obj.Currency);
                if (theselected != null)
                {
                    dxeddlCurrency.SelectedItem = theselected;
                }
            }

            this.dxetxtPremium.Text = obj.Premium.ToString();
            this.dxetxtProcess.Text = obj.Process.ToString();
            this.dxetxtConversionRate.Text = obj.ConversionRate.ToString();
            this.dxetxtPremiumBase.Text = obj.PremiumBase.ToString();
            this.dxetxtProcessBase.Text = obj.ProcessBase.ToString();

            this.dxeCheckDate.Date = obj.AuditTime;
            this.dxetxtAuditPerson.Text = obj.AuditPersonName;
            this.dxeMemo.Text = obj.Remark;

            //取得结算信息            
            DataSet dsPolicyFee = BusinessObjects.Policy.BO_Policy.GetPolicyFee(policyID);
            if (dsPolicyFee !=null && dsPolicyFee.Tables.Count > 0 && dsPolicyFee.Tables[0].Rows.Count > 0)
            {
                DataTable dtFee = dsPolicyFee.Tables[0];
                DataTable dsFeeDetail = dsPolicyFee.Tables[1];
                this.dxetxtPayedFee.Text = dtFee.Rows[0]["PayedFee"].ToString();
                this.dextxtNeededPayFee.Text = dtFee.Rows[0]["NeededPayFee"].ToString();
                this.dxetxtPayinedFee.Text = dtFee.Rows[0]["PayinedFee"].ToString();
                this.dxetxtNeededPayinFee.Text = dtFee.Rows[0]["NeededPayinFee"].ToString();
                this.dxetxtPayedProc.Text = dtFee.Rows[0]["PayedProc"].ToString();
                this.dxetxtNeededPayProc.Text = dtFee.Rows[0]["NeededPayProc"].ToString();

                gridInOutBalance.DataSource = dsFeeDetail;
                gridInOutBalance.DataBind();
            }
            
        }


        #endregion Privates


        #region NotifyClaim methods

        private void notifyClaim()
        {
            //NotifyClaim
            bindNotifyClaimDropDownLists();
            if (!IsPostBack && !IsCallback)
            {
                if (!string.IsNullOrEmpty(this.dxetxtPolicyID.Text.Trim()))
                {
                    m_BO_NotifyClaim = BO_NotifyClaim.GetNotifyClaimByPolicyID(this.dxetxtPolicyID.Text.Trim());
                }
            }
            if (m_BO_NotifyClaim == null)
            {
                insuranceDetailTabPage.TabPages[5].Visible = false;
            }
            else
            {
                rebindGridTraceInfoItem(m_BO_NotifyClaim.NotifyID);
                rebindNotifyClaimGridDocList(m_BO_NotifyClaim.NotifyID);
                loadNotifyClaimValue(m_BO_NotifyClaim.NotifyID);
                insuranceDetailTabPage.TabPages[5].Visible = true;
            }
        }

        private void loadNotifyClaimValue(String notifyID)
        {

            ListEditItem theselected;
            BusinessObjects.BO_NotifyClaim notifyClaim = BusinessObjects.BO_NotifyClaim.GetNotifyClaimByNotifyID(notifyID);
            if (notifyClaim == null)
            {
                return;
            }

            dxetxtNotifyPerson.Text = notifyClaim.NotifyPerson;
            dxetxtAccidentSpot.Text = notifyClaim.AccidentSpot;
            dxedeNotifyTime.Date = notifyClaim.NotifyTime;
            dxetxtNotifyLossFee.Text = String.Format(BasePage.TheTwoSF, notifyClaim.NotifyLossFee);
            dxedeAccidentTime.Date = notifyClaim.AccidentTime;

            if (!String.IsNullOrEmpty(notifyClaim.LossType))
            {
                theselected = dxeddlLossType.Items.FindByValue(notifyClaim.LossType);
                if (theselected != null)
                {
                    dxeddlLossType.SelectedItem = theselected;
                }
            }

            //
            if (!String.IsNullOrEmpty(notifyClaim.AccidentReason))
            {
                theselected = dxeddlAccidentReason.Items.FindByValue(notifyClaim.AccidentReason);
                if (theselected != null)
                {
                    dxeddlAccidentReason.SelectedItem = theselected;
                }
            }

            dxetxtContactPhone.Text = notifyClaim.ContactPhone;
            dxetxtContactPerson.Text = notifyClaim.ContactPerson;
            dxetxtAccidentProc.Text = notifyClaim.AccidentProc;
            dxedeNotifyCarrierTime.Date = notifyClaim.NotifyCarrierTime;
            dxetxtNotifyNo.Text = notifyClaim.NotifyNo;
            dxetxtCarrierContactPerson.Text = notifyClaim.CarrierContactPerson;
            dxetxtCarrierContactPhone.Text = notifyClaim.CarrierContactPhone;
            dxedePerambulateTime.Date = notifyClaim.PerambulateTime;

            dxedeDocCompleteDate.Date = notifyClaim.DocCompleteDate;
            dxetxtLastPayFee.Text = String.Format(BasePage.TheTwoSF, notifyClaim.LastPayFee);
            dxedeLastPayDate.Date = notifyClaim.LastPayDate;
            dxedeCaseEndTime.Date = notifyClaim.CaseEndTime;

            //
            if (!String.IsNullOrEmpty(notifyClaim.CaseEndPerson))
            {
                theselected = dxeddlCaseEndPerson.Items.FindByValue(notifyClaim.CaseEndPerson);
                if (theselected != null)
                {
                    dxeddlCaseEndPerson.SelectedItem = theselected;
                }
            }

            dxetxtCreatePerson.Text = notifyClaim.CreatePerson;
            dxedeCreateDate.Date = notifyClaim.CreateDate;                    

        }


        private void setNotifyClaimData(BO_NotifyClaim notifyClaim)
        {
            ListEditItem theselected;

            notifyClaim.PolicyID = this.dxetxtPolicyID.Text;
            notifyClaim.NotifyPerson = dxetxtNotifyPerson.Text;
            notifyClaim.AccidentSpot = dxetxtAccidentSpot.Text;
            notifyClaim.NotifyTime = dxedeNotifyTime.Date;

            if (!String.IsNullOrEmpty(dxetxtNotifyLossFee.Text.Trim()))
                notifyClaim.NotifyLossFee = Convert.ToDouble(dxetxtNotifyLossFee.Text.Trim());

            notifyClaim.AccidentTime = dxedeAccidentTime.Date;

            theselected = dxeddlLossType.SelectedItem;
            if (theselected != null)
                notifyClaim.LossType = theselected.Value.ToString();


            //
            theselected = dxeddlAccidentReason.SelectedItem;
            if (theselected != null)
                notifyClaim.AccidentReason = theselected.Value.ToString();


            notifyClaim.ContactPhone = dxetxtContactPhone.Text;
            notifyClaim.ContactPerson = dxetxtContactPerson.Text;
            notifyClaim.AccidentProc = dxetxtAccidentProc.Text;
            notifyClaim.NotifyCarrierTime = dxedeNotifyCarrierTime.Date;
            notifyClaim.NotifyNo = dxetxtNotifyNo.Text;
            notifyClaim.CarrierContactPerson = dxetxtCarrierContactPerson.Text;
            notifyClaim.CarrierContactPhone = dxetxtCarrierContactPhone.Text;
            notifyClaim.PerambulateTime = dxedePerambulateTime.Date;

            notifyClaim.DocCompleteDate = dxedeDocCompleteDate.Date;

            dxetxtLastPayFee.Text = String.Format(BasePage.TheTwoSF, notifyClaim.LastPayFee);

            notifyClaim.LastPayDate = dxedeLastPayDate.Date;
            notifyClaim.CaseEndTime = dxedeCaseEndTime.Date;

            //
            theselected = dxeddlCaseEndPerson.SelectedItem;
            if (theselected != null)
                notifyClaim.CaseEndPerson = theselected.Value.ToString();

            notifyClaim.CreatePerson = this.CurrentUserID;
            notifyClaim.CreateDate = dxedeCreateDate.Date;

            notifyClaim.ModifyPerson = this.CurrentUserID;
            notifyClaim.ModifyDate = dxedeCreateDate.Date;
        }


        private void bindNotifyClaimDropDownLists()
        {

            List<BusinessObjects.BO_P_User> userList;
            if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.PolicyInput_List_Search_Group))
            {
                userList = BusinessObjects.BO_P_User.FetchDeptUserList(this.CurrentUser.DeptID);
            }
            else if (this.CurrentUser.CheckPermission(BusinessObjects.BO_P_Priv.PrivListEnum.PolicyInput_List_Search_All))
            {
                userList = BusinessObjects.BO_P_User.FetchList();
            }
            else
            {
                userList = BusinessObjects.BO_P_User.FetchList();
            }
            this.dxeddlCaseEndPerson.DataSource = userList;
            this.dxeddlCaseEndPerson.TextField = "UserNameCn";
            this.dxeddlCaseEndPerson.ValueField = "UserID";
            this.dxeddlCaseEndPerson.DataBind();
            this.dxeddlCaseEndPerson.Items.Insert(0, new ListEditItem("", ""));

            this.dxeddlLossType.DataSource = BusinessObjects.BO_NotifyClaim.GetLossTypeList();
            this.dxeddlLossType.TextField = "AccountTypeName";
            this.dxeddlLossType.ValueField = "AccountTypeID";
            this.dxeddlLossType.DataBind();
            this.dxeddlLossType.Items.Insert(0, new ListEditItem("", ""));


            this.dxeddlAccidentReason.DataSource = BusinessObjects.BO_NotifyClaim.GetAccidentReasonList();
            this.dxeddlAccidentReason.TextField = "AccountTypeName";
            this.dxeddlAccidentReason.ValueField = "AccountTypeID";
            this.dxeddlAccidentReason.DataBind();
            this.dxeddlAccidentReason.Items.Insert(0, new ListEditItem("", ""));

        }


        #region gridTraceInfoItem 
        
        private void rebindGridTraceInfoItem(String notifyID)
        {
            this.gridTraceInfoItem.DataSource = BusinessObjects.BO_NotifyClaimFollow.GetNotifyClaimFollowListByNotifyID(notifyID);
            this.gridTraceInfoItem.DataBind();
        }

        #endregion gridTraceInfoItem 

        #region NotifyClaim Upload File

        protected void gridDocList_NotifyClaim_HtmlRowCreated(object sender,
            ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                Control thectr;
                HyperLink thelnk;
                thectr = gridDocList_NotifyClaim.FindRowCellTemplateControl(e.VisibleIndex, null, "docitemlnk");
                //thelnk = gridDocList.FindRowTemplateControl(e.VisibleIndex, "docitemlnk");
                if (thectr != null)
                {
                    thelnk = (HyperLink)thectr;
                    thelnk.ID = "fileurl" + Convert.ToString(e.GetValue("NotifyClaimDocID"));
                    thelnk.NavigateUrl = "#";
                    thelnk.Text = Convert.ToString(e.GetValue("DocName"));
                    String lnkUrl = "";
                    lnkUrl = Convert.ToString(e.GetValue("DocURL"));
                    lnkUrl = BasePage.URLCombine(BasePage.ApplicationRoot, lnkUrl);
                    thelnk.Attributes.Add("onclick", "hlPolicyItemTogetherClick('" + lnkUrl + "');");
                }

            }
        }


        private void rebindNotifyClaimGridDocList(String notifyID)
        {
            this.gridDocList_NotifyClaim.DataSource = BusinessObjects.BO_NotifyClaimDoc.FetchListByNotifyID(notifyID);
            this.gridDocList_NotifyClaim.DataBind();
        }

        #endregion NotifyClaim Upload File

        #endregion NotifyClaim methods



        [DataContract(Namespace = "http://www.sheib.com")]
        public class PolicyInfo
        {
            public PolicyInfo()
            { }

            [DataMember]
            public string Beneficiary { get; set; }

            [DataMember]
            public string CarrierSales { get; set; }

            [DataMember]
            public Decimal ConversionRate { get; set; }

            [DataMember]
            public Decimal Coverage { get; set; }

            [DataMember]
            public string Currency { get; set; }
            
            [DataMember]
            public string CustomerID { get; set; }

            
            [DataMember]
            public string DeptId { get; set; }

            [DataMember]
            public DateTime EndDate { get; set; }

            [DataMember]
            public Int32 FlagReinsure { get; set; }

            [DataMember]
            public Int32 FlagTogether { get; set; }

            [DataMember]
            public string GatheringType { get; set; }

            [DataMember]
            public string OperationType { get; set; }

            [DataMember]
            public Int32 PeriodTimes { get; set; }
                        
            [DataMember]
            public string PolicyID { get; set; }
            
            [DataMember]
            public string PolicyNo { get; set; }
            
            [DataMember]
            public string PolicyStatus { get; set; }

            [DataMember]
            public Decimal Premium { get; set; }

            [DataMember]
            public Decimal PremiumBase { get; set; }

            [DataMember]
            public Decimal PremiumRate { get; set; }

            [DataMember]
            public Decimal Process { get; set; }
            
            [DataMember]
            public Decimal ProcessBase { get; set; }

            [DataMember]
            public Decimal ProcessRate { get; set; }

            [DataMember]
            public string ProdTypeID { get; set; }

            [DataMember]
            public string Remark { get; set; }
                        
             [DataMember]
            public string SalesId { get; set; }

            [DataMember]
            public DateTime SignDate { get; set; }

            [DataMember]
            public string SourceTypeID { get; set; }

            [DataMember]
            public string Special { get; set; }
            
            [DataMember]
            public DateTime StartDate { get; set; }

            [DataMember]
            public Boolean AuditOrNot { get; set; }

        }





    }

}
