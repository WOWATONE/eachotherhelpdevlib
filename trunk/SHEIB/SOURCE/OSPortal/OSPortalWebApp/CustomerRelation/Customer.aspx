<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="Customer.aspx.cs" Inherits="OSPortalWebApp.CustomerRelation.Customer" Title="" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v8.3" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta content="zh-CN" http-equiv="Content-Language" />
    <link rel="stylesheet" type="text/css" href="../css/ie.css" />
    <script src="../js/jquery-1.3.2.js" type="text/javascript"></script>
	<script src="../js/jquerynotice/jquery.notice.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/jquery-ui-1.7.1.custom.min.js"></script>
    <script type="text/javascript" src="../js/ui.datepicker-zh-CN.js"></script>
    <link type="text/css" href="../js/css/smoothness/jquery-ui-1.7.1.custom.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="../js/jquerynotice/jquery.notice.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
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
                            <td style="width:33%;text-align:left;" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkperson" runat="server" />
                                个人<asp:CheckBox ID="chkunit" runat="server" />单位</td>
                            <td style="width:8%;text-align:right;"></td>
                            <td style="width:25%;text-align:left;"></td>
                            <td style="width:8%;text-align:right;"></td>
                            <td style="width:26%;text-align:left;"></td>
                        </tr>
                        <tr>
                            <td style="width:8%;text-align:right;">客户编号：</td>
                            <td style="width:25%;text-align:left;"><asp:TextBox ID="txtCustNo" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:8%;text-align:right;">所在地区：</td>
                            <td style="width:25%;text-align:left;">
                                <asp:DropDownList ID="ddlArea" runat="server" Width="200px">
                                    <asp:ListItem Text="北京市" Value="1" Selected ></asp:ListItem>
                                    <asp:ListItem Text="上海市" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width:8%;text-align:right;">客户地址：</td>
                            <td style="width:26%;text-align:left;"><asp:TextBox ID="txtAddress" runat="server" Width="200px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width:8%;text-align:right;">客户名称：</td>
                            <td style="width:25%;text-align:left;"><asp:TextBox ID="txtCustName" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:8%;text-align:right;">行业类型：</td>
                            <td style="width:25%;text-align:left;">
                                <asp:DropDownList ID="ddlTradeType" runat="server" Width="200px">
                                    <asp:ListItem Text="政府机关" Value="1" Selected ></asp:ListItem>
                                    <asp:ListItem Text="其他" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width:8%;text-align:right;">所属板块：</td>
                            <td style="width:26%;text-align:left;">
                                <asp:DropDownList ID="ddlPlate" runat="server" Width="200px">
                                    <asp:ListItem Text="石油化工" Value="1" Selected ></asp:ListItem>
                                    <asp:ListItem Text="其他" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:8%;text-align:right;">组织机构代码号/身份证号码：</td>
                            <td style="width:25%;text-align:left;"><asp:TextBox ID="txtIDNO" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:8%;text-align:right;"></td>
                            <td style="width:25%;text-align:left;"></td>
                            <td style="width:34%;text-align:right;" colspan="2"></td>
                        </tr>
                        <tr>
                            <td style="width:8%;text-align:right;">客户经理：</td>
                            <td style="width:25%;text-align:left;">
                                 <asp:DropDownList ID="ddlCusomerManager" runat="server" Width="200px">
                                    <asp:ListItem Text="张三" Value="1" Selected ></asp:ListItem>
                                    <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width:25%;text-align:right;" colspan="4">
                                <asp:Button ID="btnSearch" runat="server" Text="查     询" CssClass="input_6"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnUserDefined" runat="server" Text="自定义查询" CssClass="input_6" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnReset" runat="server" Text="重     置" CssClass="input_6" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="npcustomerdetail" runat="server" CssClass="collapsePanel">
                
                    <table style="width:100%"> 
                        <tr>
                            <td>                              
                                        
                                <dxwgv:ASPxGridView ID="gridCustomerItem" ClientInstanceName="gridPolicyItem" runat="server" 
                                    KeyFieldName="ID" Width="100%" AutoGenerateColumns="False" >
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="客户编号" FieldName="CustNo" 
                                            VisibleIndex="0">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="客户名称" FieldName="CustName" 
                                            VisibleIndex="1">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="所在地区" FieldName="Area" VisibleIndex="2">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="所属板块" FieldName="Plate" VisibleIndex="3">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="客户地址" FieldName="Address" 
                                            VisibleIndex="4">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="邮政编码" FieldName="PostCode" 
                                            VisibleIndex="5">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="行业类型" FieldName="TradeType" 
                                            VisibleIndex="6">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="代码/号码" FieldName="IDNO" VisibleIndex="7">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="第一联系人" FieldName="Contact" 
                                            VisibleIndex="8">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="电话" FieldName="Tel" VisibleIndex="9">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="手机" FieldName="Mobile" VisibleIndex="10">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="传真" FieldName="Fax" VisibleIndex="11">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="电子邮件" FieldName="Email" 
                                            VisibleIndex="12">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="客户经理" FieldName="CusomerManager" 
                                            VisibleIndex="13">
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
