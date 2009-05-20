<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AskPriceSearch.ascx.cs" Inherits="OSPortalWebApp.Controls.AskPriceSearch" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

    <script type="text/javascript">

        function searchGridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("../vehicleinsurance/AskPriceRead.aspx", self, myArguments);
        }

        function imgPolicyProdTypeClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("../otherinsurance/PolicyProdType.aspx", self, myArguments);
        }

        
    </script>
    
    
    <table style="width:100%">                    
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
                                                    <td style="width:70px;text-align:right;">投保单号：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:TextBox ID="txtPrePolicyNo" runat="server" Width="175px"></asp:TextBox>
                                                    </td>
                                                    
                                                    <td style="width:70px;text-align:right;">保单编号：</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:TextBox ID="txtPolicyNo" runat="server" Width="175px"></asp:TextBox>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">投保客户：</td>
                                                    <td style="width:160px;text-align:left;">
                                                        <asp:DropDownList ID="ddlCustomerID" runat="server">
                                                            <asp:ListItem Text="张三" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="王五" Value="3"></asp:ListItem>
                                                        </asp:DropDownList> 
                                                    </td>
                                                    <td></td>                                                    
                                                </tr> 
                                                <tr>
                                                    <td style="text-align:right;">部门：</td>
                                                    <td style="text-align:left;">
                                                       <asp:DropDownList runat="server" ID="ddlDeptId">
                                                            <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                                        </asp:DropDownList>                                                         
                                                    </td>
                                                    <td style="text-align:right;">客户经理：</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlSalesId">
                                                            <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align:right;">险种：</td>
                                                    <td style="text-align:left;">
                                                        <asp:TextBox ID="txtProdTypeID" runat="server" Width="120px"></asp:TextBox>
                                                        <img runat="server" id="imgpeoplesearch" alt="" src="../images/searchicon9.png" style="width:20px; height:20px; vertical-align:top;" onclick="imgPolicyProdTypeClick();" />                                                        
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;">业务来源：</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlSourceTypeID">
                                                            <asp:ListItem Text="来源1" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>                                                       
                                                    </td>
                                                    <td style="text-align:right;">业务性质：</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlFlagContinue">
                                                            <asp:ListItem Text="新增" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align:right;">录单人：</td>
                                                    <td style="text-align:left;">
                                                        <asp:TextBox ID="txtCreatePerson" runat="server" Width="155px"></asp:TextBox>                                                       
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;">保险公司：</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlCarrierId">
                                                            <asp:ListItem Text="中国平安保险公司" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>                                                       
                                                    </td>
                                                    <td style="text-align:right;">分支机构：</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlBranchId">
                                                            <asp:ListItem Text="中国平安保险公司" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align:right;">询价单状态：</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlAaskPriceState">
                                                            <asp:ListItem Text="待审核" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="已审核" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="批单" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;">开始日期：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deStartDate" runat="server">
                                                        </dxe:ASPxDateEdit>                                                       
                                                    </td>
                                                    <td style="text-align:right;">结束日期：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deEndDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="text-align:right;" colspan="2">
                                                        <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" />&nbsp;
                                                        <asp:Button ID="btnCancel" runat="server" Text="重置" CssClass="input_2" />&nbsp;
                                                        <asp:Button ID="btnRefresh" runat="server" Text="刷新" CssClass="input_2" />
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
                                                    KeyFieldName="PrePolicyNo" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true" 
                                                    OnRowDeleting="gridSearchResult_RowDeleting" 
                                                    OnRowDeleted="gridSearchResult_RowDeleted"
                                                    >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False">
                                                                    <NewButton Visible="False" />
                                                                    <EditButton Visible="False" />                                                                    
                                                                    <DeleteButton Visible="false" />
                                                                    <CustomButtons>
                                                                        <dxwgv:GridViewCommandColumnCustomButton Text="查看">                                                                            
                                                                        </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                                                    </CustomButtons>                                                   
                                                                </dxwgv:GridViewCommandColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="PrePolicyNo" Caption="投保单号" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="UserNameCn" Caption="客户经理" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>      
                                                                <dxwgv:GridViewDataColumn FieldName="CarrierNameCn" Caption="保险公司" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="分支机构" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>                                
                                                                <dxwgv:GridViewDataColumn FieldName="CarCount" Caption="车辆数目" CellStyle-Wrap="False"> 
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CiPremium" Caption="商业险保费" CellStyle-Wrap="False">   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="AciPremium" Caption="交强险保费" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CstPremium" Caption="车船税" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>              
                                                                <dxwgv:GridViewDataColumn FieldName="PremiumTotal" Caption="保费合计" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>         
                                                                <dxwgv:GridViewDataColumn FieldName="CiProcess" Caption="商业险经纪费" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                     
                                                                <dxwgv:GridViewDataColumn FieldName="AciProcess" Caption="交强险经纪费" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CstProcess" Caption="车船税经纪费" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="ProcessTotal" Caption="经纪费合计" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Currency" Caption="币种" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                        
                                                                <dxwgv:GridViewDataColumn FieldName="Premium" Caption="保费" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>          
                                                                <dxwgv:GridViewDataColumn FieldName="CustName" Caption="投保客户" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="CreatePerson" Caption="录单人" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                        
                                                                <dxwgv:GridViewDataColumn FieldName="CreateTime" Caption="录单日期" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="SourceTypeName" Caption="业务来源" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="OperationTypeName" Caption="业务性质" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="GatheringTypeName" Caption="收款方式" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="StartDate" Caption="保单起保日期" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="EndDate" Caption="保单终止日期" CellStyle-Wrap="False">                                                                   
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
     
     