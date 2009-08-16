<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true"
    Theme="Aqua" CodeBehind="CustomerList.aspx.cs" Inherits="BrokerWebApp.CustomerRelation.CustomerList"
    Title="客户列表" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>客户列表</title>

    <script type="text/javascript">
     <!--
        function CustTypeSelectedIndexChanged(s, e) {
            var custType = s.GetValue();
            var lblCustType = $("#<%=lblCustType.ClientID %>");
            if (custType == "1")
                lblCustType[0].innerHTML = "身份证号码：";
            else if (custType == "0")
                lblCustType[0].innerHTML = "组织机构号：";
            else
                lblCustType[0].innerHTML = "身份证号码/<br/>组织机构号：";
        }

        function btnCreateClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=1000px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("Customer.aspx", self, myArguments);
        }

        function gridCustomButtonClick(s, e) {
            if (e.buttonID == "删除") {
                if (!confirm("确定删除吗?"))
                    return false;
                var custID = s.GetDataRow(e.visibleIndex).cells[1].innerText;
                dxeDeleteCustomerCallback.PerformCallback(custID);
            }
            else if (e.buttonID == "编辑") {
                var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=1000px;dialogHeight=700px;center=yes;help=no";
                var custID = s.GetDataRow(e.visibleIndex).cells[1].innerText;
                window.showModalDialog("Customer.aspx?CustID=" + custID, self, myArguments);
            }
            else
                return false;
        }

        function deleteCustomerCallbackComplete(s, e) {
            if (e.result != "" && e.result != "ok") {
                alert(e.result);
                return false;
            }
            gridSearchResult.PerformCallback();
        }
    -->
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxcb:ASPxCallback ID="dxeDeleteCustomerCallback" ClientInstanceName="dxeDeleteCustomerCallback" runat="server" OnCallback="dxeDeleteCustomerCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) { deleteCustomerCallbackComplete(s, e); }" />
    </dxcb:ASPxCallback>
    <table style="width: 100%;">
        <tr>
            <td style="height: 40px; width: 100%;">
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
                        <div style="float: left; margin-left: 5px;">
                            所属项目</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="allborderPanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 80px; text-align: right;">
                                客户编号：
                            </td>
                            <td style="width: 170px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCustID" ClientInstanceName="dxetxtCustID" runat="server"
                                    Width="160px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="width: 70px; text-align: right;">
                                所在地区：
                            </td>
                            <td style="width: 170px; text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlArea" ClientInstanceName="dxeddlArea" runat="server"
                                    Width="160px" DropDownStyle="DropDownList">
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="width: 70px; text-align: right;">
                                客户地址：
                            </td>
                            <td style="width: 170px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtAddress" ClientInstanceName="dxetxtAddress" runat="server"
                                    Width="160px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: left;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                客户名称：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCustName" ClientInstanceName="dxetxtCustName" runat="server"
                                    Width="160px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                行业类型：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlTradeType" ClientInstanceName="dxeddlTradeType" runat="server"
                                    Width="160px" DropDownStyle="DropDownList">
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                部门：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlDepartment" ClientInstanceName="dxeddlDepartment" runat="server"
                                    Width="160px" DropDownStyle="DropDownList">
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: left;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                <asp:Label ID="lblCustType" runat="server" Text="身份证号码/<br/>组织机构号："></asp:Label>
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtIDNO" ClientInstanceName="dxetxtIDNO" runat="server" Width="160px">
                                </dxe:ASPxTextBox>
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
                                客户类型;
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlCustType" ClientInstanceName="dxeddlCustType" runat="server"
                                    Width="160px" DropDownStyle="DropDownList">
                                    <Items>
                                        <dxe:ListEditItem Text="(全部)" Value="" />
                                        <dxe:ListEditItem Text="个人" Value="1" />
                                        <dxe:ListEditItem Text="单位" Value="0" />
                                    </Items>
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { CustTypeSelectedIndexChanged(s, e); return false;}" />
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: left;">
                                <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" OnClick="btnSearch_Click" />&nbsp;
                                <input type="reset" value="重置" name="btnReset" id="btnReset" class="input_2" />&nbsp;
                                <asp:Button ID="btnXlsExport" runat="server" Text="Excel" OnClick="btnXlsExport_Click"
                                    CssClass="input_2" />
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
                <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server"
                        KeyFieldName="CustID" AutoGenerateColumns="False" Settings-ShowFooter="true"
                        Width="100%" SettingsPager-AlwaysShowPager="true"
                        SettingsBehavior-AllowDragDrop="true" OnRowDeleting="gridSearchResult_RowDeleting"
                        OnCustomCallback="gridSearchResult_CustomCallBack">
                        <Columns>
                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" Width="20px">
                                <NewButton Visible="False" />
                                <EditButton Visible="False" />
                                <DeleteButton Visible="False" />
                                <CustomButtons>
                                    <dxwgv:GridViewCommandColumnCustomButton Text="删除">
                                    </dxwgv:GridViewCommandColumnCustomButton>
                                    <dxwgv:GridViewCommandColumnCustomButton Text="编辑">
                                    </dxwgv:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户编号" FieldName="CustID" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户名称" FieldName="CustName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户分类" FieldName="CustTypeName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="所在地区" FieldName="AreaName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="部门" FieldName="DeprtmentName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户地址" FieldName="Address" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="邮政编码" FieldName="PostCode" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="行业类型" FieldName="TradeTypeName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="代码/号码" FieldName="IDNO" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="第一联系人" FieldName="Contact" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="电话" FieldName="Tel" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="手机" FieldName="Mobile" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="传真" FieldName="Fax" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="电子邮件" FieldName="Email" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户经理" FieldName="SalesName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowPager" AlwaysShowPager="true" />
                        <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways"
                            ShowGroupedColumns="true" ShowFilterRow="false" />
                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                        <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                        <SettingsText CustomizationWindowCaption="个性化" />
                        <GroupSummary>
                            <dxwgv:ASPxSummaryItem FieldName="CustID" SummaryType="Count" ShowInGroupFooterColumn="CustID"
                                DisplayFormat="总计: {0}" />
                        </GroupSummary>
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem FieldName="CustID" SummaryType="Count" ShowInGroupFooterColumn="CustID"
                                DisplayFormat="总计: {0}" />
                        </TotalSummary>
                    </dxwgv:ASPxGridView>
                    <dxwgv:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridSearchResult">
                    </dxwgv:ASPxGridViewExporter>
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
