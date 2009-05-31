<%@ Page Title="用户权限定义" Language="C#" Theme="Aqua" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" CodeBehind="RolePermission.aspx.cs" Inherits="BrokerWebApp.schemasetting.RolePermission" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dxdv" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v8.3" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户权限定义</title>
    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});

        });


        function treeList_CustomDataCallbackComplete(s, e) {
            cpSchemaDetailPerformCallback(e.result);
        }

        function treeList_FocusedNodeChanged(s, e) {
            var key = treeList.GetFocusedNodeKey();
            treeList.PerformCustomDataCallback(key); 
        }

        function dxebtnSelectAll_Click(s,e) {
            //
        }

        function dxebtnClearAll_Click(s, e) {
            //
        }

        function dxebtnSavePermission_Click(s, e) {
            dxeSaveCallback.PerformCallback();
        }

        function cpSchemaDetailPerformCallback(parameter) {
            cpSchemaDetail.PerformCallback(parameter);
        }

        function cpSchemaDetail_Init(s,e) {
            //do not ini.
        }

        function cpSchemaDetail_OnEndCallback() {
            //do nothing;
        }

        function saveCallbackComplete(s, e) {
            //do nothing;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <dxcb:ASPxCallback ID="dxeSaveCallback" ClientInstanceName="dxeSaveCallback" runat="server" OnCallback="dxeSaveCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {saveCallbackComplete(s,e);}" />        
    </dxcb:ASPxCallback>
    
    <table style="width:100%">
        <tr>
            <td style="width:100%;" colspan="2"> 
                <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                        </div>
                        <div style="float:left; margin-left:5px;">角色权限</div>
                        <div style="float:left; margin-left:5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(展开)</asp:Label>
                        </div>
                        
                    </div>
                </asp:Panel>                           
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table runat="server" id="tblerrmsg" visible="false">
                        <tr>
                            <td style=" width:100px;">&nbsp;</td>
                            <td class="red"></td>
                        </tr>
                    </table>
                                    
                                    
                    <table style="height:500px;" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width:20px;">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><input type="hidden" id="originalID" runat="server" /></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td valign="top">

                            <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" 
                                Width="400px" Height="500px" View="GroupBox" ShowHeader="False">
                                 <PanelCollection>
                                     <dxp:panelcontent ID="Panelcontent1" runat="server">
                                         <dxwtl:ASPxTreeList ID="treeList" ClientInstanceName="treeList" 
                                         runat="server" Width="100%" SummaryText="Summary" 
                                         DataCacheMode="Enabled"
                                         OnCustomDataCallback="treeList_CustomDataCallback" 
                                         OnHtmlDataCellPrepared="treeList_HtmlDataCellPrepared" >
                                             <Columns>
                                                 <dxwtl:TreeListTextColumn FieldName="Name">
                                                     <PropertiesTextEdit EncodeHtml="True" />
                                                 </dxwtl:TreeListTextColumn>                        
                                             </Columns>                    
                                             <Settings ShowColumnHeaders="false" /> 
                                             <SettingsText />
                                             <SettingsBehavior AllowFocusedNode="True" ExpandCollapseAction="NodeDblClick" />
                                             <ClientSideEvents 
                                                CustomDataCallback="function(s, e) { 
                                                    treeList_CustomDataCallbackComplete(s, e); 
                                                    }"
                                                FocusedNodeChanged="function(s, e) { 
                                                    treeList_FocusedNodeChanged(s,e);
                                                }" />
                                            <Styles>
                                                <Indent BackColor="Transparent" />
                                                <IndentWithButton BackColor="Transparent" />
                                                <Node BackColor="Transparent" />
                                                <Cell>
                                                    <Paddings PaddingLeft="1px" />
                                                </Cell>
                                            </Styles>
                                            <Templates>
                                                <DataCell>
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td style="padding-bottom: 1px;"> 
                                                                <%# Container.Text %>                             
                                                            </td>
                                                        </tr>
                                                    </table>                            
                                                </DataCell>
                                            </Templates>                     
                                            <Border BorderWidth="0" />
                                            <SettingsBehavior ExpandCollapseAction="NodeDblClick" />
                                         </dxwtl:ASPxTreeList>
                                     </dxp:panelcontent>
                                 </PanelCollection>
                             </dxrp:ASPxRoundPanel>

                            </td>
                        
                        
                            <td>
                                <div class="Spacer" style="width: 16px;"></div>
                            </td>
                        
                        
                            <td valign="top">
                                <dxrp:ASPxRoundPanel id="ASPxRoundPanel2" runat="server" HeaderText="部门信息" Width="100%">
                                    <PanelCollection>
                                        <dxrp:PanelContent ID="PanelContent2" runat="server">                 
                                        
                                        <dxcp:ASPxCallbackPanel runat="server" ID="cpSchemaDetail" ClientInstanceName="cpSchemaDetail" 
                                        Height="500px" Width="455px" 
                                        OnCallback="cpSchemaDetail_Callback" 
                                        OnCustomJSProperties="cpSchemaDetail_CustomJSProperties">
                                         <ClientSideEvents 
                                            Init="function(s, e) { cpSchemaDetail_Init(s,e); }" 
                                            EndCallback="cpSchemaDetail_OnEndCallback"></ClientSideEvents>
                                         <PanelCollection>
                                         <dxrp:PanelContent ID="PanelContent3" runat="server">
                                            <dxp:ASPxPanel ID="ASPxPanel1" EnableTheming="true" runat="server">
                                                <Border BorderColor="#AECAF0" BorderWidth="1px" />
                                                <Paddings Padding="2px" />
                                                <PanelCollection>
                                                    <dxp:PanelContent>
                                                        <table style="text-align:left;" width="100%" cellpadding="5px" >
                                                            <tr>
                                                                <td style="text-align:right; width:80px;">角色编号：</td>
                                                                <td style="text-align:left; width:200px;">
                                                                    <dxe:ASPxLabel runat="server" ID="dxelblRoleNo" ClientInstanceName="dxelblRoleNo"></dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align:right;"></td>
                                                                <td style="text-align:left;"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align:right;">角色名称：</td>
                                                                <td style="text-align:left;">
                                                                    <dxe:ASPxLabel runat="server" ID="dxelblRoleName" ClientInstanceName="dxelblRoleName"></dxe:ASPxLabel>
                                                                </td>
                                                                <td style="text-align:right;"></td>
                                                                <td style="text-align:left;"></td>
                                                            </tr>
                                                        </table>
                                                    </dxp:PanelContent>
                                                </PanelCollection>
                                            </dxp:ASPxPanel>
                                            <table width="100%">                            
                                                <tr>
                                                    <td colspan="4">
                                                        <dxtc:ASPxPageControl ID="carTabPage" runat="server" 
                                                        ActiveTabIndex="0" EnableHierarchyRecreation="True"
                                                        TabAlign="Left" TabPosition="Left" Width="450"
                                                        >
                                                             <TabPages>
                                                                 <dxtc:TabPage Text="系统设置" Name="tabSystemSetting">
                                                                     <ContentCollection><dxw:ContentControl ID="ContentControl1" runat="server">
                                                                        <asp:CheckBoxList runat="server" ID="chklSystemStting">
                                                                            <asp:ListItem Text="数据备份" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="数据恢复" Value="2"></asp:ListItem>
                                                                        </asp:CheckBoxList>
                                                                     </dxw:ContentControl></ContentCollection>
                                                                 </dxtc:TabPage>
                                                                 <dxtc:TabPage Text="客户理赔" Name="tabCustomerPayManager">
                                                                     <ContentCollection><dxw:ContentControl ID="ContentControl2" runat="server">
                                                                        <asp:CheckBoxList runat="server" ID="chklCustomerPayManager">
                                                                            <asp:ListItem Text="报案新增" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="报案修改" Value="2"></asp:ListItem>
                                                                        </asp:CheckBoxList>
                                                                     </dxw:ContentControl></ContentCollection>
                                                                 </dxtc:TabPage>
                                                                 <dxtc:TabPage Text="项目管理" Name="tabProjectManager">
                                                                     <ContentCollection><dxw:ContentControl ID="ContentControl3" runat="server">
                                                                        <asp:CheckBoxList runat="server" ID="chklProjectManager">
                                                                            <asp:ListItem Text="项目设置" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="项目立项" Value="2"></asp:ListItem>
                                                                        </asp:CheckBoxList>
                                                                     </dxw:ContentControl></ContentCollection>
                                                                 </dxtc:TabPage>
                                                                 <dxtc:TabPage Text="风险数据" Name="tabRiskData">
                                                                     <ContentCollection><dxw:ContentControl ID="ContentControl4" runat="server">
                                                                        <asp:CheckBoxList runat="server" ID="chklRiskData">
                                                                            <asp:ListItem Text="风险数据查看" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="风险数据设置" Value="2"></asp:ListItem>
                                                                        </asp:CheckBoxList>
                                                                     </dxw:ContentControl></ContentCollection>
                                                                 </dxtc:TabPage>
                                                                 <dxtc:TabPage Text="信息中心" Name="tabInfoCenter">
                                                                     <ContentCollection><dxw:ContentControl ID="ContentControl5" runat="server">
                                                                        <asp:CheckBoxList runat="server" ID="chklInfoCenter">
                                                                            <asp:ListItem Text="法律法规查看" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="法律法规设置" Value="2"></asp:ListItem>
                                                                        </asp:CheckBoxList>
                                                                     </dxw:ContentControl></ContentCollection>
                                                                 </dxtc:TabPage>
                                                                 <dxtc:TabPage Text="保单处理" Name="tabPolicyManager">
                                                                     <ContentCollection><dxw:ContentControl ID="ContentControl6" runat="server">
                                                                        <asp:CheckBoxList runat="server" ID="chklPolicyManager">
                                                                            <asp:ListItem Text="保单新增" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="保单修改" Value="2"></asp:ListItem>
                                                                        </asp:CheckBoxList>
                                                                     </dxw:ContentControl></ContentCollection>
                                                                 </dxtc:TabPage>
                                                                 <dxtc:TabPage Text="收付结算" Name="tabPayCutOff">
                                                                     <ContentCollection><dxw:ContentControl ID="ContentControl7" runat="server">
                                                                        <asp:CheckBoxList runat="server" ID="chklPayCutOff">
                                                                            <asp:ListItem Text="佣金设置" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="佣金审核" Value="2"></asp:ListItem>
                                                                        </asp:CheckBoxList>
                                                                     </dxw:ContentControl></ContentCollection>
                                                                 </dxtc:TabPage>
                                                                 <dxtc:TabPage Text="客户服务" Name="tabCustomerService">
                                                                     <ContentCollection><dxw:ContentControl ID="ContentControl8" runat="server">
                                                                        <asp:CheckBoxList runat="server" ID="chklCustomerService">
                                                                            <asp:ListItem Text="销售跟进维护" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="销售跟进查看" Value="2"></asp:ListItem>
                                                                        </asp:CheckBoxList>
                                                                     </dxw:ContentControl></ContentCollection>
                                                                 </dxtc:TabPage>
                                                                 <dxtc:TabPage Text="单证管理" Name="tabVioceManager">
                                                                     <ContentCollection><dxw:ContentControl ID="ContentControl9" runat="server">
                                                                        <asp:CheckBoxList runat="server" ID="chklVioceManager">
                                                                            <asp:ListItem Text="单证查看" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="单证处理" Value="2"></asp:ListItem>
                                                                        </asp:CheckBoxList>
                                                                     </dxw:ContentControl></ContentCollection>
                                                                 </dxtc:TabPage>
                                                                 <dxtc:TabPage Text="组织管理" Name="tabSchemaManager">
                                                                     <ContentCollection><dxw:ContentControl ID="ContentControl10" runat="server">
                                                                        <asp:CheckBoxList runat="server" ID="chklSchemaManager">
                                                                            <asp:ListItem Text="职位查看" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="职位设置" Value="2"></asp:ListItem>
                                                                        </asp:CheckBoxList>
                                                                     </dxw:ContentControl></ContentCollection>
                                                                 </dxtc:TabPage>
                                                                 <dxtc:TabPage Text="产品管理" Name="tabProductManager">
                                                                     <ContentCollection><dxw:ContentControl ID="ContentControl11" runat="server">
                                                                        <asp:CheckBoxList runat="server" ID="chklProductManager">
                                                                            <asp:ListItem Text="保险公司查看" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="保险公司设置" Value="2"></asp:ListItem>
                                                                        </asp:CheckBoxList>
                                                                     </dxw:ContentControl></ContentCollection>
                                                                 </dxtc:TabPage>
                                                             </TabPages>
                                                        </dxtc:ASPxPageControl>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table>
                                                <tr>
                                                    <td style="width:100px;">&nbsp;</td>
                                                    <td>
                                                        <dxe:ASPxButton id="dxebtnSelectAll" runat="server" Text="全部选中" AutoPostBack="False" ClientInstanceName="dxebtnSelectAll">
                                                         <ClientSideEvents Click="function(s, e) { dxebtnSelectAll_Click(s,e); }"></ClientSideEvents>
                                                        </dxe:ASPxButton>
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxButton id="dxebtnClearAll" runat="server" Text="全部清除" AutoPostBack="False" ClientInstanceName="dxebtnClearAll">
                                                         <ClientSideEvents Click="function(s, e) { dxebtnClearAll_Click(s,e); }"></ClientSideEvents>
                                                        </dxe:ASPxButton>
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxButton id="dxebtnSavePermission" runat="server" Text="保存权限" AutoPostBack="False" ClientInstanceName="dxebtnSavePermission">
                                                         <ClientSideEvents Click="function(s, e) { dxebtnSavePermission_Click(s,e); }"></ClientSideEvents>
                                                        </dxe:ASPxButton>
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxButton id="dxebtnClose" runat="server" Text="关闭" AutoPostBack="False" ClientInstanceName="dxebtnClose">
                                                         <ClientSideEvents Click="function(s, e) { window.close(); }"></ClientSideEvents>
                                                        </dxe:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>

                                         </dxrp:PanelContent>
                                         </PanelCollection>
                                     </dxcp:ASPxCallbackPanel>
                                     
                                      
                                    </dxrp:PanelContent></PanelCollection>
                                </dxrp:ASPxRoundPanel>
                            </td>
                        </tr>
                    </table>
                    
                    
                    <table>
                        <tr>
                            <td style=" width:100px;">&nbsp;</td>
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
    </table>
                    
                    
</asp:Content>
