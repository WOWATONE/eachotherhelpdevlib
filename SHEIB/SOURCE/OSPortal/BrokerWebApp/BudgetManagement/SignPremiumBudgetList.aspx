<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="SignPremiumBudgetList.aspx.cs"
    Inherits="BrokerWebApp.BudgetManagement.SignPremiumBudgetList" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>签约预算清单列表</title>

    <script type="text/javascript">
        function btnCreateClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("SignPremiumBudget.aspx", self, myArguments);
        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            var signPremiumBudgetID = s.GetDataRow(e.visibleIndex).cells[1].innerText;
            window.showModalDialog("SignPremiumBudget.aspx?SignPremiumBudgetID=" + signPremiumBudgetID, self, myArguments);
        }

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

        function setCustomerID(thevalue) {
            var result = $("#<%=hidCustID.ClientID %>");
            result[0].value = thevalue;
        }

        function imgPolicyProdTypeClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=700px;dialogHeight=500px;center=yes;help=no";
            var retrunval = window.showModalDialog("../popupselectrefs/PolicyProdType.aspx", self, myArguments);
            if (!retrunval || isEmpty(retrunval)) {
                dxetxtProdTypeID.SetValue("");
                setProductTypeID("");
            }
            else {
                //split the return value;
                var thesplit_array = retrunval.split(";");
                dxetxtProdTypeID.SetValue(thesplit_array[1]);
                setProductTypeID(thesplit_array[0]);
            }
        }
        
        
        function SelectedProdTypeNameIndexChanged(s, e) {
            var thevalue = s.GetValue();
            setProductTypeID(thevalue);
            var test = s.GetText();
            var sValue = s.GetValue();

            if (test.length > 0) {
                var index = test.lastIndexOf("∟");
                if (index >= 0) {
                    var testTmp = test.substr(index + 1);
                    s.SetText(testTmp);
                }
            }
        }

        function setProductTypeID(thevalue) {
            var result = $("#<%=ptid.ClientID %>");
            result[0].value = thevalue;
        }

        function dxeddlDeptID_SelectedIndexChanged(s, e) {
            var thejsonstring = dxeddlDeptID.GetSelectedItem().value;
            dxeddlSalesID.PerformCallback(thejsonstring);
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
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
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
                            <td style="width: 70px; text-align: right;">
                                客户名称：
                            </td>
                            <td style="width: 170px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCustName" ClientInstanceName="dxetxtCustName" runat="server"
                                    Width="160px" ReadOnly="true">
                                </dxe:ASPxTextBox>
                                <input type="hidden" id="hidCustID" name="hidCustID" runat="server" />
                            </td>
                            <td style="width: 25px; text-align: left;">
                                <img runat="server" id="imgSelectCustomer" onclick="imgSelectCustomerClick();" alt=""
                                    src="../images/searchicon9.png" style="width: 20px; height: 20px; vertical-align: middle;" />
                            </td>
                            <td style="width: 70px; text-align: right;">
                                部门：
                            </td>
                            <td style="width: 170px; text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server"
                                    Width="170px" DropDownStyle="DropDownList">
                                    <ClientSideEvents SelectedIndexChanged="dxeddlDeptID_SelectedIndexChanged" />
                                </dxe:ASPxComboBox>
                            </td>
                            <td>
                                客户经理：
                            </td>
                            <td>
                                <dxe:ASPxComboBox ID="dxeddlSalesID" ClientInstanceName="dxeddlSalesID" runat="server"
                                    Width="160px" DropDownStyle="DropDownList" OnCallback="dxeddlSalesIdCallback">
                                </dxe:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                保险险种：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlProdTypeName" ClientInstanceName="dxeddlProdTypeName"
                                    runat="server" Width="240px" DropDownStyle="DropDownList">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {SelectedProdTypeNameIndexChanged(s, e); return false;}" />
                                </dxe:ASPxComboBox>
                                <input type="hidden" id="ptid" runat="server" />
                            </td>
                            <td style="text-align: left;">
                                <img runat="server" id="imgpeoplesearch" alt="" src="../images/searchicon9.png" style="width: 20px;
                                    height: 20px; vertical-align: middle;" onclick="imgPolicyProdTypeClick();" />
                            </td>
                            <td style="text-align: right;">
                                业务性质：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlOperationType" ClientInstanceName="dxeddlOperationType"
                                    runat="server" DropDownStyle="DropDownList" Width="160px">
                                    <Items>
                                        <dxe:ListEditItem Text="(全部)" Value="" />
                                        <dxe:ListEditItem Text="预算内新增" Value="0" />
                                        <dxe:ListEditItem Text="预算外新增" Value="2" />
                                        <dxe:ListEditItem Text="续保" Value="1" />
                                    </Items>
                                </dxe:ASPxComboBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                年月：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtNY" ClientInstanceName="dxetxtNY" runat="server" Width="160px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: left;">
                                (yyyymm)
                            </td>
                            <td style="text-align: right;">
                                保单类别
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlPremiumType" ClientInstanceName="dxeddlPremiumType" runat="server"
                                    DropDownStyle="DropDownList" Width="160px">
                                </dxe:ASPxComboBox>
                            </td>
                            <td colspan="2">
                                <asp:Button ID="Button1" runat="server" Text="查询" CssClass="input_2" OnClick="btnSearch_Click" />&nbsp;
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
                        KeyFieldName="SignPremiumBudgetID" AutoGenerateColumns="False" Settings-ShowFooter="true"
                        Width="100%" SettingsPager-AlwaysShowPager="true" OnRowDeleting="gridSearchResult_RowDeleting"
                        OnCustomCallback="gridSearchResult_CustomCallBack">
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
                            <dxwgv:GridViewDataTextColumn Caption="预算编号" FieldName="SignPremiumBudgetID" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户经理" FieldName="SalesName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户名称" FieldName="CustName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="险种" FieldName="ProdTypeName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="业务性质" FieldName="OperationTypeName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="年月" FieldName="NY" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="保费预算" FieldName="PremiumBudget" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="佣金预算" FieldName="ProcessBudget" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="保单类别" FieldName="PremiumTypeName" CellStyle-Wrap="False"
                                HeaderStyle-HorizontalAlign="Center">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowPager" />
                        <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways"
                            ShowGroupedColumns="true" ShowFilterRow="false" />
                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                        <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                        <SettingsText CustomizationWindowCaption="个性化" />
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem FieldName="SignPremiumBudgetID" SummaryType="Count" ShowInGroupFooterColumn="SignPremiumBudgetID"
                                DisplayFormat="总计: {0}" />
                        </TotalSummary>
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem FieldName="PremiumBudget" SummaryType="Sum" ShowInGroupFooterColumn="PremiumBudget"
                                DisplayFormat="保费预算合计: {0}" />
                        </TotalSummary>
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem FieldName="ProcessBudget" SummaryType="Sum" ShowInGroupFooterColumn="ProcessBudget"
                                DisplayFormat="佣金预算合计: {0}" />
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
