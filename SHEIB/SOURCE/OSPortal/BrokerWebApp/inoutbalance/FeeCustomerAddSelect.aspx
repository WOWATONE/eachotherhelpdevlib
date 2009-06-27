<%@ Page Title="客户收费选择" Language="C#" Theme="Aqua" MasterPageFile="~/SiteMastePages/PopupMaster.Master"
    AutoEventWireup="true" CodeBehind="FeeCustomerAddSelect.aspx.cs" Inherits="BrokerWebApp.inoutbalance.FeeCustomerAddSelect" %>

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
    <title>客户收费选择</title>

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

            }

        }
        
        
        function setProductTypeID(thevalue) {
            var result = $("#<%=ptid.ClientID %>");
            result[0].value = thevalue;
        }

        function btnOk_Click() {

            gridSearchResult.GetSelectedFieldValues("NoticeNo", getTheSelectedRowsValues);

        }

        function getTheSelectedRowsValues(selectedValues) {
            if (selectedValues.length == 0) {
                alert("请先选择行");
                return;
            }
            else {
                //var thevalues = "";

                //for (i = 0; i < selectedValues.length; i++) {
                //    if (thevalues == "") {
                //        thevalues = selectedValues[i];
                //    }
                //    else {
                //        thevalues = thevalues + ";" + selectedValues[i];
                //    }
                //}

                dxeSaveCallback.PerformCallback(selectedValues);
            }
        }

        function saveCallbackComplete(s, e) {
            window.returnValue = e.result;
            window.close();
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
    <dxcb:ASPxCallback ID="dxeSaveCallback" ClientInstanceName="dxeSaveCallback" runat="server" OnCallback="dxeSaveCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {saveCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    
    <input type="hidden" id="txtVoucherId" runat="server" value="" />
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
                            检索条件</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(展开)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 720px;">
                        <tr>
                            <td style="width: 70px; text-align: right;">
                                通知书号：
                            </td>
                            <td style="width: 110px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtNoticeNo" ClientInstanceName="dxeNoticeNo" runat="server"
                                    Width="100px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="width: 70px; text-align: right;">
                                部门：
                            </td>
                            <td style="width: 110px; text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlDeptId" ClientInstanceName="dxeddlDeptId" runat="server"
                                    Width="100px" DropDownStyle="DropDownList">
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="width: 70px; text-align: right;">
                                客户经理：
                            </td>
                            <td style="width: 130px; text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlSalesID" ClientInstanceName="dxeddlSalesID" runat="server"
                                    Width="100px" DropDownStyle="DropDownList">
                                </dxe:ASPxComboBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                投保编号：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server"
                                    Width="100px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                保单编号：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server"
                                    Width="100px">
                                </dxe:ASPxTextBox>
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
                                投保客户：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCustomerID" ClientInstanceName="dxetxtCustomerID" runat="server"
                                    Width="100px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                收款方式：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlGatheringType" ClientInstanceName="dxeddlGatheringType" runat="server"
                                    Width="100px" DropDownStyle="DropDownList">
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                保险险种：
                            </td>
                            <td style="text-align: left;">
                                 <table style="margin-left:-3px;">
                                    <tr>
                                    <td>
                                        <dxe:ASPxTextBox ID="dxetxtProdTypeID" ClientInstanceName="dxetxtProdTypeID" runat="server" Width="100px">
                                        </dxe:ASPxTextBox> 
                                        <input type="hidden" id="ptid" runat="server" />
                                    </td>
                                    <td>                                                                   
                                    <img runat="server" id="imgpeoplesearch" alt="" src="../images/searchicon9.png" style="width: 20px;
                                        height: 20px; vertical-align: top;" onclick="imgPolicyProdTypeClick();" />
                                    </td>
                                    </tr> 
                                </table>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                通知日期：
                            </td>
                            <td style="text-align: left;" colspan="3">
                                <table style="margin-left:-3px;">
                                    <tr>
                                        <td style="text-align: left;">
                                            <dxe:ASPxDateEdit ID="dxeNoticeStartDate" ClientInstanceName="dxeNoticeStartDate" runat="server" Width="100px">
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td style="text-align: right;">
                                            至
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxDateEdit ID="dxeNoticeEndDate" ClientInstanceName="dxeNoticeEndDate" runat="server" Width="100px">
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            
                            <td style="text-align: left;" colspan="2">
                                <asp:CheckBox runat="server" ID="ckbNeedPayFeePolicy" Text="仅显示客户欠费保单" />
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;"></td>
                            <td style="text-align: left;"></td>
                            <td style="text-align: right;"></td>
                            <td style="text-align: left;"></td>
                            <td style="text-align: left;" colspan="2">
                                <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" 
                                    onclick="btnSearch_Click" />&nbsp;
                                <input type="reset" value="重置" name="btnReset" id="btnReset" class="input_2" />&nbsp; 
                                <input type="button" value="确定" name="btnOk" id="btnok" class="input_2" onclick="btnOk_Click();" />
                            </td>
                            <td></td>
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
                                    Width="100%" SettingsPager-AlwaysShowPager="true" 
                                    >
                                    <%-- BeginRegion Columns --%>
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn ShowSelectCheckbox="true" Caption="&nbsp;" CellStyle-Wrap="False">
                                            <SelectButton Visible="false" />
                                        </dxwgv:GridViewCommandColumn>                                        
                                        <dxwgv:GridViewDataColumn FieldName="PolperiodID" Caption="PolperiodID" CellStyle-Wrap="False" Visible ="false">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="NoticeNo" Caption="通知书号" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="投保编号" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="保单编号" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PremiumBase" Caption="保费(本)" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Payfee" Caption="本期应收保费" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Payedfee" Caption="本期已收保费" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Fee" Caption="本次应收保费" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="ProdTypeName" Caption="险种" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CustName" Caption="投保客户" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="SalesName" Caption="客户经理" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="GatheringTypeName" Caption="收款方式" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataDateColumn FieldName="NoticeDate" Caption="通知日期" CellStyle-Wrap="False"
                                            PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CarrierName" Caption="保险公司" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="分支机构" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                    </Columns>
                                    <%-- EndRegion --%>
                                    <SettingsPager Mode="ShowPager" />
                                    <Settings ShowGroupPanel="false" />
                                    <TotalSummary>
                                        <dxwgv:ASPxSummaryItem FieldName="NoticeNo" SummaryType="Count"  DisplayFormat="记录数:#"/>
                                        <dxwgv:ASPxSummaryItem FieldName="PremiumBase" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="Payfee" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="Fee" SummaryType="Sum" DisplayFormat="c" />
                                    </TotalSummary>
                                    <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
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
