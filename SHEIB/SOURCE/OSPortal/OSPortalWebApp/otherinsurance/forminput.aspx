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
                <dxrp:ASPxRoundPanel EnableViewState="False" HeaderText="保单基本数据" ID="rpbasic" EnableDefaultAppearance="False" Width="100%" runat="server" BackColor="#F8FAFD" ShowHeader="true"  HorizontalAlign="Center">
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
                                    <td style="width:25%;text-align:left;"><asp:TextBox ID="txtpeoplefrom" runat="server" Width="154px" Text="张三"></asp:TextBox>&nbsp;&nbsp;<asp:Button ID="btnpeoplesearch" runat="server" Text="搜索" /></td>
                                    <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkTogether" runat="server" /></td>
                                    <td style="width:25%;text-align:left;"><asp:Button ID="btnTogether" runat="server" Text="共  保" /> </td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:23%;text-align:left;"></td>
                                </tr>
                                <tr>
                                    <td style="width:8%;text-align:right;">被保险人：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:DropDownList ID="ddlpeopleto" runat="server">
                                            <asp:ListItem Text="张三" Value="1" Selected></asp:ListItem>
                                            <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="王五" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                    </td>
                                    <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkStage" runat="server" /></td>
                                    <td style="width:25%;text-align:left;"><asp:Button ID="btnStage" runat="server" Text="分  期" /> </td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:23%;text-align:left;"></td>
                                </tr>
                                <tr>
                                    <td style="width:8%;text-align:right;">保险公司：</td>
                                    <td style="width:25%;text-align:left;">
                                    <asp:DropDownList ID="ddlCompany" runat="server">
                                        <asp:ListItem Text="平安保险" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="人寿保险" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="泰康保险" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    </td>
                                    <td style="width:8%;text-align:right;">分支机构：</td>
                                    <td style="width:25%;text-align:left;">
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="平安1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="平安2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="平安3" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    </td>
                                    <td style="width:8%;text-align:right;">业务员：</td>
                                    <td style="width:23%;text-align:left;">
                                        <asp:TextBox ID="txtagent" runat="server" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:8%;text-align:right;">保险险种：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:DropDownList ID="ddlCategory" runat="server">
                                        <asp:ListItem Text="保险1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="保险2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="保险3" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    </td>
                                    <td style="width:8%;text-align:right;">保险期限：</td>
                                    <td style="width:56%;text-align:left;" colspan=3>
                                        <asp:TextBox ID="dtfrom" runat="server" Width="100px"></asp:TextBox>&nbsp;至&nbsp;<asp:TextBox ID="dtto" runat="server" Width="100px"></asp:TextBox>
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
                <dxrp:ASPxRoundPanel EnableViewState="False" HeaderText="保险项目" ID="rpinsuranceitem" EnableDefaultAppearance="False" Width="100%" runat="server" BackColor="#F8FAFD" ShowHeader="true"  HorizontalAlign="Center">
                     <PanelCollection>
                         <dxrp:PanelContent ID="PanelContent1" runat="server">
                            <table style="width:100%">
                                <tr>
                                    <td style="width:8%;text-align:right;">保单：</td>
                                    
                                </tr> 
                            </table>
                            
                          </dxrp:PanelContent>
                     </PanelCollection>
                 </dxrp:ASPxRoundPanel>
            </td>
        </tr>
        <tr>
            <td style="width:100%;">
                <dxrp:ASPxRoundPanel EnableViewState="False" HeaderText="其它项目" ID="rpother" EnableDefaultAppearance="False" Width="100%" runat="server" BackColor="#F8FAFD" ShowHeader="true"  HorizontalAlign="Center">
                     <PanelCollection>
                         <dxrp:PanelContent ID="PanelContent3" runat="server">
                            <table style="width:100%">
                                <tr>
                                    <td style="width:8%;text-align:right;">保额：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:TextBox ID="txtprice" runat="server" Width="140px"></asp:TextBox>
                                    </td>
                                    <td style="width:8%;text-align:right;">费率：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:TextBox ID="txtrate" runat="server" Width="140px"></asp:TextBox>
                                    </td>
                                    <td style="width:8%;text-align:right;">保费（原）：</td>
                                    <td style="width:23%;text-align:left;">
                                        <asp:TextBox ID="txtoriginalfee" runat="server" Width="140px"></asp:TextBox>
                                    </td>                                  
                                </tr> 
                                <tr>
                                    <td style="width:8%;text-align:right;">币种：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:DropDownList ID="DropDownList2" runat="server">
                                            <asp:ListItem Text="人民币" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="美元" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="英镑" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width:8%;text-align:right;">换算汇率：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:TextBox ID="txtchange" runat="server" Width="140px"></asp:TextBox>
                                    </td>
                                    <td style="width:8%;text-align:right;">保费（本）：</td>
                                    <td style="width:23%;text-align:left;">
                                        <asp:TextBox ID="txtlocalfee" runat="server" Width="140px"></asp:TextBox>
                                    </td>                                  
                                </tr> 
                                <tr>
                                    <td style="width:8%;text-align:right;">经纪费率：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:TextBox ID="txtmiddlerate" runat="server" Width="140px"></asp:TextBox>
                                    </td>
                                    <td style="width:8%;text-align:right;">经纪费：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:TextBox ID="txtmiddlefee" runat="server" Width="140px"></asp:TextBox>
                                    </td>
                                    <td style="width:8%;text-align:right;">保费（本）：</td>
                                    <td style="width:23%;text-align:left;">
                                        
                                    </td>                                  
                                </tr> 
                                <tr>
                                    <td style="width:8%;text-align:right;">原件链接：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:TextBox ID="txtfile" runat="server" Width="140px"></asp:TextBox>
                                    </td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:25%;text-align:left;">
                                        
                                    </td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:23%;text-align:left;">
                                        
                                    </td>                                  
                                </tr> 
                                <tr>
                                    <td style="width:8%;text-align:right;">部门：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:DropDownList ID="ddlDeptId" runat="server">
                                            <asp:ListItem Text="部门1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="部门2" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="部门3" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width:8%;text-align:right;">客户经理：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:DropDownList ID="ddlcustomermanager" runat="server">
                                            <asp:ListItem Text="经理1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="经理2" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:23%;text-align:left;">
                                        
                                    </td>                                  
                                </tr> 
                                <tr>
                                    <td style="width:8%;text-align:right;">业务来源：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:DropDownList ID="ddlSourceTypeID" runat="server">
                                            <asp:ListItem Text="来源1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="来源2" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width:8%;text-align:right;">业务性质：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:DropDownList ID="ddlKind" runat="server">
                                            <asp:ListItem Text="业务性质1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="业务性质2" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width:8%;text-align:right;">收款方式：</td>
                                    <td style="width:23%;text-align:left;">
                                        <asp:DropDownList ID="ddlGatheringType" runat="server">
                                            <asp:ListItem Text="收款方式1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="收款方式2" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>                                  
                                </tr> 
                                <tr>
                                    <td style="width:8%;text-align:right;">录单人：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:TextBox ID="txtCreatePerson" runat="server" Width="140px"></asp:TextBox>
                                    </td>
                                    <td style="width:8%;text-align:right;">录单日期：</td>
                                    <td style="width:25%;text-align:left;">
                                        <asp:TextBox ID="txtCreateTime" runat="server" Width="140px"></asp:TextBox>
                                    </td>
                                    <td style="width:8%;text-align:right;"></td>
                                    <td style="width:23%;text-align:left;">
                                        
                                    </td>                                  
                                </tr>
                                <tr>
                                    <td style="width:100%;text-align:right;" colspan=5>
                                        <asp:Button ID="btnadd" runat="server" Text="新增" />&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnsave" runat="server" Text="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btncancel" runat="server" Text="取消" />
                                    </td>  
                                    <td style="width:20%;text-align:left;">
                                        
                                    </td>                                                                  
                                </tr>
                            </table>
                            
                          </dxrp:PanelContent>
                     </PanelCollection>
                 </dxrp:ASPxRoundPanel>
            </td>
        </tr>
    </table>
</asp:Content>
