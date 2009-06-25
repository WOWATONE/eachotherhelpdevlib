<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="FeeNotice.aspx.cs" Inherits="BrokerWebApp.inoutbalance.FeeNotice" %>

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
    <title>保费通知书列表</title>

    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});

            lblCurrentDate.innerHTML = makewelcomeString();

        });

        function btnCreateClick() {

            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("FeeNoticeAdd.aspx", self, myArguments);

        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            var thekey = s.GetDataRow(e.visibleIndex).cells[1].innerText;
            var querystring;
            querystring = "FeeNoticeAdd.aspx?NoticeNo=" + thekey;

            window.showModalDialog(querystring, self, myArguments);
        }

        function imgPolicyProdTypeClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            //window.showModalDialog("PolicyProdType.aspx", self, myArguments);
        }
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width: 100%">
        <tr>
            <td style="height: 40px; width: 45%;">
                <dxe:ASPxButton ID="debtnCreate" runat="server" Text="新建" AutoPostBack="false">
                    <ClientSideEvents Click="btnCreateClick" />
                </dxe:ASPxButton>
            </td>
            <td style="height: 40px; width: 55%; color: #0E5ED5; text-align: left;">
                当前位置：保费通知书&nbsp;&nbsp;
                <asp:Label ID="LbUserNameTop" runat="server" Text="王六"></asp:Label>，您好！今天是
                <label id="lblCurrentDate">
                </label>
            </td>
        </tr>
        <tr>
            <td style="width: 100%;" colspan="2">
                <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            所属项目</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(展开)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table>
                        <tr>
                            <td style="width: 70px; text-align: right; white-space: nowrap;">
                                保单编号：
                            </td>
                            <td style="width: 110px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server"
                                    Width="160px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="width: 20px;">
                            </td>
                            <td style="width: 70px; text-align: right; white-space: nowrap;">
                                投保单号：
                            </td>
                            <td style="width: 110px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server"
                                    Width="160px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="width: 120px; text-align: right; white-space: nowrap;">
                                收款方式：
                            </td>
                            <td style="width: 160px; text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlGatheringType" ClientInstanceName="dxeddlGatheringType"
                                    runat="server" Width="160px" DropDownStyle="DropDownList">
                                </dxe:ASPxComboBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                通知书号：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtNoticeNo" ClientInstanceName="dxetxtNoticeNo" runat="server"
                                    Width="160px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                            </td>
                            <td style="text-align: right;">
                                投保客户：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCustomerID" ClientInstanceName="dxetxtCustomerID" runat="server"
                                    Width="160px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                险种：
                            </td>
                            <td style="text-align: left;">
                                <table style="margin-left: -3px;">
                                    <tr>
                                        <td style="width: 105px; text-align: left;">
                                            <dxe:ASPxTextBox ID="dxetxtProdTypeID" ClientInstanceName="dxetxtProdTypeID" runat="server"
                                                Width="160px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td style="text-align: left;">
                                            <img runat="server" id="imgpeoplesearch" alt="" src="../images/searchicon9.png" style="width: 20px;
                                                height: 20px; vertical-align: top;" onclick="imgPolicyProdTypeClick();" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                部门：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlDeptId" ClientInstanceName="dxeddlDeptId" runat="server"
                                    Width="160px" DropDownStyle="DropDownList">
                                </dxe:ASPxComboBox>
                            </td>
                            <td>
                            </td>
                            <td style="text-align: right;">
                                客户经理：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlSalesID" ClientInstanceName="dxeddlSalesID" runat="server"
                                    Width="160px" DropDownStyle="DropDownList">
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                保单类型：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlPolicyType" ClientInstanceName="dxeddlPolicyType" runat="server"
                                    Width="160px" DropDownStyle="DropDownList">
                                </dxe:ASPxComboBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                通知日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="dxeNoticeStartDate" runat="server" Width="160px">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: center;">
                                至
                            </td>
                            <td style="text-align: left;" colspan="2">
                                <dxe:ASPxDateEdit ID="dxeNoticeEndDate" runat="server" Width="160px">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: right;">
                                状态：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlAuditStatus" ClientInstanceName="dxeddlAuditStatus" runat="server"
                                    Width="160px" DropDownStyle="DropDownList">
                                </dxe:ASPxComboBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td style="text-align: right;" colspan="2">
                                <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" />&nbsp;
                                <input type="reset" value="重置" name="btnReset" id="btnReset" class="input_2" />&nbsp;
                                <asp:Button ID="btnExport" runat="server" Text="Excel" OnClick="btnXlsExport_Click"
                                    CssClass="input_2" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearch" runat="Server" TargetControlID="npSearchDetail"
                    ExpandControlID="npSearchHeader" CollapseControlID="npSearchHeader" Collapsed="false"
                    TextLabelID="lbl_npSearchHeader" ImageControlID="img_npSearchHeader" ExpandedText="(展开)"
                    CollapsedText="(隐藏)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
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
                            搜索结果</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchResultHeader" runat="server">(展开)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server"
                                    KeyFieldName="NoticeNo" AutoGenerateColumns="False" Settings-ShowFooter="true"
                                    Width="100%" SettingsPager-AlwaysShowPager="true" OnRowDeleting="gridSearchResult_RowDeleting"
                                    OnRowDeleted="gridSearchResult_RowDeleted">
                                    <%-- BeginRegion Columns --%>
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;" CellStyle-Wrap="False">
                                            <NewButton Visible="False" />
                                            <EditButton Visible="false" />
                                            <DeleteButton Visible="true" />
                                            <CustomButtons>
                                                <dxwgv:GridViewCommandColumnCustomButton Text="编辑">
                                                </dxwgv:GridViewCommandColumnCustomButton>
                                            </CustomButtons>
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataColumn FieldName="NoticeNo" Caption="通知书号" CellStyle-Wrap="False"
                                            GroupIndex="0">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CustName" Caption="投保客户" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="SalesName" Caption="客户经理" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="GatheringTypeName" Caption="收款方式" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="AuditStatusName" Caption="审核状态" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataDateColumn FieldName="NoticeDate" Caption="通知日期" CellStyle-Wrap="False"
                                            PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PayFee" Caption="应收金额" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                    </Columns>
                                    <%-- EndRegion --%>
                                    <SettingsPager Mode="ShowPager" AlwaysShowPager="true" />
                                    <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways"
                                        ShowGroupedColumns="true" ShowFilterRow="false" />
                                    <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                    <SettingsText CustomizationWindowCaption="个性化" />
                                    <GroupSummary>
                                        <dxwgv:ASPxSummaryItem FieldName="NoticeNo" SummaryType="Count" ShowInGroupFooterColumn="NoticeNo"
                                            DisplayFormat="总计: {0}" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayFee" SummaryType="Sum" ShowInGroupFooterColumn="PayFee"
                                            DisplayFormat="c" />
                                    </GroupSummary>
                                    <TotalSummary>
                                        <dxwgv:ASPxSummaryItem FieldName="NoticeNo" SummaryType="Count" DisplayFormat="总记录:#" />
                                        <dxwgv:ASPxSummaryItem FieldName="PayFee" SummaryType="Sum" DisplayFormat="c" />
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
                    ExpandedText="(展开)" CollapsedText="(隐藏)" ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
            </td>
        </tr>
    </table>
</asp:Content>
