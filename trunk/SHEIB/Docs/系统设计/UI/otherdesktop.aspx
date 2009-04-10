<%@ Page language="c#" Codebehind="otherdesktop.aspx.cs" AutoEventWireup="false" Inherits="JITE.jhpt.otherdesktop" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>otherdesktop</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="css/ie.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="JsClass.js" type="text/javascript"></script>
	</HEAD>
	<body MS_POSITIONING="GridLayout" style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-REPEAT: repeat-x"
		bgColor="#f4f4f4" leftMargin="0" background="images/body_bg_04.gif" topMargin="0"
		rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table height="24" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td bgColor="#e3e3e3">当前位置： 个人桌面</td>
					<td style="PADDING-RIGHT: 20px" align="right" bgColor="#e3e3e3"><asp:label id="LbUserNameTop" runat="server"></asp:label>，您好！欢迎使用工程部综合计划及沟通平台，今天是
						<script language="javascript">getCurDate();</script>
					</td>
				</tr>
			</table>
			<table cellSpacing="0" cellPadding="0" width="100%" border="0" height="90%">
				<tr>
					<td style="BACKGROUND-POSITION: left top; PADDING-LEFT: 25px; BACKGROUND-REPEAT: no-repeat"
						background="images/body_pic_04.jpg">
					<td style="BACKGROUND-POSITION: left 50%; BACKGROUND-REPEAT: repeat-y" vAlign="top"
						align="center" width="279" background="images/body_bg_03.gif">
						<table cellSpacing="0" cellPadding="0" width="192" border="0">
							<tr>
								<td><IMG height="28" src="images/table_pic_01.gif" width="98" border="0"></td>
							</tr>
							<tr>
								<td background="images/table_bg_01.gif" height="4"></td>
							</tr>
							<tr>
								<td style="PADDING-TOP: 10px" vAlign="top" align="center" background="images/table_bg_03.gif">
									<table cellSpacing="0" cellPadding="0" width="150" border="0">
										<tr>
											<td align="right" width="40%" height="25">用户名：</td>
											<td vAlign="top" align="left" width="60%"><asp:label id="LbUserName" runat="server"></asp:label></td>
										</tr>
										<tr>
											<td vAlign="top" align="right" height="25">角色：
											</td>
											<td vAlign="top" align="left"><asp:label id="LbJsmc" runat="server"></asp:label></td>
										</tr>
										<tr>
											<td vAlign="top" align="right" height="50">单位：
											</td>
											<td vAlign="top" align="left"><asp:label id="LbGddw" runat="server"></asp:label></td>
										</tr>
										<tr>
											<td align="right" background="images/table_bg_04.gif" colSpan="2" height="30"><A href="#"><u>修改密码</u></A></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td background="images/table_bg_02.gif" height="4"></td>
							</tr>
						</table>
						<br>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
