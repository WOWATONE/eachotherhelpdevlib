﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="BusinessConsult.aspx.cs" Inherits="BrokerWebApp.BusinessConsult.BusinessConsult" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>咨询录入</title>

    <script type="text/javascript">
        $(document).ready(function() {
            window.onunload = function() {
                var pWindow = window.dialogArguments;
                var thegrid = pWindow.gridSearchResult;

                if (thegrid != null) {
                    thegrid.PerformCallback('');
                }
                else {
                    //do nothing
                }
            };
        });

        function imgSelectCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
            var retrunval = window.showModalDialog("../popupselectrefs/PolicyCustomer.aspx", self, myArguments);

            if (!retrunval || isEmpty(retrunval)) {
                dxetxtCustName.SetValue("");
                setCustomerID("");
            }
            else {
                //split the return value;
                var thesplit_array = retrunval.split(";");
                dxetxtCustName.SetValue(thesplit_array[1]);
                setCustomerID(thesplit_array[0]);
                //
            }
        }

        function isEmpty(testVar) {
            if ((testVar == null) || (testVar.length == 0)) {
                return true;
            } else {
                return false;
            }
        }

        function setCustomerID(thevalue) {
            var result = $("#<%=hidCustID.ClientID %>");
            result[0].value = thevalue;
        }

        function btnCloseClick() {
            window.close();
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <label id="lblerrmsg" name="lblerrmsg" runat="server" class="red" visible="false">
    </label>
    <table style="width: 100%">
        <tr style="height: 10px;">
            <td>
                &nbsp;
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
                                <dxe:ASPxTextBox ID="dxetxtConsultFeeNo" ClientInstanceName="dxetxtConsultFeeNo"
                                    runat="server" Width="160px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                        <RequiredField ErrorText="不能为空" IsRequired="True" />
                                    </ValidationSettings>
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                咨询日期：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <dxe:ASPxDateEdit ID="deConsultDate" ClientInstanceName="deConsultDate" runat="server"
                                    Width="160px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                        <RequiredField ErrorText="不能为空" IsRequired="True" />
                                    </ValidationSettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                客户经理：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlSalesID" ClientInstanceName="dxeddlSalesID" runat="server"
                                    Width="160px" DropDownStyle="DropDownList">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                        <RequiredField ErrorText="不能为空" IsRequired="True" />
                                    </ValidationSettings>
                                </dxe:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                客户名称：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCustName" ClientInstanceName="dxetxtCustName" runat="server"
                                    Width="160px" ReadOnly="true">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                        <RequiredField ErrorText="不能为空" IsRequired="True" />
                                    </ValidationSettings>
                                </dxe:ASPxTextBox>
                                <img runat="server" id="imgSelectCustomer" onclick="imgSelectCustomerClick();" alt=""
                                    src="../images/searchicon9.png" style="width: 20px; height: 20px; vertical-align: top;" />
                                <input type="hidden" id="hidCustID" name="hidCustID" runat="server" />
                            </td>
                            <td style="text-align: right;">
                                联系人：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtContact" ClientInstanceName="dxetxtContact" runat="server"
                                    Width="160px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                联系方式：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtTel" ClientInstanceName="dxetxtTel" runat="server" Width="160px">
                                </dxe:ASPxTextBox>
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
                            <td style="width: 10%; text-align: right;">
                                &nbsp;
                            </td>
                            <td style="width: 90%; text-align: right;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <dxwgv:ASPxGridView ID="gridConsultFeeItem" ClientInstanceName="gridConsultFeeItem"
                                    runat="server" KeyFieldName="ConsultFeeItemID" Width="100%" AutoGenerateColumns="False"
                                    SettingsBehavior-AllowSort="false" SettingsBehavior-AllowDragDrop="false" OnRowInserting="gridConsultFeeItem_RowInserting"
                                    OnRowUpdating="gridConsultFeeItem_RowUpdating" 
                                    OnRowUpdated="gridConsultFeeItem_RowUpdated"
                                    OnRowInserted="gridConsultFeeItem_RowInserted" 
                                    OnRowDeleting="gridConsultFeeItem_RowDeleting"
                                    OnRowDeleted="gridConsultFeeItem_RowDeleted">
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;" Width="15px" CellStyle-Wrap="False"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <NewButton Visible="True" />
                                            <EditButton Visible="true" />
                                            <DeleteButton Visible="true" />
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="咨询项目编号" FieldName="ConsultFeeItemID" CellStyle-Wrap="False"
                                            HeaderStyle-HorizontalAlign="Center">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="咨询项目" FieldName="ConsultFeeItem" CellStyle-Wrap="False"
                                            HeaderStyle-HorizontalAlign="Center">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="咨询费" FieldName="ConsultFee" CellStyle-Wrap="False"
                                            HeaderStyle-HorizontalAlign="Center">
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <Settings ShowGroupPanel="false" ShowFooter="True" ShowGroupFooter="VisibleAlways" />
                                    <TotalSummary>
                                        <dxwgv:ASPxSummaryItem FieldName="ConsultFee" SummaryType="Sum" ShowInGroupFooterColumn="ConsultFee"
                                            DisplayFormat="咨询费合计: {0}" />
                                    </TotalSummary>
                                    <Templates>
                                        <EditForm>
                                            <div style="padding: 4px 4px 3px 4px; text-align: center;">
                                                <table style="width: 70%;" runat="server" id="tblgridContactItemEditorTemplate">
                                                    <tr>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            咨询项目编号：
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <dxe:ASPxTextBox ID="dxetxtConsultFeeItemID" ClientInstanceName="dxetxtConsultFeeItemID"
                                                                runat="server" Text='<%# Eval("ConsultFeeItemID") %>'>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            
                                                        </td>
                                                        <td style="text-align: left;">
                                                           
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            咨询项目：
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <dxe:ASPxTextBox ID="dxetxtConsultFeeItem" ClientInstanceName="dxetxtConsultFeeItem"
                                                                runat="server" Text='<%# Eval("ConsultFeeItem") %>'>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            咨询费：
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <dxe:ASPxTextBox ID="dxetxtConsultFee" ClientInstanceName="dxetxtConsultFee" runat="server"
                                                                Text='<%# Eval("ConsultFee") %>'>
                                                            </dxe:ASPxTextBox>
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
                        <tr>
                            <td>
                                发票号：
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="dxetxtInvoiceNO" ClientInstanceName="dxetxtInvoiceNO" runat="server"
                                    Width="160px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                        <RequiredField ErrorText="不能为空" IsRequired="True" />
                                    </ValidationSettings>
                                </dxe:ASPxTextBox>
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
                                <dxe:ASPxComboBox ID="dxeddlFeePersion" ClientInstanceName="dxeddlFeePersion" runat="server"
                                    Width="160px" DropDownStyle="DropDownList">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                        <RequiredField ErrorText="不能为空" IsRequired="True" />
                                    </ValidationSettings>
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                收费时间：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <dxe:ASPxDateEdit ID="deFeeDate" ClientInstanceName="deFeeDate" runat="server" Width="160px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                        <RequiredField ErrorText="不能为空" IsRequired="True" />
                                    </ValidationSettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                &nbsp;
                            </td>
                            <td style="text-align: left;">
                                &nbsp;
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
                                <dxe:ASPxComboBox ID="dxeddlCreatePerson" ClientInstanceName="dxeddlCreatePerson"
                                    runat="server" Width="160px" DropDownStyle="DropDownList">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                        <RequiredField ErrorText="不能为空" IsRequired="True" />
                                    </ValidationSettings>
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                制单时间：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <dxe:ASPxDateEdit ID="deCreateTime" ClientInstanceName="deCreateTime" runat="server"
                                    Width="160px" Enabled="false">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                &nbsp;
                            </td>
                            <td style="text-align: left;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                审核人：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlAuditPerson" ClientInstanceName="dxeddlAuditPerson" runat="server"
                                    Width="160px" DropDownStyle="DropDownList">
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                审核时间：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="deAuditTime" ClientInstanceName="deAuditTime" runat="server"
                                    Width="160px">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: right;">
                                &nbsp;
                            </td>
                            <td style="text-align: left;">
                                &nbsp;
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
    </table>
    <table style="height: 5px; background-color: #E0EDFF; width: 100%; font-size: 2px;">
        <tr>
            <td>
            </td>
        </tr>
    </table>
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="30px">
        <table style="width: 100%">
            <tr>
                <td style="width: 400px; text-align: left;">
                    &nbsp;
                </td>
                <td style="width: 50px; text-align: left;">
                    <dxe:ASPxButton runat="server" ID="dxebtnBottomSave" Text="保存" CausesValidation="true"
                        AutoPostBack="false" OnClick="dxebtnBottomSave_Click">
                    </dxe:ASPxButton>
                </td>
                <td style="width: 50px; text-align: left;">
                    <dxe:ASPxButton runat="server" ID="dxebtnSubmit" Text="审核" CausesValidation="true"
                        AutoPostBack="false" OnClick="dxebtnSubmit_Click">
                    </dxe:ASPxButton>
                </td>
                <td style="width: 50px; text-align: left;">
                    <dxe:ASPxButton runat="server" ID="dxebtnClose" Text="关闭" CausesValidation="false"
                        AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnCloseClick();}" />
                    </dxe:ASPxButton>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
