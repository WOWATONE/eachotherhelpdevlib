<%@ Page language="c#" Codebehind="gcbdesktop.aspx.cs" AutoEventWireup="false" Inherits="JITE.jhpt.gcbdesktop" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>gcbdesktop</title>
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
					<td bgColor="#e3e3e3">��ǰλ�ã� ��������</td>
					<td style="PADDING-RIGHT: 20px" align="right" bgColor="#e3e3e3"><asp:label id="LbUserNameTop" runat="server"></asp:label>�����ã���ӭʹ�ù��̲��ۺϼƻ�����ͨƽ̨��������
						<script language="javascript">getCurDate();</script>
					</td>
				</tr>
			</table>
			<table cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td style="BACKGROUND-POSITION: left top; PADDING-LEFT: 25px; BACKGROUND-REPEAT: no-repeat"
						background="images/body_bg_01.gif">
						<!--������� begin-->
						<table cellSpacing="0" cellPadding="0" width="95%" border="0">
							<tr>
								<td class="black" height="30"><IMG height="14" src="images/body_pic_01.gif" width="15" border="0">�����������</td>
							</tr>
							<tr>
								<td style="BACKGROUND-POSITION: left 50%; BACKGROUND-REPEAT: no-repeat" background="images/body_bg_02.gif"
									bgColor="#01679a" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
							<tr>
								<td class="bgout_1" onmouseover="this.className='bgon_1';" style="PADDING-LEFT: 5px"
									onmouseout="this.className='bgout_1';" height="25">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<td style="PADDING-RIGHT: 8px; PADDING-LEFT: 8px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="80%">�����嵥</td>
											<td align="center" width="20%">[&nbsp;<a href="gcjk.aspx?type=GCA" target="mainFrame">
													<asp:label id="LbGcqd" runat="server"></asp:label></a>&nbsp;]</td>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td bgColor="#cccccc" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
							<tr>
								<td class="bgout_1" onmouseover="this.className='bgon_1';" style="PADDING-LEFT: 5px"
									onmouseout="this.className='bgout_1';" height="25">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<td style="PADDING-RIGHT: 8px; PADDING-LEFT: 8px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="5" border="0"></td>
											<td width="80%">Ԥ������</td>
											<td align="center" width="20%">[&nbsp;<a href="gcjk.aspx?type=GCB" target="mainFrame"><asp:label id="LbYbgc" runat="server"></asp:label></a>&nbsp;]</td>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td bgColor="#cccccc" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
							<tr>
								<td class="bgout_1" onmouseover="this.className='bgon_1';" style="PADDING-LEFT: 5px"
									onmouseout="this.className='bgout_1';" height="25">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<td style="PADDING-RIGHT: 8px; PADDING-LEFT: 8px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="80%">ȷ������</td>
											<td align="center" width="20%">[&nbsp;<a href="gcjk.aspx?type=GCC" target="mainFrame"><asp:label id="LbQdgc" runat="server"></asp:label></a>&nbsp;]</td>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td bgColor="#cccccc" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
						</table>
						<!--������� end-->
						<!--��Ŀ��� begin-->
						<table cellSpacing="0" cellPadding="0" width="95%" border="0">
							<tr>
								<td class="black" height="30"><IMG height="14" src="images/body_pic_01.gif" width="15" border="0">���¹������</td>
							</tr>
							<tr>
								<td style="BACKGROUND-POSITION: left 50%; BACKGROUND-REPEAT: no-repeat" background="images/body_bg_02.gif"
									bgColor="#01679a" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
							<tr>
								<td class="bgout_1" onmouseover="this.className='bgon_1';" style="PADDING-LEFT: 5px"
									onmouseout="this.className='bgout_1';" height="25">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<td style="PADDING-RIGHT: 8px; PADDING-LEFT: 8px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="80%">����Ԥ������</td>
											<td align="center" width="20%">[&nbsp; <a href="gcjk.aspx?type=ZXGCB" target="mainFrame">
													<asp:label id="LbZxYbgc" runat="server"></asp:label></a>&nbsp;]</td>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td bgColor="#cccccc" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
							<tr>
								<td class="bgout_1" onmouseover="this.className='bgon_1';" style="PADDING-LEFT: 5px"
									onmouseout="this.className='bgout_1';" height="25">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<td style="PADDING-RIGHT: 8px; PADDING-LEFT: 8px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="80%">����ȷ������</td>
											<td align="center" width="20%">[&nbsp; <a href="gcjk.aspx?type=ZXGCC" target="mainFrame">
													<asp:label id="LbZxQdgc" runat="server"></asp:label></a>&nbsp;]</td>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td bgColor="#cccccc" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
						</table>
						<!--��Ŀ��� end-->
						<!--�ƻ���� begin-->
						<table cellSpacing="0" cellPadding="0" width="95%" border="0">
							<tr>
								<td class="black" height="30"><IMG height="14" src="images/body_pic_01.gif" width="15" border="0">�ƻ����</td>
							</tr>
							<tr>
								<td style="BACKGROUND-POSITION: left 50%; BACKGROUND-REPEAT: no-repeat" background="images/body_bg_02.gif"
									bgColor="#01679a" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
							<tr>
								<td class="bgout_1" onmouseover="this.className='bgon_1';" style="PADDING-LEFT: 5px"
									onmouseout="this.className='bgout_1';" height="25">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<td style="PADDING-RIGHT: 8px; PADDING-LEFT: 8px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="50%">���ƻ�</td>
											<td align="center" width="30%">[&nbsp;<a href="jhcx.aspx?type=DJH" target="mainFrame">
													<asp:label id="LbDjhZ" runat="server"></asp:label>&nbsp;]</a>��</td>
											<td align="center" width="20%">[&nbsp;
												<asp:label id="LbDjhNum" runat="server"></asp:label>&nbsp;]</td>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td bgColor="#cccccc" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
							<tr>
								<td class="bgout_1" onmouseover="this.className='bgon_1';" style="PADDING-LEFT: 5px"
									onmouseout="this.className='bgout_1';" height="25">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<td style="PADDING-RIGHT: 8px; PADDING-LEFT: 8px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="50%">Ԥ�ƻ�</td>
											<td align="center" width="30%">[&nbsp;<a href="jhcx.aspx?type=YJH" target="mainFrame">
													<asp:label id="LbYjhZ" runat="server"></asp:label></a>&nbsp;]��</td>
											<td align="center" width="20%">[&nbsp;
												<asp:label id="LbYjhNum" runat="server"></asp:label>&nbsp;]</td>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td bgColor="#cccccc" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
							<tr>
								<td class="bgout_1" onmouseover="this.className='bgon_1';" style="PADDING-LEFT: 5px"
									onmouseout="this.className='bgout_1';" height="25">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<td style="PADDING-RIGHT: 8px; PADDING-LEFT: 8px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="50%">���ƻ�</td>
											<td align="center" width="30%">[&nbsp;<a href="jhcx.aspx?type=CJH" target="mainFrame">
													<asp:label id="LbCjhZ" runat="server"></asp:label></a>&nbsp;]��</td>
											<td align="center" width="20%">[&nbsp;
												<asp:label id="LbCjhNum" runat="server"></asp:label>&nbsp;]</td>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td bgColor="#cccccc" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
							<tr>
								<td class="bgout_1" onmouseover="this.className='bgon_1';" style="PADDING-LEFT: 5px"
									onmouseout="this.className='bgout_1';" height="25">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<td style="PADDING-RIGHT: 8px; PADDING-LEFT: 8px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="50%">���мƻ�</td>
											<td align="center" width="30%">[&nbsp;<a href="jhcx.aspx?type=ALLJH" target="mainFrame">
													<asp:label id="LbAllJhZ" runat="server"></asp:label></a>&nbsp;]��</td>
											<td align="center" width="20%">[&nbsp;
												<asp:label id="LbAllJhNum" runat="server"></asp:label>&nbsp;]</td>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td bgColor="#cccccc" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
						</table>
						<!--�ƻ���� end-->
						<!--���·�����Ϣ begin-->
						<table cellSpacing="0" cellPadding="0" width="95%" border="0">
							<tr>
								<td class="black" height="30"><IMG height="14" src="images/body_pic_01.gif" width="15" border="0">���·�����Ϣ</td>
							</tr>
							<tr>
								<td style="BACKGROUND-POSITION: left 50%; BACKGROUND-REPEAT: no-repeat" background="images/body_bg_02.gif"
									bgColor="#01679a" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
							<tr>
								<td class="bgout_1" onmouseover="this.className='bgon_1';" style="PADDING-LEFT: 5px"
									onmouseout="this.className='bgout_1';" height="25">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<td style="PADDING-RIGHT: 8px; PADDING-LEFT: 8px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="80%">�������շ�����Ϣ</td>
											<td align="center" width="20%">[&nbsp; <a href="gcjk.aspx?type=DLFK" target="mainFrame">
													<asp:label id="LbDlqz" runat="server"></asp:label></a>&nbsp;]</td>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td bgColor="#cccccc" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
							<tr>
								<td class="bgout_1" onmouseover="this.className='bgon_1';" style="PADDING-LEFT: 5px"
									onmouseout="this.className='bgout_1';" height="25">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<td style="PADDING-RIGHT: 8px; PADDING-LEFT: 8px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="80%">�ֳ�������Ϣ</td>
											<td align="center" width="20%">[&nbsp; <a href="gcjk.aspx?type=XCFK" target="mainFrame">
													<asp:label id="LbXcfk" runat="server"></asp:label></a>&nbsp;]</td>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td bgColor="#cccccc" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
							<tr>
								<td class="bgout_1" onmouseover="this.className='bgon_1';" style="PADDING-LEFT: 5px"
									onmouseout="this.className='bgout_1';" height="25">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<td style="PADDING-RIGHT: 8px; PADDING-LEFT: 8px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="80%">Ӫ����������Ϣ</td>
											<td align="center" width="20%">[&nbsp; <a href="gcjk.aspx?type=YXFK" target="mainFrame">
													<asp:label id="LbYxfk" runat="server"></asp:label></a>&nbsp;]</td>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td bgColor="#cccccc" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
							<tr>
								<td class="bgout_1" onmouseover="this.className='bgon_1';" style="PADDING-LEFT: 5px"
									onmouseout="this.className='bgout_1';" height="25">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR>
											<td style="PADDING-RIGHT: 8px; PADDING-LEFT: 8px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="80%">�ۺϼƻ���������Ϣ</td>
											<td align="center" width="20%">[&nbsp; <a href="gcjk.aspx?type=ZHFK" target="mainFrame">
													<asp:label id="Lbzhjhb" runat="server"></asp:label></a>&nbsp;]</td>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td bgColor="#cccccc" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
						</table>
						<!--���·�����Ϣ end--></td>
					<td style="BACKGROUND-POSITION: left 50%; BACKGROUND-REPEAT: repeat-y" vAlign="top"
						align="center" width="279" background="images/body_bg_03.gif">
						<!--�û���Ϣ begin-->
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
											<td align="right" width="40%" height="25">�û�����</td>
											<td vAlign="top" align="left" width="60%"><asp:label id="LbUserName" runat="server"></asp:label></td>
										</tr>
										<tr>
											<td vAlign="top" align="right" height="25">��ɫ��
											</td>
											<td vAlign="top" align="left"><asp:label id="LbJsmc" runat="server"></asp:label></td>
										</tr>
										<tr>
											<td vAlign="top" align="right" height="50">��λ��
											</td>
											<td vAlign="top" align="left"><asp:label id="LbGddw" runat="server"></asp:label></td>
										</tr>
										<tr>
											<td align="right" background="images/table_bg_04.gif" colSpan="2" height="30"><A href="#"><u>�޸�����</u></A></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td background="images/table_bg_02.gif" height="4"></td>
							</tr>
						</table>
						<!--�û���Ϣ end-->
						<!--������Ϣ begin-->
						<table cellSpacing="0" cellPadding="0" width="192" border="0">
							<tr>
								<td class="black" style="PADDING-LEFT: 5px" height="30">������Ϣ</td>
							</tr>
							<tr>
								<td bgColor="#cecece" height="3"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
							</tr>
							<tr>
								<td height="25">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR height="25">
											<td style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="80%">�ظ�ͣ������</td>
											<td align="center" width="20%">[&nbsp;<a href="jhcx.aspx?type=CFTDTX" target="mainFrame"><asp:label id="LbCftd" runat="server"></asp:label></a>&nbsp;]</td>
										</TR>
									</table>
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR height="25">
											<td style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="80%">�ƻ�ʩ�����ھ��С��20��</td>
											<td align="center" width="20%">[&nbsp;<a href="jhcx.aspx?type=BJTX1" target="mainFrame"><asp:label id="LbBz1" runat="server"></asp:label></a>&nbsp;]</td>
										</TR>
									</table>
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR height="25">
											<td style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="80%">�ƻ�ʩ�����ھ��С��15��</td>
											<td align="center" width="20%">[&nbsp;<a href="jhcx.aspx?type=BJTX2" target="mainFrame"><asp:label id="LbBz2" runat="server"></asp:label></a>&nbsp;]</td>
										</TR>
									</table>
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tr>
											<td background="images/table_bg_05.gif" colSpan="3" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
										</tr>
									</table>
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR height="25">
											<td style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="80%">����붨�ƻ�10���Ԥ������</td>
											<td align="center" width="20%">[&nbsp;<a href="jhcx.aspx?type=QTTX" target="mainFrame"><asp:label id="LbQt" runat="server"></asp:label></a>&nbsp;]</td>
										</TR>
									</table>
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TR height="25">
											<td style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px" align="center"><IMG height="6" src="images/body_pic_02.gif" width="6" border="0"></td>
											<td width="80%">����������Ϣ</td>
											<td align="center" width="20%">[&nbsp;<a href="jhcx.aspx?type=ALLTX" target="mainFrame"><asp:label id="LbSytx" runat="server"></asp:label></a>&nbsp;]</td>
										</TR>
									</table>
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tr>
											<td background="images/table_bg_05.gif" colSpan="3" height="1"><IMG height="1" src="images/sign.gif" width="1" border="0"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<br>
						<!--������Ϣ end--></td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
