<%@ Page language="c#" Codebehind="yxqklrDesc.aspx.cs" AutoEventWireup="false" Inherits="JITE.jhpt.yxqklrDesc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>用户工程情况录入</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/ie.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="JsDate.js" type="text/javascript"></script>
		<script language="javascript" src="JsClass.js" type="text/javascript"></script>
	</HEAD>
	<body style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-REPEAT: repeat-x" bgColor="#f4f4f4"
		leftMargin="0" topMargin="0" rightMargin="0" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table height="24" cellSpacing="0" cellPadding="0" width="95%" border="0">
				<tr>
					<td bgColor="#e3e3e3">当前位置：<A class="blue" href="#"><u>营销情况录入</u></A></td>
					<td style="PADDING-RIGHT: 20px" align="right" bgColor="#e3e3e3"><asp:label id="LbUserNameTop" runat="server"></asp:label>，您好！欢迎使用工程部综合计划及沟通平台，今天是
						<script language="javascript">getCurDate();</script>
					</td>
				</tr>
			</table>
			<br>
			<table cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td style="PADDING-LEFT: 40px; HEIGHT: 52px">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td class="black" style="PADDING-LEFT: 5px">营销信息录入</td>
								<td style="PADDING-RIGHT: 5px" align="right"><IMG onclick="javascipt:window.close();" height="12" src="images/table_pic_02.gif" width="13"
										border="0"></td>
							</tr>
							<tr>
								<td background="images/table_bg_07.gif" colSpan="2" height="14"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center">
						<table cellSpacing="0" cellPadding="0" width="90%" border="0">
							<tr height="27">
								<td style="HEIGHT: 28px" colSpan="3"><b>工程基本信息：</b></td>
							</tr>
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="0" width="100%" border="1">
										<tr height="20">
											<td width="20%">工程帐号：</td>
											<td><asp:label id="LbGczh" runat="server" Height="20" Width="170"></asp:label></td>
											<td width="20%">工程名称：</td>
											<td><asp:label id="LbGcmc" runat="server" Height="20" Width="170"></asp:label></td>
											<td width="20%">工程类别：</td>
											<td><asp:label id="LbGclb" runat="server" Height="20" Width="170"></asp:label></td>
										</tr>
										<tr height="20">
											<td width="20%">地址：</td>
											<td colspan="3"><asp:label id="LbDz" runat="server" Height="20" Width="170"></asp:label></td>
											<td width="20%">申请编号：</td>
											<td><asp:label id="LbSqbh" runat="server" Height="20" Width="170"></asp:label></td>
										</tr>
										<tr height="20">
											<td width="20%">工程规模：</td>
											<td colSpan="5"><asp:textbox id="TbGcgm" runat="server" Height="60px" Width="100%" TextMode="MultiLine"></asp:textbox></td>
										</tr>
										<tr height="20">
											<td width="20%">容量：</td>
											<td><asp:label id="LbRl" runat="server" Height="20" Width="170"></asp:label></td>
											<td width="20%">电压：</td>
											<td><asp:label id="LbDy" runat="server" Height="20" Width="170"></asp:label></td>
											<td width="20%"></td>
											<td></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center">
						<table cellSpacing="0" cellPadding="0" width="90%" border="0">
							<tr height="22">
								<td width="40%"><b>项目预算：</b></td>
							<tr>
								<td vAlign="top"><asp:datagrid id="dgYs" runat="server" AllowSorting="True" AutoGenerateColumns="False" BorderColor="#999999"
										BorderWidth="1px" CellPadding="0" width="100%" PageSize="8">
										<AlternatingItemStyle Height="23px" BackColor="#E3F4FC"></AlternatingItemStyle>
										<ItemStyle Height="23px" BackColor="White"></ItemStyle>
										<HeaderStyle HorizontalAlign="Center" Height="24px" CssClass=" background-image:url(../images/table_bg_06.gif)"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="rownum" HeaderText="序号">
												<HeaderStyle Width="20%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="YSLXMC" HeaderText="预算类型">
												<HeaderStyle Width="40%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="预算金额">
												<HeaderStyle Width="40%"></HeaderStyle>
												<ItemTemplate>
													<asp:TextBox id="tbYsje" runat="server" MaxLength="11" Visible="true" Text='<%# DataBinder.Eval(Container.DataItem, "ysje") %>'>
													</asp:TextBox>
													<asp:comparevalidator id="Comparevalidator4" runat="server" ErrorMessage="输入错误！" ControlToValidate="tbYsje"
														Operator="DataTypeCheck" Type="Double"></asp:comparevalidator>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn Visible="False" DataField="YSLXDM" HeaderText="营销类型代码"></asp:BoundColumn>
										</Columns>
										<PagerStyle Visible="False"></PagerStyle>
									</asp:datagrid></td>
							</tr>
							<tr height="20">
							</tr>
						</table>
					</td>
				</tr>
				<tr>
				<tr>
					<td align="center">
						<table cellSpacing="0" cellPadding="0" width="90%" border="0">
							<tr height="22">
								<td><b>工程费录入：</b></td>
							</tr>
							<tr>
								<td vAlign="top"><asp:datagrid id="dgGcf" runat="server" AutoGenerateColumns="False" BorderColor="#999999" BorderWidth="1px"
										CellPadding="0" width="100%" PageSize="8" DataKeyField="sfbh">
										<AlternatingItemStyle Height="23px" BackColor="#E3F4FC"></AlternatingItemStyle>
										<ItemStyle BackColor="White"></ItemStyle>
										<HeaderStyle HorizontalAlign="Center" Height="24px" CssClass=" background-image:url(../images/table_bg_06.gif)"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="rownum" HeaderText="序号">
												<HeaderStyle Width="5%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="FYLBMC" HeaderText="费用类型">
												<HeaderStyle Width="10%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="ysgcfy" HeaderText="应收工程费">
												<HeaderStyle Width="10%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="SSGCFY" HeaderText="实收工程费">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="FPHM" HeaderText="发票号码">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="SFRQ" HeaderText="收费日期">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="退款金额">
												<HeaderStyle Width="30%"></HeaderStyle>
												<ItemTemplate>
													<asp:TextBox id="tbtkje" runat="server" MaxLength="11" Width="100px" Visible="true" Text='<%# DataBinder.Eval(Container.DataItem, "THGCFY") %>'>
													</asp:TextBox>
													<asp:comparevalidator id="Comparevalidator3" runat="server" ErrorMessage="输入错误！" ControlToValidate="tbtkje"
														Operator="DataTypeCheck" Type="Double"></asp:comparevalidator>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn Visible="False" DataField="sfbh"></asp:BoundColumn>
										</Columns>
										<PagerStyle Visible="False"></PagerStyle>
									</asp:datagrid></td>
							</tr>
							<tr height="20">
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center">
						<table cellSpacing="0" cellPadding="0" width="90%" border="0">
							<TBODY>
								<tr height="27">
									<td colSpan="4"><b>其它情况录入：
											<asp:label id="LbYwlx" runat="server" Visible="False"></asp:label><asp:label id="LbKhlx" runat="server" Visible="False"></asp:label></b></td>
								</tr>
								<tr height="27">
									<td colSpan="4">
										<table cellSpacing="0" cellPadding="0" width="100%" border="1">
											<tr>
												<td style="HEIGHT: 21px" width="15%">架构：</td>
												<td style="HEIGHT: 21px" width="30%"><asp:dropdownlist id="Ddl_gj" runat="server">
														<asp:ListItem Value="Y">是</asp:ListItem>
														<asp:ListItem Value="N">否</asp:ListItem>
													</asp:dropdownlist><asp:checkbox id="CbKgz" runat="server" Text="有开关站"></asp:checkbox></td>
												<td style="HEIGHT: 21px" width="15%">投资计划：</td>
												<td style="HEIGHT: 21px" width="40%"><FONT face="宋体"><asp:textbox id="TbTzjh" runat="server" MaxLength="10"></asp:textbox></FONT></td>
											</tr>
											<tr>
												<td style="HEIGHT: 27px">项目类型：</td>
												<td style="HEIGHT: 27px"><asp:dropdownlist id="ddl_Xmlx" runat="server"></asp:dropdownlist></td>
												<td style="HEIGHT: 27px">集购金额：</td>
												<td style="HEIGHT: 25px"><FONT face="宋体"><asp:textbox id="Tbjgje" runat="server" MaxLength="11"></asp:textbox><asp:comparevalidator id="CompareValidator2" runat="server" ErrorMessage="输入错误！" ControlToValidate="Tbjgje"
															Operator="DataTypeCheck" Type="Double"></asp:comparevalidator></FONT></td>
											</tr>
											<TR>
												<td>是否到图：</td>
												<td><asp:dropdownlist id="Ddl_sfdt" runat="server">
														<asp:ListItem Value="Y">是</asp:ListItem>
														<asp:ListItem Value="N">否</asp:ListItem>
													</asp:dropdownlist></td>
												<td>到图日期：</td>
												<td><asp:textbox id="tbDtrq" runat="server" Width="96px" AutoPostBack="True"></asp:textbox><IMG id="IMG1" onclick="fload(tbDtrq)" alt="" src="images/body_pic_03.jpg" runat="server">
													<asp:checkbox id="CbJl" runat="server" Text="有掘路"></asp:checkbox>
													<asp:Button id="BtComputer" runat="server" Text="计算" CssClass="input_2"></asp:Button></td>
											</TR>
											<TR>
												<td style="HEIGHT: 30px">施工合同日期：</td>
												<td style="HEIGHT: 30px"><asp:textbox id="tbSghtrq" runat="server" Width="104px" ReadOnly="True"></asp:textbox><IMG onclick="fload(tbSghtrq)" alt="" src="images/body_pic_03.jpg"></td>
												<td>期限合同日期：</td>
												<td><asp:textbox id="tbQxhtrq" runat="server" Width="96px" ReadOnly="True"></asp:textbox><IMG onclick="fload(tbQxhtrq)" alt="" src="images/body_pic_03.jpg">
												</td>
											</TR>
											<TR>
												<td style="HEIGHT: 24px"><FONT face="宋体">市东业扩(住宅)配套帐号：</FONT></td>
												<td style="HEIGHT: 24px"><asp:textbox id="TbPtzh" runat="server" MaxLength="20"></asp:textbox></td>
												<td style="HEIGHT: 24px"><FONT face="宋体">配套批复金额：</FONT></td>
												<td style="HEIGHT: 24px"><asp:textbox id="TbPfje" runat="server" MaxLength="11"></asp:textbox><asp:comparevalidator id="CompareValidator1" runat="server" ErrorMessage="输入错误！" ControlToValidate="TbPfje"
														Operator="DataTypeCheck" Type="Double"></asp:comparevalidator></td>
											<tr>
												<td style="HEIGHT: 22px">项目关闭：</td>
												<td style="HEIGHT: 22px"><asp:dropdownlist id="Ddl_xmgb" runat="server">
														<asp:ListItem Value="N" Selected="True">否</asp:ListItem>
														<asp:ListItem Value="Y">是</asp:ListItem>
													</asp:dropdownlist></td>
												<td style="HEIGHT: 22px">关闭原因：</td>
												<td style="HEIGHT: 22px"><FONT face="宋体"><asp:dropdownlist id="Ddl_gbyy" runat="server">
															<asp:ListItem Selected="True"></asp:ListItem>
															<asp:ListItem Value="A">正常</asp:ListItem>
															<asp:ListItem Value="B">项目注销</asp:ListItem>
														</asp:dropdownlist></FONT></td>
											</tr>
											<TR>
												<TD>备注：</TD>
												<td colSpan="3"><asp:textbox id="tbYxbz" runat="server" Height="60px" Width="100%" TextMode="MultiLine" MaxLength="50"></asp:textbox></td>
											</TR>
											<tr>
											</tr>
										</table>
									</td>
								</tr>
							</TBODY>
						</table>
					</td>
				</tr>
			</table>
			<table height="40" cellSpacing="0" cellPadding="0" width="70%" align="center" border="0">
				<tr align="center">
					<td style="PADDING-RIGHT: 10px" align="right"><asp:button id="BtSave" runat="server" Text="保存"></asp:button></td>
					<td style="PADDING-LEFT: 10px" align="left"><input id="btnClose" onclick="javascript:window.close();" type="button" value="关闭" name="B5"></td>
				</tr>
			</table>
			</TD></TR></TABLE></TABLE></form>
	</body>
</HTML>
