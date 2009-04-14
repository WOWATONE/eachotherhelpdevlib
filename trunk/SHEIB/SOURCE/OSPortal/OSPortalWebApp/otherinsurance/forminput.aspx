<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="forminput.aspx.cs" Inherits="OSPortalWebApp.otherinsurance.forminput" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta content="zh-CN" http-equiv="Content-Language" />
    <script src="../js/jquery-1.3.2.js" type="text/javascript"></script>
	<script src="../js/jquerynotice/jquery.notice.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../js/jquerynotice/jquery.notice.css" />
	<script type="text/javascript">
	    $(document).ready(function() {
	        jQuery.noticeAdd({
	            text: 'This is a notification that you have to remove',
	            stay: true
	        });
	    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%">
        <tr>
            <td style="width:100%;">
                <dxrp:ASPxRoundPanel EnableViewState="False" HeaderText="������������" ID="rpbasic" EnableDefaultAppearance="False" Width="100%" runat="server" BackColor="#F8FAFD" ShowHeader="true"  HorizontalAlign="Center">
                     <PanelCollection>
                         <dxrp:PanelContent ID="PanelContent2" runat="server">
                            <table style="width:100%">
                                <tr>
                                    <td style="width:8%;text-align:right;">������ţ�</td>
                                    <td style="width:25%;text-align:left;"><asp:TextBox ID="txtSN" runat="server" Width="200px"></asp:TextBox></td>
                                    <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkReinsurance" runat="server" /></td>
                                    <td style="width:25%;text-align:left;"><asp:Button ID="btnReinsurance" runat="server" Text="�ٱ���" /> </td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:23%;text-align:left;"></td>
                                </tr>
                                <tr>
                                    <td style="width:8%;text-align:right;">Ͷ���ˣ�</td>
                                    <td style="width:25%;text-align:left;"><asp:TextBox ID="txtpeoplefrom" runat="server" Width="154px" Text="����"></asp:TextBox>&nbsp;&nbsp;<asp:Button ID="btnpeoplesearch" runat="server" Text="����" /></td>
                                    <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkTogether" runat="server" /></td>
                                    <td style="width:25%;text-align:left;"><asp:Button ID="btnTogether" runat="server" Text="��  ��" /> </td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:23%;text-align:left;"></td>
                                </tr>
                                <tr>
                                    <td style="width:8%;text-align:right;">�������ˣ�</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:DropDownList ID="ddlpeopleto" runat="server">
                                            <asp:ListItem Text="����" Value="1" Selected></asp:ListItem>
                                            <asp:ListItem Text="����" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="����" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                    </td>
                                    <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkStage" runat="server" /></td>
                                    <td style="width:25%;text-align:left;"><asp:Button ID="btnStage" runat="server" Text="��  ��" /> </td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:23%;text-align:left;"></td>
                                </tr>
                                <tr>
                                    <td style="width:8%;text-align:right;">���չ�˾��</td>
                                    <td style="width:25%;text-align:left;">
                                    <asp:DropDownList ID="ddlCompany" runat="server">
                                        <asp:ListItem Text="ƽ������" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="���ٱ���" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="̩������" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    </td>
                                    <td style="width:8%;text-align:right;">��֧������</td>
                                    <td style="width:25%;text-align:left;">
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="ƽ��1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="ƽ��2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="ƽ��3" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    </td>
                                    <td style="width:8%;text-align:right;">ҵ��Ա��</td>
                                    <td style="width:23%;text-align:left;">
                                        <asp:TextBox ID="txtagent" runat="server" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:8%;text-align:right;">�������֣�</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:DropDownList ID="ddlCategory" runat="server">
                                        <asp:ListItem Text="����1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="����2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="����3" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    </td>
                                    <td style="width:8%;text-align:right;">�������ޣ�</td>
                                    <td style="width:56%;text-align:left;" colspan=3>
                                        <asp:TextBox ID="dtfrom" runat="server" Width="100px"></asp:TextBox>&nbsp;��&nbsp;<asp:TextBox ID="dtto" runat="server" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>

                            </table>
                            
                          </dxrp:PanelContent>
                     </PanelCollection>
                 </dxrp:ASPxRoundPanel>
            </td>
        </tr>
        <tr>
            <td style="width:100%;">
                <dxrp:ASPxRoundPanel EnableViewState="False" HeaderText="������Ŀ" ID="rpinsuranceitem" EnableDefaultAppearance="False" Width="100%" runat="server" BackColor="#F8FAFD" ShowHeader="true"  HorizontalAlign="Center">
                     <PanelCollection>
                         <dxrp:PanelContent ID="PanelContent1" runat="server">
                            <table style="width:100%">
                                <tr>
                                    <td style="width:8%;text-align:right;">������</td>
                                    
                                </tr> 
                            </table>
                            
                          </dxrp:PanelContent>
                     </PanelCollection>
                 </dxrp:ASPxRoundPanel>
            </td>
        </tr>
        <tr>
            <td style="width:100%;">
                <dxrp:ASPxRoundPanel EnableViewState="False" HeaderText="������Ŀ" ID="rpother" EnableDefaultAppearance="False" Width="100%" runat="server" BackColor="#F8FAFD" ShowHeader="true"  HorizontalAlign="Center">
                     <PanelCollection>
                         <dxrp:PanelContent ID="PanelContent3" runat="server">
                            <table style="width:100%">
                                <tr>
                                    <td style="width:8%;text-align:right;">������</td>                                    
                                </tr> 
                            </table>
                            
                          </dxrp:PanelContent>
                     </PanelCollection>
                 </dxrp:ASPxRoundPanel>
            </td>
        </tr>
    </table>
</asp:Content>
