<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="formpostil.aspx.cs" Inherits="OSPortalWebApp.otherinsurance.formpostil" %>
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
    <link rel="stylesheet" type="text/css" href="../css/ie.css" />
    <script src="../js/jquery-1.3.2.js" type="text/javascript"></script>
	<script src="../js/jquerynotice/jquery.notice.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/jquery-ui-1.7.1.custom.min.js"></script>
    <script type="text/javascript" src="../js/ui.datepicker-zh-CN.js"></script>
    <link type="text/css" href="../js/css/smoothness/jquery-ui-1.7.1.custom.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="../js/jquerynotice/jquery.notice.css" />
	<script type="text/javascript">
	    $(document).ready(function() {
	        jQuery.noticeAdd({
	            text: 'This is a notification that you have to remove',
	            stay: true
	        });
	    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
                <table style="width:99%">
                    <tr>
                        <td style="width:100%;"> 
                            <asp:Panel ID="npbasicheader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float: left;">基本数据</div>
                                    <div style="float: left; margin-left: 20px;">
                                        <asp:Label ID="lbl_npbasicheader" runat="server">(展开)</asp:Label>
                                    </div>
                                    <div style="float: right; vertical-align: middle;">
                                        <asp:ImageButton ID="img_npbasicheader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                </div>
                            </asp:Panel>                           
                            <asp:Panel ID="npbasicdetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width:100%">
                                            <tr>
                                                <td style="width:8%;text-align:right;">保单编号：</td>
                                                <td style="width:25%;text-align:left;"><asp:TextBox ID="txtSN" runat="server" Width="200px"></asp:TextBox></td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:25%;text-align:left;">
                                                    <dxe:ASPxButton AutoPostBack="False" runat="server" ID="btnInsuranceDetail" Text="查看保单" style="margin: 0px;">
                                                        <ClientSideEvents Click="function(s, e) {return false;}" />
                                                    </dxe:ASPxButton>
                                                    <dxpc:ASPxPopupControl ID="popuppanelInsuranceDetail" runat="server" 
                                                        EnableClientSideAPI="True" AllowDragging="False" PopupHorizontalAlign="Center" 
                                                        HeaderText="保单详细" 
                                                        Width="360px" Height="320px" 
                                                        EnableTheming="true"  PopupElementID="btnInsuranceDetail"
                                                        AllowResize="false" Modal="true">
                                                        <Border BorderWidth="1px" />
                                                     </dxpc:ASPxPopupControl>
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:8%;text-align:right;">批单编号：</td>
                                                <td style="width:25%;text-align:left;"><asp:TextBox ID="txtpostilID" runat="server" Width="200px"></asp:TextBox></td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:25%;text-align:left;">
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:8%;text-align:right;">投保人：</td>
                                                <td style="width:25%;text-align:left;"><asp:TextBox ID="txtpeoplefrom" runat="server" Width="154px" Text="张三"></asp:TextBox>&nbsp;&nbsp;
                                                </td>
                                                <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkTogether" runat="server" /></td>
                                                <td style="width:25%;text-align:left;">
                                                    <dxe:ASPxButton AutoPostBack="False" runat="server" ID="btnpartnerInsurance" Text="共  保" style="margin: 0px;">
                                                        <ClientSideEvents Click="function(s, e) {return false;}" />
                                                    </dxe:ASPxButton>
                                                    <dxpc:ASPxPopupControl ID="popupPanelpartnerInsurance" runat="server" 
                                                        EnableClientSideAPI="True" AllowDragging="False" PopupHorizontalAlign="Center" 
                                                        HeaderText="共保" 
                                                        Width="360px" Height="320px" 
                                                        EnableTheming="true"  PopupElementID="btnpartnerInsurance"
                                                        AllowResize="false" Modal="true">
                                                        <Border BorderWidth="1px" />
                                                     </dxpc:ASPxPopupControl>
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:8%;text-align:right;">被保险人：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlpeopleto" runat="server">
                                                        <asp:ListItem Text="张三" Value="1" Selected ></asp:ListItem>
                                                        <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="王五" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkStage" runat="server" /></td>
                                                <td style="width:25%;text-align:left;">                                                    
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:8%;text-align:right;">保险公司：</td>
                                                <td style="width:25%;text-align:left;">
                                                <asp:DropDownList ID="ddlCompany" runat="server">
                                                    <asp:ListItem Text="平安保险" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="人寿保险" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="泰康保险" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">分支机构：</td>
                                                <td style="width:25%;text-align:left;">
                                                <asp:DropDownList ID="DropDownList1" runat="server">
                                                    <asp:ListItem Text="平安1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="平安2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="平安3" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;">                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:8%;text-align:right;">保险险种：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlCategory" runat="server">
                                                    <asp:ListItem Text="保险1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="保险2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="保险3" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">客户经理：</td>
                                                <td>
                                                     <asp:TextBox ID="txtSalesId" runat="server" Width="100px"></asp:TextBox>                                                  
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    
                                                </td>
                                            </tr>

                                        </table>
                                        
                                     
                             </asp:Panel>
                             <ajaxToolkit:CollapsiblePanelExtender ID="cpeBasic" runat="Server"
                                TargetControlID="npbasicdetail"
                                ExpandControlID="npbasicheader"
                                CollapseControlID="npbasicheader" 
                                Collapsed="false"
                                TextLabelID="lbl_npbasicheader"
                                ImageControlID="img_npbasicheader"    
                                ExpandedText="(隐藏)"
                                CollapsedText="(展开)"
                                ExpandedImage="~/images/collapse_blue.jpg"
                                CollapsedImage="~/images/expand_blue.jpg"
                                SuppressPostBack="true" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;">
                            <asp:Panel ID="nppostilecontentHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float: left;">批改内容</div>
                                    <div style="float: left; margin-left: 20px;">
                                        <asp:Label ID="lbl_nppostilecontentHeader" runat="server">(展开)</asp:Label>
                                    </div>
                                    <div style="float: right; vertical-align: middle;">
                                        <asp:ImageButton ID="img_nppostilecontentHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                </div>
                            </asp:Panel>  
                            <asp:Panel ID="nppostilecontentDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width:100%">
                                            <tr>
                                                <td>
                                                
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
                                        </table>
       
                             </asp:Panel>
                             <ajaxToolkit:CollapsiblePanelExtender ID="cpepostilecontent" runat="Server"
                                TargetControlID="nppostilecontentDetail"
                                ExpandControlID="nppostilecontentHeader"
                                CollapseControlID="nppostilecontentHeader" 
                                Collapsed="false"
                                TextLabelID="lbl_nppostilecontentHeader"
                                ImageControlID="img_nppostilecontentHeader"    
                                ExpandedText="(隐藏)"
                                CollapsedText="(展开)"
                                ExpandedImage="~/images/collapse_blue.jpg"
                                CollapsedImage="~/images/expand_blue.jpg"
                                SuppressPostBack="true" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;">
                            <asp:Panel ID="npOtherPolicyItemHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float: left;">其它项目</div>
                                    <div style="float: left; margin-left: 20px;">
                                        <asp:Label ID="lbl_npOtherPolicyItemHeader" runat="server">(展开)</asp:Label>
                                    </div>
                                    <div style="float: right; vertical-align: middle;">
                                        <asp:ImageButton ID="img_npOtherPolicyItemHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                </div>
                            </asp:Panel> 
                            <asp:Panel ID="npOtherPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width:100%">
                                            <tr>
                                                <td style="width:11%;text-align:right;">保额：</td>
                                                <td style="width:22%;text-align:left;">
                                                    <asp:TextBox ID="txtprice" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:11%;text-align:right;">费率：</td>
                                                <td style="width:22%;text-align:left;">
                                                    <asp:TextBox ID="txtrate" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:11%;text-align:right;">保费：</td>
                                                <td style="width:20%;text-align:left;">
                                                    <asp:TextBox ID="txtfee" runat="server" Width="140px"></asp:TextBox>
                                                </td>                                  
                                            </tr>                                            
                                            <tr>
                                                <td style="width:8%;text-align:right;">经纪费率：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtmiddlerate" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;">经纪费：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtmiddlefee" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;">
                                                    
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">原批单链接：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtfile" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:25%;text-align:left;">
                                                    
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;">
                                                    
                                                </td>                                  
                                            </tr>                                            
                                            <tr>
                                                <td style="width:8%;text-align:right;">录单人：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtCreatePerson" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;">录单日期：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtCreateTime" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;">
                                                    
                                                </td>                                  
                                            </tr>                                            
                                        </table>
                                        
                             </asp:Panel>
                             <ajaxToolkit:CollapsiblePanelExtender ID="cpeOtherPolicyItem" runat="Server"
                                TargetControlID="npOtherPolicyItemDetail"
                                ExpandControlID="npOtherPolicyItemHeader"
                                CollapseControlID="npOtherPolicyItemHeader" 
                                Collapsed="false"
                                TextLabelID="lbl_npOtherPolicyItemHeader"
                                ImageControlID="img_npOtherPolicyItemHeader"    
                                ExpandedText="(隐藏)"
                                CollapsedText="(展开)"
                                ExpandedImage="~/images/collapse_blue.jpg"
                                CollapsedImage="~/images/expand_blue.jpg"
                                SuppressPostBack="true" />
                            </td>
                        </tr>
                    </table>
                    
    
    
    <table style="height:5px; background-color:#E0EDFF; width:100%; font-size:2px;"><tr><td></td></tr></table>
    
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="25px">
                <table style="width:100%">
                    <tr>
                        <td style="text-align:right;">
                            <asp:Button ID="btnsave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnaudit" runat="server" Text="提交" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btncancel" runat="server" Text="取消" CssClass="input_2" />
                        </td>  
                        <td style="width:20px;text-align:left;">
                            &nbsp;
                        </td>                                                                  
                    </tr>
                </table>
                
     </asp:Panel>
     
</asp:Content>
