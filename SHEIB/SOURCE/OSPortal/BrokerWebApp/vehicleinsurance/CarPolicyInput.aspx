<%@ Page Title="车辆保单信息录入" Theme="Aqua" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="True" CodeBehind="CarPolicyInput.aspx.cs" Inherits="BrokerWebApp.vehicleinsurance.CarPolicyInput" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><%=CustomPageTitle%></title>

    <script type="text/javascript">

        var pagemode = null;
        var npbasicdetail = null;
        var npGridPolicyItemDetail = null;
        var tblNewExecuteAction = null;
        var tbltrAuditExecuteAction = null;


        function getServerControlRefStubs() {
            if ($("#<%=pagemode.ClientID %>").length > 0) {
                pagemode = $("#<%=pagemode.ClientID %>")[0];
            }

            if ($("#<%=npbasicdetail.ClientID %>").length > 0) {
                npbasicdetail = $("#<%=npbasicdetail.ClientID %>")[0];
            }

            if ($("#<%=npGridPolicyItemDetail.ClientID %>").length > 0) {
                npGridPolicyItemDetail = $("#<%=npGridPolicyItemDetail.ClientID %>")[0];
            }

            if ($("#<%=tblNewExecuteAction.ClientID %>").length > 0) {
                tblNewExecuteAction = $("#<%=tblNewExecuteAction.ClientID %>")[0];
            }

            if ($("#<%=tbltrAuditExecuteAction.ClientID %>").length > 0) {
                tbltrAuditExecuteAction = $("#<%=tbltrAuditExecuteAction.ClientID %>")[0];
            }

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


        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});

            //
            window.onunload = function() {
                var pWindow = window.dialogArguments;
                var thegrid = pWindow.gridPolicyItem;

                if (thegrid != null) {
                    thegrid.PerformCallback('refresh');
                }
                else {
                    //do nothing
                }

                var theothergrid = pWindow.gridSearchResult;

                if (theothergrid != null) {
                    theothergrid.PerformCallback('refresh');
                }
                else {
                    //do nothing
                }
            };

            getServerControlRefStubs();

            policyBaseCompleteUnable();

        });

        
    </script>
    
    <script type="text/javascript">

        function policyCheckNessary() {
            var pid = dxetxtPolicyID.GetValueString();
            var cid = getCustomerID();
            if (isEmpty(pid)) {
                return true;
            }
            else {
                return false;
            }

        }

        function setOnlyDxeButtonsUnableOrEnable(val) {
            if (typeof(dxebtnBottomAdd) != 'undefined' && dxebtnBottomAdd != null)
                dxebtnBottomAdd.SetEnabled(val);

            if (typeof(dxebtnBottomSave) != 'undefined' && dxebtnBottomSave != null)
                dxebtnBottomSave.SetEnabled(val);

            if (typeof(dxebtnBottomCheck) != 'undefined' && dxebtnBottomCheck != null)
                dxebtnBottomCheck.SetEnabled(val);

            if (typeof(dxebtnCancel) != 'undefined' && dxebtnCancel != null)
                dxebtnCancel.SetEnabled(val);

            try {
                if (typeof(dxebtnAuditBack) != 'undefined' && dxebtnAuditBack != null)
                    dxebtnAuditBack.SetEnabled(val);
            }
            catch (err) {
                
            }


            try {
                if (typeof(dxebtnAuditOk) != 'undefined' && dxebtnAuditOk != null)
                    dxebtnAuditOk.SetEnabled(val);
            }
            catch (err) {

            }
            

        }

        function setDxeButtonsUnableOrEnable(val) {
            setOnlyDxeButtonsUnableOrEnable(val);

            insuranceDetailTabPage.tabs[1].SetEnabled(val);
            insuranceDetailTabPage.tabs[2].SetEnabled(val);

            if ((typeof(gridPolicyItem) != 'undefined') && gridPolicyItem != null) {
                gridPolicyItem.SetClientVisible(val);
            }
        }

        function policyBaseCompleteUnable() {

            //input
            if (pagemode.value == "input") {
                if (policyCheckNessary()) {
                    npGridPolicyItemDetail.parentElement.setAttribute('disabled', 'true');
                    setDxeButtonsUnableOrEnable(false);
                }

            }

            //audit
            if (pagemode.value == "audit") {
                npbasicdetail.parentElement.setAttribute('disabled', 'true');

                npGridPolicyItemDetail.parentElement.setAttribute('disabled', 'true');

            }


        }


        function policyBaseCompleteEnable() {

            if (pagemode.value == "input") {
                npGridPolicyItemDetail.parentElement.removeAttribute('disabled');
                setDxeButtonsUnableOrEnable(true);
            }


        }





        function makePolicyJSON() {

            var PolicyID = dxetxtPolicyID.GetValueString();
            var PolicyNo = dxetxtPolicyNo.GetValueString();
            var AciPolicyNo = dxetxtAciPolicyNo.GetValueString();
            var AskPriceID = dxetxtAskPriceID.GetValueString();
            
            var CarrierID = dxeddlCarrierId.GetValue();
            var BranchID = dxeddlBranchId.GetValue();
            var CarrierSales = dxetxtCarrierSales.GetValueString();
            var CustomerID = getCustomerID();
            var Beneficiary = dxetxtBeneficiary.GetValueString();
            var SourceTypeID = dxeddlSourceTypeID.GetValue();
            
            var SalesId = dxeddlSalesId.GetValue();
            var DeptId = dxeddlDeptID.GetValue();
            var GatheringTypeID = dxeddlGatheringType.GetValue();
            var OperationTypeID = dxeddlOperationType.GetValue();
            var StartDate = dxeStartDate.GetValue();
            var EndDate = dxeEndDate.GetValue();
            var Special = dxetxtSpecial.GetValueString();
            var CarNo = dxetxtCarNo.GetValueString();
            var CarcaseNo = dxetxtCarcaseNo.GetValueString();
            var UseCharacter = dxetxtUseCharacter.GetValueString();
            var EngineNo = dxetxtEngineNo.GetValueString();
            var CarUser = dxetxtCarUser.GetValueString();
            var Capacity = dxetxtCapacity.GetValueString();
            var RegisterDate = dxeRegisterDate.GetValue();
            var CarValue = dxetxtCarValue.GetValueString();
            var CiPremium = dxetxtCiPremium.GetValueString();
            var AciPremium = dxetxtAciPremium.GetValueString();
            var CstPremium = dxetxtCstPremium.GetValueString();
            var TotalPremium = dxetxtTotalPremium.GetValueString();
            var CiProcessRate = dxetxtCiProcessRate.GetValueString();
            var AciProcessRate = dxetxtAciProcessRate.GetValueString();
            var CiProcess = dxetxtCiProcess.GetValueString();
            var AciProcess = dxetxtAciProcess.GetValueString();        
            var TotalProcess = dxetxtTotalProcess.GetValueString();

            var Remark = null;
            var AuditOrNot = null;

            var plc = new Policy(PolicyID,PolicyNo,AciPolicyNo,AskPriceID, 
            CarrierID, BranchID, CarrierSales,
            CustomerID, Beneficiary, SourceTypeID, DeptId, SalesId, 
            GatheringTypeID, OperationTypeID, StartDate, EndDate,
            Special, CarNo, CarcaseNo, UseCharacter, EngineNo, CarUser,
            Capacity, RegisterDate, CarValue, CiPremium, AciPremium,
            CstPremium, TotalPremium, CiProcessRate, AciProcessRate,
            CiProcess, AciProcess, TotalProcess, 
            Remark, AuditOrNot);

            //deserialize JSON string, make a JSON object
            //var jsonObject = Sys.Serialization.JavaScriptSerializer.deserialize(jsonStringServer)

            //serialize a JOSN object，make a JSON string.
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

            var pid = dxetxtPolicyID.GetValueString();

            if (isEmpty(pid)) {
                dxetxtPolicyID.SetValue(e.result);
            }
            alert("保存成功。");
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
            var theresult = e.result;
            switch (theresult) {
                case "0":
                    setOnlyDxeButtonsUnableOrEnable(false);
                    dxebtntopSave.SetEnabled(false);
                    gridPolicyItem.PerformCallback("unabled");
                    if (typeof (filesUploadControlPanel) != 'undefined' && filesUploadControlPanel != null)
                        filesUploadControlPanel.PerformCallback("unabled");
                    alert("提交成功");
                    break
                default:
                    alert(theresult);
            }
        }


        function GridCarrierCarrier_SelectedIndexChanged(s, e) {
            var thejsonstring = dxecbGridCarrierCarrierID.GetSelectedItem().value;
            dxecbGridCarrierBranchID.PerformCallback(thejsonstring);
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
            }
        }





        function Policy(PolicyID,PolicyNo,AciPolicyNo,AskPriceID, 
            CarrierID, BranchID, CarrierSales,
            CustomerID, Beneficiary, SourceTypeID, DeptId, SalesId, 
            GatheringTypeID, OperationTypeID, StartDate, EndDate,
            Special, CarNo, CarcaseNo, UseCharacter, EngineNo, CarUser,
            Capacity, RegisterDate, CarValue, CiPremium, AciPremium,
            CstPremium, TotalPremium, CiProcessRate, AciProcessRate,
            CiProcess, AciProcess, TotalProcess, 
            Remark, AuditOrNot) {

            if (!isEmpty(PolicyID))
                this.PolicyID = PolicyID;
                
            if (!isEmpty(PolicyNo))
                this.PolicyNo = PolicyNo;
                
            if (!isEmpty(AciPolicyNo))
                this.AciPolicyNo = AciPolicyNo;
                
            if (!isEmpty(AskPriceID))
                this.AskPriceID = AskPriceID;

            if (!isEmpty(CarrierID))
                this.CarrierID = CarrierID;

            if (!isEmpty(BranchID))
                this.BranchID = BranchID;

            if (!isEmpty(CarrierSales))
                this.CarrierSales = CarrierSales;

            
            if (!isEmpty(CustomerID))
                this.CustomerID = CustomerID;

            if (!isEmpty(Beneficiary))
                this.Beneficiary = Beneficiary;
                
            if (!isEmpty(SourceTypeID))
                this.SourceTypeID = SourceTypeID;
                
            if (!isEmpty(DeptId))
                this.DeptId = DeptId;

            if (!isEmpty(SalesId))
                this.SalesId = SalesId;

            if (!isEmpty(GatheringTypeID))
                this.GatheringTypeID = GatheringTypeID;

            if (!isEmpty(OperationTypeID))
                this.OperationTypeID = OperationTypeID;

            if (!isEmpty(StartDate))
                this.StartDate = StartDate;

            if (!isEmpty(EndDate))
                this.EndDate = EndDate;
            
            if (!isEmpty(Special))
                this.Special = Special;
            
            if (!isEmpty(CarNo))
                this.CarNo = CarNo;
            
            if (!isEmpty(CarcaseNo))
                this.CarcaseNo = CarcaseNo;
                        
            if (!isEmpty(UseCharacter))
                this.UseCharacter = UseCharacter;
            
            if (!isEmpty(EngineNo))
                this.EngineNo = EngineNo;
            
            if (!isEmpty(CarUser))
                this.CarUser = CarUser;
            
            if (!isEmpty(Capacity))
                this.Capacity = Capacity;
            
            if (!isEmpty(RegisterDate))
                this.RegisterDate = RegisterDate;
            
            if (!isEmpty(CarValue))
                this.CarValue = CarValue;
            
            if (!isEmpty(CiPremium))
                this.CiPremium = CiPremium;
            
            if (!isEmpty(AciPremium))
                this.AciPremium = AciPremium;
            
            if (!isEmpty(CstPremium))
                this.CstPremium = CstPremium;
            
            if (!isEmpty(TotalPremium))
                this.TotalPremium = TotalPremium;
            
            if (!isEmpty(CiProcessRate))
                this.CiProcessRate = CiProcessRate;
            
            if (!isEmpty(AciProcessRate))
                this.AciProcessRate = AciProcessRate;
            
            if (!isEmpty(CiProcess))
                this.CiProcess = CiProcess;
                
            if (!isEmpty(AciProcess))
                this.AciProcess = AciProcess;
            
            if (!isEmpty(TotalProcess))
                this.TotalProcess = TotalProcess;
            
            
            if (!isEmpty(Remark))
                this.Remark = Remark;

            if (!isEmpty(AuditOrNot))
                this.AuditOrNot = AuditOrNot;

        }





        function btnCancelClick() {
            window.document.forms[0].reset();
            //ASPxClientEdit.ClearEditorsInContainer(null);
        }

        function btnCloseClick() {
            window.close();
        }

        function gridPolicyItem_EndCallback(s, e) {
            //
        }


        function policyTab_Changing(s, e) {
            //debugger;
            if (e.tab.index == 1 || e.tab.index == 2) {
                var element = s.GetContentElement(e.tab.index);
                if (element != null) element.loaded = false;
            }
        }

        function policyTab_Click(s, e) {
            //
        }


        function dxebtnAuditBackClick(s, e) {

            var AuditOrNot = 0;

            var PolicyID = dxetxtPolicyID.GetValueString();
            var PolicyNo = null;
            var AciPolicyNo = null;
            var AskPriceID = dxetxtAskPriceID.GetValueString();
            
            var CarrierID = null;
            var BranchID = null;
            var CarrierSales = null;
            var CustomerID = null;
            var Beneficiary = null;
            var SourceTypeID = null;
            
            var SalesId = null;
            var DeptId = null;
            var GatheringTypeID = null;
            var OperationTypeID = null;
            var StartDate = null;
            var EndDate = null;
            var Special = null;
            var CarNo = null;
            var CarcaseNo = null;
            var UseCharacter = null;
            var EngineNo = null;
            var CarUser = null;
            var Capacity = null;
            var RegisterDate = null;
            var CarValue = null;
            var CiPremium = null;
            var AciPremium = null;
            var CstPremium = null;
            var TotalPremium = null;
            var CiProcessRate = null;
            var AciProcessRate = null;
            var CiProcess = null;
            var AciProcess = null;        
            var TotalProcess = null;
            
            var Remark = dxeMemo.GetValueString();

            var plc = new Policy(PolicyID,PolicyNo,AciPolicyNo,AskPriceID, 
            CarrierID, BranchID, CarrierSales,
            CustomerID, Beneficiary, SourceTypeID, DeptId, SalesId, 
            GatheringTypeID, OperationTypeID, StartDate, EndDate,
            Special, CarNo, CarcaseNo, UseCharacter, EngineNo, CarUser,
            Capacity, RegisterDate, CarValue, CiPremium, AciPremium,
            CstPremium, TotalPremium, CiProcessRate, AciProcessRate,
            CiProcess, AciProcess, TotalProcess, 
            Remark, AuditOrNot);

            var jsonStringClient = Sys.Serialization.JavaScriptSerializer.serialize(plc);

            var titleMSG = "确定退回吗？";

            var sureOk = window.confirm(titleMSG)
            if (sureOk) {
                dxeAuditBackCallback.PerformCallback(jsonStringClient);
            }

        }


        function auditBackCallbackComplete(s, e) {
            //do nothing;
            setOnlyDxeButtonsUnableOrEnable(false);
            alert("退回成功");
        }

        function dxebtnAuditOkClick(s, e) {
            var titleMSG = "确定吗？";            
            var buttonID = s.GetText();
            var AuditOrNot;
            switch (buttonID) {
                case "通过审核":
                    AuditOrNot = true;
                    titleMSG = "确定审核吗？";
                    break
                case "反审核":
                    AuditOrNot = false;
                    titleMSG = "确定反审核吗？";
                    break
                default:
                    //do nothing;
            }

            var PolicyID = dxetxtPolicyID.GetValueString();
            var PolicyNo = null;
            var AciPolicyNo = null;
            var AskPriceID = dxetxtAskPriceID.GetValueString();
            
            var CarrierID = null;
            var BranchID = null;
            var CarrierSales = null;
            var CustomerID = null;
            var Beneficiary = null;
            var SourceTypeID = null;
            
            var SalesId = null;
            var DeptId = null;
            var GatheringTypeID = null;
            var OperationTypeID = null;
            var StartDate = null;
            var EndDate = null;
            var Special = null;
            var CarNo = null;
            var CarcaseNo = null;
            var UseCharacter = null;
            var EngineNo = null;
            var CarUser = null;
            var Capacity = null;
            var RegisterDate = null;
            var CarValue = null;
            var CiPremium = null;
            var AciPremium = null;
            var CstPremium = null;
            var TotalPremium = null;
            var CiProcessRate = null;
            var AciProcessRate = null;
            var CiProcess = null;
            var AciProcess = null;        
            var TotalProcess = null;


            var Remark = dxeMemo.GetValueString();

            var plc = new Policy(PolicyID,PolicyNo,AciPolicyNo,AskPriceID, 
            CarrierID, BranchID, CarrierSales,
            CustomerID, Beneficiary, SourceTypeID, DeptId, SalesId, 
            GatheringTypeID, OperationTypeID, StartDate, EndDate,
            Special, CarNo, CarcaseNo, UseCharacter, EngineNo, CarUser,
            Capacity, RegisterDate, CarValue, CiPremium, AciPremium,
            CstPremium, TotalPremium, CiProcessRate, AciProcessRate,
            CiProcess, AciProcess, TotalProcess, 
            Remark, AuditOrNot);

            var jsonStringClient = Sys.Serialization.JavaScriptSerializer.serialize(plc);

            var sureOk = window.confirm(titleMSG)
            if (sureOk) {
                dxeAuditOkCallback.PerformCallback(jsonStringClient);            
            }

        }

        function auditOkCallbackComplete(s, e) {
            var buttonID = dxebtnAuditOk.GetText();
            var titleMSG = buttonID + "成功完成";
            var theresult = e.result;
            switch (theresult) {
                case "0":
                    setOnlyDxeButtonsUnableOrEnable(false);
                    dxebtnAuditOk.SetEnabled(false);
                    alert(titleMSG);
                    break
                default:
                    alert(theresult);
            }

        }


        function hlPolicyItemTogetherClick(params) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
            var url = params;
            window.open(url);
        }

        function Carrier_SelectedIndexChanged(s, e) {
            var thejsonstring = dxeddlCarrierId.GetSelectedItem().value;
            dxeddlBranchId.PerformCallback(thejsonstring);
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
            var theDate = thesource.getDate() - 1;
            theYear = theYear + 1;
            theMonth = theMonth + 1;            
            var endDateString = theMonth.toString() + "/" + theDate.toString() + "/" + theYear.toString();
            
            dxeEndDate.SetDate(new Date(endDateString));
        }
        
        
    </script>

    <script type="text/javascript">

        function gridPolicyItem_EndCallback(s, e) {
            dxeGetGridPolicyItemTotalSummary.PerformCallback();
        }

        function dxeGetGridPolicyItemTotalSummaryCallbackComplete(s, e) {

            var retrunval = e.result;
            var thesplit_array = retrunval.split(";");
            var sumCoverageVal = parseFloat(thesplit_array[0]);
            var sumPremiumVal = parseFloat(thesplit_array[1]);

            var rtn = sumPremiumVal.toFixed(2);
            dxetxtCiPremium.SetValue(rtn);

            add_Four_ValueChanged(dxetxtCiPremium, dxetxtAciPremium, dxetxtCstPremium, dxetxtTotalPremium);
            division_ValueChanged(dxetxtCiPremium, dxetxtCiProcessRate, dxetxtCiProcess, true);
            add_Three_ValueChanged(dxetxtCiProcess, dxetxtAciProcess, dxetxtTotalProcess);
        }

        function gridCarrierCustomButtonClick(s, e) {
            s.GetRowValues(e.visibleIndex, "CarrierID", getTheGridCarrierSelectedRowsValues);
        }

        function getTheGridCarrierSelectedRowsValues(selectedValues) {
            if (selectedValues.length == 0) {
                //
            }
            else {
                var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=1000px;dialogHeight=800px;center=yes;help=no";
                var querystring;
                querystring = "PolicyReinsure.aspx?id=" + selectedValues;
                window.showModalDialog(querystring, self, myArguments);
            }
        }

        function multi_ValueChanged(t1, t2, t3, opt) {

            var v1;
            try {
                v1 = parseFloat(t1.GetValueString());
                if (isNaN(v1))
                    v1 = 0;
            }
            catch (err) {
                v1 = 0;
            }

            var v2;
            try {
                v2 = parseFloat(t2.GetValueString());
                if (isNaN(v2))
                    v2 = 0;
            }
            catch (err) {
                v2 = 0;
            }


            var v3;
            if (opt == true)
                v3 = parseFloat(v1 * v2 / 100);
            else
                v3 = parseFloat(v1 * v2);

            var rtn = v3.toFixed(2);
            t3.SetValue(rtn);
        }


        function division_ValueChanged(t1, t2, t3, opt) {

            var v1;
            try {
                v1 = parseFloat(t1.GetValueString());
                if (isNaN(v1))
                    v1 = 0;
            }
            catch (err) {
                v1 = 0;
            }

            var v2;
            try {
                v2 = parseFloat(t2.GetValueString());
                if (isNaN(v2))
                    v2 = 0;
            }
            catch (err) {
                v2 = 0;
            }

            var v3;
            if (v2 == 0)
                v3 = 0;
            else {
                if (opt == true)
                    v3 = parseFloat(v1 / v2 * 100);
                else
                    v3 = parseFloat(v1 / v2);
            }

            var rtn = v3.toFixed(2);
            t3.SetValue(rtn);
        }


        function add_Four_ValueChanged(t1, t2, t3, t4) {

            var v1;
            try {
                v1 = parseFloat(t1.GetValueString());
                if (isNaN(v1))
                    v1 = 0;
            }
            catch (err) {
                v1 = 0;
            }

            var v2;
            try {
                v2 = parseFloat(t2.GetValueString());
                if (isNaN(v2))
                    v2 = 0;
            }
            catch (err) {
                v2 = 0;
            }

            var v3;
            try {
                v3 = parseFloat(t3.GetValueString());
                if (isNaN(v3))
                    v3 = 0;
            }
            catch (err) {
                v3 = 0;
            }


            var v4;
            v4 = parseFloat(v1 + v2 + v3);

            var rtn = v4.toFixed(2);
            t4.SetValue(rtn);
        }


        function add_Three_ValueChanged(t1, t2, t3) {

            var v1;
            try {
                v1 = parseFloat(t1.GetValueString());
                if (isNaN(v1))
                    v1 = 0;
            }
            catch (err) {
                v1 = 0;
            }

            var v2;
            try {
                v2 = parseFloat(t2.GetValueString());
                if (isNaN(v2))
                    v2 = 0;
            }
            catch (err) {
                v2 = 0;
            }

            
            var v3;
            v3 = parseFloat(v1 + v2);

            var rtn = v3.toFixed(2);
            t3.SetValue(rtn);
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
    
    <dxcb:ASPxCallback ID="dxeAuditBackCallback" ClientInstanceName="dxeAuditBackCallback" runat="server" OnCallback="dxeAuditBackCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {auditBackCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    
    <dxcb:ASPxCallback ID="dxeGetGridPolicyItemTotalSummary" ClientInstanceName="dxeGetGridPolicyItemTotalSummary"
        runat="server" OnCallback="dxeGetGridPolicyItemTotalSummary_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {dxeGetGridPolicyItemTotalSummaryCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    
    <dxtc:ASPxPageControl ID="insuranceDetailTabPage" ClientInstanceName="insuranceDetailTabPage"
        runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%" AutoPostBack="false" EnableCallBacks="true" OnActiveTabChanged="insuranceDetailTabPage_ActiveTabChanged">
        <ClientSideEvents ActiveTabChanging="function(s, e) {}" TabClick="function(s, e) {}" />
        <TabPages>
            <dxtc:TabPage Text="基本信息">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl1" runat="server"> 
                                           
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 100%;">
                                        <asp:Panel ID="Panel1" runat="server" CssClass="collapsePanelHeader" Height="25px">
                                            <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                                <div style="float: left; vertical-align: middle;">
                                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                        AlternateText="" />
                                                </div>
                                                <div style="float: left; margin-left: 5px;">
                                                    基本信息</div>
                                                <div style="float: left; margin-left: 5px;">
                                                    <asp:Label ID="Label1" runat="server">(展开)</asp:Label>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="Panel2" runat="server" CssClass="collapsePanel" Height="0">
                                            <table style="width: 100%">
                                                <tr style="font-size: 1px; height: 2px;">
                                                    <td style="width: 90px;">
                                                    </td>
                                                    <td style="width: 190px;">
                                                    </td>
                                                    <td style="width: 90px;">
                                                    </td>
                                                    <td style="width: 170px;">
                                                    </td>
                                                    <td style="width: 90px;">
                                                    </td>
                                                    <td style="width: 170px;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        保单编号：
                                                    </td>
                                                    <td style="text-align: left;" colspan="3">
                                                        <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server" Width="509px"></dxe:ASPxTextBox>
                                                    </td>                                                    
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        投保编号：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        交强险保单号：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtAciPolicyNo" ClientInstanceName="dxetxtAciPolicyNo" runat="server" Width="160px"></dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        询价单号：
                                                    </td>
                                                    <td style="text-align: left; color: Red">
                                                        <dxe:ASPxTextBox ID="dxetxtAskPriceID" ClientInstanceName="dxetxtAskPriceID" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        保险公司：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxComboBox ID="dxeddlCarrierId" ClientInstanceName="dxeddlCarrierId" runat="server" Width="160px" DropDownStyle="DropDownList">
	                                                        <Items>
	                                                        </Items>
	                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                ValidationGroup="BaseGroup">
                                                                <RequiredField IsRequired="true" ErrorText="Required" />
                                                            </ValidationSettings>
	                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { Carrier_SelectedIndexChanged(s,e)}" />
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        分支结构：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxComboBox ID="dxeddlBranchId" ClientInstanceName="dxeddlBranchId" runat="server" Width="160px" DropDownStyle="DropDownList" OnCallback="CarrierBranchIDCallback">
	                                                        <Items>
	                                                        </Items>
	                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                ValidationGroup="BaseGroup">
                                                                <RequiredField IsRequired="true" ErrorText="Required" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        业务员：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCarrierSales" ClientInstanceName="dxetxtCarrierSales" runat="server" Width="160px"></dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        投保人：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <table style="margin-left:-3px;">
                                                            <tr>
                                                                    <td style="text-align:left; width:165px">
                                                                        <dxe:ASPxTextBox ID="dxetxtCustomer" ClientInstanceName="dxetxtCustomer" runat="server" Width="160px">
                                                                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                                ValidationGroup="BaseGroup">
                                                                                <RequiredField IsRequired="true" ErrorText="Required" />
                                                                            </ValidationSettings>
                                                                        </dxe:ASPxTextBox>                                                                    
                                                                    </td>
                                                                    <td style="text-align:left; width:20px">
                                                                        <input type="hidden" id="cusid" runat="server" />
                                                                        <img runat="server" id="imgSelectCustomer" onclick="imgSelectCustomerClick();" alt=""
                                                                            src="../images/searchicon9.png" style="width: 20px; height: 20px; vertical-align: top;" />
                                                                    </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        被保险人：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtBeneficiary" ClientInstanceName="dxetxtBeneficiary" runat="server" Width="160px">
                                                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                ValidationGroup="BaseGroup">
                                                                <RequiredField IsRequired="true" ErrorText="Required" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        业务来源：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxComboBox ID="dxeddlSourceTypeID" ClientInstanceName="dxeddlSourceTypeID" runat="server" Width="160px" DropDownStyle="DropDownList">
									                        <Items>
									                        </Items>
									                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                ValidationGroup="BaseGroup">
                                                                <RequiredField IsRequired="true" ErrorText="Required" />
                                                            </ValidationSettings>
								                        </dxe:ASPxComboBox>
                                                    </td>                                                    
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        部门：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server" Width="160px" DropDownStyle="DropDownList">
	                                                        <Items>
	                                                        </Items>
	                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                ValidationGroup="BaseGroup">
                                                                <RequiredField IsRequired="true" ErrorText="Required" />
                                                            </ValidationSettings>
                                                            <ClientSideEvents SelectedIndexChanged="function(s, e) { dxeddlDeptID_SelectedIndexChanged(s,e)}" />
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        客户经理：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server" Width="160px" DropDownStyle="DropDownList" OnCallback="dxeddlSalesIdCallback">
	                                                        <Items>
	                                                        </Items>
	                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                ValidationGroup="BaseGroup">
                                                                <RequiredField IsRequired="true" ErrorText="Required" />
                                                            </ValidationSettings>
                                                            
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        收款方式：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxComboBox ID="dxeddlGatheringType" ClientInstanceName="dxeddlGatheringType" runat="server" Width="160px" DropDownStyle="DropDownList">
									                        <Items>
									                        </Items>
									                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                ValidationGroup="BaseGroup">
                                                                <RequiredField IsRequired="true" ErrorText="Required" />
                                                            </ValidationSettings>
								                        </dxe:ASPxComboBox>
                                                    </td>                                                    
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        业务性质：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxComboBox ID="dxeddlOperationType" ClientInstanceName="dxeddlOperationType" runat="server" Width="160px" DropDownStyle="DropDownList">
									                        <Items>
									                        </Items>
									                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                ValidationGroup="BaseGroup">
                                                                <RequiredField IsRequired="true" ErrorText="Required" />
                                                            </ValidationSettings>
								                        </dxe:ASPxComboBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        保险期限：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxDateEdit ID="dxeStartDate" ClientInstanceName="dxeStartDate" runat="server" Width="160px">
                                                            <ClientSideEvents DateChanged="function(s, e) { dxeStartDate_DateChanged(s,e); }" /> 
                                                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                ValidationGroup="BaseGroup">
                                                                <RequiredField IsRequired="true" ErrorText="Required" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="text-align: center;">
                                                        至
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxDateEdit ID="dxeEndDate" ClientInstanceName="dxeEndDate" runat="server" Width="160px">
                                                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                ValidationGroup="BaseGroup">
                                                                <RequiredField IsRequired="true" ErrorText="Required" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxDateEdit>
                                                    </td>                                                    
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        特别约定：
                                                    </td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <dxe:ASPxTextBox ID="dxetxtSpecial" ClientInstanceName="dxetxtSpecial" runat="server" Width="820px"></dxe:ASPxTextBox>
                                                    </td>                                                            
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        录单人：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCreatePerson" ClientInstanceName="dxetxtCreatePerson" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        录单日期：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxDateEdit ID="dxeCreateTime" runat="server" Width="160px" ></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="text-align: left;" colspan="2"></td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
                                            TargetControlID="Panel2" ExpandControlID="Panel1" CollapseControlID="Panel1"
                                            Collapsed="false" TextLabelID="lbl_npCostSummaryHeader" ImageControlID="img_npCostSummaryHeader"
                                            ExpandedText="(展开)" CollapsedText="(隐藏)" ExpandedImage="~/images/collapse_blue.jpg"
                                            CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <asp:Panel ID="npbasicheader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                                            <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                                <div style="float: left; vertical-align: middle;">
                                                    <asp:ImageButton ID="img_npbasicheader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                        AlternateText="" />
                                                </div>
                                                <div style="float: left; margin-left: 5px;">
                                                    车辆信息</div>
                                                <div style="float: left; margin-left: 5px;">
                                                    <asp:Label ID="lbl_npbasicheader" runat="server">(展开)</asp:Label>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="npbasicdetail" runat="server" CssClass="collapsePanel" Height="0">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        车牌号:
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCarNo" ClientInstanceName="dxetxtCarNo" runat="server" Width="110px"></dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        车架号:
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCarcaseNo" ClientInstanceName="dxetxtCarcaseNo" runat="server" Width="110px"></dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        厂牌型号:
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtUseCharacter" ClientInstanceName="dxetxtUseCharacter" runat="server" Width="110px"></dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        发动机号:
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtEngineNo" ClientInstanceName="dxetxtEngineNo" runat="server" Width="110px"></dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        车主:
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCarUser" ClientInstanceName="dxetxtCarUser" runat="server" Width="110px"></dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        核定载客/质量:
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCapacity" ClientInstanceName="dxetxtCapacity" runat="server" Width="110px"></dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        初登日期:
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxDateEdit ID="dxeRegisterDate" ClientInstanceName="dxeRegisterDate" runat="server" Width="110px"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        车辆价值:
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCarValue" ClientInstanceName="dxetxtCarValue" runat="server" Width="110px"></dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="white-space: nowrap; text-align: right;"> </td>
                                                    <td style="text-align: left;"></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>                            
                                                    <td style="text-align:right">
                                                        <dxe:ASPxButton runat="server" id="dxebtntopSave" ClientInstanceName="dxebtntopSave" Text="保存" CausesValidation="true" ValidationGroup="BaseGroup" AutoPostBack="false">
                                                            <ClientSideEvents Click="function(s, e) { dxebtntopSave_Click(s,e); }"></ClientSideEvents>
                                                        </dxe:ASPxButton>
                                                    </td>                      
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <ajaxToolkit:CollapsiblePanelExtender ID="cpeBasic" runat="Server" TargetControlID="npbasicdetail"
                                            ExpandControlID="npbasicheader" CollapseControlID="npbasicheader" Collapsed="false"
                                            TextLabelID="lbl_npbasicheader" ImageControlID="img_npbasicheader" ExpandedText="(展开)"
                                            CollapsedText="(隐藏)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
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
                                                    商业险项目</div>
                                                <div style="float: left; margin-left: 5px;">
                                                    <asp:Label ID="lbl_npGridPolicyItem" runat="server">(展开)</asp:Label>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="npGridPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td>
                                                        <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server"
                                                            KeyFieldName="ItemID" Width="100%" AutoGenerateColumns="False" 
                                                            OnRowInserting="gridPolicyItem_RowInserting"
                                                            OnRowUpdating="gridPolicyItem_RowUpdating" 
                                                            OnRowDeleting="gridPolicyItem_RowDeleting" 
                                                            OnHtmlEditFormCreated="gridPolicyItem_HtmlEditFormCreated"
                                                            OnRowValidating="gridPolicyItem_RowValidating" 
                                                            OnCustomCallback="gridPolicyItem_CustomCallback"
                                                            OnStartRowEditing="gridPolicyItem_StartRowEditing"
                                                            >
                                                            <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left"
                                                                    Width="81" HeaderStyle-Wrap="False" AllowDragDrop="false">
                                                                    <NewButton Visible="true" />
                                                                    <EditButton Visible="true" />
                                                                    <DeleteButton Visible="true" />
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProdName" Caption="保险险种" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Coverage" Caption="保险金额 " CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Premium" Caption="保费" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="ItemID" Caption="ItemID" CellStyle-Wrap="False" Visible="false">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyId" Caption="PolicyId" CellStyle-Wrap="False" Visible="false">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProdID" Caption="ProdID" CellStyle-Wrap="False" Visible="false">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyStatus" Caption="PolicyStatus" CellStyle-Wrap="False" Visible="false">
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                            <TotalSummary>
                                                                <dxwgv:ASPxSummaryItem FieldName="ProdName" SummaryType="Count" DisplayFormat="数量:#" />
                                                                <dxwgv:ASPxSummaryItem FieldName="Coverage" SummaryType="Sum" DisplayFormat="c" />
                                                                <dxwgv:ASPxSummaryItem FieldName="Premium" SummaryType="Sum" DisplayFormat="c" />
                                                            </TotalSummary>
                                                            <%-- EndRegion --%>
                                                            <SettingsPager Mode="ShowAllRecords" />
                                                            <Settings ShowGroupPanel="false" ShowFooter="true" />
                                                            <SettingsBehavior ConfirmDelete="true" AllowDragDrop="false" AllowGroup="false" />
                                                            <ClientSideEvents EndCallback="function(s, e) {gridPolicyItem_EndCallback();}" />
                                                            
                                                            <Templates>
                                                                <EditForm>
                                                                    <div style="padding: 4px 4px 3px 4px">
                                                                        <table style="width: 90%;" runat="server" id="tblgridPolicyItemEditorTemplate">
                                                                            <tr>
                                                                                <td style="white-space: nowrap; text-align: right;">
                                                                                    险种:
                                                                                </td>
                                                                                <td style="text-align: left;">
                                                                                    <dxe:ASPxComboBox runat="server" ID="dxecbGridPolicyItemProdID" AutoPostBack="false"
                                                                                        ClientInstanceName="dxecbGridPolicyItemProdID" DropDownButton-Enabled="true"
                                                                                        DropDownStyle="DropDownList" Width="100px">
                                                                                        <Items>                                                                                            
                                                                                        </Items>
                                                                                        <ClientSideEvents SelectedIndexChanged="" />
                                                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" >
                                                                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                                        </ValidationSettings>
                                                                                    </dxe:ASPxComboBox>
                                                                                </td>
                                                                                <td style="white-space: nowrap; text-align: right;">
                                                                                    保险金额:
                                                                                </td>
                                                                                <td style="text-align: left;">
                                                                                    <dxe:ASPxTextBox ID="dxetxtGridPolicyCoverage" ClientInstanceName="dxetxtGridPolicyCoverage" runat="server" Width="110px">
                                                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" >
                                                                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                                            <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                        </ValidationSettings>
                                                                                    </dxe:ASPxTextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="white-space: nowrap; text-align: right;">
                                                                                    保费:
                                                                                </td>
                                                                                <td style="text-align: left;">
                                                                                    <dxe:ASPxTextBox ID="dxetxtGridPolicyPremium" ClientInstanceName="dxetxtGridPolicyPremium" runat="server" Width="110px">
                                                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                                                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                                            <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
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
                                        <ajaxToolkit:CollapsiblePanelExtender ID="cpeGridPolicyItem" runat="Server" TargetControlID="npGridPolicyItemDetail"
                                            ExpandControlID="npGridPolicyItemHeader" CollapseControlID="npGridPolicyItemHeader"
                                            Collapsed="false" TextLabelID="lbl_npGridPolicyItem" ImageControlID="img_npGridPolicyItem"
                                            ExpandedText="(展开)" CollapsedText="(隐藏)" ExpandedImage="~/images/collapse_blue.jpg"
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
                                                    费用汇总</div>
                                                <div style="float: left; margin-left: 5px;">
                                                    <asp:Label ID="lbl_npCostSummaryHeader" runat="server">(展开)</asp:Label>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="npCostSummaryDetail" runat="server" CssClass="collapsePanel" Height="0">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 150px; text-align: right;">
                                                        商业险保费：
                                                    </td>
                                                    <td style="width: 130px; text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCiPremium" ClientInstanceName="dxetxtCiPremium" runat="server" Width="125px">
                                                            <ValidationSettings  ErrorDisplayMode="ImageWithTooltip" ValidationGroup="BaseGroup">
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                            <ClientSideEvents ValueChanged="function(s,e){
                                                                add_Four_ValueChanged(dxetxtCiPremium,dxetxtAciPremium,dxetxtCstPremium,dxetxtTotalPremium);
                                                                multi_ValueChanged(dxetxtCiPremium,dxetxtCiProcessRate,dxetxtCiProcess,true);
                                                                add_Three_ValueChanged(dxetxtCiProcess,dxetxtAciProcess,dxetxtTotalProcess);
                                                                }" />
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="width: 150px; text-align: right;">
                                                        交强险保费：
                                                    </td>
                                                    <td style="width: 130px; text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtAciPremium" ClientInstanceName="dxetxtAciPremium" runat="server" Width="125px">
                                                            <ValidationSettings  ErrorDisplayMode="ImageWithTooltip" ValidationGroup="BaseGroup">
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                            <ClientSideEvents ValueChanged="function(s,e){
                                                                add_Four_ValueChanged(dxetxtCiPremium,dxetxtAciPremium,dxetxtCstPremium,dxetxtTotalPremium);
                                                                multi_ValueChanged(dxetxtAciPremium,dxetxtAciProcessRate,dxetxtAciProcess,true);
                                                                add_Three_ValueChanged(dxetxtCiProcess,dxetxtAciProcess,dxetxtTotalProcess);
                                                                }" />
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="width: 60px; text-align: right;">
                                                        车船税：
                                                    </td>
                                                    <td style="width: 90px; text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCstPremium" ClientInstanceName="dxetxtCstPremium" runat="server" Width="80px">
                                                            <ValidationSettings  ErrorDisplayMode="ImageWithTooltip" ValidationGroup="BaseGroup">
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                            <ClientSideEvents ValueChanged="function(s,e){
                                                                add_Four_ValueChanged(dxetxtCiPremium,dxetxtAciPremium,dxetxtCstPremium,dxetxtTotalPremium);
                                                                }" />
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="width: 110px; text-align: right;">
                                                        保费合计：
                                                    </td>
                                                    <td style="width: 130px; text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtTotalPremium" ClientInstanceName="dxetxtTotalPremium" runat="server" Width="125px">
                                                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ValidationGroup="BaseGroup">
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                            
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        商业险经纪费率(%)：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCiProcessRate" ClientInstanceName="dxetxtCiProcessRate" runat="server" Width="125px">
                                                            <ValidationSettings  ErrorDisplayMode="ImageWithTooltip" ValidationGroup="BaseGroup">
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                            <ClientSideEvents ValueChanged="function(s,e){
                                                                multi_ValueChanged(dxetxtCiPremium,dxetxtCiProcessRate,dxetxtCiProcess,true);
                                                                add_Three_ValueChanged(dxetxtCiProcess,dxetxtAciProcess,dxetxtTotalProcess);
                                                                }" />
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        交强险经纪费率(%)：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtAciProcessRate" ClientInstanceName="dxetxtAciProcessRate" runat="server" Width="125px">
                                                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ValidationGroup="BaseGroup">
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                            <ClientSideEvents ValueChanged="function(s,e){
                                                                multi_ValueChanged(dxetxtAciPremium,dxetxtAciProcessRate,dxetxtAciProcess,true);
                                                                add_Three_ValueChanged(dxetxtCiProcess,dxetxtAciProcess,dxetxtTotalProcess);
                                                                }" />
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                    </td>
                                                    <td style="text-align: left;">
                                                    </td>
                                                    <td style="text-align: right;">
                                                    </td>
                                                    <td style="text-align: left;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        商业险经纪费：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCiProcess" ClientInstanceName="dxetxtCiProcess" runat="server" Width="125px">
                                                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ValidationGroup="BaseGroup">
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                            <ClientSideEvents ValueChanged="function(s,e){
                                                                add_Three_ValueChanged(dxetxtCiProcess,dxetxtAciProcess,dxetxtTotalProcess);
                                                                }" />
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        交强险经纪费：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtAciProcess" ClientInstanceName="dxetxtAciProcess" runat="server" Width="125px">
                                                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ValidationGroup="BaseGroup">
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                            <ClientSideEvents ValueChanged="function(s,e){
                                                                add_Three_ValueChanged(dxetxtCiProcess,dxetxtAciProcess,dxetxtTotalProcess);
                                                                }" />
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                    </td>
                                                    <td style="text-align: left;">
                                                    </td>
                                                    <td style="text-align: right;">
                                                        经纪费合计：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtTotalProcess" ClientInstanceName="dxetxtTotalProcess" runat="server" Width="125px">
                                                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ValidationGroup="BaseGroup">
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="Server"
                                            TargetControlID="npCostSummaryDetail" ExpandControlID="npCostSummaryHeader" CollapseControlID="npCostSummaryHeader"
                                            Collapsed="false" TextLabelID="lbl_npCostSummaryHeader" ImageControlID="img_npCostSummaryHeader"
                                            ExpandedText="(展开)" CollapsedText="(隐藏)" ExpandedImage="~/images/collapse_blue.jpg"
                                            CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
                                    </td>
                                </tr>
                            </table>
                    
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Text="附件">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl2" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 100%; text-align: left;">
                                    上传附件
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%; text-align: left;">
                                    <dxcp:ASPxCallbackPanel runat="server" ID="filesUploadControlPanel" ClientInstanceName="filesUploadControlPanel" 
                                    OnCallback="filesUploadControlPanel_Callback"
                                    >
                                        <PanelCollection> 
                                            <dxrp:PanelContent ID="filesUploadControlPanelContent" runat="server"> 
                                            
                                                <dxuc:ASPxUploadControl ID="filesUploadControl" ClientInstanceName="filesUploadControl" 
                                                    runat="server" ShowAddRemoveButtons="True"
                                                    Width="400px" ShowUploadButton="True" 
                                                    AddUploadButtonsHorizontalPosition="Center"
                                                    ShowProgressPanel="True" 
                                                    FileInputCount="5" RemoveButtonSpacing="8px" 
                                                    AddUploadButtonsSpacing="10" FileUploadMode="OnPageLoad"
                                                    OnFileUploadComplete="UploadControl_FileUploadComplete"
                                                    >
                                                    <ValidationSettings MaxFileSize="4000000" 
                                                    FileDoesNotExistErrorText="文件不存在" 
                                                    GeneralErrorText="上传发生错误" 
                                                    MaxFileSizeErrorText="文件太大" 
                                                    NotAllowedContentTypeErrorText="不允许上传此类型文件">
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
                                            </dxrp:PanelContent> 
                                        </PanelCollection> 
                                    </dxcp:ASPxCallbackPanel>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%; text-align: left;">
                                    文件列表                                                                        
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
                                            <dxwgv:GridViewDataColumn FieldName="DocName" Caption="文件名" CellStyle-Wrap="False" Width="25" Settings-AllowDragDrop="false">
                                                <DataItemTemplate>
                                                    <a id="fileurl <%# Eval("PolicyDocID") %>" onclick="hlPolicyItemTogetherClick('<%# Eval("DocURL") %>');" href="#"><%# Eval("DocName")%></a>
                                                </DataItemTemplate>
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="DocURL" Caption="链接地址" CellStyle-Wrap="False">
                                            </dxwgv:GridViewDataColumn>                                                                                                        
                                        </Columns>
                                        <%-- EndRegion --%>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <Settings ShowGroupPanel="false" /> 
                                        <ClientSideEvents CustomButtonClick="" />
                                        <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false"  />
                                    </dxwgv:ASPxGridView>                                                            
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Text="分    期" ClientVisible="true">
                    <ContentCollection>
                        <dxw:ContentControl ID="ContentControl4" runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td runat="server" id="tblcellgridPeriod">
                                        <dxwgv:ASPxGridView ID="gridPeriod" ClientInstanceName="gridPeriod" runat="server"
                                            KeyFieldName="PolPeriodId" Width="100%" OnStartRowEditing="gridPeriod_StartRowEditing"
                                            OnRowInserting="gridPeriod_RowInserting" OnRowUpdating="gridPeriod_RowUpdating"
                                            OnRowDeleting="gridPeriod_RowDeleting" OnHtmlEditFormCreated="gridPeriod_HtmlEditFormCreated"
                                            OnCustomCallback="gridPeriod_CustomCallback" OnRowValidating="gridPeriod_RowValidating">
                                            <%-- BeginRegion Columns --%>
                                            <Columns>
                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="false">
                                                    <EditButton Visible="true" />
                                                    <NewButton Visible="false" />
                                                    <DeleteButton Visible="false" />
                                                </dxwgv:GridViewCommandColumn>
                                                <dxwgv:GridViewDataColumn FieldName="Period" Caption="期次" CellStyle-Wrap="false">
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataDateColumn FieldName="PayDate" Caption="付款日期" CellStyle-Wrap="false"
                                                    PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                                </dxwgv:GridViewDataDateColumn>
                                                <dxwgv:GridViewDataColumn FieldName="CarrierNameCn" Caption="保险公司" CellStyle-Wrap="false">
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="分支机构" CellStyle-Wrap="false">
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="PayFeeBase" Caption="保费" CellStyle-Wrap="false">
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="PayProcBase" Caption="经纪费" CellStyle-Wrap="false">
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="PolicyId" Caption="PolicyId" CellStyle-Wrap="false"
                                                    Visible="false">
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="CarrierID" Caption="CarrierID" CellStyle-Wrap="false"
                                                    Visible="false">
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="BranchID" Caption="BranchID" CellStyle-Wrap="false"
                                                    Visible="false">
                                                </dxwgv:GridViewDataColumn>
                                            </Columns>
                                            <%-- EndRegion --%>
                                            
                                            <TotalSummary>
                                                <dxwgv:ASPxSummaryItem FieldName="PayFeeBase" SummaryType="Sum" DisplayFormat="c" />
                                                <dxwgv:ASPxSummaryItem FieldName="PayProcBase" SummaryType="Sum" DisplayFormat="c" />
                                            </TotalSummary>
                                            <SettingsEditing Mode="EditForm" />
                                            <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways"                                                
                                                ShowGroupedColumns="true" ShowFilterRow="false" ShowFooter="true" />
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <SettingsDetail ExportMode="All" />
                                            <SettingsLoadingPanel Mode="ShowAsPopup" ImagePosition="Top" ShowImage="true" Text="Loading" />
                                            <SettingsBehavior AllowDragDrop="true" AllowGroup="true" AllowMultiSelection="false" />
                                            <Styles>
                                                <LoadingDiv>
                                                </LoadingDiv>
                                                <LoadingPanel>
                                                </LoadingPanel>
                                            </Styles>
                                            <Templates>
                                                <EditForm>
                                                    <div style="padding: 4px 4px 3px 4px">
                                                        <table style="width: 90%;" runat="server" id="tblgridPeriodEditorTemplate">
                                                            <tr>
                                                                <td style="white-space: nowrap; text-align: right;">
                                                                    期次:
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxTextBox runat="server" ID="detxtGridPeriodPeriod" ClientInstanceName="detxtGridPeriodPeriod"
                                                                        Enabled="false" ReadOnly="true">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="white-space: nowrap; text-align: right;">
                                                                    付款日期:
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxDateEdit ID="detxtGridPeriodPayDate" ClientInstanceName="detxtGridPeriodPayDate"
                                                                        runat="server">
                                                                        <ValidationSettings RequiredField-IsRequired="true" CausesValidation="true" ErrorDisplayMode="ImageWithTooltip">
                                                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                        </ValidationSettings>
                                                                    </dxe:ASPxDateEdit>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="white-space: nowrap; text-align: right;">
                                                                    保险公司:
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxTextBox runat="server" ID="detxtGridPeriodCarrierNameCn" ClientInstanceName="detxtGridPeriodCarrierNameCn"
                                                                        Enabled="false" ReadOnly="true">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="white-space: nowrap; text-align: right;">
                                                                    分支机构:
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxTextBox runat="server" ID="detxtGridPeriodBranchName" ClientInstanceName="detxtGridPeriodBranchName"
                                                                        Enabled="false" ReadOnly="true">
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="white-space: nowrap; text-align: right;">
                                                                    保费:
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxTextBox runat="server" ID="detxtGridPeriodPayFeeBase" ClientInstanceName="detxtGridPeriodPayFeeBase"
                                                                        ReadOnly="false">
                                                                        <ValidationSettings RequiredField-IsRequired="true" CausesValidation="true" ErrorDisplayMode="ImageWithTooltip">
                                                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                            <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                        </ValidationSettings>
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="white-space: nowrap; text-align: right;">
                                                                    经纪费:
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxTextBox runat="server" ID="detxtGridPeriodPayProcBase" ClientInstanceName="detxtGridPeriodPayProcBase"
                                                                        ReadOnly="false">
                                                                        <ValidationSettings RequiredField-IsRequired="true" CausesValidation="true" ErrorDisplayMode="ImageWithTooltip">
                                                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                            <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
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
            <dxtc:TabPage Text="审核信息">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl3" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 10%; text-align: right;">
                                    审核人：
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtAuditPerson" ClientInstanceName="dxetxtAuditPerson" runat="server" Width="100px" ReadOnly="true"></dxe:ASPxTextBox>
                                </td>
                                <td style="width: 10%; text-align: right;">
                                    审核日期：
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <dxe:ASPxDateEdit ID="dxeAuditTime" ClientInstanceName="dxeAuditTime" runat="server" Width="120px" ReadOnly="true">
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; vertical-align: top;">
                                    审核备注：
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
                                <td>
                                    <dxe:ASPxButton runat="server" id="dxebtnAuditBack" ClientInstanceName="dxebtnAuditBack" Text="退回修改" CausesValidation="false" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s, e) {dxebtnAuditBackClick(s,e);}" />
                                    </dxe:ASPxButton>
                                </td>                                
                                <td>
                                    <dxe:ASPxButton runat="server" id="dxebtnAuditOk" ClientInstanceName="dxebtnAuditOk" Text="通过审核" CausesValidation="false" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s, e) {dxebtnAuditOkClick(s,e);}" />
                                    </dxe:ASPxButton>
                                </td>
                                <td>
                                    <dxe:ASPxButton runat="server" id="dxebtnAuditClose" ClientInstanceName="dxebtnAuditClose" Text="关闭" CausesValidation="false" AutoPostBack="false">
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
    
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="30px">
        <table style="width: 100%" runat="server" id="tblNewExecuteAction">
            <tr>
                <td style="width: 400px; text-align: left;">
                    &nbsp;
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnBottomAdd" ClientInstanceName="dxebtnBottomAdd" Text="新增" CausesValidation="true" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnAddClick(s,e);}" />
                    </dxe:ASPxButton> 
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnBottomSave" ClientInstanceName="dxebtnBottomSave" Text="保存" CausesValidation="true" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {dxebtntopSave_Click(s,e);}" />
                    </dxe:ASPxButton> 
                </td>
                <td style="width:70px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnBottomCheck" ClientInstanceName="dxebtnBottomCheck" Text="提交审核" CausesValidation="true" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnSaveCheckClick(s,e);}" />
                    </dxe:ASPxButton> 
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnCancel" ClientInstanceName="dxebtnCancel" Text="重置" CausesValidation="false" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnCancelClick();}" />
                    </dxe:ASPxButton>
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxeClose" ClientInstanceName="dxeClose" Text="关闭" CausesValidation="false" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnCloseClick();}" />
                    </dxe:ASPxButton>
                </td>                
            </tr>
            <tr>
                <td style="width: 400px; text-align: left;">
                    &nbsp;
                </td>
                <td style="display:none;"><a id="hrefnewpolicy" href="CarPolicyInput.aspx?pagemode=input">New</a></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </asp:Panel>

</asp:Content>
