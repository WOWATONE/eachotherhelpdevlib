<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="BrokerAccounting.aspx.cs" Inherits="BrokerWebApp.Accounting.BrokerAccounting" %>

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
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>����¼���б�</title>

    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});

            // lblCurrentDate.innerHTML = makewelcomeString();

        });

        function btnCreateClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("../otherinsurance/PolicyInput.aspx?pagemode=input", self, myArguments);
        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            var noint = s.GetDataRow(e.visibleIndex).cells[1].innerText;
            var querystring;
            //querystring = "../otherinsurance/PolicyInput.aspx?pagemode=Query&id=" + noint;
            querystring = "../PolicyViewTransfer.aspx?id=" + noint;
            window.showModalDialog(querystring, self, myArguments);
        }

        function imgPolicyProdTypeClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=700px;dialogHeight=500px;center=yes;help=no";
            var retrunval = window.showModalDialog("../popupselectrefs/PolicyProdType.aspx", self, myArguments);
            if (isEmpty(retrunval)) {
                //do nothing;
            }
            else {
                //split the return value;
                var thesplit_array = retrunval.split(";");
                dxetxtProdTypeID.SetValue(thesplit_array[1]);
                setProductTypeID(thesplit_array[0]);

                var result = $("#<%=ptid.ClientID %>");
            }

        }

        function setProductTypeID(thevalue) {
            var result = $("#<%=ptid.ClientID %>");
            result[0].value = thevalue;
        }

        function isEmpty(testVar) {
            if ((testVar == null) || (testVar.length == 0)) {
                return true;
            } else {
                return false;
            }
        }

        function dxeddlDeptID_SelectedIndexChanged(s, e) {
            var thejsonstring = dxeddlDeptID.GetSelectedItem().value;
            dxeddlSalesId.PerformCallback(thejsonstring);
        }

        function dxeddlCarrierId_SelectedIndexChanged(s, e) {
            var thejsonstring = dxeddlCarrierId.GetSelectedItem().value;
            dxeddlBranchId.PerformCallback(thejsonstring);
        }

        function btnResetClick() {
            ASPxClientEdit.ClearEditorsInContainer(null);
        }

        function SelectedIndexChanged(s, e) {
            var hidCustClassify = $("#<%=hidCustClassify.ClientID %>");
            hidCustClassify[0].value = s.GetValue();
            var test = s.GetText();
            if (test.length > 0) {
                var index = test.lastIndexOf("�N");
                if (index >= 0) {
                    var testTmp = test.substr(index + 1);
                    s.SetText(testTmp);
                }
            }
        }
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width: 100%">
        <tr>
            <td style="width: 100%;" colspan="2">
                <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            ������Ŀ</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(չ��)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table>
                        <tr>
                            <td>
                                <table>
                                    <tr style="font-size: 1px; height: 2px;">
                                        <td style="width: 70px;">
                                        </td>
                                        <td style="width: 180px;">
                                        </td>
                                        <td style="width: 70px;">
                                        </td>
                                        <td style="width: 180px;">
                                        </td>
                                        <td style="width: 70px;">
                                        </td>
                                        <td style="width: 180px;">
                                        </td>
                                        <td style="width: 70px;">
                                        </td>
                                        <td style="width: 180px;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            ������ţ�
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server"
                                                Width="170px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td style="text-align: right;">
                                            Ͷ����ţ�
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server"
                                                Width="170px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td style="text-align: left;">
                                            Ͷ���ͻ���
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="dxetxtCustomer" ClientInstanceName="dxetxtCustomer" runat="server"
                                                Width="155px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td style="text-align: left;">
                                            �������֣�
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlProdTypeName" ClientInstanceName="dxeddlProdTypeName"
                                                runat="server" Width="160px" DropDownStyle="DropDownList">
                                            </dxe:ASPxComboBox>
                                            <input type="hidden" id="ptid" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            ���ţ�
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server"
                                                Width="170px" DropDownStyle="DropDownList">
                                                <ClientSideEvents SelectedIndexChanged="dxeddlDeptID_SelectedIndexChanged" />
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: right;">
                                            �ͻ�����
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server"
                                                Width="170px" DropDownStyle="DropDownList" OnCallback="dxeddlSalesIdCallback">
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: right;">
                                            ҵ��Ա��
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="dxetxtCarrierSales" ClientInstanceName="dxetxtCarrierSales"
                                                runat="server" Width="155px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td style="text-align: left;">
                                            �ͻ����ࣺ
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlCustClassify" ClientInstanceName="dxeddlCustClassify"
                                                runat="server" Width="160px" DropDownStyle="DropDownList">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) { SelectedIndexChanged(s, e); return false;}" />
                                            </dxe:ASPxComboBox>
                                            <input type="hidden" id="hidCustClassify" name="hidCustClassify" runat="server" value="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            �շ����ڣ�
                                        </td>
                                        <td style="text-align: left; white-space: nowrap" nowrap="nowrap" colspan="3">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeStartPayFeeDate" ClientInstanceName="dxeStartPayFeeDate"
                                                            runat="server">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td>
                                                        ��
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeEndPayFeeDate" ClientInstanceName="dxeEndPayFeeDate" runat="server">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="text-align: left;">
                                            �շ�״̬��
                                        </td>
                                        <td>
                                            <dxe:ASPxComboBox ID="dxeddlPayFeeStatus" ClientInstanceName="dxeddlPayFeeStatus"
                                                runat="server" Width="155px" DropDownStyle="DropDownList">
                                                <Items>
                                                    <dxe:ListEditItem Value="0" Text="δ�շ�" />
                                                    <dxe:ListEditItem Value="1" Text="���շ�" />
                                                </Items>
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: left;">
                                            ���չ�˾��
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlCarrierId" ClientInstanceName="dxeddlCarrierId" runat="server"
                                                Width="170px" DropDownStyle="DropDownList">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {dxeddlCarrierId_SelectedIndexChanged(s,e);}" />
                                            </dxe:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            �⸶���ڣ�
                                        </td>
                                        <td style="text-align: left; white-space: nowrap" nowrap="nowrap" colspan="3">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeStartPayinDate" ClientInstanceName="dxeStartPayinDate" runat="server">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td>
                                                        ��
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeEndPayinDate" ClientInstanceName="dxeEndPayinDate" runat="server">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="text-align: left;">
                                            �⸶״̬��
                                        </td>
                                        <td>
                                            <dxe:ASPxComboBox ID="dxeddlPayinStatus" ClientInstanceName="dxeddlPayinStatus" runat="server"
                                                Width="155px" DropDownStyle="DropDownList">
                                                <Items>
                                                    <dxe:ListEditItem Value="0" Text="δ�⸶" />
                                                    <dxe:ListEditItem Value="1" Text="�ѽ⸶" />
                                                </Items>
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: left;">
                                            ��֧������
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlBranchId" ClientInstanceName="dxeddlBranchId" runat="server"
                                                Width="170px" DropDownStyle="DropDownList" OnCallback="dxeddlBranchId_Callback">
                                            </dxe:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            ��Ʊ���ڣ�
                                        </td>
                                        <td style="text-align: left; white-space: nowrap" nowrap="nowrap" colspan="3">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeStartInvoiceDate" ClientInstanceName="dxeStartInvoiceDate"
                                                            runat="server">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td>
                                                        ��
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeEndInvoiceDate" ClientInstanceName="dxeEndInvoiceDate" runat="server">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="text-align: left;">
                                            ��Ʊ״̬��
                                        </td>
                                        <td>
                                            <dxe:ASPxComboBox ID="dxeddlInvoiceStatus" ClientInstanceName="dxeddlInvoiceStatus"
                                                runat="server" Width="155px" DropDownStyle="DropDownList">
                                                <Items>
                                                    <dxe:ListEditItem Value="0" Text="δ��Ʊ" />
                                                    <dxe:ListEditItem Value="1" Text="�ѿ�Ʊ" />
                                                </Items>
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: left;">
                                            ҵ�����ʣ�
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlOperationType" ClientInstanceName="dxeddlOperationType"
                                                runat="server" Width="170px" DropDownStyle="DropDownList">
                                            </dxe:ASPxComboBox>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            �������ڣ�
                                        </td>
                                        <td style="text-align: left; white-space: nowrap" nowrap="nowrap" colspan="3">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeStartPayProcDate" ClientInstanceName="dxeStartPayProcDate"
                                                            runat="server">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td>
                                                        ��
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeEndPayProcDate" ClientInstanceName="dxeEndPayProcDate" runat="server">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="text-align: left;">
                                            ����״̬��
                                        </td>
                                        <td>
                                            <dxe:ASPxComboBox ID="dxeddlPayProcStatus" ClientInstanceName="dxeddlPayProcStatus"
                                                runat="server" Width="155px" DropDownStyle="DropDownList">
                                                <Items>
                                                    <dxe:ListEditItem Value="0" Text="δ����" />
                                                    <dxe:ListEditItem Value="1" Text="�ѽ���" />
                                                </Items>
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: left;">
                                            �տʽ��
                                        </td>
                                        <td>
                                            <dxe:ASPxComboBox ID="dxeddlGatheringType" ClientInstanceName="dxeddlGatheringType"
                                                runat="server" Width="155px" DropDownStyle="DropDownList">
                                                <Items>
                                                    <dxe:ListEditItem Value="1" Text="����" />
                                                    <dxe:ListEditItem Value="2" Text="ֱ��" />
                                                </Items>
                                            </dxe:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            ¼�����ڣ�
                                        </td>
                                        <td style="text-align: left;" colspan="3">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeStartDate" ClientInstanceName="dxeStartDate" runat="server">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td>
                                                        ��
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeEndDate" ClientInstanceName="dxeEndDate" runat="server">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="text-align: right;">
                                            Ӧ�����ڣ�
                                        </td>
                                        <td style="text-align: left;" colspan="3">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeStartPayDate" ClientInstanceName="dxeStartPayDate" runat="server">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td>
                                                        ��
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxeEndPayDate" ClientInstanceName="dxeEndPayDate" runat="server">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            ���ƺţ�
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="dxetxtCarNo" ClientInstanceName="dxetxtCarNo" runat="server"
                                                Width="155px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td style="text-align: right;" colspan="2">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxButton ID="btnSearch" runat="server" Text="��ѯ" CssClass="input_2" OnClick="btnSearch_Click">
                                                        </dxe:ASPxButton>
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxButton ID="btnReset" runat="server" Text="����" AutoPostBack="false" class="input_2">
                                                            <ClientSideEvents Click="btnResetClick" />
                                                        </dxe:ASPxButton>
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxButton ID="btnExport" runat="server" Text="Excel" OnClick="btnXlsExport_Click"
                                                            CssClass="input_2" />
                                                        </dxe:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td style="text-align: right;">
                                            ������ʼ���ڣ�
                                        </td>
                                        <td style="text-align: left;" colspan="3">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxePolicyStartDateStart" ClientInstanceName="dxePolicyStartDateStart" runat="server">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td>
                                                        ��
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="dxePolicyStartDateEnd" ClientInstanceName="dxePolicyStartDateEnd" runat="server">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="text-align: right;">
                                           ��ǿ�ձ����ţ�
                                        </td>
                                       <td style="text-align: center;">
                                          <dxe:ASPxTextBox ID="dxetxtAciPolicyNo" ClientInstanceName="dxetxtAciPolicyNo" runat="server"
                                                Width="155px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td style="text-align: right;" colspan="2">
                                           
                                        </td>
                                    </tr>
                                    
                                </table>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearch" runat="Server" TargetControlID="npSearchDetail"
                    ExpandControlID="npSearchHeader" CollapseControlID="npSearchHeader" Collapsed="false"
                    TextLabelID="lbl_npSearchHeader" ImageControlID="img_npSearchHeader" ExpandedText="(չ��)"
                    CollapsedText="(����)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%;" colspan="2">
                <asp:Panel ID="npSearchResultHeader" runat="server" CssClass="collapsePanelHeader"
                    Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchResultHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            �������</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchResultHeader" runat="server">(չ��)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server"
                                    KeyFieldName="PolicyID" AutoGenerateColumns="False" Settings-ShowFooter="true"
                                    Width="100%" SettingsPager-AlwaysShowPager="true" OnRowDeleting="gridSearchResult_RowDeleting"
                                    OnRowDeleted="gridSearchResult_RowDeleted" OnCustomCallback="gridSearchResult_CustomCallback">
                                    <%-- BeginRegion Columns --%>
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                            <NewButton Visible="False" />
                                            <EditButton Visible="False" />
                                            <CustomButtons>
                                                <dxwgv:GridViewCommandColumnCustomButton Text="�鿴">
                                                </dxwgv:GridViewCommandColumnCustomButton>
                                            </CustomButtons>
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="Ͷ�����" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CreateTime" Caption="�뵥����" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="PolicyNo" Caption="������" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="AltNo" Caption="���ĵ���" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataColumn FieldName="AreaName" Caption="������ʡ��" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CarrierName" Caption="���չ�˾" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="��֧����" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CarrierSales" Caption="ҵ��Ա" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PolicyRate" Caption="�б��ݶ�(%)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CustName" Caption="Ͷ����" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Beneficiary" Caption="��������" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="OperationTypeName" Caption="ҵ������" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CustClassifyName" Caption="�ͻ�����" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="StartDate" Caption="������" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="EndDate" Caption="��ֹ����" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataDateColumn FieldName="ProdTypeName" Caption="�������" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataColumn FieldName="DeptName" Caption="����" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="SalesName" Caption="�ͻ�����" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PremiumRate" Caption="����" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Period" Caption="�ڴ�" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayFeeBase" Caption="���ѽ��" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="GatheringTypeName" Caption="�տʽ" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataDateColumn FieldName="PayDate" Caption="����Ӧ������" CellStyle-Wrap="False"
                                            PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataDateColumn FieldName="PayFeeDate" Caption="�����շ�����" CellStyle-Wrap="False"
                                            PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayedFee" Caption="�����շѽ��" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayedFeeAdjust" Caption="���ѵ������" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataDateColumn FieldName="PayinDate" Caption="���ѽ⸶����" CellStyle-Wrap="False"
                                            PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayinedFee" Caption="���ѽ⸶���" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayinedFeeAdjust" Caption="���ѽ⸶�������" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="ProcessFeeTypeName" Caption="���ͷ���ȡ��ʽ" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="ProcessRate" Caption="���ͷ���" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayProcBase" Caption="���ͷѽ��" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataDateColumn FieldName="InvoiceDate" Caption="���ͷѿ�Ʊ����" CellStyle-Wrap="False"
                                            PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataColumn FieldName="InvoiceedFee" Caption="���ͷѿ�Ʊ���" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="InvoiceedFeeAdjust" Caption="���ͷѿ�Ʊ�������" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="InvoiceNo" Caption="���ͷѷ�Ʊ��" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataDateColumn FieldName="PayProcDate" Caption="���ͷ���������" CellStyle-Wrap="False"
                                            PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayProcedFee" Caption="���ͷ����ʽ��" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayProcedFeeAdjust" Caption="���ͷ����ʵ������" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CarNo" Caption="���ƺ�" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CiPremium" Caption="��ҵ�ձ���" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="AciPremium" Caption="��ǿ�ձ���" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CstPremium" Caption="����˰" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="FlagReinsure" Caption="�ٱ�" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="FlagTogether" Caption="����" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Currency" Caption="����" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CoverageRMB" Caption="����(�����)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CoverageEUR" Caption="����(ŷԪ)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CoverageHKD" Caption="����(�۱�)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CoverageUSD" Caption="����(��Ԫ)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                    </Columns>
                                    <%-- EndRegion --%>
                                    <SettingsPager Mode="ShowPager" />
                                    <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways"
                                        ShowGroupedColumns="true" ShowFilterRow="false" />
                                    <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                    <SettingsText CustomizationWindowCaption="���Ի�" />
                                    <GroupSummary>
                                        <dxwgv:ASPxSummaryItem FieldName="PolicyNo" ShowInGroupFooterColumn="PolicyNo" SummaryType="Count"
                                            DisplayFormat="#" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayProcBase" ShowInGroupFooterColumn="PayProcBase"
                                            SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayFeeBase" ShowInGroupFooterColumn="PayFeeBase"
                                            SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayedFee" ShowInGroupFooterColumn="PayedFee" SummaryType="Sum"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayinedFee" ShowInGroupFooterColumn="PayinedFee"
                                            SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="InvoiceedFee" ShowInGroupFooterColumn="InvoiceedFee"
                                            SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayProcedFee" ShowInGroupFooterColumn="PayProcedFee"
                                            SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="CiPremium" SummaryType="Sum" ShowInGroupFooterColumn="CiPremium"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="AciPremium" SummaryType="Sum" ShowInGroupFooterColumn="AciPremium"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="CstPremium" SummaryType="Sum" ShowInGroupFooterColumn="CstPremium"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="CoverageRMB" SummaryType="Sum" ShowInGroupFooterColumn="CoverageRMB"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="CoverageEUR" SummaryType="Sum" ShowInGroupFooterColumn="CoverageEUR"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="CoverageHKD" SummaryType="Sum" ShowInGroupFooterColumn="CoverageHKD"
                                            DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="CoverageUSD" SummaryType="Sum" ShowInGroupFooterColumn="CoverageUSD"
                                            DisplayFormat="c" />
                                    </GroupSummary>
                                    <TotalSummary>
                                        <dxwgv:ASPxSummaryItem FieldName="PolicyNo" SummaryType="Count" DisplayFormat="#" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayProcBase" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayFeeBase" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayedFee" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayinedFee" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="InvoiceedFee" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayProcedFee" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="CiPremium" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="AciPremium" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="CstPremium" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="CoverageRMB" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="CoverageEUR" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="CoverageHKD" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="CoverageUSD" SummaryType="Sum" DisplayFormat="c" />
                                    </TotalSummary>
                                    <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                                </dxwgv:ASPxGridView>
                                <dxwgv:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridSearchResult">
                                </dxwgv:ASPxGridViewExporter>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearchResult" runat="Server" TargetControlID="npSearchResultDetail"
                    ExpandControlID="npSearchResultHeader" CollapseControlID="npSearchResultHeader"
                    Collapsed="false" TextLabelID="lbl_npSearchResultHeader" ImageControlID="img_npSearchResultHeader"
                    ExpandedText="(չ��)" CollapsedText="(����)" ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
            </td>
        </tr>
    </table>
</asp:Content>
