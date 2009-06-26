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
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>����֪ͨ��¼��</title>

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
                result[0].value = retrunval;
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
        
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%">
        <tr>
            <td style="width: 12%; text-align: right;">
                �շѷ�ʽ��
            </td>
            <td style="width: 88%; text-align: left;">
                <dxe:ASPxComboBox ID="dxeddlGatheringType" ClientInstanceName="dxeddlGatheringType" runat="server"
                    Width="180px" DropDownStyle="DropDownList">
                </dxe:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                ֪ͨ��ţ�
            </td>
            <td style="text-align: left;">
                <dxe:ASPxTextBox ID="dxetxtNoticeNo" ClientInstanceName="dxetxtNoticeNo" runat="server" Width="180px"></dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">
                ֪ͨ���ڣ�
            </td>
            <td style="text-align: left;">
                <dxe:ASPxDateEdit ID="deNoticeDate" runat="server" Width="180px">
                </dxe:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; vertical-align: top;">
                ��Ӧ������
            </td>
            <td style="text-align: left;">
                <dxe:ASPxButton runat="server" ID="btnAddPolicy" AutoPostBack="false" Text="��ӱ���">
                    <ClientSideEvents Click="btnAddPolicyClick" />
                </dxe:ASPxButton>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; vertical-align: top;">
                <input type="hidden" id="txtSelectedPolPeriodIds" runat="server" />
            </td>
            <td style="text-align: left;">
                <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server"
                    KeyFieldName="PolicyID" Width="100%" AutoGenerateColumns="False" OnRowInserting="gridPolicyItem_RowInserting"
                    OnRowUpdating="gridPolicyItem_RowUpdating" OnRowUpdated="gridPolicyItem_RowUpdated"
                    OnRowInserted="gridPolicyItem_RowInserted" OnRowDeleting="gridPolicyItem_RowDeleting"
                    OnRowDeleted="gridPolicyItem_RowDeleted">
                    <%-- BeginRegion Columns --%>
                    <Columns>
                        <dxwgv:GridViewCommandColumn Caption="&nbsp;">
                            <DeleteButton Visible="true" />
                        </dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataColumn FieldName="CustName" Caption="Ͷ���ͻ�" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="Ͷ������" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="������" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="PayFeeBase" Caption="����Ӧ�ձ���" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="PayDate" Caption="Ӧ������" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="CiPremium" Caption="��ҵ�ձ���" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="AciPremium" Caption="��ǿ�ձ���" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="CstPremium" Caption="����˰" CellStyle-Wrap="False">
                        </dxwgv:GridViewDataColumn>
                    </Columns>
                    <Settings ShowGroupPanel="false" ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" />
                    <TotalSummary>
                        <dxwgv:ASPxSummaryItem FieldName="PolicyID" SummaryType="Count" DisplayFormat="��������:#" />
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
                            <dxe:ASPxButton runat="server" ID="btnSave" Text="����" AutoPostBack="false">
                            </dxe:ASPxButton>
                        </td>
                        <td style="width: 60px; text-align: left;">
                            <dxe:ASPxButton runat="server" ID="ASPxButton1" Text="���" AutoPostBack="false">
                            </dxe:ASPxButton>
                        </td>
                        <td style="width: 70px; text-align: left;">
                            <dxe:ASPxButton runat="server" ID="ASPxButton2" Text="�����" AutoPostBack="false">
                            </dxe:ASPxButton>
                        </td>
                        <td style="width: 100px; text-align: left;">
                            <dxe:ASPxButton runat="server" ID="ASPxButton3" Text="��ӡ��֤" AutoPostBack="false">
                            </dxe:ASPxButton>
                        </td>
                        <td style="width: 60px; text-align: left;">
                            <dxe:ASPxButton runat="server" ID="btnClose" Text="�˳�" AutoPostBack="false">
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
