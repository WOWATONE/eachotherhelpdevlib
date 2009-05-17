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

        function btnCreateClick() {
	        
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
                        <td style="height:40px; width:45%;">
                            <dxe:ASPxButton ID="debtnCreate" runat="server" Text="新建" AutoPostBack="false">
                                <ClientSideEvents Click="btnCreateClick" />
                            </dxe:ASPxButton>
                        </td>
                        <td style="height:40px; width:55%;text-align:left;color:#0E5ED5;">
                            当前位置：客户收费&nbsp;&nbsp;
                            <asp:label id="LbUserNameTop" runat="server" Text="王六"></asp:label>，您好！今天是
	                        <label id="lblCurrentDate"></label>					        
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
                                                    <td style="width:90px;text-align:right;">通知书号：</td>
                                                    <td style="width:110px;text-align:left;">
                                                        <asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">保单编号：</td>
                                                    <td style="width:110px;text-align:left;">
                                                        <asp:TextBox ID="txtPolicyNo" runat="server" Width="120px"></asp:TextBox>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">投保单号：</td>
                                                    <td style="width:110px;text-align:left;">
                                                        <asp:TextBox ID="TextBox2" runat="server" Width="120px"></asp:TextBox>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">收款方式：</td>
                                                    <td style="width:110px;text-align:left;"> 
                                                        <asp:DropDownList ID="ddlAccountTypeID" runat="server" Width="120px">
                                                            <asp:ListItem Text="代收" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="直付" Value="2"></asp:ListItem>
                                                        </asp:DropDownList>                                                       
                                                    </td>
                                                                                                       
                                                </tr>
                                                <tr>   
                                                    <td style="text-align:right;">投保客户：</td>
                                                    <td style="text-align:left;">
                                                        <asp:TextBox ID="txtCustomerID" runat="server" Width="120px"></asp:TextBox>
                                                    </td>
                                                    <td style="text-align:right;">部门：</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList ID="ddlDeptId" runat="server" Width="120px">
                                                            <asp:ListItem Text="部门1" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="部门2" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="部门3" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align:right;">客户经理：</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlSalesId" Width="125px">
                                                            <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>                                                    
                                                    <td></td>                                                  
                                                </tr> 
                                                <tr>
                                                    <td style="text-align:right;">收款日期：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deGetStartDate" runat="server" Width="130px"></dxe:ASPxDateEdit>
                                                    </td>                                                    
                                                    <td style="text-align:center;">至</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deGetEndDate" runat="server" Width="130px"></dxe:ASPxDateEdit>
                                                    </td> 
                                                    <td style="text-align:right;">状态：</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlState" Width="120px">
                                                            <asp:ListItem Text="待审核" Value=""></asp:ListItem>
                                                            <asp:ListItem Text="已审核" Value=""></asp:ListItem>                                                            
                                                        </asp:DropDownList>
                                                    </td> 
                                                    <td></td>                                                                                                
                                                </tr>                                          
                                                <tr>
                                                    <td style="text-align:right;"></td>
                                                    <td style="text-align:left;">                                                                                                               
                                                    </td>
                                                    <td style="text-align:right;"></td>
                                                    <td style="text-align:left;">                                                        
                                                    </td>
                                                    <td style="text-align:left;" colspan="2">
                                                        <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" />&nbsp;
                                                        <asp:Button ID="btnCancel" runat="server" Text="重置" CssClass="input_2" />
                                                    </td>
                                                    <td></td>
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
                                                                <dxwgv:GridViewDataColumn FieldName="SerialNo" Caption="收费流水号" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="SerialNo" Caption="通知书号" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>  
                                                                <dxwgv:GridViewDataColumn FieldName="Customer" Caption="投保客户" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="CreateTime" Caption="收款日期" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">                                                                   
                                                                </dxwgv:GridViewDataDateColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="Fee" Caption="实收保费" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="FeeBase" Caption="实收金额" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="FeeAdjust" Caption="调整金额" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="AccountType" Caption="收款方式" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                                 
                                                                <dxwgv:GridViewDataColumn FieldName="State" Caption="状态" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Sale" Caption="客户经理" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" />
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
