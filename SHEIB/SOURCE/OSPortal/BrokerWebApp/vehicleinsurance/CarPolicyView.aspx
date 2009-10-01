﻿<%@ Page Title="车辆保单信息录入" Theme="Aqua" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="True" CodeBehind="CarPolicyView.aspx.cs" Inherits="BrokerWebApp.vehicleinsurance.CarPolicyView" %>

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
    <title>车辆保单信息查看</title>
    
    <script type="text/javascript">
        function btnCloseClick() {
            window.close();
        }
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <input type="hidden" id="pagemode" runat="server" value="" />
        
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
                                                        询价单号：
                                                    </td>
                                                    <td style="text-align: left; color: Red">
                                                        <dxe:ASPxTextBox ID="dxetxtAskPriceID" ClientInstanceName="dxetxtAskPriceID" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        商业险保单号：
                                                    </td>
                                                    <td style="text-align: left;" colspan="3">
                                                        <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server" Width="483px"></dxe:ASPxTextBox>
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
                                                        <dxe:ASPxTextBox ID="dxetxtAciPolicyNo" ClientInstanceName="dxetxtAciPolicyNo" runat="server" Width="483px"></dxe:ASPxTextBox>
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
                                                        <dxe:ASPxComboBox ID="dxeddlBranchId" ClientInstanceName="dxeddlBranchId" runat="server" Width="160px" DropDownStyle="DropDownList">
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
                                                        <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server" Width="160px" DropDownStyle="DropDownList">
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
                                                    <td>
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
                                                        <dxe:ASPxTextBox ID="dxetxtSpecial" ClientInstanceName="dxetxtSpecial" runat="server" Width="803px"></dxe:ASPxTextBox>
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
                                                    <td style="text-align: left; width: 95px">
                                                        <dxe:ASPxDateEdit ID="dxeCreateTime" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxDateEdit>
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
                                                            OnCustomCallback="gridPolicyItem_CustomCallback"
                                                            >
                                                            <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left"
                                                                    Width="81" HeaderStyle-Wrap="False" AllowDragDrop="false">
                                                                    <NewButton Visible="false" />
                                                                    <EditButton Visible="false" />
                                                                    <DeleteButton Visible="false" />
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
                                                            <SettingsBehavior />
                                                            <ClientSideEvents EndCallback="function(s, e) {}" />
                                                                                                                        
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
                                        KeyFieldName="PolPeriodId" Width="100%" 
                                        OnCustomCallback="gridPeriod_CustomCallback"
                                        >
                                        <%-- BeginRegion Columns --%>
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="false">
                                                <EditButton Visible="false" />
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
                                        <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
                                        <Styles>
                                            <LoadingDiv>
                                            </LoadingDiv>
                                            <LoadingPanel>
                                            </LoadingPanel>
                                        </Styles>
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
                <td style="width:50px; text-align:left;">
                     
                </td>
                <td style="width:70px; text-align:left;">
                     
                </td>
                <td style="width:50px; text-align:left;">
                    
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxeClose" ClientInstanceName="dxeClose" Text="关闭" CausesValidation="false" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnCloseClick();}" />
                    </dxe:ASPxButton>
                </td>                
            </tr>
            
        </table>
    </asp:Panel>

</asp:Content>