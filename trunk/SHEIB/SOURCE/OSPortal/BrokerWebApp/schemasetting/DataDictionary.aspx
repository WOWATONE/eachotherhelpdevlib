<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="DataDictionary.aspx.cs" Inherits="BrokerWebApp.schemasetting.DataDictionary" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallbackPanel"TagPrefix="dxcp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>数据字典</title>
    <script type="text/javascript">
        function rowClick(s, e) {
            var codeTypeID = s.GetDataRow(e.visibleIndex).cells[1].innerText;
            if (codeTypeID == "")
                return false;
            cpSchemaDetail.PerformCallback(codeTypeID);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" style="width:400px;">
                <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" View="GroupBox" HeaderText="代码类型">
                    <PanelCollection>
                        <dxp:PanelContent ID="Panelcontent1" runat="server">
                            <dxwgv:ASPxGridView ID="gridCodeTypeItem" 
                                   ClientInstanceName="gridCodeTypeItem" 
                                   runat="server"
                                   KeyFieldName="CodeTypeID" 
                                   Width="100%" 
                                   AutoGenerateColumns="false" 
                                   SettingsBehavior-AllowSort="false"
                                   SettingsBehavior-AllowDragDrop="false"
                                   SettingsBehavior-AllowFocusedRow="true"
                                   OnRowInserting="gridCodeTypeItem_RowInserting"
                                   OnRowUpdating="gridCodeTypeItem_RowUpdating"
                                   OnRowDeleting="gridCodeTypeItem_RowDeleting">
                                <Columns>
                                    <dxwgv:GridViewCommandColumn Caption="&nbsp;" VisibleIndex="0" Width="15px">
                                        <NewButton Visible="true" />
                                        <EditButton Visible="true" />
                                        <DeleteButton Visible="true" />
                                    </dxwgv:GridViewCommandColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="类型编号" FieldName="CodeTypeID" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="类型名称" FieldName="Name" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <SettingsPager Mode="ShowAllRecords" />
                                <Settings ShowGroupPanel="false" />
                                <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                <SettingsText CustomizationWindowCaption="个性化" />
                                <ClientSideEvents RowClick="function(s, e) {rowClick(s,e); return false;}" />
                                <Templates>
                                    <EditForm>
                                        <div style="padding: 4px 4px 3px 4px; text-align: center;">
                                            <table style="width: 70%;" runat="server" id="tblgridCodeTypeItemEditorTemplate">
                                                <tr>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        类型编号：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCodeTypeID" ClientInstanceName="dxetxtCodeTypeID" runat="server" Text='<%# Eval("CodeTypeID") %>'></dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="white-space: nowrap; text-align: right;">
                                                        类型名称：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtName" ClientInstanceName="dxetxtName" runat="server" Text='<%# Eval("Name") %>'></dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="text-align: right; padding: 2px 2px 2px 2px">
                                            <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                runat="server">
                                            </dxwgv:ASPxGridViewTemplateReplacement>
                                            <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                runat="server">
                                            </dxwgv:ASPxGridViewTemplateReplacement>
                                        </div>
                                    </EditForm>
                                </Templates>
                            </dxwgv:ASPxGridView>
                        </dxp:PanelContent>
                    </PanelCollection>
                </dxrp:ASPxRoundPanel>
            </td>
            <td>
                <div class="Spacer" style="width: 16px;"></div>
            </td>
            <td valign="top" style="width:600px;">
                <dxrp:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" Width="100%" View="GroupBox" ShowHeader="true" HeaderText="代码表">
                    <PanelCollection>
                        <dxrp:PanelContent ID="Panelcontent2" runat="server">
                            <dxcp:ASPxCallbackPanel runat="server" ID="cpSchemaDetail" ClientInstanceName="cpSchemaDetail" OnCallback="cpSchemaDetail_Callback">
                                <PanelCollection>
                                    <dxrp:PanelContent ID="PanelContent3" runat="server">
                                        <dxwgv:ASPxGridView ID="gridCodeItem" 
                                               ClientInstanceName="gridCodeItem" 
                                               runat="server"
                                               KeyFieldName="CodeID"
                                               Width="100%" 
                                               AutoGenerateColumns="False" 
                                               SettingsBehavior-AllowSort="false"
                                               SettingsBehavior-AllowDragDrop="false"
                                               OnRowInserting="gridCodeItem_RowInserting"
                                               OnRowUpdating="gridCodeItem_RowUpdating" 
                                               OnRowDeleting="gridCodeItem_RowDeleting">
                                            <Columns>
                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" VisibleIndex="0" Width="15px">
                                                    <NewButton Visible="true" />
                                                    <EditButton Visible="true" />
                                                    <DeleteButton Visible="true" />
                                                </dxwgv:GridViewCommandColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="代码编号" FieldName="CodeID" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="代码名称" FieldName="CodeName" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="排序序号" FieldName="SortNo" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="可选内容1" FieldName="Content1" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="可选内容2" FieldName="Content2" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="可选内容3" FieldName="Content3" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                                </dxwgv:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsPager Mode="ShowAllRecords" />
                                            <Settings ShowGroupPanel="false" />
                                            <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                            <SettingsText CustomizationWindowCaption="个性化" />
                                            <Templates>
                                                <EditForm>
                                                    <div style="padding: 4px 4px 3px 4px; text-align: center;">
                                                        <table style="width: 70%;" runat="server" id="tblgridCodeItemEditorTemplate">
                                                            <tr>
                                                                <td style="white-space: nowrap; text-align: right;">
                                                                    代码编号：
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxTextBox ID="dxetxtCodeID" ClientInstanceName="dxetxtCodeID" runat="server" Text='<%# Eval("CodeID") %>'></dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="white-space: nowrap; text-align: right;">
                                                                    代码名称：
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxTextBox ID="dxetxtCodeName" ClientInstanceName="dxetxtCodeName" runat="server" Text='<%# Eval("CodeName") %>'></dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="white-space: nowrap; text-align: right;">
                                                                    排序序号：
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxTextBox ID="dxetxtSortNo" ClientInstanceName="dxetxtSortNo" runat="server" Text='<%# Eval("SortNo") %>'></dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="white-space: nowrap; text-align: right;">
                                                                    可选内容1：
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxTextBox ID="dxetxtContent1" ClientInstanceName="dxetxtContent1" runat="server" Text='<%# Eval("Content1") %>'></dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="white-space: nowrap; text-align: right;">
                                                                    可选内容2：
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxTextBox ID="dxetxtContent2" ClientInstanceName="dxetxtContent2" runat="server" Text='<%# Eval("Content2") %>'></dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="white-space: nowrap; text-align: right;">
                                                                    可选内容3：
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxTextBox ID="dxetxtContent3" ClientInstanceName="dxetxtContent3" runat="server" Text='<%# Eval("Content3") %>'></dxe:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                            runat="server">
                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                            runat="server">
                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                    </div>
                                                </EditForm>
                                            </Templates>
                                        </dxwgv:ASPxGridView>
                                        <input type="hidden" id="hidCodeTypeID" name="hidCodeTypeID" value="" runat="server" />
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