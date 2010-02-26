<%@ Page Title="����¼��" Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="PolicyView.aspx.cs" Inherits="BrokerWebApp.otherinsurance.PolicyView" %>

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
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxUploadControl"
    TagPrefix="dxuc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback"
    TagPrefix="dxcb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>�����鿴</title>

    <script type="text/javascript">

        function btnCancelClick() {
            window.document.forms[0].reset();
            //ASPxClientEdit.ClearEditorsInContainer(null);
        }

        function btnCloseClick() {
            window.close();
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <input type="hidden" id="pagemode" runat="server" value="" />
    <asp:Panel ID="nppagecontent" runat="server">
        <dxtc:ASPxPageControl ID="insuranceDetailTabPage" ClientInstanceName="insuranceDetailTabPage"
            runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%"
            AutoPostBack="false" EnableCallBacks="true" EnableViewState="true" OnActiveTabChanged="insuranceDetailTabPage_ActiveTabChanged">
            <ClientSideEvents ActiveTabChanging="function(s, e) {}" TabClick="function(s, e) {}" />
            <TabPages>
                <dxtc:TabPage Text="������������">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                            <table style="width: 99%">
                                <tr>
                                    <td style="width: 100%;">
                                        <asp:Panel ID="npbasicheader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                                            <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                                <div style="float: left; vertical-align: middle;">
                                                    <asp:ImageButton ID="img_npbasicheader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                        AlternateText="" />
                                                </div>
                                                <div style="float: left; margin-left: 5px;">
                                                    ������������</div>
                                                <div style="float: left; margin-left: 5px;">
                                                    <asp:Label ID="lbl_npbasicheader" runat="server">(չ��)</asp:Label>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="npbasicdetail" runat="server" CssClass="collapsePanel" Height="0">
                                            <table style="width: 100%">
                                                <tr style="font-size: 1px; height: 2px;">
                                                    <td style="width: 90px;">
                                                    </td>
                                                    <td style="width: 180px;">
                                                    </td>
                                                    <td style="width: 90px;">
                                                    </td>
                                                    <td style="width: 250px;">
                                                    </td>
                                                    <td style="width: 90px;">
                                                    </td>
                                                    <td style="width: 220px;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        Ͷ�����ţ�
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server"
                                                            Width="160px" ReadOnly="true">
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        ������ţ�
                                                    </td>
                                                    <td style="text-align: left;" colspan="2">
                                                        <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server"
                                                            Width="240px">
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td>
                                                        <table style="margin-left: -3px; text-align: left;">
                                                            <tr>
                                                                <td style="text-align: right;">
                                                                    <dxe:ASPxCheckBox runat="server" ID="dxechkTogether" ClientInstanceName="dxechkTogether"
                                                                        Text="����">
                                                                    </dxe:ASPxCheckBox>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxCheckBox runat="server" ID="dxechkFlagReinsure" ClientInstanceName="dxechkFlagReinsure"
                                                                        Text="�ٱ�">
                                                                    </dxe:ASPxCheckBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        �������֣�
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxComboBox ID="dxeddlProdTypeName" ClientInstanceName="dxeddlProdTypeName"
                                                            runat="server" Width="160px" DropDownStyle="DropDownList">
                                                            <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                                <RequiredField ErrorText="����Ϊ��" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxComboBox>
                                                        <input type="hidden" id="ptid" runat="server" />
                                                    </td>
                                                    <td style="text-align: right;">
                                                        Ͷ���ˣ�
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <table style="margin-left: -3px; width: 245px;">
                                                            <tr>
                                                                <td>
                                                                    <dxe:ASPxTextBox ID="dxetxtCustomer" ClientInstanceName="dxetxtCustomer" runat="server"
                                                                        Width="160px">
                                                                    </dxe:ASPxTextBox>
                                                                    <input type="hidden" id="cusid" runat="server" />
                                                                </td>
                                                                <td style="text-align: left; display: none;">
                                                                    <img runat="server" id="imgSelectCustomer" onclick="imgSelectCustomerClick();" alt=""
                                                                        src="../images/searchicon9.png" style="width: 20px; height: 20px; vertical-align: top;" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        �������ˣ�
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtBeneficiary" ClientInstanceName="dxetxtBeneficiary" runat="server"
                                                            Width="160px">
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        ���ţ�
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server"
                                                            Width="160px" DropDownStyle="DropDownList">
                                                            <Items>
                                                            </Items>
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        �ͻ�����
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server"
                                                            Width="160px" DropDownStyle="DropDownList">
                                                            <Items>
                                                            </Items>
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        �տʽ��
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxComboBox ID="dxeddlGatheringType" ClientInstanceName="dxeddlGatheringType"
                                                            runat="server" Width="160px" DropDownStyle="DropDownList">
                                                            <Items>
                                                            </Items>
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        ҵ�����ʣ�
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxComboBox ID="dxeddlOperationType" ClientInstanceName="dxeddlOperationType"
                                                            runat="server" Width="160px" DropDownStyle="DropDownList">
                                                            <Items>
                                                            </Items>
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        ҵ����Դ��
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxComboBox ID="dxeddlSourceTypeID" ClientInstanceName="dxeddlSourceTypeID"
                                                            runat="server" Width="160px" DropDownStyle="DropDownList">
                                                            <Items>
                                                            </Items>
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        �������ޣ�
                                                    </td>
                                                    <td>
                                                        <table style="margin-left: -3px;">
                                                            <tr>
                                                                <td>
                                                                    <dxe:ASPxDateEdit ID="dxeStartDate" ClientInstanceName="dxeStartDate" runat="server"
                                                                        Width="105px">
                                                                    </dxe:ASPxDateEdit>
                                                                </td>
                                                                <td>
                                                                    ��
                                                                </td>
                                                                <td>
                                                                    <dxe:ASPxDateEdit ID="dxeEndDate" ClientInstanceName="dxeEndDate" runat="server"
                                                                        Width="105px">
                                                                    </dxe:ASPxDateEdit>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        ��ע��
                                                    </td>
                                                    <td colspan="5" style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtSpecial" ClientInstanceName="dxetxtSpecial" runat="server"
                                                            Width="718px">
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        ¼���ˣ�
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCreatePerson" ClientInstanceName="dxetxtCreatePerson"
                                                            runat="server" Width="160px" ReadOnly="true">
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        ¼�����ڣ�
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxDateEdit ID="dxedtCreateTime" ClientInstanceName="dxedtCreateTime" runat="server"
                                                            Width="160px">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        �ɷѴ�����
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <table style="margin-left: -3px;">
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <dxe:ASPxTextBox ID="dxetxtStage" ClientInstanceName="dxetxtStage" runat="server"
                                                                        Width="100px">
                                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="true" ValidationGroup="BaseGroup">
                                                                            <RegularExpression ValidationExpression="^\d+(\d+)?" ErrorText="��ʽ����" />
                                                                            <RequiredField IsRequired="true" ErrorText="������" />
                                                                        </ValidationSettings>
                                                                    </dxe:ASPxTextBox>
                                                                </td>
                                                                <td style="width: 10px; text-align: left;">
                                                                </td>
                                                                <td style="text-align: left;">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <ajaxToolkit:CollapsiblePanelExtender ID="cpeBasic" runat="Server" TargetControlID="npbasicdetail"
                                            ExpandControlID="npbasicheader" CollapseControlID="npbasicheader" Collapsed="false"
                                            TextLabelID="lbl_npbasicheader" ImageControlID="img_npbasicheader" ExpandedText="(չ��)"
                                            CollapsedText="(����)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                                            SuppressPostBack="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <asp:Panel ID="npGridPolicyItemHeader" runat="server" CssClass="collapsePanelHeader"
                                            Height="25px">
                                            <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                                <div style="float: left; vertical-align: middle;">
                                                    <asp:ImageButton ID="img_npGridPolicyItem" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                        AlternateText="" />
                                                </div>
                                                <div style="float: left; margin-left: 5px;">
                                                    ������Ŀ</div>
                                                <div style="float: left; margin-left: 5px;">
                                                    <asp:Label ID="lbl_npGridPolicyItem" runat="server">(չ��)</asp:Label>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="npGridPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="text-align: right;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server"
                                                            KeyFieldName="ItemID" Width="100%" AutoGenerateColumns="False">
                                                            <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left"
                                                                    Width="81" AllowDragDrop="false">
                                                                    <NewButton Visible="false" />
                                                                    <EditButton Visible="false" />
                                                                    <DeleteButton Visible="false" />
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProdName" Caption="��Ŀ����" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Coverage" Caption="����" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PremiumRate" Caption="����(%)" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Premium" Caption="����" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProcRate" Caption="���ͷ���(%)" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Process" Caption="���ͷ�" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ItemID" Caption="ItemID" CellStyle-Wrap="False"
                                                                    Visible="false">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyId" Caption="PolicyId" CellStyle-Wrap="False"
                                                                    Visible="false">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProdID" Caption="ProdID" CellStyle-Wrap="False"
                                                                    Visible="false">
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                            <Settings ShowGroupPanel="false" ShowFooter="True" ShowGroupFooter="VisibleAlways" />
                                                            <TotalSummary>
                                                                <dxwgv:ASPxSummaryItem FieldName="ProdName" SummaryType="Count" DisplayFormat="����:#" />
                                                                <dxwgv:ASPxSummaryItem FieldName="Coverage" SummaryType="Sum" DisplayFormat="c" />
                                                                <dxwgv:ASPxSummaryItem FieldName="Premium" SummaryType="Sum" DisplayFormat="c" />
                                                                <dxwgv:ASPxSummaryItem FieldName="Process" SummaryType="Sum" DisplayFormat="c" />
                                                            </TotalSummary>
                                                            <%-- EndRegion --%>
                                                            <SettingsPager Mode="ShowAllRecords" />
                                                            <ClientSideEvents EndCallback="function(s, e) {}" />
                                                            <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
                                                        </dxwgv:ASPxGridView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <ajaxToolkit:CollapsiblePanelExtender ID="cpeGridPolicyItem" runat="Server" TargetControlID="npGridPolicyItemDetail"
                                            ExpandControlID="npGridPolicyItemHeader" CollapseControlID="npGridPolicyItemHeader"
                                            Collapsed="false" TextLabelID="lbl_npGridPolicyItem" ImageControlID="img_npGridPolicyItem"
                                            ExpandedText="(չ��)" CollapsedText="(����)" ExpandedImage="~/images/collapse_blue.jpg"
                                            CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <asp:Panel ID="npCostSummaryHeader" runat="server" CssClass="collapsePanelHeader"
                                            Height="25px">
                                            <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                                <div style="float: left; vertical-align: middle;">
                                                    <asp:ImageButton ID="img_npCostSummaryHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                        AlternateText="" />
                                                </div>
                                                <div style="float: left; margin-left: 5px;">
                                                    ���û���</div>
                                                <div style="float: left; margin-left: 5px;">
                                                    <asp:Label ID="lbl_npCostSummaryHeader" runat="server">(չ��)</asp:Label>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="npCostSummaryDetail" runat="server" CssClass="collapsePanel" Height="0">
                                            <table style="width: 100%">
                                                <tr style="font-size: 1px; height: 2px;">
                                                    <td style="width: 95px;">
                                                    </td>
                                                    <td style="width: 150px;">
                                                    </td>
                                                    <td style="width: 95px;">
                                                    </td>
                                                    <td style="width: 150px;">
                                                    </td>
                                                    <td style="width: 120px;">
                                                    </td>
                                                    <td style="width: 150px;">
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        ���
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCoverage" ClientInstanceName="dxetxtCoverage" runat="server"
                                                            Width="145px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        ����(%)��
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtPremiumRate" ClientInstanceName="dxetxtPremiumRate" runat="server"
                                                            Width="145px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        ���ͷ���(%)��
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtProcessRate" ClientInstanceName="dxetxtProcessRate" runat="server"
                                                            Width="145px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        ���֣�
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxComboBox ID="dxeddlCurrency" ClientInstanceName="dxeddlCurrency" runat="server"
                                                            Width="145px" DropDownStyle="DropDownList">
                                                            <Items>
                                                                <dxe:ListEditItem Text="(ȫ��)" Value="" />
                                                            </Items>
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        ����(ԭ)��
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtPremium" ClientInstanceName="dxetxtPremium" runat="server"
                                                            Width="145px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        ���ͷ�(ԭ)��
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtProcess" ClientInstanceName="dxetxtProcess" runat="server"
                                                            Width="145px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;">
                                                        ������ʣ�
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtConversionRate" ClientInstanceName="dxetxtConversionRate"
                                                            runat="server" Width="145px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        ����(��)��
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtPremiumBase" ClientInstanceName="dxetxtPremiumBase" runat="server"
                                                            Width="145px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        ���ͷ�(��)��
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxTextBox ID="dxetxtProcessBase" ClientInstanceName="dxetxtProcessBase" runat="server"
                                                            Width="145px">
                                                            <ValidationSettings>
                                                                <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="��ʽ����" />
                                                            </ValidationSettings>
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="Server"
                                            TargetControlID="npCostSummaryDetail" ExpandControlID="npCostSummaryHeader" CollapseControlID="npCostSummaryHeader"
                                            Collapsed="false" TextLabelID="lbl_npCostSummaryHeader" ImageControlID="img_npCostSummaryHeader"
                                            ExpandedText="(չ��)" CollapsedText="(����)" ExpandedImage="~/images/collapse_blue.jpg"
                                            CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <asp:Panel ID="npPolicyCompanyHeader" runat="server" CssClass="collapsePanelHeader"
                                            Height="25px">
                                            <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                                <div style="float: left; vertical-align: middle;">
                                                    <asp:ImageButton ID="img_npPolicyCompanyHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                        AlternateText="" />
                                                </div>
                                                <div style="float: left; margin-left: 5px;">
                                                    ���չ�˾</div>
                                                <div style="float: left; margin-left: 5px;">
                                                    <asp:Label ID="lbl_npPolicyCompanyHeader" runat="server">(չ��)</asp:Label>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="npPolicyCompanyDetail" runat="server" CssClass="collapsePanel" Height="0">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="text-align: right;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dxwgv:ASPxGridView ID="gridCarrier" ClientInstanceName="gridCarrier" runat="server"
                                                            KeyFieldName="PolicyCarrierID" Width="100%" AutoGenerateColumns="False">
                                                            <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left"
                                                                    Width="81" HeaderStyle-Wrap="False" AllowDragDrop="false">
                                                                    <NewButton Visible="false" />
                                                                    <EditButton Visible="false" />
                                                                    <DeleteButton Visible="false" />
                                                                    <CustomButtons>
                                                                        <dxwgv:GridViewCommandColumnCustomButton ID="btngridCarrierTogether" Text="�ٱ�" Visibility="Invisible">
                                                                        </dxwgv:GridViewCommandColumnCustomButton>
                                                                    </CustomButtons>
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="CarrierNameCn" Caption="���չ�˾" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="��֧����" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CarrierSales" Caption="ҵ��Ա" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyRate" Caption="�ݶ����(%)" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Premium" Caption="����(ԭ)" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PremiumBase" Caption="����(��)" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProcessRate" Caption="���ͷ���(%)" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Process" Caption="���ͷ�(ԭ)" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProcessBase" Caption="���ͷ�(��)" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CarrierID" Caption="CarrierID" CellStyle-Wrap="False"
                                                                    Visible="false">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="BranchID" Caption="BranchID" CellStyle-Wrap="False"
                                                                    Visible="false">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="PolicyID" CellStyle-Wrap="False"
                                                                    Visible="false">
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                            <Settings ShowGroupPanel="false" ShowFooter="True" ShowGroupFooter="VisibleAlways" />
                                                            <%-- EndRegion --%>
                                                            <SettingsPager Mode="ShowAllRecords" />
                                                            <TotalSummary>
                                                                <dxwgv:ASPxSummaryItem FieldName="Premium" SummaryType="Sum" DisplayFormat="c" />
                                                                <dxwgv:ASPxSummaryItem FieldName="PremiumBase" SummaryType="Sum" DisplayFormat="c" />
                                                                <dxwgv:ASPxSummaryItem FieldName="Process" SummaryType="Sum" DisplayFormat="c" />
                                                                <dxwgv:ASPxSummaryItem FieldName="ProcessBase" SummaryType="Sum" DisplayFormat="c" />
                                                            </TotalSummary>
                                                            <ClientSideEvents CustomButtonClick="function(s, e) {return false;}" />
                                                            <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
                                                        </dxwgv:ASPxGridView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
                                            TargetControlID="npPolicyCompanyDetail" ExpandControlID="npPolicyCompanyHeader"
                                            CollapseControlID="npPolicyCompanyHeader" Collapsed="false" TextLabelID="lbl_npPolicyCompanyHeader"
                                            ImageControlID="img_npPolicyCompanyHeader" ExpandedText="(չ��)" CollapsedText="(����)"
                                            ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                                            SuppressPostBack="true" />
                                    </td>
                                </tr>
                            </table>
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Text="����">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 100%; text-align: left;">
                                        �ļ��б�
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; text-align: left;" runat="server" id="tblcellgridDocList">
                                        <dxwgv:ASPxGridView ID="gridDocList" ClientInstanceName="gridDocList" runat="server"
                                            KeyFieldName="PolicyDocID" Width="100%" AutoGenerateColumns="False" OnHtmlRowCreated="gridDocList_HtmlRowCreated"
                                            OnCustomCallback="gridDocList_CustomCallback">
                                            <%-- BeginRegion Columns --%>
                                            <Columns>
                                                <dxwgv:GridViewDataColumn FieldName="DocName" Caption="�ļ���" CellStyle-Wrap="False"
                                                    Width="25" Settings-AllowDragDrop="false">
                                                    <DataItemTemplate>
                                                        <asp:HyperLink runat="server" ID="docitemlnk"></asp:HyperLink>
                                                    </DataItemTemplate>
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="DocURL" Caption="���ӵ�ַ" CellStyle-Wrap="False">
                                                </dxwgv:GridViewDataColumn>
                                            </Columns>
                                            <%-- EndRegion --%>
                                            <SettingsPager Mode="ShowAllRecords" />
                                            <Settings ShowGroupPanel="false" />
                                            <ClientSideEvents CustomButtonClick="" />
                                            <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
                                        </dxwgv:ASPxGridView>
                                    </td>
                                </tr>
                            </table>
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Text="��    ��" ClientVisible="true">
                    <ContentCollection>
                        <dxw:ContentControl ID="ContentControl2" runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td runat="server" id="tblcellgridPeriod">
                                        <dxwgv:ASPxGridView ID="gridPeriod" ClientInstanceName="gridPeriod" runat="server"
                                            KeyFieldName="PolPeriodId" Width="100%">
                                            <%-- BeginRegion Columns --%>
                                            <Columns>
                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="false">
                                                    <EditButton Visible="false" />
                                                    <NewButton Visible="false" />
                                                    <DeleteButton Visible="false" />
                                                </dxwgv:GridViewCommandColumn>
                                                <dxwgv:GridViewDataColumn FieldName="Period" Caption="�ڴ�" CellStyle-Wrap="false">
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataDateColumn FieldName="PayDate" Caption="��������" CellStyle-Wrap="false"
                                                    PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                                </dxwgv:GridViewDataDateColumn>
                                                <dxwgv:GridViewDataColumn FieldName="CarrierNameCn" Caption="���չ�˾" CellStyle-Wrap="false">
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="��֧����" CellStyle-Wrap="false">
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="PayFeeBase" Caption="����" CellStyle-Wrap="false">
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="PayProcBase" Caption="���ͷ�" CellStyle-Wrap="false">
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="PolicyId" Caption="PolicyId" CellStyle-Wrap="false"
                                                    Visible="false">
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="CarrierID" Caption="CarrierID" CellStyle-Wrap="false"
                                                    Visible="false">
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="BranchID" Caption="BranchID" CellStyle-Wrap="false"
                                                    Visible="false">
                                                </dxwgv:GridViewDataColumn>
                                            </Columns>
                                            <%-- EndRegion --%>
                                            <TotalSummary>
                                                <dxwgv:ASPxSummaryItem FieldName="PayFeeBase" SummaryType="Sum" DisplayFormat="c" />
                                                <dxwgv:ASPxSummaryItem FieldName="PayProcBase" SummaryType="Sum" DisplayFormat="c" />
                                            </TotalSummary>
                                            <SettingsEditing Mode="EditForm" />
                                            <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways"
                                                ShowGroupedColumns="true" ShowFilterRow="false" ShowFooter="true" />
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <SettingsDetail ExportMode="All" />
                                            <SettingsLoadingPanel Mode="ShowAsPopup" ImagePosition="Top" ShowImage="true" Text="Loading" />
                                            <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
                                            <Styles>
                                                <LoadingDiv>
                                                </LoadingDiv>
                                                <LoadingPanel>
                                                </LoadingPanel>
                                            </Styles>
                                        </dxwgv:ASPxGridView>
                                    </td>
                                </tr>
                            </table>
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Text="�����Ϣ">
                    <ContentCollection>
                        <dxw:ContentControl ID="ContentControl1" runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 10%; text-align: right;">
                                        ����ˣ�
                                    </td>
                                    <td style="width: 20%; text-align: left;">
                                        <dxe:ASPxTextBox ID="dxetxtAuditPerson" ClientInstanceName="dxetxtAuditPerson" runat="server"
                                            Width="100px">
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td style="width: 10%; text-align: right;">
                                        ������ڣ�
                                    </td>
                                    <td style="width: 20%; text-align: left;">
                                        <dxe:ASPxDateEdit ID="dxeCheckDate" ClientInstanceName="dxeCheckDate" runat="server"
                                            Width="120px">
                                        </dxe:ASPxDateEdit>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; vertical-align: top;">
                                        ��˱�ע��
                                    </td>
                                    <td style="text-align: left;" colspan="3">
                                        <dxe:ASPxMemo runat="server" ID="dxeMemo" ClientInstanceName="dxeMemo" Rows="10"
                                            Columns="72">
                                        </dxe:ASPxMemo>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                    </td>
                                </tr>
                                <tr runat="server" id="tbltrAuditExecuteAction">
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Text="������Ϣ">
                    <ContentCollection>
                        <dxw:ContentControl ID="ContentControl3" runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 25%; text-align: right;">
                                    </td>
                                    <td style="width: 25%; text-align: left;">
                                    </td>
                                    <td style="width: 25%; text-align: right;">
                                    </td>
                                    <td style="width: 25%; text-align: left;">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ���ձ��ѣ�
                                    </td>
                                    <td>
                                        <dxe:ASPxTextBox ID="dxetxtPayedFee" ClientInstanceName="dxetxtPayedFee" runat="server"
                                            Width="200px">
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td>
                                        δ�ձ��ѣ�
                                    </td>
                                    <td>
                                        <dxe:ASPxTextBox ID="dextxtNeededPayFee" ClientInstanceName="dextxtNeededPayFee"
                                            runat="server" Width="200px">
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        �ѽ⸶���ѣ�
                                    </td>
                                    <td>
                                        <dxe:ASPxTextBox ID="dxetxtPayinedFee" ClientInstanceName="dxetxtPayinedFee" runat="server"
                                            Width="200px">
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td>
                                        δ�⸶���ѣ�
                                    </td>
                                    <td>
                                        <dxe:ASPxTextBox ID="dxetxtNeededPayinFee" ClientInstanceName="dxetxtNeededPayinFee"
                                            runat="server" Width="200px">
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ���վ��ͷѣ�
                                    </td>
                                    <td>
                                        <dxe:ASPxTextBox ID="dxetxtPayedProc" ClientInstanceName="dxetxtPayedProc" runat="server"
                                            Width="200px">
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td>
                                        δ�վ��ͷѣ�
                                    </td>
                                    <td>
                                        <dxe:ASPxTextBox ID="dxetxtNeededPayProc" ClientInstanceName="dxetxtNeededPayProc"
                                            runat="server" Width="200px">
                                        </dxe:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="gridInOutBalance" ClientInstanceName="gridInOutBalance" runat="server"
                                                        KeyFieldName="FeeId" AutoGenerateColumns="False" Settings-ShowFooter="true" Width="100%"
                                                        SettingsPager-AlwaysShowPager="true">
                                                        <%-- BeginRegion Columns --%>
                                                        <Columns>
                                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                                                <NewButton Visible="False" />
                                                                <EditButton Visible="False" />
                                                                <DeleteButton Visible="False" />
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dxwgv:GridViewCommandColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="FeeId" Caption="FeeId" CellStyle-Wrap="False"
                                                                Visible="false">
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="VoucherID" Caption="������ˮ��" CellStyle-Wrap="False">
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Fee" Caption="���" CellStyle-Wrap="False">
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="FeeDate" Caption="�շ�����" CellStyle-Wrap="False">
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="AccounttypeName" Caption="�ո����" CellStyle-Wrap="False"
                                                                GroupIndex="0">
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Createperson" Caption="�շ���" CellStyle-Wrap="False">
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="AuditStatusName" Caption="״̬" CellStyle-Wrap="False">
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="ProcessFeeTypeName" Caption="���ͷ���ȡ��ʽ" CellStyle-Wrap="False">
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dxwgv:GridViewDataColumn>
                                                        </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" />
                                                        <GroupSummary>
                                                            <dxwgv:ASPxSummaryItem FieldName="Fee" ShowInGroupFooterColumn="Fee" SummaryType="Sum"
                                                                DisplayFormat="c" />                                                            
                                                        </GroupSummary>
                                                        <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways"
                                                            ShowGroupedColumns="true" ShowFilterRow="false" />
                                                        <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                                        <SettingsText CustomizationWindowCaption="���Ի�" />
                                                        <ClientSideEvents CustomButtonClick="function(s, e) {return false;}" />
                                                    </dxwgv:ASPxGridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Text="�ⰸ��Ϣ">
                    <ContentCollection>
                        <dxw:ContentControl ID="ContentControl5" runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 100%;">
                                        <div style="float: left; margin-left: 5px;">
                                            ������Ϣ</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 15%;">
                                                </td>
                                                <td style="width: 35%;">
                                                </td>
                                                <td style="width: 15%;">
                                                </td>
                                                <td style="width: 30%;">
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    �ͻ������ˣ�
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtNotifyPerson" ClientInstanceName="dxetxtNotifyPerson"
                                                        runat="server" Width="160px">
                                                    </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    ���յص㣺
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtAccidentSpot" ClientInstanceName="dxetxtAccidentSpot"
                                                        runat="server" Width="160px">
                                                    </dxe:ASPxTextBox>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    �ͻ�����˾<br />
                                                    ����ʱ�䣺
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxDateEdit ID="dxedeNotifyTime" ClientInstanceName="dxedeNotifyTime" runat="server"
                                                        Width="160px">
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                                <td style="text-align: right;">
                                                    �����
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtNotifyLossFee" ClientInstanceName="dxetxtNotifyLossFee"
                                                        runat="server" Width="160px">
                                                    </dxe:ASPxTextBox>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    �������ڣ�
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxDateEdit ID="dxedeAccidentTime" ClientInstanceName="dxedeAccidentTime" runat="server"
                                                        Width="160px">
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                                <td style="text-align: right;">
                                                    ��ʧ���ʣ�
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlLossType" ClientInstanceName="dxeddlLossType" runat="server"
                                                        Width="160px" DropDownStyle="DropDownList">
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    ����ԭ��
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlAccidentReason" ClientInstanceName="dxeddlAccidentReason"
                                                        runat="server" Width="160px" DropDownStyle="DropDownList">
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    ��ϵ�绰��
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtContactPhone" ClientInstanceName="dxetxtContactPhone"
                                                        runat="server" Width="160px">
                                                    </dxe:ASPxTextBox>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    �ͻ���ϵ�ˣ�
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtContactPerson" ClientInstanceName="dxetxtContactPerson"
                                                        runat="server" Width="160px">
                                                    </dxe:ASPxTextBox>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right; vertical-align: top;">
                                                    �¹�������
                                                </td>
                                                <td style="text-align: left;" colspan="3">
                                                    <dxe:ASPxMemo runat="server" ID="dxetxtAccidentProc" ClientInstanceName="dxetxtAccidentProc"
                                                        Rows="10" Columns="120">
                                                    </dxe:ASPxMemo>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    ���չ�˾<br />
                                                    �������ڣ�
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxDateEdit ID="dxedeNotifyCarrierTime" ClientInstanceName="dxedeNotifyCarrierTime"
                                                        runat="server" Width="160px">
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                                <td style="text-align: right;">
                                                    �����ţ�
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtNotifyNo" ClientInstanceName="dxetxtNotifyNo" runat="server"
                                                        Width="160px">
                                                    </dxe:ASPxTextBox>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    ���չ�˾<br />
                                                    �참��Ա��
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtCarrierContactPerson" ClientInstanceName="dxetxtCarrierContactPerson"
                                                        runat="server" Width="160px">
                                                    </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    �참��Ա<br />
                                                    ��ϵ�绰��
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtCarrierContactPhone" ClientInstanceName="dxetxtCarrierContactPhone"
                                                        runat="server" Width="160px">
                                                    </dxe:ASPxTextBox>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    �鿱���ڣ�
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxDateEdit ID="dxedePerambulateTime" ClientInstanceName="dxedePerambulateTime"
                                                        runat="server" Width="160px">
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <div style="float: left; margin-left: 5px;">
                                            ������Ϣ</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="text-align: right;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="gridTraceInfoItem" ClientInstanceName="gridTraceInfoItem"
                                                        runat="server" KeyFieldName="FollowID" Width="100%" AutoGenerateColumns="False">
                                                        <%-- BeginRegion Columns --%>
                                                        <Columns>
                                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left"
                                                                Width="81" AllowDragDrop="false">
                                                                <NewButton Visible="false" />
                                                                <EditButton Visible="false" />
                                                                <DeleteButton Visible="false" />
                                                            </dxwgv:GridViewCommandColumn>
                                                            <dxwgv:GridViewDataDateColumn FieldName="FollowDate" Caption="��������" CellStyle-Wrap="False"
                                                                PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                                            </dxwgv:GridViewDataDateColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="FollowContent" Caption="��������" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="FollowNextContent" Caption="��һ������" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="LoseStatusName" Caption="�ⰸ״̬" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="EstimateFeel" Caption="���ƽ��" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="NotifyID" Caption="NotifyID" CellStyle-Wrap="False"
                                                                Visible="false">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="FollowID" Caption="FollowID" CellStyle-Wrap="False"
                                                                Visible="false">
                                                            </dxwgv:GridViewDataColumn>
                                                        </Columns>
                                                        <Settings ShowGroupPanel="false" ShowFooter="True" ShowGroupFooter="VisibleAlways" />
                                                        <TotalSummary>
                                                            <dxwgv:ASPxSummaryItem FieldName="FollowDate" SummaryType="Count" DisplayFormat="����:#" />
                                                            <dxwgv:ASPxSummaryItem FieldName="EstimateFeel" SummaryType="Sum" DisplayFormat="c" />
                                                        </TotalSummary>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <ClientSideEvents />
                                                        <SettingsBehavior ConfirmDelete="true" AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
                                                    </dxwgv:ASPxGridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <div style="float: left; margin-left: 5px;">
                                            �������</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 15%;">
                                                </td>
                                                <td style="width: 35%;">
                                                </td>
                                                <td style="width: 15%;">
                                                </td>
                                                <td style="width: 30%;">
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" style="width: 100%; text-align: left;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td colspan="4">
                                                    <dxwgv:ASPxGridView ID="gridDocList_NotifyClaim" ClientInstanceName="gridDocList_NotifyClaim"
                                                        runat="server" KeyFieldName="NotifyClaimDocID" Width="100%" AutoGenerateColumns="False"
                                                        OnHtmlRowCreated="gridDocList_NotifyClaim_HtmlRowCreated">
                                                        <%-- BeginRegion Columns --%>
                                                        <Columns>
                                                            <dxwgv:GridViewDataColumn FieldName="DocName" Caption="�ļ���" CellStyle-Wrap="False"
                                                                Width="25" Settings-AllowDragDrop="false">
                                                                <DataItemTemplate>
                                                                    <asp:HyperLink runat="server" ID="docitemlnk"></asp:HyperLink>
                                                                </DataItemTemplate>
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="DocURL" Caption="���ӵ�ַ" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                        </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowAllRecords" />
                                                        <Settings ShowGroupPanel="false" />
                                                        <ClientSideEvents CustomButtonClick="" />
                                                        <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
                                                    </dxwgv:ASPxGridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <div style="float: left; margin-left: 5px;">
                                            �᰸��Ϣ</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 10%;">
                                                </td>
                                                <td style="width: 25%;">
                                                </td>
                                                <td style="width: 10%;">
                                                </td>
                                                <td style="width: 25%;">
                                                </td>
                                                <td style="width: 10%;">
                                                </td>
                                                <td style="width: 25%;">
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    ������ȫ���ڣ�
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxDateEdit ID="dxedeDocCompleteDate" ClientInstanceName="dxedeDocCompleteDate"
                                                        runat="server" Width="120px">
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                                <td style="text-align: right;">
                                                    �⸶��
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="dxetxtLastPayFee" ClientInstanceName="dxetxtLastPayFee" runat="server"
                                                        Width="120px">
                                                    </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    �������ڣ�
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxDateEdit ID="dxedeLastPayDate" ClientInstanceName="dxedeLastPayDate" runat="server"
                                                        Width="120px">
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    �᰸���ڣ�
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxDateEdit ID="dxedeCaseEndTime" ClientInstanceName="dxedeCaseEndTime" runat="server"
                                                        Width="120px">
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                                <td style="text-align: right;">
                                                    �᰸�ˣ�
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxComboBox ID="dxeddlCaseEndPerson" ClientInstanceName="dxeddlCaseEndPerson"
                                                        runat="server" Width="160px" DropDownStyle="DropDownList">
                                                    </dxe:ASPxComboBox>
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
                                                    �Ƶ��ˣ�
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxTextBox ID="ASPxTextBox1" ClientInstanceName="dxetxtCreatePerson" runat="server"
                                                        Width="120px">
                                                    </dxe:ASPxTextBox>
                                                </td>
                                                <td style="text-align: right;">
                                                    �Ƶ�����:
                                                </td>
                                                <td style="text-align: left;">
                                                    <dxe:ASPxDateEdit ID="dxedeCreateDate" ClientInstanceName="dxedeCreateDate" runat="server"
                                                        Width="120px">
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
            </TabPages>
        </dxtc:ASPxPageControl>
        <table style="height: 5px; background-color: #E0EDFF; width: 100%; font-size: 2px;">
            <tr>
                <td>
                </td>
            </tr>
        </table>
        <asp:Panel ID="npNewExecuteAction" runat="server" CssClass="allborderPanel" Height="30px">
            <table style="width: 100%" runat="server" id="tblNewExecuteAction">
                <tr>
                    <td style="width: 400px; text-align: left;">
                        &nbsp;
                    </td>
                    <td style="width: 50px; text-align: left;">
                    </td>
                    <td style="width: 50px; text-align: left;">
                    </td>
                    <td style="width: 70px; text-align: left;">
                    </td>
                    <td style="width: 50px; text-align: left;">
                    </td>
                    <td style="width: 50px; text-align: left;">
                        <dxe:ASPxButton runat="server" ID="dxeClose" ClientInstanceName="dxeClose" Text="�ر�"
                            CausesValidation="false" AutoPostBack="false">
                            <ClientSideEvents Click="function(s, e) {btnCloseClick();}" />
                        </dxe:ASPxButton>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
