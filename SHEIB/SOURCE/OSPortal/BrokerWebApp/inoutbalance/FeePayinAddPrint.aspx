﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeePayinAddPrint.aspx.cs"
    Inherits="BrokerWebApp.inoutbalance.FeePayinAddPrint" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <rsweb:ReportViewer ID="ReportViewer1" Width="900"  Height="700" runat="server" ExportContentDisposition="AlwaysInline">
            <LocalReport ReportPath="inoutbalance\rpt\rptPayin.rdlc" />
        </rsweb:ReportViewer>
    </div>
    </form>
</body>
</html>
