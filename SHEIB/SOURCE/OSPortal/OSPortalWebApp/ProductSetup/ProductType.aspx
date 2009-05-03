<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="ProductType.aspx.cs" Inherits="OSPortalWebApp.ProductSetup.ProductType" Title="" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>增加险种</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="ProductTabPage" 
        ClientInstanceName="ProductTabPage" runat="server" 
        EnableHierarchyRecreation="True" Width="100%" ActiveTabIndex="0">
        <TabPages>
            <dxtc:TabPage Name="AddProduct" Text="增加险种">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <div style=" text-align:center;">
                            
                            <table style="width:100%;">
                                <tr>
                                    <td style="width:20%;">
                                        </td>
                                    <td style="width:20%; text-align:right;">
                                       上级险种：</td>
                                    <td style="width:30%; text-align:left;">
                                        <asp:TextBox ID="txtParentProduct" runat="server" Width="200px"></asp:TextBox></td>
                                    <td style="width:30%; text-align:right;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:20%;">
                                        </td>
                                    <td style="width:20%; text-align:right;">
                                       险种编号：</td>
                                    <td style="width:30%; text-align:left;">
                                        <asp:TextBox ID="txtProdTypeNo" runat="server" Width="200px"></asp:TextBox></td>
                                    <td style="width:30%; text-align:right;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:20%;">
                                        </td>
                                    <td style="width:20%; text-align:right;">
                                       险种名称：</td>
                                    <td style="width:30%; text-align:left;">
                                        <asp:TextBox ID="txtProdTypeName" runat="server" Width="200px"></asp:TextBox></td>
                                    <td style="width:30%; text-align:right;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:20%;">
                                        </td>
                                    <td style="width:20%; text-align:right;">
                                       险种大类：</td>
                                    <td style="width:30%; text-align:left;">
                                        <asp:DropDownList ID="ddlProdClass" runat="server" Width="200px">
                                        <asp:ListItem Text="机动车辆险" Value="1" Selected ></asp:ListItem>
                                        <asp:ListItem Text="信用保险" Value="2"></asp:ListItem>
                                    </asp:DropDownList></td>
                                    <td style="width:30%; text-align:right;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:20%;">
                                        </td>
                                    <td style="width:20%; text-align:right;">
                                       标的类别：</td>
                                    <td style="width:30%; text-align:left;">
                                        <asp:DropDownList ID="ddlTargetType" runat="server" Width="200px">
                                        <asp:ListItem Text="车险类" Value="1" Selected ></asp:ListItem>
                                        <asp:ListItem Text="货物险类" Value="2"></asp:ListItem>
                                    </asp:DropDownList></td>
                                    <td style="width:30%; text-align:right;">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            
                        </div>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="BasicInfor" Text="资本资料">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width:100%">
                            <tr>
                                <td style="width:30%; text-align:right;">
                                    所属险种：</td>
                                <td style="width:40%; text-align:left;">
                                    <asp:TextBox ID="txtProdType" runat="server" Width="100%"></asp:TextBox></td>
                                <td style="width:30%;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width:30%; text-align:right;">
                                    项目编号：</td>
                                <td style="width:40%; text-align:left;">
                                    <asp:TextBox ID="txtProdNo" runat="server" Width="100%"></asp:TextBox></td>
                                <td style="width:30%;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width:30%; text-align:right;">
                                    项目名称：</td>
                                <td style="width:40%; text-align:left;">
                                    <asp:TextBox ID="txtProdName" runat="server" Width="100%"></asp:TextBox></td>
                                <td style="width:30%;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width:30%; text-align:right;">
                                    保费费率：</td>
                                <td style="text-align:left;" colspan="2">
                                    <asp:TextBox ID="txtPremiumRate" runat="server" Width="100px"></asp:TextBox>&nbsp;
                                    经纪费率：<asp:TextBox ID="txtProcRate" runat="server" Width="100px"></asp:TextBox>&nbsp;
                                    业务员佣金比例：<asp:TextBox ID="txtCommRate" runat="server" Width="100px"></asp:TextBox>&nbsp;
                                    <asp:CheckBox ID="chkFlagMain" runat="server" Text="是否为主险种" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width:30%; text-align:right;">
                                    备注：</td>
                                <td style="width:40%; text-align:left;">
                                    <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" 
                                        style="width:100%;" Rows="8"></asp:TextBox></td>
                                <td style="width:30%;">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="InsuranceTerms" Text="保险条款">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width:100%">
                            <tr>
                                <td style="width:30%; text-align:right; vertical-align:top;">
                                    保险条款：</td>
                                <td style="width:40%; text-align:left;">
                                    <asp:TextBox ID="txtBrief" runat="server" TextMode="MultiLine" 
                                        style="width:100%;" Rows="20"></asp:TextBox></td>
                                <td style="width:30%;">
                                    &nbsp;</td>
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
