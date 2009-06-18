<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="Carrier.aspx.cs" Inherits="OSPortalWebApp.ProductSetup.Carrier" Title="" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保险公司详细资料</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="carrierInfoTabPage" 
        ClientInstanceName="carrierInfoTabPage" runat="server" 
        EnableHierarchyRecreation="True" Width="100%" ActiveTabIndex="0">
        <TabPages>
            <dxtc:TabPage Name="BasicInfo" Text="基本资料">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        
                        <table style="width:80%">
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    保险公司编号：</td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtCarrierNo" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:20%; text-align:right;">
                                    公司简称：</td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtShortName" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:10%; text-align:left;"></td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    公司名称(中文)：</td>
                                <td style="text-align:left;" colspan="3">
                                    <asp:TextBox ID="txtCarrierNameCn" runat="server" Width="100%"></asp:TextBox></td>
                                <td style="width:10%; text-align:left;">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    公司名称(英文)：</td>
                                <td style="text-align:left;" colspan="3">
                                    <asp:TextBox ID="txtCarrierNameEn" runat="server" Width="100%"></asp:TextBox></td>
                                <td style="width:10%; text-align:left;">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    业务类型：</td>
                                <td style="text-align:left;" colspan="3">
                                    <asp:DropDownList ID="ddlInsType" runat="server" Width="120px">
                                        <asp:ListItem Text="综合" Value="1" Selected ></asp:ListItem>
                                        <asp:ListItem Text="寿险" Value="2"></asp:ListItem>
                                    </asp:DropDownList>&nbsp;
                                    行政级别：<asp:DropDownList ID="ddlGrdType" runat="server" Width="120px">
                                        <asp:ListItem Text="总公司" Value="1" Selected ></asp:ListItem>
                                        <asp:ListItem Text="分公司" Value="2"></asp:ListItem>
                                    </asp:DropDownList>&nbsp;
                                    所在省：<asp:DropDownList ID="ddlProvince" runat="server" Width="120px">
                                        <asp:ListItem Text="北京市" Value="1" Selected ></asp:ListItem>
                                        <asp:ListItem Text="上海市" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width:10%; text-align:left;">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    地址：</td>
                                <td style="text-align:left;" colspan="3">
                                    <asp:TextBox ID="txtAddress" runat="server" Width="100%"></asp:TextBox></td>
                                <td style="width:10%; text-align:left;">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    电话：</td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtTelephone" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:20%; text-align:right;">
                                    邮编：</td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtPostcode" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:10%; text-align:left;"></td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    传真：</td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtFax" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:20%; text-align:right;">
                                    联系人：</td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtContact" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:10%; text-align:left;"></td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    电子邮箱：</td>
                                <td style="text-align:left;" colspan="3">
                                    <asp:TextBox ID="txtEmail" runat="server" Width="100%"></asp:TextBox></td>
                                <td style="width:10%; text-align:left;">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    公司网址：</td>
                                <td style="text-align:left;" colspan="3">
                                    <asp:TextBox ID="txtURL" runat="server" Width="100%"></asp:TextBox></td>
                                <td style="width:10%; text-align:left;">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    保险编号串：</td>
                                <td style="width:20%; text-align:left;">
                                    <asp:TextBox ID="txtPolicyNoHeader" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:20%; text-align:right;">
                                    </td>
                                <td style="width:20%; text-align:left;">
                                    </td>
                                <td style="width:10%; text-align:left;"></td>
                            </tr>
                        </table>
                        
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="AdditionalInfo" Text="附加资料">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width:80%">
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    开户银行：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="TextBox1" runat="server" Width="100%"></asp:TextBox></td>
                                <td style="width:10%; text-align:left;">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    银行账号：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="txtBankAccount" runat="server" Width="100%"></asp:TextBox></td>
                                <td style="width:10%; text-align:left;">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    盈利水平：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="txtPayoffLevel" runat="server" Width="80px"></asp:TextBox>&nbsp;
                                    赔付率：<asp:TextBox ID="txtLossRation" runat="server" Width="80px"></asp:TextBox>&nbsp;
                                    保费规模：<asp:TextBox ID="txtPremiumSize" runat="server" Width="80px"></asp:TextBox>
                                </td>
                                <td style="width:10%; text-align:left;">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    公司简介：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="txtProfile" runat="server" TextMode="MultiLine" 
                                        style="width:100%;" Rows="8"></asp:TextBox>
                                </td>
                                <td style="width:10%; text-align:left;">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width:10%; text-align:right;"></td>
                                <td style="width:20%; text-align:right;">
                                    备注：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" 
                                        style="width:100%;" Rows="4"></asp:TextBox>
                                </td>
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
