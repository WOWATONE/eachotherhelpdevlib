<%@ Page language="c#" Codebehind="dyxmxxlr.aspx.cs" AutoEventWireup="false" Inherits="JITE.jhpt.dyxmxxlr" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>gcqklr</title>
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
					<td bgColor="#e3e3e3">��ǰλ�ã�<A class="blue" href="#"><u>�������¼��</u></A></td>
					<td style="PADDING-RIGHT: 20px" align="right" bgColor="#e3e3e3"><asp:label id="LbUserNameTop" runat="server"></asp:label>�����ã���ӭʹ�ù��̲��ۺϼƻ�����ͨƽ̨��������
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
									<td class="black" height="30"><IMG height="14" src="images/body_pic_01.gif" width="15" border="0">���̲�ѯ����</td>
									<td align="right"><INPUT class="input_2" id="btSearch" type="button" value="�� ѯ" name="B3" runat="server">&nbsp;</td>
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
									<td width="15%">�����ʺţ�</td>
									<td style="HEIGHT: 25px" width="40%"><asp:textbox id="TbGczh" runat="server"></asp:textbox></td>
									<td width="15%">�������ƣ�</td>
									<td style="HEIGHT: 25px"><asp:textbox id="TbGcmc" runat="server" Width="328px"></asp:textbox></td>
								</tr>
								<tr style="HEIGHT: 25px">
									<td>�������ͣ�</td>
									<td colSpan="3">
										<asp:CheckBoxList id="CblGclx" runat="server" RepeatDirection="Horizontal" RepeatColumns="6"></asp:CheckBoxList></td>
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
									<td class="black" height="30"><IMG height="14" src="images/body_pic_01.gif" width="15" border="0">�����б�</td>
									<td align="right">&nbsp;&nbsp;</td>
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
									<td><asp:datagrid id="DgXmlist" runat="server" width="100%" AllowPaging="True" CellPadding="0" BorderWidth="1px"
											BorderColor="#999999" AutoGenerateColumns="False">
											<AlternatingItemStyle Height="23px" BackColor="#E3F4FC"></AlternatingItemStyle>
											<ItemStyle Height="23px" BackColor="White"></ItemStyle>
											<HeaderStyle HorizontalAlign="Center" Height="24px" CssClass=" background-image:url(../images/table_bg_06.gif)"></HeaderStyle>
											<Columns>
												<asp:BoundColumn DataField="rownum" HeaderText="���">
													<HeaderStyle Width="5%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="gczh" HeaderText="�����ʺ�">
													<HeaderStyle Width="10%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="gcmc" HeaderText="��������">
													<HeaderStyle Width="25%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="gclxmc" HeaderText="��������">
													<HeaderStyle Width="10%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="����">
													<HeaderStyle Width="5%"></HeaderStyle>
													<ItemTemplate>
														<asp:HyperLink id=HyperLink1 runat="server" Target=_blank NavigateUrl='<%# "dyxmqklrDesc.aspx?id="+DataBinder.Eval(Container.DataItem,"id")+"&gclx="+ DataBinder.Eval(Container.DataItem,"ptype") %>'>¼����Ϣ</asp:HyperLink>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn Visible="False" DataField="id" HeaderText="id"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="ptype"></asp:BoundColumn>
											</Columns>
											<PagerStyle Visible="False"></PagerStyle>
										</asp:datagrid></td>
								</tr>
							</table>
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr height="25">
									<td style="PADDING-LEFT: 50px">��
										<asp:label id="lbRecordCount" runat="server"></asp:label>����¼ ��
										<asp:label id="lbCurPage" runat="server"></asp:label>ҳ/��
										<asp:label id="lbSumPage" runat="server"></asp:label>ҳ</td>
									<td style="PADDING-RIGHT: 50px" align="right"><asp:linkbutton id="lkbFirst" runat="server">��ҳ</asp:linkbutton>|
										<asp:linkbutton id="lkbPrevious" runat="server">��һҳ</asp:linkbutton><asp:linkbutton id="lkbNext" runat="server">��һҳ</asp:linkbutton>|
										<asp:linkbutton id="lkbLast" runat="server">βҳ</asp:linkbutton>���� <input class="input_5" id="tbInputPage" type="text" size="20" name="T1" runat="server">
										ҳ <input class="input_4" id="BtJump" type="button" value="�� ת" name="B3" runat="server"></td>
								</tr>
							</table>
						</td>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>
