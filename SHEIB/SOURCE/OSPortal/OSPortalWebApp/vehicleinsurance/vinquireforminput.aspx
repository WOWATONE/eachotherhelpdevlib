<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="vinquireforminput.aspx.cs" Inherits="OSPortalWebApp.vehicleinsurance.vinquireforminput" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});
            ////var popupControl = ASPxPopupSelectInsuranceClientControl;
            //var canDisplay = "<%=DisplaySelectInsurance %>";
            //if (canDisplay.toLowerCase() == "true") {
            //    //popupControl.ShowWindow();
            //    SetFormInputPopUpVisible();
            //}
            //else {
            //    //do nothing;
            //}

        });        
        
    </script> 
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="insuranceDetailTabPage" ClientInstanceName="insuranceDetailTabPage" runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%">
        <ClientSideEvents 
            ActiveTabChanging="function(s, e) {}" 
            TabClick="function(s, e) { tabItemClick();}" />
        <TabPages>
            
            <dxtc:TabPage Text="基本信息">                
                <ContentCollection>                
                <dxw:ContentControl ID="ContentControl1" runat="server">
                <table style="width:99%">
                    <tr>
                        <td style="width:100%;"> 
                            <asp:Panel ID="npbasicheader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float: left;">基本信息</div>
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
                                                <td style="width:8%;text-align:right;">交易号：</td>
                                                <td style="width:25%;text-align:left;"><asp:TextBox ID="txtSN" runat="server" Width="200px"></asp:TextBox></td>
                                                <td style="width:8%;text-align:right;">保费：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtFee" runat="server" Width="200px"></asp:TextBox>                                                                                                        
                                                </td>
                                                <td style="width:8%;text-align:right;">车辆数目：</td>
                                                <td style="width:23%;text-align:left;">
                                                    <asp:TextBox ID="txtNumber" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:8%;text-align:right;">付款人：</td>
                                                <td style="width:25%;text-align:left;"><asp:TextBox ID="txtPeople" runat="server" Width="200px"></asp:TextBox></td>
                                                <td style="width:8%;text-align:right;">收款银行：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtBank" runat="server" Width="200px"></asp:TextBox>                                                                                                        
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;">
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:8%;text-align:right;">投保人：</td>
                                                <td style="width:25%;text-align:left;"><asp:TextBox ID="txtpeoplefrom" runat="server" Width="120px" Text="张三"></asp:TextBox>&nbsp;
                                                    <img runat="server" id="imgadduser" alt="" src="../images/add_user_icon.png" style="width:20px; height:20px; vertical-align:top;" />
                                                    <img runat="server" id="imgpeoplesearch" alt="" src="../images/searchicon9.png" style="width:20px; height:20px; vertical-align:top;" />
                                                    <dxpc:ASPxPopupControl ID="popuppanelpeoplesearch" runat="server" 
                                                        EnableClientSideAPI="True" AllowDragging="False" PopupHorizontalAlign="Center" 
                                                        HeaderText="查询结果页面" 
                                                        Width="360px" Height="320px" 
                                                        EnableTheming="true"  PopupElementID="imgpeoplesearch"
                                                        AllowResize="false" Modal="true">
                                                        <Border BorderWidth="1px" />
                                                     </dxpc:ASPxPopupControl>
                                                </td>
                                                <td style="width:8%;text-align:right;">
                                                    
                                                </td>
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
                                                <td style="width:8%;text-align:right;">业务员：</td>
                                                <td style="width:23%;text-align:left;">
                                                    <asp:TextBox ID="txtagent" runat="server" Width="100px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:8%;text-align:right;">帐号：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtBankAccount" runat="server" Width="100px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;">缴费凭证号：</td>
                                                <td>
                                                    <asp:TextBox ID="txtBankCredenceID" runat="server" Width="100px"></asp:TextBox>                                                    
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
                            <asp:Panel ID="npGridPolicyItemHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float: left;">保险项目</div>
                                    <div style="float: left; margin-left: 20px;">
                                        <asp:Label ID="lbl_npGridPolicyItem" runat="server">(展开)</asp:Label>
                                    </div>
                                    <div style="float: right; vertical-align: middle;">
                                        <asp:ImageButton ID="img_npGridPolicyItem" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                </div>
                            </asp:Panel>  
                            <asp:Panel ID="npGridPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width:100%">
                                            <tr>
                                                <td style="width:8%;text-align:right;"></td>                                                
                                            </tr> 
                                            <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server" 
                                                    DataSourceID=""
                                                    KeyFieldName="ID" Width="100%" AutoGenerateColumns="False" 
                                                    OnRowInserting="gridPolicyItem_RowInserting" 
                                                    OnRowUpdating="gridPolicyItem_RowUpdating" 
                                                    OnRowUpdated="gridPolicyItem_RowUpdated" 
                                                    OnRowInserted="gridPolicyItem_RowInserted"
                                                    OnRowDeleting="gridPolicyItem_RowDeleting" 
                                                    OnRowDeleted="gridPolicyItem_RowDeleted"
                                                     >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn VisibleIndex="0">
                                                                    <NewButton Visible="True" />
                                                                    <EditButton Visible="true" />
                                                                    <DeleteButton Visible="true" />
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ID" Caption="序号" VisibleIndex="1">
                                                                    <EditFormSettings VisibleIndex="0" />
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Code" Caption="项目编码" VisibleIndex="2">
                                                                    <EditFormSettings VisibleIndex="1" />
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Caption" Caption="项目名称" VisibleIndex="3">
                                                                    <EditFormSettings VisibleIndex="2" />
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Premium" Caption="保额" VisibleIndex="4">
                                                                    <EditFormSettings VisibleIndex="3" />
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Rate" Caption="费率" VisibleIndex="5">
                                                                    <EditFormSettings VisibleIndex="4" />
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Fee" Caption="保费" VisibleIndex="6">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProcessRate" Caption="经纪费率" VisibleIndex="7">
                                                                    <EditFormSettings VisibleIndex="5" />
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProcessFee" Caption="经纪费" VisibleIndex="8">
                                                                    <EditFormSettings VisibleIndex="6" />
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowAllRecords"/>
                                                        <Settings ShowGroupPanel="false" />
                                                        <SettingsText 
                                                            CommandUpdate="确定" 
                                                            CommandCancel="取消" 
                                                            CommandDelete="删除" 
                                                            CommandNew="新增" 
                                                            CommandEdit="编辑"
                                                            EmptyDataRow="没有数据" />
                                                        <Templates>
                                                             <EditForm>                                                             
                                                             <div style="padding:4px 4px 3px 4px">
                                                                <dxwgv:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                                                             </div>
                                                             <div style="text-align:right; padding:2px 2px 2px 2px">
                                                                 <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server">
                                                                 </dxwgv:ASPxGridViewTemplateReplacement>
                                                                 <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                                                             </div>
                                                             </EditForm>
                                                         </Templates>

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
                    
            </dxw:ContentControl></ContentCollection></dxtc:TabPage>
                    
            
        </TabPages>
         
        
    </dxtc:ASPxPageControl>
    
    <table style="height:5px; background-color:#E0EDFF; width:100%; font-size:2px;"><tr><td></td></tr></table>
    
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="25px">
                <table style="width:100%">
                    <tr>
                        <td style="text-align:right;">
                            <asp:Button ID="btnadd" runat="server" Text="新增" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnsave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btncancel" runat="server" Text="取消" CssClass="input_2" />
                        </td>  
                        <td style="width:20px;text-align:left;">
                            &nbsp;
                        </td>                                                                  
                    </tr>
                </table>
                
     </asp:Panel>
     
     
</asp:Content>
