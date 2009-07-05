<%@ Page Title="车辆信息录入" Theme="Aqua" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master"
    AutoEventWireup="true" CodeBehind="CarPolicyItemInput.aspx.cs" Inherits="BrokerWebApp.vehicleinsurance.CarPolicyItemInput" %>

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
    <title>车辆信息录入</title>

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
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width: 100%">
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="Panel1" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            基本信息</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="Label1" runat="server">(展开)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
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
                                <asp:DropDownList ID="ddlFrom" runat="server" Width="150px">
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
                                <asp:DropDownList ID="ddlDeptId" runat="server" Width="150px">
                                    <asp:ListItem Text="部门1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="部门2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="部门3" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: right;">
                                客户经理：
                            </td>
                            <td style="text-align: left;">
                                <asp:DropDownList ID="ddlcustomermanager" runat="server" Width="150px">
                                    <asp:ListItem Text="经理1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="经理2" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: right;">
                                收款方式：
                            </td>
                            <td style="text-align: left;">
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="150px">
                                    <asp:ListItem Text="代收" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="直付" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: right;">
                                业务性质：
                            </td>
                            <td style="text-align: left;">
                                <asp:DropDownList ID="ddlKind" runat="server" Width="150px">
                                    <asp:ListItem Text="业务性质1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="业务性质2" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                保险期限：
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
                                            <dxe:ASPxDateEdit ID="ASPxDateEdit1" runat="server" Width="150px">
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="text-align: right;">
                                录单人：
                            </td>
                            <td style="text-align: left;">
                                <asp:DropDownList ID="DropDownList2" runat="server" Width="150px">
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
                <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
                    TargetControlID="Panel2" ExpandControlID="Panel1" CollapseControlID="Panel1"
                    Collapsed="false" TextLabelID="lbl_npCostSummaryHeader" ImageControlID="img_npCostSummaryHeader"
                    ExpandedText="(展开)" CollapsedText="(隐藏)" ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npbasicheader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npbasicheader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            车辆信息</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npbasicheader" runat="server">(展开)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npbasicdetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="white-space: nowrap; text-align: right;">
                                车牌号:
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox runat="server" ID="txtGridPolicyCarInfoCarNo" Text='<%# Eval("CarNo") %>'
                                    Enabled="false"></asp:TextBox>
                            </td>
                            <td style="white-space: nowrap; text-align: right;">
                                车架号:
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox runat="server" ID="txtGridPolicyCarInfoCarcaseNo" Text='<%# Eval("CarcaseNo") %>'></asp:TextBox>
                            </td>
                            <td style="white-space: nowrap; text-align: right;">
                                厂牌型号:
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox runat="server" ID="txtGridPolicyCarInfoCarModel" Text='<%# Eval("CarModel") %>'></asp:TextBox>
                            </td>
                            <td style="white-space: nowrap; text-align: right;">
                                发动机号:
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox runat="server" ID="txtGridPolicyCarInfoEngineNo" Text='<%# Eval("EngineNo") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap; text-align: right;">
                                使用性质:
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox runat="server" ID="txtGridPolicyCarInfoCharacter" Text='<%# Eval("Character") %>'></asp:TextBox>
                            </td>
                            <td style="white-space: nowrap; text-align: right;">
                                核定载客/质量:
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox runat="server" ID="txtGridPolicyCarInfoCapacity" Text='<%# Eval("Capacity") %>'></asp:TextBox>
                            </td>
                            <td style="white-space: nowrap; text-align: right;">
                                初登日期:
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox runat="server" ID="txtGridPolicyCarInfoRegisterDate" Text='<%# Eval("RegisterDate") %>'></asp:TextBox>
                            </td>
                            <td style="white-space: nowrap; text-align: right;">
                                车辆价值:
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox runat="server" ID="txtGridPolicyCarInfoCarValue" Text='<%# Eval("CarValue") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap; text-align: right;">
                                车主:
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox runat="server" ID="TextBox10" Text='<%# Eval("Character") %>'></asp:TextBox>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td style="text-align:right"><asp:Button ID="Button2" runat="server" Text="保存" CssClass="input_2" /></td>
                            
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
                <asp:Panel ID="npGridPolicyItemHeader" runat="server" CssClass="collapsePanelHeader"
                    Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npGridPolicyItem" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            商业险项目</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npGridPolicyItem" runat="server">(展开)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npGridPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server"
                                    KeyFieldName="CarPolicyItemID" Width="100%" AutoGenerateColumns="False" OnRowInserting="gridPolicyItem_RowInserting"
                                    OnRowUpdating="gridPolicyItem_RowUpdating" OnRowUpdated="gridPolicyItem_RowUpdated"
                                    OnRowInserted="gridPolicyItem_RowInserted" OnRowDeleting="gridPolicyItem_RowDeleting"
                                    OnRowDeleted="gridPolicyItem_RowDeleted">
                                    <%-- BeginRegion Columns --%>
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left"
                                            Width="81" HeaderStyle-Wrap="False" AllowDragDrop="false">
                                            <NewButton Visible="true" />
                                            <EditButton Visible="true" />
                                            <DeleteButton Visible="true" />
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CarPolicyItemName" Caption="保险险种" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Coverage" Caption="保险金额 " CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="Premium" Caption="保费" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                    </Columns>
                                    <TotalSummary>
                                        <dxwgv:ASPxSummaryItem FieldName="CarPolicyItemName" SummaryType="Count" DisplayFormat="数量:#" />
                                        <dxwgv:ASPxSummaryItem FieldName="Coverage" SummaryType="Sum" DisplayFormat="c" />
                                        <dxwgv:ASPxSummaryItem FieldName="Premium" SummaryType="Sum" DisplayFormat="c" />
                                    </TotalSummary>
                                    <%-- EndRegion --%>
                                    <SettingsPager Mode="ShowAllRecords" />
                                    <Settings ShowGroupPanel="false" ShowFooter="true" />
                                    <SettingsBehavior />
                                    <Templates>
                                        <EditForm>
                                            <div style="padding: 4px 4px 3px 4px">
                                                <table style="width: 90%;" runat="server" id="tblgridPolicyItemEditorTemplate">
                                                    <tr>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            险种:
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <dxe:ASPxComboBox runat="server" ID="decbPolicyCarPolicyItemID" AutoPostBack="false"
                                                                ClientInstanceName="decbPolicyCarPolicyItemID" DropDownButton-Enabled="true"
                                                                DropDownStyle="DropDownList" Width="100px">
                                                                <Items>
                                                                    <dxe:ListEditItem Text="编号三" Value="1" />
                                                                    <dxe:ListEditItem Text="编号四" Value="2" />
                                                                    <dxe:ListEditItem Text="编号五" Value="3" />
                                                                </Items>
                                                                <ClientSideEvents SelectedIndexChanged="" />
                                                            </dxe:ASPxComboBox>
                                                        </td>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            保险金额:
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <asp:TextBox runat="server" ID="txtGridPolicyCoverage" Text='<%# Eval("Coverage") %>'></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            保费:
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <asp:TextBox runat="server" ID="txtGridPolicyPremium" Text='<%# Eval("Premium") %>'></asp:TextBox>
                                                        </td>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            备注:
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <asp:TextBox runat="server" ID="txtGridPolicyMemo" Text='<%# Eval("Memo") %>'></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                    runat="server">
                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                    runat="server">
                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                            </div>
                                        </EditForm>
                                    </Templates>
                                </dxwgv:ASPxGridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeGridPolicyItem" runat="Server" TargetControlID="npGridPolicyItemDetail"
                    ExpandControlID="npGridPolicyItemHeader" CollapseControlID="npGridPolicyItemHeader"
                    Collapsed="false" TextLabelID="lbl_npGridPolicyItem" ImageControlID="img_npGridPolicyItem"
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
                                <asp:TextBox ID="TextBox2" runat="server" Width="100px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                商业险经纪费率(%)：
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox ID="TextBox7" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td style="text-align: right;">
                                交强险经纪费率(%)：
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox ID="TextBox9" runat="server" Width="100px"></asp:TextBox>
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
                                <asp:TextBox ID="TextBox3" runat="server" Width="100px"></asp:TextBox>
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
    </table>
    <table style="height: 5px; background-color: #E0EDFF; width: 100%; font-size: 2px;">
        <tr>
            <td>
            </td>
        </tr>
    </table>
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="25px">
        <table style="width: 100%">
            <tr>
                <td style="text-align: right;">
                    <asp:Button ID="btnadd" runat="server" Text="新增" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnsave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="审核" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" Text="反审核" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btncancel" runat="server" Text="取消" CssClass="input_2" />
                </td>
                <td style="width: 20px; text-align: left;">
                    &nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
