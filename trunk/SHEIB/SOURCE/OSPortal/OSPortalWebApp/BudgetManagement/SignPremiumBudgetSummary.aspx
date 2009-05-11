<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="SignPremiumBudgetSummary.aspx.cs" Inherits="OSPortalWebApp.BudgetManagement.SignPremiumBudgetSummary" Title="" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>签约预算执行汇总</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width:100%;">
        <tr>
            <td style="width:100%; text-align:center;">
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
                    AutoDataBind="true" DisplayGroupTree="False" EnableDatabaseLogonPrompt="False" 
                    EnableParameterPrompt="False" 
                    HasCrystalLogo="False" HasDrillUpButton="False" HasSearchButton="False" 
                    HasToggleGroupTreeButton="False" HasViewList="False" Height="50px" 
                    Width="350px" HasZoomFactorList="False" PrintMode="ActiveX" />
            </td>
        </tr>
    </table>
</asp:Content>