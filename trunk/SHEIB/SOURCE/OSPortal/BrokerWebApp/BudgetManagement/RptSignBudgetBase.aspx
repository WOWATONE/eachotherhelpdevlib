<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="RptSignBudgetBase.aspx.cs" Inherits="BrokerWebApp.BudgetManagement.RptSignBudgetBase" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>签约预算清单列表</title>

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
                            <td style="width: 70px; text-align: right;">
                                部门：
                            </td>
                            <td style="width: 350px; text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server"
                                    Width="170px" DropDownStyle="DropDownList">
                                    <ClientSideEvents SelectedIndexChanged="dxeddlDeptID_SelectedIndexChanged" />
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="width: 70px; text-align: right;">
                                客户经理：
                            </td>
                            <td style="width: 170px; text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlSalesID" ClientInstanceName="dxeddlSalesID" runat="server"
                                    Width="160px" DropDownStyle="DropDownList" OnCallback="dxeddlSalesIDCallback">
                                </dxe:ASPxComboBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
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
                        Width="100%" SettingsPager-AlwaysShowPager="true" OnRowDeleting="gridSearchResult_RowDeleting"
                        OnCustomCallback="gridSearchResult_CustomCallBack">
                        <Columns>
                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" Width="20px">
                                <NewButton Visible="False" />
                                <EditButton Visible="False" />
                                <DeleteButton Visible="false" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn Caption="部门" FieldName="DeptName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户经理" FieldName="SalesName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="投保客户" FieldName="CustomerName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="险种" FieldName="ProdTypeName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="业务性质" FieldName="OperationTypeName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="保费预算" FieldName="PremiumBudget" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="保费实际" FieldName="PremiumActual" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="佣金预算" FieldName="ProcessBudget" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="佣金实际" FieldName="ProcessActual" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="保费预算累计" FieldName="PremiumBudgetSum" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption=" 保费实际累计" FieldName="PremiumActualSum" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="佣金预算累计" FieldName="ProcessBudgetSum" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="佣金实际累计" FieldName="ProcessActualSum" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowPager" />
                        <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways"
                            ShowGroupedColumns="true" ShowFilterRow="false" />
                        <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" AllowGroup="true" />
                        <SettingsText CustomizationWindowCaption="个性化" />
                        <GroupSummary>
                            <dxwgv:ASPxSummaryItem FieldName="PremiumBudget" SummaryType="Sum" ShowInGroupFooterColumn="PremiumBudget"
                                DisplayFormat="c" />
                            <dxwgv:ASPxSummaryItem FieldName="PremiumActual" SummaryType="Sum" ShowInGroupFooterColumn="PremiumActual"
                                DisplayFormat="c" />
                            <dxwgv:ASPxSummaryItem FieldName="ProcessBudget" SummaryType="Sum" ShowInGroupFooterColumn="ProcessBudget"
                                DisplayFormat="c" />
                            <dxwgv:ASPxSummaryItem FieldName="ProcessActual" SummaryType="Sum" ShowInGroupFooterColumn="ProcessActual"
                                DisplayFormat="c" />
                            <dxwgv:ASPxSummaryItem FieldName="PremiumBudgetSum" SummaryType="Sum" ShowInGroupFooterColumn="PremiumBudgetSum"
                                DisplayFormat="c" />
                            <dxwgv:ASPxSummaryItem FieldName="PremiumActualSum" SummaryType="Sum" ShowInGroupFooterColumn="PremiumActualSum"
                                DisplayFormat="c" />
                            <dxwgv:ASPxSummaryItem FieldName="ProcessBudgetSum" SummaryType="Sum" ShowInGroupFooterColumn="ProcessBudgetSum"
                                DisplayFormat="c" />
                            <dxwgv:ASPxSummaryItem FieldName="ProcessActualSum" SummaryType="Sum" ShowInGroupFooterColumn="ProcessActualSum"
                                DisplayFormat="c" />
                        </GroupSummary>
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem FieldName="PremiumBudget" SummaryType="Sum" DisplayFormat="c" />
                            <dxwgv:ASPxSummaryItem FieldName="PremiumActual" SummaryType="Sum" DisplayFormat="c" />
                            <dxwgv:ASPxSummaryItem FieldName="ProcessBudget" SummaryType="Sum" DisplayFormat="c" />
                            <dxwgv:ASPxSummaryItem FieldName="ProcessActual" SummaryType="Sum" DisplayFormat="c" />
                            <dxwgv:ASPxSummaryItem FieldName="PremiumBudgetSum" SummaryType="Sum" DisplayFormat="c" />
                            <dxwgv:ASPxSummaryItem FieldName="PremiumActualSum" SummaryType="Sum" DisplayFormat="c" />
                            <dxwgv:ASPxSummaryItem FieldName="ProcessBudgetSum" SummaryType="Sum" DisplayFormat="c" />
                            <dxwgv:ASPxSummaryItem FieldName="ProcessActualSum" SummaryType="Sum" DisplayFormat="c" />
                        </TotalSummary>
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
