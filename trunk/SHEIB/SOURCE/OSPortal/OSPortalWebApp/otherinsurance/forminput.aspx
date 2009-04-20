<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="forminput.aspx.cs" Inherits="OSPortalWebApp.otherinsurance.forminput" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta content="zh-CN" http-equiv="Content-Language" />
    <link rel="stylesheet" type="text/css" href="../css/ie.css" />
    <script src="../js/jquery-1.3.2.js" type="text/javascript"></script>
	<script src="../js/jquerynotice/jquery.notice.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/jquery-ui-1.7.1.custom.min.js"></script>
    <script type="text/javascript" src="../js/ui.datepicker-zh-CN.js"></script>
    <link type="text/css" href="../js/css/smoothness/jquery-ui-1.7.1.custom.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="../js/jquerynotice/jquery.notice.css" />
	<script type="text/javascript" src="../js/dppopup.js"></script>
	<script type="text/javascript">
	    $(document).ready(function() {
	        jQuery.noticeAdd({
	            text: 'This is a notification that you have to remove',
	            stay: true
	        });
	        //var popupControl = ASPxPopupSelectInsuranceClientControl;
	        var canDisplay = "<%=DisplaySelectInsurance %>";
	        if (canDisplay.toLowerCase() == "true") {
	            //popupControl.ShowWindow();
	            SetFormInputPopUpVisible();
	        }
	        else {
	            //do nothing;
	        }
	    });
    </script>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="carTabPage" runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%">
        <TabPages>
            <dxtc:TabPage Text="保单基本资料"><ContentCollection><dxw:ContentControl runat="server">
                <table style="width:99%">
                    <tr>
                        <td style="width:100%;"> 
                            <asp:Panel ID="npbasicheader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float: left;">保单基本数据</div>
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
                                                <td style="width:8%;text-align:right;">保单编号：</td>
                                                <td style="width:25%;text-align:left;"><asp:TextBox ID="txtSN" runat="server" Width="200px"></asp:TextBox></td>
                                                <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkReinsurance" runat="server" /></td>
                                                <td style="width:25%;text-align:left;">
                                                    <dxe:ASPxButton AutoPostBack="False" runat="server" ID="btnTogetherInsurance" Text="再  保" style="margin: 0px;">
                                                        <ClientSideEvents Click="function(s, e) {return false;}" />
                                                    </dxe:ASPxButton>
                                                    <dxpc:ASPxPopupControl ID="popuppanelTogetherInsurance" runat="server" 
                                                        EnableClientSideAPI="True" AllowDragging="False" PopupHorizontalAlign="Center" 
                                                        HeaderText="再保险" 
                                                        Width="360px" Height="320px" 
                                                        EnableTheming="true"  PopupElementID="btnTogetherInsurance"
                                                        AllowResize="false" Modal="true">
                                                        <Border BorderWidth="1px" />
                                                     </dxpc:ASPxPopupControl>
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:8%;text-align:right;">投保人：</td>
                                                <td style="width:25%;text-align:left;"><asp:TextBox ID="txtpeoplefrom" runat="server" Width="154px" Text="张三"></asp:TextBox>&nbsp;&nbsp;
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
                                                <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkTogether" runat="server" /></td>
                                                <td style="width:25%;text-align:left;">
                                                    <dxe:ASPxButton AutoPostBack="False" runat="server" ID="btnpartnerInsurance" Text="共  保" style="margin: 0px;">
                                                        <ClientSideEvents Click="function(s, e) {return false;}" />
                                                    </dxe:ASPxButton>
                                                    <dxpc:ASPxPopupControl ID="popupPanelpartnerInsurance" runat="server" 
                                                        EnableClientSideAPI="True" AllowDragging="False" PopupHorizontalAlign="Center" 
                                                        HeaderText="共保" 
                                                        Width="360px" Height="320px" 
                                                        EnableTheming="true"  PopupElementID="btnpartnerInsurance"
                                                        AllowResize="false" Modal="true">
                                                        <Border BorderWidth="1px" />
                                                     </dxpc:ASPxPopupControl>
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:8%;text-align:right;">被保险人：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlpeopleto" runat="server">
                                                        <asp:ListItem Text="张三" Value="1" Selected ></asp:ListItem>
                                                        <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="王五" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkStage" runat="server" /></td>
                                                <td style="width:25%;text-align:left;">
                                                    <dxe:ASPxButton AutoPostBack="False" runat="server" ID="btndividedpaymentinsurance" Text="分  期" style="margin: 0px;">
                                                        <ClientSideEvents Click="function(s, e) {return false;}" />
                                                    </dxe:ASPxButton>
                                                    <dxpc:ASPxPopupControl ID="popupPaneldividedpaymentinsurance" runat="server" 
                                                        EnableClientSideAPI="True" AllowDragging="False" PopupHorizontalAlign="Center" 
                                                        HeaderText="分期" 
                                                        Width="360px" Height="320px" 
                                                        EnableTheming="true"  PopupElementID="btndividedpaymentinsurance"
                                                        AllowResize="false" Modal="true">
                                                        <Border BorderWidth="1px" />
                                                     </dxpc:ASPxPopupControl>
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
                                                <td style="width:8%;text-align:right;">保险险种：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlCategory" runat="server">
                                                    <asp:ListItem Text="保险1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="保险2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="保险3" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">保险期限：</td>
                                                <td>
                                                    <dxe:ASPxDateEdit ID="deStartDate" runat="server"></dxe:ASPxDateEdit>                                                    
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <dxe:ASPxDateEdit ID="deEndDate" runat="server"></dxe:ASPxDateEdit>
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
                                                    DataSourceID="dsPolicyItem"
                                                    KeyFieldName="ID" Width="100%" AutoGenerateColumns="False" 
                                                    OnRowInserting="gridPolicyItem_RowInserting" 
                                                    OnRowUpdating="gridPolicyItem_RowUpdating" 
                                                    OnRowUpdated="gridPolicyItem_RowUpdated" 
                                                    OnRowInserted="gridPolicyItem_RowInserted" >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn VisibleIndex="0">
                                                                    <EditButton Visible="true" />
                                                                    <NewButton Visible="True" />
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
                                                    <asp:ObjectDataSource ID="dsPolicyItem" Runat="server" TypeName="OSPortalWebApp.PolicyItem"
                                                        InsertMethod="InsertPolicyItem" 
                                                        SelectMethod="GetPolicyItems" 
                                                        UpdateMethod="UpdatePolicyItem" 
                                                        DataObjectTypeName="OSPortalWebApp.PolicyItem" >

                                                          <UpdateParameters>
                                                            <asp:Parameter Type="Int32" Name="ID" Direction="Input"></asp:Parameter>
                                                            <asp:Parameter Type="String" Name="Code" Direction="Input"></asp:Parameter>
                                                            <asp:Parameter Type="String" Name="Caption" Direction="Input"></asp:Parameter>
                                                            <asp:Parameter Type="Decimal" Name="Premium" Direction="Input"></asp:Parameter>
                                                            <asp:Parameter Type="Double" Name="Rate" Direction="Input"></asp:Parameter>
                                                            <asp:Parameter Type="Double" Name="Fee" Direction="Input"></asp:Parameter>
                                                            <asp:Parameter Type="Double" Name="ProcessRate" Direction="Input"></asp:Parameter>
                                                            <asp:Parameter Type="Double" Name="ProcessFee" Direction="Input"></asp:Parameter>
                                                        </UpdateParameters>

                                                        <SelectParameters>
                                                        </SelectParameters>

                                                        <InsertParameters>
                                                            <asp:Parameter Type="Int32" Name="ID" Direction="Input"></asp:Parameter>
                                                            <asp:Parameter Type="String" Name="Code" Direction="Input"></asp:Parameter>
                                                            <asp:Parameter Type="String" Name="Caption" Direction="Input"></asp:Parameter>
                                                            <asp:Parameter Type="Decimal" Name="Premium" Direction="Input"></asp:Parameter>
                                                            <asp:Parameter Type="Double" Name="Rate" Direction="Input"></asp:Parameter>
                                                            <asp:Parameter Type="Double" Name="Fee" Direction="Input"></asp:Parameter>
                                                            <asp:Parameter Type="Double" Name="ProcessRate" Direction="Input"></asp:Parameter>
                                                            <asp:Parameter Type="Double" Name="ProcessFee" Direction="Input"></asp:Parameter>
                                                        </InsertParameters>

                                                    </asp:ObjectDataSource>
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
                                                <td style="width:11%;text-align:right;">保额：</td>
                                                <td style="width:22%;text-align:left;">
                                                    <asp:TextBox ID="txtprice" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:11%;text-align:right;">费率：</td>
                                                <td style="width:22%;text-align:left;">
                                                    <asp:TextBox ID="txtrate" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:11%;text-align:right;">保费（原）：</td>
                                                <td style="width:20%;text-align:left;">
                                                    <asp:TextBox ID="txtoriginalfee" runat="server" Width="140px"></asp:TextBox>
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">币种：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="DropDownList2" runat="server">
                                                        <asp:ListItem Text="人民币" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="美元" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="英镑" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">换算汇率：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtchange" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;">保费（本）：</td>
                                                <td style="width:23%;text-align:left;">
                                                    <asp:TextBox ID="txtlocalfee" runat="server" Width="140px"></asp:TextBox>
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">经纪费率：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtmiddlerate" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;">经纪费：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtmiddlefee" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;">
                                                    
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">原件链接：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtfile" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:25%;text-align:left;">
                                                    
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;">
                                                    
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">部门：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlDeptId" runat="server">
                                                        <asp:ListItem Text="部门1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="部门2" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="部门3" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">客户经理：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlcustomermanager" runat="server">
                                                        <asp:ListItem Text="经理1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="经理2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;">
                                                    
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">业务来源：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlSourceTypeID" runat="server">
                                                        <asp:ListItem Text="来源1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="来源2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">业务性质：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlKind" runat="server">
                                                        <asp:ListItem Text="业务性质1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="业务性质2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">收款方式：</td>
                                                <td style="width:23%;text-align:left;">
                                                    <asp:DropDownList ID="ddlGatheringType" runat="server">
                                                        <asp:ListItem Text="收款方式1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="收款方式2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>                                  
                                            </tr> 
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
                    
            <dxtc:TabPage Text="标的描述">
                <ContentCollection><dxw:ContentControl runat="server">
                    <table style="width:100%">
                        <tr>
                            <td style="width:8%;text-align:left;">标的类别：<asp:TextBox it="txtTargetType" runat="server" ReadOnly></asp:TextBox></td>
                            
                        </tr> 
                        <tr>
                            <td>
                                <dxwgv:ASPxGridView ID="gridTargetProperty" ClientInstanceName="grid" runat="server" KeyFieldName="CustomerID" Width="100%">
                                    <%-- BeginRegion Columns --%>
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                                                <EditButton Visible="false" />
                                            </dxwgv:GridViewCommandColumn>
                                            <dxwgv:GridViewDataColumn FieldName="序号" VisibleIndex="1">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="项目" VisibleIndex="2">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="项目说明" VisibleIndex="3">
                                            </dxwgv:GridViewDataColumn>
                                        </Columns>
                                    <%-- EndRegion --%>
                                    <SettingsEditing PopupEditFormWidth="600px" />
                                    <Settings ShowGroupPanel="false" />
                                </dxwgv:ASPxGridView>
                            </td>
                        </tr>
                    </table>            
                </dxw:ContentControl></ContentCollection>
            </dxtc:TabPage>
         
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
                 
                 
    <dxpc:ASPxPopupControl ClientInstanceName="ASPxPopupSelectInsuranceClientControl" ID="pcSelectInsurance" runat="server" 
                                                        EnableClientSideAPI="True" AllowDragging="True" PopupHorizontalAlign="Center" 
                                                        HeaderText="保险公司"  PopupHorizontalOffset="300" 
                                                        PopupVerticalAlign="Middle" PopupVerticalOffset="160"
                                                        Width="360px" Height="320px" 
                                                        EnableTheming="true"  
                                                        AllowResize="false" Modal="true">
                                                        <Border BorderWidth="1px" />
                                            <ClientSideEvents />
                                            </dxpc:ASPxPopupControl>
                                            
</asp:Content>
