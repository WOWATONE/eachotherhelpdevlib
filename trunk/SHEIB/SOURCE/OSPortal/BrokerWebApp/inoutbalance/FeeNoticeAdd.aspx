<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="FeeNoticeAdd.aspx.cs" Inherits="BrokerWebApp.inoutbalance.FeeNoticeAdd" %>

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
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保费通知书录入</title>

    <script type="text/javascript">
        function cusCheckNessary() {
            var pid = dxetxtNoticeNo.GetValueString();
            if (isEmpty(pid)) {
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
                dxebtnAudit.SetEnabled(false);
                dxebtnPrint.SetEnabled(false);
            }


        }

        function cusCompleteEnable() {
            if (!cusCheckNessary()) {
                dxebtnSave.SetEnabled(true);
                dxebtnAudit.SetEnabled(true);
                dxebtnPrint.SetEnabled(true);
            }


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
            var myArguments = "resizable:no;scroll:yes;status:no;dialogWidth=950px;dialogHeight=500px;center=yes;help=no";
            var retrunval = window.showModalDialog("FeeNoticeAddSelect.aspx", self, myArguments);
            var result = $("#<%=txtSelectedPolPeriodIds.ClientID %>");
            if (isEmpty(retrunval)) {
                //do nothing;
            }
            else {
                var temp = new Array();
                temp = retrunval.split(';');
                for (i = 0; i < temp.length; i++) {
                    //lastIndexOf
                    if (result[0].value.lastIndexOf(temp[i]) == -1) {
                        result[0].value = result[0].value + ";" + temp[i];
                    }
                }
                //result[0].value = result[0].value + ";" + retrunval;
            }
            gridPolicyItem.PerformCallback('');
        }

        function btnAddPrintClick() {
            debugger;
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=850px;dialogHeight=700px;center=yes;help=no";
            var url = "FeeNoticeAddPrint.aspx?NoticeNo=" + getNoticeNo() + "&GatheringType=" + getGatheringType() + "&tmpID=" + Math.random();

            window.showModalDialog(url, self, myArguments);
            gridPolicyItem.PerformCallback('');
        }

        function getNoticeNo() {
            var NoticeNo = dxetxtNoticeNo.GetValueString();
            return NoticeNo;
        }


        function getGatheringType() {
            var GatheringType = dxeddlGatheringType.GetValue();
            return GatheringType;
        }

        function isEmpty(testVar) {
            if ((testVar == null) || (testVar.length == 0)) {
                return true;
            } else {
                return false;
            }
        }


        function dxebtntopSave_Click(s, e) {
            //
            if (s.CauseValidation()) {
                var thejsonstring = makeNoticeInfoJSON("0");
                dxeSaveCallback.PerformCallback(thejsonstring);
            }
        }

        function saveCallbackComplete(s, e) {
            //do nothing;
            //debugger;
            var pid = dxetxtNoticeNo.GetValueString();
            if (isEmpty(pid)) {
                dxetxtNoticeNo.SetValue(e.result);
                var result = $("#<%=txtSelectedPolPeriodIds.ClientID %>");
                result[0].value = "-1";
                cusCompleteEnable();
            }
            alert("保存成功");
        }

        function makeNoticeInfoJSON(AuditStatus) {

            var GatheringType = dxeddlGatheringType.GetValue();
            var NoticeNo = dxetxtNoticeNo.GetValueString();
            var NoticeDate = dxeNoticeDate.GetValue();
            var Content = dxetxtContent.GetValueString();
            var plc = new NoticeInfo(GatheringType, NoticeNo, NoticeDate, AuditStatus, Content);

            //deserialize JSON string, make a JSON object
            //var jsonObject = Sys.Serialization.JavaScriptSerializer.deserialize(jsonStringServer)

            //serialize a JOSN object，make a JSON string.
            var jsonStringClient = Sys.Serialization.JavaScriptSerializer.serialize(plc);

            return jsonStringClient;

        }


        function NoticeInfo(GatheringType, NoticeNo, NoticeDate, AuditStatus, Content) {
            if (!isEmpty(GatheringType))
                this.GatheringType = GatheringType;

            if (!isEmpty(NoticeNo))
                this.NoticeNo = NoticeNo;

            if (!isEmpty(NoticeDate))
                this.NoticeDate = NoticeDate;

            if (!isEmpty(AuditStatus))
                this.AuditStatus = AuditStatus;

            if (!isEmpty(Content))
                this.Content = Content;    

        }

        function btnCloseClick() {
            window.close();
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


            var thejsonstring = makeNoticeInfoJSON(AuditOrNot);

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
                            btnAddPolicy.SetEnabled(false);
                            dxebtnPrint.SetEnabled(false);
                            //setGridEditStatus(false);
                            alert("审核成功!");
                            break;
                        case "反审核":
                            dxebtnAudit.SetText("审核");
                            dxebtnSave.SetEnabled(true);
                            btnAddPolicy.SetEnabled(true);
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
            gridPolicyItem.PerformCallback('');

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
            <td style="width: 12%; text-align: right;">
                收费方式：
            </td>
            <td style="width: 88%; text-align: left;">
                <dxe:ASPxComboBox ID="dxeddlGatheringType" ClientInstanceName="dxeddlGatheringType"
                    runat="server" Width="180px" DropDownStyle="DropDownList">
                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="必需项" CausesValidation="true"
                        ValidationGroup="BaseGroup">
                        <RequiredField IsRequired="true" ErrorText="必需项" />
                    </ValidationSettings>
                </dxe:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                通知书号：
            </td>
            <td style="text-align: left;">
                <dxe:ASPxTextBox ID="dxetxtNoticeNo" ClientInstanceName="dxetxtNoticeNo" runat="server"
                    Width="180px" ReadOnly="true">
                </dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                通知日期：
            </td>
            <td style="text-align: left;">
                <dxe:ASPxDateEdit ID="dxeNoticeDate" ClientInstanceName="dxeNoticeDate" runat="server"
                    Width="180px">
                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="必需项" CausesValidation="true"
                        ValidationGroup="BaseGroup">
                        <RequiredField IsRequired="true" ErrorText="必需项" />
                    </ValidationSettings>
                </dxe:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                备注：
            </td>
            <td style="text-align: left;" colspan="7" >
                <dxe:ASPxTextBox ID="dxetxtContent" ClientInstanceName="dxetxtContent" runat="server"
                    Width="655px">
                </dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; vertical-align: top;">
                对应保单：
            </td>
            <td style="text-align: left;">
                <dxe:ASPxButton runat="server" ID="btnAddPolicy" ClientInstanceName="btnAddPolicy"
                    AutoPostBack="false" Text="添加保单">
                    <ClientSideEvents Click="btnAddPolicyClick" />
                </dxe:ASPxButton>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; vertical-align: top;">
                <input type="hidden" id="txtSelectedPolPeriodIds" runat="server" value="-1" />
            </td>
            <td style="text-align: left;">
                <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server"
                    KeyFieldName="PolPeriodId" Width="100%" AutoGenerateColumns="False" OnCustomCallback="gridPolicyItem_CustomCallback"
                    OnRowDeleting="gridPolicyItem_RowDeleting" OnRowDeleted="gridPolicyItem_RowDeleted"
                    OnHtmlRowCreated="gridPolicyItem_HtmlRowCreated">
                    <%-- BeginRegion Columns --%>
                    <Columns>
                        <dxwgv:GridViewCommandColumn Caption="&nbsp;">
                            <DeleteButton Visible="true" Text="删除" />
                        </dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataColumn FieldName="CustName" Caption="投保客户" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="投保单号" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="PolicyNo" Caption="保单号" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataColumn FieldName="PayFeeBase" Caption="本次应收保费" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="PayDate" Caption="应收日期" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="CiPremium" Caption="商业险保费" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="AciPremium" Caption="交强险保费" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="CstPremium" Caption="车船税" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="AuditStatus" Caption="AuditStatus" CellStyle-Wrap="False"
                            Visible="false">
                        </dxwgv:GridViewDataColumn>
                    </Columns>
                    <Settings ShowGroupPanel="false" ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" />
                    <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                    <TotalSummary>
                        <dxwgv:ASPxSummaryItem FieldName="PolicyID" SummaryType="Count" ShowInColumn="CustName"
                            DisplayFormat="保单数量:#" />
                        <dxwgv:ASPxSummaryItem FieldName="PayFeeBase" SummaryType="Sum" DisplayFormat="c" />
                        <dxwgv:ASPxSummaryItem FieldName="CiPremium" SummaryType="Sum" DisplayFormat="c" />
                        <dxwgv:ASPxSummaryItem FieldName="AciPremium" SummaryType="Sum" DisplayFormat="c" />
                        <dxwgv:ASPxSummaryItem FieldName="CstPremium" SummaryType="Sum" DisplayFormat="c" />
                    </TotalSummary>
                    <%-- EndRegion --%>
                    <SettingsPager Mode="ShowAllRecords" />
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
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 100%; text-align: center;" colspan="2">
                <table style="margin: 0 0 0 0; padding: 0 0 0 0; width: 90%;">
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
                            <dxe:ASPxButton runat="server" ID="dxebtnPrint" ClientInstanceName="dxebtnPrint"
                                Text="打印单证" AutoPostBack="false">
                                <ClientSideEvents Click="btnAddPrintClick" />
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
            </td>
        </tr>
    </table>
</asp:Content>
