<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="Target.aspx.cs" Inherits="OSPortalWebApp.ProductSetup.Target" Title="" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>增加标的</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%">
        <tr style="height:50px;">
            <td style="width:30%; text-align:right;">
            </td>
            <td style="width:70%; text-align:left;">
            </td>
        </tr>
        <tr>
            <td style="width:30%; text-align:right;">
            标的种类编号：</td>
            <td style="width:70%; text-align:left;">
            <asp:TextBox ID="txtTypeNo" runat="server" Width="200px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width:30%; text-align:right;">
            标的种类名称：</td>
            <td style="width:70%; text-align:left;">
            <asp:TextBox ID="txtTypeName" runat="server" Width="200px"></asp:TextBox></td>
        </tr>
        <tr style="height:20px;">
            <td style="width:30%; text-align:right;">
            </td>
            <td style="width:70%; text-align:left;">
            </td>
        </tr>
        <tr>
            <td style="width:30%; text-align:right;">
            </td>
            <td style="width:70%; text-align:left;">&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="input_2" /></td>
        </tr>
    </table>
</asp:Content>
