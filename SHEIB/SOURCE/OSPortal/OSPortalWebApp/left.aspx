<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="left.aspx.cs" Inherits="OSPortalWebApp.left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta content="zh-CN" http-equiv="Content-Language" />
    <script src="js/jquery-1.3.2.js" type="text/javascript"></script>
	<script src="js/leftmenu.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/leftmenustyle.css" />
    <title>�˵�</title>
    <script type="text/javascript">
        $(document).ready(function() {
        
            $("#anchor_customer").click(function(event) {
                parent.mainFrame.location = $("#anchor_customer")[0].href;
                return false;
            });
            
            $("#anchor_contact").click(function(event) {
            parent.mainFrame.location = $("#anchor_contact")[0].href;
                return false;
            });



            $("#anchor_businessfollow").click(function(event) {
                parent.mainFrame.location = $("#anchor_businessfollow")[0].href;
                return false;
            });


            $("#anchor_servicenotice").click(function(event) {
                parent.mainFrame.location = $("#anchor_servicenotice")[0].href;
                return false;
            });


            $("#anchor_areasetting").click(function(event) {
                parent.mainFrame.location = $("#anchor_areasetting")[0].href;
                return false;
            });


            $("#anchor_customerlevel").click(function(event) {
                parent.mainFrame.location = $("#anchor_customerlevel")[0].href;
                return false;
            });


            $("#anchor_otheriteminput").click(function(event) {
                parent.mainFrame.location = $("#anchor_otheriteminput")[0].href;
                return false;
            });


            $("#anchor_otheritemmodify").click(function(event) {
                parent.mainFrame.location = $("#anchor_otheritemmodify")[0].href;
                return false;
            });


            $("#anchor_otheritemcheck").click(function(event) {
                parent.mainFrame.location = $("#anchor_otheritemcheck")[0].href;
                return false;
            });


            $("#anchor_otheritemsearch").click(function(event) {
                parent.mainFrame.location = $("#anchor_otheritemsearch")[0].href;
                return false;
            });


            $("#anchor_iteminput").click(function(event) {
                parent.mainFrame.location = $("#anchor_iteminput")[0].href;
                return false;
            });


            $("#anchor_itemmodify").click(function(event) {
                parent.mainFrame.location = $("#anchor_itemmodify")[0].href;
                return false;
            });


            $("#anchor_itemcheck").click(function(event) {
                parent.mainFrame.location = $("#anchor_itemcheck")[0].href;
                return false;
            });


            $("#anchor_itemsearch").click(function(event) {
                parent.mainFrame.location = $("#anchor_itemsearch")[0].href;
                return false;
            });


            $("#anchor_payoffcheckin").click(function(event) {
                parent.mainFrame.location = $("#anchor_payoffcheckin")[0].href;
                return false;
            });


            $("#anchor_payoffinfomanager").click(function(event) {
                parent.mainFrame.location = $("#anchor_payoffinfomanager")[0].href;
                return false;
            });


            $("#anchor_businessconsult").click(function(event) {
                parent.mainFrame.location = $("#anchor_businessconsult")[0].href;
                return false;
            });


            $("#anchor_noticebook").click(function(event) {
                parent.mainFrame.location = $("#anchor_noticebook")[0].href;
                return false;
            });


            $("#anchor_customerfee").click(function(event) {
                parent.mainFrame.location = $("#anchor_customerfee")[0].href;
                return false;
            });


            $("#anchor_cutofffee").click(function(event) {
                parent.mainFrame.location = $("#anchor_cutofffee")[0].href;
                return false;
            });


            $("#anchor_cutofffeebook").click(function(event) {
                parent.mainFrame.location = $("#anchor_cutofffeebook")[0].href;
                return false;
            });


            $("#anchor_middlefeecount").click(function(event) {
                parent.mainFrame.location = $("#anchor_middlefeecount")[0].href;
                return false;
            });


            $("#anchor_sheetcolumnmanager").click(function(event) {
                parent.mainFrame.location = $("#anchor_sheetcolumnmanager")[0].href;
                return false;
            });


            $("#anchor_ensurecompany").click(function(event) {
                parent.mainFrame.location = $("#anchor_ensurecompany")[0].href;
                return false;
            });


            $("#anchor_ensurebranch").click(function(event) {
                parent.mainFrame.location = $("#anchor_ensurebranch")[0].href;
                return false;
            });


            $("#anchor_categorydefinition").click(function(event) {
                parent.mainFrame.location = $("#anchor_categorydefinition")[0].href;
                return false;
            });


            $("#anchor_otherinfodefinition").click(function(event) {
                parent.mainFrame.location = $("#anchor_otherinfodefinition")[0].href;
                return false;
            });


            $("#anchor_employeemanager").click(function(event) {
                parent.mainFrame.location = $("#anchor_employeemanager")[0].href;
                return false;
            });


            $("#anchor_titlesetting").click(function(event) {
                parent.mainFrame.location = $("#anchor_titlesetting")[0].href;
                return false;
            });


            $("#anchor_companytree").click(function(event) {
                parent.mainFrame.location = $("#anchor_companytree")[0].href;
                return false;
            });


            $("#anchor_permissionmanager").click(function(event) {
                parent.mainFrame.location = $("#anchor_permissionmanager")[0].href;
                return false;
            });


            $("#anchor_infocenter").click(function(event) {
                parent.mainFrame.location = $("#anchor_infocenter")[0].href;
                return false;
            });


            $("#anchor_losscategory").click(function(event) {
                parent.mainFrame.location = $("#anchor_losscategory")[0].href;
                return false;
            });


            $("#anchor_ofreason").click(function(event) {
                parent.mainFrame.location = $("#anchor_ofreason")[0].href;
                return false;
            });


            $("#anchor_itemstate").click(function(event) {
                parent.mainFrame.location = $("#anchor_itemstate")[0].href;
                return false;
            });


            $("#anchor_businessclass").click(function(event) {
                parent.mainFrame.location = $("#anchor_businessclass")[0].href;
                return false;
            });


            $("#anchor_unittype").click(function(event) {
                parent.mainFrame.location = $("#anchor_unittype")[0].href;
                return false;
            });


            $("#anchor_systemoption").click(function(event) {
                parent.mainFrame.location = $("#anchor_systemoption")[0].href;
                return false;
            });


            $("#anchor_systemlog").click(function(event) {
                parent.mainFrame.location = $("#anchor_systemlog")[0].href;
                return false;
            });


            $("#anchor_changepass").click(function(event) {
                parent.mainFrame.location = $("#anchor_changepass")[0].href;
                return false;
            });


            $("#anchor_printsetting").click(function(event) {
                parent.mainFrame.location = $("#anchor_printsetting")[0].href;
                return false;
            });


            $("#anchor_messagenotice").click(function(event) {
                parent.mainFrame.location = $("#anchor_messagenotice")[0].href;
                return false;
            });


            $("#anchor_achievementreport").click(function(event) {
                parent.mainFrame.location = $("#anchor_achievementreport")[0].href;
                return false;
            });


            $("#anchor_balancereport").click(function(event) {
                parent.mainFrame.location = $("#anchor_balancereport")[0].href;
                return false;
            });
        });
    </script>
    <!--[if lt IE 8]>
    <style type="text/css">
        li a {display:inline-block;}
        li a {display:block;}
    </style>
    <![endif]-->    
