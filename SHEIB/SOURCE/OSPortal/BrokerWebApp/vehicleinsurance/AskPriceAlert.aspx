<%@ Page Title="询价单批改" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="AskPriceAlert.aspx.cs" Inherits="BrokerWebApp.vehicleinsurance.AskPriceAlert" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>询价单批改</title>
    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});
            
            
            //if (canDisplay.toLowerCase() == "true") {
            //    //popupControl.ShowWindow();
            //    SetFormInputPopUpVisible();
            //}
            //else {
            //    //do nothing;
            //}

        });


        function btnAddCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("../otherinsurance/NewCustomer.aspx", self, myArguments);
        }

        function btnSelectCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("../otherinsurance/SelectCustomer.aspx", self, myArguments);
        }

        function imgPolicyProdTypeClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("../otherinsurance/PolicyProdType.aspx", self, myArguments);
        }

        function hlCarPolicyItemClick(params) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
            window.showModalDialog("CarPolicyItemInputRead.aspx", self, myArguments);
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <table style="width:100%">                    
                    <tr>
                        <td style="width:100%;" colspan="2"> 
                            <dxtc:ASPxPageControl ID="insuranceDetailTabPage" ClientInstanceName="insuranceDetailTabPage" runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%">
                                <ClientSideEvents 
                                    ActiveTabChanging="function(s, e) {}" 
                                    TabClick="function(s, e) {}" />
                                <TabPages>
                                    
                                    <dxtc:TabPage Text="基本信息">                
                                        <ContentCollection>                
                                        <dxw:ContentControl ID="ContentControl1" runat="server">
                                        <table style="width:99%">
                                        
                                        
                                            <tr>
                                                <td style="width:100%;"> 
                                                    <asp:Panel ID="npbasicheader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                                        <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                                            <div style="float:left; vertical-align: middle;">
                                                                <asp:ImageButton ID="img_npbasicheader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                                            </div>
                                                            <div style="float: left; margin-left:5px;">基本信息</div>
                                                            <div style="float: left; margin-left:5px;">
                                                                <asp:Label ID="lbl_npbasicheader" runat="server">(展开)</asp:Label>
                                                            </div>
                                                            
                                                        </div>
                                                    </asp:Panel>                           
                                                    <asp:Panel ID="npbasicdetail" runat="server" CssClass="collapsePanel" Height="0">
                                                                <table style="width:100%">
                                                                    <tr>
                                                                        <td style="width:10%;text-align:right;">投保单号：</td>
                                                                        <td style="width:20%;text-align:left;">
                                                                            <asp:TextBox ID="txtSN" runat="server" Width="100px"></asp:TextBox>
                                                                        </td>
                                                                        <td style="width:10%;text-align:left;">
                                                                            <dxe:ASPxButton AutoPostBack="False" runat="server" ID="btnOriginalPolicySelect" Text="选择批单" style="margin: 0px;">
                                                                                <ClientSideEvents Click="function(s, e) {return false;}" />
                                                                            </dxe:ASPxButton>
                                                                        </td>
                                                                        <td style="width:20%;text-align:left;">
                                                                            <dxe:ASPxButton AutoPostBack="False" runat="server" ID="btnOriginalPolicyDetail" Text="查看批单" style="margin: 0px;">
                                                                                <ClientSideEvents Click="function(s, e) {return false;}" />
                                                                            </dxe:ASPxButton>
                                                                        </td>
                                                                        <td style="width:10%;text-align:right;">保费：</td>
                                                                        <td style="width:20%;text-align:left;">
                                                                            <asp:TextBox ID="txtFee" runat="server" Width="150px"></asp:TextBox>                                                                                                        
                                                                        </td>
                                                                        
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align:right;">保险公司：</td>
                                                                        <td style="text-align:left;">
                                                                            <dxe:ASPxComboBox runat="server" ID="decbGridCarrierNo" 
                                                                                AutoPostBack="false" ClientInstanceName="decbGridCarrierNo" 
                                                                                DropDownButton-Enabled="true" DropDownStyle="DropDownList" Width="100px">
                                                                                <Items>
                                                                                    <dxe:ListEditItem Text="中国平安" Value="1" />
                                                                                    <dxe:ListEditItem Text="中国泰康" Value="2" />
                                                                                    <dxe:ListEditItem Text="中国安联" Value="3" />
                                                                                </Items>
                                                                                <ClientSideEvents SelectedIndexChanged="" />
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                        <td style="text-align:right;">分支机构：</td>
                                                                        <td style="text-align:left;">                                                                            
                                                                            <dxe:ASPxComboBox runat="server" ID="decbGridBranchName" 
                                                                                AutoPostBack="false" ClientInstanceName="decbGridBranchName"
                                                                                DropDownButton-Enabled="true" DropDownStyle="DropDownList" Width="100px">
                                                                                <Items>
                                                                                    <dxe:ListEditItem Text="平安分支1" Value="1" />
                                                                                    <dxe:ListEditItem Text="泰康分支1" Value="2" />
                                                                                    <dxe:ListEditItem Text="安联分支1" Value="3" />
                                                                                </Items>                                                                                
                                                                                <ClientSideEvents SelectedIndexChanged="" />
                                                                            </dxe:ASPxComboBox>                                                                                                                                                                                                            
                                                                        </td>
                                                                        <td style="text-align:right;"></td>
                                                                        <td style="text-align:left;"></td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align:right;">收款银行：</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox ID="txtBank" runat="server" Width="150px"></asp:TextBox>                                                                                                        
                                                                        </td>
                                                                        <td style="text-align:right;">投保人：</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox ID="txtpeoplefrom" runat="server" Width="80px" Text="张三"></asp:TextBox>&nbsp;
                                                                            <img runat="server" id="imgadduser" onclick="btnAddCustomerClick();" alt="" src="../images/add_user_icon.png" style="width:20px; height:20px; vertical-align:top;" />
                                                                            <img runat="server" id="imgpeoplesearch" onclick="btnSelectCustomerClick();" alt="" src="../images/searchicon9.png" style="width:20px; height:20px; vertical-align:top;" />                                                                            
                                                                        </td>
                                                                        <td style="text-align:right;"></td>
                                                                        <td style="text-align:left;"></td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        
                                                                        <td style="text-align:right;">帐号：</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox ID="txtBankAccount" runat="server" Width="100px"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align:right;">缴费凭证：</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox ID="txtBankCredenceID" runat="server" Width="100px"></asp:TextBox>                                                    
                                                                        </td>
                                                                        <td style="text-align:right;"></td>
                                                                        <td style="text-align:left;"></td>
                                                                        <td></td>
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
                                                        ExpandedText="(展开)"
                                                        CollapsedText="(隐藏)"
                                                        ExpandedImage="~/images/collapse_blue.jpg"
                                                        CollapsedImage="~/images/expand_blue.jpg"
                                                        SuppressPostBack="true" />
                                                </td>
                                            </tr>
                                            
                                            
                                            
                                            <tr>
                                                <td style="width:100%;">
                                                    <asp:Panel ID="nppostilecontentHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                                        <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                                            <div style="float:left; vertical-align: middle;">
                                                                <asp:ImageButton ID="img_nppostilecontentHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                                            </div>
                                                            <div style="float: left; margin-left:5px;">批改内容</div>
                                                            <div style="float: left; margin-left:5px;">
                                                                <asp:Label ID="lbl_nppostilecontentHeader" runat="server">(展开)</asp:Label>
                                                            </div>                                    
                                                        </div>
                                                    </asp:Panel>  
                                                    <asp:Panel ID="nppostilecontentDetail" runat="server" CssClass="collapsePanel" Height="0">
                                                                <table style="width:100%">
                                                                    <tr>
                                                                        <td style="width:10%;text-align:right;">批改日期：</td>
                                                                        <td style="width:90%;text-align:left;">
                                                                            <dxe:ASPxDateEdit ID="deCheckDate" runat="server"></dxe:ASPxDateEdit>
                                                                        </td>
                                                                        <td></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align:right;"></td>
                                                                        <td style="text-align:left;">                                                
                                                                            <textarea runat="server" id="taModifyMemo" rows="5" cols="72"></textarea>
                                                                        </td>
                                                                        <td></td>
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
                                                        ExpandedText="(展开)"
                                                        CollapsedText="(隐藏)"
                                                        ExpandedImage="~/images/collapse_blue.jpg"
                                                        CollapsedImage="~/images/expand_blue.jpg"
                                                        SuppressPostBack="true" />
                                                </td>
                                            </tr>
                    
                                                                                   
                                            <tr>
                                                <td style="width:100%;">
                                                    <asp:Panel ID="npGridPolicyItemHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                                        <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                                            <div style="float: left; vertical-align: middle;">
                                                                <asp:ImageButton ID="img_npGridPolicyItem" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                                            </div>
                                                            <div style="float: left; margin-left:5px;">车险项目</div>
                                                            <div style="float: left; margin-left:5px;">
                                                                <asp:Label ID="lbl_npGridPolicyItem" runat="server">(展开)</asp:Label>
                                                            </div>                                    
                                                        </div>
                                                    </asp:Panel>  
                                                    <asp:Panel ID="npGridPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                                                                <table style="width:100%">
                                                                    <tr>
                                                                        <td>
                                                                            <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server" 
                                                                            KeyFieldName="CarPolicyID" Width="100%" AutoGenerateColumns="False" 
                                                                            OnRowInserting="gridPolicyItem_RowInserting" 
                                                                            OnRowUpdating="gridPolicyItem_RowUpdating" 
                                                                            OnRowUpdated="gridPolicyItem_RowUpdated" 
                                                                            OnRowInserted="gridPolicyItem_RowInserted"
                                                                            OnRowDeleting="gridPolicyItem_RowDeleting" 
                                                                            OnRowDeleted="gridPolicyItem_RowDeleted"
                                                                             >
                                                                                <%-- BeginRegion Columns --%>
                                                                                    <Columns>
                                                                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;" Visible="false">
                                                                                            <NewButton Visible="false" />
                                                                                            <EditButton Visible="false" />
                                                                                            <DeleteButton Visible="false" />
                                                                                        </dxwgv:GridViewCommandColumn>
                                                                                        <dxwgv:GridViewDataColumn Caption="&nbsp;" CellStyle-Wrap="False">
                                                                                            <DataItemTemplate>
                                                                                                <dxe:ASPxHyperLink runat="server" ID="deGridPolicyItemhl_New" Text="查看" NavigateUrl="#">
                                                                                                    <ClientSideEvents Click="hlCarPolicyItemClick" />
                                                                                                </dxe:ASPxHyperLink>                                                                                               
                                                                                            </DataItemTemplate>
                                                                                        </dxwgv:GridViewDataColumn> 
                                                                                        <dxwgv:GridViewDataColumn FieldName="CarNo" Caption="车牌号" CellStyle-Wrap="False">
                                                                                        </dxwgv:GridViewDataColumn>
                                                                                        <dxwgv:GridViewDataColumn FieldName="CiPremium" Caption="商业险保费" CellStyle-Wrap="False">
                                                                                        </dxwgv:GridViewDataColumn>
                                                                                        <dxwgv:GridViewDataColumn FieldName="CiProcessRate" Caption="商业险经纪费率" CellStyle-Wrap="False">
                                                                                        </dxwgv:GridViewDataColumn>
                                                                                        <dxwgv:GridViewDataColumn FieldName="CiProcess" Caption="商业险经纪费" CellStyle-Wrap="False">
                                                                                        </dxwgv:GridViewDataColumn>
                                                                                        <dxwgv:GridViewDataColumn FieldName="AciPremium" Caption="交强险保费" CellStyle-Wrap="False">
                                                                                        </dxwgv:GridViewDataColumn>
                                                                                        <dxwgv:GridViewDataColumn FieldName="AciProcessRate" Caption="交强险经纪费率" CellStyle-Wrap="False">
                                                                                        </dxwgv:GridViewDataColumn>
                                                                                        <dxwgv:GridViewDataColumn FieldName="AciProcess" Caption="交强险经纪费" CellStyle-Wrap="False">
                                                                                        </dxwgv:GridViewDataColumn>
                                                                                        <dxwgv:GridViewDataColumn FieldName="CstPremium" Caption="车船税" CellStyle-Wrap="False">
                                                                                        </dxwgv:GridViewDataColumn>
                                                                                    </Columns>
                                                                                <%-- EndRegion --%>
                                                                                <SettingsPager Mode="ShowAllRecords"/>
                                                                                <Settings ShowGroupPanel="false" />                                                        
                                                                                
                                                                            </dxwgv:ASPxGridView>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                               
                                                     </asp:Panel>
                                                     <ajaxToolkit:CollapsiblePanelExtender ID="cpeGridPolicyItem" runat="Server"
                                                        TargetControlID="npGridPolicyItemDetail"
                                                        ExpandControlID="npGridPolicyItemHeader"
                                                        CollapseControlID="npGridPolicyItemHeader" 
                                                        Collapsed="false"
                                                        TextLabelID="lbl_npGridPolicyItem"
                                                        ImageControlID="img_npGridPolicyItem"    
                                                        ExpandedText="(展开)"
                                                        CollapsedText="(隐藏)"
                                                        ExpandedImage="~/images/collapse_blue.jpg"
                                                        CollapsedImage="~/images/expand_blue.jpg"
                                                        SuppressPostBack="true" />
                                                </td>
                                            </tr>
                    
                                            
                                            <tr>
                                            <td style="width:100%;">
                                                <asp:Panel ID="npCostSummaryHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                                        <div style="float: left; vertical-align: middle;">
                                                            <asp:ImageButton ID="img_npCostSummaryHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                                        </div>
                                                        <div style="float: left; margin-left:5px;">费用汇总</div>
                                                        <div style="float: left; margin-left:5px;">
                                                            <asp:Label ID="lbl_npCostSummaryHeader" runat="server">(展开)</asp:Label>
                                                        </div>
                                                        
                                                    </div>
                                                </asp:Panel> 
                                                <asp:Panel ID="npCostSummaryDetail" runat="server" CssClass="collapsePanel" Height="0">
                                                            <table style="width:100%">
                                                                <tr>
                                                                    <td style="width:11%;text-align:right;">商业险保费：</td>
                                                                    <td style="width:22%;text-align:left;">
                                                                        <asp:TextBox ID="txtCiPremium" runat="server" Width="100px"></asp:TextBox>
                                                                    </td>
                                                                    <td style="width:11%;text-align:right;">交强险保费：</td>
                                                                    <td style="width:22%;text-align:left;">
                                                                        <asp:TextBox ID="txtAciPremium" runat="server" Width="100px"></asp:TextBox>
                                                                    </td>
                                                                    
                                                                    <td style="width:11%;text-align:right;">车船税：</td>
                                                                    <td style="width:20%;text-align:left;">
                                                                        <asp:TextBox ID="txtCstPremium" runat="server" Width="100px"></asp:TextBox>
                                                                    </td>
                                                                    <td></td>                                 
                                                                </tr> 
                                                                <tr>
                                                                    <td style="text-align:right;">经纪费率：</td>
                                                                    <td style="text-align:left;">
                                                                        <asp:TextBox ID="txtCiProcessRate" runat="server" Width="100px"></asp:TextBox>
                                                                    </td> 
                                                                    <td style="text-align:right;">经纪费率：</td>
                                                                    <td style="text-align:left;">
                                                                        <asp:TextBox ID="txtAciProcessRate" runat="server" Width="100px"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align:right;"></td>
                                                                    <td style="text-align:left;"></td> 
                                                                    <td></td>                               
                                                                </tr>  
                                                                <tr>
                                                                    <td style="text-align:right;">经纪费：</td>
                                                                    <td style="text-align:left;">
                                                                        <asp:TextBox ID="txtCiProcess" runat="server" Width="100px"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align:right;">经纪费：</td>
                                                                    <td style="text-align:left;">
                                                                        <asp:TextBox ID="txtAciProcess" runat="server" Width="100px"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align:right;"></td>
                                                                    <td style="text-align:left;"></td>
                                                                    <td></td>                                  
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align:right;">保费合计：</td>
                                                                    <td style="text-align:left;">
                                                                        <asp:TextBox ID="txtPremiumTotal" runat="server" Width="100px"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align:right;">经纪费合计：</td>
                                                                    <td style="text-align:left;">
                                                                        <asp:TextBox ID="txtProcessTotal" runat="server" Width="100px"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align:right;"></td>
                                                                    <td style="text-align:left;">
                                                                        
                                                                    </td>
                                                                    <td></td>                                  
                                                                </tr>                                            
                                                                                                                                                        
                                                            </table>
                                                            
                                                 </asp:Panel>
                                                 <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="Server"
                                                    TargetControlID="npCostSummaryDetail"
                                                    ExpandControlID="npCostSummaryHeader"
                                                    CollapseControlID="npCostSummaryHeader" 
                                                    Collapsed="false"
                                                    TextLabelID="lbl_npCostSummaryHeader"
                                                    ImageControlID="img_npCostSummaryHeader"    
                                                    ExpandedText="(展开)"
                                                    CollapsedText="(隐藏)"
                                                    ExpandedImage="~/images/collapse_blue.jpg"
                                                    CollapsedImage="~/images/expand_blue.jpg"
                                                    SuppressPostBack="true" />
                                                </td>
                                            </tr>
                    
                                            
                                            
                                            <tr>
                                                <td style="width:100%;">
                                                    <asp:Panel ID="npOtherPolicyItemHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                                        <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                                            <div style="float: left; vertical-align: middle;">
                                                                <asp:ImageButton ID="img_npOtherPolicyItemHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                                            </div>
                                                            <div style="float: left; margin-left:5px;">其它项目</div>
                                                            <div style="float: left; margin-left:5px;">
                                                                <asp:Label ID="lbl_npOtherPolicyItemHeader" runat="server">(展开)</asp:Label>
                                                            </div>
                                                            
                                                        </div>
                                                    </asp:Panel> 
                                                    <asp:Panel ID="npOtherPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                                                                <table style="width:100%">
                                                                                                                
                                                                    <tr>
                                                                        <td style="width:11%;text-align:right;">部门：</td>
                                                                        <td style="width:22%;text-align:left;">
                                                                            <asp:DropDownList ID="ddlDeptId" runat="server">
                                                                                <asp:ListItem Text="部门1" Value="1"></asp:ListItem>
                                                                                <asp:ListItem Text="部门2" Value="2"></asp:ListItem>
                                                                                <asp:ListItem Text="部门3" Value="3"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td style="width:11%;text-align:right;">客户经理：</td>
                                                                        <td style="width:22%;text-align:left;">
                                                                            <asp:DropDownList ID="ddlcustomermanager" runat="server">
                                                                                <asp:ListItem Text="经理1" Value="1"></asp:ListItem>
                                                                                <asp:ListItem Text="经理2" Value="2"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td></td>
                                                                        <td></td>                                                                         
                                                                        <td></td>                                 
                                                                    </tr> 
                                                                    <tr>                                                                        
                                                                        <td style="text-align:right;">业务来源：</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:DropDownList ID="ddlFrom" runat="server">
                                                                                <asp:ListItem Text="业务来源1" Value="1"></asp:ListItem>
                                                                                <asp:ListItem Text="业务来源2" Value="2"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td style="text-align:right;">业务性质：</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:DropDownList ID="ddlKind" runat="server">
                                                                                <asp:ListItem Text="业务性质1" Value="1"></asp:ListItem>
                                                                                <asp:ListItem Text="业务性质2" Value="2"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td style="text-align:right;">收款方式：</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:DropDownList ID="ddlGatheringType" runat="server">
                                                                                <asp:ListItem Text="收款方式1" Value="1"></asp:ListItem>
                                                                                <asp:ListItem Text="收款方式2" Value="2"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                         
                                                                        <td></td>                                 
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align:right;">录单人：</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox ID="txtCreatePerson" runat="server" Width="120px" Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align:right;">录单日期：</td> 
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox ID="txtCreateTime" runat="server" Width="120px" Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td></td>
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
                                                        ExpandedText="(展开)"
                                                        CollapsedText="(隐藏)"
                                                        ExpandedImage="~/images/collapse_blue.jpg"
                                                        CollapsedImage="~/images/expand_blue.jpg"
                                                        SuppressPostBack="true" />
                                                    </td>
                                                </tr>
                                            
                                            
                                            
                                            </table>
                                            
                                    </dxw:ContentControl></ContentCollection></dxtc:TabPage>
                                    
                                    
                                    <dxtc:TabPage Text="附件">
                                        <ContentCollection><dxw:ContentControl ID="ContentControl2" runat="server">
                                            <table style="width:100%">
                                                <tr>
                                                    <td style="width:100%;text-align:left;" colspan="2">附件列表</td>                            
                                                </tr>
                                                <tr>
                                                    <td style="width:10%;text-align:right;">1</td>
                                                    <td style="width:90%;text-align:left;">file1.doc</td>                            
                                                </tr>
                                                <tr>
                                                    <td style="width:10%;text-align:right;">2</td>
                                                    <td style="width:90%;text-align:left;">file2.doc</td>                            
                                                </tr>
                                            </table>              
                                        </dxw:ContentControl></ContentCollection>
                                    </dxtc:TabPage>
                                            
                                    <dxtc:TabPage Text="审核信息">
                                        <ContentCollection><dxw:ContentControl ID="ContentControl3" runat="server">
                                            <table style="width:100%">
                                                <tr>
                                                    <td style="width:10%;text-align:right;">审核人：</td>
                                                    <td style="width:20%;text-align:left;">
                                                        <asp:TextBox ID="TextBox2" runat="server" Width="100px" Enabled="false"></asp:TextBox>
                                                    </td>
                                                    <td style="width:10%;text-align:right;">审核日期：</td>
                                                    <td style="width:20%;text-align:left;">
                                                        <dxe:ASPxDateEdit ID="ASPxDateEdit1" runat="server"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right; vertical-align:top;">审核备注：</td>
                                                    <td style="text-align:left;" colspan="3">                                                
                                                        <textarea runat="server" id="Textarea1" rows="5" cols="72"></textarea>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>            
                                        </dxw:ContentControl></ContentCollection>
                                    </dxtc:TabPage>
                                    
                                </TabPages>
                                 
                                
                            </dxtc:ASPxPageControl>
                            
                            <table style="height:5px; background-color:#E0EDFF; width:100%; font-size:2px;"><tr><td></td></tr></table>
    
                            <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="30px">
                                        <table style="width:100%">
                                            <tr>
                                                <td></td>
                                                <td style="text-align:right;">
                                                    <asp:Button ID="btnadd" runat="server" Text="新增" CssClass="input_2" />&nbsp;&nbsp;
                                                    <asp:Button ID="btnsave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;
                                                    <asp:Button ID="btncancel" runat="server" Text="取消" CssClass="input_2" />
                                                </td>  
                                                <td></td>                                                                  
                                            </tr>
                                        </table>
                                        
                             </asp:Panel>
                        </td>
                    </tr>                   
            </table>

</asp:Content>
