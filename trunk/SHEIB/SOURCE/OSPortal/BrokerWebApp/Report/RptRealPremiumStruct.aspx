<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="RptRealPremiumStruct.aspx.cs"
    Inherits="BrokerWebApp.Report.RptRealPremiumStruct" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>分险种经纪业务统计</title>

    <script type="text/javascript">

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width: 100%;">
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            所属项目</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="allborderPanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="text-align: right;">
                                年月：
                            </td>
                            <td style="text-align: left;">
                                <table>
                                    <tr>
                                        <td>
                                            <dxe:ASPxTextBox ID="dxetxtNY" ClientInstanceName="dxetxtNY" runat="server" Width="160px">
                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="true" ValidationGroup="BaseGroup">
                                                    <RequiredField IsRequired="true" ErrorText="不能为空,请录入" />
                                                </ValidationSettings>
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td style="text-align: left;">
                                            (格式为YYYYMM，如200901)
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="text-align: right;">
                            </td>
                            <td style="text-align: left;">
                            </td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="查询" CssClass="input_2" OnClick="btnSearch_Click"
                                    ValidationGroup="BaseGroup" CausesValidation="true" />&nbsp;
                                <input type="reset" value="重置" name="btnReset" id="btnReset" class="input_2" />&nbsp;
                                <asp:Button ID="btnXlsExport" runat="server" Text="Excel" OnClick="btnXlsExport_Click"
                                    CssClass="input_2" />
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
                        <div style="float: left; margin-left: 5px;">
                            搜索结果</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchResultHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server"
                        KeyFieldName="SignPremiumBudgetID" AutoGenerateColumns="False" Settings-ShowFooter="true"
                        Width="100%" SettingsPager-AlwaysShowPager="true">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="部门名称" FieldName="DeptName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center" GroupIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户名称" FieldName="UserName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center" GroupIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption=" " FieldName="TypeName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="上年签单实收保费" FieldName="PremiumLSignedPayed"
                                CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="本年签单实收保费" FieldName="PremiumCSignedPayed"
                                CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="实收保费合计" FieldName="PremiumSum" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="上年签单经纪费" FieldName="ProcessLSignedPayed" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="本年签单经纪费" FieldName="ProcessCSignedPayed" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="经纪费合计" FieldName="ProcessSum" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <GroupSummary>
                            <dxwgv:ASPxSummaryItem FieldName="PremiumLSignedPayed" SummaryType="Sum" ShowInGroupFooterColumn="PremiumLSignedPayed"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="PremiumCSignedPayed" SummaryType="Sum" ShowInGroupFooterColumn="PremiumCSignedPayed"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="PremiumSum" SummaryType="Sum" ShowInGroupFooterColumn="PremiumSum"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="ProcessLSignedPayed" SummaryType="Sum" ShowInGroupFooterColumn="ProcessLSignedPayed"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="ProcessCSignedPayed" SummaryType="Sum" ShowInGroupFooterColumn="ProcessCSignedPayed"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="ProcessSum" SummaryType="Sum" ShowInGroupFooterColumn="ProcessSum"
                                DisplayFormat=" {0}" />
                        </GroupSummary>
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem FieldName="PremiumLSignedPayed" SummaryType="Sum" ShowInGroupFooterColumn="PremiumLSignedPayed"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="PremiumCSignedPayed" SummaryType="Sum" ShowInGroupFooterColumn="PremiumCSignedPayed"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="PremiumSum" SummaryType="Sum" ShowInGroupFooterColumn="PremiumSum"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="ProcessLSignedPayed" SummaryType="Sum" ShowInGroupFooterColumn="ProcessLSignedPayed"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="ProcessCSignedPayed" SummaryType="Sum" ShowInGroupFooterColumn="ProcessCSignedPayed"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="ProcessSum" SummaryType="Sum" ShowInGroupFooterColumn="ProcessSum"
                                DisplayFormat=" {0}" />
                        </TotalSummary>
                        <SettingsPager Mode="ShowPager" />
                        <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleIfExpanded"
                            ShowGroupedColumns="true" ShowFilterRow="false" />
                        <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" AllowGroup="true" />
                        <SettingsText CustomizationWindowCaption="个性化" />
                    </dxwgv:ASPxGridView>
                    <dxwgv:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridSearchResult">
                    </dxwgv:ASPxGridViewExporter>
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
