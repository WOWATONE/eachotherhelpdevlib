<%@ Page language="c#" Codebehind="yxqklr.aspx.cs" AutoEventWireup="false" Inherits="JITE.jhpt.yxqklr" %>
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
		<script language="javascript" src="JsDate.js" type="text/javascript"></script>
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
									<td width="35"><asp:textbox id="TbGczh" runat="server"></asp:textbox></td>
									<td width="10%">�������ƣ�</td>
									<td width="35" style="HEIGHT: 25px"><asp:textbox id="TbGcmc" runat="server" Width="232px"></asp:textbox></td>
								</tr>
								<tr style="HEIGHT: 25px">
									<td style="HEIGHT: 23px">ʵ�չ��̷ѣ�</td>
									<td><asp:textbox id="tbGcf" runat="server"></asp:textbox>
										<asp:CompareValidator id="CompareValidator1" runat="server" Type="Double" Operator="DataTypeCheck" ControlToValidate="tbGcf"
											ErrorMessage="�������"></asp:CompareValidator></td>
									<td style="HEIGHT: 23px"><FONT face="����">�����ţ�</FONT></td>
									<td style="HEIGHT: 23px"><asp:TextBox id="TbCdbh" runat="server"></asp:TextBox></td>
								</tr>
								<tr style="HEIGHT: 25px">
									<td style="HEIGHT: 23px">���޺�ͬ���ڣ�</td>
									<td><asp:TextBox id="tbQxhtrq1" runat="server" ReadOnly="True" Width="88px"></asp:TextBox><IMG onclick="fload(tbQxhtrq1)" alt="" src="images/body_pic_03.jpg">&nbsp;��
										<asp:TextBox id="tbQxhtrq2" runat="server" ReadOnly="True" Width="88px"></asp:TextBox><IMG onclick="fload(tbQxhtrq2)" alt="" src="images/body_pic_03.jpg"></td>
									<td style="HEIGHT: 23px">��ͼ���ڣ�</td>
									<td style="HEIGHT: 23px">
										<asp:TextBox id="TbDtrq1" runat="server" ReadOnly="True" Width="88px"></asp:TextBox><IMG alt="" src="images/body_pic_03.jpg" onclick="fload(TbDtrq1)">
										��
										<asp:TextBox id="TbDtrq2" runat="server" ReadOnly="True" Width="88px"></asp:TextBox><IMG onclick="fload(TbDtrq2)" alt="" src="images/body_pic_03.jpg">
									</td>
								</tr>
								<tr style="HEIGHT: 25px">
									<td>��Ŀ���ͣ�</td>
									<td colspan="3">
										<asp:CheckBoxList id="ccblXmlx" runat="server" RepeatDirection="Horizontal"></asp:CheckBoxList></td>
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
									<td><asp:datagrid id="DgXmlist" runat="server" PageSize="8" width="100%" AllowPaging="True" CellPadding="0"
											BorderWidth="1px" BorderColor="#999999" AutoGenerateColumns="False">
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
												<asp:BoundColumn DataField="sqbh" HeaderText="������">
													<HeaderStyle Width="5%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="xmlxmc" HeaderText="��Ŀ����">
													<HeaderStyle Width="10%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="sfdt" HeaderText="�Ƿ�ͼ">
													<HeaderStyle Width="5%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="����">
													<HeaderStyle Width="5%"></HeaderStyle>
													<ItemTemplate>
														<asp:HyperLink id=HyperLink1 runat="server" Target=_blank NavigateUrl='<%# "yxqklrDesc.aspx?id="+DataBinder.Eval(Container.DataItem,"id")%>'>¼��</asp:HyperLink>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn Visible="False" DataField="id" HeaderText="id"></asp:BoundColumn>
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
