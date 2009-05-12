<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="Systemlog.aspx.cs" Inherits="OSPortalWebApp.schemasetting.Systemlog" Title="" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>系统日志</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server" />
    <table style="width: 100%">
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
                            <td style="width: 8%; text-align: right;">
                                用户姓名：
                            </td>
                            <td style="width: 20%; text-align: left;">
                                <asp:TextBox ID="txtUserName" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                IP地址：
                            </td>
                            <td style="width: 20%; text-align: left;">
                                <asp:TextBox ID="txtIpAddress" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                操作时间：
                            </td>
                            <td style="width: 20%; text-align: left;">
                                <dxe:ASPxDateEdit ID="deOpStartTime" runat="server" Width="200px">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 8%; text-align: center;">
                                至
                            </td>
                            <td style="width: 20%; text-align: left;">
                                <dxe:ASPxDateEdit ID="deOpEndTime" runat="server" Width="200px">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: left;">
                                <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" />&nbsp;
                                <asp:Button ID="btnCancel" runat="server" Text="重置" CssClass="input_2" />&nbsp;
                                <asp:Button ID="btnRefresh" runat="server" Text="刷新" CssClass="input_2" />
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
                <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel">
                    <dxwgv:ASPxGridView ID="gridSystemLogItem" ClientInstanceName="gridSystemLogItem" runat="server"
                        KeyFieldName="LogID" Width="100%" AutoGenerateColumns="False">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="LogID" FieldName="LogID" Visible="False" 
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="用户姓名" FieldName="UserName" 
                                VisibleIndex="0" Width="20%">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="IP地址" FieldName="IpAddress" 
                                VisibleIndex="1" Width="20%">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="操作时间" FieldName="OpTime" 
                                VisibleIndex="2" Width="20%">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="操作内容" FieldName="OpContent" 
                                VisibleIndex="3">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" 
                            Summary-Text="第{0}页,共{1}页" >
                            <Summary Text="第{0}页,共{1}页" />
                        </SettingsPager>
                        <Settings ShowGroupPanel="false" />
                    </dxwgv:ASPxGridView>
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
