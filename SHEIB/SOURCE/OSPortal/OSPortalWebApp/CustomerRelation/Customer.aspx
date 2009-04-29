﻿<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="Customer.aspx.cs" Inherits="OSPortalWebApp.CustomerRelation.Customer" Title="" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v8.3" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v8.3" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel"
    TagPrefix="dxrp" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPanel" tagprefix="dxp" %>
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
    <dxtc:ASPxPageControl ID="customerDetailTabPage" 
        ClientInstanceName="customerDetailTabPage" runat="server" ActiveTabIndex="0" 
        EnableHierarchyRecreation="True" Width="100%">
        <TabPages>
            <dxtc:TabPage Name="CustInfo" Text="客户资料">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
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
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="AddiInfo" Text="附加资料">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width:100%">
                            <tr>
                                <td style="width:15%;text-align:right;">
                                    主要业务：</td>
                                <td style="width:35%;text-align:left;">
                                    <asp:TextBox ID="txtMainOper" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:15%;text-align:right;">
                                    </td>
                                <td rowspan="3" style="width:35%;text-align:left;">
                                    <asp:TextBox ID="txtBackground" runat="server" TextMode="MultiLine" 
                                    style="width:300px" Rows="6"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width:15%;text-align:right;">
                                    资产规模：</td>
                                <td style="width:35%;text-align:left;">
                                    <asp:TextBox ID="txtAssetSize" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:15%;text-align:right;">
                                    背景资料：</td>
                            </tr>
                            <tr>
                                <td style="width:15%;text-align:right;">
                                    主要产品：</td>
                                <td style="width:35%;text-align:left;">
                                    <asp:TextBox ID="txtMainProduct" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:15%;text-align:right;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width:15%;text-align:right;">
                                    风险资料：</td>
                                <td style="width:35%;text-align:left;">
                                    <asp:TextBox ID="txtRisk" runat="server" TextMode="MultiLine" 
                                    style="width:300px" Rows="6"></asp:TextBox></td>
                                <td style="width:15%;text-align:right;">
                                    其他信息：</td>
                                <td style="width:35%;text-align:left;">
                                    <asp:TextBox ID="txtOtherInfo" runat="server" TextMode="MultiLine" 
                                    style="width:300px" Rows="6"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width:15%;text-align:right;">
                                    备注：</td>
                                <td style="width:35%;text-align:left;">
                                    <asp:TextBox ID="txtRemark" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:15%;text-align:right;">
                                    &nbsp;</td>
                                <td style="width:35%;text-align:left;">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="CustAlert" Text="特别提醒">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <div style="width:99%; text-align:center;">
                            <table style="width:80%;">
                                <tr>
                                    <td style="width:65%;text-align:left;">
                                        提醒列表：</td>
                                    <td style="width:35%;text-align:left;">
                                        提醒间隔：</td>
                                </tr>
                                <tr>
                                    <td style="width:70%;text-align:center; vertical-align:top;">
                                        <dxwgv:ASPxGridView ID="gridAlertList" ClientInstanceName="gridAlertList" runat="server" 
                                            KeyFieldName="ID" Width="100%" AutoGenerateColumns="False">
                                            <Columns>
                                                <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="ID" 
                                                    VisibleIndex="0" Visible="False">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="设置人" FieldName="SetSales" 
                                                    VisibleIndex="0">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="接收人" FieldName="ReceiveSales" 
                                                    VisibleIndex="1">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="提醒间隔" FieldName="AlertPeriodMode" 
                                                    VisibleIndex="2">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="开始提醒时间" FieldName="AlertDateTime" 
                                                    VisibleIndex="3">
                                                </dxwgv:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                        </dxwgv:ASPxGridView>
                                    </td>
                                    <td style="width:30%;text-align:center;">
                                        <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" Height="100%" View="GroupBox" ShowHeader="False">
                                            <PanelCollection>
                                                <dxp:PanelContent runat="server">
                                                    <table style="width:100%; height:100%;">
                                                        <tr>
                                                            <td style="width:50%; text-align:left;">
                                                                <asp:TextBox ID="txtAlertPeriod" runat="server" Width="120px"></asp:TextBox></td>
                                                            <td>
                                                                <asp:DropDownList ID="ddlAlertMode" runat="server" Width="120px">
                                                                    <asp:ListItem Text="小时" Value="1" Selected ></asp:ListItem>
                                                                    <asp:ListItem Text="天" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="月" Value="3"></asp:ListItem>
                                                                    <asp:ListItem Text="年" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Text="只提醒一次" Value="5"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:50%; text-align:left;">
                                                                开始时间：</td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="text-align:left;">
                                                                <dxe:ASPxDateEdit ID="deAlertDateTime" runat="server" EditFormat="Custom" 
                                                                    EditFormatString="yyyy-MM-dd HH:mm:ss">
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="text-align:left;">
                                                                部门：<asp:TextBox ID="txtDepartment" runat="server" Width="150px"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="text-align:left;">
                                                                姓名：<asp:TextBox ID="txtName" runat="server" Width="100px"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="查找" CssClass="input_2" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:50%; text-align:center;">
                                                                <asp:Button ID="btlDeleteAlert" runat="server" Text="删除" CssClass="input_2" /></td>
                                                            <td style="width:50%; text-align:center;">
                                                                <asp:Button ID="btnAddAlert" runat="server" Text="添加" CssClass="input_2" /></td>
                                                        </tr>
                                                    </table>
                                                </dxp:PanelContent>
                                            </PanelCollection>
                                        </dxrp:ASPxRoundPanel>       
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:70%;text-align:left;">
                                        提醒内容：</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtAlertContent" runat="server" TextMode="MultiLine" 
                                    style="width:100%" Rows="6"></asp:TextBox></td>
                                </tr>
                            </table>
                        </div>
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
