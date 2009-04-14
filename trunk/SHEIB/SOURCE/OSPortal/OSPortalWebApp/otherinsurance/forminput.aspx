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
                <dxrp:ASPxRoundPanel EnableViewState="False" HeaderText="保单基本数据" ID="rpGrayPanel" EnableDefaultAppearance="False" Width="100%" runat="server" BackColor="#F8FAFD" ShowHeader="true"  HorizontalAlign="Center">
                     <PanelCollection>
                         <dxrp:PanelContent ID="PanelContent2" runat="server">
                            <table style="width:100%">
                                <tr>
                                    <td style="width:8%;text-align:right;">保单编号：</td>
                                    <td style="width:25%;text-align:left;"><asp:TextBox ID="txtSN" runat="server" Width="200px"></asp:TextBox></td>
                                    <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkReinsurance" runat="server" /></td>
                                    <td style="width:25%;text-align:left;"><asp:Button ID="btnReinsurance" runat="server" Text="再保险" /> </td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:23%;text-align:left;"></td>
                                </tr>
                                <tr>
                                    <td style="width:8%;text-align:right;">投保人：</td>
                                    <td style="width:25%;text-align:left;"><asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox></td>
                                    <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkTogether" runat="server" /></td>
                                    <td style="width:25%;text-align:left;"><asp:Button ID="btnTogether" runat="server" Text="共  保" /> </td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:23%;text-align:left;"></td>
                                </tr>
                                <tr>
                                    <td style="width:8%;text-align:right;">被保险人：</td>
                                    <td style="width:25%;text-align:left;"><asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox></td>
                                    <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkStage" runat="server" /></td>
                                    <td style="width:25%;text-align:left;"><asp:Button ID="btnStage" runat="server" Text="分  期" /> </td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:23%;text-align:left;"></td>
                                </tr>
                                <tr>
                                    <td style="width:8%;text-align:right;">保险公司：</td>
                                    <td style="width:25%;text-align:left;"><asp:TextBox ID="TextBox3" runat="server" Width="100px"></asp:TextBox></td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:25%;text-align:left;"></td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:23%;text-align:left;"></td>
                                </tr>
                                <tr>
                                    <td style="width:8%;text-align:right;">保险险种：</td>
                                    <td style="width:25%;text-align:left;"><asp:TextBox ID="TextBox4" runat="server" Width="100px"></asp:TextBox></td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:25%;text-align:left;"></td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:23%;text-align:left;"></td>
                                </tr>

                            </table>
                            
                          </dxrp:PanelContent>
                     </PanelCollection>
                 </dxrp:ASPxRoundPanel>
            </td>
        </tr>
    </table>
</asp:Content>
