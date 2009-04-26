<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="DepartmentManager.aspx.cs" Inherits="OSPortalWebApp.schemasetting.DepartmentManager" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v8.3" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dxdv" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});

        });


        function treeList_CustomDataCallback(s,e) {
            //document.getElementById('messageText').innerHTML = e.result;
        }

        function treeList_FocusedNodeChanged(s, e) {
            //var key = treeList.GetFocusedNodeKey();
            //treeList.PerformCustomDataCallback(key); 
        }

        function dpbtnSelectAll_Click(s,e) {
            //cpSchemaDetailPerformCallback('next');
        }

        function dpbtnClearAll_Click(s, e) {
            //cpSchemaDetailPerformCallback('next');
        }

        function dpbtnSavePermission_Click(s, e) {
            cpSchemaDetailPerformCallback('next');
        }

        function cpSchemaDetailPerformCallback(command) {
            cpSchemaDetail.PerformCallback(cpSchemaDetail.cpPageIndex + ':' + command);
        }
        function cpSchemaDetail_Init() {
            var pageNumber = cpSchemaDetail.cpPageIndex + 1;
            var isFirst = (cpSchemaDetail.cpPageIndex == 0);
            var isLast = (cpSchemaDetail.cpPageIndex == (cpSchemaDetail.cpPageCount - 1));
            //lbPageInfo.SetText('Page: ' + pageNumber + ' of ' + CallbackPanel.cpPageCount);
            //btPrev.SetEnabled(!isFirst);
            //btNext.SetEnabled(!isLast);
        }
        
        function cpSchemaDetail_OnEndCallback() {
        //
        }     
        
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table style="height:500px;" border="0" cellpadding="0" cellspacing="0">
        <tr>
        <td colspan="2"></td>
        <td>
        </td>
        </tr>
        <tr><td valign="top">

            <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" 
                Width="400px" Height="500px" View="GroupBox" ShowHeader="False">
                 <PanelCollection>
                     <dxp:panelcontent ID="Panelcontent1" runat="server">
                         <dxwtl:ASPxTreeList ID="treeList" ClientInstanceName="treeList" 
                         runat="server" Width="100%" SummaryText="Summary"
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
                                    treeList_CustomDataCallback(s, e); 
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
                                            <td>
                                                <dxe:ASPxImage ID="ASPxImage1" runat="server" ImageUrl='<%# GetIconUrl(Container) %>' 
                                                    Width="16" Height="16" IsPng="true" />                                    
                                            </td>
                                            <td> </td>
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
                    Height="330px" Width="455px" 
                    OnCallback="cpSchemaDetail_Callback" 
                    OnCustomJSProperties="cpSchemaDetail_CustomJSProperties">
                     <ClientSideEvents 
                        Init="function(s, e) { cpSchemaDetail_Init(); }" 
                        EndCallback="cpSchemaDetail_OnEndCallback"></ClientSideEvents>
                     <PanelCollection>
                     <dxrp:PanelContent ID="PanelContent3" runat="server">
                        <table width="100%">
                            <tr>
                                <td>部门(中):</td>
                                <td>业务部</td>
                                <td>地区:</td>
                                <td>上海</td>
                            </tr>
                            <tr>
                                <td>部门(英):</td>
                                <td>Business deparment</td>
                                <td>邮编:</td>
                                <td>200000</td>
                            </tr>
                            <tr>
                                <td>部门编号:</td>
                                <td>06</td>
                                <td>部门简称:</td>
                                <td>Business</td>
                            </tr>
                            <tr>
                                <td>详细地址:</td>
                                <td>上海江宁</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>电话:</td>
                                <td>88888888</td>
                                <td>传真:</td>
                                <td>99999999</td>
                            </tr>
                            <tr>
                                <td>电子邮箱:</td>
                                <td>test@test.com</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>负责人:</td>
                                <td>Mr</td>
                                <td>成立日期:</td>
                                <td>2008-08-08</td>
                            </tr>
                            
                            <tr>
                                <td colspan="4">
                                    <dxtc:ASPxPageControl ID="carTabPage" runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True">
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
                            <tr>
                                <td></td>
                                <td>
                                    <dxe:ASPxButton id="dpbtnSelectAll" runat="server" Text="全部选中" AutoPostBack="False" ClientInstanceName="dpbtnSelectAll">
                                     <ClientSideEvents Click="function(s, e) { dpbtnSelectAll_Click(s,e); }"></ClientSideEvents>
                                    </dxe:ASPxButton>
                                </td>
                                <td>
                                    <dxe:ASPxButton id="dpbtnClearAll" runat="server" Text="全部清除" AutoPostBack="False" ClientInstanceName="dpbtnClearAll">
                                     <ClientSideEvents Click="function(s, e) { dpbtnClearAll_Click(s,e); }"></ClientSideEvents>
                                    </dxe:ASPxButton>
                                </td>
                                <td>
                                    <dxe:ASPxButton id="dpbtnSavePermission" runat="server" Text="保存权限" AutoPostBack="False" ClientInstanceName="dpbtnSavePermission">
                                     <ClientSideEvents Click="function(s, e) { dpbtnSavePermission_Click(s,e); }"></ClientSideEvents>
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
    
</asp:Content>
