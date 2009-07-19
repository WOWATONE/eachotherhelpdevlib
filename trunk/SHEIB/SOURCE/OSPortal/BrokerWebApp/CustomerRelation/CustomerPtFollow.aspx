<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="CustomerPtFollow.aspx.cs" Inherits="BrokerWebApp.CustomerRelation.CustomerPtFollow" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3.Export" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>销售跟进列表</title>
    <script type="text/javascript">
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server" />
    <table style="width: 100%">
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            所属项目</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="allborderPanel">
                    <table style="width: 100%">
                        <tr>
                            <td style="width:80px; text-align: right;">
                                客户名称：
                            </td>
                            <td style="width:170px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCustName" ClientInstanceName="dxetxtCustName" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxTextBox>
                                <input type="hidden" id="hidCustID" name="hidCustID" runat="server" />
                            </td>
                            <td style="width:30px; text-align: center;">
                                <img runat="server" id="imgSelectCustomer" onclick="imgSelectCustomerClick();" alt=""
                                                        src="../images/searchicon9.png" style="width: 20px; height: 20px; vertical-align: top;" />
                            </td>
                            <td style="width:70px; text-align: right;">
                                客户经理：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlSalesID" ClientInstanceName="dxeddlSalesID" runat="server" Width="160px" DropDownStyle="DropDownList"></dxe:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                跟进日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="deStartFollowDate" ClientInstanceName="deStartFollowDate" runat="server" Width="160px">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: center;">
                                至
                            </td>
                            <td style="text-align: left;" colspan="2">
                                <dxe:ASPxDateEdit ID="deEndFollowDate" ClientInstanceName="deEndFollowDate" runat="server" Width="160px">
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:80px; text-align: right;">
                                跟进类型：
                            </td>
                            <td style="width:170px; text-align: left;">
                                <dxe:ASPxComboBox ID="dexddlFollowType" ClientInstanceName="dexddlFollowType" runat="server" Width="160px" DropDownStyle="DropDownList">
                                     <Items>
                                        <dxe:ListEditItem Text="全部" Value="" />
                                        <dxe:ListEditItem Text="面谈" Value="面谈" />
                                        <dxe:ListEditItem Text="电话" Value="电话" />
                                        <dxe:ListEditItem Text="Email" Value="Email" />
                                        <dxe:ListEditItem Text="其他" Value="其他" />
                                    </Items>
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="width:50px; text-align: center;">
                                &nbsp;
                            </td>
                            <td style="text-align: left;" colspan="2">
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
                        <div style="float: left; margin-left: 5px;">
                            搜索结果</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchResultHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel">
                    <dxwgv:ASPxGridView ID="gridSearchResult" 
                           ClientInstanceName="gridSearchResult"
                           runat="server" 
                           KeyFieldName="FollowID" 
                           Width="100%" 
                           AutoGenerateColumns="False" 
                           Settings-ShowFooter="true"
                           SettingsPager-AlwaysShowPager="true" 
                           SettingsBehavior-AllowSort="false">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="跟进编号" FieldName="FollowID" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="跟进日期" FieldName="FollowDate" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户名称" FieldName="CustName" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户经理" FieldName="SalesName" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="跟进类型" FieldName="FollowType" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="跟进程度" FieldName="FollowStage" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="跟进内容" FieldName="FollowMemo" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="跟进人" FieldName="FollowPerson" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="下次跟进日期" FieldName="NextFollow" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowPager" />
                        <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways" ShowGroupedColumns="true" ShowFilterRow="false" />
                        <SettingsText CustomizationWindowCaption="个性化" />
                        <GroupSummary >
                            <dxwgv:ASPxSummaryItem FieldName="FollowID" SummaryType="Count" ShowInGroupFooterColumn="FollowID" DisplayFormat = "总计: {0}" />
                        </GroupSummary>
                        <TotalSummary >
                            <dxwgv:ASPxSummaryItem FieldName="FollowID" SummaryType="Count" ShowInGroupFooterColumn="FollowID" DisplayFormat = "总计: {0}" />
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