<%@ Page Title="经纪费开票选择" Language="C#" Theme="Aqua" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" CodeBehind="FeePayinInvoiceAddSelect.aspx.cs" Inherits="OSPortalWebApp.inoutbalance.FeePayinInvoiceAddSelect" %>
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
    <title>经纪费开票选择</title>
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
        
        function imgSearchClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=450px;center=yes;help=no";
            window.showModalDialog("FeeCustomerPolicySelect.aspx", self, myArguments);
            gridPolicyItem.PerformCallback('');
        }
        
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <table style="width:100%">                    
                    <tr>
                        <td style="width:100%;" colspan="2"> 
                            <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float: left; vertical-align: middle;">
                                        <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                    <div style="float:left; margin-left:5px;">检索条件</div>
                                    <div style="float:left; margin-left:5px;">
                                        <asp:Label ID="lbl_npSearchHeader" runat="server">(展开)</asp:Label>
                                    </div>
                                    
                                </div>
                            </asp:Panel>                           
                            <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                                <table style="width:100%;">
                                                <tr>
                                                    <td style="width:90px;text-align:right; white-space:nowrap;">解付单编号：</td>
                                                    <td style="width:100px;text-align:left;">
                                                        <asp:TextBox ID="txtPolicyNo" runat="server" Width="95px"></asp:TextBox>
                                                    </td>
                                                    <td style="width:20px;"></td>
                                                    <td style="width:120px;text-align:right;white-space:nowrap;">保单编号：</td>
                                                    <td style="width:100px;text-align:left;">
                                                        <asp:TextBox ID="txtPrePolicyNo" runat="server" Width="95px"></asp:TextBox>
                                                    </td>
                                                    <td style="width:160px;text-align:right;white-space:nowrap;">付费方式：</td> 
                                                    <td style="width:100px;text-align:left;">                                                        
                                                        <asp:DropDownList ID="ddlFeeType" runat="server">
                                                            <asp:ListItem Text="内扣经纪费 Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="不内扣经纪费" Value="2"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td></td>                                                   
                                                </tr>    
                                                <tr>
                                                    <td style="width:90px;text-align:right; white-space:nowrap;">保险公司：</td>
                                                    <td style="width:100px;text-align:left;">                                                        
                                                        <asp:DropDownList ID="DropDownList2" runat="server">
                                                            <asp:ListItem Text="中国平安" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="中国人寿" Value="2"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:20px;"></td>
                                                    <td style="width:120px;text-align:right;white-space:nowrap;">
                                                        <span style="font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;
mso-bidi-language:AR-SA">投保客户：</span></td>
                                                    <td style="width:100px;text-align:left;">
                                                        
                                                        <asp:TextBox ID="txtPrePolicyNo0" runat="server" Width="95px"></asp:TextBox>
                                                        
                                                    </td>
                                                    <td style="width:160px;text-align:right;white-space:nowrap;">通知书编号：</td> 
                                                    <td style="width:100px;text-align:left;">                                                        
                                                        <asp:TextBox ID="TextBox1" runat="server" Width="95px"></asp:TextBox>
                                                    </td>
                                                    <td></td>                                                   
                                                </tr>                                               
                                                <tr>
                                                    <td style="text-align:right;">解付日期：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deStartDate" runat="server">
                                                        </dxe:ASPxDateEdit>                                                       
                                                    </td>
                                                    <td style="text-align:right;">至</td>
                                                    <td style="text-align:left;" colspan="2">
                                                        <dxe:ASPxDateEdit ID="deEndDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="text-align:right;" colspan="2">
                                                        <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" />&nbsp;
                                                        <asp:Button ID="btnCancel" runat="server" Text="重置" CssClass="input_2" />&nbsp;
                                                        <asp:Button ID="btnRefresh" runat="server" Text="刷新" CssClass="input_2" />
                                                    </td>
                                                </tr>                                          
                                            </table>
                                     
                             </asp:Panel>
                             <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearch" runat="Server"
                                TargetControlID="npSearchDetail"
                                ExpandControlID="npSearchHeader"
                                CollapseControlID="npSearchHeader" 
                                Collapsed="false"
                                TextLabelID="lbl_npSearchHeader"
                                ImageControlID="img_npSearchHeader"    
                                ExpandedText="(展开)"
                                CollapsedText="(隐藏)"
                                ExpandedImage="~/images/collapse_blue.jpg"
                                CollapsedImage="~/images/expand_blue.jpg"
                                SuppressPostBack="true" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;" colspan="2">
                            <asp:Panel ID="npSearchResultHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float:left; vertical-align: middle;">
                                        <asp:ImageButton ID="img_npSearchResultHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                    <div style="float:left; margin-left:5px;">搜索结果</div>
                                    <div style="float:left; margin-left:5px;">
                                        <asp:Label ID="lbl_npSearchResultHeader" runat="server">(展开)</asp:Label>
                                    </div>                                    
                                </div>
                            </asp:Panel>  
                            <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width:100%">
                                           <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server" 
                                                    KeyFieldName="NoticeId" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true" 
                                                    OnRowDeleting="gridSearchResult_RowDeleting" 
                                                    OnRowDeleted="gridSearchResult_RowDeleted"
                                                    >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                                                    <NewButton Visible="False" />
                                                                    <EditButton Visible="false" />                                                                    
                                                                    <DeleteButton Visible="false" />
                                                                    <SelectButton Visible="true"></SelectButton>                                                                                                                       
                                                                </dxwgv:GridViewCommandColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="NoticeId" Visible="false" Caption="单据流水号GUID" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="NoticeNo" Caption="解付单编号" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>  
                                                                <dxwgv:GridViewDataColumn FieldName="FeeTypeName" Caption="付费方式" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Fee" Caption="解付金额" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="NoticeDate" Caption="解付日期" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowPager"   />
                                                        <Settings ShowGroupPanel="false" />
                                                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                                                        
                                                    </dxwgv:ASPxGridView>                                                    
                                                </td>
                                            </tr>
                                        </table>
       
                             </asp:Panel>
                             <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearchResult" runat="Server"
                                TargetControlID="npSearchResultDetail"
                                ExpandControlID="npSearchResultHeader"
                                CollapseControlID="npSearchResultHeader" 
                                Collapsed="false"
                                TextLabelID="lbl_npSearchResultHeader"
                                ImageControlID="img_npSearchResultHeader"    
                                ExpandedText="(展开)"
                                CollapsedText="(隐藏)"
                                ExpandedImage="~/images/collapse_blue.jpg"
                                CollapsedImage="~/images/expand_blue.jpg"
                                SuppressPostBack="true" />
                        </td>
                    </tr>                    
     </table>
    
</asp:Content>
