<%@ Page Title="车险保单补录" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="CarPolicyAppend.aspx.cs" Inherits="BrokerWebApp.vehicleinsurance.CarPolicyAppend" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>车险保单补录</title>

    
    <script type="text/javascript">

        var npbasicdetail = null;        
        var tblNewExecuteAction = null;


        function getServerControlRefStubs() {
            
            if ($("#<%=npbasicdetail.ClientID %>").length > 0) {
                npbasicdetail = $("#<%=npbasicdetail.ClientID %>")[0];
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

        });

        
    </script>
    
    <script type="text/javascript">        

        function makePolicyJSON() {

            var PolicyID = dxetxtPolicyID.GetValueString();
            var PolicyNo = dxetxtPolicyNo.GetValueString();
            var AciPolicyNo = dxetxtAciPolicyNo.GetValueString();
            var AskPriceID = null; //dxetxtAskPriceID.GetValueString();

            var CarrierID = null; //dxeddlCarrierId.GetValue();
            var BranchID = null; //dxeddlBranchId.GetValue();
            var CarrierSales = null; //dxetxtCarrierSales.GetValueString();
            var CustomerID = null; //getCustomerID();
            var Beneficiary = null; //dxetxtBeneficiary.GetValueString();
            var SourceTypeID = null; //dxeddlSourceTypeID.GetValue();

            var SalesId = null; //dxeddlSalesId.GetValue();
            var DeptId = null; //dxeddlDeptID.GetValue();
            var GatheringTypeID = null; //dxeddlGatheringType.GetValue();
            var OperationTypeID = null; //dxeddlOperationType.GetValue();
            var StartDate = null; //dxeStartDate.GetValue();
            var EndDate = null; //dxeEndDate.GetValue();
            var Special = null; //dxetxtSpecial.GetValueString();
            var CarNo = null; //dxetxtCarNo.GetValueString();
            var CarcaseNo = null; //dxetxtCarcaseNo.GetValueString();
            var UseCharacter = null; //dxetxtUseCharacter.GetValueString();
            var EngineNo = null; //dxetxtEngineNo.GetValueString();
            var CarUser = null; //dxetxtCarUser.GetValueString();
            var Capacity = null; //dxetxtCapacity.GetValueString();
            var RegisterDate = null; //dxeRegisterDate.GetValue();
            var CarValue = null; //dxetxtCarValue.GetValueString();
            var CiPremium = null; //dxetxtCiPremium.GetValueString();
            var AciPremium = null; //dxetxtAciPremium.GetValueString();
            var CstPremium = null; //dxetxtCstPremium.GetValueString();
            var TotalPremium = null; //dxetxtTotalPremium.GetValueString();
            var CiProcessRate = null; //dxetxtCiProcessRate.GetValueString();
            var AciProcessRate = null; //dxetxtAciProcessRate.GetValueString();
            var CiProcess = null; //dxetxtCiProcess.GetValueString();
            var AciProcess = null; //dxetxtAciProcess.GetValueString();
            var TotalProcess = null; //dxetxtTotalProcess.GetValueString();

            var Remark = null;
            var AuditOrNot = null;

            var plc = new Policy(PolicyID, PolicyNo, AciPolicyNo, AskPriceID,
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
            alert("保存成功。");            
        }

        
        function Policy(PolicyID, PolicyNo, AciPolicyNo, AskPriceID,
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
            if (e.tab.index == 1 || e.tab.index == 2) {
                var element = s.GetContentElement(e.tab.index);
                if (element != null) element.loaded = false;
            }
        }

        function policyTab_Click(s, e) {
            //
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
    
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <input type="hidden" id="pagemode" runat="server" value="" />
    
    <dxcb:ASPxCallback ID="dxeSaveCallback" ClientInstanceName="dxeSaveCallback" runat="server" OnCallback="dxeSaveCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {saveCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
        
    <table style="width: 100%">
        <tr>
            <td style="width: 100%;" colspan="2">
                <dxtc:ASPxPageControl ID="insuranceDetailTabPage" ClientInstanceName="insuranceDetailTabPage"
                    runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%">
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
                                                                询价单号：
                                                            </td>
                                                            <td style="text-align: left; color: Red">
                                                                <dxe:ASPxTextBox ID="dxetxtAskPriceID" ClientInstanceName="dxetxtAskPriceID" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;" >
                                                                商业险保单号：
                                                            </td> 
                                                            <td style="text-align: left;" colspan="3">
                                                                <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server" Width="477px"></dxe:ASPxTextBox>
                                                            </td>
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
                                                            <td style="text-align: left;" colspan="3">
                                                                <dxe:ASPxTextBox ID="dxetxtAciPolicyNo" ClientInstanceName="dxetxtAciPolicyNo" runat="server" Width="477px"></dxe:ASPxTextBox>
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
	                                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="false"
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
                                                                <dxe:ASPxComboBox ID="dxeddlBranchId" ClientInstanceName="dxeddlBranchId" runat="server" Width="160px" DropDownStyle="DropDownList">
	                                                                <Items>
	                                                                </Items>
	                                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="false"
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
                                                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="false"
                                                                                        ValidationGroup="BaseGroup">
                                                                                        <RequiredField IsRequired="true" ErrorText="Required" />
                                                                                    </ValidationSettings>
                                                                                </dxe:ASPxTextBox>                                                                    
                                                                            </td>
                                                                            <td style="text-align:left; width:20px">
                                                                                <input type="hidden" id="cusid" runat="server" />
                                                                                <img runat="server" id="imgSelectCustomer" onclick="" alt=""
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
                                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="false"
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
									                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="false"
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
	                                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="false"
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
                                                                <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server" Width="160px" DropDownStyle="DropDownList">
	                                                                <Items>
	                                                                </Items>
	                                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="false"
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
									                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="false"
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
									                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="false"
                                                                        ValidationGroup="BaseGroup">
                                                                        <RequiredField IsRequired="true" ErrorText="Required" />
                                                                    </ValidationSettings>
								                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                批改期限：
                                                            </td>
                                                            <td>
                                                                <dxe:ASPxDateEdit ID="dxeStartDate" ClientInstanceName="dxeStartDate" runat="server" Width="160px">
                                                                    <ClientSideEvents DateChanged="function(s, e) { dxeStartDate_DateChanged(s,e); }" /> 
                                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="false"
                                                                        ValidationGroup="BaseGroup">
                                                                        <RequiredField IsRequired="true" ErrorText="Required" />
                                                                    </ValidationSettings>
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                            <td>
                                                                至
                                                            </td>
                                                            <td>
                                                                <dxe:ASPxDateEdit ID="dxeEndDate" ClientInstanceName="dxeEndDate" runat="server" Width="160px">
                                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="false"
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
                                                                <dxe:ASPxTextBox ID="dxetxtSpecial" ClientInstanceName="dxetxtSpecial" runat="server" Width="793px"></dxe:ASPxTextBox>
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
                                                                <dxe:ASPxDateEdit ID="dxeCreateTime" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxDateEdit>
                                                            </td>
                                                            <td style="text-align: left;" colspan="2"></td>
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
                                                            车辆信息</div>
                                                        <div style="float: left; margin-left: 5px;">
                                                            <asp:Label ID="lbl_nppostilecontentHeader" runat="server">(展开)</asp:Label>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="nppostilecontentDetail" runat="server" CssClass="collapsePanel" Height="0">
                                                    
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
                                                        <tr>
                                                            <td style="width: 150px; text-align: right;">
                                                                商业险保费：
                                                            </td>
                                                            <td style="width: 130px; text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtCiPremium" ClientInstanceName="dxetxtCiPremium" runat="server" Width="125px">
                                                                    <ValidationSettings  ErrorDisplayMode="ImageWithTooltip" ValidationGroup="BaseGroup">
                                                                        <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                    </ValidationSettings>
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
                                <dxw:ContentControl ID="ContentControl3" runat="server">
                                    <table style="width: 100%">
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
                        <dxtc:TabPage Text="审核信息">
                            <ContentCollection>
                                <dxw:ContentControl ID="ContentControl4" runat="server">
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
                            </td>
                            <td></td>
                            <td></td>
                            <td style="width:50px; text-align:left;">
                                <dxe:ASPxButton runat="server" id="dxebtnBottomSave" ClientInstanceName="dxebtnBottomSave" Text="保存" CausesValidation="true" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {dxebtntopSave_Click(s,e);}" />
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
            </td>
        </tr>
    </table>
</asp:Content>
