﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="NotifyClaimList.aspx.cs" Inherits="BrokerWebApp.CustomerClaim.NotifyClaimList" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3.Export" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>客户理赔列表</title>

    <script type="text/javascript">
        function btnCreateClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=800px;center=yes;help=no";
            window.showModalDialog("NotifyClaim.aspx", self, myArguments);
        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=800px;center=yes;help=no";
            var notifyID = s.GetDataRow(e.visibleIndex).cells[1].innerText;
            window.showModalDialog("NotifyClaim.aspx?NotifyID=" + notifyID, self, myArguments);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width: 100%">
        <tr>
            <td style="height: 40px; width: 60%;">
                <dxe:ASPxButton ID="debtnCreate" runat="server" Text="新建" AutoPostBack="False">
                    <ClientSideEvents Click="btnCreateClick" />
                </dxe:ASPxButton>
            </td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">所属项目</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width:100px; text-align: right;">
                                保单编号：
                            </td>
                            <td style="width:170px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td style="width:30px; text-align: center;">
                                <img runat="server" id="imgSelectCustomer" onclick="imgSelectPolicyClick();" alt=""
                                                        src="../images/searchicon9.png" style="width: 20px; height: 20px; vertical-align: top;" visible="false" />
                            </td>
                            <td style="width:100px; text-align: right;">
                                报案号：
                            </td>
                            <td style="width: 170px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtNotifyNo" ClientInstanceName="dxetxtNotifyNo" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                报案开始日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="deStartNotifyTime" ClientInstanceName="deStartNotifyTime" runat="server" Width="160px">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: center;">
                                至
                            </td>
                            <td style="text-align: right;">
                                报案结束日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="deEndNotifyTime" ClientInstanceName="deEndNotifyTime" runat="server" Width="160px">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                出险开始日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="deStartAccidentTime" ClientInstanceName="deStartAccidentTime" runat="server" Width="160px"></dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: center;">
                                至
                            </td>
                            <td style="text-align: right;">
                                出险结束日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="deEndAccidentTime" ClientInstanceName="deEndAccidentTime" runat="server" Width="160px"></dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                报案人：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtNotifyPerson" ClientInstanceName="dxetxtNotifyPerson" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: center;">
                                &nbsp;
                            </td>
                            <td style="text-align: right;">
                                联系人：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtContactPerson" ClientInstanceName="dxetxtContactPerson" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: left;">
                                <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" OnClick="btnSearch_Click" />&nbsp;
                                <input type="reset" value="重置" name="btnReset" id="btnReset" class="input_2" />&nbsp;
                                <asp:Button ID="btnXlsExport" runat="server" Text="Excel" OnClick="btnXlsExport_Click" CssClass="input_2" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearch" runat="Server" TargetControlID="npSearchDetail"
                    ExpandControlID="npSearchHeader" CollapseControlID="npSearchHeader" Collapsed="false"
                    TextLabelID="lbl_npSearchHeader" ImageControlID="img_npSearchHeader" ExpandedText="(隐藏)"
                    CollapsedText="(展开)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npSearchResultHeader" runat="server" CssClass="collapsePanelHeader"
                    Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchResultHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">搜索结果</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchResultHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <dxwgv:ASPxGridView ID="gridSearchResult" 
                           ClientInstanceName="gridSearchResult" 
                           runat="server"
                           KeyFieldName="NotifyID" 
                           AutoGenerateColumns="False" 
                           Settings-ShowFooter="true"
                           Width="100%" 
                           SettingsPager-AlwaysShowPager="true" 
                           OnRowDeleting="gridSearchResult_RowDeleting"
                           OnRowDeleted="gridSearchResult_RowDeleted">
                        <Columns>
                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" Width="20px">
                                <NewButton Visible="False" />
                                <EditButton Visible="False" />
                                <DeleteButton Visible="true" />
                                <CustomButtons>
                                    <dxwgv:GridViewCommandColumnCustomButton Text="编辑">
                                    </dxwgv:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn Caption="理赔编号" FieldName="NotifyID" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="保单编号" FieldName="PolicyNo" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="报案号" FieldName="NotifyNo" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="报案时间" FieldName="NotifyTime" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="出险时间" FieldName="AccidentTime" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="报案人" FieldName="NotifyPerson" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="报损金额" FieldName="NotifyLossFee" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="联系人" FieldName="ContactPerson" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="报案号" FieldName="NotifyNo" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="查勘时间" FieldName="PerambulateTime" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="结案时间" FieldName="CaseEndTime" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="最终赔付金额" FieldName="LastPayFee" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="免赔额" FieldName="AcquitFee" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowPager" />
                        <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways" ShowGroupedColumns="true" ShowFilterRow="false" />
                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                        <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                        <SettingsText CustomizationWindowCaption="个性化" />
                        <TotalSummary >
                            <dxwgv:ASPxSummaryItem FieldName="NotifyID" SummaryType="Count" ShowInGroupFooterColumn="NotifyID" DisplayFormat = "总计: {0}" />
                        </TotalSummary>
                        <TotalSummary >
                            <dxwgv:ASPxSummaryItem FieldName="NotifyLossFee" SummaryType="Sum" ShowInGroupFooterColumn="NotifyLossFee" DisplayFormat = "报损金额合计: {0}" />
                        </TotalSummary>
                        <TotalSummary >
                            <dxwgv:ASPxSummaryItem FieldName="LastPayFee" SummaryType="Sum" ShowInGroupFooterColumn="LastPayFee" DisplayFormat = "赔付金额合计: {0}" />
                        </TotalSummary>
                        <TotalSummary >
                            <dxwgv:ASPxSummaryItem FieldName="AcquitFee" SummaryType="Sum" ShowInGroupFooterColumn="AcquitFee" DisplayFormat = "免赔额合计: {0}" />
                        </TotalSummary>
                    </dxwgv:ASPxGridView>
                    <dxwgv:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridSearchResult"></dxwgv:ASPxGridViewExporter>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearchResult" runat="Server" TargetControlID="npSearchResultDetail"
                    ExpandControlID="npSearchResultHeader" CollapseControlID="npSearchResultHeader"
                    Collapsed="false" TextLabelID="lbl_npSearchResultHeader" ImageControlID="img_npSearchResultHeader"
                    ExpandedText="(隐藏)" CollapsedText="(展开)" ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
            </td>
        </tr>
    </table>
</asp:Content>