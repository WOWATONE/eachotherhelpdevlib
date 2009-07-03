<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="FeeProcessAdd.aspx.cs" Inherits="BrokerWebApp.inoutbalance.FeeProcessAdd" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel"
    TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v8.3" Namespace="DevExpress.Web.ASPxSpellChecker"
    TagPrefix="dxwsc" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v8.3" Namespace="DevExpress.Web.ASPxHtmlEditor"
    TagPrefix="dxhe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback"
    TagPrefix="dxcb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>经纪费结算录入</title>

    <script type="text/javascript">

        function cusCheckNessary() {
            var id = getVoucherId();
            if (isEmpty(id)) {
                return true;
            }
            else {
                return false;
            }
        }

        function cusNotCompleteUnable() {
            if (cusCheckNessary()) {
                dxebtnSave.SetEnabled(true);
                dxebtnAddPolicy.SetEnabled(false);
                dxebtnAudit.SetEnabled(false);
                dxebtnPrint.SetEnabled(false);
                dxebtnComplete.SetEnabled(false);
            }


        }

        function cusCompleteEnable() {
            //debugger;
            dxebtnSave.SetEnabled(true);
            dxebtnAddPolicy.SetEnabled(true);
            dxebtnAudit.SetEnabled(true);
            dxebtnPrint.SetEnabled(true);
            dxebtnComplete.SetEnabled(true);

        }


        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});


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


            cusNotCompleteUnable();


        });



        function btnAddPolicyClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=500px;center=yes;help=no";
            var url = "FeeProcessAddSelect.aspx?ID=" + getVoucherId();

            window.showModalDialog(url, self, myArguments);
            gridPolicyItem.PerformCallback('');
        }

        function btnAddPrintClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=700px;center=yes;help=no";
            var url = "FeeProcessAddPrint.aspx?ID=" + getVoucherId();

            window.showModalDialog(url, self, myArguments);
            gridPolicyItem.PerformCallback('');
        }


        function getVoucherId() {
            var result = $("#<%=lblVoucherId.ClientID %>");
            var id = result[0].innerHTML;
            return id;
        }


        function setVoucherId(value) {
            var result = $("#<%=lblVoucherId.ClientID %>");
            result[0].innerHTML = value;
        }

        function btnCloseClick() {
            window.close();
        }

        function isEmpty(testVar) {
            if ((testVar == null) || (testVar.length == 0)) {
                return true;
            } else {
                return false;
            }
        }

        function isDecimal(str) {
            if (isEmpty(str)) {
                return false;
            }
            else {
                if (/[^d.]/i.test(str)) {
                    return true;
                }
                return false;
            }
        }

        function dxebtntopSave_Click(s, e) {
            //
            if (s.CauseValidation()) {
                var thejsonstring = makeInfoJSON("0");
                dxeSaveCallback.PerformCallback(thejsonstring);
            }
        }

        function saveCallbackComplete(s, e) {
            //do nothing;
            var pid = getVoucherId();
            if (isEmpty(pid)) {
                setVoucherId(e.result);
                cusCompleteEnable();
            }
        }

        function btnAudit_Click(s, e) {
            //
            var buttonID = s.GetText();
            var AuditOrNot = "1";
            switch (buttonID) {
                case "审核":
                    AuditOrNot = "1";
                    break
                case "反审核":
                    AuditOrNot = "0";
                    break
                default:
                    AuditOrNot = "1";
            }
            var thejsonstring = makeInfoJSON(AuditOrNot);
            dxeAuditCallback.PerformCallback(thejsonstring);

        }

        function auditCallbackComplete(s, e) {
            //do nothing;
            var buttonID = dxebtnAudit.GetText();
            switch (buttonID) {
                case "审核":
                    dxebtnAudit.SetText("反审核");
                    break
                case "反审核":
                    dxebtnAudit.SetText("审核");
                    break
                default:
                    //do nothing;
            }
        }

        function dxeddlCarrier_SelectedIndexChanged(s, e) {
            var thejsonstring = dxeddlCarrier.GetSelectedItem().value;
            dxeddlBranch.PerformCallback(thejsonstring);
        }


        function makeInfoJSON(AuditStatus) {

            var ID = getVoucherId();
            var Remark = dxetxtRemark.GetValueString();
            var ReleaseDate = dxeReleaseDate.GetValue();
            var ProcessFeeType = dxeddlProcessFeeType.GetValue();
            var Carrier = dxeddlCarrier.GetValue();
            var Branch = dxeddlBranch.GetValue();
            var plc = new InfoJSON(ID, Remark, ReleaseDate, AuditStatus, ProcessFeeType, Carrier, Branch);

            //deserialize JSON string, make a JSON object
            //var jsonObject = Sys.Serialization.JavaScriptSerializer.deserialize(jsonStringServer)

            //serialize a JOSN object，make a JSON string.
            var jsonStringClient = Sys.Serialization.JavaScriptSerializer.serialize(plc);

            return jsonStringClient;

        }


        function InfoJSON(ID, Remark, ReleaseDate, AuditStatus,
            ProcessFeeType, Carrier, Branch) {

            if (!isEmpty(ID))
                this.ID = ID;

            if (!isEmpty(Remark))
                this.Remark = Remark;

            if (!isEmpty(ReleaseDate))
                this.ReleaseDate = ReleaseDate;

            if (!isEmpty(AuditStatus))
                this.AuditStatus = AuditStatus;

            if (!isEmpty(ProcessFeeType))
                this.ProcessFeeType = ProcessFeeType;

            if (!isEmpty(Carrier))
                this.Carrier = Carrier;

            if (!isEmpty(Branch))
                this.Branch = Branch;

        }


        function gridPolicyItem_EndCallback(s, e) {
            //sum

            var itemVal;
            var indexFee = getOColumnIndex("开票金额");
            var indexFeeAdjust = getOColumnIndex("本次实收经纪费");

            var sumPayProcBase = 0;
            var sumFee = 0;
            var sumFeeAdjust = 0;

            for (i = 0; i < gridPolicyItem.pageRowCount; i++) {
                if (gridPolicyItem.GetDataRow(i) != null) {
                    //sumFee
                    itemVal = gridPolicyItem.GetDataRow(i).cells[indexFee].innerText;
                    if (isDecimal(itemVal)) {
                        sumFee = parseFloat(sumFee) + parseFloat(itemVal);
                    }

                    //sumFeeAdjust
                    itemVal = gridPolicyItem.GetDataRow(i).cells[indexFeeAdjust].innerText;
                    if (isDecimal(itemVal)) {
                        sumFeeAdjust = parseFloat(sumFeeAdjust) + parseFloat(itemVal);
                    }
                }
            }

            var rtn = sumFee.toFixed(2);
            dxetxtInvoiceProc.SetValue(rtn);
            rtn = sumFeeAdjust.toFixed(2);
            dxetxtPayProcBase.SetValue(rtn);
        }

        function getOColumnIndex(fieldName) {
            var headerCap;
            for (i = 0; i < gridPolicyItem.GetHeadersRow().cells.length; i++) {
                headerCap = gridPolicyItem.GetHeadersRow().cells[i].innerText;
                if (!isEmpty(headerCap)) {
                    if (headerCap == fieldName) {
                        return i;
                    }
                }
            }
        }
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxcb:ASPxCallback ID="dxeSaveCallback" ClientInstanceName="dxeSaveCallback" runat="server"
        OnCallback="dxeSaveCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {saveCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="dxeAuditCallback" ClientInstanceName="dxeAuditCallback" runat="server"
        OnCallback="dxeAuditCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {auditCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    <table style="width: 100%">
        <tr>
            <td>
                <asp:Panel ID="npGridPolicyItemHeader" runat="server" CssClass="collapsePanelHeader"
                    Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npGridPolicyItem" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            保单</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npGridPolicyItem" runat="server">(展开)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npGridPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 10%; text-align: right;">
                                <dxe:ASPxButton runat="server" ID="dxebtnAddPolicy" ClientInstanceName="dxebtnAddPolicy"
                                    AutoPostBack="false" Text="添加保单">
                                    <ClientSideEvents Click="btnAddPolicyClick" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 12%; text-align: right;">
                                流水号：
                            </td>
                            <td style="width: 78%; text-align: left;">
                                <label id="lblVoucherId" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server"
                                    DataSourceID="" KeyFieldName="Feeid" Width="100%" AutoGenerateColumns="False"
                                    OnRowUpdating="gridPolicyItem_RowUpdating" OnRowUpdated="gridPolicyItem_RowUpdated"
                                    OnRowDeleting="gridPolicyItem_RowDeleting" OnRowDeleted="gridPolicyItem_RowDeleted"
                                    OnCustomCallback="gridPolicyItem_CustomCallback" OnStartRowEditing="gridPolicyItem_StartRowEditing"
                                    OnHtmlEditFormCreated="gridPolicyItem_HtmlEditFormCreated" OnRowValidating="gridPolicyItem_RowValidating">
                                    <%-- BeginRegion Columns --%>
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False">
                                            <EditButton Visible="true" />
                                            <DeleteButton Visible="true" />
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Feeid" Caption="Feeid" CellStyle-Wrap="False"
                                            Visible="false">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Voucherid" Caption="开票通知书号" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="投保编号" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="保单编号" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayinInvoiceedFee" Caption="开票金额" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Fee" Caption="本次实收经纪费" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Processfeetypename" Caption="经纪费收取方式" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Invoiceno" Caption="发票号码" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataDateColumn FieldName="Payininvoicedate" Caption="开票日期" CellStyle-Wrap="False"
                                            PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                        </dxwgv:GridViewDataDateColumn>
                                    </Columns>
                                    <TotalSummary>
                                        <dxwgv:ASPxSummaryItem FieldName="PolicyNo" SummaryType="Count" DisplayFormat="#" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayinInvoiceedFee" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="Fee" SummaryType="Sum" DisplayFormat="c" />
                                    </TotalSummary>
                                    <Settings ShowGroupPanel="True" ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" />
                                    <GroupSummary>
                                        <dxwgv:ASPxSummaryItem FieldName="PolicyNo" ShowInGroupFooterColumn="PolicyNo" SummaryType="Count"
                                            DisplayFormat="#" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayinInvoiceedFee" ShowInGroupFooterColumn="PayinInvoiceedFee"
                                            SummaryType="Sum" />
                                        <dxwgv:ASPxSummaryItem FieldName="Fee" ShowInGroupFooterColumn="Fee" SummaryType="Sum"
                                            DisplayFormat="{0:c}" />
                                    </GroupSummary>
                                    <%-- EndRegion --%>
                                    <SettingsPager Mode="ShowAllRecords" />
                                    <ClientSideEvents EndCallback="function(s, e) {gridPolicyItem_EndCallback();}" />
                                    <SettingsBehavior AutoExpandAllGroups="true" />
                                    <Settings ShowGroupPanel="true" />
                                    <Templates>
                                        <EditForm>
                                            <div style="padding: 4px 4px 3px 4px">
                                                <table runat="server" id="tblgridPolicyItemEditorTemplate">
                                                    <tr>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            本次实收经纪费:
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <dxe:ASPxTextBox ID="dxetxtPolicyItemFee" ClientInstanceName="dxetxtPolicyItemFee"
                                                                runat="server" Width="120px" ReadOnly="true">
                                                                <ValidationSettings EnableCustomValidation="true" ErrorDisplayMode="ImageWithTooltip">
                                                                    <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                    <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                        </td>
                                                        <td style="text-align: left;">
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
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeGridPolicyItem" runat="Server" TargetControlID="npGridPolicyItemDetail"
                    ExpandControlID="npGridPolicyItemHeader" CollapseControlID="npGridPolicyItemHeader"
                    Collapsed="false" TextLabelID="lbl_npGridPolicyItem" ImageControlID="img_npGridPolicyItem"
                    ExpandedText="(展开)" CollapsedText="(隐藏)" ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="npOtherPolicyItemHeader" runat="server" CssClass="collapsePanelHeader"
                    Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npOtherPolicyItemHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            总计</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npOtherPolicyItemHeader" runat="server">(展开)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npOtherPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 100; text-align: right;">
                                经纪费收取方式：
                            </td>
                            <td style="width: 130; text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlProcessFeeType" ClientInstanceName="dxeddlProcessFeeType"
                                    runat="server" Width="120px" DropDownStyle="DropDownList">
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="width: 100; text-align: right;">
                            </td>
                            <td style="width: 130; text-align: left;">
                            </td>
                            <td style="width: 100; text-align: right;">
                            </td>
                            <td style="width: 130; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                开票金额：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtInvoiceProc" ClientInstanceName="dxetxtInvoiceProc" runat="server"
                                    Width="120px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                本次实收经纪费：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtPayProcBase" ClientInstanceName="dxetxtPayProcBase" runat="server"
                                    Width="120px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                调整金额：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtInvoiceProcAdjust" ClientInstanceName="dxetxtInvoiceProcAdjust"
                                    runat="server" Width="120px">
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                其中，商业险经纪费：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCiPremium" ClientInstanceName="dxetxtCiPremium" runat="server"
                                    Width="120px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                交强险经纪费：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtAciPremium" ClientInstanceName="dxetxtAciPremium" runat="server"
                                    Width="120px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                            </td>
                            <td style="text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                经纪费收取日期：：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="dxeReleaseDate" ClientInstanceName="dxeReleaseDate" runat="server"
                                    Width="120">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: right;">
                            </td>
                            <td style="text-align: left;">
                            </td>
                            <td style="text-align: right;">
                            </td>
                            <td style="text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                保险公司：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlCarrier" ClientInstanceName="dxeddlCarrier" runat="server"
                                    Width="120px" DropDownStyle="DropDownList">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {dxeddlCarrier_SelectedIndexChanged(s,e);}" />
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                分支机构：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlBranch" ClientInstanceName="dxeddlBranch" runat="server"
                                    Width="120px" DropDownStyle="DropDownList" OnCallback="dxeddlBranch_Callback">
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                            </td>
                            <td style="text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                备注：
                            </td>
                            <td style="text-align: left;" colspan="5">
                                <dxe:ASPxTextBox ID="dxetxtRemark" ClientInstanceName="dxetxtRemark" runat="server"
                                    Width="655px">
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeOtherPolicyItem" runat="Server" TargetControlID="npOtherPolicyItemDetail"
                    ExpandControlID="npOtherPolicyItemHeader" CollapseControlID="npOtherPolicyItemHeader"
                    Collapsed="false" TextLabelID="lbl_npOtherPolicyItemHeader" ImageControlID="img_npOtherPolicyItemHeader"
                    ExpandedText="(展开)" CollapsedText="(隐藏)" ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="height: 5px; background-color: #E0EDFF; width: 100%; font-size: 2px;">
            </td>
        </tr>
        <tr>
            <td style="width: 100%">
                <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="30px"
                    Width="100%">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 150px; text-align: left;">
                            </td>
                            <td style="width: 60px; text-align: left;">
                                <dxe:ASPxButton runat="server" ID="dxebtnSave" ClientInstanceName="dxebtnSave" Text="保存"
                                    CausesValidation="true" ValidationGroup="BaseGroup" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) { dxebtntopSave_Click(s,e); }" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 80px; text-align: left;">
                                <dxe:ASPxButton runat="server" ID="dxebtnAudit" ClientInstanceName="dxebtnAudit"
                                    Text="审核" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {btnAudit_Click(s,e);}" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 140px; text-align: left;">
                                <dxe:ASPxButton runat="server" ID="dxebtnPrint" ClientInstanceName="dxebtnPrint"
                                    Text="打印经纪费入账单" AutoPostBack="false">
                                    <ClientSideEvents Click="btnAddPrintClick" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 80px; text-align: left;">
                                <dxe:ASPxButton runat="server" ID="dxebtnComplete" ClientInstanceName="dxebtnComplete"
                                    Text="结算完成" AutoPostBack="false">
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 60px; text-align: left;">
                                <dxe:ASPxButton runat="server" ID="dxebtnClose" ClientInstanceName="dxebtnClose"
                                    Text="关闭" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {btnCloseClick();}" />
                                </dxe:ASPxButton>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
