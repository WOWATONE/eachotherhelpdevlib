<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true"
    Theme="Aqua" CodeBehind="AlertService.aspx.cs" Inherits="OSPortalWebApp.CustomerRelation.AlertService"
    Title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>服务提醒</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width: 100%">
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npAlertCustomHeader" runat="server" CssClass="collapsePanelHeader"
                    Height="15px">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 20%; text-align: right;">
                                服务提醒消息定制
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="npAlertCustom" runat="server" CssClass="allborderPanel">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 20%;" dir="rtl">
                                <asp:CheckBox ID="chkAccount" runat="server" Text="收付提醒" TextAlign="Left" />&nbsp;
                            </td>
                            <td style="width: 60px">
                            </td>
                            <td style="width: 250px" colspan="2">
                                保费通知书后&nbsp;<asp:TextBox ID="txtAccount" runat="server" Width="50px" Text="0"></asp:TextBox>&nbsp;天未客户收费发出通知
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20%;" dir="rtl">
                                <asp:CheckBox ID="chkContinue" runat="server" Text="续保提醒" TextAlign="Left" />&nbsp;
                            </td>
                            <td style="width: 60px">
                            </td>
                            <td style="width: 250px" colspan="2">
                                保单到期前&nbsp;<asp:TextBox ID="txtContinue" runat="server" Width="50px" Text="0"></asp:TextBox>&nbsp;天发出提醒
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20%;" dir="rtl">
                                <asp:CheckBox ID="chkFollow" runat="server" Text="客户跟进" TextAlign="Left" />&nbsp;
                            </td>
                            <td style="width: 60px">
                            </td>
                            <td style="width: 250px" colspan="2">
                                最后一次跟进后&nbsp;<asp:TextBox ID="txtFollow" runat="server" Width="50px" Text="0"></asp:TextBox>&nbsp;天内发出提醒
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20%;" dir="rtl">
                                <asp:CheckBox ID="chkBirthday" runat="server" Text="客户生日" TextAlign="Left" />&nbsp;
                            </td>
                            <td style="width: 60px">
                            </td>
                            <td style="width: 250px" colspan="2">
                                客户生日前&nbsp;<asp:TextBox ID="txtBirthday" runat="server" Width="50px" Text="0"></asp:TextBox>&nbsp;天提醒
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20%;" dir="rtl">
                                <asp:CheckBox ID="chkDebt" runat="server" Text="佣金提醒" TextAlign="Left" />&nbsp;
                            </td>
                            <td style="width: 60px">
                            </td>
                            <td style="width: 250px" colspan="2">
                                开票日期&nbsp;<asp:TextBox ID="txtDebt" runat="server" Width="50px" Text="0"></asp:TextBox>&nbsp;天未结算提醒
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="25px">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 250px; text-align: right;">
                            </td>
                            <td style="text-align: left;">
                                <asp:Button ID="btnRecoverAlert" runat="server" Text="恢复提醒" CssClass="input_2" />&nbsp;&nbsp;
                                <asp:Button ID="btnSaveAlert" runat="server" Text="保存提醒" CssClass="input_2" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
