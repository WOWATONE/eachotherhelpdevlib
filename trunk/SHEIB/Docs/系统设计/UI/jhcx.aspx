<%@ Page language="c#" Codebehind="jhcx.aspx.cs" AutoEventWireup="false" Inherits="JITE.jhpt.jhcx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>jhcx</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/ie.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="JsClass.js" type="text/javascript"></script>
		<script language="javascript" src="JsDate.js" type="text/javascript"></script>
	</HEAD>
	<body MS_POSITIONING="GridLayout" style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-REPEAT: repeat-x"
		bgColor="#f4f4f4" leftMargin="0" topMargin="0" rightMargin="0">
		<form id="Form1" method="post" runat="server">
			<table height="24" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td bgColor="#e3e3e3">当前位置：<A class="blue" href="#"><u>工程计划</u></A></td>
					<td style="PADDING-RIGHT: 20px" align="right" bgColor="#e3e3e3"><asp:label id="LbUserNameTop" runat="server"></asp:label>，您好！欢迎使用工程部综合计划及沟通平台，今天是
						<script language="javascript">getCurDate();</script>
					</td>
				</tr>
			</table>
			<br>
			<table cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<tr>
						<td style="PADDING-LEFT: 40px">
							<table cellSpacing="0" cellPadding="0" width="95%" border="0">
								<tr>
									<td class="black" height="30"><IMG height="14" src="images/body_pic_01.gif" width="15" border="0">工程查询条件</td>
									<td align="right"><INPUT class="input_2" id="btSearch" type="button" value="查 询" name="B3" runat="server">&nbsp;</td>
								</tr>
							</table>
							<table cellSpacing="0" cellPadding="0" width="95%" border="0">
								<tr>
									<td style="BACKGROUND-POSITION: left 50%; BACKGROUND-REPEAT: no-repeat" background="images/body_bg_02.gif"
										bgColor="#01679a" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
								</tr>
							</table>
							<table cellSpacing="0" cellPadding="0" width="95%" border="0">
								<tr>
									<td width="15%">工程帐号：</td>
									<td style="HEIGHT: 25px" width="40%"><asp:textbox id="TbGczh" runat="server"></asp:textbox></td>
									<td width="15%">工程名称：</td>
									<td style="HEIGHT: 25px"><asp:textbox id="TbGcmc" runat="server" Width="328px"></asp:textbox></td>
								</tr>
								<tr style="HEIGHT: 25px">
									<td style="HEIGHT: 25px">停电线路：</td>
									<td colSpan="3" style="HEIGHT: 25px"><asp:textbox id="TbTdsl1" runat="server"></asp:textbox>&nbsp;
										<asp:textbox id="TbTdsl2" runat="server"></asp:textbox>&nbsp;
										<asp:textbox id="TbTdsl3" runat="server"></asp:textbox></td>
								</tr>
								<tr style="HEIGHT: 25px">
									<td>工程类型：</td>
									<td colSpan="3"><asp:checkbox id="CbYhxm" runat="server" Text="用户项目"></asp:checkbox>&nbsp;
										<asp:checkbox id="CbJgxm" runat="server" Text="技改项目"></asp:checkbox>&nbsp;
										<asp:checkbox id="CbJjxm" runat="server" Text="基建项目"></asp:checkbox>&nbsp;
										<asp:checkbox id="CbKgdxxm" runat="server" Text="开关大修项目"></asp:checkbox>&nbsp;
										<asp:checkbox id="CbXldxxm" runat="server" Text="线路大修项目"></asp:checkbox></td>
								</tr>
							</table>
						</td>
					</tr>
				</TBODY>
			</table>
			<table cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<tr>
						<td style="PADDING-LEFT: 40px">
							<table cellSpacing="0" cellPadding="0" width="95%" border="0">
								<tr>
									<td class="black" height="30"><IMG height="14" src="images/body_pic_01.gif" width="15" border="0">计划列表</td>
									<td align="right"><INPUT class="input_2" id="BtExcel" type="button" value="EXCEL" name="B3" runat="server">&nbsp;&nbsp;</td>
								</tr>
							</table>
							<table cellSpacing="0" cellPadding="0" width="95%" border="0">
								<tr>
									<td style="BACKGROUND-POSITION: left 50%; BACKGROUND-REPEAT: no-repeat" background="images/body_bg_02.gif"
										bgColor="#01679a" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
								</tr>
							</table>
							<table cellSpacing="0" cellPadding="0" width="95%" border="0">
								<tr>
									<td><FONT face="宋体"><asp:datagrid id="DgXmlist" runat="server" DataKeyField="id" PageSize="8" width="100%" BorderColor="#999999"
												AutoGenerateColumns="False" CellPadding="0" BorderWidth="1px">
												<AlternatingItemStyle Height="23px"></AlternatingItemStyle>
												<ItemStyle Height="23px" BackColor="White"></ItemStyle>
												<HeaderStyle HorizontalAlign="Center" Height="24px" CssClass=" background-image:url(../images/table_bg_06.gif)"></HeaderStyle>
												<Columns>
													<asp:BoundColumn Visible="False" DataField="xmzh" HeaderText="xmzh"></asp:BoundColumn>
													<asp:BoundColumn DataField="rownum" HeaderText="序号">
														<HeaderStyle Width="3%"></HeaderStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="gczh" HeaderText="工程帐号">
														<HeaderStyle Width="5%"></HeaderStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="gcmc" HeaderText="工程名称">
														<HeaderStyle Width="20%"></HeaderStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="gclxmc" HeaderText="工程类型">
														<HeaderStyle Width="8%"></HeaderStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="gczt" HeaderText="工程状态">
														<HeaderStyle Width="5%"></HeaderStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="tdslmc" HeaderText="停电线路">
														<HeaderStyle Width="10%"></HeaderStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="jhsgrq" HeaderText="计划施工日期">
														<HeaderStyle Width="5%"></HeaderStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="gcd" HeaderText="工程队">
														<HeaderStyle Width="5%"></HeaderStyle>
													</asp:BoundColumn>
													<asp:BoundColumn Visible="False" DataField="id" HeaderText="id"></asp:BoundColumn>
													<asp:TemplateColumn HeaderText="查看">
														<HeaderStyle Width="3%"></HeaderStyle>
														<ItemTemplate>
															<asp:HyperLink id="link" Target="_blank" Text="调整" Visible="true" Runat="server" Font-Underline="true" EnableViewState="true" NavigateUrl='<%# "xgjh.aspx"+"?id="+DataBinder.Eval(Container.DataItem,"id")+"&xmzh="+DataBinder.Eval(Container.DataItem,"xmzh") %>'>
															</asp:HyperLink>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:BoundColumn Visible="False" DataField="ptype" HeaderText="ptype"></asp:BoundColumn>
												</Columns>
												<PagerStyle Visible="False"></PagerStyle>
											</asp:datagrid></FONT></td>
								</tr>
							</table>
						</td>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>
