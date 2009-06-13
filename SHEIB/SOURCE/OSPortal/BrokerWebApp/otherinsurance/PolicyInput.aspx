<%@ Page Title="保单录入" Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master"
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
    <title>保单录入</title>

    <script type="text/javascript">
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
                    thegrid.PerformCallback('');
                }
                else {
                    //do nothing
                }
            };

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
            var Beneficiary = null;
            var Capacity = null;
            var CarNo = null;
            var CarUser = null;
            var CarValue = null;
            var CarcaseNo = null;
            var CarrierSales = null;
            var CiPremium = null;
            var CiProcess = null;
            var CiProcessRate = null;
            var ConversionRate = null;
            var Coverage = null;
            var CreatePerson = null;
            var CreateTime = null;
            var CstPremium = null;
            var Currency = null;
            var CustomerID = null;
            var DeptId = null;
            var EndDate = null;
            var EngineNo = null;
            var FlagAlt = null;
            var FlagReinsure = null;
            var FlagTogether = null;
            var GatheringType = null;
            var ModifyPerson = null;
            var ModifyTime = null;
            var OperationType = null;
            var PolicyID = getPolicyID();
            var PolicyNo = null;
            var PolicyStatus = null;
            var PolicyType = null;
            var Premium = null;
            var PremiumRate = null;
            var PrevPolicyID = null;
            var Process = null;
            var ProcessBase = null;
            var ProcessRate = null;
            var ProdTypeID = null;
            var RegisterDate = null;
            var Remark = null;
            var SalesId = null;
            var SignDate = null;
            var SourceTypeID = null;
            var Special = null;
            var StartDate = null;
            var UseCharacter = null;
            var VolumnNo = null;

            var plc = new Policy(AciPolicyNo, AciPremium, AciProcess, AciProcessRate,
            AltNO, AskPriceID, AuditPerson, AuditTime, BankAccount,
            BankName, Beneficiary, Capacity, CarNo, CarUser,
            CarValue, CarcaseNo, CarrierSales, CiPremium, CiProcess,
            CiProcessRate, ConversionRate, Coverage, CreatePerson, CreateTime,
            CstPremium, Currency, CustomerID, DeptId, EndDate,
            EngineNo, FlagAlt, FlagReinsure, FlagTogether, GatheringType,
            ModifyPerson, ModifyTime, OperationType, PolicyID, PolicyNo,
            PolicyStatus, PolicyType, Premium, PremiumRate, PrevPolicyID,
            Process, ProcessBase, ProcessRate, ProdTypeID, RegisterDate,
            Remark, SalesId, SignDate, SourceTypeID, Special,
            StartDate, UseCharacter, VolumnNo);

            return JSON.stringify(plc);
        }
        
        
        function dxebtntopSave_Click(s, e) {
            var thejsonstring = makePolicyJSON();
            dxeSaveCallback.PerformCallback(thejsonstring);            
        }

        function saveCallbackComplete(s, e) {
            //do nothing;
        }

        function btnAddClick(s, e) {
            var thejsonstring = makePolicyJSON();
            //debugger;
            dxeAddCallback.PerformCallback(thejsonstring);
        }

        function addCallbackComplete(s, e) {
            //do nothing;
            var result = $("#hrefnewpolicy");
            var hrefPolicyNew = result[0];
            hrefPolicyNew.click();            
        }

        function btnSaveCheckClick(s, e) {
        }
        
        
        function saveCheckCallbackComplete(s, e) {
            //do nothing;
        }
        
        
        
        function btnAddCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("NewCustomer.aspx", self, myArguments);
        }


        function btnSelectCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("SelectCustomer.aspx", self, myArguments);
        }

        
        
        function gridGridProdIDChange() {
            var theValue = decbGridProdID.GetText();
            //detxtGridProdName.SetValue(theValue);
        }


        function FileUploadStart() {
            //document.getElementById("uploadedListFiles").innerHTML = "";
        }


        function FileUploaded(s, e) {
            var fieldSeparator = "|";
            if (e.isValid) {
                //var linkFile = document.createElement("a");
                //var indexSeparator = e.callbackData.indexOf(fieldSeparator);
                //var fileName = e.callbackData.substring(0, indexSeparator);
                //var pictureUrl = e.callbackData.substring(indexSeparator + fieldSeparator.length);
                //var date = new Date();
                //var imgSrc = "UploadImages/" + pictureUrl + "?dx=" + date.getTime();
                //linkFile.innerHTML = fileName;
                //linkFile.setAttribute("href", imgSrc);
                //linkFile.setAttribute("target", "_blank");
                //var container = document.getElementById("uploadedListFiles");
                //container.appendChild(linkFile);
                //container.appendChild(document.createElement("br"));
            }
        }


        function imgPolicyProdTypeClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=600px;dialogHeight=500px;center=yes;help=no";
            window.showModalDialog("../popupselectrefs/PolicyProdType.aspx", self, myArguments);
        }


        function hlPolicyItemTogetherClick(params) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
            window.showModalDialog("NewCustomer.aspx", self, myArguments);

        }

        function getPolicyID() {
            var result = $("#<%=plcid.ClientID %>");
            var ID = result[0].value;
            return ID;
        }

        function getCustomerID() {
            var result = $("#<%=cusid.ClientID %>");
            var ID = result[0].value;
            return ID;
        }

        function getProductTypeID() {
            var result = $("#<%=ptid.ClientID %>");
            var ID = result[0].value;
            return ID;
        }
        

        function Policy(AciPolicyNo, AciPremium, AciProcess, AciProcessRate,
        AltNO, AskPriceID, AuditPerson, AuditTime, BankAccount,
        BankName, Beneficiary, Capacity, CarNo, CarUser,
        CarValue, CarcaseNo, CarrierSales, CiPremium, CiProcess,
        CiProcessRate, ConversionRate, Coverage, CreatePerson, CreateTime,
        CstPremium, Currency, CustomerID, DeptId, EndDate,
        EngineNo, FlagAlt, FlagReinsure, FlagTogether, GatheringType,
        ModifyPerson, ModifyTime, OperationType, PolicyID, PolicyNo,
        PolicyStatus, PolicyType, Premium, PremiumRate, PrevPolicyID,
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
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <dxcb:ASPxCallback ID="dxeAddCallback" ClientInstanceName="dxeAddCallback" runat="server" OnCallback="dxeSaveCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {addCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    
    <dxcb:ASPxCallback ID="dxeSaveCallback" ClientInstanceName="dxeSaveCallback" runat="server" OnCallback="dxeSaveCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {saveCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    
    <dxcb:ASPxCallback ID="dxeSaveAndCheckCallback" ClientInstanceName="dxeSaveAndCheckCallback" runat="server" OnCallback="dxeSaveAndCheckCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {saveCheckCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    
    
    <dxtc:ASPxPageControl ID="insuranceDetailTabPage" ClientInstanceName="insuranceDetailTabPage"
        runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%">
        <ClientSideEvents ActiveTabChanging="function(s, e) {}" TabClick="function(s, e) {}" />
        <TabPages>
            <dxtc:TabPage Text="保单基本资料">
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
                                                保单基本数据</div>
                                            <div style="float: left; margin-left: 5px;">
                                                <asp:Label ID="lbl_npbasicheader" runat="server">(展开)</asp:Label>
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
                                                <td style="text-align: right;">投保单号：</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server" Width="125px"></dxe:ASPxTextBox>                                                    
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">保单编号：</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server" Width="125px"></dxe:ASPxTextBox>
                                                    <input type="hidden" id="plcid" runat="server" /> 
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">
                                                    <dxe:ASPxCheckBox runat="server" ID="dxechkTogether" ClientInstanceName="dxechkTogether" Text="共保"></dxe:ASPxCheckBox>
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxCheckBox runat="server" ID="dxechkFlagReinsure" ClientInstanceName="dxechkFlagReinsure" Text="再保"></dxe:ASPxCheckBox>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">保险险种：</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtProdTypeName" ClientInstanceName="dxetxtProdTypeName" runat="server" Width="125px"></dxe:ASPxTextBox>
                                                    <input type="hidden" id="ptid" runat="server" />
                                                </td>
                                                <td style="text-align: left;">
                                                    <img runat="server" id="img1" alt="" src="../images/searchicon9.png" style="width: 20px;
                                                        height: 20px; vertical-align: top;" onclick="imgPolicyProdTypeClick();" />
                                                </td>
                                                <td style="text-align: right;">投保人：</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtCustomer" ClientInstanceName="dxetxtCustomer" runat="server" Width="125px"></dxe:ASPxTextBox>
                                                    <input type="hidden" id="cusid" runat="server" />
                                                </td>
                                                <td style="text-align: left;">
                                                    <img runat="server" id="imgadduser" onclick="btnAddCustomerClick();" alt="" src="../images/add_user_icon.png"
                                                        style="width: 20px; height: 20px; vertical-align: top;" />
                                                    <img runat="server" id="imgpeoplesearch" onclick="btnSelectCustomerClick();" alt=""
                                                        src="../images/searchicon9.png" style="width: 20px; height: 20px; vertical-align: top;" />
                                                </td>
                                                <td style="text-align: right;">被保险人：</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtBeneficiary" ClientInstanceName="dxetxtBeneficiary" runat="server" Width="125px"></dxe:ASPxTextBox>                                                    
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">部门：</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server" Width="125px" DropDownStyle="DropDownList">
															<Items>
																<dxe:ListEditItem Text="(全部)" Value="" />
																<dxe:ListEditItem Text="业务部" Value="1" />
															</Items>
														</dxe:ASPxComboBox>
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">客户经理：</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server" Width="125px" DropDownStyle="DropDownList">
															<Items>
																<dxe:ListEditItem Text="(全部)" Value="" />
															</Items>
														</dxe:ASPxComboBox>
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">收款方式：</td>
                                                <td style="text-align: left;">                                                    
                                                    <dxe:ASPxComboBox ID="dxeddlGatheringType" ClientInstanceName="dxeddlGatheringType" runat="server" Width="125px" DropDownStyle="DropDownList">
															<Items>
																<dxe:ListEditItem Text="(全部)" Value="" />
															</Items>
														</dxe:ASPxComboBox>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">业务性质：</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlFlagReinsure" ClientInstanceName="dxeddlFlagReinsure" runat="server" Width="125px" DropDownStyle="DropDownList">
															<Items>
																<dxe:ListEditItem Text="(全部)" Value="" />
															</Items>
														</dxe:ASPxComboBox>
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">业务来源：</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlSourceTypeID" ClientInstanceName="dxeddlSourceTypeID" runat="server" Width="125px" DropDownStyle="DropDownList">
															<Items>
																<dxe:ListEditItem Text="(全部)" Value="" />
															</Items>
														</dxe:ASPxComboBox>
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">保险期限：</td>
                                                <td>
                                                    <table style="margin-left:-3px;">
                                                        <tr>
                                                            <td>
                                                                <dxe:ASPxDateEdit ID="dxeStartDate" ClientInstanceName="dxeStartDate" runat="server" Width="95px">
                                                                    <ClientSideEvents DateChanged="function(s, e) { dxeStartDate_DateChanged(s,e); }" />                                                                    
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                            <td>
                                                                至
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
                                                <td style="text-align: right;">录单人：</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtCreatePerson" ClientInstanceName="dxetxtCreatePerson" runat="server" Width="125px"></dxe:ASPxTextBox>
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">录单日期：</td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxDateEdit ID="dxedtCreateTime" ClientInstanceName="dxedtCreateTime" runat="server" Width="100px">
                                                                </dxe:ASPxDateEdit>
                                                </td>
                                                <td></td>
                                                <td style="text-align: right;">缴费次数：</td>
                                                <td style="text-align: left;">
                                                    <table style="margin-left:-3px;">
                                                        <tr>
                                                            <td style="width:120px;text-align: left;">
                                                            <dxe:ASPxTextBox ID="dxetxtStage" ClientInstanceName="dxetxtStage" runat="server" Width="125px"></dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="width:10px;text-align: left;"></td>
                                                            <td style="text-align: left;">
                                                            <dxe:ASPxButton runat="server" id="dxebtntopSave" Text="保存" CausesValidation="true" AutoPostBack="false">
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
                                                保险项目</div>
                                            <div style="float: left; margin-left: 5px;">
                                                <asp:Label ID="lbl_npGridPolicyItem" runat="server">(展开)</asp:Label>
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
                                                        OnRowDeleting="gridPolicyItem_RowDeleting" 
                                                        OnHtmlEditFormCreated="gridPolicyItem_HtmlEditFormCreated"
                                                        OnRowDeleted="gridPolicyItem_RowDeleted">
                                                        <%-- BeginRegion Columns --%>
                                                        <Columns>
                                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left"
                                                                Width="81" AllowDragDrop="false">
                                                                <NewButton Visible="True" />
                                                                <EditButton Visible="true" />
                                                                <DeleteButton Visible="true" />
                                                            </dxwgv:GridViewCommandColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="ItemID" Caption="序号" CellStyle-Wrap="False"
                                                                Visible="false">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="ProdName" Caption="项目名称" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Coverage" Caption="保额" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="PremiumRate" Caption="费率(%)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Premium" Caption="保费" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="ProcRate" Caption="经纪费率(%)" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Process" Caption="经纪费" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                        </Columns>
                                                        <Settings ShowGroupPanel="false" ShowFooter="True" ShowGroupFooter="VisibleAlways" />
                                                        <TotalSummary>
                                                            <dxwgv:ASPxSummaryItem FieldName="ProdName" SummaryType="Count" DisplayFormat="数量:#" />
                                                            <dxwgv:ASPxSummaryItem FieldName="Coverage" SummaryType="Sum" DisplayFormat="c" />
                                                            <dxwgv:ASPxSummaryItem FieldName="PremiumRate" SummaryType="Average" DisplayFormat="n" />
                                                            <dxwgv:ASPxSummaryItem FieldName="Premium" SummaryType="Sum" DisplayFormat="c" />
                                                            <dxwgv:ASPxSummaryItem FieldName="ProcRate" SummaryType="Average" DisplayFormat="n" />
                                                            <dxwgv:ASPxSummaryItem FieldName="Process" SummaryType="Sum" DisplayFormat="c" />
                                                        </TotalSummary>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <Templates>
                                                            <EditForm>
                                                                <div style="padding: 4px 4px 3px 4px">
                                                                    <table style="width: 90%;" runat="server" id="tblgridPolicyItemEditorTemplate">
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                项目名称:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxComboBox runat="server" ID="dxecbGridProdID" AutoPostBack="false" ClientInstanceName="dxecbGridProdID"
                                                                                    DropDownButton-Enabled="true" DropDownStyle="DropDownList" Width="100px">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="编码三" Value="1" />
                                                                                        <dxe:ListEditItem Text="编码四" Value="2" />
                                                                                        <dxe:ListEditItem Text="编码五" Value="3" />
                                                                                    </Items>
                                                                                    <ClientSideEvents SelectedIndexChanged="gridGridProdIDChange" />
                                                                                </dxe:ASPxComboBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                保额:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <asp:TextBox runat="server" ID="txtGridCoverage" Text=''></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                费率:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <asp:TextBox runat="server" ID="txtGridPremiumRate" Text=''></asp:TextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                保费:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <asp:TextBox runat="server" ID="txtGridPremium" Text=''></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                经纪费率:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <asp:TextBox runat="server" ID="txtGridProcRate" Text=''></asp:TextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                经纪费:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <asp:TextBox runat="server" ID="txtGridProcess" Text=''></asp:TextBox>
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
                                                <td style="width: 10%;"></td>
                                                <td style="width: 20%;"></td>
                                                <td style="width: 10%;"></td>
                                                <td style="width: 20%;"></td>
                                                <td style="width: 10%;"></td>
                                                <td style="width: 20%;"></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">保额：</td>
                                                <td style="text-align: left;" >
                                                    <dxe:ASPxTextBox ID="dxetxtCoverage" ClientInstanceName="dxetxtCoverage" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    费率(%)：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtPremiumRate" ClientInstanceName="dxetxtPremiumRate" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    经纪费率(%)：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtProcessRate" ClientInstanceName="dxetxtProcessRate" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    币种：
                                                </td>
                                                <td>
                                                    <dxe:ASPxComboBox ID="dxeddlCurrency" ClientInstanceName="dxeddlCurrency" runat="server" Width="120px" DropDownStyle="DropDownList">
															<Items>
																<dxe:ListEditItem Text="(全部)" Value="" />
															</Items>
														</dxe:ASPxComboBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    保费(原)：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtPremium" ClientInstanceName="dxetxtPremium" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    经纪费(原)：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtProcess" ClientInstanceName="dxetxtProcess" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    换算汇率：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtConversionRate" ClientInstanceName="dxetxtConversionRate" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    保费(本)：
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtPremiumBase" ClientInstanceName="dxetxtPremiumBase" runat="server" Width="120px"> </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    经纪费(本)：
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
                                                        OnRowInserting="gridCarrier_RowInserting" OnRowUpdating="gridCarrier_RowUpdating"
                                                        OnRowUpdated="gridCarrier_RowUpdated" OnRowInserted="gridCarrier_RowInserted"
                                                        OnRowDeleting="gridCarrier_RowDeleting" OnRowDeleted="gridCarrier_RowDeleted">
                                                        <%-- BeginRegion Columns --%>
                                                        <Columns>
                                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left"
                                                                Width="81" HeaderStyle-Wrap="False" AllowDragDrop="false">
                                                                <NewButton Visible="True" />
                                                                <EditButton Visible="true" />
                                                                <DeleteButton Visible="true" />
                                                            </dxwgv:GridViewCommandColumn>
                                                            <dxwgv:GridViewDataColumn Caption="&nbsp;" CellStyle-Wrap="False" Width="25" Settings-AllowDragDrop="false">
                                                                <DataItemTemplate>
                                                                    <dxe:ASPxHyperLink runat="server" ID="deGridPolicyItemhl_Together" Text="再保" NavigateUrl="#">
                                                                        <ClientSideEvents Click="hlPolicyItemTogetherClick" />
                                                                    </dxe:ASPxHyperLink>
                                                                </DataItemTemplate>
                                                            </dxwgv:GridViewDataColumn>
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
                                                        <Templates>
                                                            <EditForm>
                                                                <div style="padding: 4px 4px 3px 4px">
                                                                    <table style="width: 90%;" runat="server" id="tblgridCarrierEditorTemplate">
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                保险公司:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxComboBox runat="server" ID="dxecbGridCarrierID" AutoPostBack="false" ClientInstanceName="dxecbGridCarrierID"
                                                                                    DropDownButton-Enabled="true" DropDownStyle="DropDownList" Width="100px">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="中国平安" Value="1" />
                                                                                        <dxe:ListEditItem Text="中国泰康" Value="2" />
                                                                                        <dxe:ListEditItem Text="中国安联" Value="3" />
                                                                                    </Items>
                                                                                    <ClientSideEvents SelectedIndexChanged="" />
                                                                                </dxe:ASPxComboBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                分支机构:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxComboBox runat="server" ID="dxecbGridBranchID" AutoPostBack="false" ClientInstanceName="dxecbGridBranchID"
                                                                                    DropDownButton-Enabled="true" DropDownStyle="DropDownList" Width="100px">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="平安分支1" Value="1" />
                                                                                        <dxe:ListEditItem Text="泰康分支1" Value="2" />
                                                                                        <dxe:ListEditItem Text="安联分支1" Value="3" />
                                                                                    </Items>
                                                                                    <ClientSideEvents SelectedIndexChanged="" />
                                                                                </dxe:ASPxComboBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                份额比例(%):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="dxetxtIDNo" ClientInstanceName="txtGridPolicyRate" runat="server"></dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                保费:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="ASPxTextBox9" ClientInstanceName="txtGridPremium" runat="server"></dxe:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                经纪费率(%):
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="ASPxTextBox10" ClientInstanceName="txtGridPoundage" runat="server"></dxe:ASPxTextBox>
                                                                            </td>
                                                                            <td style="white-space: nowrap; text-align: right;">
                                                                                经纪费:
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <dxe:ASPxTextBox ID="ASPxTextBox11" ClientInstanceName="txtGridProcess" runat="server"></dxe:ASPxTextBox>
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
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Text="附件">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 100%; text-align: left;">
                                    附件
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%; text-align: left;">
                                    <dxuc:ASPxUploadControl ID="filesUploadControl" runat="server" ShowAddRemoveButtons="True"
                                        Width="400px" ShowUploadButton="True" AddUploadButtonsHorizontalPosition="Center"
                                        ShowProgressPanel="True" ClientInstanceName="UploadControl" OnFileUploadComplete="UploadControl_FileUploadComplete"
                                        FileInputCount="5" RemoveButtonSpacing="8px" AddUploadButtonsSpacing="10">
                                        <ValidationSettings MaxFileSize="4000000" AllowedContentTypes="*">
                                        </ValidationSettings>
                                        <ClientSideEvents FileUploadComplete="function(s, e) { FileUploaded(s, e) }" FileUploadStart="function(s, e) { FileUploadStart(); }" />
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
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Text="分    期" ClientVisible="true">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl2" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <dxwgv:ASPxGridView ID="gridPeriod" ClientInstanceName="gridPeriod" runat="server"
                                        KeyFieldName="PolPeriodId" Width="100%" OnStartRowEditing="gridPeriod_StartRowEditing"
                                        OnRowInserting="gridPeriod_RowInserting" OnRowUpdating="gridPeriod_RowUpdating"
                                        OnRowUpdated="gridPeriod_RowUpdated" OnRowInserted="gridPeriod_RowInserted" OnRowDeleting="gridPeriod_RowDeleting"
                                        OnRowDeleted="gridPeriod_RowDeleted">
                                        <%-- BeginRegion Columns --%>
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="false">
                                                <EditButton Visible="true" />
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
                                        </Columns>
                                        <%-- EndRegion --%>
                                        <SettingsEditing PopupEditFormWidth="600px" />
                                        <Settings ShowGroupPanel="false" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
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
                                                                    Text='<%# Eval("Period") %>' Enabled="false">
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                付款日期:
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxDateEdit ID="detxtGridPeriodPayDate" ClientInstanceName="detxtGridPeriodPayDate"
                                                                    runat="server">
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                保险公司:
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox runat="server" ID="detxtGridPeriodCarrierNameCn" ClientInstanceName="detxtGridPeriodCarrierNameCn"
                                                                    Text='<%# Eval("CarrierNameCn") %>' Enabled="false">
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                分支机构:
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox runat="server" ID="detxtGridPeriodBranchName" ClientInstanceName="detxtGridPeriodBranchName"
                                                                    Text='<%# Eval("BranchName") %>' Enabled="false">
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                保费:
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox runat="server" ID="detxtGridPeriodPayFeeBase" ClientInstanceName="detxtGridPeriodPayFeeBase"
                                                                    Text='<%# Eval("PayFeeBase") %>'>
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                经纪费:
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox runat="server" ID="detxtGridPeriodPayProcBase" ClientInstanceName="detxtGridPeriodPayProcBase"
                                                                    Text='<%# Eval("PayProcBase") %>'>
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
                    <dxw:ContentControl ID="ContentControl1" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 10%; text-align: right;">
                                    审核人：
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtIDNo" ClientInstanceName="dxetxtIDNo" runat="server" Width="100px"></dxe:ASPxTextBox> 
                                </td>
                                <td style="width: 10%; text-align: right;">
                                    审核日期：
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <dxe:ASPxDateEdit ID="deCheckDate" runat="server" Width="120px">
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
                                    <dxe:ASPxMemo runat="server" id="dxeMemo" Rows="10" Columns="72"></dxe:ASPxMemo>
                                </td>
                                <td>
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
        <table style="width: 100%">
            <tr>
                <td style="width: 400px; text-align: left;">
                    &nbsp;
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnBottomAdd" Text="新增" CausesValidation="true" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnAddClick(s,e);}" />
                    </dxe:ASPxButton> 
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnBottomSave" Text="保存" CausesValidation="true" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {dxebtntopSave_Click(s,e);}" />
                    </dxe:ASPxButton> 
                </td>
                <td style="width:70px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnBottomCheck" Text="提交审核" CausesValidation="true" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnSaveCheckClick(s,e);}" />
                    </dxe:ASPxButton> 
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnCancel" Text="重置" CausesValidation="false" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnCancelClick();}" />
                    </dxe:ASPxButton>
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxeClose" Text="关闭" CausesValidation="false" AutoPostBack="false">
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
</asp:Content>
