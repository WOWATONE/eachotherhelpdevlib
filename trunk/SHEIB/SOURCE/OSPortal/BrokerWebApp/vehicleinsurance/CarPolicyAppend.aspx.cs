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

namespace BrokerWebApp.vehicleinsurance
{
    public partial class CarPolicyAppend: BasePage
    {


        #region Variables

        private const string inputQueryStringIDKey = "id";
        private const string inputQueryStringAskPriceidKey = "askpriceid";
        private const string UploadDirectory = "~/UploadFiles/PolicyUploadFiles/";

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


        protected void CarrierBranchIDCallback(object source,
            DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.SchemaSetting.BO_Branch.FetchListByCarrier(e.Parameter);
            thecb.TextField = "BranchName";
            thecb.ValueField = "BranchID";
            thecb.DataBind();
            thecb.Items.Insert(0, new ListEditItem("", ""));
            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }
        }


        protected void dxeddlSalesIdCallback(object source,
            DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox thecb = (ASPxComboBox)source;
            thecb.DataSource = BusinessObjects.BO_P_User.FetchDeptUserList(e.Parameter);
            thecb.TextField = "UserNameCn";
            thecb.ValueField = "UserID";
            thecb.DataBind();
            thecb.Items.Insert(0, new ListEditItem("", ""));
            if (thecb.Items.Count > 0)
            {
                thecb.SelectedItem = thecb.Items[0];
            }

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


        protected void dxeSaveAndCheckCallback_Callback(object source,
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String policystatus = Convert.ToInt32(BusinessObjects.Policy.BO_Policy.PolicyStatusEnum.AppealAudit).ToString();
            String theID = savePolicy(e.Parameter, policystatus);
            e.Result = "complete";
        }

        protected void dxeAuditBackCallback_Callback(object source,
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            e.Result = "complete";
        }

        protected void dxeAuditOkCallback_Callback(object source,
            DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            e.Result = "complete";
        }


        #endregion CallBack Events


        #region Upload File Events


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
            string policyFolder = this.dxetxtPolicyID.Text.Trim();
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
                    pdoc.PolicyID = this.dxetxtPolicyID.Text.Trim();
                    pdoc.DocURL = UploadDirectory.Replace("~", "") + policyFolder + "/" + fileInfo.Name;
                    pdoc.Save(ModifiedAction.Insert);
                }
            }

            return ret;
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

            dxetxtCiPremium.Text = obj.CiPremium.ToString();
            dxetxtAciPremium.Text = obj.AciPremium.ToString();
            dxetxtCstPremium.Text = obj.CstPremium.ToString();
            dxetxtCiProcessRate.Text = obj.CiProcessRate.ToString();
            dxetxtAciProcessRate.Text = obj.AciProcessRate.ToString();
            dxetxtCiProcess.Text = obj.CiProcess.ToString();
            dxetxtAciProcess.Text = obj.AciProcess.ToString();

            //dxetxtTotalPremium.Text = obj.;            
            //dxetxtTotalProcess.Text = obj;

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
            if (String.IsNullOrEmpty(obj.PolicyID))
            {
                theObject = new BO_Policy();
                theObject.PolicyID = TranUtils.GetPolicyID();
                theObject.AskPriceID = obj.AskPriceID;
                theObject.PolicyStatus = policyState;
                theObject.PolicyType = Convert.ToInt32(BO_Policy.PolicyTypeEnum.Vehicle).ToString();
                theObject.PolicyNo = obj.PolicyNo;

                theObject.AciPolicyNo = obj.AciPolicyNo;

                theObject.CarrierSales = obj.CarrierSales;
                theObject.CustomerID = obj.CustomerID;
                theObject.Beneficiary = obj.Beneficiary;

                theObject.DeptId = obj.DeptId;
                theObject.SalesId = obj.SalesId;

                theObject.SourceTypeID = obj.SourceTypeID;
                theObject.OperationType = obj.OperationTypeID;
                theObject.GatheringType = obj.GatheringTypeID;
                theObject.StartDate = obj.StartDate;
                theObject.EndDate = obj.EndDate;
                theObject.Special = obj.Special;
                theObject.CarNo = obj.CarNo;
                theObject.CarcaseNo = obj.CarcaseNo;
                theObject.UseCharacter = obj.UseCharacter;
                theObject.EngineNo = obj.EngineNo;
                theObject.CarUser = obj.CarUser;
                theObject.Capacity = obj.Capacity;
                theObject.RegisterDate = obj.RegisterDate;
                theObject.CarValue = obj.CarValue;
                theObject.CiPremium = obj.CiPremium;
                theObject.AciPremium = obj.AciPremium;
                theObject.CstPremium = obj.CstPremium;

                theObject.CiProcessRate = obj.CiProcessRate;
                theObject.AciProcessRate = obj.AciProcessRate;
                theObject.CiProcess = obj.CiProcess;
                theObject.AciProcess = obj.AciProcess;

                //theObject.TotalPremium = obj.TotalPremium;
                //theObject.TotalProcess = obj.TotalProcess;

                theObject.CreatePerson = this.CurrentUserID;
                theObject.CreateTime = DateTime.Now;

                theObject.Save(ModifiedAction.Insert);
            }
            else
            {
                theObject = new BO_Policy(obj.PolicyID);

                theObject.PolicyStatus = policyState;

                theObject.PolicyNo = obj.PolicyNo;

                theObject.AciPolicyNo = obj.AciPolicyNo;

                theObject.CarrierSales = obj.CarrierSales;
                theObject.CustomerID = obj.CustomerID;
                theObject.Beneficiary = obj.Beneficiary;

                theObject.DeptId = obj.DeptId;
                theObject.SalesId = obj.SalesId;

                theObject.SourceTypeID = obj.SourceTypeID;
                theObject.OperationType = obj.OperationTypeID;
                theObject.GatheringType = obj.GatheringTypeID;
                theObject.StartDate = obj.StartDate;
                theObject.EndDate = obj.EndDate;
                theObject.Special = obj.Special;
                theObject.CarNo = obj.CarNo;
                theObject.CarcaseNo = obj.CarcaseNo;
                theObject.UseCharacter = obj.UseCharacter;
                theObject.EngineNo = obj.EngineNo;
                theObject.CarUser = obj.CarUser;
                theObject.Capacity = obj.Capacity;
                theObject.RegisterDate = obj.RegisterDate;
                theObject.CarValue = obj.CarValue;
                theObject.CiPremium = obj.CiPremium;
                theObject.AciPremium = obj.AciPremium;
                theObject.CstPremium = obj.CstPremium;

                theObject.CiProcessRate = obj.CiProcessRate;
                theObject.AciProcessRate = obj.AciProcessRate;
                theObject.CiProcess = obj.CiProcess;
                theObject.AciProcess = obj.AciProcess;

                theObject.ModifyPerson = this.CurrentUserID;
                theObject.ModifyTime = DateTime.Now;

                theObject.Save(ModifiedAction.Update);
            }

            return theObject.PolicyID;

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
            dxetxtCreatePerson.Enabled = val;
            dxeCreateTime.Enabled = val;
            
            //dxetxtCiPremium.Enabled = val;
            //dxetxtAciPremium.Enabled = val;
            //dxetxtCstPremium.Enabled = val;
            //dxetxtTotalPremium.Enabled = val;
            //dxetxtCiProcessRate.Enabled = val;
            //dxetxtAciProcessRate.Enabled = val;
            //dxetxtCiProcess.Enabled = val;
            //dxetxtAciProcess.Enabled = val;
            //dxetxtTotalProcess.Enabled = val;
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


        }


    }


    



}
