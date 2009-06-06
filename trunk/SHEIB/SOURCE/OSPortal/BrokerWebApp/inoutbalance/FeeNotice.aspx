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
            window.showModalDialog("FeeNoticeAdd.aspx", self, myArguments);
        }

        function imgPolicyProdTypeClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            //window.showModalDialog("PolicyProdType.aspx", self, myArguments);
        }
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxtoolkit:toolkitscriptmanager runat="Server" id="ScriptManager1" />
    <table style="width: 100%">
        <tr>
            <td style="height: 40px; width: 45%;">
                <dxe:aspxbutton id="debtnCreate" runat="server" text="新建" autopostback="false">
                    <ClientSideEvents Click="btnCreateClick" />
                </dxe:aspxbutton>
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
                                <asp:TextBox ID="txtPolicyNo" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td style="width: 20px;">
                            </td>
                            <td style="width: 70px; text-align: right; white-space: nowrap;">
                                投保单号：
                            </td>
                            <td style="width: 110px; text-align: left;">
                                <asp:TextBox ID="TextBox1" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td style="width: 120px; text-align: right; white-space: nowrap;">
                                收款方式：
                            </td>
                            <td style="width: 100px; text-align: left;">
                                <asp:DropDownList ID="ddlFeeType" runat="server">
                                    <asp:ListItem Text="代收" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="直付" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                通知书号：
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox ID="TextBox2" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td style="text-align: right;">
                                投保客户：
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox ID="TextBox3" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td style="text-align: right;">
                                险种：
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox ID="txtProdTypeID" runat="server" Width="120px"></asp:TextBox>
                                <img runat="server" id="imgpeoplesearch" alt="" src="../images/searchicon9.png" style="width: 20px;
                                    height: 20px; vertical-align: top;" onclick="imgPolicyProdTypeClick();" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                部门：
                            </td>
                            <td style="text-align: left;">
                                <asp:DropDownList runat="server" ID="ddlDeptId">
                                    <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td style="text-align: right;">
                                客户经理：
                            </td>
                            <td style="text-align: left;">
                                <asp:DropDownList runat="server" ID="ddlSalesId">
                                    <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: right;">
                                保单类型：
                            </td>
                            <td style="text-align: left;">
                                <asp:DropDownList runat="server" ID="DropDownList3">
                                    <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                    <asp:ListItem Text="车险" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="非车险" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                通知日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:aspxdateedit id="deStartDate" runat="server">
                                </dxe:aspxdateedit>
                            </td>
                            <td style="text-align: center;">
                                至
                            </td>
                            <td style="text-align: left;" colspan="2">
                                <dxe:aspxdateedit id="deEndDate" runat="server">
                                </dxe:aspxdateedit>
                            </td>
                            <td style="text-align: right;">
                                状态：
                            </td>
                            <td style="text-align: left;">
                                <asp:DropDownList runat="server" ID="ddlState">
                                    <asp:ListItem Text="待审核" Value=""></asp:ListItem>
                                    <asp:ListItem Text="未收费" Value=""></asp:ListItem>
                                    <asp:ListItem Text="已收费" Value=""></asp:ListItem>
                                </asp:DropDownList>
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
                                <asp:Button ID="btnCancel" runat="server" Text="重置" CssClass="input_2" />&nbsp;
                                <asp:Button ID="btnExcel" runat="server" Text="Excel" CssClass="input_2" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxtoolkit:collapsiblepanelextender id="cpeSearch" runat="Server" targetcontrolid="npSearchDetail"
                    expandcontrolid="npSearchHeader" collapsecontrolid="npSearchHeader" collapsed="false"
                    textlabelid="lbl_npSearchHeader" imagecontrolid="img_npSearchHeader" expandedtext="(展开)"
                    collapsedtext="(隐藏)" expandedimage="~/images/collapse_blue.jpg" collapsedimage="~/images/expand_blue.jpg"
                    suppresspostback="true" />
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
                                <dxwgv:aspxgridview id="gridSearchResult" 
                                    DataSourceID="DataSource" 
                                    clientinstancename="gridSearchResult"
                                    runat="server" keyfieldname="NoticeId" autogeneratecolumns="False" settings-showfooter="true"
                                    width="100%" settingspager-alwaysshowpager="true" onrowdeleting="gridSearchResult_RowDeleting"
                                    onrowdeleted="gridSearchResult_RowDeleted">
                                    <%-- BeginRegion Columns --%>
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" CellStyle-Wrap="False">
                                            <NewButton Visible="False" />
                                            <EditButton Visible="false" />
                                            <DeleteButton Visible="true" />
                                            <CustomButtons>
                                                <dxwgv:GridViewCommandColumnCustomButton Text="编辑">
                                                </dxwgv:GridViewCommandColumnCustomButton>
                                            </CustomButtons>
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataColumn FieldName="NoticeNo" Caption="通知书号" CellStyle-Wrap="False">
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
                                    </Columns>
                                    <%-- EndRegion --%>
                                    <SettingsPager Mode="ShowPager" />
                                    <Settings ShowGroupPanel="false" />
                                    <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                                </dxwgv:aspxgridview>
                                <asp:ObjectDataSource ID="DataSource" runat="server" SelectMethod="FetchList()" TypeName="BusinessObjects.BO_Notice"
                                    EnablePaging="False">
                                    <SelectParameters>
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxtoolkit:collapsiblepanelextender id="cpeSearchResult" runat="Server" targetcontrolid="npSearchResultDetail"
                    expandcontrolid="npSearchResultHeader" collapsecontrolid="npSearchResultHeader"
                    collapsed="false" textlabelid="lbl_npSearchResultHeader" imagecontrolid="img_npSearchResultHeader"
                    expandedtext="(展开)" collapsedtext="(隐藏)" expandedimage="~/images/collapse_blue.jpg"
                    collapsedimage="~/images/expand_blue.jpg" suppresspostback="true" />
            </td>
        </tr>
    </table>
</asp:Content>
