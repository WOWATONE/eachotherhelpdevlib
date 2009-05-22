﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PolicySearch.ascx.cs" Inherits="OSPortalWebApp.Controls.PolicySearch" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

    <script type="text/javascript">

        function searchGridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("PolicyRead.aspx", self, myArguments);
        }


        
    </script>
    
    <table style="width:100%">
                    <tr>
                        <td style="width:100%;"> 
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
                                                    <td style="width:15px;text-align:right;">
                                                        
                                                    </td>
                                                    <td style="width:60px;text-align:right;">保单编号：</td>
                                                    <td style="width:255px;text-align:left;" colspan="3"><asp:TextBox ID="txtPolicyNo" runat="server" Width="200px"></asp:TextBox></td>
                                                    <td style="width:70px;text-align:right;" >
                                                        部门：</td>
                                                    <td style="width:180px;text-align:left;" colspan="3">
                                                        <asp:DropDownList runat="server" ID="ddlDeptId">
                                                            <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:60px;text-align:right;">客户经理：</td>
                                                    <td style="width:150px;text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlSalesId">
                                                            <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <dxe:ASPxImage runat="server" ID="dpimgpeoplesearch" ImageUrl="../images/searchicon9.png" ImageAlign="AbsMiddle"></dxe:ASPxImage>
                                                    </td>
                                                    <td style="width:30px;text-align:left;">
                                                        
                                                    </td>
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
                                                    <td style="width:60px;text-align:right;">业务来源：</td>
                                                    <td style="width:120px;text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlSourceTypeID">
                                                            <asp:ListItem Text="来源1" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width:60px;text-align:left;">
                                                        
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
                                                    <td style="width:60px;text-align:right;"></td>
                                                    <td style="width:120px;text-align:left;" colspan="2">
                                                        
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
                                ExpandedText="(展开)"
                                CollapsedText="(隐藏)"
                                ExpandedImage="~/images/collapse_blue.jpg"
                                CollapsedImage="~/images/expand_blue.jpg"
                                SuppressPostBack="true" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;">
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
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                                                    <NewButton Visible="False" />
                                                                    <EditButton Visible="False" />                                                                    
                                                                    <DeleteButton Visible="false" />
                                                                    <CustomButtons>
                                                                        <dxwgv:GridViewCommandColumnCustomButton Text="查看">                                                                            
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
                                                                <dxwgv:GridViewDataColumn FieldName="StartDate" Caption="保单起保日期" VisibleIndex="19" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="EndDate" Caption="保单终止日期" VisibleIndex="20" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" Summary-Text="第{0}页,共{1}页" />
                                                        <Settings ShowGroupPanel="false" />                                                        
                                                        <ClientSideEvents CustomButtonClick="function(s, e) {searchGridCustomButtonClick(s,e);return false;}" />
                                                        
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