<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true"
    Theme="Aqua" CodeBehind="CustomerList.aspx.cs" Inherits="OSPortalWebApp.CustomerRelation.CustomerList"
    Title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>客户录入列表</title>

    <script type="text/javascript">
        function btnCreateClick() {
	        var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("Customer.aspx", self, myArguments);
        } 
        
        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("Customer.aspx", self, myArguments);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width: 100%;">
        <tr>
            <td style="height: 40px; width: 100%;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 55px;">
                            <dxe:ASPxButton ID="debtnCreate" runat="server" Text="新建" AutoPostBack="False">
                                <ClientSideEvents Click="btnCreateClick" />
                            </dxe:ASPxButton>
                        </td>
                        <td style="width: 55px;">
                            <dxe:ASPxButton ID="debtnPrint" runat="server" Text="打印" AutoPostBack="false">
                                <ClientSideEvents Click="" />
                            </dxe:ASPxButton>
                        </td>
                        <td>
                            <dxe:ASPxButton ID="debtnExport" runat="server" Text="导出" AutoPostBack="false">
                                <ClientSideEvents Click="" />
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                </table>
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
                            <td style="width: 33%; text-align: left;" colspan="2">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="radPerson" runat="server"
                                    Checked="True" Text="个人" GroupName="PersonOrUnit" />&nbsp;&nbsp;<asp:RadioButton
                                        ID="radUnit" runat="server" Text="单位" GroupName="PersonOrUnit" />
                            </td>
                            <td style="width: 8%; text-align: right;">
                            </td>
                            <td style="width: 25%; text-align: left;">
                            </td>
                            <td style="width: 8%; text-align: right;">
                            </td>
                            <td style="width: 26%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                客户编号：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:TextBox ID="txtCustNo" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                所在地区：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:DropDownList ID="ddlArea" runat="server" Width="200px">
                                    <asp:ListItem Text="北京市" Value="1" Selected></asp:ListItem>
                                    <asp:ListItem Text="上海市" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                客户地址：
                            </td>
                            <td style="width: 26%; text-align: left;">
                                <asp:TextBox ID="txtAddress" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                客户名称：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:TextBox ID="txtCustName" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                行业类型：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:DropDownList ID="ddlTradeType" runat="server" Width="200px">
                                    <asp:ListItem Text="政府机关" Value="1" Selected></asp:ListItem>
                                    <asp:ListItem Text="其他" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                所属板块：
                            </td>
                            <td style="width: 26%; text-align: left;">
                                <asp:DropDownList ID="ddlPlate" runat="server" Width="200px">
                                    <asp:ListItem Text="石油化工" Value="1" Selected></asp:ListItem>
                                    <asp:ListItem Text="其他" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                组织机构代码号<br />
                                /身份证号码：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:TextBox ID="txtIDNO" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                客户经理：
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:DropDownList ID="ddlCusomerManager" runat="server" Width="200px">
                                    <asp:ListItem Text="张三" Value="1" Selected></asp:ListItem>
                                    <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 8%; text-align: right;">
                            </td>
                            <td style="width: 26%; text-align: left;">
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
                        KeyFieldName="CustNo" AutoGenerateColumns="False" Settings-ShowFooter="true"
                        Width="100%" SettingsPager-AlwaysShowPager="true" OnRowDeleting="gridSearchResult_RowDeleting"
                        OnRowDeleted="gridSearchResult_RowDeleted">
                        <Columns>
                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False"
                                VisibleIndex="0" Width="20px">
                                <NewButton Visible="False" />
                                <EditButton Visible="False" />
                                <DeleteButton Visible="true" />
                                <CustomButtons>
                                    <dxwgv:GridViewCommandColumnCustomButton Text="编辑">
                                    </dxwgv:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户编号" FieldName="CustNo" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户名称" FieldName="CustName" VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="所在地区" FieldName="Area" VisibleIndex="3">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="所属板块" FieldName="Plate" VisibleIndex="4">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户地址" FieldName="Address" VisibleIndex="5">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="邮政编码" FieldName="PostCode" VisibleIndex="6">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="行业类型" FieldName="TradeType" VisibleIndex="7">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="代码/号码" FieldName="IDNO" VisibleIndex="8">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="第一联系人" FieldName="Contact" VisibleIndex="9">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="电话" FieldName="Tel" VisibleIndex="10">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="手机" FieldName="Mobile" VisibleIndex="11">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="传真" FieldName="Fax" VisibleIndex="12">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="电子邮件" FieldName="Email" VisibleIndex="13">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户经理" FieldName="Sales" VisibleIndex="14">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" Summary-Text="第{0}页,共{1}页" />
                        <Settings ShowGroupPanel="false" />
                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                    </dxwgv:ASPxGridView>
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
