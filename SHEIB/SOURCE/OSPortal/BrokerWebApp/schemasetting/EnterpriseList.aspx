<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="EnterpriseList.aspx.cs" Inherits="BrokerWebApp.schemasetting.EnterpriseList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v8.3" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>企业目录</title>
    
    <script type="text/javascript">
    <!--
        function btnCreateCustClassify() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            var custClassifyID = treeList.GetFocusedNodeKey();
            if (custClassifyID != "")
                window.showModalDialog("Enterprise.aspx?action=Add&ID=" + custClassifyID, self, myArguments);
        }

        function btnEditCustClassify() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            var custClassifyID = treeList.GetFocusedNodeKey();
            if (custClassifyID != "" && custClassifyID != "L0")
                window.showModalDialog("Enterprise.aspx?action=Edit&ID=" + custClassifyID, self, myArguments);
        }

        function btnDeleteCustClassify() {
            var custClassifyID = treeList.GetFocusedNodeKey();

            if (custClassifyID == "" || custClassifyID == "L0")
                return false;

            if (!confirm("确定删除选中的企业目录?"))
                return false;

            dxeDeleteCustClassifyCallback.PerformCallback(custClassifyID);
        }
    
        function deleteCustClassifyCallbackComplete(s, e) {
            if (e.result != "" && e.result != "ok") {
                alert(e.result);
                return false;
            }

            if (e.result == "ok") {
                window.location.reload();
            }
        }
    -->
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxcb:ASPxCallback ID="dxeDeleteCustClassifyCallback" ClientInstanceName="dxeDeleteCustClassifyCallback" runat="server" OnCallback="dxeDeleteCustClassifyCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) { deleteCustClassifyCallbackComplete(s, e); }" />
    </dxcb:ASPxCallback>
    <table style="height: 600px;" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
                    <tr style="height: 40px;">
                        <td style="text-align: left; width: 80px;">
                            <dxe:ASPxButton ID="dxebtnCreateCustClassify" ClientInstanceName="dxebtnCreateCustClassify" runat="server" Text="增加目录" AutoPostBack="False">
                                <ClientSideEvents Click="btnCreateCustClassify" />
                            </dxe:ASPxButton>
                        </td>
                        <td style="text-align: left; width: 80px;">
                            <dxe:ASPxButton ID="dxebtnEditCustClassify" ClientInstanceName="dxebtnEditCustClassify" runat="server" Text="修改目录" AutoPostBack="False">
                                <ClientSideEvents Click="btnEditCustClassify" />
                            </dxe:ASPxButton>
                        </td>
                        <td style="text-align: left;">
                            <dxe:ASPxButton ID="dxebtnDeleteCustClassify" ClientInstanceName="dxebtnDeleteCustClassify" runat="server" Text="删除目录" AutoPostBack="False">
                                <ClientSideEvents Click="btnDeleteCustClassify"></ClientSideEvents>
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="400px" Height="500px" View="GroupBox" ShowHeader="False">
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
                        </dxp:PanelContent>
                    </PanelCollection>
                </dxrp:ASPxRoundPanel>
            </td>
        </tr>
    </table>
</asp:Content>
