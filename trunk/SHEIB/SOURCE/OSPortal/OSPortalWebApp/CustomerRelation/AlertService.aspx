<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="AlertService.aspx.cs" Inherits="OSPortalWebApp.CustomerRelation.AlertService" Title="" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v8.3" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width:99%">
        <tr>
            <td style="width:100%;">
                <asp:Panel ID="npalertcontent" runat="server" CssClass="allborderPanel"> 
                    <table style="width:100%">
                        <tr>
                            <td style="width:20%;text-align:right; vertical-align:top;">提醒类型：</td>
                            <td style="text-align:left;vertical-align:top;" colspan="5">
                                <asp:ListBox ID="lbAlertType" runat="server" Width="250px">
                                    <asp:ListItem Text="续保提醒" Value="1" Selected ></asp:ListItem>
                                    <asp:ListItem Text="客户收费提醒" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="生日祝福" Value="3"></asp:ListItem>
                                </asp:ListBox>
                            </td>                                                       
                        </tr>
                        <tr>
                            <td style="width:20%;text-align:right; ">提醒条件：</td>
                            <td style="width:60px;text-align:right; ">保险止期在</td>
                            <td style="width:120px;text-align:left;"><dxe:ASPxDateEdit ID="deStartDate" runat="server"/></td>
                            <td style="width:10px;text-align:left;">至</td>
                            <td style="width:120px;text-align:left;"><dxe:ASPxDateEdit ID="deEndDate" runat="server"/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="width:20%;text-align:right; vertical-align:top;">提醒内容：</td>
                            <td style="text-align:left;vertical-align:top;" colspan="4">
                                <asp:TextBox ID="txtAlertContent" runat="server" TextMode="MultiLine" 
                                    style="width:100%;" Rows="8"></asp:TextBox>
                            </td>  
                            <td></td>  
                        </tr>
                        <tr>
                            <td style="width:20%;"></td>
                            <td style="width:60px;"></td>
                            <td style="width:120px;text-align:right;" dir="rtl"><asp:Button ID="btnCreatAlertList" runat="server" Text="生成提醒列表" CssClass="input_6"/></td>
                            <td style="width:10px;text-align:left;"></td>
                            <td style="width:120px;text-align:left;" dir="rtl"><asp:Button ID="btnCancel" runat="server" Text="取     消" CssClass="input_6"/></td>
                            <td></td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="npAlertCustomHeader" runat="server" CssClass="collapsePanelHeader" Height="15px"> 
                    <table style="width:100%">
                        <tr>
                            <td style="width:20%; text-align:right;">服务提醒消息定制</td>
                            <td></td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="npAlertCustom" runat="server" CssClass="allborderPanel">
                    <table style="width:100%">
                        <tr>
                            <td style="width:20%;" dir="rtl"><asp:CheckBox ID="chkContinue" runat="server" 
                                    Text="续保提醒" TextAlign="Left" />&nbsp;</td>
                            <td style="width:60px"></td>
                            <td style="width:250px" colspan="2">保单到期前&nbsp;<asp:TextBox ID="txtContinue" runat="server" Width="50px"></asp:TextBox>&nbsp;天提醒</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="width:20%;" dir="rtl"><asp:CheckBox ID="chkDebt" runat="server" 
                                    Text="欠费提醒" TextAlign="Left" />&nbsp;</td>
                            <td style="width:60px"></td>
                            <td style="width:250px" colspan="2">保单签订后&nbsp;<asp:TextBox ID="txtDebt" runat="server" Width="50px"></asp:TextBox>&nbsp;天未交清保费提醒</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="width:20%;" dir="rtl"><asp:CheckBox ID="chkBirthday" runat="server" 
                                    Text="生日提醒" TextAlign="Left" />&nbsp;</td>
                            <td style="width:60px"></td>
                            <td style="width:250px" colspan="2">客户生日前&nbsp;<asp:TextBox ID="txtBirthday" runat="server" Width="50px"></asp:TextBox>&nbsp;天提醒</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="width:20%;"></td>
                            <td style="width:60px"><asp:Button ID="btnRecoverAlert" runat="server" Text="恢复所有提醒" CssClass="input_6"/></td>
                            <td style="width:125px" nowrap="nowrap"><asp:Button ID="btnSaveAlert" runat="server" Text="保存提醒条件" CssClass="input_6"/></td>
                            <td style="width:125px" nowrap="nowrap"><asp:Button ID="btnCancelAlert" runat="server" Text="取消" CssClass="input_6"/></td>
                            <td></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
