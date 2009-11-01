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
using DevExpress.Web.ASPxUploadControl;
using System.Text;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using BusinessObjects;
using BusinessObjects.SchemaSetting;
using BusinessObjects.Policy;

using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxGridView.Rendering;
using DevExpress.Web.ASPxClasses.Internal;

namespace BrokerWebApp.vehicleinsurance
{
    public partial class CarPolicyAppend: BasePage
    {


        #region Variables

        private const string inputQueryStringIDKey = "id";
        private const string inputQueryStringAskPriceidKey = "askpriceid";
        private const string UploadDirectory = "~/UploadFiles/PolicyUploadFiles/";

        private const string policyNoExist = "policynoexist";

        #endregion Variables


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack)
            {
                if (Page.IsCallback)
                {
                    rebindGridDocList(this.dxetxtPolicyID.Text.Trim());
                }
            }
            else
            {
                this.dxetxtPolicyID.Text = Page.Request.QueryString[inputQueryStringIDKey];
                                           
                                
                Initialization();

                this.dxetxtCreatePerson.Text = this.CurrentUserName;
                this.dxeCreateTime.Date = DateTime.Now;

                loadPolicyValue(this.dxetxtPolicyID.Text.Trim());
                rebindGridDocList(this.dxetxtPolicyID.Text.Trim());
            }

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            switchBasicInfoControlsEnable(false);
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


        #region CallBack Events

