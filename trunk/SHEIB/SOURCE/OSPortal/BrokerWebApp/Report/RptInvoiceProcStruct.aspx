<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true"
    CodeBehind="RptInvoiceProcStruct.aspx.cs" Theme="Aqua" Inherits="BrokerWebApp.Report.RptInvoiceProcStruct" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>预算汇总表</title>

    <script type="text/javascript">
        function dxeddlDeptID_SelectedIndexChanged(s, e) {
            var thejsonstring = dxeddlDeptID.GetSelectedItem().value;
            dxeddlSalesID.PerformCallback(thejsonstring);
        }
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
                                年份：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeDllYear" ClientInstanceName="dxeDllYear" runat="server"
                                    Width="170px" DropDownStyle="DropDownList">
                                    <Items>
                                        <dxe:ListEditItem Text="2009" Value="2009" />
                                        <dxe:ListEditItem Text="2010" Value="2010" />
                                        <dxe:ListEditItem Text="2011" Value="2011" />
                                        <dxe:ListEditItem Text="2012" Value="2012" />
                                        <dxe:ListEditItem Text="2013" Value="2013" />
                                        <dxe:ListEditItem Text="2014" Value="2014" />
                                        <dxe:ListEditItem Text="2015" Value="2015" />
                                        <dxe:ListEditItem Text="2016" Value="2016" />
                                        <dxe:ListEditItem Text="2017" Value="2017" />
                                        <dxe:ListEditItem Text="2018" Value="2018" />
                                        <dxe:ListEditItem Text="2019" Value="2019" />
                                    </Items>
                                </dxe:ASPxComboBox>
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
                            <dxwgv:GridViewDataTextColumn Caption="险种" FieldName="ProductTypeName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="上年签单上年收费" FieldName="YesteryearSignedYesteryearPayed"
                                CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="上年签单本年收费" FieldName="YesteryearSignedCurrentyearPayed"
                                CellStyle-Wrap="False" SortOrder="Ascending" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="本年签单" FieldName="CurrentyearSigned" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="小计" FieldName="PremiumSum" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="占比(%)" FieldName="PremiumRate" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem FieldName="YesteryearSignedYesteryearPayed" SummaryType="Sum"
                                ShowInGroupFooterColumn="YesteryearSignedYesteryearPayed" DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="YesteryearSignedCurrentyearPayed" SummaryType="Sum"
                                ShowInGroupFooterColumn="YesteryearSignedCurrentyearPayed" DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="CurrentyearSigned" SummaryType="Sum" ShowInGroupFooterColumn="CurrentyearSigned"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="PremiumSum" SummaryType="Sum" ShowInGroupFooterColumn="PremiumSum"
                                DisplayFormat=" {0}" />
                        </TotalSummary>
                        <SettingsPager Mode="ShowPager" />
                        <Settings ShowGroupPanel="false" ShowVerticalScrollBar="false" ShowGroupFooter="Hidden"
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
