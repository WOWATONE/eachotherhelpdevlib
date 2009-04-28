<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="Customer.aspx.cs" Inherits="OSPortalWebApp.CustomerRelation.Customer" Title="" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="customerDetailTabPage" ClientInstanceName="customerDetailTabPage" runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%">
        <TabPages>
            <dxtc:TabPage Name="CustInfo" Text="客户资料">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width:99%">
                            <tr>
                                <td style="width:100%;">
                                    <table style="width:100%">
                                        <tr>
                                            <td style="width:15%;text-align:right;">
                                                </td>
                                            <td style="width:35%;text-align:left;">
                                                <asp:RadioButton ID="radPerson"
                                    runat="server" Checked="True" Text="个人" GroupName="PersonOrUnit" />&nbsp;&nbsp;<asp:RadioButton ID="radUnit" runat="server" Text="单位" GroupName="PersonOrUnit" /></td>
                                            <td style="width:15%;text-align:right;">
                                                &nbsp;</td>
                                            <td style="width:35%;text-align:left;">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width:15%;text-align:right;">
                                                客户编号：</td>
                                            <td style="width:35%;text-align:left;">
                                                <asp:TextBox ID="txtCustNo" runat="server" Width="200px"></asp:TextBox></td>
                                            <td style="width:15%;text-align:right;">
                                                所在地区：</td>
                                            <td style="width:35%;text-align:left;">
                                                <asp:DropDownList ID="ddlArea" runat="server" Width="200px">
                                                    <asp:ListItem Text="北京市" Value="1" Selected ></asp:ListItem>
                                                    <asp:ListItem Text="上海市" Value="2"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:15%;text-align:right;">
                                                客户名称：</td>
                                            <td style="width:35%;text-align:left;">
                                                <asp:TextBox ID="txtCustName" runat="server" Width="200px"></asp:TextBox></td>
                                            <td style="width:15%;text-align:right;">
                                                地址：</td>
                                            <td style="width:35%;text-align:left;">
                                                <asp:TextBox ID="txtAddress" runat="server" Width="200px"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td style="width:15%;text-align:right;">
                                                客户分类：</td>
                                            <td style="width:35%;text-align:left;">
                                                <asp:DropDownList ID="ddlGrade" runat="server" Width="200px">
                                                    <asp:ListItem Text="A－签约大客户" Value="1" Selected ></asp:ListItem>
                                                    <asp:ListItem Text="B--未签约客户" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="C－潜在意向客户" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width:15%;text-align:right;">
                                                邮政编码：</td>
                                            <td style="width:35%;text-align:left;">
                                                <asp:TextBox ID="txtPostCode" runat="server" Width="200px"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td style="width:15%;text-align:right;">
                                               所属行业：</td>
                                            <td style="width:35%;text-align:left;">
                                                <asp:DropDownList ID="ddlTradeType" runat="server" Width="200px">
                                                    <asp:ListItem Text="政府机关" Value="1" Selected ></asp:ListItem>
                                                    <asp:ListItem Text="其他" Value="2"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width:15%;text-align:right;">
                                                组织机构代码号<br/>/身份证号码：</td>
                                            <td style="width:35%;text-align:left;">
                                                <asp:TextBox ID="txtIDNO" runat="server" Width="200px"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td style="width:15%;text-align:right;">
                                                第一联系人姓名：</td>
                                            <td style="width:35%;text-align:left;">
                                                <asp:TextBox ID="txtContact" runat="server" Width="200px"></asp:TextBox></td>
                                            <td style="width:15%;text-align:right;">
                                                &nbsp;</td>
                                            <td style="width:35%;text-align:left;">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width:15%;text-align:right;">
                                                第一联系人电话：</td>
                                            <td style="width:35%;text-align:left;">
                                                <asp:TextBox ID="txtTel" runat="server" Width="200px"></asp:TextBox></td>
                                            <td style="width:15%;text-align:right;">
                                                部门：</td>
                                            <td style="width:35%;text-align:left;">
                                                <asp:DropDownList ID="ddlDepartment" runat="server" Width="200px">
                                                    <asp:ListItem Text="客户服务部" Value="1" Selected ></asp:ListItem>
                                                    <asp:ListItem Text="特殊风险部" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="财险部" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:15%;text-align:right;">
                                               第一联系人手机：</td>
                                            <td style="width:35%;text-align:left;">
                                                <asp:TextBox ID="txtMobile" runat="server" Width="200px"></asp:TextBox></td>
                                            <td style="width:15%;text-align:right;">
                                                客户经理：</td>
                                            <td style="width:35%;text-align:left;">
                                                <asp:DropDownList ID="ddlCusomerManager" runat="server" Width="200px">
                                                    <asp:ListItem Text="张三" Value="1" Selected ></asp:ListItem>
                                                    <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="AddiInfo" Text="附加资料">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="CustAlert" Text="特别提醒">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="CustContact" Text="联系人">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="PtFollow" Text="销售跟进">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="NotifyClaim" Text="理赔记录">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="SignPremium" Text="签单记录">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
        </TabPages>
    </dxtc:ASPxPageControl>
    <br />
    <table style="width:99%">
        <tr>
            <td style="width:65%;">
            </td>
            <td style="width:35%;">
                <asp:Button ID="btnSave" runat="server" Text="保存修改" CssClass="input_6"/>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btlClose" runat="server" Text="关    闭" CssClass="input_6"/>
            </td>
        </tr>
    </table>
</asp:Content>
