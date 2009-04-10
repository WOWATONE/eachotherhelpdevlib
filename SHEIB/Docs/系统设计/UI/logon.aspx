<%@ Page language="c#" Codebehind="logon.aspx.cs" AutoEventWireup="false" Inherits="JITE.jhpt.logon" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>工程部综合计划及沟通平台-登录</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link rel="stylesheet" type="text/css" href="css/ie.css">
	</HEAD>
	<body MS_POSITIONING="GridLayout" background="images/body_bg_01.jpg" style="BACKGROUND-POSITION: 50% top; BACKGROUND-REPEAT: repeat-x">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体"></FONT><FONT face="宋体"></FONT><FONT face="宋体"></FONT><FONT face="宋体">
			</FONT>
			<br>
			<br>
			<br>
			<table align="center" border="0" width="780" height="460" cellspacing="0" cellpadding="0">
				<tr>
					<td background="images/body_pic_01.jpg" align="right" valign="bottom" style="PADDING-RIGHT:20px; PADDING-BOTTOM:20px">
						<table border="0" width="255" height="188" cellspacing="0" cellpadding="0">
							<tr>
								<td style="PADDING-LEFT:70px" class="red">
									<asp:Label id="lb_Msg" runat="server"></asp:Label></td>
							</tr>
							<tr>
								<td align="center">用户名：<input type="text" name="TbName" size="20" class="input" id="TbName" runat="server"></td>
							</tr>
							<tr>
								<td align="center">密&nbsp; 码：<input type="password" name="TbPsw" size="20" class="input" id="TbPsw" runat="server"></td>
							</tr>
							<tr>
								<td align="right" style="PADDING-RIGHT:25px"><input type="submit" value="登 录" name="BtLogin" class="input_1" id="btLogin" runat="server"></td>
							</tr>
							<tr>
								<td align="center">
									<asp:CheckBox id="CbRemUser" runat="server" Text="记住我的用户名"></asp:CheckBox></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
