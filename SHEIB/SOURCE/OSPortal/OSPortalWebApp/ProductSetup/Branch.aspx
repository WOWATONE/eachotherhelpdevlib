<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="Branch.aspx.cs" Inherits="OSPortalWebApp.ProductSetup.Branch" Title="" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保险公司分支机构</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="BranchTabPage" 
        ClientInstanceName="BranchTabPage" runat="server" 
        EnableHierarchyRecreation="True" Width="100%" ActiveTabIndex="0">
        <TabPages>
            <dxtc:TabPage Name="Branch" Text="分支机构">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width:80%">
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    所属保险公司：</td>
                                <td style="width:20%; text-align:left;">
                                    <asp:DropDownList ID="ddlCarrier" runat="server" Width="200px">
                                        <asp:ListItem Text="中国人保" Value="1" Selected></asp:ListItem>
                                        <asp:ListItem Text="中国平安" Value="2"></asp:ListItem>
                                    </asp:DropDownList></td>
                                <td style="width:20%; text-align:right;">
                                    所在省：</td>
                                <td style="width:20%; text-align:left;">
                                    <asp:DropDownList ID="ddlProvince" runat="server" Width="120px">
                                        <asp:ListItem Text="北京市" Value="1" Selected ></asp:ListItem>
                                        <asp:ListItem Text="上海市" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width:10%; text-align:left;"></td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    分支机构简称：
                                 </td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtShortName" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:20%; text-align:right;">
                                    编号：</td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtBranchNo" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width:10%; text-align:left;"></td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    分支机构全称：
                                 </td>
                                <td style="text-align:left;" colspan="3">
                                   <asp:TextBox ID="txtBranchName" runat="server" Width="100%"></asp:TextBox></td>
                                <td style="width:10%; text-align:left;">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    详细地址：
                                 </td>
                                <td style="text-align:left;" colspan="3">
                                    <asp:TextBox ID="txtAddress" runat="server" Width="100%"></asp:TextBox></td>
                                <td style="width:10%; text-align:left;">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    联系人：
                                 </td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtContact" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:20%; text-align:right;">
                                    邮编：</td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtPostCode" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width:10%; text-align:left;"></td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    联系电话：
                                 </td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtTelephone" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:20%; text-align:right;">
                                    传真：</td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtFax" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width:10%; text-align:left;"></td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    电子邮箱：
                                 </td>
                                <td style="text-align:left;" colspan="3">
                                    <asp:TextBox ID="txtEMail" runat="server" Width="100%"></asp:TextBox></td>
                                <td style="width:10%; text-align:left;">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    经纪费率：
                                 </td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtProcessRate" runat="server" Width="100%"></asp:TextBox></td>
                                <td style="width:20%; text-align:right;">
                                    佣金比例：</td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtCommrate" runat="server" Width="100%"></asp:TextBox>
                                </td>
                                <td style="width:10%; text-align:left;"></td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    备注：
                                 </td>
                                <td style="text-align:left;" colspan="3">
                                    <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" 
                                        style="width:100%;" Rows="4"></asp:TextBox></td>
                                <td style="width:10%; text-align:left;">
                                    </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
        </TabPages>
    </dxtc:ASPxPageControl>
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="25px">
        <table style="width:100%">
            <tr>
                <td style="text-align:right;">
                    <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="input_2" />
                </td>  
                <td style="width:30%;text-align:left;">
                    &nbsp;
                </td>                                                                  
            </tr>
        </table>     
    </asp:Panel>
</asp:Content>
