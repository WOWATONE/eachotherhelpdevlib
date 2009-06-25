﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="ProductType.aspx.cs" Inherits="BrokerWebApp.schemasetting.ProductType" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <script type="text/javascript">
        function btnCloseClick() {
            window.close();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="ProductTabPage" 
        ClientInstanceName="ProductTabPage" runat="server" 
        EnableHierarchyRecreation="True" Width="100%" ActiveTabIndex="0">
        <TabPages>
            <dxtc:TabPage Name="AddProduct" Text="增加险种">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl1" runat="server">
                        <div style=" text-align:center;">
                            
                            <table style="width:100%;">
                                <tr>
                                    <td style="width:20%;">
                                        </td>
                                    <td style="width:20%; text-align:right;">
                                       上级险种：</td>
                                    <td style="width:40%; text-align:left;">
                                        <dxe:ASPxTextBox ID="dxetxtParent" ClientInstanceName="dxetxtParent" runat="server" Width="200px" Enabled="false"></dxe:ASPxTextBox></td>
                                    <td style="width:20%; text-align:right;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                       &nbsp;</td>
                                    <td style="text-align:right;">
                                       险种编号：</td>
                                    <td style="text-align:left;">
                                        <dxe:ASPxTextBox ID="dxetxtProdTypeID" ClientInstanceName="dxetxtProdTypeID" runat="server" Width="200px">
                                            <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										        <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox></td>
                                    <td style="text-align:right;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                       &nbsp;</td>
                                    <td style="text-align:right;">
                                       险种名称：</td>
                                    <td style="text-align:left;">
                                        <dxe:ASPxTextBox ID="dxetxtProdTypeName" ClientInstanceName="dxetxtProdTypeName" runat="server" Width="200px">
                                            <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										        <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox></td>
                                    <td style="text-align:right;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:20%;">
                                       &nbsp;</td>
                                    <td style="text-align:right;">
                                       险种大类：</td>
                                    <td style="text-align:left;">
                                        <dxe:ASPxComboBox ID="dxeddlProdClass" ClientInstanceName="dxeddlProdClass" runat="server" Width="200px" DropDownStyle="DropDownList">
                                            <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										        <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                            </ValidationSettings>
                                        </dxe:ASPxComboBox></td>
                                    <td style="text-align:right;">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            
                        </div>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="BasicInfor" Text="资本资料">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl2" runat="server">
                        <table style="width:100%">
                            <tr>
                                <td style="width:30%; text-align:right;">
                                    所属险种：</td>
                                <td style="width:40%; text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtProdType" ClientInstanceName="dxetxtProdType" runat="server" Width="200px" Enabled="false"></dxe:ASPxTextBox></td>
                                <td style="width:30%;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    项目编号：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtProdID" ClientInstanceName="dxetxtProdID" runat="server" Width="200px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
									        <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    项目名称：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtProdName" ClientInstanceName="dxetxtProdName" runat="server" Width="200px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
									        <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    保费费率：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtPremiumRate" ClientInstanceName="dxetxtPremiumRate" runat="server" Width="200px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
									        <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    经纪费率：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtProcRate" ClientInstanceName="dxetxtProcRate" runat="server" Width="200px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
									        <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    是否为主险种：</td>
                                <td style="text-align:left;">
                                    <input type="checkbox" id="chkFlagMain" name="chkFlagMain" runat="server" /></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    备注：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" 
                                        style="width:100%;" Rows="8"></asp:TextBox></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="InsuranceTerms" Text="保险条款">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl3" runat="server">
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
    <table style="height: 5px; background-color: #E0EDFF; width: 100%; font-size: 2px;">
        <tr>
            <td>
            </td>
        </tr>
    </table>
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="30px">
        <table style="width: 100%">
            <tr>
                <td style="width: 400px; text-align: left;">
                    &nbsp;
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnBottomSave" Text="保存" 
                        CausesValidation="true" AutoPostBack="false" onclick="dxebtnBottomSave_Click">
                    </dxe:ASPxButton> 
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnClose" Text="关闭" CausesValidation="false" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnCloseClick();}" />
                    </dxe:ASPxButton>
                </td>                
            </tr>
        </table>
    </asp:Panel>
</asp:Content>