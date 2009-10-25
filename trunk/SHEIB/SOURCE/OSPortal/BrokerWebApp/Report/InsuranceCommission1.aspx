<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master"
    AutoEventWireup="true" CodeBehind="InsuranceCommission1.aspx.cs" Inherits="BrokerWebApp.Report.InsuranceCommission1" %>

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
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});

            lblCurrentDate.innerHTML = makewelcomeString();

        });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width: 100%">
        <tr>
            <td style="height: 40px; width: 45%;">
            </td>
            <td style="height: 40px; width: 55%; color: #0E5ED5; text-align: left;">
                当前位置：经纪公司业务报表（按险种分类）&nbsp;
                <asp:Label ID="LblUserNameTop" runat="server" Text="王六"></asp:Label>，您好！今天是
                <label id="lblCurrentDate">
                </label>
            </td>
        </tr>
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
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td style="text-align: right;">
                                            报表日期：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxDateEdit ID="dxeStartDate" ClientInstanceName="dxeStartDate" runat="server">
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td style="text-align: center;">
                                            至
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxDateEdit ID="dxeEndDate" ClientInstanceName="dxeEndDate" runat="server">
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td style="text-align: right;">
                                            <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" OnClick="btnSearch_Click" />&nbsp;
                                            <input type="reset" value="重置" name="btnReset" id="btnReset" class="input_2" />&nbsp;
                                            <asp:Button ID="btnExport" runat="server" Text="Excel" OnClick="btnXlsExport_Click"
                                                CssClass="input_2" />
                                        </td>
                                        <td>
                                            &nbsp;
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
                                    AutoGenerateColumns="False" Settings-ShowFooter="true" Width="100%">
                                    <%-- BeginRegion Columns --%>
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                            <NewButton Visible="False" />
                                            <EditButton Visible="False" />
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataColumn FieldName="LMType" Caption="险种" CellStyle-Wrap="False"
                                            GroupIndex="0" Visible="false">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="LMMC" Caption="险种名称" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="HC" Caption="行次" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PolicyCount" Caption="保单件数(件)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Premium" Caption="保费金额(元)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="NeedPayinPremium" Caption="未解付保费(元)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Process" Caption="经纪佣金(元)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="ConsultFee" Caption="咨询费收入(元)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                    </Columns>
                                    <%-- EndRegion --%>
                                    <SettingsPager Mode="ShowAllRecords" />
                                    <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowColumnHeaders="true"
                                        ShowGroupFooter="VisibleAlways" ShowGroupedColumns="true" ShowFilterRow="false" />
                                    <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                    <SettingsText CustomizationWindowCaption="个性化" />
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
