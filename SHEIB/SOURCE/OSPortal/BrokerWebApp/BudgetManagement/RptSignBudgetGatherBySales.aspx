<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true"
    CodeBehind="RptSignBudgetGatherBySales.aspx.cs" Theme="Aqua" Inherits="BrokerWebApp.BudgetManagement.RptSignBudgetGatherBySales" %>

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
                                    </Items>
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                预算类别：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeDllType" ClientInstanceName="dxeDllType" runat="server"
                                    Width="170px" DropDownStyle="DropDownList">
                                    <Items>
                                        <dxe:ListEditItem Text="保费" Value="0" />
                                        <dxe:ListEditItem Text="佣金" Value="1" />
                                    </Items>
                                </dxe:ASPxComboBox>
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
                            <dxwgv:GridViewDataTextColumn Caption="客户经理" FieldName="SalesName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="一月" FieldName="B01" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="二月" FieldName="B02" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="三月" FieldName="B03" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="四月" FieldName="B04" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="五月" FieldName="B05" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="六月" FieldName="B06" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="七月" FieldName="B07" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="八月" FieldName="B08" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="九月" FieldName="B09" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="十月" FieldName="B10" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="十一月" FieldName="B11" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="十二月" FieldName="B12" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="续保" FieldName="BContinue" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="新增" FieldName="BAdd" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="汇总" FieldName="BSum" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem FieldName="B01" SummaryType="Sum" ShowInGroupFooterColumn="B01"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="B02" SummaryType="Sum" ShowInGroupFooterColumn="B02"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="B03" SummaryType="Sum" ShowInGroupFooterColumn="B03"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="B04" SummaryType="Sum" ShowInGroupFooterColumn="B04"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="B05" SummaryType="Sum" ShowInGroupFooterColumn="B05"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="B06" SummaryType="Sum" ShowInGroupFooterColumn="B06"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="B07" SummaryType="Sum" ShowInGroupFooterColumn="B07"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="B08" SummaryType="Sum" ShowInGroupFooterColumn="B08"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="B09" SummaryType="Sum" ShowInGroupFooterColumn="B09"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="B10" SummaryType="Sum" ShowInGroupFooterColumn="B10"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="B11" SummaryType="Sum" ShowInGroupFooterColumn="B11"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="B12" SummaryType="Sum" ShowInGroupFooterColumn="B12"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="BContinue" SummaryType="Sum" ShowInGroupFooterColumn="BSContinue"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="BAdd" SummaryType="Sum" ShowInGroupFooterColumn="BAdd"
                                DisplayFormat=" {0}" />
                            <dxwgv:ASPxSummaryItem FieldName="BSum" SummaryType="Sum" ShowInGroupFooterColumn="BSum"
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
