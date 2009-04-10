<%@ Page language="c#" Codebehind="gcxmlr.aspx.cs" AutoEventWireup="false" Inherits="JITE.jhpt.gcxmlr" enableViewState="True"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>gcxmlr</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/ie.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="JsClass.js" type="text/javascript"></script>
	</HEAD>
	<body style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-REPEAT: repeat-x" bgColor="#f4f4f4"
		leftMargin="0" background="images/body_bg_04.gif" topMargin="0" rightMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table height="24" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td bgColor="#e3e3e3">当前位置：
						<asp:Label id="LbGnmc" runat="server"></asp:Label></td>
					<td style="PADDING-RIGHT: 20px" align="right" bgColor="#e3e3e3">
						<asp:label id="LbUserNameTop" runat="server"></asp:label>，您好！欢迎使用工程部综合计划及沟通平台，今天是<script language="javascript">getCurDate();</script></td>
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
									<td align="right"><input class="input_2" id="BtSearch" type="button" value="查 询" name="B3" runat="server">&nbsp;</td>
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
									<td>工程规模：</td>
									<td colSpan="3"><asp:textbox id="TbGcgm" runat="server" Width="100%"></asp:textbox></td>
								</tr>
								<tr style="HEIGHT: 25px">
									<td>停电线路：</td>
									<td colSpan="3"><asp:textbox id="TbTdsl1" runat="server"></asp:textbox>&nbsp;
										<asp:textbox id="TbTdsl2" runat="server"></asp:textbox>&nbsp;
										<asp:textbox id="TbTdsl3" runat="server"></asp:textbox></td>
								</tr>
								<tr style="HEIGHT: 25px">
									<td>工程类型：</td>
									<td colSpan="3"><asp:CheckBoxList id="CblGclx" runat="server" RepeatColumns="6" RepeatDirection="Horizontal"></asp:CheckBoxList></td>
								</tr>
							</table>
						</td>
					</tr>
				</TBODY>
			</table>
			<br>
			<table cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<tr>
						<td style="PADDING-LEFT: 40px">
							<table cellSpacing="0" cellPadding="0" width="95%" border="0">
								<tr>
									<td class="black" height="30"><IMG height="14" src="images/body_pic_01.gif" width="15" border="0">项目列表</td>
									<td align="right">
										<table border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td><img border="0" src="images/input_bg_05.gif" width="8" height="18"></td>
												<td><input type="button" value="导入EXCEL表" name="B3" class="input_9" id="impExcel" runat="server"></td>
												<td><img border="0" src="images/input_bg_04.gif" width="8" height="18"></td>
												<td>&nbsp;&nbsp; <INPUT class="input_2" id="Button1" type="button" value="新 增" runat="server">&nbsp;&nbsp;
													<input class="input_3" id="btDel" type="button" value="删 除" name="B4" runat="server"></td>
											</tr>
										</table>
									</td>
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
									<td><asp:datagrid id="DgXmlist" runat="server" AutoGenerateColumns="False" BorderColor="#999999" BorderWidth="1px"
											CellPadding="0" AllowPaging="True" width="100%" DataKeyField="id">
											<AlternatingItemStyle Height="23px" BackColor="#E3F4FC"></AlternatingItemStyle>
											<ItemStyle Height="23px" BackColor="White"></ItemStyle>
											<HeaderStyle HorizontalAlign="Center" Height="24px" CssClass=" background-image:url(../images/table_bg_06.gif)"></HeaderStyle>
											<Columns>
												<asp:BoundColumn Visible="False" DataField="id" HeaderText="id"></asp:BoundColumn>
												<asp:TemplateColumn HeaderText="选择">
													<HeaderStyle Width="5%"></HeaderStyle>
													<ItemTemplate>
														<asp:CheckBox id="ChooseXm" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="gczh" HeaderText="工程帐号">
													<HeaderStyle Width="20%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="gcmc" HeaderText="工程名称">
													<HeaderStyle Width="35%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="tdrq" HeaderText="录入时间">
													<HeaderStyle Width="15%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="gclxmc" HeaderText="工程类型">
													<HeaderStyle Width="10%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="操作">
													<HeaderStyle Width="5%"></HeaderStyle>
													<ItemTemplate>
														<asp:HyperLink id="hLink" runat="server" Target="_blank">修改</asp:HyperLink>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
											<PagerStyle Visible="False"></PagerStyle>
										</asp:datagrid></td>
								</tr>
							</table>
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr height="25">
									<td style="PADDING-LEFT: 50px">共
										<asp:Label id="lbRecordCount" runat="server"></asp:Label>条记录 第
										<asp:Label id="lbCurPage" runat="server"></asp:Label>页/共
										<asp:Label id="lbSumPage" runat="server"></asp:Label>页</td>
									<td style="PADDING-RIGHT: 50px" align="right">
										<asp:LinkButton id="lkbFirst" runat="server">首页</asp:LinkButton>
										|
										<asp:LinkButton id="lkbPrevious" runat="server">上一页</asp:LinkButton>
										<asp:LinkButton id="lkbNext" runat="server">下一页</asp:LinkButton>
										|
										<asp:LinkButton id="lkbLast" runat="server">尾页</asp:LinkButton>
										到第 <input class="input_5" type="text" size="20" name="T1" id="tbInputPage" runat="server">
										页 <input class="input_4" id="BtJump" type="button" value="跳 转" name="B3" runat="server"></td>
								</tr>
							</table>
						</td>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>
