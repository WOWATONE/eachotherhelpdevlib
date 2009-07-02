<%@ Page Title="组织机构维护" Language="C#" Theme="Aqua" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" CodeBehind="DepartmentManager.aspx.cs" Inherits="BrokerWebApp.schemasetting.DepartmentManager" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v8.3" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>组织机构维护</title>
    <script type="text/javascript">
    <!--
        function btnCreateDepartment() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            var deptID = treeList.GetFocusedNodeKey();
            if (deptID != "")
                window.showModalDialog("DepartmentEdit.aspx?action=Add&ID=" + deptID, self, myArguments);
        }

        function btnEditDepartment() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            var deptID = treeList.GetFocusedNodeKey();
            if (deptID != "" && deptID != "L0")
                window.showModalDialog("DepartmentEdit.aspx?action=Edit&ID=" + deptID, self, myArguments);
        }

        function btnDeleteDepartment() {
            var deptID = treeList.GetFocusedNodeKey();

            if (deptID == "" || deptID == "L0")
                return false;

            if (!confirm("确定删除选中的部门?"))
                return false;

            dxeDeleteDepartmentCallback.PerformCallback(deptID);
        }
        
        function deleteDepartmentCallbackComplete(s, e) {
            if (e.result != "" && e.result != "ok") {
                alert(e.result);
                return false;
            }

            if (e.result == "ok") {
                window.location.reload();
            }
        }

        function treeList_FocusedNodeChanged(s, e) {
            var key = treeList.GetFocusedNodeKey();
            cpSchemaDetail.PerformCallback(key);
        }
    -->
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxcb:ASPxCallback ID="dxeDeleteDepartmentCallback" ClientInstanceName="dxeDeleteDepartmentCallback" runat="server" OnCallback="dxeDeleteDepartmentCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) { deleteDepartmentCallbackComplete(s, e); }" />
    </dxcb:ASPxCallback>
    <table style="height: 600px;" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
                    <tr style="height: 40px;">
                        <td style="text-align: left; width: 80px;">
                            <dxe:ASPxButton ID="dxebtnCreateDepartment" ClientInstanceName="dxebtnCreateDepartment" runat="server" Text="增加部门" AutoPostBack="False">
                                <ClientSideEvents Click="btnCreateDepartment" />
                            </dxe:ASPxButton>
                        </td>
                        <td style="text-align: left; width: 80px;">
                            <dxe:ASPxButton ID="dxebtnEditDepartment" ClientInstanceName="dxebtnEditDepartment" runat="server" Text="修改部门" AutoPostBack="False">
                                <ClientSideEvents Click="btnEditDepartment" />
                            </dxe:ASPxButton>
                        </td>
                        <td style="text-align: left;">
                            <dxe:ASPxButton ID="dxebtnDeleteDepartment" ClientInstanceName="dxebtnDeleteDepartment" runat="server" Text="删除部门" AutoPostBack="False">
                                <ClientSideEvents Click="btnDeleteDepartment"></ClientSideEvents>
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                </table>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td valign="top">
                <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="400px" Height="500px"
                    View="GroupBox" ShowHeader="False">
                    <PanelCollection>
                        <dxp:PanelContent ID="Panelcontent1" runat="server">
                            <dxwtl:ASPxTreeList ID="treeList" ClientInstanceName="treeList" runat="server" Width="100%"
                                SummaryText="Summary" DataCacheMode="Enabled" >
                                <Columns>
                                    <dxwtl:TreeListTextColumn FieldName="Name">
                                        <PropertiesTextEdit EncodeHtml="True" />
                                    </dxwtl:TreeListTextColumn>
                                </Columns>
                                <Settings ShowColumnHeaders="false" />
                                <SettingsBehavior AllowFocusedNode="True" ExpandCollapseAction="NodeDblClick" />
                                <ClientSideEvents FocusedNodeChanged="function(s, e) { 
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
                        </dxp:PanelContent>
                    </PanelCollection>
                </dxrp:ASPxRoundPanel>
            </td>
            <td>
                <div class="Spacer" style="width: 16px;"></div>
            </td>
            <td valign="top">
                <dxrp:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowHeader="False" Width="100%">
                    <PanelCollection>
                        <dxrp:PanelContent ID="PanelContent2" runat="server">
                            <dxcp:ASPxCallbackPanel runat="server" ID="cpSchemaDetail" ClientInstanceName="cpSchemaDetail"
                                Height="500px" Width="455px" OnCallback="cpSchemaDetail_Callback">
                                <PanelCollection>
                                    <dxrp:PanelContent ID="PanelContent3" runat="server">
                                        <table width="100%" cellpadding="5px">
                                            <tr>
                                                <td style="text-align: left; width:100px;">
                                                    部门编号：&nbsp;
                                                </td>
                                                <td style="text-align: left;">
                                                    <label id="lblDeptID" name="lblDeptID" runat="server">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;">
                                                    部门名称：&nbsp;
                                                </td>
                                                <td style="text-align: left;">
                                                    <label id="lblDeptName" name="lblDeptName" runat="server">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;">
                                                    部门简称：&nbsp;
                                                </td>
                                                <td style="text-align: left;">
                                                    <label id="lblShortName" name="lblShortName" runat="server">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;">
                                                    部门经理：&nbsp;
                                                </td>
                                                <td style="text-align: left;">
                                                    <label id="lblManager" name="lblManager" runat="server">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;">
                                                    上级部门编号：&nbsp;
                                                </td>
                                                <td style="text-align: left;">
                                                    <label id="lblParentID" name="lblParentID" runat="server">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;">
                                                    上级部门名称：&nbsp;
                                                </td>
                                                <td style="text-align: left;">
                                                    <label id="lblParentName" name="lblParentName" runat="server">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;">
                                                    部门电话：&nbsp;
                                                </td>
                                                <td style="text-align: left;">
                                                    <label id="lblTel" name="lblTel" runat="server">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;">
                                                    部门传真：&nbsp;
                                                </td>
                                                <td style="text-align: left;">
                                                    <label id="lblFax" name="lblFax" runat="server">
                                                    </label>
                                                </td>
                                            </tr>
                                        </table>
                                    </dxrp:PanelContent>
                                </PanelCollection>
                            </dxcp:ASPxCallbackPanel>
                        </dxrp:PanelContent>
                    </PanelCollection>
                </dxrp:ASPxRoundPanel>
            </td>
        </tr>
    </table>
</asp:Content>
