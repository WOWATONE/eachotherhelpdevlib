<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true"
    Theme="Aqua" CodeBehind="CustomerPtFollow.aspx.cs" Inherits="OSPortalWebApp.CustomerRelation.CustomerPtFollow"
    Title="" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>销售跟进</title>
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
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="allborderPanel">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                客户名称：
                            </td>
                            <td style="width: 30%; text-align: left;" colspan="3">
                                <asp:TextBox ID="txtCustName" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                跟进内容<br />
                                关键字：
                            </td>
                            <td rowspan="3" style="width: 54%; text-align: left;">
                                <asp:TextBox ID="txtFollowMemo" runat="server" TextMode="MultiLine" Style="width: 70%;"
                                    Rows="8"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                跟进日期：
                            </td>
                            <td style="width: 14%; text-align: left;" nowrap="nowrap">
                                <dxe:ASPxDateEdit ID="deStartFollowDate" runat="server">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 2%; text-align: center;" nowrap="nowrap">
                                至
                            </td>
                            <td nowrap="nowrap" style="width: 14%; text-align: left;">
                                <dxe:ASPxDateEdit ID="deEndFollowDate" runat="server">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                跟进类型：
                            </td>
                            <td style="width: 30%; text-align: left;" colspan="3">
                                <asp:DropDownList ID="ddlFollowType" runat="server" Width="200px">
                                    <asp:ListItem Text="面谈" Value="1" Selected></asp:ListItem>
                                    <asp:ListItem Text="电话" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                客户经理
                            </td>
                            <td style="width: 30%; text-align: left;" colspan="3">
                                <asp:DropDownList ID="ddlCusomerManager" runat="server" Width="200px">
                                    <asp:ListItem Text="张三" Value="1" Selected></asp:ListItem>
                                    <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 8%; text-align: right;">
                            </td>
                            <td style="width: 54%; text-align: left;">
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
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <dxwgv:ASPxGridView ID="gridCustomerPtItem" ClientInstanceName="gridCustomerPtItem"
                                    runat="server" KeyFieldName="FollowID" Width="100%" AutoGenerateColumns="False">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="FollowID" FieldName="FollowID" VisibleIndex="0"
                                            Visible="False">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="跟进日期" FieldName="FollowDate" VisibleIndex="1">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="客户名称" FieldName="CustName" VisibleIndex="2">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="跟进类型" FieldName="FollowType" VisibleIndex="3">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="客户经理" FieldName="Sales" VisibleIndex="4">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="跟进内容" FieldName="FollowMemo" VisibleIndex="5"
                                            Width="50%">
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsPager Mode="ShowAllRecords" />
                                    <Settings ShowGroupPanel="false" />
                                </dxwgv:ASPxGridView>
                            </td>
                        </tr>
                    </table>
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
