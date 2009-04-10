<%@ Page language="c#" Codebehind="left.aspx.cs" AutoEventWireup="false" inherits="JITE.jhpt.left" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>left</title><LINK href="css/ie.css" type="text/css" rel="stylesheet">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<BODY bgColor="#f1f0f0">
		<form id="Form1" method="post" runat="server">
			<asp:Repeater id="RpList" runat="server">
				<HeaderTemplate>
					<table cellSpacing="0" cellPadding="0" width="171" border="0">
						<tr>
							<td style="BACKGROUND-POSITION: 50% bottom; PADDING-LEFT: 5px; BACKGROUND-REPEAT: no-repeat"
								background="images/left_bg_01.gif" height="23"><A class="red" href="logon.aspx" target="_parent"><u>ÍË³öÏµÍ³</u></A>
							</td>
						</tr>
				</HeaderTemplate>
				<ItemTemplate>
					<tr>
						<td style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-REPEAT: no-repeat" align="center"
							background="images/left_bg_02.gif" height="70">
							<table height="63" cellSpacing="0" cellPadding="0" width="80" border="0">
								<tr>
									<td class="bgout" onmouseover="this.className='bgon';" onmouseout="this.className='bgout';"
										align="center">
										<a href='<%# DataBinder.Eval(Container.DataItem, "ymid")+"?gndm="+DataBinder.Eval(Container.DataItem, "gndm")  %>' target="mainFrame"><IMG height="40" src='<%# DataBinder.Eval(Container.DataItem, "image") %>' width="40" border="0"><br>
											<%# DataBinder.Eval(Container.DataItem, "gnjc") %>
										</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</ItemTemplate>
				<FooterTemplate>
					</table>
				</FooterTemplate>
			</asp:Repeater>
		</form>
	</BODY>
</HTML>
