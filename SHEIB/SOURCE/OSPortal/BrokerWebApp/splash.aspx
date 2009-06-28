<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" CodeBehind="splash.aspx.cs" Inherits="BrokerWebApp.splash" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta content="zh-CN" http-equiv="Content-Language" />
    <script src="js/jquery-1.3.2.js" type="text/javascript"></script>
	<script src="js/jquerynotice/jquery.notice.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="js/jquerynotice/jquery.notice.css" />
	<title>Splash</title>
    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
                //text: 'This is a notification that you have to remove',
                //stay: true
            //});

            //$('button.add').click(function() {
            //    jQuery.noticeAdd({
            //        text: 'This is a notification that you have to remove',
            //        stay: true
            //    });
            //});

            //$('button.add2').click(function() {
            //    jQuery.noticeAdd({
            //        text: 'This is a notification that does not stay',
            //        stay: false
            //    });
            //});

            //$('button.remove').click(function() {
            //    jQuery.noticeRemove($('.notice-item-wrapper'), 400);
            //});

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
