﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="FeeCustomerAdd.aspx.cs" Inherits="BrokerWebApp.inoutbalance.FeeCustomerAdd" %>

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
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback"
    TagPrefix="dxcb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>客户收费录入</title>

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
            //debugger;
            if (cusCheckNessary()) {
                dxebtnSave.SetEnabled(true);
                dxebtnAddPolicy.SetEnabled(false);
                dxebtnAudit.SetEnabled(false);
            }


        }


        function cusCompleteEnable() {
            //debugger;
            dxebtnSave.SetEnabled(true);
            dxebtnAddPolicy.SetEnabled(true);
            dxebtnAudit.SetEnabled(true);

        }


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

            cusNotCompleteUnable();


        });


        function btnAddPolicyClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=500px;center=yes;help=no";
            var url = "FeeCustomerAddSelect.aspx?ID=" + getVoucherId();
            window.showModalDialog(url, self, myArguments);

            //dxeGetVoucherIDCallback.PerformCallback(getVoucherId());
            gridPolicyItem.PerformCallback(getVoucherId());
        }

        function btnCloseClick() {
            window.close();
        }

        function getVoucherId() {
            var id = dxetxtVoucherId.GetValueString();
            return id;
        }


        function setVoucherId(value) {
            dxetxtVoucherId.SetValue(value);
        }


        function dxebtntopSave_Click(s, e) {
            //debugger;
            if (dxeGotDate.GetText() == "") {
                alert("收款日期不能为空,请输入");
                return;
            }
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
            alert("保存成功");        
        }

        function makeInfoJSON(AuditStatus) {
            
            var ID = getVoucherId();
            var Remark = dxetxtRemark.GetValueString();
            var GotDate = dxeGotDate.GetValue();
            var plc = new InfoJSON(ID, Remark, GotDate, AuditStatus);

            //deserialize JSON string, make a JSON object
            //var jsonObject = Sys.Serialization.JavaScriptSerializer.deserialize(jsonStringServer)

            //serialize a JOSN object，make a JSON string.
            var jsonStringClient = Sys.Serialization.JavaScriptSerializer.serialize(plc);

            return jsonStringClient;

        }


        function InfoJSON(ID, Remark, GotDate, AuditStatus) {
            if (!isEmpty(ID))
                this.ID = ID;

            if (!isEmpty(Remark))
                this.Remark = Remark;

            if (!isEmpty(GotDate))
                this.GotDate = GotDate;

            if (!isEmpty(AuditStatus))
                this.AuditStatus = AuditStatus;

        }


        function btnAudit_Click(s, e) {

            var titleMSG = "确定吗？";
            var buttonID = s.GetText();
            var AuditOrNot = "1";
            switch (buttonID) {
                case "审核":
                    AuditOrNot = "1";
                    titleMSG = "确定审核吗？";
                    break
                case "反审核":
                    AuditOrNot = "0";
                    titleMSG = "确定反审核吗？";
                    break
                default:
                    //do nothing;
            }


            var thejsonstring = makeInfoJSON(AuditOrNot);

            var sureOk = window.confirm(titleMSG)
            if (sureOk) {
                dxeAuditCallback.PerformCallback(thejsonstring);
            }

        }

        function setGridEditStatus(editStatus) {
            //debugger;
            var grv = document.getElementById('<%=gridPolicyItem.ClientID %>');
            for (var i = 0; i < grv.rows.length; i++) {
                for (var j = 0; j < grv.rows(i).cells(0).all.length; j++) {
                    var cellContext = grv.rows(i).cells(0).all[j].innerText;
                    if (cellContext == "删除") {
                        if (editStatus == false) {
                            grv.rows(i).cells(0).all[j].style.display = "none";
                        }
                        else {
                            grv.rows(i).cells(0).all[j].style.display = "";
                        }
                    }
                }
            }
        }

        function auditCallbackComplete(s, e) {

            var buttonID = dxebtnAudit.GetText();

            var theresult = e.result;
            switch (theresult) {
                case "0":
                    switch (buttonID) {
                        case "审核":
                            dxebtnAudit.SetText("反审核");
                            dxebtnSave.SetEnabled(false);
                            dxebtnAddPolicy.SetEnabled(false);
                            //setGridEditStatus(false);
                            alert("审核成功!");
                            break;
                        case "反审核":
                            dxebtnAudit.SetText("审核");
                            dxebtnSave.SetEnabled(true);
                            dxebtnAddPolicy.SetEnabled(true);
                            //setGridEditStatus(true);
                            alert("反审核成功!");
                            break;
                        default:
                            //do nothing;
                    }
                    break
                default:
                    alert(theresult)
            }

            var VoucherID = getVoucherId();
            gridPolicyItem.PerformCallback(VoucherID);

        }

        function isEmpty(testVar) {
            if ((testVar == null) || (testVar.length == 0)) {
                return true;
            } else {
                return false;
            }
        }

        function gridPolicyItem_EndCallback(s, e) {
           
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
    <dxcb:ASPxCallback ID="dxeGetVoucherIDCallback" ClientInstanceName="dxeGetVoucherIDCallback" runat="server"
        OnCallback="dxeGetVoucherIDCallback_Callback">
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
                                <input type="hidden" id="txtSelectedIds" runat="server" value="-1" />
                            </td>
                            <td style="width: 12%; text-align: right;">
                                流水号：
                            </td>
                            <td style="width: 78%; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtVoucherId" ClientInstanceName="dxetxtVoucherId" runat="server" Width="110px" ReadOnly="true" Enabled="false"></dxe:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <dxwgv:ASPxGridView ID="gridPolicyItem" 
                                    ClientInstanceName="gridPolicyItem" 
                                    runat="server"
                                    KeyFieldName="FeeId" 
                                    Width="100%" 
                                    AutoGenerateColumns="False" 
                                    OnRowDeleting="gridPolicyItem_RowDeleting"
                                    OnRowDeleted="gridPolicyItem_RowDeleted" 
                                    OnRowUpdating="gridPolicyItem_RowUpdating"
                                    OnStartRowEditing="gridPolicyItem_StartRowEditing" 
                                    OnHtmlEditFormCreated="gridPolicyItem_HtmlEditFormCreated"
                                    OnCustomCallback="gridPolicyItem_CustomCallback" 
                                    OnRowValidating="gridPolicyItem_RowValidating"
                                    OnHtmlRowCreated="gridPolicyItem_HtmlRowCreated"
                                    >
                                    <%-- BeginRegion Columns --%>
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                            <EditButton Visible="true" />
                                            <DeleteButton Visible="true" />
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataColumn FieldName="FeeId" Caption="FeeId" CellStyle-Wrap="False"
                                            Visible="false">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="NoticeNo" Caption="通知书号" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="投保编号" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="保单编号" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayFeeBase" Caption="本期应收保费" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayedFee" Caption="本期已收保费" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Fee" Caption="本次实收保费" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CiPremium" Caption="商业险保费" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="AciPremium" Caption="交强险保费" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CstPremium" Caption="车船税" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="FeeAdjust" Caption="金额调整" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CustomerName" Caption="投保客户" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="ProdTypeName" Caption="险种" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CarrierName" Caption="保险公司" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="分支机构" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="SalesName" Caption="客户经理" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="AuditStatus" Caption="AuditStatus" CellStyle-Wrap="False"
                                            Visible="false">
                                        </dxwgv:GridViewDataColumn>
                                    </Columns>
                                    <TotalSummary>
                                        <dxwgv:ASPxSummaryItem FieldName="PolicyNo" SummaryType="Count" DisplayFormat="#" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayFeeBase" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayedFee" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="Fee" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="CiPremium" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="AciPremium" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="CstPremium" SummaryType="Sum" DisplayFormat="c" />
                                    </TotalSummary>
                                    <Settings ShowGroupPanel="True" ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" />
                                    <GroupSummary>
                                        <dxwgv:ASPxSummaryItem FieldName="PolicyNo" ShowInGroupFooterColumn="PolicyNo" SummaryType="Count" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayFeeBase" ShowInGroupFooterColumn="PayFeeBase"
                                            SummaryType="Sum" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayedFee" ShowInGroupFooterColumn="PayedFee" SummaryType="Sum"
                                            DisplayFormat="{0:c}" />
                                        <dxwgv:ASPxSummaryItem FieldName="Fee" ShowInGroupFooterColumn="Fee" SummaryType="Sum" />
                                        <dxwgv:ASPxSummaryItem FieldName="FeeAdjust" ShowInGroupFooterColumn="FeeAdjust"
                                            SummaryType="Sum" />
                                    </GroupSummary>
                                    <%-- EndRegion --%>
                                    <SettingsPager Mode="ShowAllRecords" />
                                    <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                    <ClientSideEvents EndCallback="function(s, e) {gridPolicyItem_EndCallback();}" />
                                    <Templates>
                                        <EditForm>
                                            <div style="padding: 4px 4px 3px 4px">
                                                <table runat="server" id="tblgridPolicyItemEditorTemplate">
                                                    <tr>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            本次实收保费:
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <dxe:ASPxTextBox ID="dxetxtPolicyItemFee" ClientInstanceName="dxetxtPolicyItemFee"
                                                                runat="server" Width="120px">
                                                                <ValidationSettings EnableCustomValidation="true" ErrorDisplayMode="ImageWithTooltip">
                                                                    <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                    <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            金额调整:
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <dxe:ASPxTextBox ID="dxetxtPolicyItemFeeAdjust" ClientInstanceName="dxetxtPolicyItemFeeAdjust"
                                                                runat="server" Width="120px">
                                                                <ValidationSettings EnableCustomValidation="true" ErrorDisplayMode="ImageWithTooltip">
                                                                    <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                    <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div style="text-align: center; padding: 2px 2px 2px 2px">
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
                            <td style="text-align: right;">
                                收款日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="dxeGotDate" ClientInstanceName="dxeGotDate" Width="120" runat="server">
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
                            <td>
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
                            <td>
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
            <td>
                <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="30px"
                    Width="100%">
                    <table style="width: 100%">
                        <tr>
                            <td>
                            </td>
                            <td style="width: 60px; text-align: left;">
                                <dxe:ASPxButton runat="server" ID="dxebtnSave" ClientInstanceName="dxebtnSave" Text="保存"
                                    CausesValidation="true" ValidationGroup="BaseGroup" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) { dxebtntopSave_Click(s,e); }" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 100px; text-align: left;">
                                <dxe:ASPxButton runat="server" ID="dxebtnAudit" ClientInstanceName="dxebtnAudit"
                                    Text="审核" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {btnAudit_Click(s,e);}" />
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
