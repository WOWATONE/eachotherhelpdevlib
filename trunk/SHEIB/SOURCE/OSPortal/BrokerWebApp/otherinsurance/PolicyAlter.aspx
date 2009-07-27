<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="PolicyAlter.aspx.cs" Inherits="BrokerWebApp.otherinsurance.PolicyAlter" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v8.3" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dxwsc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保单批改</title>
    
    
    <script type="text/javascript">

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

        var npbasicdetail = null;
        var tblNewExecuteAction = null;
        var tbltrAuditExecuteAction = null;


        function getServerControlRefStubs() {
            
            if ($("#<%=npbasicdetail.ClientID %>").length > 0) {
                npbasicdetail = $("#<%=npbasicdetail.ClientID %>")[0];

            }

            
            if ($("#<%=npCostSummaryDetail.ClientID %>").length > 0) {
                npCostSummaryDetail = $("#<%=npCostSummaryDetail.ClientID %>")[0];
            }

            if ($("#<%=npPolicyCompanyDetail.ClientID %>").length > 0) {
                npPolicyCompanyDetail = $("#<%=npPolicyCompanyDetail.ClientID %>")[0];
            }


            if ($("#<%=tblNewExecuteAction.ClientID %>").length > 0) {
                tblNewExecuteAction = $("#<%=tblNewExecuteAction.ClientID %>")[0];
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

                var policyTabPage = pWindow.policyTabPage;
                if (policyTabPage != null) {
                    policyTabPage.SetActiveTab(policyTabPage.tabs[0]);
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
            if (isEmpty(pid)) {
                return true;
            }
            else {
                return false;
            }

        }

        function setOnlyAllDxeButtonsUnableOrEnable(val) {
            if (typeof (dxebtnBottomAdd) != 'undefined' && dxebtnBottomAdd != null)
                dxebtnBottomAdd.SetEnabled(val);

            if (typeof (dxebtnBottomSave) != 'undefined' && dxebtnBottomSave != null)
                dxebtnBottomSave.SetEnabled(val);

            if (typeof (dxebtnBottomCheck) != 'undefined' && dxebtnBottomCheck != null)
                dxebtnBottomCheck.SetEnabled(val);

            if (typeof (dxebtnCancel) != 'undefined' && dxebtnCancel != null)
                dxebtnCancel.SetEnabled(val);
        }
        
        function setOnlyDxeButtonsUnableOrEnable(val) {
            //if (typeof (dxebtnBottomAdd) != 'undefined' && dxebtnBottomAdd != null)
            //    dxebtnBottomAdd.SetEnabled(val);

            //if (typeof (dxebtnBottomSave) != 'undefined' && dxebtnBottomSave != null)
            //    dxebtnBottomSave.SetEnabled(val);

            if (typeof (dxebtnBottomCheck) != 'undefined' && dxebtnBottomCheck != null)
                dxebtnBottomCheck.SetEnabled(val);

            if (typeof (dxebtnCancel) != 'undefined' && dxebtnCancel != null)
                dxebtnCancel.SetEnabled(val);
        }

        function setDxeButtonsUnableOrEnable(val) {
            setOnlyDxeButtonsUnableOrEnable(val);


            insuranceDetailTabPage.tabs[1].SetEnabled(val);
            insuranceDetailTabPage.tabs[2].SetEnabled(val);
            

            if ((typeof (gridCarrier) != 'undefined') && gridCarrier != null) {
                gridCarrier.SetClientVisible(val);
            }

            //dxetxtCoverage.SetEnabled(val);
            //dxetxtPremiumRate.SetEnabled(val);
            //dxetxtProcessRate.SetEnabled(val);
            //dxeddlCurrency.SetEnabled(val);
            //dxetxtPremium.SetEnabled(val);
            //dxetxtProcess.SetEnabled(val);
            //dxetxtConversionRate.SetEnabled(val);
            //dxetxtPremiumBase.SetEnabled(val);
            //dxetxtProcessBase.SetEnabled(val);

        }

        function policyBaseCompleteEnable() {
            var result, panel;
            //npCostSummaryDetail.parentElement.removeAttribute('disabled', 'true');
            npPolicyCompanyDetail.parentElement.removeAttribute('disabled', 'true');
            //tblNewExecuteAction.parentElement.removeAttribute('disabled', 'true');
            setDxeButtonsUnableOrEnable(true);
            
        }



        function policyBaseCompleteUnable() {

            if (policyCheckNessary()) {
                    //npCostSummaryDetail.parentElement.setAttribute('disabled', 'true');
                    npPolicyCompanyDetail.parentElement.setAttribute('disabled', 'true');
                    //tblNewExecuteAction.parentElement.setAttribute('disabled', 'true');
                    
                    setDxeButtonsUnableOrEnable(false);
                }

        }






        function makePolicyJSON() {
            var AuditOrNot = null;
            var Beneficiary = dxetxtBeneficiary.GetValueString();
            var CarrierSales = null;
            var ConversionRate = dxetxtConversionRate.GetValueString();
            var Coverage = dxetxtCoverage.GetValueString();
            var Currency = dxeddlCurrency.GetValue();
            var CustomerID = getCustomerID();
            var DeptId = dxeddlDeptID.GetValue();
            var EndDate = dxeEndDate.GetValue();
            var FlagReinsure = null;
            var FlagTogether = null;
            var GatheringType = dxeddlGatheringType.GetValue();
            var OperationType = dxeddlOperationType.GetValue();
            var PeriodTimes = dxetxtStage.GetValueString();
            var PolicyID = dxetxtPolicyID.GetValueString();
            var PolicyNo = dxetxtPolicyNo.GetValueString();
            var PolicyStatus = null;
            var Premium = dxetxtPremium.GetValueString();
            var PremiumBase = dxetxtPremiumBase.GetValueString();
            var PremiumRate = dxetxtPremiumRate.GetValueString();
            var Process = dxetxtProcess.GetValueString();
            var ProcessBase = dxetxtProcessBase.GetValueString();
            var ProcessRate = dxetxtProcessRate.GetValueString();
            var ProdTypeID = getProductTypeID(); //dxeddlProdTypeName.GetValue();
            var Remark = dxeAppendRemark.GetValueString();
            var SalesId = dxeddlSalesId.GetValue();
            var SignDate = null;
            var SourceTypeID = dxeddlSourceTypeID.GetValue();
            var Special = null;
            var StartDate = dxeStartDate.GetValue();
            

            var plc = new Policy(AuditOrNot,
            Beneficiary, CarrierSales, ConversionRate, Coverage,
            Currency, CustomerID, DeptId, EndDate,
            FlagReinsure, FlagTogether, GatheringType,
            OperationType, PeriodTimes, PolicyID, PolicyNo,
            PolicyStatus, Premium, PremiumBase, PremiumRate,
            Process, ProcessBase, ProcessRate, ProdTypeID,
            Remark, SalesId, SignDate, SourceTypeID, Special,
            StartDate);

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
            
            var theresult = e.result;
            switch (theresult) {
                case "policynoexist":
                    resultMsg.style.display = "inline";
                    resultMsg.style.fontsize = "9px";
                    resultMsg.innerHTML = "保单编号不唯一";
                    break
                default:
                    //do nothing;
                    policyBaseCompleteEnable();
                    resultMsg.style.display = "inline";
                    resultMsg.style.fontsize = "9px";
                    resultMsg.innerHTML = "保存成功";
                    var pid = dxetxtPolicyID.GetValueString();
                    if (isEmpty(pid)) {
                        dxetxtPolicyID.SetValue(e.result);
                    }
            }
        }

        
        function btnSaveCheckClick(s, e) {
            var thejsonstring = makePolicyJSON();
            dxeSaveAndCheckCallback.PerformCallback(thejsonstring);
        }


        function saveCheckCallbackComplete(s, e) {
            var theresult = e.result;
            switch (theresult) {
                case "policynoexist":
                    resultMsg.style.display = "inline";
                    resultMsg.style.fontsize = "9px";
                    resultMsg.innerHTML = "保单编号不唯一";
                    break
                default:
                    resultMsg.style.display = "inline";
                    resultMsg.style.fontsize = "9px";
                    resultMsg.innerHTML = "提交成功";
                    setOnlyAllDxeButtonsUnableOrEnable(false);            
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



        function GridCarrierCarrier_SelectedIndexChanged(s, e) {
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



        function Policy(AuditOrNot, Beneficiary, CarrierSales, ConversionRate, Coverage,
            Currency, CustomerID, DeptId, EndDate,
            FlagReinsure, FlagTogether, GatheringType,
            OperationType, PeriodTimes, PolicyID, PolicyNo,
            PolicyStatus, Premium, PremiumBase, PremiumRate,
            Process, ProcessBase, ProcessRate, ProdTypeID,
            Remark, SalesId, SignDate, SourceTypeID, Special,
            StartDate) {


            if (!isEmpty(AuditOrNot))
                this.AuditOrNot = AuditOrNot;

            if (!isEmpty(Beneficiary))
                this.Beneficiary = Beneficiary;

            if (!isEmpty(CarrierSales))
                this.CarrierSales = CarrierSales;

            if (!isEmpty(ConversionRate))
                this.ConversionRate = ConversionRate;

            if (!isEmpty(Coverage))
                this.Coverage = Coverage;

            if (!isEmpty(Currency))
                this.Currency = Currency;

            if (!isEmpty(CustomerID))
                this.CustomerID = CustomerID;

            if (!isEmpty(DeptId))
                this.DeptId = DeptId;

            if (!isEmpty(EndDate))
                this.EndDate = EndDate;

            if (!isEmpty(FlagReinsure))
                this.FlagReinsure = FlagReinsure;

            if (!isEmpty(FlagTogether))
                this.FlagTogether = FlagTogether;

            if (!isEmpty(GatheringType))
                this.GatheringType = GatheringType;

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

            if (!isEmpty(Premium))
                this.Premium = Premium;

            if (!isEmpty(PremiumBase))
                this.PremiumBase = PremiumBase;

            if (!isEmpty(PremiumRate))
                this.PremiumRate = PremiumRate;

            if (!isEmpty(Process))
                this.Process = Process;

            if (!isEmpty(ProcessBase))
                this.ProcessBase = ProcessBase;

            if (!isEmpty(ProcessRate))
                this.ProcessRate = ProcessRate;

            if (!isEmpty(ProdTypeID))
                this.ProdTypeID = ProdTypeID;

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


        function btnCancelClick() {
            window.document.forms[0].reset();
            //ASPxClientEdit.ClearEditorsInContainer(null);
        }

        function btnCloseClick() {
            window.close();
        }

        function policyTab_Changing(s, e) {
            //debugger;
            if (e.tab.index == 1 || e.tab.index == 2) {
                //refresh perieodtime grid
                //gridPeriod.PerformCallback();
                var element = s.GetContentElement(e.tab.index);
                if (element != null) element.loaded = false;
            }
        }

        function policyTab_Click(s, e) {
            //
        }


        function SelectedProdTypeNameIndexChanged(s, e) {
            var thevalue = s.GetValue();
            setProductTypeID(thevalue);
            var test = s.GetText();
            var sValue = s.GetValue();

            if (test.length > 0) {
                var index = test.lastIndexOf("∟");
                if (index >= 0) {
                    var testTmp = test.substr(index + 1);
                    s.SetText(testTmp);
                }
            }
        }
                
    </script>
    
    <script type="text/javascript">
    
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
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    

    <dxcb:ASPxCallback ID="dxeSaveCallback" ClientInstanceName="dxeSaveCallback" runat="server"
        OnCallback="dxeSaveCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {saveCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="dxeSaveAndCheckCallback" ClientInstanceName="dxeSaveAndCheckCallback"
        runat="server" OnCallback="dxeSaveAndCheckCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {saveCheckCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    
    
    
    <span id="resultMsg" class="errorMSG" style="margin-top:2px; margin-left:8px;">&nbsp;</span>
    <asp:Panel ID="nppagecontent" runat="server">
    
    
    <dxtc:ASPxPageControl ID="insuranceDetailTabPage" ClientInstanceName="insuranceDetailTabPage"
        runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%" AutoPostBack="false" EnableCallBacks="true" 
        OnActiveTabChanged="insuranceDetailTabPage_ActiveTabChanged">
        <ClientSideEvents ActiveTabChanging="function(s, e) {policyTab_Changing(s,e);}" TabClick="function(s, e) {policyTab_Click(s,e);}" />
        <TabPages>
            <dxtc:TabPage Text="批单">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl1" runat="server">
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
                                                基本数据</div>
                                            <div style="float: left; margin-left: 5px;">
                                                <asp:Label ID="lbl_npbasicheader" runat="server">(展开)</asp:Label>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="npbasicdetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width: 100%">
                                            <tr style="height:5px;">
                                                <td style="width:80px;"></td>
                                                <td style="width:185px;"></td>
                                                <td style="width:80px;"></td>
                                                <td style="width:130px;"></td>
                                                <td style="width:80px;"></td>
                                                <td style="width:130px;"></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    原保单编号：
                                                </td>
                                                <td style="text-align: left;" colspan="3">
                                                    <table style="margin-left:-3px; width:175px; text-align:left;">
                                                        <tr>
                                                            <td>
                                                                <asp:Label runat="server" ID="lblSourcePolicyID"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox runat="server" ID="chkTogether" Text="共保" />
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox runat="server" ID="chkAgain" Text="再保" />
                                                            </td>
                                                            <td>
                                                                <dxe:ASPxButton AutoPostBack="False" runat="server" ID="btnOriginalPolicyDetail"
                                                                    Text="查看保单" Style="margin: 0px;" Visible="false">
                                                                    <ClientSideEvents Click="function(s, e) {return false;}" />
                                                                </dxe:ASPxButton>
                                                            </td>
                                                        </tr>
                                                    </table>                                                    
                                                </td> 
                                                <td style="text-align: right;">
                                                        保单编号：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server"
                                                        Width="125px">
                                                    </dxe:ASPxTextBox>
                                                </td>                                               
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    投保单号：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server" Width="125px" ReadOnly="true"></dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    期次：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtStage" ClientInstanceName="dxetxtStage" runat="server"
                                                        Width="125px">
                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="true"
                                                            ValidationGroup="BaseGroup">
                                                            <RegularExpression ValidationExpression="^\d+(\d+)?" ErrorText="格式不对" />
                                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                                        </ValidationSettings>
                                                    </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    客户经理：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server"
                                                        Width="125px" DropDownStyle="DropDownList" OnCallback="dxeddlSalesIdCallback">
                                                        <Items>
                                                        </Items>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    投保人：
                                                </td>
                                                <td style="text-align: left;">
                                                    <table style="margin-left:-3px; width:175px;">
                                                        <tr>
                                                                <td style="text-align:left; width:135px">
                                                                    <dxe:ASPxTextBox ID="dxetxtCustomer" ClientInstanceName="dxetxtCustomer" runat="server" Width="100px">
                                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="false"
                                                                            ValidationGroup="BaseGroup">
                                                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                        </ValidationSettings>
                                                                    </dxe:ASPxTextBox>                                                                    
                                                                </td>
                                                                <td><input type="hidden" id="cusid" runat="server" /></td>
                                                                <td style="text-align:left; width:20px">
                                                                    <img runat="server" id="imgNewCustomer" onclick="imgNewCustomerClick();" alt="" src="../images/add_user_icon.png"
                                                                        style="width: 20px; height: 20px; vertical-align: top;" />
                                                                </td>
                                                                <td style="text-align:left; width:20px">
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
                                                    <dxe:ASPxTextBox ID="dxetxtBeneficiary" ClientInstanceName="dxetxtBeneficiary" runat="server"
                                                            Width="125px">
                                                        </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    保险险种：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlProdTypeName" ClientInstanceName="dxeddlProdTypeName"
                                                            runat="server" Width="160px" DropDownStyle="DropDownList">
                                                            <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
                                                                <RequiredField ErrorText="不能为空" IsRequired="True" />                                                                                                                              
                                                            </ValidationSettings>
                                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {SelectedProdTypeNameIndexChanged(s, e); return false;}" />  
                                                        </dxe:ASPxComboBox>
                                                        <input type="hidden" id="ptid" runat="server" />
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    批单期限：
                                                </td>
                                                <td style="text-align: left;" colspan="2">
                                                    <table style="margin-left:-3px;">
                                                        <tr>
                                                            <td>
                                                                <dxe:ASPxDateEdit ID="dxeStartDate" ClientInstanceName="dxeStartDate" runat="server" Width="110px">
                                                                    <ClientSideEvents DateChanged="function(s, e) { dxeStartDate_DateChanged(s,e); }" /> 
                                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="false"
                                                                        ValidationGroup="BaseGroup">
                                                                        <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                    </ValidationSettings>
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                            <td>
                                                                至
                                                            </td>
                                                            <td>
                                                                <dxe:ASPxDateEdit ID="dxeEndDate" ClientInstanceName="dxeEndDate" runat="server" Width="110px">
                                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="false"
                                                                        ValidationGroup="BaseGroup">
                                                                        <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                    </ValidationSettings>
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                
                                                <td style="text-align: right;">
                                                    <dxe:ASPxButton runat="server" ID="dxebtntopSave" ClientInstanceName="dxebtntopSave"
                                                        Text="保存" CausesValidation="true" ValidationGroup="BaseGroup" AutoPostBack="false">
                                                        <ClientSideEvents Click="function(s, e) { dxebtntopSave_Click(s,e); }"></ClientSideEvents>
                                                    </dxe:ASPxButton>
                                                </td>
                                                <td style="text-align: left;"></td>
                                                <td style="text-align: right;"></td>
                                                <td></td>
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
                                    <asp:Panel ID="nppostilecontentHeader" runat="server" CssClass="collapsePanelHeader"
                                        Height="25px">
                                        <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                            <div style="float: left; vertical-align: middle;">
                                                <asp:ImageButton ID="img_nppostilecontentHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                    AlternateText="" />
                                            </div>
                                            <div style="float: left; margin-left: 5px;">
                                                批改内容</div>
                                            <div style="float: left; margin-left: 5px;">
                                                <asp:Label ID="lbl_nppostilecontentHeader" runat="server">(展开)</asp:Label>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="nppostilecontentDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="text-align: left; width: 100%">
                                                    <dxe:ASPxMemo runat="server" id="dxeAppendRemark" ClientInstanceName="dxeAppendRemark" Rows="10" Columns="185"></dxe:ASPxMemo>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <ajaxToolkit:CollapsiblePanelExtender ID="cpepostilecontent" runat="Server" TargetControlID="nppostilecontentDetail"
                                        ExpandControlID="nppostilecontentHeader" CollapseControlID="nppostilecontentHeader"
                                        Collapsed="false" TextLabelID="lbl_nppostilecontentHeader" ImageControlID="img_nppostilecontentHeader"
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
                                                <tr style="font-size: 1px; height: 2px;">
                                                    <td style="width:80px;">
                                                    </td>
                                                    <td style="width:130px;">
                                                    </td>
                                                    <td style="width:80px;">
                                                    </td>
                                                    <td style="width:130px;">
                                                    </td>
                                                    <td style="width:80px;">
                                                    </td>
                                                    <td style="width:130px;">
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        保额：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCoverage" ClientInstanceName="dxetxtCoverage" runat="server"
                                                            Width="120px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                            <ClientSideEvents ValueChanged="function(s,e){division_ValueChanged(dxetxtPremium,dxetxtCoverage,dxetxtPremiumRate,true);}" />
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        费率(%)：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtPremiumRate" ClientInstanceName="dxetxtPremiumRate" runat="server"
                                                            Width="120px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        经纪费率(%)：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtProcessRate" ClientInstanceName="dxetxtProcessRate" runat="server"
                                                            Width="120px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        币种：
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxComboBox ID="dxeddlCurrency" ClientInstanceName="dxeddlCurrency" runat="server"
                                                            Width="120px" DropDownStyle="DropDownList">
                                                            <Items>
                                                                <dxe:ListEditItem Text="(全部)" Value="" />
                                                            </Items>
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        保费(原)：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtPremium" ClientInstanceName="dxetxtPremium" runat="server"
                                                            Width="120px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                            <ClientSideEvents ValueChanged="function(s,e){multi_ValueChanged(dxetxtPremium,dxetxtConversionRate,dxetxtPremiumBase,false);division_ValueChanged(dxetxtPremium,dxetxtCoverage,dxetxtPremiumRate,true);division_ValueChanged(dxetxtProcess,dxetxtPremium,dxetxtProcessRate,true);}" />
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        经纪费(原)：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtProcess" ClientInstanceName="dxetxtProcess" runat="server"
                                                            Width="120px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                            <ClientSideEvents ValueChanged="function(s,e){multi_ValueChanged(dxetxtProcess,dxetxtConversionRate,dxetxtProcessBase,false);division_ValueChanged(dxetxtProcess,dxetxtPremium,dxetxtProcessRate,true);}" />
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        换算汇率：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtConversionRate" ClientInstanceName="dxetxtConversionRate"
                                                            runat="server" Width="120px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                            <ClientSideEvents ValueChanged="function(s,e){multi_ValueChanged(dxetxtProcess,dxetxtConversionRate,dxetxtProcessBase,false); multi_ValueChanged(dxetxtPremium,dxetxtConversionRate,dxetxtPremiumBase,false);}" />
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        保费(本)：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtPremiumBase" ClientInstanceName="dxetxtPremiumBase" runat="server"
                                                            Width="120px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        经纪费(本)：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtProcessBase" ClientInstanceName="dxetxtProcessBase" runat="server"
                                                            Width="120px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
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
                                                保险公司</div>
                                            <div style="float: left; margin-left: 5px;">
                                                <asp:Label ID="lbl_npPolicyCompanyHeader" runat="server">(展开)</asp:Label>
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
                                                        KeyFieldName="CarrierID" Width="100%" AutoGenerateColumns="False" OnStartRowEditing="gridCarrier_StartRowEditing"
                                                        OnRowInserting="gridCarrier_RowInserting" 
                                                        OnRowUpdating="gridCarrier_RowUpdating"
                                                        OnRowDeleting="gridCarrier_RowDeleting"
                                                        OnHtmlEditFormCreated="gridCarrier_HtmlEditFormCreated"
                                                        OnRowValidating="gridCarrier_RowValidating"
                                                        >
                                                        <%-- BeginRegion Columns --%>
                                                        <Columns>
                                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left"
                                                                Width="81" HeaderStyle-Wrap="False" AllowDragDrop="False">
                                                                <NewButton Visible="True" />
                                                                <EditButton Visible="true" />
                                                                <DeleteButton Visible="true" />
                                                                <CustomButtons>
                                                                    <dxwgv:GridViewCommandColumnCustomButton ID="btngridCarrierTogether" Text="再保">
                                                                    </dxwgv:GridViewCommandColumnCustomButton>
                                                                </CustomButtons>
                                                            </dxwgv:GridViewCommandColumn>
                                                            <dxwgv:GridViewDataTextColumn FieldName="CarrierNameCn" Caption="保险公司" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="分支机构" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="PolicyRate" Caption="份额比例(%)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Premium" Caption="保费(原)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Premium" Caption="保费(本)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="ProcessRate" Caption="经纪费率(%)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Process" Caption="经纪费(原)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Process" Caption="经纪费(本)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                        </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <Settings ShowGroupPanel="false" />
                                                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCarrierCustomButtonClick(s,e);return false;}" />
                                                        <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
                                                            
                                                        <Templates>
                                                            <EditForm>
                                                                <div style="padding: 4px 4px 3px 4px">
                                                                    <table style="width: 90%;" runat="server" id="tblgridCarrierEditorTemplate">
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                保险公司:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxComboBox runat="server" ID="dxecbGridCarrierCarrierID" AutoPostBack="false"
                                                                                        ClientInstanceName="dxecbGridCarrierCarrierID" DropDownButton-Enabled="true"
                                                                                        DropDownStyle="DropDownList" Width="120px">
                                                                                        <Items>
                                                                                        </Items>
                                                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                                                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                                        </ValidationSettings>
                                                                                        <ClientSideEvents SelectedIndexChanged="GridCarrierCarrier_SelectedIndexChanged" />
                                                                                    </dxe:ASPxComboBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                分支机构:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxComboBox runat="server" ID="dxecbGridCarrierBranchID" AutoPostBack="false"
                                                                                        ClientInstanceName="dxecbGridCarrierBranchID" DropDownButton-Enabled="true" DropDownStyle="DropDownList"
                                                                                        Width="120px" OnCallback="dxecbGridCarrierBranchIDCallback">
                                                                                        <Items>
                                                                                        </Items>
                                                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                                                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                                        </ValidationSettings>
                                                                                        <ClientSideEvents SelectedIndexChanged="" />
                                                                                    </dxe:ASPxComboBox>
                                                                            </td>
                                                                            <td></td>
                                                                            <td></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                份额比例(%):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridCarrierPolicyRate" ClientInstanceName="dxetxtGridCarrierPolicyRate"
                                                                                    runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                保费(原):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridCarrierPremium" ClientInstanceName="dxetxtGridCarrierPremium"
                                                                                    runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                    保费(本):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridCarrierPremiumBase" ClientInstanceName="dxetxtGridCarrierPremiumBase"
                                                                                    runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>                                                                                
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                经纪费率(%):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridCarrierProcessRate" ClientInstanceName="dxetxtGridCarrierProcessRate"
                                                                                    runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                经纪费(原):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridCarrierProcess" ClientInstanceName="dxetxtGridCarrierProcess"
                                                                                    runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                经纪费(本):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridCarrierProcessBase" ClientInstanceName="dxetxtGridCarrierProcessBase"
                                                                                    runat="server" Width="120px">
                                                                                    <ValidationSettings>
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
                                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
                                        TargetControlID="npPolicyCompanyDetail" ExpandControlID="npPolicyCompanyHeader"
                                        CollapseControlID="npPolicyCompanyHeader" Collapsed="false" TextLabelID="lbl_npPolicyCompanyHeader"
                                        ImageControlID="img_npPolicyCompanyHeader" ExpandedText="(展开)" CollapsedText="(隐藏)"
                                        ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                                        SuppressPostBack="true" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%;">
                                    <asp:Panel ID="npOtherPolicyItemHeader" runat="server" CssClass="collapsePanelHeader"
                                        Height="25px">
                                        <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                            <div style="float: left; vertical-align: middle;">
                                                <asp:ImageButton ID="img_npOtherPolicyItemHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                    AlternateText="" />
                                            </div>
                                            <div style="float: left; margin-left: 5px;">
                                                其它项目</div>
                                            <div style="float: left; margin-left: 5px;">
                                                <asp:Label ID="lbl_npOtherPolicyItemHeader" runat="server">(展开)</asp:Label>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="npOtherPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 11%; text-align: right;">
                                                    部门：
                                                </td>
                                                <td style="width: 22%; text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server"
                                                            Width="125px" DropDownStyle="DropDownList">
                                                            <Items>
                                                            </Items>
                                                            <ClientSideEvents SelectedIndexChanged="dxeddlDeptID_SelectedIndexChanged" />
                                                        </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 11%; text-align: right;">
                                                    
                                                </td>
                                                <td style="width: 22%; text-align: left;">
                                                    
                                                </td>
                                                <td style="width: 11%; text-align: right;">
                                                </td>
                                                <td style="width: 22%; text-align: left;">
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    业务性质：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlOperationType" ClientInstanceName="dxeddlOperationType"
                                                            runat="server" Width="125px" DropDownStyle="DropDownList">
                                                            <Items>
                                                            </Items>
                                                        </dxe:ASPxComboBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    业务来源：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlSourceTypeID" ClientInstanceName="dxeddlSourceTypeID"
                                                            runat="server" Width="125px" DropDownStyle="DropDownList">
                                                            <Items>
                                                            </Items>
                                                        </dxe:ASPxComboBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    收款方式：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlGatheringType" ClientInstanceName="dxeddlGatheringType"
                                                            runat="server" Width="125px" DropDownStyle="DropDownList">
                                                            <Items>
                                                            </Items>
                                                        </dxe:ASPxComboBox>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    录单人：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtCreatePerson" ClientInstanceName="dxetxtCreatePerson"
                                                            runat="server" Width="125px" ReadOnly="true">
                                                    </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    录单日期：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxDateEdit ID="dxedtCreateTime" ClientInstanceName="dxedtCreateTime" runat="server"
                                                            Width="100px" ReadOnly="true">
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <ajaxToolkit:CollapsiblePanelExtender ID="cpeOtherPolicyItem" runat="Server" TargetControlID="npOtherPolicyItemDetail"
                                        ExpandControlID="npOtherPolicyItemHeader" CollapseControlID="npOtherPolicyItemHeader"
                                        Collapsed="false" TextLabelID="lbl_npOtherPolicyItemHeader" ImageControlID="img_npOtherPolicyItemHeader"
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
                                    附件
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%; text-align: left;">
                                    <dxuc:ASPxUploadControl ID="filesUploadControl" ClientInstanceName="filesUploadControl"
                                            runat="server" ShowAddRemoveButtons="True" Width="400px" ShowUploadButton="True"
                                            AddUploadButtonsHorizontalPosition="Center" ShowProgressPanel="True" FileInputCount="5"
                                            RemoveButtonSpacing="8px" AddUploadButtonsSpacing="10" FileUploadMode="OnPageLoad"
                                            OnPreRender="UploadControl_PreRender" OnFileUploadComplete="UploadControl_FileUploadComplete">
                                            <ValidationSettings MaxFileSize="4000000" FileDoesNotExistErrorText="文件不存在" GeneralErrorText="上传发生错误"
                                                MaxFileSizeErrorText="文件太大" NotAllowedContentTypeErrorText="不允许上传此类型文件">
                                            </ValidationSettings>
                                            <ClientSideEvents FilesUploadComplete="function(s, e) { FileUploaded(s, e) }" FileUploadStart="function(s, e) { FileUploadStart(s, e); }" />
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
                                        文件列表
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; text-align: left;" runat="server" id="tblcellgridDocList">
                                        <dxwgv:ASPxGridView ID="gridDocList" ClientInstanceName="gridDocList" runat="server"
                                            KeyFieldName="PolicyDocID" Width="100%" AutoGenerateColumns="False" OnCustomCallback="gridDocList_CustomCallback">
                                            <%-- BeginRegion Columns --%>
                                            <Columns>
                                                <dxwgv:GridViewDataColumn FieldName="DocName" Caption="文件名" CellStyle-Wrap="False"
                                                    Width="25" Settings-AllowDragDrop="false">
                                                    <DataItemTemplate>
                                                        <a id="fileurl <%# Eval("PolicyDocID") %>" onclick="hlPolicyItemTogetherClick('<%# Eval("DocURL") %>');"
                                                            href="#">
                                                            <%# Eval("DocName")%></a>
                                                    </DataItemTemplate>
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="DocURL" Caption="链接地址" CellStyle-Wrap="False">
                                                </dxwgv:GridViewDataColumn>
                                            </Columns>
                                            <%-- EndRegion --%>
                                            <SettingsPager Mode="ShowAllRecords" />
                                            <Settings ShowGroupPanel="false" />
                                            <ClientSideEvents CustomButtonClick="" />
                                            <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
                                        </dxwgv:ASPxGridView>
                                    </td>
                                </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Text="分    期" ClientVisible="true">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl3" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <dxwgv:ASPxGridView ID="gridPeriod" ClientInstanceName="gridPeriod" runat="server"
                                            KeyFieldName="PolPeriodId" Width="100%" OnStartRowEditing="gridPeriod_StartRowEditing"
                                            OnRowInserting="gridPeriod_RowInserting" 
                                            OnRowUpdating="gridPeriod_RowUpdating"
                                            OnRowDeleting="gridPeriod_RowDeleting"
                                            OnHtmlEditFormCreated="gridPeriod_HtmlEditFormCreated"
                                            OnCustomCallback="gridPeriod_CustomCallback" 
                                            OnRowValidating="gridPeriod_RowValidating">
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
                                            <SettingsEditing Mode="EditForm" />
                                            <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways"
                                                ShowGroupedColumns="true" ShowFilterRow="false" />
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <SettingsDetail ExportMode="All" />
                                            <SettingsLoadingPanel Mode="ShowAsPopup" ImagePosition="Top" ShowImage="true" Text="Loading" />
                                            <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
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
                    <td style="width: 50px; text-align: left;">
                        
                    </td>
                    <td style="width: 50px; text-align: left;">
                        <dxe:ASPxButton runat="server" ID="dxebtnBottomSave" ClientInstanceName="dxebtnBottomSave"
                            Text="保存" CausesValidation="true" AutoPostBack="false">
                            <ClientSideEvents Click="function(s, e) {dxebtntopSave_Click(s,e);}" />
                        </dxe:ASPxButton>
                    </td>
                    <td style="width: 70px; text-align: left;">
                        <dxe:ASPxButton runat="server" ID="dxebtnBottomCheck" ClientInstanceName="dxebtnBottomCheck"
                            Text="提交审核" CausesValidation="true" AutoPostBack="false">
                            <ClientSideEvents Click="function(s, e) {btnSaveCheckClick(s,e);}" />
                        </dxe:ASPxButton>
                    </td>
                    <td style="width: 50px; text-align: left;">
                        <dxe:ASPxButton runat="server" ID="dxebtnCancel" ClientInstanceName="dxebtnCancel"
                            Text="重置" CausesValidation="false" AutoPostBack="false">
                            <ClientSideEvents Click="function(s, e) {btnCancelClick();}" />
                        </dxe:ASPxButton>
                    </td>
                    <td style="width: 50px; text-align: left;">
                        <dxe:ASPxButton runat="server" ID="dxeClose" ClientInstanceName="dxeClose" Text="关闭"
                            CausesValidation="false" AutoPostBack="false">
                            <ClientSideEvents Click="function(s, e) {btnCloseClick();}" />
                        </dxe:ASPxButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 400px; text-align: left;">
                        &nbsp;
                    </td>
                    <td style="display: none;">
                        <a id="hrefnewpolicy" href="PolicyInput.aspx">New</a>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            
    </asp:Panel>
    
    </asp:Panel>
</asp:Content>
