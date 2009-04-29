<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="AskPriceSearch.aspx.cs" Inherits="OSPortalWebApp.vehicleinsurance.AskPriceSearch" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register src="../Controls/PolicySearch.ascx" tagname="PolicySearch" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>询价单检索</title>
    <script type="text/javascript">
	    $(document).ready(function() {
	        //jQuery.noticeAdd({
	        //    text: 'This is a notification that you have to remove',
	        //    stay: true
	    //});

	    lblCurrentDate.innerHTML = makewelcomeString();
	    
	    
	    });
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
      
    <table style="width:100%">
                    <tr>
                        <td style="height:40px; width:60%;">
                            <dxm:ASPxMenu Visible="false" EnableViewState="False" EncodeHtml="False" id="dpASPxMenu" runat="server" AllowSelectItem="True" Orientation="Horizontal">
                                <ClientSideEvents 
                                    CloseUp="function(s, e) {}" 
                                    PopUp="function(s, e) {}" 
                                    Init="function(s, e) {}" 
                                    ItemClick="function(s, e) { 
                                        var name = e.item.name;
                                        menuClick(name);
                                    }" 
                                    ItemMouseOut="function(s, e) {}" 
                                    ItemMouseOver="function(s, e) {}" />
                                <Items>
                                    <dxm:MenuItem Text="新    建" Name="PolicyInput.aspx"></dxm:MenuItem>
                                </Items>
                            </dxm:ASPxMenu>
                        </td>
                        <td style="height:40px; width:40%;">
                            <table style="margin:0px; padding:0px; width:100%; border:0px; text-align:right">
				                        <tr>
					                        <td style="width:40%; color:#0E5ED5;">当前位置：询价单检索</td>
					                        <td style="width:60%;PADDING-RIGHT: 20px; text-align:right;color:#0E5ED5;">
					                            <asp:label id="LbUserNameTop" runat="server" Text="王六"></asp:label>，您好！今天是
						                        <label id="lblCurrentDate"></label>
					                        </td>
				                        </tr>
	                        </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;" colspan="2">                
                            <uc1:PolicySearch ID="PolicySearch1" runat="server" />
                        </td>
                    </tr>                    
        </table>
     
     
</asp:Content>
