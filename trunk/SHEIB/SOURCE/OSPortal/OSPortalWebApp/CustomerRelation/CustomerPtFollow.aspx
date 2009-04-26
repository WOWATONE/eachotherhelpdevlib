<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="CustomerPtFollow.aspx.cs" Inherits="OSPortalWebApp.CustomerRelation.CustomerPtFollow" Title="" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v8.3" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server"/>
    <table style="width:99%">
        <tr>
            <td style="width:100%;">
                <asp:Panel ID="npoperation" runat="server" CssClass="allborderPanel" Height="25px"> 
                    <table style="width:100%">
                        <tr>
                            <td style="text-align:left;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnadd" runat="server" CssClass="input_2" Text="添加" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btndelete" runat="server" Text="删除" CssClass="input_2" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnprint" runat="server" Text="打印" CssClass="input_2" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnexport" runat="server" CssClass="input_2" Text="导出" />
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
                            <td style="width:8%;text-align:right;">客户名称：</td>
                            <td style="width:30%;text-align:left;"><asp:TextBox ID="txtCustName" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:8%;text-align:right;">跟进内容：</td>
                            <td rowspan="3" style="width:54%;text-align:left;">
                                <asp:TextBox ID="txtFollowMemo" runat="server" TextMode="MultiLine" 
                                    style="width:100%;" Rows="8"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width:8%;text-align:right;">跟进日期：</td>
                            <td style="width:30%;text-align:left;">
                                <dxe:ASPxDateEdit ID="deStartFollowDate" runat="server" Width="100px"></dxe:ASPxDateEdit>&nbsp;至<dxe:ASPxDateEdit ID="deEndFollowDate" runat="server" Width="100px"></dxe:ASPxDateEdit>
                            </td>
                            <td style="width:8%;text-align:right;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width:8%;text-align:right;">跟进类型：</td>
                            <td style="width:30%;text-align:left;">
                                <asp:DropDownList ID="ddlFollowType" runat="server" Width="200px">
                                    <asp:ListItem Text="面谈" Value="1" Selected ></asp:ListItem>
                                    <asp:ListItem Text="电话" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width:8%;text-align:right;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width:8%;text-align:right;">客户经理</td>
                            <td style="width:30%;text-align:left;">
                                <asp:DropDownList ID="ddlCusomerManager" runat="server" Width="200px">
                                    <asp:ListItem Text="张三" Value="1" Selected ></asp:ListItem>
                                    <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                             </td>
                            <td style="width:62%;text-align:right;" colspan="2">
                                <asp:Button ID="btnSearch" runat="server" Text="查     询" CssClass="input_6"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnUserDefined" runat="server" Text="自定义查询" CssClass="input_6" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnReset" runat="server" Text="重     置" CssClass="input_6" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="npfollowdetail" runat="server" CssClass="collapsePanel">
                    <table style="width:100%"> 
                        <tr>
                            <td> 
                                <dxwgv:ASPxGridView ID="gridCustomerItem" ClientInstanceName="gridCustomerItem" runat="server"
                                KeyFieldName="FollowID" Width="100%" AutoGenerateColumns="False" >
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="跟进日期" FieldName="FollowDate" 
                                            VisibleIndex="0">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="客户名称" FieldName="CustName" 
                                            VisibleIndex="1">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="跟进类型" FieldName="FollowType" 
                                            VisibleIndex="2">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="客户经理" FieldName="CustomerManager" 
                                            VisibleIndex="3">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="跟进内容" FieldName="FollowMemo" 
                                            VisibleIndex="4" Width="50%">
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsPager Mode="ShowAllRecords"/>
                                    <Settings ShowGroupPanel="false" />
                                </dxwgv:ASPxGridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                
            </td>
        </tr>
    </table>
</asp:Content>
