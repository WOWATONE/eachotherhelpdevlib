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
				<li><a id="Customer" href="Customer.aspx">客户列表</a></li>
				<li><a id="CustContact" href="CustContact.aspx">联系人</a></li>
				<li><a id="CustomerPtFollow" href="CustomerPtFollow.aspx">业务跟进</a></li>
				<li><a id="CustAlert" href="CustAlert.aspx">服务提醒</a></li>
				<li><a id="AreaSetting" href="AreaSetting.aspx">区域设置</a></li>
			</ul>
		</li>
		<li>
			<a href="#">非车险保单管理</a>
			<ul>
				<li><a id="PolicyInput" href="http://www.php.net/">保单录入</a></li>
				<li><a id="PolicyAlter" href="http://www.ruby-lang.org/en/">保单批改</a></li>
				<li><a id="PolicyCheck" href="http://www.python.org/">保单审核</a></li>
				<li><a id="PolicySearch" href="http://www.perl.org/">保单查询</a></li>
			</ul>
		</li>
		<li>
			<a href="#">车险保单管理</a>
			<ul>
			    <li><a id="AskPriceInput" href="http://www.php.net/">询价单录入</a></li>
			    <li><a id="AskPriceCheck" href="http://www.php.net/">询价单审核</a></li>
			    <li><a id="AskPriceSearch" href="http://www.php.net/">询价单查询</a></li>
				<li><a id="CarPolicyInput" href="http://www.php.net/">保单录入</a></li>
				<li><a id="CarPolicyAlter" href="http://www.ruby-lang.org/en/">保单批改</a></li>
				<li><a id="CarPolicyCheck" href="http://www.python.org/">保单审核</a></li>
				<li><a id="CarPolicySearch" href="http://www.perl.org/">保单查询</a></li>
			</ul>
		</li>
		<li>
			<a href="#">客户理赔</a>
			<ul>
				<li><a id="NotifyClaim" href="http://search.yahoo.com/">理赔登记</a></li>
				<li><a id="NotifyClaimDoc" href="http://www.google.com/">理赔资料管理</a></li>
			</ul>
		</li>
		<li>
			<a href="#">业务咨询</a>
			<ul>
				<li><a id="BusinessConsult" href="http://search.yahoo.com/">业务咨询</a></li>
			</ul>
		</li>		
		<li>
			<a href="#">收付结算</a>
			<ul>
				<li><a id="FeeNotice" href="FeeNotice.aspx>保费通知书</a></li>
				<li><a id="FeeCustomer" href="http://www.google.com/">客户收费</a></li>
				<li><a id="FeePayin" href="http://www.ask.com/">解付保费</a></li>
				<li><a id="FeePayinInvoice" href="http://www.live.com/?searchonly=true">解付保费开票</a></li>
				<li><a id="FeeProcess" href="http://www.google.com/">经纪费结算</a></li>
				<li><a id="SheetcolumnManager" href="http://www.ask.com/">台帐管理</a></li>
			</ul>
		</li>
		<li>
			<a href="#">产品设置</a>
			<ul>
				<li><a id="Carrier" href="http://search.yahoo.com/">保险公司!</a></li>
				<li><a id="Branch" href="http://www.google.com/">分支机构</a></li>
				<li><a id="ProductType" href="http://www.ask.com/">险种定义</a></li>
				<li><a id="TargetType" href="http://www.live.com/?searchonly=true">标的定义</a></li>
			</ul>
		</li>
		<li>
			<a href="#">组织设置</a>
			<ul>
				<li><a id="UserManager" href="http://search.yahoo.com/">员工管理</a></li>
				<li><a id="RoleManager" href="http://www.google.com/">角色管理</a></li>
				<li><a id="DepartmentManager" href="http://www.ask.com/">组织机构</a></li>
			</ul>
		</li>
		<li><a id="InfoCenter" href="http://www.i-marco.nl/weblog/">信息中心</a></li>
		<li>
			<a href="#">系统设置</a>
			<ul>
				<li><a id="CodeManager" href="http://search.yahoo.com/">数据字典</a></li>
				<li><a id="SystemOption" href="http://www.ask.com/">系统选项</a></li>
				<li><a id="Systemlog" href="http://www.ask.com/">系统日志</a></li>
				<li><a id="ChangePass" href="http://www.ask.com/">修改口令</a></li>
			</ul>
		</li>
		<li><a id="MessageNotice" href="http://www.i-marco.nl/weblog/">消息提醒</a></li>
		<li>
			<a href="#">综合查询</a>
			<ul>
				<li><a id="GeneralSearch" href="http://search.yahoo.com/">业绩报表</a></li>
			</ul>
		</li>
		<li>
			<a href="#">预算管理</a>
			<ul>
				<li><a id="SignPremiumBudget" href="http://search.yahoo.com/">签单保费预算</a></li>
				<li><a id="IncomePremiumBudget" href="http://search.yahoo.com/">实收保费预算</a></li>
				<li><a id="SignPremiumBudgetAnalyse" href="http://search.yahoo.com/">签单保费预算分析报表</a></li>
				<li><a id="IncomePremiumBudgetAnalyse" href="http://search.yahoo.com/">实收保费预算分析报表</a></li>
			</ul>
		</li>		
		<li>
			<a href="#">统计报表</a>
			<ul>
				<li><a id="AchievementReport" href="http://search.yahoo.com/">业绩报表</a></li>
				<li><a id="BalanceReport" href="http://www.live.com/?searchonly=true">结算报表</a></li>
				<li><a id="GeneralReport" href="http://www.live.com/?searchonly=true">常规报表</a></li>
				<li><a id="NotifyClaimReport" href="http://www.live.com/?searchonly=true">理赔报表</a></li>
			</ul>
		</li>
	</ul>
</body>
</html>
