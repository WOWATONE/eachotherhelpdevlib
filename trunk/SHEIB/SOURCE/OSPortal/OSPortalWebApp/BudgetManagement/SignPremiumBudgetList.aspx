<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true"
    Theme="Aqua" CodeBehind="SignPremiumBudgetList.aspx.cs" Inherits="OSPortalWebApp.BudgetManagement.SignPremiumBudgetList"
    Title="" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>签约预算清单列表</title>

    <script type="text/javascript">
        function btnCreateClick() {
	        var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("SignPremiumBudget.aspx", self, myArguments);
        } 
        
        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("SignPremiumBudget.aspx", self, myArguments);
        }
        
        function imgPolicyProdTypeClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("../otherinsurance/PolicyProdType.aspx", self, myArguments);
        }
        
        function imgCustNoClick() {
	        var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
	        window.showModalDialog("../CustomerRelation/SelectCustomerNo.aspx", self, myArguments);
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
                            <td style="width: 10%; text-align: right;">
                                客户经理：
                            </td>
                            <td style="width: 20%; text-align: left;">
                                <asp:DropDownList runat="server" ID="ddlSalesID" Width="200px">
                                    <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                    <asp:ListItem Text="张三" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 10%; text-align: right;">
                                客户名称：
                            </td>
                            <td style="width: 20%; text-align: left;">
                                <asp:TextBox ID="txtCustomerID" runat="server" Width="200px"></asp:TextBox>
                                <img runat="server" id="imgCustNoSearch" alt="" src="../images/searchicon9.png" style="width:20px; height:20px; vertical-align:top;" onclick="javascript:imgCustNoClick();" /> 
                            </td>
                            <td style="text-align: left">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10%; text-align: right;">
                                险种：
                            </td>
                            <td style="width: 20%; text-align: left;">
                                <asp:TextBox ID="txtProdTypeID" runat="server" Width="160px"></asp:TextBox>
                                <img runat="server" id="imgpeoplesearch" alt="" src="../images/searchicon9.png" style="width: 20px;
                                    height: 20px; vertical-align: top;" onclick="javascript:imgPolicyProdTypeClick();" />
                            </td>
                            <td style="width: 10%; text-align: right;">
                                业务性质：
                            </td>
                            <td style="width: 20%; text-align: left;">
                                <asp:DropDownList runat="server" ID="ddlOperationType" Width="200px">
                                    <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                    <asp:ListItem Text="新增" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="续保" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: left">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10%; text-align: right;">
                                收入类型：
                            </td>
                            <td style="width: 20%; text-align: left;">
                                <asp:DropDownList runat="server" ID="ddlIncomeType" Width="200px">
                                    <asp:ListItem Text="(全部)" Value=""></asp:ListItem>
                                    <asp:ListItem Text="保费" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="佣金" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 10%; text-align: right;">
                                年月：
                            </td>
                            <td style="width: 20%; text-align: left;">
                                <asp:TextBox ID="txtNY" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="text-align: left">
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
                        KeyFieldName="SignPremiumBudgetID" AutoGenerateColumns="False" Settings-ShowFooter="true"
                        Width="100%" SettingsPager-AlwaysShowPager="true" OnRowDeleting="gridSearchResult_RowDeleting"
                        OnRowDeleted="gridSearchResult_RowDeleted">
                        <Columns>
                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" VisibleIndex="0"
                                Width="20px">
                                <DeleteButton Visible="true" />
                                <CustomButtons>
                                    <dxwgv:GridViewCommandColumnCustomButton Text="编辑">
                                    </dxwgv:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn Caption="SignPremiumBudgetID" 
                                FieldName="SignPremiumBudgetID" Visible="False" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户经理" FieldName="Sales" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="客户名称" FieldName="CustName" VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="险种" FieldName="ProdType" VisibleIndex="3">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="业务性质" FieldName="OperationType" VisibleIndex="4">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="年月" FieldName="YN" VisibleIndex="5">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="保费预算" FieldName="PremiumBudget" VisibleIndex="6">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="佣金预算" FieldName="ProcessBudget" VisibleIndex="7">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" 
                            Summary-Text="第{0}页,共{1}页" >
                            <Summary Text="第{0}页,共{1}页" />
                        </SettingsPager>
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
