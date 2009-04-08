<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="left.aspx.cs" Inherits="OSPortalWebApp.left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta content="zh-CN" http-equiv="Content-Language" />
    <script src="js/jquery-1.3.2.js" type="text/javascript"></script>
	<script src="js/leftmenu.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/leftmenustyle.css" />
    <title>菜单</title>
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
			<a href="#">客户关系</a>
			<ul>
				<li><a id="anchor_customer" href="http://www.google.cn">客户列表</a></li>
				<li><a id="anchor_contact" href="http://www.wordpress.org/">联系人</a></li>
				<li><a id="anchor_businessfollow" href="http://www.textpattern.com/">业务跟进</a></li>
				<li><a id="anchor_servicenotice" href="http://typosphere.org/">服务提醒</a></li>
				<li><a id="anchor_areasetting" href="http://www.textpattern.com/">区域设置</a></li>
				<li><a id="anchor_customerlevel" href="http://typosphere.org/">客户级别</a></li>
			</ul>
		</li>
		<li>
			<a href="#">非车险保单管理</a>
			<ul>
				<li><a id="anchor_otheriteminput" href="http://www.php.net/">保单录入</a></li>
				<li><a id="anchor_otheritemmodify" href="http://www.ruby-lang.org/en/">保单批改</a></li>
				<li><a id="anchor_otheritemcheck" href="http://www.python.org/">保单审核</a></li>
				<li><a id="anchor_otheritemsearch" href="http://www.perl.org/">保单查询</a></li>
			</ul>
		</li>
		<li>
			<a href="#">车险保单管理</a>
			<ul>
				<li><a id="anchor_iteminput" href="http://www.php.net/">保单录入</a></li>
				<li><a id="anchor_itemmodify" href="http://www.ruby-lang.org/en/">保单批改</a></li>
				<li><a id="anchor_itemcheck" href="http://www.python.org/">保单审核</a></li>
				<li><a id="anchor_itemsearch" href="http://www.perl.org/">保单查询</a></li>
			</ul>
		</li>
		<li>
			<a href="#">客户理赔</a>
			<ul>
				<li><a id="anchor_payoffcheckin" href="http://search.yahoo.com/">理赔登记</a></li>
				<li><a id="anchor_payoffinfomanager" href="http://www.google.com/">理赔资料管理</a></li>
			</ul>
		</li>
		<li><a id="anchor_businessconsult" href="http://www.i-marco.nl/weblog/">业务咨询</a></li>
		<li>
			<a href="#">收付结算</a>
			<ul>
				<li><a id="anchor_noticebook" href="http://search.yahoo.com/">保费通知书</a></li>
				<li><a id="anchor_customerfee" href="http://www.google.com/">客户收费</a></li>
				<li><a id="anchor_cutofffee" href="http://www.ask.com/">解付保费</a></li>
				<li><a id="anchor_cutofffeebook" href="http://www.live.com/?searchonly=true">解付保费开票</a></li>
				<li><a id="anchor_middlefeecount" href="http://www.google.com/">经纪费结算</a></li>
				<li><a id="anchor_sheetcolumnmanager" href="http://www.ask.com/">台帐管理</a></li>
			</ul>
		</li>
		<li>
			<a href="#">产品设置</a>
			<ul>
				<li><a id="anchor_ensurecompany" href="http://search.yahoo.com/">保险公司!</a></li>
				<li><a id="anchor_ensurebranch" href="http://www.google.com/">分支机构</a></li>
				<li><a id="anchor_categorydefinition" href="http://www.ask.com/">险种定义</a></li>
				<li><a id="anchor_otherinfodefinition" href="http://www.live.com/?searchonly=true">标的定义</a></li>
			</ul>
		</li>
		<li>
			<a href="#">组织设置</a>
			<ul>
				<li><a id="anchor_employeemanager" href="http://search.yahoo.com/">员工管理</a></li>
				<li><a id="anchor_titlesetting" href="http://www.google.com/">职位设置</a></li>
				<li><a id="anchor_companytree" href="http://www.ask.com/">组织机构</a></li>
				<li><a id="anchor_permissionmanager" href="http://www.live.com/?searchonly=true">权限管理</a></li>
			</ul>
		</li>
		<li><a id="anchor_infocenter" href="http://www.i-marco.nl/weblog/">信息中心</a></li>
		<li>
			<a href="#">系统设置</a>
			<ul>
				<li><a id="anchor_losscategory" href="http://search.yahoo.com/">损失性质</a></li>
				<li><a id="anchor_ofreason" href="http://www.google.com/">出险原因</a></li>
				<li><a id="anchor_itemstate" href="http://www.ask.com/">保单状态</a></li>
				<li><a id="anchor_businessclass" href="http://www.live.com/?searchonly=true">行业分类</a></li>
				<li><a id="anchor_unittype" href="http://www.ask.com/">币种设置</a></li>
				<li><a id="anchor_systemoption" href="http://www.ask.com/">系统选项</a></li>
				<li><a id="anchor_systemlog" href="http://www.ask.com/">系统日志</a></li>
				<li><a id="anchor_changepass" href="http://www.ask.com/">修改口令</a></li>
				<li><a id="anchor_printsetting" href="http://www.ask.com/">打印设置</a></li>
			</ul>
		</li>
		<li><a id="anchor_messagenotice" href="http://www.i-marco.nl/weblog/">消息提醒</a></li>
		<li>
			<a href="#">统计报表</a>
			<ul>
				<li><a id="anchor_achievementreport" href="http://search.yahoo.com/">业绩报表</a></li>
				<li><a id="anchor_balancereport" href="http://www.live.com/?searchonly=true">结算报表</a></li>
			</ul>
		</li>
	</ul>
</body>
</html>
