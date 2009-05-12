<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true"
    Theme="Aqua" CodeBehind="BusinessConsult.aspx.cs" Inherits="OSPortalWebApp.BusinessConsult.BusinessConsult"
    Title="" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>咨询录入</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width: 99%">
        <tr style="height: 10px;">
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npbasicheader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npbasicheader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            基本信息
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npbasicheader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npbasicdetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                咨询号：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:TextBox ID="txtConsultNO" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                咨询日期：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <dxe:ASPxDateEdit ID="deConsultDate" runat="server">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                客户经理：
                            </td>
                            <td style="width: 26%; text-align: left;">
                                <asp:DropDownList runat="server" ID="ddlSales" Width="175px">
                                    <asp:ListItem Text="张三" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                客户：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:TextBox ID="txtCustName" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                联系人：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:TextBox ID="txtLinkMan" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                联系方式：
                            </td>
                            <td style="width: 26%; text-align: left;">
                                <asp:TextBox ID="txtContactType" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeBasic" runat="Server" TargetControlID="npbasicdetail"
                    ExpandControlID="npbasicheader" CollapseControlID="npbasicheader" Collapsed="false"
                    TextLabelID="lbl_npbasicheader" ImageControlID="img_npbasicheader" ExpandedText="(隐藏)"
                    CollapsedText="(展开)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npConsultFeeItemHeader" runat="server" CssClass="collapsePanelHeader"
                    Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npConsultFeeItem" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            咨询费用</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npConsultFeeItem" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npConsultFeeItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 8%; text-align: right;">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dxwgv:ASPxGridView ID="gridConsultFeeItem" ClientInstanceName="gridConsultFeeItem"
                                    runat="server" KeyFieldName="ConsultFeeID" Width="100%" AutoGenerateColumns="False"
                                    OnRowInserting="gridConsultFeeItem_RowInserting" OnRowUpdating="gridConsultFeeItem_RowUpdating"
                                    OnRowUpdated="gridConsultFeeItem_RowUpdated" OnRowInserted="gridConsultFeeItem_RowInserted"
                                    OnRowDeleting="gridConsultFeeItem_RowDeleting" OnRowDeleted="gridConsultFeeItem_RowDeleted">
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;" VisibleIndex="0" Width="15px">
                                            <NewButton Visible="True" />
                                            <EditButton Visible="true" />
                                            <DeleteButton Visible="true" />
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="序号" FieldName="ConsultFeeID" VisibleIndex="1">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="项目" FieldName="Product" VisibleIndex="2">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="咨询费" FieldName="ConsultFee" VisibleIndex="3">
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
                            </td>
                        </tr>
                        <tr>
                            <td>
                                咨询费（总）：<asp:TextBox ID="txtTotalConsultFee" runat="server" Width="200px"></asp:TextBox>&nbsp;
                                发票号：<asp:TextBox ID="txtInvoiceNO" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeConsultFeeItem" runat="Server" TargetControlID="npConsultFeeItemDetail"
                    ExpandControlID="npConsultFeeItemHeader" CollapseControlID="npConsultFeeItemHeader"
                    Collapsed="false" TextLabelID="lbl_npConsultFeeItem" ImageControlID="img_npConsultFeeItem"
                    ExpandedText="(隐藏)" CollapsedText="(展开)" ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npFeeHeader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npFeeHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            收费信息
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npFeeHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npFeeDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                收费人：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:DropDownList runat="server" ID="ddlFeePersion" Width="175px">
                                    <asp:ListItem Text="张三" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                收费时间：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <dxe:ASPxDateEdit ID="deFeeDate" runat="server">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 8%; text-align: right;">
                            </td>
                            <td style="width: 26%; text-align: left;">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="coeFee" runat="Server" TargetControlID="npFeeDetail"
                    ExpandControlID="npFeeHeader" CollapseControlID="npFeeHeader" Collapsed="false"
                    TextLabelID="lbl_npFeeHeader" ImageControlID="img_npFeeHeader" ExpandedText="(隐藏)"
                    CollapsedText="(展开)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npCreateHeader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npCreateHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            其他
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npCreateHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npCreateDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                制单人：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:DropDownList runat="server" ID="ddlCreatePerson" Width="175px">
                                    <asp:ListItem Text="张三" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                制单时间：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:TextBox ID="txtCreateTime" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                            </td>
                            <td style="width: 26%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                审核人：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:DropDownList runat="server" ID="ddlAuditPerson" Width="175px">
                                    <asp:ListItem Text="张三" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                审核时间：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <dxe:ASPxDateEdit ID="deAuditTime" runat="server">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 8%; text-align: right;">
                            </td>
                            <td style="width: 26%; text-align: left;">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeCreate" runat="Server" TargetControlID="npCreateDetail"
                    ExpandControlID="npCreateHeader" CollapseControlID="npCreateHeader" Collapsed="false"
                    TextLabelID="lbl_npCreateHeader" ImageControlID="img_npCreateHeader" ExpandedText="(隐藏)"
                    CollapsedText="(展开)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%">
                <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="25px">
                    <table style="width: 100%">
                        <tr>
                            <td style="text-align: center;">
                                <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnSubmit" runat="server" Text="提交审核" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="input_2" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
