﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="PremiumReceivablePeriodReport.aspx.cs"
    Inherits="BrokerWebApp.Accounting.PremiumReceivablePeriodReport" %>

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
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保单录入列表</title>

    <script type="text/javascript">
        $(document).ready(function() {

            //lblCurrentDate.innerHTML = makewelcomeString();

        });


        function gridCustomButtonClick(s, e) {
            debugger;
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            var noint = s.GetDataRow(e.visibleIndex).cells[1].innerText;
            var querystring;
            querystring = "../PolicyViewTransfer.aspx?id=" + noint;
            window.showModalDialog(querystring, self, myArguments);
        }

        function isEmpty(testVar) {
            if ((testVar == null) || (testVar.length == 0)) {
                return true;
            } else {
                return false;
            }
        }

        function dxeddlDeptID_SelectedIndexChanged(s, e) {
            var thejsonstring = dxeddlDeptID.GetSelectedItem().value;
            dxeddlSalesId.PerformCallback(thejsonstring);
        }

        function dxeddlCarrierId_SelectedIndexChanged(s, e) {
            var thejsonstring = dxeddlCarrierId.GetSelectedItem().value;
            dxeddlBranchId.PerformCallback(thejsonstring);
        }

        function btnResetClick() {
            ASPxClientEdit.ClearEditorsInContainer(null);
        }
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width: 100%">
        <tr>
            <td style="width: 100%;" colspan="2">
                <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            所属项目</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(展开)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0"
                    Width="820px">
                    <table>
                        <tr>
                            <td>
                                <table>
                                    <tr style="font-size: 1px; height: 2px;">
                                        <td style="width: 110px">
                                        </td>
                                        <td style="width: 210px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 150px">
                                        </td>
                                        <td style="width: 100px">
                                        </td>
                                        <td style="width: 150px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            保单编号:
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server"
                                                Width="170px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td style="text-align: right;">
                                            投保编号：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server"
                                                Width="170px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td style="text-align: right;">
                                            投保客户：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="dxetxtCustomer" ClientInstanceName="dxetxtCustomer" runat="server"
                                                Width="155px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            部门：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server"
                                                Width="170px" DropDownStyle="DropDownList">
                                                <ClientSideEvents SelectedIndexChanged="dxeddlDeptID_SelectedIndexChanged" />
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: right;">
                                            客户经理：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server"
                                                Width="170px" DropDownStyle="DropDownList" OnCallback="dxeddlSalesIdCallback">
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: right;">
                                            保险险种：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlProdTypeName" ClientInstanceName="dxeddlProdTypeName"
                                                runat="server" Width="160px" DropDownStyle="DropDownList">
                                            </dxe:ASPxComboBox>
                                            <input type="hidden" id="ptid" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            保险公司：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlCarrierId" ClientInstanceName="dxeddlCarrierId" runat="server"
                                                Width="170px" DropDownStyle="DropDownList">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {dxeddlCarrierId_SelectedIndexChanged(s,e);}" />
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: right;">
                                            分支机构：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlBranchId" ClientInstanceName="dxeddlBranchId" runat="server"
                                                Width="170px" DropDownStyle="DropDownList" OnCallback="dxeddlBranchId_Callback">
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: right;">
                                            业务员：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="dxetxtCarrierSales" ClientInstanceName="dxetxtCarrierSales"
                                                runat="server" Width="155px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            业务来源：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlSourceTypeID" ClientInstanceName="dxeddlSourceTypeID"
                                                runat="server" Width="170px" DropDownStyle="DropDownList">
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: right;">
                                            业务性质：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlOperationType" ClientInstanceName="dxeddlOperationType"
                                                runat="server" Width="170px" DropDownStyle="DropDownList">
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: right;">
                                            审核状态：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlPolicyStatus" ClientInstanceName="dxeddlPolicyStatus"
                                                runat="server" Width="170px" DropDownStyle="DropDownList">
                                            </dxe:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            录单日期：
                                        </td>
                                        <td style="text-align: left;">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeStartDate" ClientInstanceName="dxeStartDate" runat="server"
                                                            Width="95px">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td>
                                                        至
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeEndDate" ClientInstanceName="dxeEndDate" runat="server"
                                                            Width="95px">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="text-align: center;">
                                            应收日期：
                                        </td>
                                        <td style="text-align: center;">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeStartPayDate" ClientInstanceName="dxeStartPayDate" runat="server"
                                                            Width="95px">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td>
                                                        至
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeEndPayDate" ClientInstanceName="dxeEndPayDate" runat="server"
                                                            Width="95px">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="text-align: right;" colspan="2">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxButton ID="btnSearch" runat="server" Text="查询" CssClass="input_2" OnClick="btnSearch_Click">
                                                        </dxe:ASPxButton>
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxButton ID="btnReset" runat="server" Text="重置" AutoPostBack="false" class="input_2">
                                                            <ClientSideEvents Click="btnResetClick" />
                                                        </dxe:ASPxButton>
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxButton ID="btnExport" runat="server" Text="Excel" OnClick="btnXlsExport_Click"
                                                            CssClass="input_2" />
                                                        </dxe:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearch" runat="Server" TargetControlID="npSearchDetail"
                    ExpandControlID="npSearchHeader" CollapseControlID="npSearchHeader" Collapsed="false"
                    TextLabelID="lbl_npSearchHeader" ImageControlID="img_npSearchHeader" ExpandedText="(展开)"
                    CollapsedText="(隐藏)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%;" colspan="2">
                <asp:Panel ID="npSearchResultHeader" runat="server" CssClass="collapsePanelHeader"
                    Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchResultHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            搜索结果</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchResultHeader" runat="server">(展开)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server"
                                    KeyFieldName="GUID" AutoGenerateColumns="False" Settings-ShowFooter="true" Width="100%"
                                    SettingsPager-AlwaysShowPager="true" OnCustomCallback="gridSearchResult_CustomCallback"
                                    OnCustomSummaryCalculate="gridSearchResult_CustomSummaryCalculate">
                                    <%-- BeginRegion Columns --%>
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                            <NewButton Visible="False" />
                                            <EditButton Visible="False" />
                                            <CustomButtons>
                                                <dxwgv:GridViewCommandColumnCustomButton Text="查看">
                                                </dxwgv:GridViewCommandColumnCustomButton>
                                            </CustomButtons>
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="PolicyID" Caption="投保编号" CellStyle-Wrap="False"
                                            VisibleIndex="0">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Beneficiary" Caption="被保险人" CellStyle-Wrap="False"
                                            VisibleIndex="1">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CustomerName" Caption="投保客户" CellStyle-Wrap="False"
                                            VisibleIndex="2">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="DeptName" Caption="部门" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="UserName" Caption="客户经理" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="ProdTypeName" Caption="险种" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="StartDate" Caption="起保日期" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="EndDate" Caption="终止日期" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CarrierName" Caption="保险公司" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CarrierSales" Caption="业务员" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="PolicyNo" Caption="保单编号" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataColumn FieldName="AltNo" Caption="批单号" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="SourceTypeName" Caption="业务来源" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="OperationTypeName" Caption="业务性质" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="GatheringTypeName" Caption="收款方式" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayFee" Caption="保费（本）" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayProc" Caption="经纪费（本）" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Period" Caption="期次" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayDate" Caption="保费应收日期" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="D0" Caption="<=45天(保费)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="D0Proc" Caption="<=45天(经纪费)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="D30" Caption="45到90天(保费)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="D30Proc" Caption="45到90天(经纪费)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="D60" Caption="90到120天(保费)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="D60Proc" Caption="90到120天(经纪费)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="D90" Caption=">120天(保费)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="D90Proc" Caption=">120天(经纪费)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                    </Columns>
                                    <%-- EndRegion --%>
                                    <SettingsPager Mode="ShowPager" />
                                    <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways"
                                        ShowGroupedColumns="true" ShowFilterRow="false" />
                                    <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                    <SettingsText CustomizationWindowCaption="个性化" />
                                    <GroupSummary>
                                        <dxwgv:ASPxSummaryItem FieldName="PolicyID" SummaryType="Count" ShowInGroupFooterColumn="PolicyID"
                                            DisplayFormat="总计: {0}" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayFee" SummaryType="Sum" ShowInGroupFooterColumn="PayFee"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayProc" SummaryType="Sum" ShowInGroupFooterColumn="PayProc"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D0" SummaryType="Sum" ShowInGroupFooterColumn="D0"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D30" SummaryType="Sum" ShowInGroupFooterColumn="D30"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D60" SummaryType="Sum" ShowInGroupFooterColumn="D60"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D90" SummaryType="Sum" ShowInGroupFooterColumn="D90"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D0Proc" SummaryType="Sum" ShowInGroupFooterColumn="D0Proc"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D30Proc" SummaryType="Sum" ShowInGroupFooterColumn="D30Proc"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D60Proc" SummaryType="Sum" ShowInGroupFooterColumn="D60Proc"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D90Proc" SummaryType="Sum" ShowInGroupFooterColumn="D90Proc"
                                            DisplayFormat="c" />
                                    </GroupSummary>
                                    <TotalSummary>
                                        <dxwgv:ASPxSummaryItem FieldName="PolicyID" SummaryType="Count" ShowInColumn="Beneficiary"
                                            DisplayFormat="保单数: {0}" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayFee" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayProc" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D0" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D30" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D60" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D90" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D0Proc" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D30Proc" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D60Proc" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="D90Proc" SummaryType="Sum" DisplayFormat="c" />
                                    </TotalSummary>
                                    <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                                </dxwgv:ASPxGridView>
                                <dxwgv:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridSearchResult">
                                </dxwgv:ASPxGridViewExporter>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearchResult" runat="Server" TargetControlID="npSearchResultDetail"
                    ExpandControlID="npSearchResultHeader" CollapseControlID="npSearchResultHeader"
                    Collapsed="false" TextLabelID="lbl_npSearchResultHeader" ImageControlID="img_npSearchResultHeader"
                    ExpandedText="(展开)" CollapsedText="(隐藏)" ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
            </td>
        </tr>
    </table>
</asp:Content>
