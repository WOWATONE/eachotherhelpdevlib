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
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v8.3" Namespace="DevExpress.Web.ASPxHtmlEditor"
    TagPrefix="dxhe" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保费通知书录入</title>

    <script type="text/javascript">
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
                var thejsonstring = makeNoticeInfoJSON();
                dxeSaveCallback.PerformCallback(thejsonstring);
            }
        }
        
        function saveCallbackComplete(s, e) {
            //do nothing;
            
            var pid = dxetxtNoticeNo.GetValueString();
            if (isEmpty(pid)) {
                dxetxtNoticeNo.SetValue(e.result);
                var result = $("#<%=txtSelectedPolPeriodIds.ClientID %>");
                result[0].value = "-1";
            }
        }

        function makeNoticeInfoJSON() {

            var GatheringType = dxeddlGatheringType.GetValue();
            var NoticeNo = dxetxtNoticeNo.GetValueString();
            var NoticeDate = dxeNoticeDate.GetValue();
            var plc = new NoticeInfo(GatheringType, NoticeNo, NoticeDate);

            //deserialize JSON string, make a JSON object
            //var jsonObject = Sys.Serialization.JavaScriptSerializer.deserialize(jsonStringServer)

            //serialize a JOSN object，make a JSON string.
            var jsonStringClient = Sys.Serialization.JavaScriptSerializer.serialize(plc);

            return jsonStringClient;

        }
        
        
        function NoticeInfo(GatheringType, NoticeNo, NoticeDate) {
            if (!isEmpty(GatheringType))
                this.GatheringType = GatheringType;

            if (!isEmpty(NoticeNo))
                this.NoticeNo = NoticeNo;

            if (!isEmpty(NoticeDate))
                this.NoticeDate = NoticeDate;           

        }
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <dxcb:ASPxCallback ID="dxeSaveCallback" ClientInstanceName="dxeSaveCallback" runat="server" OnCallback="dxeSaveCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {saveCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    
    <table style="width: 100%">
        <tr>
            <td style="width: 12%; text-align: right;">
                收费方式：
            </td>
            <td style="width: 88%; text-align: left;">
                <dxe:ASPxComboBox ID="dxeddlGatheringType" ClientInstanceName="dxeddlGatheringType" runat="server"
                    Width="180px" DropDownStyle="DropDownList">
                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="必需项" CausesValidation="true" ValidationGroup="BaseGroup">
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
                <dxe:ASPxTextBox ID="dxetxtNoticeNo" ClientInstanceName="dxetxtNoticeNo" runat="server" Width="180px" ReadOnly="true"></dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                通知日期：
            </td>
            <td style="text-align: left;">
                <dxe:ASPxDateEdit ID="dxeNoticeDate" ClientInstanceName="dxeNoticeDate" runat="server" Width="180px">
                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="必需项" CausesValidation="true" ValidationGroup="BaseGroup">
                        <RequiredField IsRequired="true" ErrorText="必需项" />
                    </ValidationSettings>
                </dxe:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; vertical-align: top;">
                对应保单：
            </td>
            <td style="text-align: left;">
                <dxe:ASPxButton runat="server" ID="btnAddPolicy" AutoPostBack="false" Text="添加保单">
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
                    KeyFieldName="PolPeriodId" Width="100%" AutoGenerateColumns="False"
                    OnCustomCallback="gridPolicyItem_CustomCallback"
                    OnRowDeleting="gridPolicyItem_RowDeleting"
                    OnRowDeleted="gridPolicyItem_RowDeleted">
                    <%-- BeginRegion Columns --%>
                    <Columns>
                        <dxwgv:GridViewCommandColumn Caption="&nbsp;">
                            <DeleteButton Visible="true" />
                        </dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataColumn FieldName="CustName" Caption="投保客户" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="投保单号" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="保单号" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
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
                    </Columns>
                    <Settings ShowGroupPanel="false" ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" />
                    <TotalSummary>
                        <dxwgv:ASPxSummaryItem FieldName="PolicyID" SummaryType="Count" DisplayFormat="保单数量:#" />
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
            <td style="text-align: right;">
            </td>
            <td style="text-align: left;">
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
                            <dxe:ASPxButton runat="server" ID="btnSave" Text="保存" 
                            CausesValidation="true" ValidationGroup="BaseGroup" AutoPostBack="false">
                            <ClientSideEvents Click="function(s, e) { dxebtntopSave_Click(s,e); }" />
                            </dxe:ASPxButton>
                        </td>
                        <td style="width: 60px; text-align: left;">
                            <dxe:ASPxButton runat="server" ID="ASPxButton1" Text="审核" AutoPostBack="false">
                            </dxe:ASPxButton>
                        </td>
                        <td style="width: 70px; text-align: left;">
                            <dxe:ASPxButton runat="server" ID="ASPxButton2" Text="反审核" AutoPostBack="false">
                            </dxe:ASPxButton>
                        </td>
                        <td style="width: 100px; text-align: left;">
                            <dxe:ASPxButton runat="server" ID="ASPxButton3" Text="打印单证" AutoPostBack="false">
                            </dxe:ASPxButton>
                        </td>
                        <td style="width: 60px; text-align: left;">
                            <dxe:ASPxButton runat="server" ID="btnClose" Text="退出" AutoPostBack="false">
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
