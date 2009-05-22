<%@ Page Title="询价单录入" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="AskPriceInput.aspx.cs" Inherits="OSPortalWebApp.vehicleinsurance.AskPriceInput" %>

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
    <title>询价单录入</title>

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

        function hlCarPolicyItemClick(params) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=1010px;dialogHeight=680px;center=yes;help=no";
            window.showModalDialog("CarPolicyItemInput.aspx", self, myArguments);
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
                                                            <td style="width: 10%; text-align: right;">
                                                                询价单号：
                                                            </td>
                                                            <td style="width: 20%; text-align: left;">
                                                                <asp:TextBox ID="txtSN" runat="server" Width="150px"></asp:TextBox>
                                                            </td>
                                                            <td style="width: 11%; text-align: right;">
                                                                部门：
                                                            </td>
                                                            <td style="width: 22%; text-align: left;">
                                                                <asp:DropDownList ID="ddlDeptId" runat="server"  Width="150px">
                                                                    <asp:ListItem Text="部门1" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="部门2" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="部门3" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="width: 11%; text-align: right;">
                                                                客户经理：
                                                            </td>
                                                            <td style="width: 22%; text-align: left;">
                                                                <asp:DropDownList ID="ddlcustomermanager" runat="server"  Width="150px">
                                                                    <asp:ListItem Text="经理1" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="经理2" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                保险公司：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxComboBox runat="server" ID="decbGridCarrierNo" AutoPostBack="false" ClientInstanceName="decbGridCarrierNo"
                                                                    DropDownButton-Enabled="true" DropDownStyle="DropDownList"  Width="150px">
                                                                    <Items>
                                                                        <dxe:ListEditItem Text="中国平安" Value="1" />
                                                                        <dxe:ListEditItem Text="中国泰康" Value="2" />
                                                                        <dxe:ListEditItem Text="中国安联" Value="3" />
                                                                    </Items>
                                                                    <ClientSideEvents SelectedIndexChanged="" />
                                                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                分支机构：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxComboBox runat="server" ID="decbGridBranchName" AutoPostBack="false" ClientInstanceName="decbGridBranchName"
                                                                    DropDownButton-Enabled="true" DropDownStyle="DropDownList"  Width="150px">
                                                                    <Items>
                                                                        <dxe:ListEditItem Text="平安分支1" Value="1" />
                                                                        <dxe:ListEditItem Text="泰康分支1" Value="2" />
                                                                        <dxe:ListEditItem Text="安联分支1" Value="3" />
                                                                    </Items>
                                                                    <ClientSideEvents SelectedIndexChanged="" />
                                                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td style="width: 10%; text-align: right;">
                                                                业务员：
                                                            </td>
                                                            <td style="width: 20%; text-align: left;">
                                                                <asp:TextBox ID="TextBox1" runat="server"  Width="150px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>                                                           
                                                            <td style="text-align: right;">
                                                                投保人：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox ID="txtpeoplefrom" runat="server" Width="100px" Text="张三"></asp:TextBox>&nbsp;
                                                                <img runat="server" id="imgadduser" onclick="btnAddCustomerClick();" alt="" src="../images/add_user_icon.png"
                                                                    style="width: 20px; height: 20px; vertical-align: top;" />
                                                                <img runat="server" id="imgpeoplesearch" onclick="btnSelectCustomerClick();" alt=""
                                                                    src="../images/searchicon9.png" style="width: 20px; height: 20px; vertical-align: top;" />
                                                            </td>
                                                            <td style="text-align: right;">
                                                            </td>
                                                            <td style="text-align: left;">
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>                                                        
                                                        <tr>
                                                            <td style="width: 11%; text-align: right;">
                                                                业务来源：
                                                            </td>
                                                            <td style="width: 22%; text-align: left;">
                                                                <asp:DropDownList ID="ddlFrom" runat="server"  Width="150px">
                                                                    <asp:ListItem Text="业务来源1" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="业务来源2" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                业务性质：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:DropDownList ID="ddlKind" runat="server"  Width="150px">
                                                                    <asp:ListItem Text="业务性质1" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="业务性质2" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                收款方式：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:DropDownList ID="ddlGatheringType" runat="server"  Width="150px">
                                                                    <asp:ListItem Text="收款方式1" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="收款方式2" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                录单人：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox ID="txtCreatePerson" runat="server" Width="150px" Enabled="false"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                录单日期：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox ID="txtCreateTime" runat="server" Width="150px" Enabled="false"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td>
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
                                                <asp:Panel ID="npGridPolicyItemHeader" runat="server" CssClass="collapsePanelHeader"
                                                    Height="25px">
                                                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                                        <div style="float: left; vertical-align: middle;">
                                                            <asp:ImageButton ID="img_npGridPolicyItem" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                                                AlternateText="" />
                                                        </div>
                                                        <div style="float: left; margin-left: 5px;">
                                                            车险项目</div>
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
                                                                    KeyFieldName="CarPolicyID" Width="100%" AutoGenerateColumns="False" OnRowInserting="gridPolicyItem_RowInserting"
                                                                    OnRowUpdating="gridPolicyItem_RowUpdating" OnRowUpdated="gridPolicyItem_RowUpdated"
                                                                    OnRowInserted="gridPolicyItem_RowInserted" OnRowDeleting="gridPolicyItem_RowDeleting"
                                                                    OnRowDeleted="gridPolicyItem_RowDeleted">
                                                                    <%-- BeginRegion Columns --%>
                                                                    <Columns>
                                                                        <dxwgv:GridViewDataColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left"
                                                                            Width="55" HeaderStyle-Wrap="False" Settings-AllowDragDrop="False">
                                                                            <Settings AllowDragDrop="False"></Settings>
                                                                            <DataItemTemplate>
                                                                                <dxe:ASPxHyperLink runat="server" ID="deGridPolicyItemhl_New" Text="新增" NavigateUrl="#">
                                                                                    <ClientSideEvents Click="hlCarPolicyItemClick" />
                                                                                </dxe:ASPxHyperLink>
                                                                                <dxe:ASPxHyperLink runat="server" ID="deGridPolicyItemhl_Update" Text="编辑" NavigateUrl="#">
                                                                                    <ClientSideEvents Click="hlCarPolicyItemClick" />
                                                                                </dxe:ASPxHyperLink>
                                                                            </DataItemTemplate>
                                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                                            <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                            </CellStyle>
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left"
                                                                            Width="25" HeaderStyle-Wrap="False" AllowDragDrop="false">
                                                                            <NewButton Visible="False" />
                                                                            <EditButton Visible="False" />
                                                                            <DeleteButton Visible="true" />
                                                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                                                            <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                            </CellStyle>
                                                                        </dxwgv:GridViewCommandColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="CarNo" Caption="投保单号" CellStyle-Wrap="False">
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="CarNo" Caption="车牌号" CellStyle-Wrap="False">
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="CiPremium" Caption="商业险保费" CellStyle-Wrap="False">
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="CiProcessRate" Caption="商业险经纪费率(%)" CellStyle-Wrap="False">
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="CiProcess" Caption="商业险经纪费" CellStyle-Wrap="False">
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="AciPremium" Caption="交强险保费" CellStyle-Wrap="False">
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="AciProcessRate" Caption="交强险经纪费率(%)" CellStyle-Wrap="False">
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="AciProcess" Caption="交强险经纪费" CellStyle-Wrap="False">
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="CstPremium" Caption="车船税" CellStyle-Wrap="False">
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dxwgv:GridViewDataColumn>
                                                                    </Columns>
                                                                    <TotalSummary>
                                                                        <dxwgv:ASPxSummaryItem FieldName="CarNo" SummaryType="Count" DisplayFormat="车辆数目:#" />
                                                                        <dxwgv:ASPxSummaryItem FieldName="CiPremium" SummaryType="Sum" DisplayFormat="c" />
                                                                        <dxwgv:ASPxSummaryItem FieldName="CiProcess" SummaryType="Sum" DisplayFormat="c" />
                                                                        <dxwgv:ASPxSummaryItem FieldName="AciPremium" SummaryType="Sum" DisplayFormat="c" />
                                                                        <dxwgv:ASPxSummaryItem FieldName="AciProcess" SummaryType="Sum" DisplayFormat="c" />
                                                                        <dxwgv:ASPxSummaryItem FieldName="CstPremium" SummaryType="Sum" DisplayFormat="c" />
                                                                        <dxwgv:ASPxSummaryItem FieldName="CiProcessRate" SummaryType="Average" DisplayFormat="n" />
                                                                        <dxwgv:ASPxSummaryItem FieldName="AciProcessRate" SummaryType="Average" DisplayFormat="n" />
                                                                    </TotalSummary>
                                                                    <%-- EndRegion --%>
                                                                    <SettingsPager Mode="ShowAllRecords" />
                                                                    <Settings ShowGroupPanel="false" ShowFooter="True" />
                                                                    <SettingsBehavior />
                                                                    <Templates>
                                                                        <EditForm>
                                                                            <div style="padding: 4px 4px 3px 4px">
                                                                                <table style="width: 90%;" runat="server" id="tblgridPolicyItemEditorTemplate">
                                                                                    <tr>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            车牌号:
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <asp:TextBox runat="server" ID="txtGridPolicyCarNo" Text='<%# Eval("CarNo") %>' Enabled="false"></asp:TextBox>
                                                                                        </td>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            商业险保费:
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <asp:TextBox runat="server" ID="txtGridPolicyCiPremium" Text='<%# Eval("CiPremium") %>'></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            商业险经纪费率:
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <asp:TextBox runat="server" ID="txtGridPolicyCiProcessRate" Text='<%# Eval("CiProcessRate") %>'></asp:TextBox>
                                                                                        </td>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            商业险经纪费(%):
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <asp:TextBox runat="server" ID="txtGridPolicyCiProcess" Text='<%# Eval("CiProcess") %>'></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            交强险保费:
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <asp:TextBox runat="server" ID="txtGridPolicyAciPremium" Text='<%# Eval("AciPremium") %>'></asp:TextBox>
                                                                                        </td>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            交强险经纪费率(%):
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <asp:TextBox runat="server" ID="txtGridPolicyAciProcessRate" Text='<%# Eval("AciProcessRate") %>'></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            交强险经纪费:
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <asp:TextBox runat="server" ID="txtGridPolicyAciProcess" Text='<%# Eval("AciProcess") %>'></asp:TextBox>
                                                                                        </td>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            车船税:
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <asp:TextBox runat="server" ID="txtGridPolicyCstPremium" Text='<%# Eval("CstPremium") %>'></asp:TextBox>
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
                                    </table>
                                </dxw:ContentControl>
                            </ContentCollection>
                        </dxtc:TabPage>
                        <dxtc:TabPage Text="附件">
                            <ContentCollection>
                                <dxw:ContentControl ID="ContentControl2" runat="server">
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 100%; text-align: left;">
                                                附件
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; text-align: left;">
                                                <dxuc:ASPxUploadControl ID="filesUploadControl" runat="server" ShowAddRemoveButtons="True"
                                                    Width="400px" ShowUploadButton="True" AddUploadButtonsHorizontalPosition="Center"
                                                    ShowProgressPanel="True" ClientInstanceName="UploadControl" OnFileUploadComplete="UploadControl_FileUploadComplete"
                                                    FileInputCount="5" RemoveButtonSpacing="8px" AddUploadButtonsSpacing="10">
                                                    <ValidationSettings MaxFileSize="4000000" AllowedContentTypes="*">
                                                    </ValidationSettings>
                                                    <ClientSideEvents FileUploadComplete="function(s, e) { FileUploaded(s, e) }" FileUploadStart="function(s, e) { FileUploadStart(); }" />
                                                    <RemoveButton Text="" Image-Url="../images/file_remove.gif" Image-Height="25px" Image-Width="25px"
                                                        ImagePosition="Left">
                                                        <Image Height="25px" Width="25px" Url="../images/file_remove.gif"></Image>
                                                    </RemoveButton>
                                                    <AddButton Text="" Image-Url="../images/file_add.gif" Image-Height="25px" Image-Width="25px"
                                                        ImagePosition="Left">
                                                        <Image Height="25px" Width="25px" Url="../images/file_add.gif"></Image>
                                                    </AddButton>
                                                    <UploadButton Text="" Image-Url="../images/file_upload.gif" Image-Height="25px" Image-Width="25px"
                                                        ImagePosition="Left">
                                                        <Image Height="25px" Width="25px" Url="../images/file_upload.gif"></Image>
                                                    </UploadButton>
                                                </dxuc:ASPxUploadControl>
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
                <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="25px">
                    <table style="width: 100%">
                        <tr>
                            <td style="text-align: right;">
                                <asp:Button ID="btnadd" runat="server" Text="新增" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnsave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button1" runat="server" Text="提交审核" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btncancel" runat="server" Text="取消" CssClass="input_2" />
                            </td>
                            <td style="width: 20px; text-align: left;">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
