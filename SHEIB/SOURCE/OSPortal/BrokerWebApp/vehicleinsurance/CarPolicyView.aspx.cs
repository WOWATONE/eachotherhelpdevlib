using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxEditors;
using System.IO;
using System.Text;
using DevExpress.Web.ASPxUploadControl;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using BusinessObjects;
using BusinessObjects.SchemaSetting;
using BusinessObjects.Policy;

namespace BrokerWebApp.vehicleinsurance
{
    public partial class CarPolicyView : BasePage
    {

        #region Variables
        
        private const string inputQueryStringIDKey = "id";
        
        private Boolean gridPolicyItemStartEdit = false;

        public enum PageMode
        {
            Input,
            Audit
        }

        private Nullable<PageMode> pm;

        private const String productType = "C00003001"; 
        #endregion Variables


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {

            this.dxetxtPolicyID.Text = Page.Request.QueryString[inputQueryStringIDKey];

            getInitPolicyData();

            Initialization();

            loadPolicyValue(this.dxetxtPolicyID.Text);
            rebindGridDocList();

            rebindGridPeriod();

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //
        }


        
        private void Initialization()
        {
            DataSet dsList;

            //dxeddlCarrierId
            List<BO_Carrier> theCarrierList = BO_Carrier.FetchList();
            this.dxeddlCarrierId.DataSource = theCarrierList;
            this.dxeddlCarrierId.ValueField = "CarrierID";
            this.dxeddlCarrierId.TextField = "CarrierNameCn";
            this.dxeddlCarrierId.DataBind();
            this.dxeddlCarrierId.Items.Insert(0, new ListEditItem("(全部)", ""));


            //dxeddlBranchId
            List<BO_Branch> theBranchList = BO_Branch.FetchList();
            this.dxeddlBranchId.DataSource = theBranchList;
            this.dxeddlBranchId.ValueField = "BranchID";
            this.dxeddlBranchId.TextField = "BranchName";
            this.dxeddlBranchId.DataBind();
            this.dxeddlBranchId.Items.Insert(0, new ListEditItem("(全部)", ""));

            //部门
            dsList = BO_P_Department.GetDeptByDeptID("");
            this.dxeddlDeptID.DataSource = dsList;
            this.dxeddlDeptID.ValueField = "DeptID";
            this.dxeddlDeptID.TextField = "DeptName";
            this.dxeddlDeptID.DataBind();
            this.dxeddlDeptID.Items.Insert(0, new ListEditItem("(全部)", ""));


            //客户经理
            dsList = BO_P_User.GetUserByUserID("");
            this.dxeddlSalesId.DataSource = dsList;
            this.dxeddlSalesId.ValueField = "UserID";
            this.dxeddlSalesId.TextField = "UserNameCn";
            this.dxeddlSalesId.DataBind();
            this.dxeddlSalesId.Items.Insert(0, new ListEditItem("(全部)", ""));

            //dxeddlSourceTypeID
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.SourceType.ToString());
            this.dxeddlSourceTypeID.DataSource = dsList;
            this.dxeddlSourceTypeID.ValueField = "CodeID";
            this.dxeddlSourceTypeID.TextField = "CodeName";
            this.dxeddlSourceTypeID.DataBind();
            this.dxeddlSourceTypeID.Items.Insert(0, new ListEditItem("(全部)", ""));

            //dxeddlOperationType
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.OperationType.ToString());
            this.dxeddlOperationType.DataSource = dsList;
            this.dxeddlOperationType.ValueField = "CodeID";
            this.dxeddlOperationType.TextField = "CodeName";
            this.dxeddlOperationType.DataBind();
            this.dxeddlOperationType.Items.Insert(0, new ListEditItem("(全部)", ""));

