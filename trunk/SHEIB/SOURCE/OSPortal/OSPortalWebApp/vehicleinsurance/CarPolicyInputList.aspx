<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="CarPolicyInputList.aspx.cs" Inherits="OSPortalWebApp.vehicleinsurance.CarPolicyInputList" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
	    $(document).ready(function() {
	        //jQuery.noticeAdd({
	        //    text: 'This is a notification that you have to remove',
	        //    stay: true
	        //});
	    });
	    function menuClick(url) {
	        if (url == "CarPolicyInputList.aspx")
            {
                //window.location.href = url;
                gridSearchResult.PerformCallback('');
            }
            else
            {
                var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
                window.showModalDialog("CarPolicyInput.aspx", "", myArguments);
            }
	    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <table style="width:100%">
                    <tr>
                        <td style="height:40px;">
                            <dxm:ASPxMenu EnableViewState="False" EncodeHtml="False" id="dpASPxMenu" runat="server" AllowSelectItem="True" Orientation="Horizontal">
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
                                    <dxm:MenuItem Text="录入列表" Selected="true" Name="forminputlist.aspx"></dxm:MenuItem>
                                    <dxm:MenuItem Text="新    建" Name="forminput.aspx"></dxm:MenuItem>
                                </Items>
                            </dxm:ASPxMenu>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;"> 
                            <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float: left;">所属项目</div>
                                    <div style="float: left; margin-left: 20px;">
                                        <asp:Label ID="lbl_npSearchHeader" runat="server">(展开)</asp:Label>
                                    </div>
                                    <div style="float: right; vertical-align: middle;">
                                        <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                </div>
                            </asp:Panel>                           
                            <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                                <table>
                                    <tr>
                                        <td>                                        
                                            <table>
                                                <tr>
                                                    <td style="width:15px;text-align:right;">
                                                        
                                                    </td>
                                                    <td style="width:60px;text-align:right;">保单编号：</td>
                                                    <td style="width:255px;text-align:left;" colspan="3"><asp:TextBox ID="txtPolicyNo" runat="server" Width="200px"></asp:TextBox></td>
                                                    
                                                    <td style="width:60px;text-align:right;">部门：</td>
                                                    <td style="width:180px;text-align:left;" colspan="2">
                                                        <asp:DropDownList runat="server" ID="ddlDeptId">
                                                            <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:120px;text-align:right;" colspan="2">
                                                        &nbsp;</td>
                                                    <td style="width:130px;text-align:left;" colspan="2">
                                                        &nbsp;</td>
                                                </tr> 
                                                <tr>
                                                    <td style="width:15px;text-align:right;">
                                                        
                                                    </td>
                                                    <td style="width:60px;text-align:right;">投保客户：</td>
                                                    <td style="width:255px;text-align:left;" colspan="3"><asp:TextBox ID="txtCustomer" runat="server" Width="200px"></asp:TextBox></td>
                                                    <td style="width:70px;text-align:right;">保险险种：</td>
                                                    <td style="width:180px;text-align:left;" colspan="3">
                                                        <asp:DropDownList runat="server" ID="ddlProdTypeID">
                                                            <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:60px;text-align:right;">客户经理：</td>
                                                    <td style="width:60px;text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlSalesId">
                                                            <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:120px;text-align:left;">
                                                        <asp:Button ID="btnSalesIdSearch" runat="server" Text="检索" CssClass="input_2" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width:15px;text-align:right;">
                                                        <asp:CheckBox runat="server" ID="chkSignDate" Text="" />
                                                    </td>
                                                    <td style="width:60px;text-align:right;">投保日期：</td>
                                                    <td style="width:120px;text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deSignStartDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="width:15px;text-align:right;">
                                                        至
                                                    </td>
                                                    <td style="width:120px;text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deSignEndDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>                                                    
                                                    <td style="width:70px;text-align:right;">保额：</td>
                                                    <td style="width:60px;text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlCoverageOperation">
                                                            <asp:ListItem Text="大于等于" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:120px;text-align:left;" colspan="2">
                                                        <asp:TextBox runat="server" ID="txtCoverage" Width="100px"></asp:TextBox>
                                                    </td>
                                                    <td style="width:60px;text-align:right;">业务来源：</td>
                                                    <td style="width:120px;text-align:left;" colspan="2">
                                                        <asp:DropDownList runat="server" ID="ddlSourceTypeID">
                                                            <asp:ListItem Text="来源1" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>                                                    
                                                </tr>
                                                <tr>
                                                    <td style="width:15px;text-align:right;">
                                                        <asp:CheckBox runat="server" ID="chkStartDate" Text="" />
                                                    </td>
                                                    <td style="width:60px;text-align:right;">起保日期：</td>
                                                    <td style="width:120px;text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deStartStartDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="width:15px;text-align:right;">
                                                        至
                                                    </td>
                                                    <td style="width:120px;text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deStartEndDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">保费：</td>
                                                    <td style="width:60px;text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlFeeOperation">
                                                            <asp:ListItem Text="大于等于" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:120px;text-align:left;" colspan="2">
                                                        <asp:TextBox runat="server" ID="txtFee" Width="100px"></asp:TextBox>
                                                    </td>
                                                    <td style="width:60px;text-align:right;">&nbsp;</td>
                                                    <td style="width:120px;text-align:left;" colspan="2">
                                                        &nbsp;</td>
                                                </tr> 
                                                <tr>
                                                    <td style="width:15px;text-align:right;">
                                                        <asp:CheckBox runat="server" ID="chkEndDate" Text="" />
                                                    </td>
                                                    <td style="width:60px;text-align:right;">终止日期：</td>
                                                    <td style="width:120px;text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deEndStartDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="width:15px;text-align:right;">
                                                        至
                                                    </td>
                                                    <td style="width:120px;text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deEndEndDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">交费：</td>
                                                    <td style="width:60px;text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlPayFeeType">
                                                            <asp:ListItem Text="(全部)" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:60px;text-align:right;">&nbsp;</td>
                                                    
                                                    <td style="width:60px;text-align:left;">
                                                        &nbsp;</td>
                                                    <td style="width:60px;text-align:right;">&nbsp;</td>
                                                    <td style="width:120px;text-align:left;" colspan="2">
                                                        &nbsp;</td>
                                                </tr>                                                     
                                                <tr>
                                                    <td style="width:15px;text-align:right;">
                                                        <asp:CheckBox runat="server" ID="chkCreateDate" Text="" />
                                                    </td>
                                                    <td style="width:60px;text-align:right;">录单日期：</td>
                                                    <td style="width:120px;text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deCreateStartDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="width:15px;text-align:right;">
                                                        至
                                                    </td>
                                                    <td style="width:120px;text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deCreateEndDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">保单状态：</td>
                                                    <td style="width:60px;text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlFlagAudited">
                                                            <asp:ListItem Text="录入" Value="0"></asp:ListItem>
                                                            <asp:ListItem Value="1">审核</asp:ListItem>
                                                            <asp:ListItem Value="2">已审核</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:60px;text-align:right;">&nbsp;</td>
                                                    
                                                    <td style="width:60px;text-align:left;">
                                                        &nbsp;</td>
                                                    <td style="width:60px;text-align:right;">&nbsp;</td>
                                                    <td style="width:120px;text-align:left;" colspan="2">
                                                        &nbsp;</td>
                                                </tr>                                                
                                                <tr>
                                                    <td style="width:15px;text-align:right;">
                                                        &nbsp;</td>
                                                    <td style="width:60px;text-align:right;">&nbsp;</td>
                                                    <td style="width:120px;text-align:left;">
                                                        &nbsp;</td>
                                                    <td style="width:15px;text-align:right;">
                                                        &nbsp;</td>
                                                    <td style="width:120px;text-align:left;">
                                                        &nbsp;</td>
                                                    <td style="width:70px;text-align:right;">&nbsp;</td>
                                                    <td style="width:60px;text-align:left;">
                                                        &nbsp;</td>
                                                    <td style="width:120px;text-align:left;" colspan="2">
                                                        &nbsp;</td>
                                                    
                                                    <td style="width:60px;text-align:right;">&nbsp;</td>
                                                    <td style="width:120px;text-align:left;" colspan="2">
                                                        &nbsp;</td>
                                                </tr>                                               
                                                                                                
                                                <tr>
                                                    <td style="width:15px;text-align:right;">
                                                        
                                                    </td>
                                                    <td style="width:60px;text-align:right;">保险公司：</td>
                                                    <td style="width:255px;text-align:left;" colspan="3">
                                                        <asp:DropDownList runat="server" ID="ddlCarrierId">
                                                            <asp:ListItem Text="中国平安保险公司" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>                                                    
                                                    <td style="width:70px;text-align:right;">投保编号：</td>
                                                    <td style="width:180px;text-align:left;" colspan="3">
                                                        <asp:TextBox runat="server" ID="txtPrePolicyNo" Width="100px"></asp:TextBox>
                                                    </td>
                                                    
                                                    <td style="width:60px;text-align:right;">&nbsp;</td>
                                                    <td style="width:120px;text-align:left;" colspan="2">
                                                        &nbsp;</td>
                                                </tr> 
                                                                                                
                                                <tr>
                                                    <td style="width:15px;text-align:right;">
                                                        
                                                    </td>
                                                    <td style="width:60px;text-align:right;">分支机构：</td>
                                                    <td style="width:255px;text-align:left;" colspan="3">
                                                        <asp:DropDownList runat="server" ID="ddlBranchId">
                                                            <asp:ListItem Text="中国平安保险公司" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>                                                    
                                                    <td style="width:70px;text-align:right;">&nbsp;</td>
                                                    <td style="width:180px;text-align:left;" colspan="3">
                                                        &nbsp;</td>
                                                    
                                                    <td style="width:180px;text-align:right;" colspan="3">
                                                        <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" />&nbsp;
                                                        <asp:Button ID="btnCancel" runat="server" Text="重置" CssClass="input_2" />&nbsp;
                                                        <asp:Button ID="btnRefresh" runat="server" Text="刷新" CssClass="input_2" />
                                                    </td>
                                                    
                                                </tr>
                                                    
                                                                                               
                                            </table>
                                        </td>
                                        <td>
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
                                ExpandedText="(隐藏)"
                                CollapsedText="(展开)"
                                ExpandedImage="~/images/collapse_blue.jpg"
                                CollapsedImage="~/images/expand_blue.jpg"
                                SuppressPostBack="true" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;">
                            <asp:Panel ID="npSearchResultHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float: left;">搜索结果</div>
                                    <div style="float: left; margin-left: 20px;">
                                        <asp:Label ID="lbl_npSearchResultHeader" runat="server">(展开)</asp:Label>
                                    </div>
                                    <div style="float: right; vertical-align: middle;">
                                        <asp:ImageButton ID="img_npSearchResultHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                </div>
                            </asp:Panel>  
                            <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width:100%">
                                           <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server" 
                                                    DataSourceID="dsSearchItems"
                                                    KeyFieldName="ID" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true" 
                                                    >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="Code" Caption="保单编号" VisibleIndex="1">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="投保编号" VisibleIndex="30">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="客户经理" VisibleIndex="18">                                                                   
                                                                </dxwgv:GridViewDataColumn>      
                                                                <dxwgv:GridViewDataColumn FieldName="Caption" Caption="保险公司" VisibleIndex="2">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Premium" Caption="险种" VisibleIndex="3">                                                                    
                                                                </dxwgv:GridViewDataColumn>                                
                                                                <dxwgv:GridViewDataColumn FieldName="Fee" Caption="币种" VisibleIndex="5">                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProcessRate" Caption="保额" VisibleIndex="6">   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="保费(原)" VisibleIndex="7">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="保费(本)" VisibleIndex="8">                                                                   
                                                                </dxwgv:GridViewDataColumn>              
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="已收保费" VisibleIndex="13">                                                                   
                                                                </dxwgv:GridViewDataColumn>         
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="已解付保费" VisibleIndex="13">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                     
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="应收经纪费" VisibleIndex="12">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="已收经纪费" VisibleIndex="13">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="投保日期" VisibleIndex="16">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="投保客户" VisibleIndex="17">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                         
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="业务来源" VisibleIndex="20">                                                                   
                                                                </dxwgv:GridViewDataColumn>          
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="业务性质" VisibleIndex="20">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="收款方式" VisibleIndex="20">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                        
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="审核" VisibleIndex="25">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="录单人" VisibleIndex="26">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="录单日期" VisibleIndex="27">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                                                                                                                                                            
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="审核人" VisibleIndex="32">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="审核日期" VisibleIndex="27">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="保险开始日" VisibleIndex="34">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="" Caption="保险终止日" VisibleIndex="36">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowAllRecords"/>
                                                        <Settings ShowGroupPanel="false" />
                                                        <ClientSideEvents />
                                                        <SettingsText 
                                                            EmptyDataRow="没有数据" />
                                                    </dxwgv:ASPxGridView>
                                                    <asp:ObjectDataSource ID="dsSearchItems" Runat="server" TypeName="OSPortalWebApp.PolicyItem"
                                                        SelectMethod="GetPolicyItems" 
                                                        DataObjectTypeName="OSPortalWebApp.PolicyItem" >
                                                        <SelectParameters>
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
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
                                ExpandedText="(隐藏)"
                                CollapsedText="(展开)"
                                ExpandedImage="~/images/collapse_blue.jpg"
                                CollapsedImage="~/images/expand_blue.jpg"
                                SuppressPostBack="true" />
                        </td>
                    </tr>                    
     </table>
     
     
</asp:Content>
