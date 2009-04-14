<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="OSPortalWebApp.index" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
		<title>综合平台</title>
		<meta http-equiv="Expires" content="0">
        <meta http-equiv="Cache-Control" content="no-cache">
        <meta http-equiv="Pragma" content="no-cache">
	</head>
	<frameset rows="80,*" framespacing="0" border="0" frameBorder="0">
		<frame name="head" src="head.html" scrolling="no" noresize />
		<FRAMESET id="frame_down" border="0" frameSpacing="0" rows="*" frameBorder="0">
			<FRAMESET id="frame_left" border="0" frameSpacing="0" frameBorder="0" cols="176,15,*" >
				<FRAME name="leftFrame" src="dpleft.aspx" noresize scrolling="no" />
				<FRAME name="middleFrame" src="middle.html" noResize scrolling="no" />
				<FRAME id="mainFrame" name="mainFrame" src="splash.aspx" runat=server /> 
			</FRAMESET>
		</FRAMESET>
	</frameset>
</html>

