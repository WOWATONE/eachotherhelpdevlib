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
            //add json
            var parameter = "{\"Action\":\"change\",\"RoleID\":\"" + e.result + "\"}";
            cpSchemaDetailPerformCallback(parameter);
        }

        function treeList_FocusedNodeChanged(s, e) {
            var key = treeList.GetFocusedNodeKey();
            treeList.PerformCustomDataCallback(key); 
        }

        function dxebtnSelectAll_Click(s,e) {
            var tabClientID = tabPrivilege.mainElement.id;
            var currentTabName = tabPrivilege.tabs[tabPrivilege.activeTabIndex].name;
                        
            //var inputs = $("form :checkbox");
            //var inputs = $("#tabPrivilege :checkbox");
            //var inputs = $("#" + tabClientID + " INPUT[type='checkbox']").attr('checked', true);
            var inputs = $("#" + tabClientID + " INPUT[type='checkbox']");
            var chkitem;
            for (i=0; i < inputs.length; i++ )
            {
                chkitem = inputs[i];
                var idstr = chkitem.id;
                var sindex = idstr.lastIndexOf("_");
                var length = idstr.length;
                var pid = idstr.substring(sindex + 1, length);
                var firstPosition = pid.indexOf(currentTabName);
                //debugger;
                if (firstPosition == 0) {
                    chkitem.checked = true;
                }
            }
            
        }

        function dxebtnClearAll_Click(s, e) {
            var tabClientID = tabPrivilege.mainElement.id;
            var currentTabName = tabPrivilege.tabs[tabPrivilege.activeTabIndex].name;
            
            //$("#" + tabClientID + " INPUT[type='checkbox']").attr('checked', false);
            
            var inputs = $("#" + tabClientID + " INPUT[type='checkbox']");
            var chkitem;
            for (i = 0; i < inputs.length; i++) {
                chkitem = inputs[i];
                var idstr = chkitem.id;
                var sindex = idstr.lastIndexOf("_");
                var length = idstr.length;
                var pid = idstr.substring(sindex + 1, length);
                var firstPosition = pid.indexOf(currentTabName);
                //debugger;
                if (firstPosition == 0) {
                    chkitem.checked = false;
                }
            } 
        }

        function dxebtnSavePermission_Click(s, e) {
            var result = $("#<%=selectedRoleID.ClientID %>");
            var roleID = result[0].value;

            var tabClientID = tabPrivilege.mainElement.id;            
            var inputs = $("#" + tabClientID + " INPUT[type='checkbox']");
            var chkitem;
            var jsonListHeader = "{\"RolePrivileges\":[";
            var jsonListFooter = "]}";
            var jsonList = "";
            
            for (i = 0; i < inputs.length; i++) {
                chkitem = inputs[i];

                var idstr = chkitem.id;
                var sindex = idstr.lastIndexOf("_");
                var length = idstr.length;
                var pid = idstr.substring(sindex + 1, length);

                //var otherstr = idstr.substring(0, sindex);
                //sindex = otherstr.lastIndexOf("_");
                //length = otherstr.length;
                //var mid = otherstr.substring(sindex + 1, length);
                 
                if (i > 0) jsonList = jsonList + ",";
                if (chkitem.checked) {
                    jsonList = jsonList + "{\"PrivID\":\"" + pid + "\",\"RoleID\":\"" + roleID + "\",\"Checked\":\"true\"}";
                }
                else {
                    jsonList = jsonList + "{\"PrivID\":\"" + pid + "\",\"RoleID\":\"" + roleID + "\",\"Checked\":\"false\"}";
                }
            }

            //debugger;
            jsonList = jsonListHeader + jsonList + jsonListFooter;
            dxeSaveCallback.PerformCallback(jsonList);            
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
    
    <table style="width:99%">
        <tr>
            <td colspan="2"> 
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
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td valign="top">

                            <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" 
                                Width="300px" Height="500px" View="GroupBox" ShowHeader="False">
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
                                <dxrp:ASPxRoundPanel id="ASPxRoundPanel2" runat="server" HeaderText="部门信息">
                                    <PanelCollection>
                                        <dxrp:PanelContent ID="PanelContent2" runat="server">                 
                                        
                                        <dxcp:ASPxCallbackPanel runat="server" ID="cpSchemaDetail" ClientInstanceName="cpSchemaDetail" 
                                        Height="100%" Width="500px" 
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
                                                                    <input runat="server" type="hidden" id="selectedRoleID" name="selectedRoleID" value="" />
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
                                                        <dxtc:ASPxPageControl ID="tabPrivilege" ClientInstanceName="tabPrivilege" runat="server" 
                                                        ActiveTabIndex="0" EnableHierarchyRecreation="true" 
                                                        ContentStyle-HorizontalAlign="Left" ContentStyle-VerticalAlign="Top"
                                                        TabAlign="Left" TabPosition="Left" Width="500px" AutoPostBack="false" 
                                                        EnableCallBacks="false" EnableViewState="true"
                                                        >
                                                             <TabPages>
                                                                 
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
