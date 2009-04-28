<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="PolicyCheckList.aspx.cs" Inherits="OSPortalWebApp.otherinsurance.PolicyCheckList" %>
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
	    
	        lblCurrentDate.innerHTML = makewelcomeString();
	    
	    });

	    function gridCustomButtonClick(s, e) {
	        var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
	        window.showModalDialog("PolicyInput.aspx", self, myArguments);
	    }
	    
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
					                        <td style="width:40%; color:#0E5ED5;">当前位置：非车险保单审核</td>
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
                            <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float:left; vertical-align: middle;">
                                        <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                    <div style="float:left; margin-left:5px;">所属项目</div>
                                    <div style="float:left; margin-left:5px;">
                                        <asp:Label ID="lbl_npSearchHeader" runat="server">(展开)</asp:Label>
                                    </div>
                                    
                                </div>
                            </asp:Panel>                           
                            <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                                <table>
                                    <tr>
                                        <td>                                        
                                            <table>
                                                <tr>
                                                    <td style="width:70px;text-align:right;">保单编号：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:TextBox ID="txtPolicyNo" runat="server" Width="175px"></asp:TextBox>
                                                    </td>
                                                    
                                                    <td style="width:70px;text-align:right;">投保编号：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:TextBox ID="txtPrePolicyNo" runat="server" Width="175px"></asp:TextBox>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">批单编号</td>
                                                    <td style="width:160px;text-align:left;">
                                                        <asp:TextBox ID="txtPolicyCheckNo" runat="server" Width="155px"></asp:TextBox> 
                                                    </td>                                                    
                                                </tr> 
                                                <tr>
                                                    <td style="width:70px;text-align:right;">部门：</td>
                                                    <td style="width:200px;text-align:left;">
                                                       <asp:DropDownList runat="server" ID="ddlDeptId">
                                                            <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                                        </asp:DropDownList>                                                         
                                                    </td>
                                                    <td style="width:70px;text-align:right;">客户经理：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlSalesId">
                                                            <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">投保客户：</td>
                                                    <td style="width:160px;text-align:left;">
                                                        <asp:DropDownList ID="ddlCustomerID" runat="server">
                                                            <asp:ListItem Text="张三" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="王五" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width:70px;text-align:right;">业务来源：</td>
                                                    <td style="width:200px;text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlSourceTypeID">
                                                            <asp:ListItem Text="来源1" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>                                                       
                                                    </td>
                                                    <td style="width:70px;text-align:right;">业务性质：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlFlagContinue">
                                                            <asp:ListItem Text="新增" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">险种：</td>
                                                    <td style="width:160px;text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlProdTypeID">
                                                            <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                                        </asp:DropDownList>                                                      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width:70px;text-align:right;">保险公司：</td>
                                                    <td style="width:200px;text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlCarrierId">
                                                            <asp:ListItem Text="中国平安保险公司" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>                                                       
                                                    </td>
                                                    <td style="width:70px;text-align:right;">分支机构：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlBranchId">
                                                            <asp:ListItem Text="中国平安保险公司" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">保单状态：</td>
                                                    <td style="width:160px;text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlFlagAudited">
                                                            <asp:ListItem Text="审核" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>                                                      
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width:70px;text-align:right;">开始日期：</td>
                                                    <td style="width:200px;text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deStartDate" runat="server">
                                                        </dxe:ASPxDateEdit>                                                       
                                                    </td>
                                                    <td style="width:70px;text-align:right;">结束日期：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deEndDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">录单人：</td>
                                                    <td style="width:160px;text-align:left;">
                                                        <asp:TextBox ID="txtCreatePerson" runat="server" Width="155px"></asp:TextBox> 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width:70px;text-align:right;"></td>
                                                    <td style="width:200px;text-align:left;"></td>
                                                    <td style="width:70px;text-align:right;"></td>
                                                    <td style="width:180px;text-align:left;"></td>
                                                    <td style="width:230px;text-align:right;" colspan="2">
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
                                                    KeyFieldName="PolicyNo" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true" 
                                                    OnRowDeleting="gridSearchResult_RowDeleting" 
                                                    OnRowDeleted="gridSearchResult_RowDeleted"
                                                    >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                                                    <NewButton Visible="False" />
                                                                    <EditButton Visible="False" />                                                                    
                                                                    <DeleteButton Visible="true" />
                                                                    <CustomButtons>
                                                                        <dxwgv:GridViewCommandColumnCustomButton Text="审核">                                                                            
                                                                        </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                                                    </CustomButtons>                                                   
                                                                </dxwgv:GridViewCommandColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="保单编号" VisibleIndex="1" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PrePolicyNo" Caption="投保编号" VisibleIndex="2" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="Sales" Caption="客户经理" VisibleIndex="3" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>      
                                                                <dxwgv:GridViewDataColumn FieldName="Carrier" Caption="保险公司" VisibleIndex="4" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Branch" Caption="分支机构" VisibleIndex="5" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>                                
                                                                <dxwgv:GridViewDataColumn FieldName="ProdType" Caption="险种" VisibleIndex="6" CellStyle-Wrap="False"> 
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Coverage" Caption="保额" VisibleIndex="7" CellStyle-Wrap="False">   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PremiumStandard" Caption="保费（原）" VisibleIndex="8" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Currency" Caption="币种" VisibleIndex="9" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>              
                                                                <dxwgv:GridViewDataColumn FieldName="PremiumBase" Caption="保费（本）" VisibleIndex="10" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>         
                                                                <dxwgv:GridViewDataColumn FieldName="ProcessRate" Caption="经纪费率" VisibleIndex="11" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                     
                                                                <dxwgv:GridViewDataColumn FieldName="Process" Caption="经纪费" VisibleIndex="12" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Customer" Caption="投保客户" VisibleIndex="13" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="CreatePerson" Caption="录单人" VisibleIndex="14" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CreateTime" Caption="录单日期" VisibleIndex="15" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                        
                                                                <dxwgv:GridViewDataColumn FieldName="SourceType" Caption="业务来源" VisibleIndex="16" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>          
                                                                <dxwgv:GridViewDataColumn FieldName="FlagContinue" Caption="业务性质" VisibleIndex="17" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="GatheringType" Caption="收款方式" VisibleIndex="18" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                        
                                                                <dxwgv:GridViewDataColumn FieldName="StartDate" Caption="保单开始日期" VisibleIndex="19" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="EndDate" Caption="保单结束日期" VisibleIndex="20" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" Summary-Text="第{0}页,共{1}页" />
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
