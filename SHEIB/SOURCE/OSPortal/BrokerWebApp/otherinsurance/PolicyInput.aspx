<%@ Page Title="����¼��" Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="PolicyInput.aspx.cs" Inherits="BrokerWebApp.otherinsurance.PolicyInput" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel"
    TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxUploadControl"
    TagPrefix="dxuc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>����¼��</title>

    <script type="text/javascript">

        function policyCheckNessary() {
            var pid = dxetxtPolicyID.GetValueString();
            var pt = dxetxtStage.GetValueString();
            var bf = dxetxtBeneficiary.GetValueString();
            var cid = getCustomerID();
            if (isEmpty(pid) || isEmpty(pt) || isEmpty(bf) || isEmpty(cid)) {
                return true;
            }
            else {
                return false;
            }
            
        }

        function policyBaseCompleteEnable() {
            var pagemode;
            pagemode = $("#<%=pagemode.ClientID %>")[0];

            var result, panel;
            if (pagemode.value == "input") {
                result = $("#<%=npGridPolicyItemDetail.ClientID %>");
                panel = result[0];
                panel.parentElement.removeAttribute('disabled');

                result = $("#<%=npCostSummaryDetail.ClientID %>");
                panel = result[0];
                panel.parentElement.removeAttribute('disabled', 'true');

                result = $("#<%=npPolicyCompanyDetail.ClientID %>");
                panel = result[0];
                panel.parentElement.removeAttribute('disabled', 'true');

                result = $("#<%=tblNewExecuteAction.ClientID %>");
                if (result.length > 0) {
                    panel = result[0];
                    panel.parentElement.removeAttribute('disabled', 'true');
                }

                //result = $("#<%=tbltrAuditExecuteAction.ClientID %>");
                //if (result.length > 0) {
                //    panel = result[0];
                    //panel.parentElement.removeAttribute('disabled', 'true');
                //}


                insuranceDetailTabPage.tabs[1].SetEnabled(true);
                insuranceDetailTabPage.tabs[2].SetEnabled(true);
                insuranceDetailTabPage.tabs[3].SetEnabled(true);
            }
            
            //alt
            if (pagemode.value == "alt") {
                result = $("#<%=npGridPolicyItemDetail.ClientID %>");
                panel = result[0];
                panel.parentElement.removeAttribute('disabled');

                result = $("#<%=npCostSummaryDetail.ClientID %>");
                panel = result[0];
                panel.parentElement.removeAttribute('disabled', 'true');

                result = $("#<%=npPolicyCompanyDetail.ClientID %>");
                panel = result[0];
                panel.parentElement.removeAttribute('disabled', 'true');

                result = $("#<%=tblNewExecuteAction.ClientID %>");
                if (result.length > 0) {
                    panel = result[0];
                    panel.parentElement.removeAttribute('disabled', 'true');
                }

                //result = $("#<%=tbltrAuditExecuteAction.ClientID %>");
                //if (result.length > 0) {
                //    panel = result[0];
                //panel.parentElement.removeAttribute('disabled', 'true');
                //}


                insuranceDetailTabPage.tabs[1].SetEnabled(true);
                insuranceDetailTabPage.tabs[2].SetEnabled(true);
                insuranceDetailTabPage.tabs[3].SetEnabled(true);
            }
        }



        function policyBaseCompleteUnable() {

            var pagemode;
            pagemode = $("#<%=pagemode.ClientID %>")[0];
            //debugger;

            var result, panel;
            //input
            if (pagemode.value == "input") {
                if (policyCheckNessary()) {
                    result = $("#<%=npGridPolicyItemDetail.ClientID %>");
                    panel = result[0];
                    panel.parentElement.setAttribute('disabled', 'true');

                    result = $("#<%=npCostSummaryDetail.ClientID %>");
                    panel = result[0];
                    panel.parentElement.setAttribute('disabled', 'true');

                    result = $("#<%=npPolicyCompanyDetail.ClientID %>");
                    panel = result[0];
                    panel.parentElement.setAttribute('disabled', 'true');

                    result = $("#<%=tblNewExecuteAction.ClientID %>");
                    if (result.length > 0) {
                        panel = result[0];
                        panel.parentElement.setAttribute('disabled', 'true');
                    }

                    result = $("#<%=tbltrAuditExecuteAction.ClientID %>");
                    if (result.length > 0) {
                        panel = result[0];
                        panel.parentElement.setAttribute('disabled', 'true');
                    }


                    insuranceDetailTabPage.tabs[1].SetEnabled(false);
                    insuranceDetailTabPage.tabs[2].SetEnabled(false);
                    insuranceDetailTabPage.tabs[3].SetEnabled(false);
                }
                
                
            }

            //audit
            if (pagemode.value == "audit") {
                result = $("#<%=npbasicdetail.ClientID %>");
                panel = result[0];
                panel.parentElement.setAttribute('disabled', 'true');

                result = $("#<%=npGridPolicyItemDetail.ClientID %>");
                panel = result[0];
                panel.parentElement.setAttribute('disabled', 'true');

                result = $("#<%=npCostSummaryDetail.ClientID %>");
                panel = result[0];
                panel.parentElement.setAttribute('disabled', 'true');

                result = $("#<%=npPolicyCompanyDetail.ClientID %>");
                panel = result[0];
                panel.parentElement.setAttribute('disabled', 'true');

                                
            }

            //alt
            if (pagemode.value == "alt") {
                if (policyCheckNessary()) {
                    result = $("#<%=npGridPolicyItemDetail.ClientID %>");
                    panel = result[0];
                    panel.parentElement.setAttribute('disabled', 'true');

                    result = $("#<%=npCostSummaryDetail.ClientID %>");
                    panel = result[0];
                    panel.parentElement.setAttribute('disabled', 'true');

                    result = $("#<%=npPolicyCompanyDetail.ClientID %>");
                    panel = result[0];
                    panel.parentElement.setAttribute('disabled', 'true');

                    result = $("#<%=tblNewExecuteAction.ClientID %>");
                    if (result.length > 0) {
                        panel = result[0];
                        panel.parentElement.setAttribute('disabled', 'true');
                    }

                    result = $("#<%=tbltrAuditExecuteAction.ClientID %>");
                    if (result.length > 0) {
                        panel = result[0];
                        panel.parentElement.setAttribute('disabled', 'true');
                    }


                    insuranceDetailTabPage.tabs[1].SetEnabled(false);
                    insuranceDetailTabPage.tabs[2].SetEnabled(false);
                    insuranceDetailTabPage.tabs[3].SetEnabled(false);
                }

            }
               
            
        }




        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});

            //
            window.onunload = function() {
                var pWindow = window.dialogArguments;
                var thegrid = pWindow.gridSearchResult;

                if (thegrid != null) {
                    thegrid.PerformCallback('refresh');
                }
                else {
                    //do nothing
                }
            };

            policyBaseCompleteUnable();

        });

        function makePolicyJSON() {
        
            var AciPolicyNo = null;
            var AciPremium = null;
            var AciProcess = null;
            var AciProcessRate = null;
            var AltNO = null;
            var AskPriceID = null;
            var AuditPerson = null;
            var AuditTime = null;
            var BankAccount = null;
            var BankName = null;
            var Beneficiary = dxetxtBeneficiary.GetValueString();
            var Capacity = null;
            var CarNo = null;
            var CarUser = null;
            var CarValue = null;
            var CarcaseNo = null;
            var CarrierSales = null;
            var CiPremium = null;
            var CiProcess = null;
            var CiProcessRate = null;
            var ConversionRate = dxetxtConversionRate.GetValueString();
            var Coverage = dxetxtCoverage.GetValueString();
            var CreatePerson = dxetxtCreatePerson.GetValueString();
            var CreateTime = dxedtCreateTime.GetValue();
            var CstPremium = null;
            var Currency = dxeddlCurrency.GetValue();
            var CustomerID = getCustomerID();
            var DeptId = dxeddlDeptID.GetValue();
            var EndDate = dxeEndDate.GetValue();
            var EngineNo = null;
            var FlagAlt = null;
            var FlagReinsure = null;
            var FlagTogether = null;
            var GatheringType = dxeddlGatheringType.GetValue();
            var ModifyPerson = null;
            var ModifyTime = null;
            var OperationType = dxeddlOperationType.GetValue();
            var PeriodTimes = dxetxtStage.GetValueString();
            var PolicyID = dxetxtPolicyID.GetValueString();
            var PolicyNo = dxetxtPolicyNo.GetValueString();
            var PolicyStatus = null;
            var PolicyType = null;
            var Premium = dxetxtPremium.GetValueString();
            var PremiumBase = dxetxtPremiumBase.GetValueString();
            var PremiumRate = dxetxtPremiumRate.GetValueString();
            var PrevPolicyID = getPrePolicyID();
            var Process = dxetxtProcess.GetValueString();
            var ProcessBase = dxetxtProcessBase.GetValueString();
            var ProcessRate = dxetxtProcessRate.GetValueString();
            var ProdTypeID = getProductTypeID();
            var RegisterDate = null;
            var Remark = null;
            var SalesId = dxeddlSalesId.GetValue();
            var SignDate = null;
            var SourceTypeID = dxeddlSourceTypeID.GetValue();
            var Special = null;
            var StartDate = dxeStartDate.GetValue();
            var UseCharacter = null;
            var VolumnNo = null;
            var CustomerName = dxetxtCustomer.GetValueString();
            var ProdTypeName = dxetxtProdTypeName.GetValueString();
            
            

            var plc = new Policy(AciPolicyNo, AciPremium, AciProcess, AciProcessRate,
            AltNO, AskPriceID, AuditPerson, AuditTime, BankAccount,
            BankName, Beneficiary, Capacity, CarNo, CarUser,
            CarValue, CarcaseNo, CarrierSales, CiPremium, CiProcess,
            CiProcessRate, ConversionRate, Coverage, CreatePerson, CreateTime,
            CstPremium, Currency, CustomerID, DeptId, EndDate,
            EngineNo, FlagAlt, FlagReinsure, FlagTogether, GatheringType,
            ModifyPerson, ModifyTime, OperationType, PeriodTimes, PolicyID, PolicyNo,
            PolicyStatus, PolicyType, Premium, PremiumBase, PremiumRate, PrevPolicyID,
            Process, ProcessBase, ProcessRate, ProdTypeID, RegisterDate,
            Remark, SalesId, SignDate, SourceTypeID, Special,
            StartDate, UseCharacter, VolumnNo);

            //deserialize JSON string, make a JSON object
            //var jsonObject = Sys.Serialization.JavaScriptSerializer.deserialize(jsonStringServer)

            //serialize a JOSN object��make a JSON string.
            var jsonStringClient = Sys.Serialization.JavaScriptSerializer.serialize(plc);

            return jsonStringClient;
            
        }


        function dxebtntopSave_Click(s, e) {
            //
            if (s.CauseValidation()) {
                var thejsonstring = makePolicyJSON();
                dxeSaveCallback.PerformCallback(thejsonstring);
            }                        
        }

        function saveCallbackComplete(s, e) {
            //do nothing;
            policyBaseCompleteEnable();
            //
            var pid = dxetxtPolicyID.GetValueString();
            if (isEmpty(pid)) {
                dxetxtPolicyID.SetValue(e.result);
            }            
        }

        function btnAddClick(s, e) {
            var thejsonstring = makePolicyJSON();
            
            dxeAddCallback.PerformCallback(thejsonstring);
        }

        function addCallbackComplete(s, e) {
            //do nothing;
            var result = $("#hrefnewpolicy");
            var hrefPolicyNew = result[0];
            hrefPolicyNew.click();            
        }

        function btnSaveCheckClick(s, e) {
            var thejsonstring = makePolicyJSON();
            dxeSaveAndCheckCallback.PerformCallback(thejsonstring);            
        }


        function saveCheckCallbackComplete(s, e) {
            if (dxebtnBottomAdd != null) {
                dxebtnBottomAdd.SetEnabled(false);
            }
            if (dxebtnBottomSave != null) {
                dxebtnBottomSave.SetEnabled(false);
            }
            if (dxebtnBottomCheck != null) {
                dxebtnBottomCheck.SetEnabled(false);
            }
            if (dxebtnCancel != null) {
                dxebtnCancel.SetEnabled(false);
            }
            if (dxeClose != null) {
                dxeClose.SetEnabled(true);
            }
        }
        
        
        
        function btnAddCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("NewCustomer.aspx", self, myArguments);
        }


        function btnSelectCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("SelectCustomer.aspx", self, myArguments);
        }



        function GridCarrierCarrier_SelectedIndexChanged(s,e) {
            var thejsonstring = dxecbGridCarrierCarrierID.GetSelectedItem().value;
            dxecbGridCarrierBranchID.PerformCallback(thejsonstring);            
        }

        
        function gridGridProdIDChange() {
            var theValue = decbGridProdID.GetText();
            //detxtGridProdName.SetValue(theValue);
        }

        function dxeddlDeptID_SelectedIndexChanged(s, e) {
            var thejsonstring = dxeddlDeptID.GetSelectedItem().value;
            dxeddlSalesId.PerformCallback(thejsonstring);
        }

        function FileUploadStart(s, e) {
            //var refplcid = dxetxtPolicyID.GetValueString();
            //filesUploadControl;            
        }


        function FileUploaded(s, e) {
            gridDocList.PerformCallback();
        }


        function imgPolicyProdTypeClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=600px;dialogHeight=500px;center=yes;help=no";
            var retrunval = window.showModalDialog("../popupselectrefs/PolicyProdType.aspx", self, myArguments);
            if (isEmpty(retrunval)) {
                //do nothing;
            }
            else {
                //split the return value;
                var thesplit_array = retrunval.split(";");
                dxetxtProdTypeName.SetValue(thesplit_array[1]);
                setProductTypeID(thesplit_array[0]);
            }
        }


        function imgSelectCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
            var retrunval = window.showModalDialog("../popupselectrefs/PolicyCustomer.aspx", self, myArguments);
            if (isEmpty(retrunval)) {
                //do nothing;
            }
            else {
                //split the return value;
                var thesplit_array = retrunval.split(";");
                dxetxtCustomer.SetValue(thesplit_array[1]);
                dxetxtBeneficiary.SetValue(thesplit_array[1]);
                setCustomerID(thesplit_array[0]);
                //
            } 
        }

        function imgNewCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
            //window.showModalDialog("NewCustomer.aspx", self, myArguments);

        }

        function getPrePolicyID() {
            var result = $("#<%=pplcid.ClientID %>");
            var ID = result[0].value;
            return ID;
        }

        function getCustomerID() {
            var result = $("#<%=cusid.ClientID %>");
            var ID = result[0].value;
            return ID;
        }

        function setCustomerID(thevalue) {
            var result = $("#<%=cusid.ClientID %>");
            result[0].value = thevalue;
        }

        function getProductTypeID() {
            var result = $("#<%=ptid.ClientID %>");
            var ID = result[0].value;
            return ID;
        }
        function setProductTypeID(thevalue) {
            var result = $("#<%=ptid.ClientID %>");
            result[0].value = thevalue;
        }

        function getPageContentPanel() {
            var result = $("#<%=nppagecontent.ClientID %>");
            return result[0];
        }
        

        function Policy(AciPolicyNo, AciPremium, AciProcess, AciProcessRate,
        AltNO, AskPriceID, AuditPerson, AuditTime, BankAccount,
        BankName, Beneficiary, Capacity, CarNo, CarUser,
        CarValue, CarcaseNo, CarrierSales, CiPremium, CiProcess,
        CiProcessRate, ConversionRate, Coverage, CreatePerson, CreateTime,
        CstPremium, Currency, CustomerID, DeptId, EndDate,
        EngineNo, FlagAlt, FlagReinsure, FlagTogether, GatheringType,
        ModifyPerson, ModifyTime, OperationType, PeriodTimes, PolicyID, PolicyNo,
        PolicyStatus, PolicyType, Premium, PremiumBase, PremiumRate, PrevPolicyID,
        Process, ProcessBase, ProcessRate, ProdTypeID, RegisterDate,
        Remark, SalesId, SignDate, SourceTypeID, Special,
        StartDate, UseCharacter, VolumnNo) {
            if (!isEmpty(AciPolicyNo))
                this.AciPolicyNo = AciPolicyNo;

            if (!isEmpty(AciPremium))
                this.AciPremium = AciPremium;

            if (!isEmpty(AciProcess))
                this.AciProcess = AciProcess;

            if (!isEmpty(AciProcessRate))
                this.AciProcessRate = AciProcessRate;

            if (!isEmpty(AltNO))
                this.AltNO = AltNO;

            if (!isEmpty(AskPriceID))
                this.AskPriceID = AskPriceID;

            if (!isEmpty(AuditPerson))
                this.AuditPerson = AuditPerson;

            if (!isEmpty(AuditTime))
                this.AuditTime = AuditTime;

            if (!isEmpty(BankAccount))
                this.BankAccount = BankAccount;

            if (!isEmpty(BankName))
                this.BankName = BankName;

            if (!isEmpty(Beneficiary))
                this.Beneficiary = Beneficiary;

            if (!isEmpty(Capacity))
                this.Capacity = Capacity;

            if (!isEmpty(CarNo))
                this.CarNo = CarNo;

            if (!isEmpty(CarUser))
                this.CarUser = CarUser;

            if (!isEmpty(CarValue))
                this.CarValue = CarValue;

            if (!isEmpty(CarcaseNo))
                this.CarcaseNo = CarcaseNo;

            if (!isEmpty(CarrierSales))
                this.CarrierSales = CarrierSales;

            if (!isEmpty(CiPremium))
                this.CiPremium = CiPremium;

            if (!isEmpty(CiProcess))
                this.CiProcess = CiProcess;

            if (!isEmpty(CiProcessRate))
                this.CiProcessRate = CiProcessRate;

            if (!isEmpty(ConversionRate))
                this.ConversionRate = ConversionRate;

            if (!isEmpty(Coverage))
                this.Coverage = Coverage;

            if (!isEmpty(CreatePerson))
                this.CreatePerson = CreatePerson;

            if (!isEmpty(CreateTime))
                this.CreateTime = CreateTime;

            if (!isEmpty(CstPremium))
                this.CstPremium = CstPremium;

            if (!isEmpty(Currency))
                this.Currency = Currency;

            if (!isEmpty(CustomerID))
                this.CustomerID = CustomerID;

            if (!isEmpty(DeptId))
                this.DeptId = DeptId;

            if (!isEmpty(EndDate))
                this.EndDate = EndDate;

            if (!isEmpty(EngineNo))
                this.EngineNo = EngineNo;

            if (!isEmpty(FlagAlt))
                this.FlagAlt = FlagAlt;

            if (!isEmpty(FlagReinsure))
                this.FlagReinsure = FlagReinsure;

            if (!isEmpty(FlagTogether))
                this.FlagTogether = FlagTogether;

            if (!isEmpty(GatheringType))
                this.GatheringType = GatheringType;

            if (!isEmpty(ModifyPerson))
                this.ModifyPerson = ModifyPerson;

            if (!isEmpty(ModifyTime))
                this.ModifyTime = ModifyTime;

            if (!isEmpty(OperationType))
                this.OperationType = OperationType;

            if (!isEmpty(PeriodTimes))
                this.PeriodTimes = PeriodTimes;
                
            if (!isEmpty(PolicyID))
                this.PolicyID = PolicyID;

            if (!isEmpty(PolicyNo))
                this.PolicyNo = PolicyNo;

            if (!isEmpty(PolicyStatus))
                this.PolicyStatus = PolicyStatus;

            if (!isEmpty(PolicyType))
                this.PolicyType = PolicyType;

            if (!isEmpty(Premium))
                this.Premium = Premium;

            if (!isEmpty(PremiumBase))
                this.PremiumBase = PremiumBase;
                
            if (!isEmpty(PremiumRate))
                this.PremiumRate = PremiumRate;

            if (!isEmpty(PrevPolicyID))
                this.PrevPolicyID = PrevPolicyID;

            if (!isEmpty(Process))
                this.Process = Process;

            if (!isEmpty(ProcessBase))
                this.ProcessBase = ProcessBase;

            if (!isEmpty(ProcessRate))
                this.ProcessRate = ProcessRate;

            if (!isEmpty(ProdTypeID))
                this.ProdTypeID = ProdTypeID;

            if (!isEmpty(RegisterDate))
                this.RegisterDate = RegisterDate;

            if (!isEmpty(Remark))
                this.Remark = Remark;

            if (!isEmpty(SalesId))
                this.SalesId = SalesId;

            if (!isEmpty(SignDate))
                this.SignDate = SignDate;

            if (!isEmpty(SourceTypeID))
                this.SourceTypeID = SourceTypeID;

            if (!isEmpty(Special))
                this.Special = Special;

            if (!isEmpty(StartDate))
                this.StartDate = StartDate;

            if (!isEmpty(UseCharacter))
                this.UseCharacter = UseCharacter;

            if (!isEmpty(VolumnNo))
                this.VolumnNo = VolumnNo;
                
        }


        function isEmpty(testVar) {
            if ((testVar == null) || (testVar.length == 0)) {
                return true;
            } else {
                return false;
            }
        }

        function isDecimal(str) {
            if (isEmpty(str)) {
                return false;
            }
            else {
                if (/[^d.]/i.test(str)) {
                    return true;
                }
                return false;
            }
        }

        function dxeStartDate_DateChanged(s, e) {
            //http://www.w3school.com.cn/js/jsref_obj_date.asp
            var thesource = dxeStartDate.GetDate();
            var theYear = thesource.getFullYear();
            var theMonth = thesource.getMonth();
            var theDate = thesource.getDate();
            theYear = theYear + 1;
            theMonth = theMonth + 1;            
            var endDateString = theMonth.toString() + "/" + theDate.toString() + "/" + theYear.toString();
            
            dxeEndDate.SetDate(new Date(endDateString));
        }


        function btnCancelClick() {
            window.document.forms[0].reset();
            //ASPxClientEdit.ClearEditorsInContainer(null);
        }

        function btnCloseClick() {
            window.close();
        }

        function gridPolicyItem_EndCallback(s,e) {
            //sum                        
            var itemVal;
            var sumCoverageVal = 0;
            var sumPremiumVal = 0;
            var sumProcessVal = 0;
            for (i = 0; i < gridPolicyItem.pageRowCount; i++) {
                //Coverage
                itemVal = gridPolicyItem.GetDataRow(i).cells[2].innerText;
                if (isDecimal(itemVal)) {
                    sumCoverageVal = parseFloat(sumCoverageVal) + parseFloat(itemVal);
                }
                //Premium
                itemVal = gridPolicyItem.GetDataRow(i).cells[3].innerText;
                if (isDecimal(itemVal)) {
                    sumPremiumVal = parseFloat(sumPremiumVal) + parseFloat(itemVal);
                }
                //ProcRate
                itemVal = gridPolicyItem.GetDataRow(i).cells[4].innerText;
                //Process
                itemVal = gridPolicyItem.GetDataRow(i).cells[5].innerText;
                if (isDecimal(itemVal)) {
                    sumProcessVal = parseFloat(sumProcessVal) + parseFloat(itemVal);
                }
            }
            var rtn = sumCoverageVal.toFixed(2);
            dxetxtCoverage.SetValue(rtn);
            rtn = sumPremiumVal.toFixed(2);
            dxetxtPremium.SetValue(rtn);
            rtn = sumProcessVal.toFixed(2);
            dxetxtProcess.SetValue(rtn);
        }
        
        
        function policyTab_Changing(s, e) {
            //insuranceDetailTabPage
            if (e.tab.index == 2) {
                //refresh perieodtime grid
                //gridPeriod.PerformCallback();
                //var element = s.GetContentElement(e.tab.index);
                //if (element != null) element.loaded = false;                             
            }
        }

        function policyTab_Click(s, e) {
            //
        }


        function dxebtnAuditOkClick(s, e) {
            //debugger;
            var buttonID = s.GetText();
            var AuditOrNot;
            switch (buttonID) {
                case "���":
                    AuditOrNot = true;
                    break
                case "�����":
                    AuditOrNot = false;
                    break
                default:
                    //do nothing;
            }
            var Memo = dxeMemo.GetValueString();

            var plcAuditInfo = new PolicyAuditInfo(Memo, AuditOrNot);

            var jsonStringClient = Sys.Serialization.JavaScriptSerializer.serialize(plcAuditInfo);

            dxeAuditOkCallback.PerformCallback(jsonStringClient);
            
        }

        function auditOkCallbackComplete(s, e) {
            
            var buttonID = dxebtnAuditOk.GetText();
            switch (buttonID) {
                case "���":
                    dxebtnAuditOk.SetText("�����");
                    break
                case "�����":
                    dxebtnAuditOk.SetText("���");
                    break
                default:
                    //do nothing;
            }
            
        }

        function PolicyAuditInfo(Memo, AuditOrNot) {
            if (!isEmpty(Memo))
                this.Memo = Memo;

            this.AuditOrNot = AuditOrNot;
        }

        function hlPolicyItemTogetherClick(params) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
            var url = params;
            window.open(url);
        }
        
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <input type="hidden" id="pagemode" runat="server" value="" /> 
    
    <dxcb:ASPxCallback ID="dxeAddCallback" ClientInstanceName="dxeAddCallback" runat="server" OnCallback="dxeSaveCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {addCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    
    <dxcb:ASPxCallback ID="dxeSaveCallback" ClientInstanceName="dxeSaveCallback" runat="server" OnCallback="dxeSaveCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {saveCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    
    <dxcb:ASPxCallback ID="dxeSaveAndCheckCallback" ClientInstanceName="dxeSaveAndCheckCallback" runat="server" OnCallback="dxeSaveAndCheckCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {saveCheckCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    
    <dxcb:ASPxCallback ID="dxeAuditOkCallback" ClientInstanceName="dxeAuditOkCallback" runat="server" OnCallback="dxeAuditOkCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {auditOkCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    
    <asp:Panel ID="nppagecontent" runat="server">    
    
    <dxtc:ASPxPageControl ID="insuranceDetailTabPage" ClientInstanceName="insuranceDetailTabPage"
        runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%" 
        AutoPostBack="false" EnableCallBacks="true" EnableViewState="true" OnActiveTabChanged="insuranceDetailTabPage_ActiveTabChanged"
        >
        <ClientSideEvents ActiveTabChanging="function(s, e) {policyTab_Changing(s,e);}" TabClick="function(s, e) {policyTab_Click(s,e);}" />
        <TabPages>
            <dxtc:TabPage Text="������������">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width: 99%">
                            <tr>
                                <td style="width: 100%;">
                                    <asp:Panel ID="npbasicheader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                                        <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                            <div style="float: left; vertical-align: middle;">
                                                <asp:ImageButton ID="img_npbasicheader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                    AlternateText="" />
                                            </div>
                                            <div style="float: left; margin-left: 5px;">
                                                ������������</div>
                                            <div style="float: left; margin-left: 5px;">
                                                <asp:Label ID="lbl_npbasicheader" runat="server">(չ��)</asp:Label>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="npbasicdetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width: 100%">
                                            <tr style="font-size: 1px; height: 2px;">
                                                <td style="width: 70px;"></td>
                                                <td style="width: 130px;"></td>
                                                <td style="width: 25px;"></td>
                                                <td style="width: 70px;"></td>
                                                <td style="width: 130px;"></td>
                                                <td style="width: 50px;"></td>
                                                <td style="width: 70px"></td>
                                                <td style="width: 195px;"></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">Ͷ�����ţ�</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server" Width="125px" ReadOnly="true">
                                                        
                                                    </dxe:ASPxTextBox> 
                                                    <input type="hidden" id="pplcid" runat="server" />                                                   
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">������ţ�</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server" Width="125px"></dxe:ASPxTextBox>
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">
                                                    <dxe:ASPxCheckBox runat="server" ID="dxechkTogether" ClientInstanceName="dxechkTogether" Text="����"></dxe:ASPxCheckBox>
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxCheckBox runat="server" ID="dxechkFlagReinsure" ClientInstanceName="dxechkFlagReinsure" Text="�ٱ�"></dxe:ASPxCheckBox>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">�������֣�</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtProdTypeName" ClientInstanceName="dxetxtProdTypeName" runat="server" Width="125px" ReadOnly="true">
                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="������" CausesValidation="true" ValidationGroup="BaseGroup">
                                                            <RequiredField IsRequired="true" ErrorText="������" />
                                                        </ValidationSettings>
                                                    </dxe:ASPxTextBox>
                                                    <input type="hidden" id="ptid" runat="server" />
                                                </td>
                                                <td style="text-align: left;">
                                                    <img runat="server" id="img1" alt="" src="../images/searchicon9.png" style="width: 20px;
                                                        height: 20px; vertical-align: top;" onclick="imgPolicyProdTypeClick();" />
                                                </td>
                                                <td style="text-align: right;">Ͷ���ˣ�</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtCustomer" ClientInstanceName="dxetxtCustomer" runat="server" Width="125px"></dxe:ASPxTextBox>
                                                    <input type="hidden" id="cusid" runat="server" />
                                                </td>
                                                <td style="text-align: left;">
                                                    <img runat="server" id="imgNewCustomer" onclick="imgNewCustomerClick();" alt="" src="../images/add_user_icon.png"
                                                        style="width: 20px; height: 20px; vertical-align: top;" />
                                                    <img runat="server" id="imgSelectCustomer" onclick="imgSelectCustomerClick();" alt=""
                                                        src="../images/searchicon9.png" style="width: 20px; height: 20px; vertical-align: top;" />
                                                </td>
                                                <td style="text-align: right;">�������ˣ�</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtBeneficiary" ClientInstanceName="dxetxtBeneficiary" runat="server" Width="125px"></dxe:ASPxTextBox>                                                    
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">���ţ�</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server" Width="125px" DropDownStyle="DropDownList">
															<Items>
															</Items>
															<ClientSideEvents SelectedIndexChanged="dxeddlDeptID_SelectedIndexChanged" />
													</dxe:ASPxComboBox>
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">�ͻ�����</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server" Width="125px" DropDownStyle="DropDownList"
                                                    OnCallback="dxeddlSalesIdCallback">
															<Items>
															</Items>
													</dxe:ASPxComboBox>
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">�տʽ��</td>
                                                <td style="text-align: left;">                                                    
                                                    <dxe:ASPxComboBox ID="dxeddlGatheringType" ClientInstanceName="dxeddlGatheringType" runat="server" Width="125px" DropDownStyle="DropDownList">
															<Items>
																<dxe:ListEditItem Text="(ȫ��)" Value="" />
															</Items>
														</dxe:ASPxComboBox>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">ҵ�����ʣ�</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlOperationType" ClientInstanceName="dxeddlOperationType" runat="server" Width="125px" DropDownStyle="DropDownList">
															<Items>
																<dxe:ListEditItem Text="(ȫ��)" Value="" />
															</Items>
														</dxe:ASPxComboBox>
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">ҵ����Դ��</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlSourceTypeID" ClientInstanceName="dxeddlSourceTypeID" runat="server" Width="125px" DropDownStyle="DropDownList">
															<Items>
																<dxe:ListEditItem Text="(ȫ��)" Value="" />
															</Items>
														</dxe:ASPxComboBox>
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">�������ޣ�</td>
                                                <td>
                                                    <table style="margin-left:-3px;">
                                                        <tr>
                                                            <td>
                                                                <dxe:ASPxDateEdit ID="dxeStartDate" ClientInstanceName="dxeStartDate" runat="server" Width="95px">
                                                                    <ClientSideEvents DateChanged="function(s, e) { dxeStartDate_DateChanged(s,e); }" />                                                                    
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                            <td>
                                                                ��
                                                            </td>
                                                            <td>
                                                                <dxe:ASPxDateEdit ID="dxeEndDate" ClientInstanceName="dxeEndDate" runat="server" Width="95px">
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">¼���ˣ�</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtCreatePerson" ClientInstanceName="dxetxtCreatePerson" runat="server" Width="125px" ReadOnly="true"></dxe:ASPxTextBox>
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">¼�����ڣ�</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxDateEdit ID="dxedtCreateTime" ClientInstanceName="dxedtCreateTime" runat="server" Width="100px">
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">�ɷѴ�����</td>
                                                <td style="text-align: left;">
                                                    <table style="margin-left:-3px;">
                                                        <tr>
                                                            <td style="width:120px;text-align: left;">
                                                            <dxe:ASPxTextBox ID="dxetxtStage" ClientInstanceName="dxetxtStage" runat="server" Width="125px">
                                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="��ʽ����" CausesValidation="true" ValidationGroup="BaseGroup">
                                                                    <RegularExpression ValidationExpression="^\d+(\d+)?" ErrorText="��ʽ����" />
                                                                    <RequiredField IsRequired="true" ErrorText="������" />
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="width:10px;text-align: left;"></td>
                                                            <td style="text-align: left;">
                                                            <dxe:ASPxButton runat="server" id="dxebtntopSave" ClientInstanceName="dxebtntopSave" Text="����" CausesValidation="true" ValidationGroup="BaseGroup" AutoPostBack="false">
                                                                <ClientSideEvents Click="function(s, e) { dxebtntopSave_Click(s,e); }"></ClientSideEvents>
                                                            </dxe:ASPxButton>
                                                            </td>
                                                        </tr>
                                                    </table>                                                    
                                                </td>
                                                <td style="text-align: left;"></td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <ajaxToolkit:CollapsiblePanelExtender ID="cpeBasic" runat="Server" TargetControlID="npbasicdetail"
                                        ExpandControlID="npbasicheader" CollapseControlID="npbasicheader" Collapsed="false"
                                        TextLabelID="lbl_npbasicheader" ImageControlID="img_npbasicheader" ExpandedText="(չ��)"
                                        CollapsedText="(����)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                                        SuppressPostBack="true" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%;">
                                    <asp:Panel ID="npGridPolicyItemHeader" runat="server" CssClass="collapsePanelHeader"
                                        Height="25px">
                                        <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                            <div style="float: left; vertical-align: middle;">
                                                <asp:ImageButton ID="img_npGridPolicyItem" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                    AlternateText="" />
                                            </div>
                                            <div style="float: left; margin-left: 5px;">
                                                ������Ŀ</div>
                                            <div style="float: left; margin-left: 5px;">
                                                <asp:Label ID="lbl_npGridPolicyItem" runat="server">(չ��)</asp:Label>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="npGridPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="text-align: right;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server"
                                                        KeyFieldName="ItemID" Width="100%" AutoGenerateColumns="False" 
                                                        OnRowInserting="gridPolicyItem_RowInserting" OnRowInserted="gridPolicyItem_RowInserted"
                                                        OnRowUpdating="gridPolicyItem_RowUpdating" OnRowUpdated="gridPolicyItem_RowUpdated"
                                                        OnRowDeleting="gridPolicyItem_RowDeleting" OnStartRowEditing="gridPolicyItem_StartRowEditing"
                                                        OnHtmlEditFormCreated="gridPolicyItem_HtmlEditFormCreated" OnRowValidating="gridPolicyItem_RowValidating"
                                                        OnRowDeleted="gridPolicyItem_RowDeleted">
                                                        <%-- BeginRegion Columns --%>
                                                        <Columns>
                                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left"
                                                                Width="81" AllowDragDrop="false">
                                                                <NewButton Visible="True" />
                                                                <EditButton Visible="true" />
                                                                <DeleteButton Visible="true" />
                                                            </dxwgv:GridViewCommandColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="ProdName" Caption="��Ŀ����" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Coverage" Caption="����" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Premium" Caption="����" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="ProcRate" Caption="���ͷ���(%)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Process" Caption="���ͷ�" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="ItemID" Caption="ItemID" CellStyle-Wrap="False" Visible="false">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="PolicyId" Caption="PolicyId" CellStyle-Wrap="False" Visible="false">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="ProdID" Caption="ProdID" CellStyle-Wrap="False" Visible="false">
                                                            </dxwgv:GridViewDataColumn>
                                                        </Columns>
                                                        <Settings ShowGroupPanel="false" ShowFooter="True" ShowGroupFooter="VisibleAlways" />
                                                        <TotalSummary>
                                                            <dxwgv:ASPxSummaryItem FieldName="ProdName" SummaryType="Count" DisplayFormat="����:#" />
                                                            <dxwgv:ASPxSummaryItem FieldName="Coverage" SummaryType="Sum" DisplayFormat="c" />
                                                            <dxwgv:ASPxSummaryItem FieldName="Premium" SummaryType="Sum" DisplayFormat="c" />
                                                            <dxwgv:ASPxSummaryItem FieldName="ProcRate" SummaryType="Average" DisplayFormat="n" />
                                                            <dxwgv:ASPxSummaryItem FieldName="Process" SummaryType="Sum" DisplayFormat="c" />
                                                        </TotalSummary>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <ClientSideEvents EndCallback="function(s, e) {gridPolicyItem_EndCallback();}" />
                                                        <Templates>
                                                            <EditForm>
                                                                <div style="padding: 4px 4px 3px 4px">
                                                                    <table style="width: 90%;" runat="server" id="tblgridPolicyItemEditorTemplate">
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                ��Ŀ����:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxComboBox runat="server" ID="dxecbGridPolicyItemProdID" AutoPostBack="false" ClientInstanceName="dxecbGridPolicyItemProdID"
                                                                                    DropDownButton-Enabled="true" DropDownStyle="DropDownList" Width="120px">
                                                                                    <Items>
                                                                                    </Items>
                                                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="������">
                                                                                        <RequiredField IsRequired="true" />
                                                                                    </ValidationSettings>
                                                                                    <ClientSideEvents />
                                                                                </dxe:ASPxComboBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;"></td>
                                                                            <td style="text-align: left;"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                ����:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtPolicyItemCoverage" ClientInstanceName="dxetxtPolicyItemCoverage" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                ����:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtPolicyItemPremium" ClientInstanceName="dxetxtPolicyItemPremium" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                ���ͷ���:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtPolicyItemProcRate" ClientInstanceName="dxetxtPolicyItemProcRate" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                ���ͷ�:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtPolicyItemProcess" ClientInstanceName="dxetxtPolicyItemProcess" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                                <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                        runat="server">
                                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                                        runat="server">
                                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                                </div>
                                                            </EditForm>
                                                        </Templates>
                                                        <ClientSideEvents />
                                                    </dxwgv:ASPxGridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <ajaxToolkit:CollapsiblePanelExtender ID="cpeGridPolicyItem" runat="Server" TargetControlID="npGridPolicyItemDetail"
                                        ExpandControlID="npGridPolicyItemHeader" CollapseControlID="npGridPolicyItemHeader"
                                        Collapsed="false" TextLabelID="lbl_npGridPolicyItem" ImageControlID="img_npGridPolicyItem"
                                        ExpandedText="(չ��)" CollapsedText="(����)" ExpandedImage="~/images/collapse_blue.jpg"
                                        CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%;">
                                    <asp:Panel ID="npCostSummaryHeader" runat="server" CssClass="collapsePanelHeader"
                                        Height="25px">
                                        <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                            <div style="float: left; vertical-align: middle;">
                                                <asp:ImageButton ID="img_npCostSummaryHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                    AlternateText="" />
                                            </div>
                                            <div style="float: left; margin-left: 5px;">
                                                ���û���</div>
                                            <div style="float: left; margin-left: 5px;">
                                                <asp:Label ID="lbl_npCostSummaryHeader" runat="server">(չ��)</asp:Label>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="npCostSummaryDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width: 100%">
                                            <tr style="font-size: 1px; height: 2px;">
                                                <td style="width: 10%;"></td>
                                                <td style="width: 20%;"></td>
                                                <td style="width: 10%;"></td>
                                                <td style="width: 20%;"></td>
                                                <td style="width: 10%;"></td>
                                                <td style="width: 20%;"></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">���</td>
                                                <td style="text-align: left;" >
                                                    <dxe:ASPxTextBox ID="dxetxtCoverage" ClientInstanceName="dxetxtCoverage" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    ����(%)��
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtPremiumRate" ClientInstanceName="dxetxtPremiumRate" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    ���ͷ���(%)��
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtProcessRate" ClientInstanceName="dxetxtProcessRate" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    ���֣�
                                                </td>
                                                <td>
                                                    <dxe:ASPxComboBox ID="dxeddlCurrency" ClientInstanceName="dxeddlCurrency" runat="server" Width="120px" DropDownStyle="DropDownList">
															<Items>
																<dxe:ListEditItem Text="(ȫ��)" Value="" />
															</Items>
														</dxe:ASPxComboBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    ����(ԭ)��
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtPremium" ClientInstanceName="dxetxtPremium" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    ���ͷ�(ԭ)��
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtProcess" ClientInstanceName="dxetxtProcess" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    ������ʣ�
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtConversionRate" ClientInstanceName="dxetxtConversionRate" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    ����(��)��
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtPremiumBase" ClientInstanceName="dxetxtPremiumBase" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    ���ͷ�(��)��
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtProcessBase" ClientInstanceName="dxetxtProcessBase" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="Server"
                                        TargetControlID="npCostSummaryDetail" ExpandControlID="npCostSummaryHeader" CollapseControlID="npCostSummaryHeader"
                                        Collapsed="false" TextLabelID="lbl_npCostSummaryHeader" ImageControlID="img_npCostSummaryHeader"
                                        ExpandedText="(չ��)" CollapsedText="(����)" ExpandedImage="~/images/collapse_blue.jpg"
                                        CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%;">
                                    <asp:Panel ID="npPolicyCompanyHeader" runat="server" CssClass="collapsePanelHeader"
                                        Height="25px">
                                        <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                            <div style="float: left; vertical-align: middle;">
                                                <asp:ImageButton ID="img_npPolicyCompanyHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                    AlternateText="" />
                                            </div>
                                            <div style="float: left; margin-left: 5px;">
                                                ���չ�˾</div>
                                            <div style="float: left; margin-left: 5px;">
                                                <asp:Label ID="lbl_npPolicyCompanyHeader" runat="server">(չ��)</asp:Label>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="npPolicyCompanyDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="text-align: right;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="gridCarrier" ClientInstanceName="gridCarrier" runat="server"
                                                        KeyFieldName="PolicyCarrierID" Width="100%" AutoGenerateColumns="False" OnStartRowEditing="gridCarrier_StartRowEditing"
                                                        OnRowInserting="gridCarrier_RowInserting" OnRowUpdating="gridCarrier_RowUpdating"
                                                        OnRowUpdated="gridCarrier_RowUpdated" OnRowInserted="gridCarrier_RowInserted"
                                                        OnRowDeleting="gridCarrier_RowDeleting" OnRowDeleted="gridCarrier_RowDeleted"
                                                        OnHtmlEditFormCreated="gridCarrier_HtmlEditFormCreated" 
                                                        OnRowValidating="gridCarrier_RowValidating"
                                                        >
                                                        <%-- BeginRegion Columns --%>
                                                        <Columns>
                                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left"
                                                                Width="81" HeaderStyle-Wrap="False" AllowDragDrop="false">
                                                                <NewButton Visible="true" />
                                                                <EditButton Visible="true" />
                                                                <DeleteButton Visible="true" />
                                                                <CustomButtons>
                                                                    <dxwgv:GridViewCommandColumnCustomButton ID="btngridCarrierTogether" Text="�ٱ�">
                                                                    </dxwgv:GridViewCommandColumnCustomButton>
                                                                </CustomButtons>
                                                            </dxwgv:GridViewCommandColumn>             
                                                            <dxwgv:GridViewDataTextColumn FieldName="CarrierNameCn" Caption="���չ�˾" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="��֧����" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="PolicyRate" Caption="�ݶ����(%)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Premium" Caption="����(ԭ)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="PremiumBase" Caption="����(��)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="ProcessRate" Caption="���ͷ���(%)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Process" Caption="���ͷ�(ԭ)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="ProcessBase" Caption="���ͷ�(��)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="CarrierID" Caption="CarrierID" CellStyle-Wrap="False" Visible="false">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="BranchID" Caption="BranchID" CellStyle-Wrap="False" Visible="false">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="PolicyID" CellStyle-Wrap="False" Visible="false">
                                                            </dxwgv:GridViewDataColumn>
                                                        </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <Settings ShowGroupPanel="false" /> 
                                                        <ClientSideEvents CustomButtonClick="" />                                                       
                                                        <Templates>
                                                            <EditForm>                                                                
                                                                <div style="padding: 4px 4px 3px 4px">
                                                                    <table style="width: 90%;" runat="server" id="tblgridCarrierEditorTemplate">
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                ���չ�˾:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxComboBox runat="server" ID="dxecbGridCarrierCarrierID" AutoPostBack="false" ClientInstanceName="dxecbGridCarrierCarrierID"
                                                                                    DropDownButton-Enabled="true" DropDownStyle="DropDownList" Width="120px" 
                                                                                    >
                                                                                    <Items>                                                                                        
                                                                                    </Items>
                                                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="������">
                                                                                        <RequiredField IsRequired="true" />
                                                                                    </ValidationSettings>
                                                                                    <ClientSideEvents SelectedIndexChanged="GridCarrierCarrier_SelectedIndexChanged" />
                                                                                </dxe:ASPxComboBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                ��֧����:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxComboBox runat="server" ID="dxecbGridCarrierBranchID" AutoPostBack="false" ClientInstanceName="dxecbGridCarrierBranchID"
                                                                                    DropDownButton-Enabled="true" DropDownStyle="DropDownList" Width="120px"
                                                                                    OnCallback="dxecbGridCarrierBranchIDCallback"
                                                                                    >
                                                                                    <Items>                                                                                        
                                                                                    </Items>
                                                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="������">
                                                                                        <RequiredField IsRequired="true" />
                                                                                    </ValidationSettings>
                                                                                    <ClientSideEvents SelectedIndexChanged="" />
                                                                                    
                                                                                </dxe:ASPxComboBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                �ݶ����(%):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridCarrierPolicyRate" ClientInstanceName="dxetxtGridCarrierPolicyRate" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                ����(ԭ):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridCarrierPremium" ClientInstanceName="dxetxtGridCarrierPremium" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                ����(��):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridCarrierPremiumBase" ClientInstanceName="dxetxtGridCarrierPremiumBase" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                ���ͷ���(%):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridCarrierProcessRate" ClientInstanceName="dxetxtGridCarrierProcessRate" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                ���ͷ�(ԭ):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridCarrierProcess" ClientInstanceName="dxetxtGridCarrierProcess" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                ���ͷ�(��):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridCarrierProcessBase" ClientInstanceName="dxetxtGridCarrierProcessBase" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                                <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                        runat="server">                                                                        
                                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                                        runat="server">
                                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                                </div>
                                                            </EditForm>
                                                        </Templates>
                                                    </dxwgv:ASPxGridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
                                        TargetControlID="npPolicyCompanyDetail" ExpandControlID="npPolicyCompanyHeader"
                                        CollapseControlID="npPolicyCompanyHeader" Collapsed="false" TextLabelID="lbl_npPolicyCompanyHeader"
                                        ImageControlID="img_npPolicyCompanyHeader" ExpandedText="(չ��)" CollapsedText="(����)"
                                        ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                                        SuppressPostBack="true" />
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Text="����">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 100%; text-align: left;">
                                    �ϴ�����                                                                        
                                </td>
                            </tr>
                            <tr>
                                <td runat="server" id="tblcellfilesUploadControl">
                                    <dxuc:ASPxUploadControl ID="filesUploadControl" ClientInstanceName="filesUploadControl" 
                                            runat="server" ShowAddRemoveButtons="True"
                                            Width="400px" ShowUploadButton="True" 
                                            AddUploadButtonsHorizontalPosition="Center"
                                            ShowProgressPanel="True" 
                                            FileInputCount="5" RemoveButtonSpacing="8px" 
                                            AddUploadButtonsSpacing="10" FileUploadMode="OnPageLoad"
                                            OnPreRender="UploadControl_PreRender" 
                                            OnFileUploadComplete="UploadControl_FileUploadComplete"
                                            >
                                            <ValidationSettings MaxFileSize="4000000" 
                                            FileDoesNotExistErrorText="�ļ�������" 
                                            GeneralErrorText="�ϴ���������" 
                                            MaxFileSizeErrorText="�ļ�̫��" 
                                            NotAllowedContentTypeErrorText="�������ϴ��������ļ�">
                                            </ValidationSettings>
                                            <ClientSideEvents 
                                                FilesUploadComplete="function(s, e) { FileUploaded(s, e) }" 
                                                FileUploadStart="function(s, e) { FileUploadStart(s, e); }"  />
                                            <RemoveButton Text="" Image-Url="../images/file_remove.gif" Image-Height="25px" Image-Width="25px"
                                                ImagePosition="Left">
                                            </RemoveButton>
                                            <AddButton Text="" Image-Url="../images/file_add.gif" Image-Height="25px" Image-Width="25px"
                                                ImagePosition="Left">
                                            </AddButton>
                                            <UploadButton Text="" Image-Url="../images/file_upload.gif" Image-Height="25px" Image-Width="25px"
                                                ImagePosition="Left">                                            
                                            </UploadButton>                                        
                                        </dxuc:ASPxUploadControl>    
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%; text-align: left;">
                                    �ļ��б�                                                                        
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%; text-align: left;" runat="server" id="tblcellgridDocList">
                                    <dxwgv:ASPxGridView ID="gridDocList" ClientInstanceName="gridDocList" runat="server"
                                        KeyFieldName="PolicyDocID" Width="100%" AutoGenerateColumns="False" 
                                        OnCustomCallback="gridDocList_CustomCallback"
                                        >
                                        <%-- BeginRegion Columns --%>
                                        <Columns>
                                            <dxwgv:GridViewDataColumn FieldName="DocName" Caption="�ļ���" CellStyle-Wrap="False" Width="25" Settings-AllowDragDrop="false">
                                                <DataItemTemplate>
                                                    <a id="fileurl <%# Eval("PolicyDocID") %>" onclick="hlPolicyItemTogetherClick('<%# Eval("DocURL") %>');" href="#"><%# Eval("DocName")%></a>
                                                </DataItemTemplate>
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="DocURL" Caption="���ӵ�ַ" CellStyle-Wrap="False">
                                            </dxwgv:GridViewDataColumn>                                                                                                        
                                        </Columns>
                                        <%-- EndRegion --%>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <Settings ShowGroupPanel="false" /> 
                                        <ClientSideEvents CustomButtonClick="" />
                                    </dxwgv:ASPxGridView>
                                                
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Text="��    ��" ClientVisible="true">
                
                <ContentCollection>                
                    <dxw:ContentControl ID="ContentControl2" runat="server">
                        
                        <table style="width: 100%">
                            <tr>
                                <td runat="server" id="tblcellgridPeriod">
                                    <dxwgv:ASPxGridView ID="gridPeriod" ClientInstanceName="gridPeriod" runat="server"
                                        KeyFieldName="PolPeriodId" Width="100%" OnStartRowEditing="gridPeriod_StartRowEditing"
                                        OnRowInserting="gridPeriod_RowInserting" OnRowUpdating="gridPeriod_RowUpdating"
                                        OnRowUpdated="gridPeriod_RowUpdated" OnRowInserted="gridPeriod_RowInserted" 
                                        OnRowDeleting="gridPeriod_RowDeleting" OnHtmlEditFormCreated="gridPeriod_HtmlEditFormCreated"
                                        OnRowDeleted="gridPeriod_RowDeleted" OnCustomCallback="gridPeriod_CustomCallback"
                                        OnRowValidating="gridPeriod_RowValidating"
                                        >
                                        <%-- BeginRegion Columns --%>
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="false">
                                                <EditButton Visible="true" />
                                                <NewButton Visible="false" />                                                                   
                                                <DeleteButton Visible="false" />
                                            </dxwgv:GridViewCommandColumn>
                                            <dxwgv:GridViewDataColumn FieldName="Period" Caption="�ڴ�" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataDateColumn FieldName="PayDate" Caption="��������" CellStyle-Wrap="false"
                                                PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                            </dxwgv:GridViewDataDateColumn>
                                            <dxwgv:GridViewDataColumn FieldName="CarrierNameCn" Caption="���չ�˾" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="��֧����" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="PayFeeBase" Caption="����" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="PayProcBase" Caption="���ͷ�" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="PolicyId" Caption="PolicyId" CellStyle-Wrap="false" Visible="false">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="CarrierID" Caption="CarrierID" CellStyle-Wrap="false" Visible="false">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="BranchID" Caption="BranchID" CellStyle-Wrap="false" Visible="false">
                                            </dxwgv:GridViewDataColumn>
                                        </Columns>
                                        <%-- EndRegion --%>
                                        <SettingsEditing Mode="EditForm" />
                                        <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways" ShowGroupedColumns="true" ShowFilterRow="false" />
                                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                        <SettingsDetail ExportMode="All" />
                                        <SettingsLoadingPanel Mode="ShowAsPopup" ImagePosition="Top"  ShowImage="true" Text="Loading" />
                                        <Styles>
                                            <LoadingDiv></LoadingDiv>
                                            <LoadingPanel></LoadingPanel>
                                        </Styles>
                                        <Templates>
                                            <EditForm>
                                                <div style="padding: 4px 4px 3px 4px">
                                                    <table style="width: 90%;" runat="server" id="tblgridPeriodEditorTemplate">
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                �ڴ�:
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox runat="server" 
                                                                ID="detxtGridPeriodPeriod" ClientInstanceName="detxtGridPeriodPeriod"
                                                                Enabled="false" ReadOnly="true">
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                ��������:
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxDateEdit 
                                                                    ID="detxtGridPeriodPayDate" 
                                                                    ClientInstanceName="detxtGridPeriodPayDate"
                                                                    runat="server">
                                                                    <ValidationSettings RequiredField-IsRequired="true"  CausesValidation="true" ErrorDisplayMode="ImageWithTooltip" ErrorText="������">
                                                                        <RequiredField IsRequired="true" ErrorText="������" />
                                                                    </ValidationSettings>
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                ���չ�˾:
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox runat="server" 
                                                                    ID="detxtGridPeriodCarrierNameCn" 
                                                                    ClientInstanceName="detxtGridPeriodCarrierNameCn"
                                                                    Enabled="false" ReadOnly="true">
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                ��֧����:
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox runat="server" 
                                                                    ID="detxtGridPeriodBranchName" ClientInstanceName="detxtGridPeriodBranchName"
                                                                    Enabled="false" ReadOnly="true">
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                ����:
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox runat="server" 
                                                                    ID="detxtGridPeriodPayFeeBase" ClientInstanceName="detxtGridPeriodPayFeeBase"
                                                                    ReadOnly="false">
                                                                    <ValidationSettings RequiredField-IsRequired="true"  CausesValidation="true" ErrorDisplayMode="ImageWithTooltip" ErrorText="������">
                                                                        <RequiredField  IsRequired="true" ErrorText="������"  />
                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                                    </ValidationSettings>
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                ���ͷ�:
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox runat="server" 
                                                                    ID="detxtGridPeriodPayProcBase" ClientInstanceName="detxtGridPeriodPayProcBase"
                                                                    ReadOnly="false">
                                                                    <ValidationSettings RequiredField-IsRequired="true" CausesValidation="true" ErrorDisplayMode="ImageWithTooltip">
                                                                        <RequiredField  IsRequired="true" ErrorText="������"  />
                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                                    </ValidationSettings>
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                        runat="server">
                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                        runat="server">
                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                </div>
                                            </EditForm>
                                        </Templates>
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                        
                    </dxw:ContentControl>
                    
                </ContentCollection>                
            </dxtc:TabPage>
            <dxtc:TabPage Text="�����Ϣ">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl1" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 10%; text-align: right;">
                                    ����ˣ�
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtIDNo" ClientInstanceName="dxetxtIDNo" runat="server" Width="100px"></dxe:ASPxTextBox> 
                                </td>
                                <td style="width: 10%; text-align: right;">
                                    ������ڣ�
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <dxe:ASPxDateEdit ID="dxeCheckDate" ClientInstanceName="dxeCheckDate" runat="server" Width="120px">
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; vertical-align: top;">
                                    ��˱�ע��
                                </td>
                                <td style="text-align: left;" colspan="3">
                                    <dxe:ASPxMemo runat="server" id="dxeMemo" ClientInstanceName="dxeMemo" Rows="10" Columns="72"></dxe:ASPxMemo>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5"></td>
                            </tr>
                            <tr runat="server" id="tbltrAuditExecuteAction">
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>                                
                                <td>
                                    <dxe:ASPxButton runat="server" id="dxebtnAuditOk" ClientInstanceName="dxebtnAuditOk" Text="���" CausesValidation="false" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s, e) {dxebtnAuditOkClick(s,e);}" />
                                    </dxe:ASPxButton>
                                </td>
                                <td>
                                    <dxe:ASPxButton runat="server" id="dxebtnAuditClose" ClientInstanceName="dxebtnAuditClose" Text="�ر�" CausesValidation="false" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s, e) {btnCloseClick();}" />
                                    </dxe:ASPxButton>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
        </TabPages>
    </dxtc:ASPxPageControl>
    <table style="height: 5px; background-color: #E0EDFF; width: 100%; font-size: 2px;">
        <tr>
            <td>
            </td>
        </tr>
    </table>
    <asp:Panel ID="npNewExecuteAction" runat="server" CssClass="allborderPanel" Height="30px">
        <table style="width: 100%" runat="server" id="tblNewExecuteAction">
            <tr>
                <td style="width: 400px; text-align: left;">
                    &nbsp;
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnBottomAdd" ClientInstanceName="dxebtnBottomAdd" Text="����" CausesValidation="true" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnAddClick(s,e);}" />
                    </dxe:ASPxButton> 
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnBottomSave" ClientInstanceName="dxebtnBottomSave" Text="����" CausesValidation="true" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {dxebtntopSave_Click(s,e);}" />
                    </dxe:ASPxButton> 
                </td>
                <td style="width:70px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnBottomCheck" ClientInstanceName="dxebtnBottomCheck" Text="�ύ���" CausesValidation="true" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnSaveCheckClick(s,e);}" />
                    </dxe:ASPxButton> 
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnCancel" ClientInstanceName="dxebtnCancel" Text="����" CausesValidation="false" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnCancelClick();}" />
                    </dxe:ASPxButton>
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxeClose" ClientInstanceName="dxeClose" Text="�ر�" CausesValidation="false" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnCloseClick();}" />
                    </dxe:ASPxButton>
                </td>                
            </tr>
            <tr>
                <td style="width: 400px; text-align: left;">
                    &nbsp;
                </td>
                <td style="display:none;"><a id="hrefnewpolicy" href="PolicyInput.aspx">New</a></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </asp:Panel>
    
    
    </asp:Panel>

</asp:Content>
