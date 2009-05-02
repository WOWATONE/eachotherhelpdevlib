<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="FeeCustomer.aspx.cs" Inherits="OSPortalWebApp.inoutbalance.FeeCustomer" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>客户收费列表</title>
    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});

            lblCurrentDate.innerHTML = makewelcomeString();

        });
	    
	    function menuClick(url) {
	        
                var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
                window.showModalDialog("FeeCustomerAdd.aspx", self, myArguments);
            
        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("FeeCustomerAdd.aspx", self, myArguments);
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <table style="width:100%">
                    <tr>
                        <td style="height:40px; width:40%;">
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
                                    <dxm:MenuItem Text="新    建" Name="PolicyInput.aspx"></dxm:MenuItem>
                                </Items>
                            </dxm:ASPxMenu>
                        </td>
                        <td style="height:40px; width:60%;">
                            <table style="margin:0px; padding:0px; width:100%; border:0px; text-align:right">
				                        <tr>
					                        <td style="width:100%;PADDING-RIGHT: 20px; text-align:right;color:#0E5ED5;">
					                            当前位置：客户收费&nbsp;&nbsp;
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
                                    <div style="float: left; vertical-align: middle;">
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
                                                    <td style="width:70px;text-align:right;">营业部门：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:DropDownList ID="ddlDeptId" runat="server">
                                                            <asp:ListItem Text="部门1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="部门2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="部门3" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">收费类别：</td>
                                                    <td style="width:180px;text-align:left;"> 
                                                        <asp:DropDownList ID="ddlAccountTypeID" runat="server">
                                                            <asp:ListItem Text="类别1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="类别2" Value="2"></asp:ListItem>
                                                        </asp:DropDownList>                                                       
                                                    </td>                                                    
                                                </tr>
                                                <tr>                                                                                                        
                                                    <td style="width:70px;text-align:right;">投保客户：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:TextBox ID="txtCustomerID" runat="server" Width="175px"></asp:TextBox>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">业务员：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:TextBox ID="txtSalesID" runat="server" Width="120px" Text="张三"></asp:TextBox>&nbsp;
                                                        <img runat="server" id="imgpeoplesearch" alt="" src="../images/searchicon9.png" style="width:20px; height:20px; vertical-align:top;" />
                                                    </td>
                                                    <td style="width:70px;text-align:right;">流水号：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:TextBox ID="txtSerialNo" runat="server" Width="120px" Text="张三"></asp:TextBox>&nbsp;
                                                        
                                                    </td>                                                    
                                                </tr>                                                 
                                                <tr>
                                                    <td style="width:70px;text-align:right;">保险公司：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:DropDownList ID="ddlCompany" runat="server">
                                                            <asp:ListItem Text="平安保险" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="人寿保险" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="泰康保险" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>                                                    
                                                    <td style="width:70px;text-align:right;">分支机构：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                                            <asp:ListItem Text="平安1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="平安2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="平安3" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">保险险种：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:DropDownList ID="ddlCategory" runat="server">
                                                            <asp:ListItem Text="保险1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="保险2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="保险3" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>                                                    
                                                </tr> 
                                                <tr>                                                     
                                                    <td style="width:70px;text-align:right;">业务来源：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:DropDownList ID="ddlSourceTypeID" runat="server">
                                                            <asp:ListItem Text="来源1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="来源2" Value="2"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">审核：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:DropDownList ID="ddlCheckState" runat="server">
                                                            <asp:ListItem Text="审核" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="未审核" Value="2"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>                                                   
                                                    
                                                    <td style="width:70px;text-align:right;"></td>
                                                    <td style="width:180px;text-align:left;">
                                                        
                                                    </td>                                                    
                                                </tr> 
                                                <tr>
                                                    <td style="width:90px;text-align:right;">收付日期：</td>
                                                    <td style="width:100px;text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deGetStartDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>                                                    
                                                    <td style="width:20px;text-align:right;">至</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deGetEndDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>                                                                                                 
                                                </tr> 
                                                <tr>
                                                    <td style="width:90px;text-align:right;"><asp:CheckBox runat="server" ID="chkBack" /> 回执日期：</td>
                                                    <td style="width:100px;text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deBackStartDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>                                                    
                                                    <td style="width:20px;text-align:right;">至</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deBackEndDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td> 
                                                    <td style="width:180px;text-align:left;">&nbsp;</td>
                                                    <td style="width:180px;text-align:left;">&nbsp;</td>                                                   
                                                </tr>                                                
                                                <tr>
                                                    <td style="width:70px;text-align:right;"></td>
                                                    <td style="width:200px;text-align:left;">
                                                                                                               
                                                    </td>
                                                    <td style="width:20px;text-align:right;"></td>
                                                    <td style="width:180px;text-align:left;">
                                                        
                                                    </td>
                                                    <td style="text-align:right;">
                                                        <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" />&nbsp;
                                                        <asp:Button ID="btnCancel" runat="server" Text="重置" CssClass="input_2" />
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
                                                    KeyFieldName="FeeId" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true" 
                                                    OnRowDeleting="gridSearchResult_RowDeleting" 
                                                    OnRowDeleted="gridSearchResult_RowDeleted"
                                                    >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                                                    <NewButton Visible="False" />
                                                                    <EditButton Visible="false" />                                                                    
                                                                    <DeleteButton Visible="true" />
                                                                    <CustomButtons>
                                                                        <dxwgv:GridViewCommandColumnCustomButton Text="编辑">                                                                            
                                                                        </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                                                    </CustomButtons>                                                   
                                                                </dxwgv:GridViewCommandColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="FeeId" Visible="false" Caption="GUID" VisibleIndex="1" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CreateTime" Caption="收款日期" VisibleIndex="2" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn> 
                                                                <dxwgv:GridViewDataColumn FieldName="FeeType" Caption="方式" VisibleIndex="3" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CurCode" Caption="币种" VisibleIndex="4" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="Fee" Caption="实收保费" VisibleIndex="5" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="FeeBase" Caption="实收金额" VisibleIndex="6" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="FeeAdjust" Caption="调整金额" VisibleIndex="7" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="AccountType" Caption="收费方式" VisibleIndex="8" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="SerialNo" Caption="单据流水号" VisibleIndex="9" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="保单编号" VisibleIndex="10" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Customer" Caption="投保客户" VisibleIndex="11" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="SalesId" Caption="业务员编号" VisibleIndex="12" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Sales" Caption="业务员" VisibleIndex="13" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Audited" Caption="审核" VisibleIndex="14" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CreatePerson" Caption="收费人" VisibleIndex="15" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CarrierId" Caption="保险公司" VisibleIndex="16" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="BranchId" Caption="分支机构" VisibleIndex="17" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProdTypeID" Caption="险种名称" VisibleIndex="18" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="FeeNoticeID" Caption="代收保费通知书编号" VisibleIndex="20" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="EnterAccountID" Caption="直付保费入账确认单编号" VisibleIndex="21" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="FeeRemark" Caption="备注" VisibleIndex="22" CellStyle-Wrap="False">                                                                   
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
