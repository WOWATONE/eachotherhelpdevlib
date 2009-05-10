<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true"
    Theme="Aqua" CodeBehind="ClaimMaterial.aspx.cs" Inherits="OSPortalWebApp.CustomerClaim.ClaimMaterial"
    Title="" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>理赔资料</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <asp:Panel ID="npCaseEnd" runat="server" CssClass="collapsePanel">
        <table style="width: 100%;">
            <tr>
                <td style="width: 100%;">
                    <asp:Panel ID="npAlertCustomHeader" runat="server" CssClass="collapsePanelHeader"
                        Height="15px">
                        &nbsp;理赔所需资料</asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="gridMaterial" ClientInstanceName="gridMaterial" runat="server"
                        KeyFieldName="ID" Width="100%" AutoGenerateColumns="False" OnRowInserting="gridMaterial_RowInserting"
                        OnRowUpdating="gridMaterial_RowUpdating" OnRowUpdated="gridMaterial_RowUpdated"
                        OnRowInserted="gridMaterial_RowInserted" OnRowDeleting="gridMaterial_RowDeleting"
                        OnRowDeleted="gridMaterial_RowDeleted">
                        <Columns>
                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" VisibleIndex="0" Width="15px">
                                <NewButton Visible="true" />
                                <EditButton Visible="true" />
                                <DeleteButton Visible="true" />
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn Caption="序号" FieldName="ID" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="资料" FieldName="Material" VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="状态" FieldName="MaterialState" VisibleIndex="3">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowAllRecords" />
                        <Settings ShowGroupPanel="false" />
                        <Templates>
                            <EditForm>
                                <div style="padding: 4px 4px 3px 4px; text-align: center;">
                                    <table style="width: 100%;" runat="server" id="tblgridMaterialItemEditorTemplate">
                                        <tr>
                                            <td style="width: 20%; text-align: right;">
                                                资料：
                                            </td>
                                            <td style="width: 30%; text-align: left;">
                                                <asp:TextBox runat="server" ID="txtMaterial" Text='<%# Eval("Material") %>'></asp:TextBox>
                                            </td>
                                            <td style="width: 20%; text-align: right;">
                                                状态：
                                            </td>
                                            <td style="width: 30%; text-align: left;">
                                                <asp:DropDownList runat="server" ID="ddlMaterialState">
                                                    <asp:ListItem Text="未提供" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="已提供" Value="2"></asp:ListItem>
                                                </asp:DropDownList>
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
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
