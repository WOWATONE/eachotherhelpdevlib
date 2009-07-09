<%@ Page Language="C#" AutoEventWireup="true" Theme="Aqua"  CodeBehind="login.aspx.cs" Inherits="BrokerWebApp.login" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ OutputCache Location="None" NoStore="true" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<head id="Head1" runat="server">
		<title>上海电气保险经纪有限公司业务信息管理系统-登录</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link rel="stylesheet" type="text/css" href="css/ie.css">
		<script type="text/javascript">
        
            function dxebtnloginClick(s,e) {
                //
            }

            function btnCloseClick() {
                window.close();
            }
                    
            function isEmpty(testVar) {
                if ((testVar == null) || (testVar.length == 0)) {
                    return true;
                } else {
                    return false;
                }
            }
            
            function isDecimal(str) {
                if (isEmpty(str)) {
                    return false;
                }
                else {
                    if (/[^d.]/i.test(str)) {
                        return true;
                    }
                    return false;
                }
            }   
        
        </script>
    </HEAD>
	<body MS_POSITIONING="GridLayout" background="images/body_bg_01.jpg" style="BACKGROUND-POSITION: 50% top; BACKGROUND-REPEAT: repeat-x">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体"></FONT><FONT face="宋体"></FONT><FONT face="宋体"></FONT><FONT face="宋体">
			</FONT>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<table align="center" border="0" width="780" height="460" cellspacing="0" cellpadding="0">
				<tr>
					<td background="images/body_pic_01_new.jpg" align="right" valign="bottom" style="PADDING-RIGHT:20px; PADDING-BOTTOM:20px">
						<table border="0" width="255" height="188" cellspacing="0" cellpadding="0">
							<tr>
								<td style="PADDING-LEFT:70px" class="red" colspan="2">
									<asp:Label id="lb_Msg" runat="server"></asp:Label></td>
							</tr>
							<tr>
								<td style="text-align:right;">用户名：</td>
								<td style="text-align:left;">
								    <dxe:ASPxTextBox ID="dxetxtUserID" ClientInstanceName="dxetxtUserID" runat="server"
                                    Width="150px">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                            ValidationGroup="BaseGroup">
                                            <RequiredField IsRequired="true" ErrorText="Required" />
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox>
								</td>
							</tr>
							<tr>
								<td style=" text-align:right;">密&nbsp; 码：</td>
								<td style=" text-align:left;">
								    <dxe:ASPxTextBox ID="dxetxtPassword" ClientInstanceName="dxetxtPassword" runat="server"
                                        Width="150px" Password="true">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="Required" CausesValidation="true"
                                            ValidationGroup="BaseGroup">
                                            <RequiredField IsRequired="true" ErrorText="Required" />
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox>
								</td>
							</tr>
							<tr>
								<td align="right" style="PADDING-RIGHT:25px" colspan="2">
                                    <dxe:ASPxButton runat="server" ID="dxebtnLogin" ClientInstanceName="dxebtnLogin" AutoPostBack="true" Text="登录" OnClick="dxebtnLogin_OnClick" CausesValidation="true" ValidationGroup="BaseGroup">
                                        <ClientSideEvents Click="function(s, e) {dxebtnloginClick(s,e);return false;}" />
                                    </dxe:ASPxButton>                                    
                                </td>
							</tr>
							<tr style="display:none;">
								<td align="center" colspan="2">
									<asp:CheckBox id="CbRemUser" runat="server" Text="记住我的用户名"></asp:CheckBox></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
