<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true"
    Theme="Aqua" CodeBehind="CaseEnd.aspx.cs" Inherits="OSPortalWebApp.CustomerClaim.CaseEnd"
    Title="" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>确认结案</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="npCaseEnd" runat="server" CssClass="collapsePanel">
        <table style="width: 100%;">
            <tr>
                <td style="width: 100%;">
                    <asp:Panel ID="npAlertCustomHeader" runat="server" CssClass="collapsePanelHeader"
                        Height="15px">
                        &nbsp;结案登记
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 20%; text-align: right;">
                                结案时间：
                            </td>
                            <td style="width: 30%; text-align: left;">
                                <dxe:ASPxDateEdit ID="deCaseEndTime" runat="server">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 20%; text-align: right;">
                                最终赔付：
                            </td>
                            <td style="width: 30%; text-align: left;">
                                <asp:TextBox runat="server" ID="txtLastPayFee"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20%; text-align: right;">
                                免赔额：
                            </td>
                            <td style="width: 30%; text-align: left;">
                                <asp:TextBox runat="server" ID="txtAcquitFee"></asp:TextBox>
                            </td>
                            <td style="width: 20%; text-align: right;">
                            </td>
                            <td style="width: 30%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20%; text-align: right;">
                                备注：
                            </td>
                            <td style="text-align: left;" colspan="3">
                                <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" Style="width: 300px"
                                    Rows="6"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="25px">
        <table style="width: 100%">
            <tr>
                <td style="text-align: right;">
                    <asp:Button ID="btnConfirm" runat="server" Text="确认" CssClass="input_2" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="input_2" />
                </td>
                <td style="width: 180px; text-align: left;">
                    &nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
