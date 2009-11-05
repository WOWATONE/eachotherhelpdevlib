<%@ Page Title="理赔保单选择" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="NotifyClaimPolicySelect.aspx.cs"
    Inherits="BrokerWebApp.CustomerClaim.NotifyClaimPolicySelect" %>

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
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>理赔保单选择</title>

    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});          
            window.onunload = function() {
                //
            };

        });

        function isEmpty(testVar) {
            if ((testVar == null) || (testVar.length == 0)) {
                return true;
            } else {
                return false;
            }
        }

        function btnOk_Click() {
            gridSearchResult.GetSelectedFieldValues("PolicyID;Beneficiary;CustomerName;UserName;ProdTypeName;StartDate;EndDate;CarrierName;PolicyNo;PremiumBase;DeptName", getTheSelectedRowsValues);            
        }

        function getTheSelectedRowsValues(selectedValues) {
            if (selectedValues.length == 0) {
                alert("请先选择行");
                return;
            }
            else {
                //var thevalues="";                
                //for (i = 0; i < selectedValues.length; i++) {
                //    if (thevalues == "") {
                //        thevalues = selectedValues[i];
                //    }
                //    else {
                //        thevalues = thevalues + ";-;-;" + selectedValues[i];
                //    }
                //}

                window.returnValue = selectedValues;
                window.close();
            }
        }

        function dxeddlCarrier_SelectedIndexChanged(s, e) {
            var thejsonstring = dxeddlCarrier.GetSelectedItem().value;
            dxeddlBranch.PerformCallback(thejsonstring);
        }

        function dxeddlDeptId_SelectedIndexChanged(s, e) {
            var thejsonstring = dxeddlDeptId.GetSelectedItem().value;
            dxeddlSalesId.PerformCallback(thejsonstring);
        }

        function btnResetClick() {
            ASPxClientEdit.ClearEditorsInContainer(null);
        }

        function OnRowClick(e) {
            //Clear the text selection
            _aspxClearSelection();
            //Unselect all rows
            gridSearchResult._selectAllRowsOnPage(false);
            //Select the row
            gridSearchResult.SelectRow(e.visibleIndex, true);
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
                            所属项目</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(展开)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 980px;">
                        <tr>
                            <td style="width: 90px; text-align: right;">
                                保单号：
                            </td>
                            <td style="width: 110px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server"
                                    Width="100px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="width: 70px; text-align: right;">
                                投保单号：
                            </td>
                            <td style="width: 110px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server"
                                    Width="100px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="width: 70px; text-align: right;">
                                部门：
                            </td>
                            <td style="width: 110px; text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlDeptId" ClientInstanceName="dxeddlDeptId" runat="server"
                                    Width="100px" DropDownStyle="DropDownList">
                                    <ClientSideEvents SelectedIndexChanged="dxeddlDeptId_SelectedIndexChanged" />
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="width: 70px; text-align: right;">
                                客户经理：
                            </td>
                            <td style="width: 120px; text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server"
                                    Width="100px" DropDownStyle="DropDownList" OnCallback="dxeddlSalesIdCallback">
                                </dxe:ASPxComboBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                投保客户：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCustomerID" ClientInstanceName="dxetxtCustomerID" runat="server"
                                    Width="100px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                保险公司：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlCarrier" ClientInstanceName="dxeddlCarrier" runat="server"
                                    Width="100px" DropDownStyle="DropDownList">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {dxeddlCarrier_SelectedIndexChanged(s,e);}" />
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                分支机构：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlBranch" ClientInstanceName="dxeddlBranch" runat="server"
                                    Width="100px" DropDownStyle="DropDownList" OnCallback="dxeddlBranch_Callback">
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                保单类型：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlPolicyType" ClientInstanceName="dxeddlPolicyType" runat="server"
                                    Width="100px" DropDownStyle="DropDownList">
                                </dxe:ASPxComboBox>
                            </td>
                            <td>
                            </td>
                        </tr>                        
                        <tr>
                            <td style="text-align: right;">
                            </td>
                            <td style="text-align: left;">
                            </td>
                            <td style="text-align: right;">
                            </td>
                            <td style="text-align: left;">
                            </td>
                            <td style="text-align: right;">
                            </td>
                            <td style="text-align: left;">
                            </td>
                            <td style="text-align: left;" colspan="2">
                                <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" OnClick="btnSearch_Click" />&nbsp;
                                <input type="reset" value="重置" name="btnReset" id="btnReset" class="input_2" />&nbsp;
                                <input type="button" value="确定" name="btnOk" id="btnok" class="input_2" onclick="btnOk_Click();" />
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
                                    KeyFieldName="PolicyID" AutoGenerateColumns="False" Settings-ShowFooter="true"
                                    Width="100%" SettingsPager-AlwaysShowPager="true">
                                    <%-- BeginRegion Columns --%>
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn ShowSelectCheckbox="true" Caption="&nbsp;" CellStyle-Wrap="False">
                                            <SelectButton Visible="false" />
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataDateColumn FieldName="PolicyID" Caption="投保单号" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Beneficiary" Caption="被保险人" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CustomerName" Caption="投保人" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="DeptName" Caption="部门" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="UserName" Caption="客户经理" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="ProdTypeName" Caption="险种" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="StartDate" Caption="开始日期" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="EndDate" Caption="结束日期" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CarrierName" Caption="保险公司" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="保单号" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PremiumBase" Caption="保费" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                    </Columns>
                                    <%-- EndRegion --%>
                                    <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" />
                                    <Settings ShowGroupPanel="false" />
                                    <ClientSideEvents RowClick="function(s, e) { OnRowClick(e); }" CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                                </dxwgv:ASPxGridView>
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