        protected void dxeSaveCallback_Callback(object source,
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String policystatus = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.Input).ToString();
            String theID = savePolicy(e.Parameter, policystatus);
            e.Result = theID;
        }

        #endregion CallBack Events


        #region Upload File Events


        protected void UploadControl_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            try
            {
                //
            }
            catch (Exception ex)
            {
                e.IsValid = false;
                e.ErrorText = ex.Message;
            }
        }


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
            rebindGridDocList(this.dxetxtPolicyID.Text.Trim());
        }


        private void rebindGridDocList(String id)
        {
            this.gridDocList.DataSource = BusinessObjects.Policy.BO_PolicyDoc.FetchListByPolicy(id);
            this.gridDocList.DataBind();
        }


        #endregion Upload File  Events



        #region Privates


        private void loadPolicyValue(String id)
        {
            ListEditItem theselected;
            BusinessObjects.Policy.BO_Policy obj;
            obj = new BusinessObjects.Policy.BO_Policy(id);
            if (String.IsNullOrEmpty(obj.PolicyID)) return;

            BusinessObjects.Policy.BO_CarPolicy objCar;
            objCar = new BusinessObjects.Policy.BO_CarPolicy(obj.AskPriceID);

            
            dxetxtPolicyNo.Text = obj.PolicyNo;
            dxetxtAciPolicyNo.Text = obj.AciPolicyNo;
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

            dxetxtBeneficiary.Text = obj.Beneficiary;

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

            dxeStartDate.Date = obj.StartDate;
            dxeEndDate.Date = obj.EndDate;
            dxetxtSpecial.Text = obj.Special;

            dxetxtCarNo.Text = obj.CarNo;
            dxetxtCarcaseNo.Text = obj.CarcaseNo;
            dxetxtUseCharacter.Text = obj.UseCharacter;
            dxetxtEngineNo.Text = obj.EngineNo;
            dxetxtCarUser.Text = obj.CarUser;
            dxetxtCapacity.Text = obj.Capacity;
            dxeRegisterDate.Date = obj.RegisterDate;
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

            dxetxtCreatePerson.Text = obj.CreatePersonName;
            dxeCreateTime.Date = obj.CreateTime;

        }


        private string savePolicy(String parameter, String policyState)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(CarPriceAlertInfo));
            CarPriceAlertInfo obj;

            obj = (CarPriceAlertInfo)serializer.ReadObject(ms);
            ms.Close();

            BO_Policy theObject;
            theObject = new BO_Policy(obj.PolicyID);


            //check policyno exist first
            bool checkresult;

            //check altno exist first
            checkresult = BusinessObjects.Policy.BO_Policy.CheckPolicyNoExist(obj.PolicyID, obj.PolicyNo, theObject.PrevPolicyID);
            if (checkresult) return policyNoExist;

            //check AciPolicyNo exist first
            checkresult = BusinessObjects.Policy.BO_Policy.CheckAciPolicyNoExist(obj.PolicyID, obj.AciPolicyNo, theObject.PrevPolicyID);
            if (checkresult) return policyNoExist;

            

            theObject.PolicyNo = obj.PolicyNo;
            theObject.AciPolicyNo = obj.AciPolicyNo; 
            theObject.ModifyPerson = this.CurrentUserID;
            theObject.ModifyTime = DateTime.Now;

            theObject.Save(ModifiedAction.Update);
            

            return theObject.PolicyID;

        }

        private void switchBasicInfoControlsEnable(Boolean val)
        {
            val = false;
            //dxetxtPolicyID.ReadOnly= true;
            dxetxtPolicyID.ClientEnabled = val;
            dxetxtPolicyID.DisabledStyle.ForeColor = System.Drawing.Color.LightGray;
            dxetxtPolicyID.DisabledStyle.Border.BorderColor = System.Drawing.Color.LightGray;
            
            //dxetxtPolicyNo.Enabled = val;
            //dxetxtAciPolicyNo.Enabled = val;

            dxetxtAskPriceID.ClientEnabled = val;
            dxetxtAskPriceID.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxeddlCarrierId.ClientEnabled = val;
            dxeddlCarrierId.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxeddlBranchId.ClientEnabled = val;
            dxeddlBranchId.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtCarrierSales.ClientEnabled = val;
            dxetxtCarrierSales.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtCustomer.ClientEnabled = val;
            dxetxtCustomer.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtBeneficiary.ClientEnabled = val;
            dxetxtBeneficiary.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxeddlSourceTypeID.ClientEnabled = val;
            dxeddlSourceTypeID.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxeddlDeptID.ClientEnabled = val;
            dxeddlDeptID.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxeddlSalesId.ClientEnabled = val;
            dxeddlSalesId.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxeddlGatheringType.ClientEnabled = val;
            dxeddlGatheringType.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxeddlOperationType.ClientEnabled = val;
            dxeddlOperationType.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxeStartDate.ClientEnabled = val;
            dxeStartDate.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxeEndDate.ClientEnabled = val;
            dxeEndDate.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtSpecial.ClientEnabled = val;
            dxetxtSpecial.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtCreatePerson.ClientEnabled = val;
            dxetxtCreatePerson.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxeCreateTime.ClientEnabled = val;
            dxeCreateTime.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtCarNo.ClientEnabled = val;
            dxetxtCarNo.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtCarcaseNo.ClientEnabled = val;
            dxetxtCarcaseNo.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtUseCharacter.ClientEnabled = val;
            dxetxtUseCharacter.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtEngineNo.ClientEnabled = val;
            dxetxtEngineNo.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtCarUser.ClientEnabled = val;
            dxetxtCarUser.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtCapacity.ClientEnabled = val;
            dxetxtCapacity.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxeRegisterDate.ClientEnabled = val;
            dxeRegisterDate.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtCarValue.ClientEnabled = val;
            dxetxtCarValue.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtCiPremium.ClientEnabled = val;
            dxetxtCiPremium.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtAciPremium.ClientEnabled = val;
            dxetxtAciPremium.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtCstPremium.ClientEnabled = val;
            dxetxtCstPremium.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtTotalPremium.ClientEnabled = val;
            dxetxtTotalPremium.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);


            dxetxtCiProcessRate.ClientEnabled = val;
            dxetxtCiProcessRate.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtAciProcessRate.ClientEnabled = val;
            dxetxtAciProcessRate.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtCiProcess.ClientEnabled = val;
            dxetxtCiProcess.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtAciProcess.ClientEnabled = val;
            dxetxtAciProcess.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);

            dxetxtTotalProcess.ClientEnabled = val;
            dxetxtTotalProcess.DisabledStyle.CopyFrom(dxetxtPolicyID.DisabledStyle);
            
        }


        #endregion Privates



        [DataContract(Namespace = "http://www.sheib.com")]
        public class CarPriceAlertInfo
        {
            public CarPriceAlertInfo()
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

            [DataMember]
            public string AltRemark { get; set; }

        }


    }


    



}
