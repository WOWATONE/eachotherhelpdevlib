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
                                
                                <table style="width:1000px;">
                                                <tr>
                                                    <td style="width:80px;text-align:right;">保单编号：</td>
                                                    <td style="width:110px;text-align:left;">
                                                        <asp:TextBox ID="txtPolicyNo" runat="server" Width="100px"></asp:TextBox>
                                                    </td>                                                    
                                                    <td style="width:70px;text-align:right;">部门：</td>
                                                    <td style="width:110px;text-align:left;">
                                                        <asp:DropDownList ID="ddlDeptId" runat="server">
                                                            <asp:ListItem Text="部门1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="部门2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="部门3" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">客户经理：</td>
                                                    <td style="width:110px;text-align:left;"> 
                                                        <asp:DropDownList ID="ddlSaleID" runat="server">
                                                            <asp:ListItem Text="经理" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="经理" Value="2"></asp:ListItem>
                                                        </asp:DropDownList>                                                       
                                                    </td>
                                                    <td style="width:120px;text-align:right;">经纪费收取方式：</td>
                                                    <td style="width:110px;text-align:left;"> 
                                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                                            <asp:ListItem Text="方式1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="方式2" Value="2"></asp:ListItem>
                                                        </asp:DropDownList>                                                       
                                                    </td>
                                                    <td></td>                                                     
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;">保险公司：</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList ID="DropDownList2" runat="server">
                                                            <asp:ListItem Text="平安保险" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="人寿保险" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="泰康保险" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>                                                    
                                                    <td style="text-align:right;">分支机构：</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList ID="DropDownList4" runat="server">
                                                            <asp:ListItem Text="平安1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="平安2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="平安3" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align:right;">收款方式：</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList ID="DropDownList5" runat="server">
                                                            <asp:ListItem Text="方式1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="方式2" Value="2"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td> 
                                                    <td></td>
                                                    <td></td> 
                                                    <td></td>                                                  
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;">解付日期：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deGetStartDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>                                                    
                                                    <td style="text-align:right;">至</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deGetEndDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td> 
                                                    <td style="text-align:left;" colspan="2">
                                                        <asp:CheckBox runat="server" ID="CheckBox1" Text="仅显示已收费未解付保单" />
                                                    </td>
                                                    <td></td>
                                                    <td></td>                                                    
                                                    <td></td>                                                                                                 
                                                </tr>                                                                                               
                                                <tr>
                                                    <td style="text-align:right;"></td>
                                                    <td style="text-align:left;"></td>
                                                    <td style="text-align:right;"></td>
                                                    <td style="text-align:left;"></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td style="text-align:left;" colspan="2">
                                                        <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" />&nbsp;
                                                        <asp:Button ID="btnCancel" runat="server" Text="重置" CssClass="input_2" />
                                                    </td>
                                                    <td>&nbsp;</td> 
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
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False">
                                                                    <NewButton Visible="False" />
                                                                    <EditButton Visible="false" />                                                                    
                                                                    <DeleteButton Visible="false" />
                                                                    <SelectButton Visible="true"></SelectButton>                                                                                                                       
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="F1" Caption="保险公司" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="F2" Caption="分支机构" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="NoticeNo" Caption="解付单号" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="NoticeNo" Caption="投保编号" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="NoticeNo" Caption="保单编号" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="NoticeDate" Caption="解付日期" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">                                                                   
                                                                </dxwgv:GridViewDataDateColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="F3" Caption="状态" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="FeeTypeName" Caption="收款方式" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="FeeTypeName" Caption="经纪费收取方式" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Fee" Caption="经纪费" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="F4" Caption="客户经理" CellStyle-Wrap="False">                                                                   
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
