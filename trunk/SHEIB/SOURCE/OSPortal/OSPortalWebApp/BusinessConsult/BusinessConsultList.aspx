<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true"
    Theme="Aqua" CodeBehind="BusinessConsultList.aspx.cs" Inherits="OSPortalWebApp.BusinessConsult.BusinessConsultList"
    Title="" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>业务咨询</title>

    <script type="text/javascript">
	    function menuClick(url) {
	        if (url == "BusinessConsultList.aspx")
            {
                //window.location.href = url;
                gridSearchResult.PerformCallback('');
            }
            else
            {
                var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
                window.showModalDialog("BusinessConsult.aspx", self, myArguments);
            }
        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("BusinessConsult.aspx", self, myArguments);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width: 100%">
        <tr>
            <td style="height: 40px; width: 60%;">
                <dxm:ASPxMenu EnableViewState="False" EncodeHtml="False" ID="dpASPxMenu" runat="server"
                    AllowSelectItem="True" Orientation="Horizontal">
                    <ClientSideEvents CloseUp="function(s, e) {}" PopUp="function(s, e) {}" Init="function(s, e) {}"
                        ItemClick="function(s, e) { 
                            var name = e.item.name;
                            menuClick(name);
                        }" ItemMouseOut="function(s, e) {}" ItemMouseOver="function(s, e) {}" />
                    <Items>
                        <dxm:MenuItem Text="新    建" Name="BusinessConsult.aspx">
                        </dxm:MenuItem>
                    </Items>
                </dxm:ASPxMenu>
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
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table>
                        <tr>
                            <td style="width: 70px; text-align: right;">
                                咨询号：
                            </td>
                            <td style="width: 180px; text-align: left;">
                                <asp:TextBox ID="txtConsultNo" runat="server" Width="175px"></asp:TextBox>
                            </td>
                            <td style="width: 70px; text-align: right;">
                                客户经理：
                            </td>
                            <td style="width: 180px; text-align: left;">
                                <asp:DropDownList runat="server" ID="ddlSales" Width="175px">
                                    <asp:ListItem Text="(全部)" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="张三" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 70px; text-align: right;">
                                咨询日期：
                            </td>
                            <td style="width: 180px; text-align: left;">
                                <dxe:ASPxDateEdit ID="deStartDate" runat="server">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 70px; text-align: center;">
                                至
                            </td>
                            <td style="width: 180px; text-align: left;">
                                <dxe:ASPxDateEdit ID="deEndDate" runat="server">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 70px; text-align: right;">
                                联系人：
                            </td>
                            <td style="width: 180px; text-align: left;">
                                <asp:TextBox ID="txtLinkMan" runat="server" Width="175px"></asp:TextBox>
                            </td>
                            <td style="width: 70px; text-align: right;">
                                审核状态：
                            </td>
                            <td style="width: 180px; text-align: left;">
                                <asp:DropDownList runat="server" ID="ddlAuditStatus" Width="175px">
                                    <asp:ListItem Text="已审核" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="未审核" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" />&nbsp;
                                <asp:Button ID="btnCancel" runat="server" Text="重置" CssClass="input_2" />&nbsp;
                                <asp:Button ID="btnRefresh" runat="server" Text="刷新" CssClass="input_2" />
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
                            <asp:Label ID="lbl_npSearchResultHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server"
                                    KeyFieldName="ConsultNO" AutoGenerateColumns="False" Settings-ShowFooter="true"
                                    Width="100%" SettingsPager-AlwaysShowPager="true" OnRowDeleting="gridSearchResult_RowDeleting"
                                    OnRowDeleted="gridSearchResult_RowDeleted">
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" CellStyle-Wrap="False"
                                            VisibleIndex="0">
                                            <NewButton Visible="False" />
                                            <EditButton Visible="False" />
                                            <DeleteButton Visible="true" />
                                            <CustomButtons>
                                                <dxwgv:GridViewCommandColumnCustomButton Text="编辑">
                                                </dxwgv:GridViewCommandColumnCustomButton>
                                            </CustomButtons>
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="咨询号" FieldName="ConsultNO" VisibleIndex="1">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="咨询日期" FieldName="ConsultDate" VisibleIndex="2">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="客户经理" FieldName="Sales" VisibleIndex="3">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="客户" FieldName="CustName" VisibleIndex="4">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="联系人" FieldName="LinkMan" VisibleIndex="5">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="联系方式" FieldName="ContactType" VisibleIndex="6">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="咨询费（总）" FieldName="TotalConsultFee" VisibleIndex="7">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="发票号" FieldName="InvoiceNO" VisibleIndex="8">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="制单人" FieldName="CreatePerson" VisibleIndex="9">
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" Summary-Text="第{0}页,共{1}页" />
                                    <Settings ShowGroupPanel="false" />
                                    <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                                </dxwgv:ASPxGridView>
                            </td>
                        </tr>
                    </table>
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
