<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="ProductTypeList.aspx.cs" Inherits="BrokerWebApp.schemasetting.ProductTypeList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v8.3" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>险种</title>
    <script type="text/javascript">
    <!--
        function btnCreateProductType() {
            var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("ProductType.aspx?Type=AddProductType", self, myArguments);
        }

        function btnEditProductType() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("ProductType.aspx?Type=EditProductType", self, myArguments);
        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=960px;dialogHeight=700px;center=yes;help=no";
            switch (e.buttonID) {
                case "增加":
                    window.showModalDialog("ProductType.aspx?Type=AddProduct", self, myArguments);
                    break
                case "修改":
                    var prodTypeID = s.GetDataRow(e.visibleIndex).cells[1].innerText;
                    window.showModalDialog("ProductType.aspx?Type=EditProduct&ProdTypeID=" + prodTypeID, self, myArguments);
                    break
                default:
                    //do nothing;
            }

        }
    -->
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="height: 600px;" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width:100%;" colspan="3">
                <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
                    <tr style="height:40px;">
                        <td style="text-align: left; width:80px;">
                            <dxe:ASPxButton ID="debtnCreate" runat="server" Text="增加险种" AutoPostBack="False">
                                <ClientSideEvents Click="btnCreateProductType" />
                            </dxe:ASPxButton>
                        </td>
                        <td style="text-align: left; width:80px;">
                            <dxe:ASPxButton ID="debtnEdit" runat="server" Text="修改险种" AutoPostBack="False">
                                <ClientSideEvents Click="btnEditProductType" />
                            </dxe:ASPxButton>
                        </td>
                        <td style="text-align: left;">
                            <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="删除险种" AutoPostBack="False"></dxe:ASPxButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="400px" Height="500px"
                    View="GroupBox" ShowHeader="False">
                    <PanelCollection>
                        <dxp:PanelContent ID="Panelcontent1" runat="server">
                            <dxwtl:ASPxTreeList ID="treeList" ClientInstanceName="treeList" runat="server" Width="100%"
                                SummaryText="Summary"
                                DataCacheMode="Enabled"
                                OnCustomDataCallback="treeList_CustomDataCallback"
                                OnHtmlDataCellPrepared="treeList_HtmlDataCellPrepared">
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
                                                <td>
                                                </td>
                                                <td>
                                                </td>
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
                <div class="Spacer" style="width: 16px;">
                </div>
            </td>
            <td valign="top">
                <dxrp:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowHeader="False" Width="100%">
                    <PanelCollection>
                        <dxrp:PanelContent ID="PanelContent2" runat="server">
                            <dxcp:ASPxCallbackPanel runat="server" ID="cpSchemaDetail" ClientInstanceName="cpSchemaDetail"
                                Height="500px" Width="455px" OnCallback="cpSchemaDetail_Callback" OnCustomJSProperties="cpSchemaDetail_CustomJSProperties">
                                <PanelCollection>
                                    <dxrp:PanelContent ID="PanelContent3" runat="server">
                                        <dxp:ASPxPanel ID="ASPxPanel1" EnableTheming="true" runat="server">
                                            <Border BorderColor="#AECAF0" BorderWidth="1px" />
                                            <Paddings Padding="2px" />
                                            <PanelCollection>
                                                <dxp:PanelContent>
                                                    <table width="100%" cellpadding="5px">
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                上级险种：&nbsp;
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <label id="lblParent" name="lblParent" runat="server"></label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                险种编号：&nbsp;
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <label id="lblProdTypeID" name="lblProdTypeID" runat="server"></label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                险种名称：&nbsp;
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <label id="lblProdTypeName" name="lblProdTypeName" runat="server"></label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;">
                                                                险种大类：&nbsp;
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <label id="lblProdClassName" name="lblProdClassName" runat="server"></label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </dxp:PanelContent>
                                            </PanelCollection>
                                        </dxp:ASPxPanel>
                                        <table width="100%">
                                            <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server"
                                                        KeyFieldName="ProdID" AutoGenerateColumns="False" Settings-ShowFooter="true" SettingsBehavior-AllowSort="false"
                                                        Width="100%" SettingsPager-AlwaysShowPager="true"
                                                        OnRowDeleting="gridSearchResult_RowDeleting"
                                                        OnCustomCallback="gridSearchResult_CustomCallBack">
                                                        <Columns>
                                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" Width="15px" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                                                <NewButton Visible="false" />
                                                                <EditButton Visible="false" />
                                                                <DeleteButton Visible="true" />
                                                                <CustomButtons>
                                                                        <dxwgv:GridViewCommandColumnCustomButton Text="增加">                                                                            
                                                                        </dxwgv:GridViewCommandColumnCustomButton>
                                                                        <dxwgv:GridViewCommandColumnCustomButton Text="修改">
                                                                        </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                                                    </CustomButtons>
                                                            </dxwgv:GridViewCommandColumn>
                                                            <dxwgv:GridViewDataTextColumn Caption="项目编号" FieldName="ProdID" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataTextColumn Caption="项目名称" FieldName="ProdName" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataTextColumn Caption="保费费率" FieldName="PremiumRate" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataTextColumn Caption="经纪费率" FieldName="ProcRate" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                                            </dxwgv:GridViewDataTextColumn>
                                                        </Columns>
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <Settings ShowGroupPanel="false" />
                                                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                                                        <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                                        <SettingsText CustomizationWindowCaption="个性化" />
                                                    </dxwgv:ASPxGridView>
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