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
				<li><a id="Customer" href="Customer.aspx">�ͻ��б�</a></li>
				<li><a id="CustContact" href="CustContact.aspx">��ϵ��</a></li>
				<li><a id="CustomerPtFollow" href="CustomerPtFollow.aspx">ҵ�����</a></li>
				<li><a id="CustAlert" href="CustAlert.aspx">��������</a></li>
				<li><a id="AreaSetting" href="AreaSetting.aspx">��������</a></li>
			</ul>
		</li>
		<li>
			<a href="#">�ǳ��ձ�������</a>
			<ul>
				<li><a id="PolicyInput" href="http://www.php.net/">����¼��</a></li>
				<li><a id="PolicyAlter" href="http://www.ruby-lang.org/en/">��������</a></li>
				<li><a id="PolicyCheck" href="http://www.python.org/">�������</a></li>
				<li><a id="PolicySearch" href="http://www.perl.org/">������ѯ</a></li>
			</ul>
		</li>
		<li>
			<a href="#">���ձ�������</a>
			<ul>
			    <li><a id="AskPriceInput" href="http://www.php.net/">ѯ�۵�¼��</a></li>
			    <li><a id="AskPriceCheck" href="http://www.php.net/">ѯ�۵����</a></li>
			    <li><a id="AskPriceSearch" href="http://www.php.net/">ѯ�۵���ѯ</a></li>
				<li><a id="CarPolicyInput" href="http://www.php.net/">����¼��</a></li>
				<li><a id="CarPolicyAlter" href="http://www.ruby-lang.org/en/">��������</a></li>
				<li><a id="CarPolicyCheck" href="http://www.python.org/">�������</a></li>
				<li><a id="CarPolicySearch" href="http://www.perl.org/">������ѯ</a></li>
			</ul>
		</li>
		<li>
			<a href="#">�ͻ�����</a>
			<ul>
				<li><a id="NotifyClaim" href="http://search.yahoo.com/">����Ǽ�</a></li>
				<li><a id="NotifyClaimDoc" href="http://www.google.com/">�������Ϲ���</a></li>
			</ul>
		</li>
		<li>
			<a href="#">ҵ����ѯ</a>
			<ul>
				<li><a id="BusinessConsult" href="http://search.yahoo.com/">ҵ����ѯ</a></li>
			</ul>
		</li>		
		<li>
			<a href="#">�ո�����</a>
			<ul>
				<li><a id="FeeNotice" href="FeeNotice.aspx>����֪ͨ��</a></li>
				<li><a id="FeeCustomer" href="http://www.google.com/">�ͻ��շ�</a></li>
				<li><a id="FeePayin" href="http://www.ask.com/">�⸶����</a></li>
				<li><a id="FeePayinInvoice" href="http://www.live.com/?searchonly=true">�⸶���ѿ�Ʊ</a></li>
				<li><a id="FeeProcess" href="http://www.google.com/">���ͷѽ���</a></li>
				<li><a id="SheetcolumnManager" href="http://www.ask.com/">̨�ʹ���</a></li>
			</ul>
		</li>
		<li>
			<a href="#">��Ʒ����</a>
			<ul>
				<li><a id="Carrier" href="http://search.yahoo.com/">���չ�˾!</a></li>
				<li><a id="Branch" href="http://www.google.com/">��֧����</a></li>
				<li><a id="ProductType" href="http://www.ask.com/">���ֶ���</a></li>
				<li><a id="TargetType" href="http://www.live.com/?searchonly=true">��Ķ���</a></li>
			</ul>
		</li>
		<li>
			<a href="#">��֯����</a>
			<ul>
				<li><a id="UserManager" href="http://search.yahoo.com/">Ա������</a></li>
				<li><a id="RoleManager" href="http://www.google.com/">��ɫ����</a></li>
				<li><a id="DepartmentManager" href="http://www.ask.com/">��֯����</a></li>
			</ul>
		</li>
		<li><a id="InfoCenter" href="http://www.i-marco.nl/weblog/">��Ϣ����</a></li>
		<li>
			<a href="#">ϵͳ����</a>
			<ul>
				<li><a id="CodeManager" href="http://search.yahoo.com/">�����ֵ�</a></li>
				<li><a id="SystemOption" href="http://www.ask.com/">ϵͳѡ��</a></li>
				<li><a id="Systemlog" href="http://www.ask.com/">ϵͳ��־</a></li>
				<li><a id="ChangePass" href="http://www.ask.com/">�޸Ŀ���</a></li>
			</ul>
		</li>
		<li><a id="MessageNotice" href="http://www.i-marco.nl/weblog/">��Ϣ����</a></li>
		<li>
			<a href="#">�ۺϲ�ѯ</a>
			<ul>
				<li><a id="GeneralSearch" href="http://search.yahoo.com/">ҵ������</a></li>
			</ul>
		</li>
		<li>
			<a href="#">Ԥ�����</a>
			<ul>
				<li><a id="SignPremiumBudget" href="http://search.yahoo.com/">ǩ������Ԥ��</a></li>
				<li><a id="IncomePremiumBudget" href="http://search.yahoo.com/">ʵ�ձ���Ԥ��</a></li>
				<li><a id="SignPremiumBudgetAnalyse" href="http://search.yahoo.com/">ǩ������Ԥ���������</a></li>
				<li><a id="IncomePremiumBudgetAnalyse" href="http://search.yahoo.com/">ʵ�ձ���Ԥ���������</a></li>
			</ul>
		</li>		
		<li>
			<a href="#">ͳ�Ʊ���</a>
			<ul>
				<li><a id="AchievementReport" href="http://search.yahoo.com/">ҵ������</a></li>
				<li><a id="BalanceReport" href="http://www.live.com/?searchonly=true">���㱨��</a></li>
				<li><a id="GeneralReport" href="http://www.live.com/?searchonly=true">���汨��</a></li>
				<li><a id="NotifyClaimReport" href="http://www.live.com/?searchonly=true">���ⱨ��</a></li>
			</ul>
		</li>
	</ul>
</body>
</html>
