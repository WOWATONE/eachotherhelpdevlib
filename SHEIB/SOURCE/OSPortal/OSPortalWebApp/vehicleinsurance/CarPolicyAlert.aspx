<%@ Page Title="车险保单批改" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="CarPolicyAlert.aspx.cs" Inherits="OSPortalWebApp.vehicleinsurance.AskPriceAlert" %>

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
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxUploadControl"
    TagPrefix="dxuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>车险保单批改</title>

    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});


            //if (canDisplay.toLowerCase() == "true") {
            //    //popupControl.ShowWindow();
            //    SetFormInputPopUpVisible();
            //}
            //else {
            //    //do nothing;
            //}

        });


        function btnAddCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("../otherinsurance/NewCustomer.aspx", self, myArguments);
        }

        function btnSelectCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("../otherinsurance/SelectCustomer.aspx", self, myArguments);
        }

        function imgPolicyProdTypeClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("../otherinsurance/PolicyProdType.aspx", self, myArguments);
        }

        function hlCarPolicyItemClick(params) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
            window.showModalDialog("CarPolicyItemInputRead.aspx", self, myArguments);
        }
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width: 100%">
        <tr>
            <td style="width: 100%;" colspan="2">
                <dxtc:ASPxPageControl ID="insuranceDetailTabPage" ClientInstanceName="insuranceDetailTabPage"
                    runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%">
                    <ClientSideEvents ActiveTabChanging="function(s, e) {}" TabClick="function(s, e) {}" />
                    <TabPages>
                        <dxtc:TabPage Text="基本信息">
                            <ContentCollection>
                                <dxw:ContentControl ID="ContentControl1" runat="server">
                                    <table style="width: 99%">
                                        <tr>
                                            <td style="width: 100%;">
                                                <asp:Panel ID="npbasicheader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                                                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                                        <div style="float: left; vertical-align: middle;">
                                                            <asp:ImageButton ID="img_npbasicheader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                                AlternateText="" />
                                                        </div>
                                                        <div style="float: left; margin-left: 5px;">
                                                            基本信息</div>
                                                        <div style="float: left; margin-left: 5px;">
                                                            <asp:Label ID="lbl_npbasicheader" runat="server">(展开)</asp:Label>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="npbasicdetail" runat="server" CssClass="collapsePanel" Height="0">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                原投保编号：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:Label runat="server" ID="TextBox3"></asp:Label>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                <dxe:ASPxButton AutoPostBack="False" runat="server" ID="btnOriginalPolicySelect"
                                                                    Text="选择保单" Style="margin: 0px;">
                                                                    <ClientSideEvents Click="function(s, e) {return false;}" />
                                                                </dxe:ASPxButton>
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxButton AutoPostBack="False" runat="server" ID="ASPxButton1" Text="查看保单"
                                                                    Style="margin: 0px;">
                                                                    <ClientSideEvents Click="function(s, e) {return false;}" />
                                                                </dxe:ASPxButton>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                            </td>
                                                            <td style="text-align: left;">
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                            </td>
                                                            <td style="text-align: left; color: Red">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                投保编号：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox runat="server" ID="TextBox5"></asp:TextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                保单编号：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox runat="server" ID="TextBox1"></asp:TextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                交强险保单号：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox runat="server" ID="TextBox4"></asp:TextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                询价单号：
                                                            </td>
                                                            <td style="text-align: left; color: Red">
                                                                <asp:Label runat="server" ID="TextBox6"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                保险公司：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxComboBox runat="server" ID="decbGridCarrierNo" AutoPostBack="false" ClientInstanceName="decbGridCarrierNo"
                                                                    DropDownButton-Enabled="true" DropDownStyle="DropDownList" Width="150px">
                                                                    <Items>
                                                                        <dxe:ListEditItem Text="中国平安" Value="1" />
                                                                        <dxe:ListEditItem Text="中国泰康" Value="2" />
                                                                        <dxe:ListEditItem Text="中国安联" Value="3" />
                                                                    </Items>
                                                                    <ClientSideEvents SelectedIndexChanged="" />
                                                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                分支结构：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:DropDownList runat="server" ID="ddlBranchId" Width="150px">
                                                                    <asp:ListItem Text="中国平安保险公司" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                业务员：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                投保人：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox ID="txtpeoplefrom" runat="server" Width="80px" Text="张三"></asp:TextBox>&nbsp;
                                                                <img runat="server" id="imgadduser" onclick="btnAddCustomerClick();" alt="" src="../images/add_user_icon.png"
                                                                    style="width: 20px; height: 20px; vertical-align: top;" />
                                                                <img runat="server" id="imgpeoplesearch" onclick="btnSelectCustomerClick();" alt=""
                                                                    src="../images/searchicon9.png" style="width: 20px; height: 20px; vertical-align: top;" />
                                                            </td>
                                                            <td style="text-align: right;">
                                                                被保险人：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox runat="server" ID="txtpeopleto" Width="150px" Text="张三"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                业务来源：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:DropDownList ID="DropDownList1" runat="server" Width="150px">
                                                                    <asp:ListItem Text="业务来源1" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="业务来源2" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                部门：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:DropDownList ID="DropDownList2" runat="server" Width="150px">
                                                                    <asp:ListItem Text="部门1" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="部门2" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="部门3" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                客户经理：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:DropDownList ID="DropDownList3" runat="server" Width="150px">
                                                                    <asp:ListItem Text="经理1" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="经理2" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                收款方式：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:DropDownList ID="DropDownList4" runat="server" Width="150px">
                                                                    <asp:ListItem Text="代收" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="直付" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                业务性质：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:DropDownList ID="DropDownList5" runat="server" Width="150px">
                                                                    <asp:ListItem Text="业务性质1" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="业务性质2" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                批改期限：
                                                            </td>
                                                            <td colspan="3">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <dxe:ASPxDateEdit ID="deStartDate" runat="server" Width="150px">
                                                                            </dxe:ASPxDateEdit>
                                                                        </td>
                                                                        <td>
                                                                            至
                                                                        </td>
                                                                        <td>
                                                                            <dxe:ASPxDateEdit ID="ASPxDateEdit2" runat="server" Width="150px">
                                                                            </dxe:ASPxDateEdit>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                录单人：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:DropDownList ID="DropDownList6" runat="server" Width="150px">
                                                                    <asp:ListItem Text="录单人" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="录单人" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                录单日期：
                                                            </td>
                                                            <td style="text-align: left; width: 95px">
                                                                <dxe:ASPxDateEdit ID="deCreateTime" runat="server" Width="150px">
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                特别约定：
                                                            </td>
                                                            <td style="text-align: left;" colspan="7">
                                                                <asp:TextBox ID="TextBox11" runat="server" Width="98%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <ajaxToolkit:CollapsiblePanelExtender ID="cpeBasic" runat="Server" TargetControlID="npbasicdetail"
                                                    ExpandControlID="npbasicheader" CollapseControlID="npbasicheader" Collapsed="false"
                                                    TextLabelID="lbl_npbasicheader" ImageControlID="img_npbasicheader" ExpandedText="(展开)"
                                                    CollapsedText="(隐藏)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                                                    SuppressPostBack="true" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%;">
                                                <asp:Panel ID="nppostilecontentHeader" runat="server" CssClass="collapsePanelHeader"
                                                    Height="25px">
                                                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                                        <div style="float: left; vertical-align: middle;">
                                                            <asp:ImageButton ID="img_nppostilecontentHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                                AlternateText="" />
                                                        </div>
                                                        <div style="float: left; margin-left: 5px;">
                                                            批改内容</div>
                                                        <div style="float: left; margin-left: 5px;">
                                                            <asp:Label ID="lbl_nppostilecontentHeader" runat="server">(展开)</asp:Label>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="nppostilecontentDetail" runat="server" CssClass="collapsePanel" Height="0">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="text-align: right;">
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <textarea runat="server" id="taModifyMemo" rows="3" cols="100"></textarea>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <ajaxToolkit:CollapsiblePanelExtender ID="cpepostilecontent" runat="Server" TargetControlID="nppostilecontentDetail"
                                                    ExpandControlID="nppostilecontentHeader" CollapseControlID="nppostilecontentHeader"
                                                    Collapsed="false" TextLabelID="lbl_nppostilecontentHeader" ImageControlID="img_nppostilecontentHeader"
                                                    ExpandedText="(展开)" CollapsedText="(隐藏)" ExpandedImage="~/images/collapse_blue.jpg"
                                                    CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%;">
                                                <asp:Panel ID="npCostSummaryHeader" runat="server" CssClass="collapsePanelHeader"
                                                    Height="25px">
                                                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                                        <div style="float: left; vertical-align: middle;">
                                                            <asp:ImageButton ID="img_npCostSummaryHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                                AlternateText="" />
                                                        </div>
                                                        <div style="float: left; margin-left: 5px;">
                                                            费用汇总</div>
                                                        <div style="float: left; margin-left: 5px;">
                                                            <asp:Label ID="lbl_npCostSummaryHeader" runat="server">(展开)</asp:Label>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="npCostSummaryDetail" runat="server" CssClass="collapsePanel" Height="0">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 14%; text-align: right;">
                                                                商业险保费：
                                                            </td>
                                                            <td style="width: 12%; text-align: left;">
                                                                <asp:TextBox ID="txtCiPremium" runat="server" Width="100px"></asp:TextBox>
                                                            </td>
                                                            <td style="width: 14%; text-align: right;">
                                                                交强险保费：
                                                            </td>
                                                            <td style="width: 12%; text-align: left;">
                                                                <asp:TextBox ID="txtAciPremium" runat="server" Width="100px"></asp:TextBox>
                                                            </td>
                                                            <td style="width: 10%; text-align: right;">
                                                                车船税：
                                                            </td>
                                                            <td style="width: 12%; text-align: left;">
                                                                <asp:TextBox ID="txtCstPremium" runat="server" Width="100px"></asp:TextBox>
                                                            </td>
                                                            <td style="width: 14%; text-align: right;">
                                                                保费合计：
                                                            </td>
                                                            <td style="width: 12%; text-align: left;">
                                                                <asp:TextBox ID="TextBox7" runat="server" Width="100px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                商业险经纪费率(%)：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox ID="TextBox9" runat="server" Width="100px"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                交强险经纪费率(%)：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox ID="TextBox10" runat="server" Width="100px"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right;">
                                                            </td>
                                                            <td style="text-align: left;">
                                                            </td>
                                                            <td style="text-align: right;">
                                                            </td>
                                                            <td style="text-align: left;">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                商业险经纪费：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox ID="txtCiProcess" runat="server" Width="100px"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                交强险经纪费：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox ID="txtAciProcess" runat="server" Width="100px"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right;">
                                                            </td>
                                                            <td style="text-align: left;">
                                                            </td>
                                                            <td style="text-align: right;">
                                                                经纪费合计：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox ID="TextBox12" runat="server" Width="100px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="Server"
                                                    TargetControlID="npCostSummaryDetail" ExpandControlID="npCostSummaryHeader" CollapseControlID="npCostSummaryHeader"
                                                    Collapsed="false" TextLabelID="lbl_npCostSummaryHeader" ImageControlID="img_npCostSummaryHeader"
                                                    ExpandedText="(展开)" CollapsedText="(隐藏)" ExpandedImage="~/images/collapse_blue.jpg"
                                                    CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
                                            </td>
                                        </tr>
                                        <tr>
                                    </table>
                                </dxw:ContentControl>
                            </ContentCollection>
                        </dxtc:TabPage>
                        <dxtc:TabPage Text="附件">
                            <ContentCollection>
                                <dxw:ContentControl ID="ContentControl2" runat="server">
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 100%; text-align: left;" colspan="2">
                                                附件列表
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 10%; text-align: right;">
                                                1
                                            </td>
                                            <td style="width: 90%; text-align: left;">
                                                file1.doc
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 10%; text-align: right;">
                                                2
                                            </td>
                                            <td style="width: 90%; text-align: left;">
                                                file2.doc
                                            </td>
                                        </tr>
                                    </table>
                                </dxw:ContentControl>
                            </ContentCollection>
                        </dxtc:TabPage>
                        <dxtc:TabPage Text="审核信息">
                            <ContentCollection>
                                <dxw:ContentControl ID="ContentControl3" runat="server">
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 10%; text-align: right;">
                                                审核人：
                                            </td>
                                            <td style="width: 20%; text-align: left;">
                                                <asp:TextBox ID="TextBox2" runat="server" Width="100px" Enabled="false"></asp:TextBox>
                                            </td>
                                            <td style="width: 10%; text-align: right;">
                                                审核日期：
                                            </td>
                                            <td style="width: 20%; text-align: left;">
                                                <dxe:ASPxDateEdit ID="ASPxDateEdit1" runat="server">
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right; vertical-align: top;">
                                                审核备注：
                                            </td>
                                            <td style="text-align: left;" colspan="3">
                                                <textarea runat="server" id="Textarea1" rows="5" cols="72"></textarea>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </dxw:ContentControl>
                            </ContentCollection>
                        </dxtc:TabPage>
                    </TabPages>
                </dxtc:ASPxPageControl>
                <table style="height: 5px; background-color: #E0EDFF; width: 100%; font-size: 2px;">
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="30px">
                    <table style="width: 100%">
                        <tr>
                            <td>
                            </td>
                            <td style="text-align: right;">
                                <asp:Button ID="btnadd" runat="server" Text="新增" CssClass="input_2" />&nbsp;&nbsp;
                                <asp:Button ID="btnsave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;
                                <asp:Button ID="btncancel" runat="server" Text="取消" CssClass="input_2" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