            //GatheringType
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.GatheringType.ToString());
            this.dxeddlGatheringType.DataSource = dsList;
            this.dxeddlGatheringType.ValueField = "CodeID";
            this.dxeddlGatheringType.TextField = "CodeName";
            this.dxeddlGatheringType.DataBind();
            this.dxeddlGatheringType.Items.Insert(0, new ListEditItem("(全部)", ""));






        }


        #endregion Page Events


        #region Tab Events


        protected void insuranceDetailTabPage_ActiveTabChanged(object source, 
            DevExpress.Web.ASPxTabControl.TabControlEventArgs e)
        {
            rebindGridDocList();
        }


        #endregion Tab Events


        #region CallBack Events


        #endregion CallBack Events



        #region gridPolicyItem Events

       
        protected void gridPolicyItem_CustomCallback(object sender,
            DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            String theParam = e.Parameters;             
            getInitPolicyData();
        }


        private void getInitPolicyData()
        {
            this.gridPolicyItem.DataSource = BusinessObjects.Policy.BO_PolicyItem.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridPolicyItem.DataBind();
        }

        private void getCallBackPolicyData()
        {
            getInitPolicyData();
        }


        #endregion gridPolicyItem Events



        #region gridPeriod Events

        protected void gridPeriod_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            rebindGridPeriod();
        }


        private void rebindGridPeriod()
        {
            this.gridPeriod.DataSource = BusinessObjects.Policy.BO_PolicyPeriod.FetchListByPolicy(this.dxetxtPolicyID.Text.Trim());
            this.gridPeriod.DataBind();
        }

        #endregion gridPeriod Events



        #region Upload File Events     

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


        private void loadPolicyValue(String id)
        {
            ListEditItem theselected;
            BusinessObjects.Policy.BO_Policy obj;
            obj = new BusinessObjects.Policy.BO_Policy(id);
            if (String.IsNullOrEmpty(obj.PolicyID))
            {
                return;
            }

            

            BusinessObjects.Policy.BO_CarPolicy objCar;
            objCar = new BusinessObjects.Policy.BO_CarPolicy(obj.AskPriceID);

            dxetxtPolicyID.Text = obj.PolicyID ;
            dxetxtPolicyNo.Text = obj.PolicyNo;
            dxetxtAciPolicyNo.Text = obj.AciPolicyNo ;
            this.dxetxtAskPriceID.Text = obj.AskPriceID;

            //dxeddlCarrierId
            if (!String.IsNullOrEmpty(objCar.CarrierID))
            {
                theselected = dxeddlCarrierId.Items.FindByValue(objCar.CarrierID);
                if (theselected != null)
                {
                    dxeddlCarrierId.SelectedItem = theselected;
                }
            }

            //dxeddlBranchId
            if (!String.IsNullOrEmpty(objCar.BranchID))
            {
                theselected = dxeddlBranchId.Items.FindByValue(objCar.BranchID);
                if (theselected != null)
                {
                    dxeddlBranchId.SelectedItem = theselected;
                }
            }


            this.dxetxtCarrierSales.Text = obj.CarrierSales;

            this.dxetxtCustomer.Text = obj.CustomerName;
            this.cusid.Value = obj.CustomerID;

            dxetxtBeneficiary.Text  = obj.Beneficiary;

            //dxeddlSourceTypeID
            if (!String.IsNullOrEmpty(obj.SourceTypeID))
            {
                theselected = dxeddlSourceTypeID.Items.FindByValue(obj.SourceTypeID);
                if (theselected != null)
                {
                    dxeddlSourceTypeID.SelectedItem = theselected;
                }
            }

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

            //dxeddlOperationType
            if (!String.IsNullOrEmpty(obj.OperationType))
            {
                theselected = dxeddlOperationType.Items.FindByValue(obj.OperationType);
                if (theselected != null)
                {
                    dxeddlOperationType.SelectedItem = theselected;
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

            dxeStartDate.Date  = obj.StartDate ;
            dxeEndDate.Date = obj.EndDate ;
            dxetxtSpecial.Text  = obj.Special ;

            dxetxtCarNo.Text = obj.CarNo;
            dxetxtCarcaseNo.Text = obj.CarcaseNo;
            dxetxtUseCharacter.Text = obj.UseCharacter;
            dxetxtEngineNo.Text = obj.EngineNo;
            dxetxtCarUser.Text = obj.CarUser;
            dxetxtCapacity.Text = obj.Capacity;
            dxeRegisterDate.Date  = obj.RegisterDate;
            dxetxtCarValue.Text = obj.CarValue;
            
            dxetxtCiPremium.Text = String.Format(BasePage.TheTwoSF, obj.CiPremium);
            dxetxtAciPremium.Text = String.Format(BasePage.TheTwoSF, obj.AciPremium);
            dxetxtCstPremium.Text = String.Format(BasePage.TheTwoSF, obj.CstPremium);
            dxetxtCiProcessRate.Text = String.Format(BasePage.TheFourSF, obj.CiProcessRate);
            dxetxtAciProcessRate.Text = String.Format(BasePage.TheFourSF, obj.AciProcessRate);
            dxetxtCiProcess.Text = String.Format(BasePage.TheTwoSF, obj.CiProcess);
            dxetxtAciProcess.Text = String.Format(BasePage.TheTwoSF, obj.AciProcess);

            dxetxtTotalPremium.Text = String.Format(BasePage.TheTwoSF, obj.Premium);
            dxetxtTotalProcess.Text = String.Format(BasePage.TheTwoSF, obj.Process);

            this.dxeAuditTime.Date = obj.AuditTime;
            this.dxetxtAuditPerson.Text = obj.AuditPerson;
            this.dxeMemo.Text = obj.Remark;
            //dxetxtTotalPremium.Text = obj.;            
            //dxetxtTotalProcess.Text = obj;

        }


        



        private void switchBasicInfoControlsEnable(Boolean val)
        {
            dxetxtPolicyID.Enabled = val;
            dxetxtPolicyNo.Enabled = val;
            dxetxtAciPolicyNo.Enabled = val;
            dxetxtAskPriceID.Enabled = val;
            dxeddlCarrierId.Enabled = val;
            dxeddlBranchId.Enabled = val;
            dxetxtCarrierSales.Enabled = val;

            dxetxtCustomer.Enabled = val;

            dxetxtBeneficiary.Enabled = val;

            dxeddlSourceTypeID.Enabled = val;
            dxeddlDeptID.Enabled = val;
            dxeddlSalesId.Enabled = val;
            dxeddlGatheringType.Enabled = val;
            dxeddlOperationType.Enabled = val;
            dxeStartDate.Enabled = val;
            dxeEndDate.Enabled = val;
            dxetxtSpecial.Enabled = val;

            dxetxtCarNo.Enabled = val;
            dxetxtCarcaseNo.Enabled = val;
            dxetxtUseCharacter.Enabled = val;
            dxetxtEngineNo.Enabled = val;
            dxetxtCarUser.Enabled = val;
            dxetxtCapacity.Enabled = val;
            dxeRegisterDate.Enabled = val;
            dxetxtCarValue.Enabled = val;

            dxetxtCiPremium.Enabled = val;
            dxetxtAciPremium.Enabled = val;
            dxetxtCstPremium.Enabled = val;
            dxetxtTotalPremium.Enabled = val;
            dxetxtCiProcessRate.Enabled = val;
            dxetxtAciProcessRate.Enabled = val;
            dxetxtCiProcess.Enabled = val;
            dxetxtAciProcess.Enabled = val;
            dxetxtTotalProcess.Enabled = val;
        }



        #endregion Privates




        [DataContract(Namespace = "http://www.sheib.com")]
        public class CarPriceInputInfo
        {
            public CarPriceInputInfo()
            { }

            [DataMember]
            public String PolicyID { get; set; }

            [DataMember]
            public String PolicyNo { get; set; }

            [DataMember]
            public String AciPolicyNo { get; set; }

            [DataMember]
            public String AskPriceID { get; set; }

            [DataMember]
            public String CarrierID { get; set; }

            [DataMember]
            public String BranchID { get; set; }

            [DataMember]
            public String CarrierSales { get; set; }

            [DataMember]
            public String CustomerID { get; set; }

            [DataMember]
            public String Beneficiary { get; set; }

            [DataMember]
            public String SourceTypeID { get; set; }

            [DataMember]
            public String DeptId { get; set; }

            [DataMember]
            public String SalesId { get; set; }

            [DataMember]
            public String GatheringTypeID { get; set; }

            [DataMember]
            public String OperationTypeID { get; set; }

            [DataMember]
            public DateTime StartDate { get; set; }

            [DataMember]
            public DateTime EndDate { get; set; }

            [DataMember]
            public String Special { get; set; }

            [DataMember]
            public String CarNo { get; set; }

            [DataMember]
            public String CarcaseNo { get; set; }

            [DataMember]
            public String UseCharacter { get; set; }

            [DataMember]
            public String EngineNo { get; set; }

            [DataMember]
            public String CarUser { get; set; }

            [DataMember]
            public String Capacity { get; set; }

            [DataMember]
            public DateTime RegisterDate { get; set; }

            [DataMember]
            public String CarValue { get; set; }

            [DataMember]
            public Decimal CiPremium { get; set; }

            [DataMember]
            public Decimal AciPremium { get; set; }

            [DataMember]
            public Decimal CstPremium { get; set; }

            [DataMember]
            public Decimal TotalPremium { get; set; }

            [DataMember]
            public Decimal CiProcessRate { get; set; }

            [DataMember]
            public Decimal AciProcessRate { get; set; }

            [DataMember]
            public Decimal CiProcess { get; set; }

            [DataMember]
            public Decimal AciProcess { get; set; }

            [DataMember]
            public Decimal TotalProcess { get; set; }

            [DataMember]
            public string Remark { get; set; }

            [DataMember]
            public Boolean AuditOrNot { get; set; }


        }



    }



}
