<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" CodeBehind="AlertService.aspx.cs" Inherits="BrokerWebApp.schemasetting.AlertService" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>服务提醒</title>
    <script type="text/javascript">
    <!--
        function GetAlertList(s, e) {
            var btnText = s.GetText();
            switch (btnText) {
                case "收付提醒列表...":
                    break;
                case "续保提醒列表...":
                    break;
                case "跟进提醒列表...":
                    break;
                case "生日提醒列表...":
                    break;
                case "佣金提醒列表...":
                    break;
                default:
                    break;
            }
        }

        function saveAlertDays(s, e) {
            var re = /^[0-9]\d*$/;
            var textBox;
            textBox = $("#<%=txtFee.ClientID %>");
            if (!re.test(textBox[0].value)) {
                alert("请输入正确的收付提醒天数!");
                textBox[0].focus();
                return false;
            }

            textBox = $("#<%=txtContinueDays.ClientID %>");
            if (!re.test(textBox[0].value)) {
                alert("请输入正确的续保提醒天数!");
                textBox[0].focus();
                return false;
            }

            textBox = $("#<%=txtPtFollow.ClientID %>");
            if (!re.test(textBox[0].value)) {
                alert("请输入正确的客户跟进提醒天数!");
                textBox[0].focus();
                return false;
            }

            textBox = $("#<%=txtBirthDays.ClientID %>");
            if (!re.test(textBox[0].value)) {
                alert("请输入正确的客户生日提醒天数!");
                textBox[0].focus();
                return false;
            }

            textBox = $("#<%=txtProcess.ClientID %>");
            if (!re.test(textBox[0].value)) {
                alert("请输入正确的佣金提醒天数!");
                textBox[0].focus();
                return false;
            }

            dxeSaveCallback.PerformCallback("");
        }

        function saveCallbackComplete(s, e) {
            alert(e.result);
        }    
    -->
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxcb:ASPxCallback ID="dxeSaveCallback" ClientInstanceName="dxeSaveCallback" runat="server" OnCallback="dxeSaveCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {saveCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    <table style="width: 100%">
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npAlertCustomHeader" runat="server" CssClass="collapsePanelHeader" Height="20px">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 400px; text-align: right; font-weight:bolder;">
                                服务提醒消息定制
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="npAlertCustom" runat="server" CssClass="allborderPanel">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 250px; text-align: right;">
                                收付提醒
                            </td>
                            <td style="width: 40px">&nbsp;</td>
                            <td style="width: 280px">
                                保费通知书后&nbsp;<asp:TextBox ID="txtFee" runat="server" Width="40px" Text="0" MaxLength="3"></asp:TextBox>&nbsp;天未客户收费发出通知
                            </td>
                            <td>
                                <dxe:ASPxButton ID="debtnFee" runat="server" Text="收付提醒列表..." AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {GetAlertList(s, e); return false;}" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                续保提醒
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                保单到期前&nbsp;<asp:TextBox ID="txtContinueDays" runat="server" Width="40px" Text="0" MaxLength="3"></asp:TextBox>&nbsp;天发出提醒
                            </td>
                            <td>
                                <dxe:ASPxButton ID="debtnContinueDays" runat="server" Text="续保提醒列表..." AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {GetAlertList(s, e); return false;}" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                客户跟进提醒
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                最后一次跟进后&nbsp;<asp:TextBox ID="txtPtFollow" runat="server" Width="40px" Text="0" MaxLength="3"></asp:TextBox>&nbsp;天内发出提醒
                            </td>
                            <td>
                                <dxe:ASPxButton ID="debtnPtFollow" runat="server" Text="跟进提醒列表..." AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {GetAlertList(s, e); return false;}" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                生日提醒
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                客户生日前&nbsp;<asp:TextBox ID="txtBirthDays" runat="server" Width="40px" Text="0" MaxLength="3"></asp:TextBox>&nbsp;天提醒
                            </td>
                            <td>
                                <dxe:ASPxButton ID="debtnBirthDays" runat="server" Text="生日提醒列表..." AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {GetAlertList(s, e); return false;}" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                佣金提醒
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                开票日期&nbsp;<asp:TextBox ID="txtProcess" runat="server" Width="40px" Text="0" MaxLength="3"></asp:TextBox>&nbsp;天未结算提醒
                            </td>
                            <td>
                                <dxe:ASPxButton ID="debtnProcess" runat="server" Text="佣金提醒列表..." AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {GetAlertList(s, e); return false;}" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="30px">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 400px; text-align: right;">
                                <dxe:ASPxButton runat="server" id="dxebtnBottomSave" Text="保存" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {saveAlertDays(s, e);}" />
                                </dxe:ASPxButton> 
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>