</head>
<body style="background-color:#B6D0E9; margin:5px 0 0 0; padding: 5px 0 0 0;">
    <ul id="menu">
		<li>
			<a href="#">�ͻ���ϵ</a>
			<ul>
				<li><a id="anchor_customer" href="http://www.google.cn">�ͻ��б�</a></li>
				<li><a id="anchor_contact" href="http://www.wordpress.org/">��ϵ��</a></li>
				<li><a id="anchor_businessfollow" href="http://www.textpattern.com/">ҵ�����</a></li>
				<li><a id="anchor_servicenotice" href="http://typosphere.org/">��������</a></li>
				<li><a id="anchor_areasetting" href="http://www.textpattern.com/">��������</a></li>
				<li><a id="anchor_customerlevel" href="http://typosphere.org/">�ͻ�����</a></li>
			</ul>
		</li>
		<li>
			<a href="#">�ǳ��ձ�������</a>
			<ul>
				<li><a id="anchor_otheriteminput" href="http://www.php.net/">����¼��</a></li>
				<li><a id="anchor_otheritemmodify" href="http://www.ruby-lang.org/en/">��������</a></li>
				<li><a id="anchor_otheritemcheck" href="http://www.python.org/">�������</a></li>
				<li><a id="anchor_otheritemsearch" href="http://www.perl.org/">������ѯ</a></li>
			</ul>
		</li>
		<li>
			<a href="#">���ձ�������</a>
			<ul>
				<li><a id="anchor_iteminput" href="http://www.php.net/">����¼��</a></li>
				<li><a id="anchor_itemmodify" href="http://www.ruby-lang.org/en/">��������</a></li>
				<li><a id="anchor_itemcheck" href="http://www.python.org/">�������</a></li>
				<li><a id="anchor_itemsearch" href="http://www.perl.org/">������ѯ</a></li>
			</ul>
		</li>
		<li>
			<a href="#">�ͻ�����</a>
			<ul>
				<li><a id="anchor_payoffcheckin" href="http://search.yahoo.com/">����Ǽ�</a></li>
				<li><a id="anchor_payoffinfomanager" href="http://www.google.com/">�������Ϲ���</a></li>
			</ul>
		</li>
		<li><a id="anchor_businessconsult" href="http://www.i-marco.nl/weblog/">ҵ����ѯ</a></li>
		<li>
			<a href="#">�ո�����</a>
			<ul>
				<li><a id="anchor_noticebook" href="http://search.yahoo.com/">����֪ͨ��</a></li>
				<li><a id="anchor_customerfee" href="http://www.google.com/">�ͻ��շ�</a></li>
				<li><a id="anchor_cutofffee" href="http://www.ask.com/">�⸶����</a></li>
				<li><a id="anchor_cutofffeebook" href="http://www.live.com/?searchonly=true">�⸶���ѿ�Ʊ</a></li>
				<li><a id="anchor_middlefeecount" href="http://www.google.com/">���ͷѽ���</a></li>
				<li><a id="anchor_sheetcolumnmanager" href="http://www.ask.com/">̨�ʹ���</a></li>
			</ul>
		</li>
		<li>
			<a href="#">��Ʒ����</a>
			<ul>
				<li><a id="anchor_ensurecompany" href="http://search.yahoo.com/">���չ�˾!</a></li>
				<li><a id="anchor_ensurebranch" href="http://www.google.com/">��֧����</a></li>
				<li><a id="anchor_categorydefinition" href="http://www.ask.com/">���ֶ���</a></li>
				<li><a id="anchor_otherinfodefinition" href="http://www.live.com/?searchonly=true">��Ķ���</a></li>
			</ul>
		</li>
		<li>
			<a href="#">��֯����</a>
			<ul>
				<li><a id="anchor_employeemanager" href="http://search.yahoo.com/">Ա������</a></li>
				<li><a id="anchor_titlesetting" href="http://www.google.com/">ְλ����</a></li>
				<li><a id="anchor_companytree" href="http://www.ask.com/">��֯����</a></li>
				<li><a id="anchor_permissionmanager" href="http://www.live.com/?searchonly=true">Ȩ�޹���</a></li>
			</ul>
		</li>
		<li><a id="anchor_infocenter" href="http://www.i-marco.nl/weblog/">��Ϣ����</a></li>
		<li>
			<a href="#">ϵͳ����</a>
			<ul>
				<li><a id="anchor_losscategory" href="http://search.yahoo.com/">��ʧ����</a></li>
				<li><a id="anchor_ofreason" href="http://www.google.com/">����ԭ��</a></li>
				<li><a id="anchor_itemstate" href="http://www.ask.com/">����״̬</a></li>
				<li><a id="anchor_businessclass" href="http://www.live.com/?searchonly=true">��ҵ����</a></li>
				<li><a id="anchor_unittype" href="http://www.ask.com/">��������</a></li>
				<li><a id="anchor_systemoption" href="http://www.ask.com/">ϵͳѡ��</a></li>
				<li><a id="anchor_systemlog" href="http://www.ask.com/">ϵͳ��־</a></li>
				<li><a id="anchor_changepass" href="http://www.ask.com/">�޸Ŀ���</a></li>
				<li><a id="anchor_printsetting" href="http://www.ask.com/">��ӡ����</a></li>
			</ul>
		</li>
		<li><a id="anchor_messagenotice" href="http://www.i-marco.nl/weblog/">��Ϣ����</a></li>
		<li>
			<a href="#">ͳ�Ʊ���</a>
			<ul>
				<li><a id="anchor_achievementreport" href="http://search.yahoo.com/">ҵ������</a></li>
				<li><a id="anchor_balancereport" href="http://www.live.com/?searchonly=true">���㱨��</a></li>
			</ul>
		</li>
	</ul>
</body>
</html>
