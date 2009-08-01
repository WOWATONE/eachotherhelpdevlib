<%@ Page Title="询价单录入" Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="AskPriceInput.aspx.cs" Inherits="BrokerWebApp.vehicleinsurance.AskPriceInput" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<%@ OutputCache Location="None" NoStore="true" %>  
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>询价单录入</title>
    
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
                var thegrid = pWindow.gridSearchResult;

                if (thegrid != null) {
                    thegrid.PerformCallback('refresh');
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
            var pid = dxetxtAskPriceID.GetValueString();
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

            if (typeof(dxebtnAddPolicy) != 'undefined' && dxebtnAddPolicy != null)
                dxebtnAddPolicy.SetEnabled(val);
            
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

            var AskPriceID = dxetxtAskPriceID.GetValueString();
            var CarrierID = dxeddlCarrierId.GetValue();
            var BranchID = dxeddlBranchId.GetValue();
            var CarrierSales = dxetxtCarrierSales.GetValueString();
            var CustomerID = getCustomerID();
            var SalesId = dxeddlSalesId.GetValue();
            var DeptId = dxeddlDeptID.GetValue();
            var GatheringTypeID = dxeddlGatheringType.GetValue();
            var OperationTypeID = dxeddlOperationType.GetValue();
            var SourceTypeID = dxeddlSourceTypeID.GetValue();
            var Remark = null;
            var AuditOrNot = null;

            var plc = new Policy(AskPriceID, CarrierID, BranchID, CarrierSales,
            CustomerID, SalesId, DeptId, GatheringTypeID,
            OperationTypeID, SourceTypeID, Remark, AuditOrNot);

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
            policyBaseCompleteEnable();

            var pid = dxetxtAskPriceID.GetValueString();

            if (isEmpty(pid)) {
                dxetxtAskPriceID.SetValue(e.result);
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
                    alert("提交成功");                    
                    break
                default:
                   alert(theresult);
            }
            
        }



        function btnAddCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            //window.showModalDialog("NewCustomer.aspx", self, myArguments);
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
                setCustomerID(thesplit_array[0]);
            }
        }

        function imgNewCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
            //window.showModalDialog("NewCustomer.aspx", self, myArguments);

        }




        function Policy(AskPriceID, CarrierID, BranchID, CarrierSales,
            CustomerID, SalesId, DeptId, GatheringTypeID,
            OperationTypeID, SourceTypeID, Remark, AuditOrNot) {

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

            if (!isEmpty(SalesId))
                this.SalesId = SalesId;

            if (!isEmpty(DeptId))
                this.DeptId = DeptId;

            if (!isEmpty(GatheringTypeID))
                this.GatheringTypeID = GatheringTypeID;

            if (!isEmpty(OperationTypeID))
                this.OperationTypeID = OperationTypeID;

            if (!isEmpty(SourceTypeID))
                this.SourceTypeID = SourceTypeID;

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
            var AskPriceID = dxetxtAskPriceID.GetValueString();
            var CarrierID = null;
            var BranchID = null;
            var CarrierSales = null;
            var CustomerID = null;
            var SalesId = null;
            var DeptId = null;
            var GatheringTypeID = null;
            var OperationTypeID = null;
            var SourceTypeID = null;
            var Remark = dxeMemo.GetValueString();

            var plc = new Policy(AskPriceID, CarrierID, BranchID, CarrierSales,
            CustomerID, SalesId, DeptId, GatheringTypeID,
            OperationTypeID, SourceTypeID, Remark, AuditOrNot);

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
            //debugger;
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

            var AskPriceID = dxetxtAskPriceID.GetValueString();
            var CarrierID = null;
            var BranchID = null;
            var CarrierSales = null;
            var CustomerID = null;
            var SalesId = null;
            var DeptId = null;
            var GatheringTypeID = null;
            var OperationTypeID = null;
            var SourceTypeID = null;


            var Remark = dxeMemo.GetValueString();

            var plc = new Policy(AskPriceID, CarrierID, BranchID, CarrierSales,
            CustomerID, SalesId, DeptId, GatheringTypeID,
            OperationTypeID, SourceTypeID, Remark, AuditOrNot);

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
                    dxebtnAuditOk.SetEnabled(true);
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
  
    </script>
    
     <script type="text/javascript">

                 function btnAddPolicyClick() {
                     var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=1000px;dialogHeight=800px;center=yes;help=no";
                     var AskPriceID = dxetxtAskPriceID.GetValueString();
                     var url = "CarPolicyInput.aspx?pagemode=input&id=&askpriceid=" + AskPriceID;
                     window.showModalDialog(url, self, myArguments);            
                 }

                 function gridCustomButtonClick(s, e) {
                     s.GetRowValues(e.visibleIndex, "PolicyID", getTheSelectedRowsValues);
                 }

                 function getTheSelectedRowsValues(selectedValues) {
                     if (selectedValues.length == 0) {
                         //
                     }
                     else {
                         var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=1000px;dialogHeight=800px;center=yes;help=no";
                         var querystring;
                         querystring = "CarPolicyInput.aspx?pagemode=input&id=" + selectedValues;
                         window.showModalDialog(querystring, self, myArguments);
                     }
                 }
        
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <input type="hidden" id="pagemode" runat="server" value="" />
    <input type="hidden" id="pkid" runat="server" />
    
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
    
    
    <dxtc:ASPxPageControl ID="insuranceDetailTabPage" ClientInstanceName="insuranceDetailTabPage"
        runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%" AutoPostBack="false" EnableCallBacks="true">
        <ClientSideEvents ActiveTabChanging="function(s, e) {}" TabClick="function(s, e) {}" />
        <TabPages>
            <dxtc:TabPage Text="基本信息">
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
                                                基本信息</div>
                                            <div style="float: left; margin-left: 5px;">
                                                <asp:Label ID="lbl_npbasicheader" runat="server">(展开)</asp:Label>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="npbasicdetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 90px; text-align: right;">
                                                    询价单号：
                                                </td>
                                                <td style="width: 180px; text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtAskPriceID" ClientInstanceName="dxetxtAskPriceID" runat="server" Width="140px" ReadOnly="true"></dxe:ASPxTextBox>
                                                </td>
                                                <td style="width: 90px; text-align: right;">
                                                    部门：
                                                </td>
                                                <td style="width: 150px; text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server" Width="140px" DropDownStyle="DropDownList">
						                                <Items>
						                                </Items>
						                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                            ValidationGroup="BaseGroup">
                                                            <RequiredField IsRequired="true" ErrorText="Required" />
                                                        </ValidationSettings>
                                                        <ClientSideEvents SelectedIndexChanged="dxeddlDeptID_SelectedIndexChanged" />
					                                </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 90px; text-align: right;">
                                                    客户经理：
                                                </td>
                                                <td style="width: 150px; text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server" Width="140px" DropDownStyle="DropDownList" OnCallback="dxeddlSalesIdCallback">
						                                <Items>
						                                </Items>
						                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                            ValidationGroup="BaseGroup">
                                                            <RequiredField IsRequired="true" ErrorText="Required" />
                                                        </ValidationSettings>
                                                        
					                                </dxe:ASPxComboBox>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    保险公司：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlCarrierId" ClientInstanceName="dxeddlCarrierId" runat="server" Width="140px" DropDownStyle="DropDownList">
						                                <Items>
						                                </Items>
						                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                            ValidationGroup="BaseGroup">
                                                            <RequiredField IsRequired="true" ErrorText="Required" />
                                                        </ValidationSettings>
						                                <ClientSideEvents SelectedIndexChanged="Carrier_SelectedIndexChanged" />
					                                </dxe:ASPxComboBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    分支机构：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlBranchId" ClientInstanceName="dxeddlBranchId" runat="server" Width="140px" DropDownStyle="DropDownList" OnCallback="CarrierBranchIDCallback">
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
                                                    <dxe:ASPxTextBox ID="dxetxtCarrierSales" ClientInstanceName="dxetxtCarrierSales" runat="server" Width="140px"></dxe:ASPxTextBox>
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
                                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                            ValidationGroup="BaseGroup">
                                                                            <RequiredField IsRequired="true" ErrorText="Required" />
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
                                                    业务来源：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlSourceTypeID" ClientInstanceName="dxeddlSourceTypeID" runat="server" Width="140px" DropDownStyle="DropDownList">
															<Items>
															</Items>
															<ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                ValidationGroup="BaseGroup">
                                                                <RequiredField IsRequired="true" ErrorText="Required" />
                                                            </ValidationSettings>
														</dxe:ASPxComboBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    业务性质：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlOperationType" ClientInstanceName="dxeddlOperationType" runat="server" Width="140px" DropDownStyle="DropDownList">
															<Items>
															</Items>
															<ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                ValidationGroup="BaseGroup">
                                                                <RequiredField IsRequired="true" ErrorText="Required" />
                                                            </ValidationSettings>
														</dxe:ASPxComboBox>
                                                </td>
                                                <td></td>
                                            </tr>                                                        
                                            <tr>                                                            
                                                <td style="text-align: right;">
                                                    收款方式：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlGatheringType" ClientInstanceName="dxeddlGatheringType" runat="server" Width="140px" DropDownStyle="DropDownList">
															<Items>
															</Items>
															<ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                                                ValidationGroup="BaseGroup">
                                                                <RequiredField IsRequired="true" ErrorText="Required" />
                                                            </ValidationSettings>
														</dxe:ASPxComboBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    录单人：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtCreatePerson" ClientInstanceName="dxetxtCreatePerson" runat="server" Width="140px" ReadOnly="true"></dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    录单日期：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxDateEdit ID="dxeCreateTime" runat="server" Width="140px" ReadOnly="true"></dxe:ASPxDateEdit>
                                                </td>
                                                <td></td>
                                            </tr> 
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td colspan="2" style="text-align: right;">
                                                    <dxe:ASPxButton runat="server" id="dxebtntopSave" ClientInstanceName="dxebtntopSave" Text="保存" CausesValidation="true" ValidationGroup="BaseGroup" AutoPostBack="false">
                                                        <ClientSideEvents Click="function(s, e) { dxebtntopSave_Click(s,e); }"></ClientSideEvents>
                                                    </dxe:ASPxButton>
                                                </td>
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
                                    <asp:Panel ID="npGridPolicyItemHeader" runat="server" CssClass="collapsePanelHeader"
                                        Height="25px">
                                        <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                            <div style="float: left; vertical-align: middle;">
                                                <asp:ImageButton ID="img_npGridPolicyItem" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                    AlternateText="" />
                                            </div>
                                            <div style="float: left; margin-left: 5px;">
                                                车险项目</div>
                                            <div style="float: left; margin-left: 5px;">
                                                <asp:Label ID="lbl_npGridPolicyItem" runat="server">(展开)</asp:Label>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="npGridPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="text-align:left;">
                                                    <dxe:ASPxButton runat="server" ID="dxebtnAddPolicy" ClientInstanceName="dxebtnAddPolicy" AutoPostBack="false" Text="添加保单">
                                                        <ClientSideEvents Click="function(s, e) {btnAddPolicyClick();}" />
                                                    </dxe:ASPxButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server"
                                                        KeyFieldName="PolicyID" Width="100%" AutoGenerateColumns="False" 
                                                        OnRowInserting="gridPolicyItem_RowInserting"
                                                        OnRowUpdating="gridPolicyItem_RowUpdating" 
                                                        OnRowDeleting="gridPolicyItem_RowDeleting"  
                                                        OnStartRowEditing="gridPolicyItem_StartRowEditing" 
                                                        OnRowValidating="gridPolicyItem_RowValidating" 
                                                        OnHtmlEditFormCreated="gridPolicyItem_HtmlEditFormCreated"
                                                        OnCustomCallback="gridPolicyItem_CustomCallback"
                                                        >
                                                        <%-- BeginRegion Columns --%>
                                                        <Columns>                                                                        
                                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="center"
                                                                HeaderStyle-Wrap="False" AllowDragDrop="false">
                                                                <NewButton Visible="false" />
                                                                <EditButton Visible="false" />
                                                                <DeleteButton Visible="true" />
                                                                <CustomButtons>
                                                                    <dxwgv:GridViewCommandColumnCustomButton Text="编辑">
                                                                    </dxwgv:GridViewCommandColumnCustomButton>
                                                                </CustomButtons>
                                                            </dxwgv:GridViewCommandColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="投保单号" CellStyle-Wrap="False">                                                                            
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="CarNo" Caption="车牌号" CellStyle-Wrap="False">                                                                            
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="CiPremium" Caption="商业险保费" CellStyle-Wrap="False">                                                                            
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="CiProcessRate" Caption="商业险经纪费率(%)" CellStyle-Wrap="False">                                                                            
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="CiProcess" Caption="商业险经纪费" CellStyle-Wrap="False">                                                                            
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="AciPremium" Caption="交强险保费" CellStyle-Wrap="False">                                                                            
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="AciProcessRate" Caption="交强险经纪费率(%)" CellStyle-Wrap="False">                                                                            
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="AciProcess" Caption="交强险经纪费" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="CstPremium" Caption="车船税" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                        </Columns>
                                                        <TotalSummary>
                                                            <dxwgv:ASPxSummaryItem FieldName="CarNo" SummaryType="Count" DisplayFormat="车辆数目:#" />
                                                            <dxwgv:ASPxSummaryItem FieldName="CiPremium" SummaryType="Sum" DisplayFormat="c" />
                                                            <dxwgv:ASPxSummaryItem FieldName="CiProcess" SummaryType="Sum" DisplayFormat="c" />
                                                            <dxwgv:ASPxSummaryItem FieldName="AciPremium" SummaryType="Sum" DisplayFormat="c" />
                                                            <dxwgv:ASPxSummaryItem FieldName="AciProcess" SummaryType="Sum" DisplayFormat="c" />
                                                            <dxwgv:ASPxSummaryItem FieldName="CstPremium" SummaryType="Sum" DisplayFormat="c" />
                                                            <dxwgv:ASPxSummaryItem FieldName="CiProcessRate" SummaryType="Average" DisplayFormat="n" />
                                                            <dxwgv:ASPxSummaryItem FieldName="AciProcessRate" SummaryType="Average" DisplayFormat="n" />
                                                        </TotalSummary>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <Settings ShowGroupPanel="false" ShowFooter="True" />
                                                        <ClientSideEvents CustomButtonClick="function(s,e) {gridCustomButtonClick(s,e);}"  />
                                                        <SettingsBehavior ConfirmDelete="true" />
                                                        <Templates>
                                                            <EditForm>
                                                                <div style="padding: 4px 4px 3px 4px">
                                                                    <table style="width: 90%;" runat="server" id="tblgridPolicyItemEditorTemplate">
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                车牌号:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridPolicyItemCarNo" ClientInstanceName="dxetxtGridPolicyItemCarNo" runat="server" Width="120px">
                                                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="必需项">
                                                                                        <RequiredField IsRequired="true" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                商业险保费:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridPolicyItemCiPremium" ClientInstanceName="dxetxtGridPolicyItemCiPremium" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                商业险经纪费率(%):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridPolicyItemCiProcessRate" ClientInstanceName="dxetxtGridPolicyItemCiProcessRate" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                商业险经纪费:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridPolicyItemCiProcess" ClientInstanceName="dxetxtGridPolicyItemCiProcess" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                交强险保费:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridPolicyItemAciPremium" ClientInstanceName="dxetxtGridPolicyItemAciPremium" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                交强险经纪费率(%):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridPolicyItemAciProcessRate" ClientInstanceName="dxetxtGridPolicyItemAciProcessRate" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                交强险经纪费:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridPolicyItemAciProcess" ClientInstanceName="dxetxtGridPolicyItemAciProcess" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                车船税:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtGridPolicyItemCstPremium" ClientInstanceName="dxetxtGridPolicyItemCstPremium" runat="server" Width="120px">
                                                                                    <ValidationSettings>
                                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                                <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server">
                                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server">
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
                                        KeyFieldName="CarPolicyDocID" Width="100%" AutoGenerateColumns="False" 
                                        OnCustomCallback="gridDocList_CustomCallback"
                                        >
                                        <%-- BeginRegion Columns --%>
                                        <Columns>
                                            <dxwgv:GridViewDataColumn FieldName="DocName" Caption="文件名" CellStyle-Wrap="False" Width="25" Settings-AllowDragDrop="false">
                                                <DataItemTemplate>
                                                    <a id="fileurl <%# Eval("CarPolicyDocID") %>" onclick="hlPolicyItemTogetherClick('<%# Eval("DocURL") %>');" href="#"><%# Eval("DocName")%></a>
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
            <dxtc:TabPage Text="审核信息">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl3" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 10%; text-align: right;">
                                    审核人：
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtAuditPerson" ClientInstanceName="dxetxtAuditPerson" runat="server" Width="100px"></dxe:ASPxTextBox>
                                </td>
                                <td style="width: 10%; text-align: right;">
                                    审核日期：
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <dxe:ASPxDateEdit ID="dxeAuditTime" ClientInstanceName="dxeAuditTime" runat="server" Width="120px">
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
                <td style="display:none;"><a id="hrefnewpolicy" href="AskPriceInput.aspx?pagemode=input">New</a></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </asp:Panel>

</asp:Content>
