<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="FeeNoticeAdd.aspx.cs" Inherits="OSPortalWebApp.inoutbalance.FeeNoticeAdd" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v8.3" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dxwsc" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v8.3" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dxhe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保费通知书录入</title>
    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});
            

            window.onunload = function() {
                var pWindow = window.dialogArguments;
                var thegrid = pWindow.gridSearchResult;
                
                if (thegrid != null) {
                    thegrid.PerformCallback('');
                }
                else {
                    //do nothing
                }
            };





        });
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <table style="width:100%">
        <tr>
            <td style="width:12%;text-align:right;">保费通知书号：</td>
            <td style="width:88%;text-align:left;" colspan="2">
                <asp:TextBox ID="txtNoticeNo" runat="server" Width="250px"></asp:TextBox> 
            </td>
        </tr>
        <tr>
            <td style="width:12%;text-align:right;">保费通知日期：</td>
            <td style="width:88%;text-align:left;" colspan="2">
                <dxe:ASPxDateEdit ID="deNoticeDate" runat="server"></dxe:ASPxDateEdit> 
            </td>
        </tr>
        <tr>
            <td style="width:12%;text-align:right; vertical-align:top;">相关保单编号：</td>
            <td style="width:18%;text-align:left;">
                <asp:ListBox runat="server" ID="lbPolicyNo" Width="180px">                    
                </asp:ListBox>
            </td>
            <td style="width:70%;text-align:left;">
                <table>
                    <tr>
                        <td>
                            <dxe:ASPxButton runat="server" ID="btnadd" Text="添加" AutoPostBack="false"></dxe:ASPxButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dxe:ASPxButton runat="server" ID="btnRemove" Text="移除" AutoPostBack="false"></dxe:ASPxButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width:12%;text-align:right; vertical-align:top;">&nbsp;</td>
            <td style="width:88%;text-align:left; vertical-align:top;" colspan="2">
                <dxe:ASPxButton runat="server" ID="btnMake" Text="生成保费通知书" AutoPostBack="false"></dxe:ASPxButton>
            </td>
        </tr>
        <tr>
            <td style="width:12%;text-align:right;"></td>
            <td style="width:88%;text-align:left;" colspan="2">                                                
            <dxhe:ASPxHtmlEditor id="htmlEditorpostilecontent" runat="server" EnableTheming="true" height="300px" width="600px">
                 <settingsimageupload uploadimagefolder="~/Features/UploadImages/">
                     <ValidationSettings AllowedContentTypes="image/jpeg,image/pjpeg,image/gif,image/png,image/x-png" MaxFileSize="500000"></ValidationSettings>
                 </settingsimageupload>
                 <toolbars> 
                    <dxhe:StandardToolbar1><Items>
                        <dxhe:ToolbarCutButton></dxhe:ToolbarCutButton>
                        <dxhe:ToolbarCopyButton></dxhe:ToolbarCopyButton>
                        <dxhe:ToolbarPasteButton></dxhe:ToolbarPasteButton>
                        <dxhe:ToolbarPasteFromWordButton></dxhe:ToolbarPasteFromWordButton>
                        <dxhe:ToolbarUndoButton BeginGroup="True"></dxhe:ToolbarUndoButton>
                        <dxhe:ToolbarRedoButton></dxhe:ToolbarRedoButton>
                        <dxhe:ToolbarRemoveFormatButton BeginGroup="True"></dxhe:ToolbarRemoveFormatButton>
                        <dxhe:ToolbarSuperscriptButton BeginGroup="True"></dxhe:ToolbarSuperscriptButton>
                        <dxhe:ToolbarSubscriptButton></dxhe:ToolbarSubscriptButton>
                        <dxhe:ToolbarInsertOrderedListButton BeginGroup="True"></dxhe:ToolbarInsertOrderedListButton>
                        <dxhe:ToolbarInsertUnorderedListButton></dxhe:ToolbarInsertUnorderedListButton>
                        <dxhe:ToolbarIndentButton BeginGroup="True"></dxhe:ToolbarIndentButton>
                        <dxhe:ToolbarOutdentButton></dxhe:ToolbarOutdentButton>
                        <dxhe:ToolbarInsertLinkDialogButton BeginGroup="True"></dxhe:ToolbarInsertLinkDialogButton>
                        <dxhe:ToolbarUnlinkButton></dxhe:ToolbarUnlinkButton>
                        <dxhe:ToolbarInsertImageDialogButton></dxhe:ToolbarInsertImageDialogButton>
                        <dxhe:ToolbarPrintButton BeginGroup="True"></dxhe:ToolbarPrintButton>
                        </Items>
                    </dxhe:StandardToolbar1> 
                    <dxhe:StandardToolbar2>
                        <Items>
                            <dxhe:ToolbarParagraphFormattingEdit Width="120px">
                                <Items>
                                    <dxhe:ToolbarListEditItem Text="Normal" Value="p"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="Heading  1" Value="h1"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="Heading  2" Value="h2"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="Heading  3" Value="h3"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="Heading  4" Value="h4"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="Heading  5" Value="h5"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="Heading  6" Value="h6"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="Address" Value="address"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="Normal (DIV)" Value="div"></dxhe:ToolbarListEditItem>
                                </Items>
                            </dxhe:ToolbarParagraphFormattingEdit>
                            <dxhe:ToolbarFontNameEdit>
                                <Items>
                                    <dxhe:ToolbarListEditItem Text="Times New Roman" Value="Times New Roman"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="Tahoma" Value="Tahoma"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="Verdana" Value="Verdana"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="Arial" Value="Arial"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="MS Sans Serif" Value="MS Sans Serif"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="Courier" Value="Courier"></dxhe:ToolbarListEditItem>
                                </Items>
                            </dxhe:ToolbarFontNameEdit>
                            <dxhe:ToolbarFontSizeEdit>
                                <Items>
                                    <dxhe:ToolbarListEditItem Text="1 (8pt)" Value="1"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="2 (10pt)" Value="2"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="3 (12pt)" Value="3"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="4 (14pt)" Value="4"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="5 (18pt)" Value="5"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="6 (24pt)" Value="6"></dxhe:ToolbarListEditItem>
                                    <dxhe:ToolbarListEditItem Text="7 (36pt)" Value="7"></dxhe:ToolbarListEditItem>
                                </Items>
                            </dxhe:ToolbarFontSizeEdit>
                            <dxhe:ToolbarBoldButton BeginGroup="True"></dxhe:ToolbarBoldButton>
                            <dxhe:ToolbarItalicButton></dxhe:ToolbarItalicButton>
                            <dxhe:ToolbarUnderlineButton></dxhe:ToolbarUnderlineButton>
                            <dxhe:ToolbarStrikethroughButton></dxhe:ToolbarStrikethroughButton>
                            <dxhe:ToolbarJustifyLeftButton BeginGroup="True"></dxhe:ToolbarJustifyLeftButton>
                            <dxhe:ToolbarJustifyCenterButton></dxhe:ToolbarJustifyCenterButton>
                            <dxhe:ToolbarJustifyRightButton></dxhe:ToolbarJustifyRightButton>
                            <dxhe:ToolbarJustifyFullButton></dxhe:ToolbarJustifyFullButton>
                            <dxhe:ToolbarBackColorButton BeginGroup="True"></dxhe:ToolbarBackColorButton>
                            <dxhe:ToolbarFontColorButton></dxhe:ToolbarFontColorButton>
                        </Items>
                    </dxhe:StandardToolbar2>             
                 </toolbars>
            </dxhe:ASPxHtmlEditor>                                                
            
            </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td style="width:12%;text-align:right; vertical-align:top;">&nbsp;</td>
            <td style="width:12%;text-align:left;">
                <dxe:ASPxButton runat="server" ID="btnSave" Text="保存保费通知书" AutoPostBack="false"></dxe:ASPxButton>
            </td>
            <td style="width:76%;text-align:left;" >
                <dxe:ASPxButton runat="server" ID="btnClose" Text="退出" AutoPostBack="false"></dxe:ASPxButton>
            </td>
        </tr>
    </table>
       
    
    
</asp:Content>
