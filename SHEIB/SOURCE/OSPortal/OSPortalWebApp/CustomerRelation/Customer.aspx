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
                                <asp:Button ID="btnadd" runat="server" CssClass="input_2" Text="���" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btndelete" runat="server" Text="ɾ��" CssClass="input_2" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnprint" runat="server" Text="��ӡ" CssClass="input_2" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnexport" runat="server" CssClass="input_2" Text="����" />
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
                                ����<asp:CheckBox ID="chkunit" runat="server" />��λ</td>
                            <td style="width:8%;text-align:right;"></td>
                            <td style="width:25%;text-align:left;"></td>
                            <td style="width:8%;text-align:right;"></td>
                            <td style="width:26%;text-align:left;"></td>
                        </tr>
                        <tr>
                            <td style="width:8%;text-align:right;">�ͻ���ţ�</td>
                            <td style="width:25%;text-align:left;"><asp:TextBox ID="txtCustNo" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:8%;text-align:right;">���ڵ�����</td>
                            <td style="width:25%;text-align:left;">
                                <asp:DropDownList ID="ddlArea" runat="server" Width="200px">
                                    <asp:ListItem Text="������" Value="1" Selected ></asp:ListItem>
                                    <asp:ListItem Text="�Ϻ���" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width:8%;text-align:right;">�ͻ���ַ��</td>
                            <td style="width:26%;text-align:left;"><asp:TextBox ID="txtAddress" runat="server" Width="200px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width:8%;text-align:right;">�ͻ����ƣ�</td>
                            <td style="width:25%;text-align:left;"><asp:TextBox ID="txtCustName" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:8%;text-align:right;">��ҵ���ͣ�</td>
                            <td style="width:25%;text-align:left;">
                                <asp:DropDownList ID="ddlTradeType" runat="server" Width="200px">
                                    <asp:ListItem Text="��������" Value="1" Selected ></asp:ListItem>
                                    <asp:ListItem Text="����" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width:8%;text-align:right;">������飺</td>
                            <td style="width:26%;text-align:left;">
                                <asp:DropDownList ID="ddlPlate" runat="server" Width="200px">
                                    <asp:ListItem Text="ʯ�ͻ���" Value="1" Selected ></asp:ListItem>
                                    <asp:ListItem Text="����" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:8%;text-align:right;">��֯���������/���֤���룺</td>
                            <td style="width:25%;text-align:left;"><asp:TextBox ID="txtIDNO" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:8%;text-align:right;"></td>
                            <td style="width:25%;text-align:left;"></td>
                            <td style="width:34%;text-align:right;" colspan="2"></td>
                        </tr>
                        <tr>
                            <td style="width:8%;text-align:right;">�ͻ�����</td>
                            <td style="width:25%;text-align:left;">
                                 <asp:DropDownList ID="ddlCusomerManager" runat="server" Width="200px">
                                    <asp:ListItem Text="����" Value="1" Selected ></asp:ListItem>
                                    <asp:ListItem Text="����" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width:25%;text-align:right;" colspan="4">
                                <asp:Button ID="btnSearch" runat="server" Text="��     ѯ" CssClass="input_6"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnUserDefined" runat="server" Text="�Զ����ѯ" CssClass="input_6" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnReset" runat="server" Text="��     ��" CssClass="input_6" />
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
                                        <dxwgv:GridViewDataTextColumn Caption="�ͻ����" FieldName="CustNo" 
                                            VisibleIndex="0">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="�ͻ�����" FieldName="CustName" 
                                            VisibleIndex="1">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="���ڵ���" FieldName="Area" VisibleIndex="2">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="�������" FieldName="Plate" VisibleIndex="3">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="�ͻ���ַ" FieldName="Address" 
                                            VisibleIndex="4">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="��������" FieldName="PostCode" 
                                            VisibleIndex="5">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="��ҵ����" FieldName="TradeType" 
                                            VisibleIndex="6">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="����/����" FieldName="IDNO" VisibleIndex="7">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="��һ��ϵ��" FieldName="Contact" 
                                            VisibleIndex="8">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="�绰" FieldName="Tel" VisibleIndex="9">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="�ֻ�" FieldName="Mobile" VisibleIndex="10">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="����" FieldName="Fax" VisibleIndex="11">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="�����ʼ�" FieldName="Email" 
                                            VisibleIndex="12">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="�ͻ�����" FieldName="CusomerManager" 
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
