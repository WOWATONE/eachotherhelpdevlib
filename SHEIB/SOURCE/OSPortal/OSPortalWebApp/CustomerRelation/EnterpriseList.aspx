<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="EnterpriseList.aspx.cs" Inherits="OSPortalWebApp.CustomerRelation.EnterpriseList" Title="" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v8.3" Namespace="DevExpress.Web.ASPxTreeList"
    TagPrefix="dxwtl" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel"
    TagPrefix="dxrp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPanel" tagprefix="dxp" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v8.3" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>企业目录</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width:100%">
        <tr>
            <td style="width:100%;">
                <asp:Panel ID="npoperation" runat="server" CssClass="allborderPanel" Height="25px"> 
                    <table style="width:100%">
                        <tr>
                            <td style="text-align:left;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnAdd" runat="server" CssClass="input_2" Text="增加目录" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnEdit" runat="server" Text="修改目录" CssClass="input_2" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnDelete" runat="server" Text="删除目录" CssClass="input_2" />
                            </td>  
                            <td style="width:20px;text-align:left;">
                                &nbsp;
                            </td>                                                                  
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="npsearch" runat="server" CssClass="allborderPanel">
                    <table style="width:100%">
                        <tr>
                            <td>
                                <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="600px" Height="500px" View="GroupBox" ShowHeader="False">
                                    <PanelCollection>
                                        <dxp:PanelContent ID="Panelcontent1" runat="server">
                                            <dxwtl:ASPxTreeList ID="treeList" ClientInstanceName="treeList" runat="server" Width="100%" SummaryText="Summary">
                                                 <Columns>
                                                     <dxwtl:TreeListTextColumn FieldName="Name">
                                                         <PropertiesTextEdit EncodeHtml="True" />
                                                     </dxwtl:TreeListTextColumn>                        
                                                 </Columns>
                                                 <Settings ShowColumnHeaders="false" />  
                                                 <SettingsBehavior AllowFocusedNode="True"/>   
                                                 <Styles>
                                                    <Indent BackColor="Transparent" />
                                                    <IndentWithButton BackColor="Transparent" />
                                                    <Node BackColor="Transparent" />
                                                    <Cell>
                                                        <Paddings PaddingLeft="1px" />
                                                    </Cell>
                                                </Styles>
                                                <Templates>
                                                    <DataCell>
                                                        <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td></td>
                                                                <td> </td>
                                                                <td style="padding-bottom: 1px;"><%# Container.Text %></td>
                                                            </tr>
                                                        </table>                            
                                                    </DataCell>
                                                </Templates>
                                                <Border BorderWidth="0" />
                                            </dxwtl:ASPxTreeList>
                                        </dxp:PanelContent>
                                    </PanelCollection>
                                </dxrp:ASPxRoundPanel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
