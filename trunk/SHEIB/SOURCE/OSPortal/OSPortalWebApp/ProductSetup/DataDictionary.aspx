<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true"
    Theme="Aqua" CodeBehind="DataDictionary.aspx.cs" Inherits="OSPortalWebApp.ProductSetup.DataDictionary"
    Title="" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel"
    TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>数据字典</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="400px" 
                    View="GroupBox" HeaderText="代码类型">
                    <PanelCollection>
                        <dxp:PanelContent ID="Panelcontent1" runat="server">
                            <dxwgv:ASPxGridView ID="gridCodeTypeItem" ClientInstanceName="gridCodeTypeItem" runat="server"
                                KeyFieldName="CodeTypeID" Width="100%" AutoGenerateColumns="False" OnRowInserting="gridCodeTypeItem_RowInserting"
                                OnRowUpdating="gridCodeTypeItem_RowUpdating" OnRowUpdated="gridCodeTypeItem_RowUpdated"
                                OnRowInserted="gridCodeTypeItem_RowInserted" OnRowDeleting="gridCodeTypeItem_RowDeleting"
                                OnRowDeleted="gridCodeTypeItem_RowDeleted" SettingsBehavior-AllowFocusedRow="true">
                                <Columns>
                                    <dxwgv:GridViewCommandColumn Caption="&nbsp;" VisibleIndex="0" Width="15px">
                                        <NewButton Visible="true" />
                                        <EditButton Visible="true" />
                                        <DeleteButton Visible="true" />
                                    </dxwgv:GridViewCommandColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="代码类型" FieldName="CodeTypeID" VisibleIndex="1">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="代码名称" FieldName="Name" VisibleIndex="2">
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <SettingsPager Mode="ShowAllRecords" />
                                <Settings ShowGroupPanel="false" />
                                <Templates>
                                    <EditForm>
                                        <div style="padding: 4px 4px 3px 4px">
                                            <dxwgv:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors"
                                                runat="server">
                                            </dxwgv:ASPxGridViewTemplateReplacement>
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
                <div class="Spacer" style="width: 16px;">
                </div>
            </td>
            <td valign="top">
                <dxrp:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" Width="600px" View="GroupBox"
                    ShowHeader="true" HeaderText="代码表">
                    <PanelCollection>
                        <dxp:PanelContent ID="Panelcontent2" runat="server">
                            <dxwgv:ASPxGridView ID="gridCodeItem" ClientInstanceName="gridCodeItem" runat="server"
                                KeyFieldName="ID" Width="100%" AutoGenerateColumns="False" OnRowInserting="gridCodeItem_RowInserting"
                                OnRowUpdating="gridCodeItem_RowUpdating" OnRowUpdated="gridCodeItem_RowUpdated"
                                OnRowInserted="gridCodeItem_RowInserted" OnRowDeleting="gridCodeItem_RowDeleting"
                                OnRowDeleted="gridCodeItem_RowDeleted">
                                <Columns>
                                    <dxwgv:GridViewCommandColumn Caption="&nbsp;" VisibleIndex="0" Width="15px">
                                        <NewButton Visible="true" />
                                        <EditButton Visible="true" />
                                        <DeleteButton Visible="true" />
                                    </dxwgv:GridViewCommandColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="代码GUID" FieldName="ID" Visible="False" VisibleIndex="1">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="代码类型" FieldName="CodeTypeID" VisibleIndex="1">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="代码编号" FieldName="CodeID" VisibleIndex="2">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="代码名称" FieldName="CodeName" VisibleIndex="3">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="排序序号" FieldName="SortNo" VisibleIndex="4">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="可选内容1" FieldName="Content1" VisibleIndex="5">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="可选内容2" FieldName="Content2" VisibleIndex="6">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="可选内容3" FieldName="Content3" VisibleIndex="7">
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <SettingsPager Mode="ShowAllRecords" />
                                <Settings ShowGroupPanel="false" />
                                <Templates>
                                    <EditForm>
                                        <div style="padding: 4px 4px 3px 4px">
                                            <dxwgv:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors"
                                                runat="server">
                                            </dxwgv:ASPxGridViewTemplateReplacement>
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
        </tr>
    </table>
</asp:Content>
