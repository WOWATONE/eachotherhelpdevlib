<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="BusinessConsultList.aspx.cs" Inherits="BrokerWebApp.BusinessConsult.BusinessConsultList" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3.Export" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>业务咨询列表</title>
    <script type="text/javascript">
        function btnCreateClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("BusinessConsult.aspx", self, myArguments);
        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            var consultFeeID = s.GetDataRow(e.visibleIndex).cells[1].innerText;
            window.showModalDialog("BusinessConsult.aspx?ConsultFeeID=" + consultFeeID, self, myArguments);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width: 100%">
        <tr>
            <td style="height: 40px; width: 60%;">
                <dxe:ASPxButton ID="debtnCreate" runat="server" Text="新建" AutoPostBack="False">
                    <ClientSideEvents Click="btnCreateClick" />
                </dxe:ASPxButton>
            </td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">所属项目</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="allborderPanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width:80px; text-align: right;">
                                咨询号：
                            </td>
                            <td style="width:170px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtConsultFeeNo" ClientInstanceName="dxetxtConsultFeeNo" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td style="width:70px; text-align: right;">
                                客户经理：
                            </td>
                            <td style="width:170px; text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlSalesID" ClientInstanceName="dxeddlSalesID" runat="server" Width="160px" DropDownStyle="DropDownList"></dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                咨询日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="deStartConsultDate" ClientInstanceName="deStartConsultDate" runat="server" Width="160px"></dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: center;">
                                至
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="deEndConsultDate" ClientInstanceName="deEndConsultDate" runat="server" Width="160px"></dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: right;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                联系人：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtContact" ClientInstanceName="dxetxtContact" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                审核状态：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="ddlAuditStatus" ClientInstanceName="ddlAuditStatus" runat="server" DropDownStyle="DropDownList"  Width="160px">
                                    <Items>
                                        <dxe:ListEditItem Text="(全部)" Value="" />
                                        <dxe:ListEditItem Text="已审核" Value="1" />
                                        <dxe:ListEditItem Text="未审核" Value="2" />
                                    </Items>
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: left;">
                                <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" OnClick="btnSearch_Click" />&nbsp;
                                <input type="reset" value="重置" name="btnReset" id="btnReset" class="input_2" />&nbsp;
                                <asp:Button ID="btnXlsExport" runat="server" Text="Excel" OnClick="btnXlsExport_Click" CssClass="input_2" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearch" runat="Server" TargetControlID="npSearchDetail"
                    ExpandControlID="npSearchHeader" CollapseControlID="npSearchHeader" Collapsed="false"
                    TextLabelID="lbl_npSearchHeader" ImageControlID="img_npSearchHeader" ExpandedText="(隐藏)"
                    CollapsedText="(展开)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npSearchResultHeader" runat="server" CssClass="collapsePanelHeader"
                    Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchResultHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">搜索结果</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchResultHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <dxwgv:ASPxGridView ID="gridSearchResult" 
                           ClientInstanceName="gridSearchResult" 
                           runat="server"
                           KeyFieldName="ConsultFeeID" 
                           AutoGenerateColumns="False" 
                           Settings-ShowFooter="true"
                           Width="100%" 
                           SettingsPager-AlwaysShowPager="true"
                           OnRowDeleting="gridSearchResult_RowDeleting"
                           OnCustomCallback="gridSearchResult_CustomCallBack"
                           OnHtmlRowCreated="gridSearchResult_HtmlRowCreated"
                           >
                        <Columns>
                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" Width="20px">
                                <NewButton Visible="False" />
                                <EditButton Visible="False" />
                                <DeleteButton Visible="true" />
                                <CustomButtons>
                                    <dxwgv:GridViewCommandColumnCustomButton Text="编辑">
                                    </dxwgv:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn Caption="咨询单号" FieldName="ConsultFeeID" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="咨询号" FieldName="ConsultFeeNo" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataDateColumn Caption="咨询日期" FieldName="ConsultDate" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户名称" FieldName="CustName" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户经理" FieldName="SalesName" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="联系人" FieldName="Contact" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="联系方式" FieldName="Tel" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="咨询费（总）" FieldName="ConsultFee" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="发票号" FieldName="InvoiceNO" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="审核状态" FieldName="AuditStatus" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowPager" />
                        <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways" ShowGroupedColumns="true" ShowFilterRow="false" />
                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                        <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                        <SettingsText CustomizationWindowCaption="个性化" />
                        <TotalSummary >
                            <dxwgv:ASPxSummaryItem FieldName="ConsultFeeID" SummaryType="Count" ShowInGroupFooterColumn="ConsultFeeID" DisplayFormat = "总计: {0}" />
                        </TotalSummary>
                        <TotalSummary >
                            <dxwgv:ASPxSummaryItem FieldName="ConsultFee" SummaryType="Sum" ShowInGroupFooterColumn="ConsultFee" DisplayFormat = "咨询费合计: {0}" />
                        </TotalSummary>
                    </dxwgv:ASPxGridView>
                    <dxwgv:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridSearchResult"></dxwgv:ASPxGridViewExporter>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearchResult" runat="Server" TargetControlID="npSearchResultDetail"
                    ExpandControlID="npSearchResultHeader" CollapseControlID="npSearchResultHeader"
                    Collapsed="false" TextLabelID="lbl_npSearchResultHeader" ImageControlID="img_npSearchResultHeader"
                    ExpandedText="(隐藏)" CollapsedText="(展开)" ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
            </td>
        </tr>
    </table>
</asp:Content>