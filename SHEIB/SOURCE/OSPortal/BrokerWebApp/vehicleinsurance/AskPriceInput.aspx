<%@ Page Title="询价单录入" Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="AskPriceInput.aspx.cs" Inherits="BrokerWebApp.vehicleinsurance.AskPriceInput" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>

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

                <dxtc:ASPxPageControl ID="insuranceDetailTabPage" ClientInstanceName="insuranceDetailTabPage"
                    runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%" AutoPostBack="false" EnableCallBacks="true">
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
                                                            <td style="width: 80px; text-align: right;">
                                                                询价单号：
                                                            </td>
                                                            <td style="width: 150px; text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtAskPriceID" ClientInstanceName="dxetxtAskPriceID" runat="server" Width="140px"></dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="width: 80px; text-align: right;">
                                                                部门：
                                                            </td>
                                                            <td style="width: 150px; text-align: left;">
                                                                <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server" Width="140px" DropDownStyle="DropDownList">
									                                <Items>
										                                <dxe:ListEditItem Text="(全部)" Value="" />
										                                <dxe:ListEditItem Text="业务部" Value="1" />
									                                </Items>
								                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td style="width: 80px; text-align: right;">
                                                                客户经理：
                                                            </td>
                                                            <td style="width: 150px; text-align: left;">
                                                                <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server" Width="140px" DropDownStyle="DropDownList">
									                                <Items>
										                                <dxe:ListEditItem Text="(全部)" Value="" />
									                                </Items>
								                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                保险公司：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxComboBox ID="dxeddlCarrierId" ClientInstanceName="dxeddlCarrierId" runat="server" Width="140px" DropDownStyle="DropDownList">
									                                <Items>
										                                <dxe:ListEditItem Text="中国平安保险公司" Value="" />
									                                </Items>
								                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                分支机构：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxComboBox ID="dxeddlBranchId" ClientInstanceName="dxeddlBranchId" runat="server" Width="140px" DropDownStyle="DropDownList">
									                                <Items>
										                                <dxe:ListEditItem Text="中国平安保险公司" Value="" />
									                                </Items>
								                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                业务员：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtSalesID" ClientInstanceName="dxetxtSalesID" runat="server" Width="140px"></dxe:ASPxTextBox>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>                                                           
                                                            <td style="text-align: right;">
                                                                投保人：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <table style="margin-left:-3px;">
                                                                    <tr>
                                                                            <td style="text-align: right;">
                                                                                <dxe:ASPxTextBox ID="dxetxtCustomer" ClientInstanceName="dxetxtCustomer" runat="server" Width="125px"></dxe:ASPxTextBox>
                                                                                <input type="hidden" id="cusid" runat="server" />
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <img runat="server" id="imgNewCustomer" onclick="imgNewCustomerClick();" alt="" src="../images/add_user_icon.png"
                                                                                    style="width: 20px; height: 20px; vertical-align: top;" />
                                                                                <img runat="server" id="imgSelectCustomer" onclick="imgSelectCustomerClick();" alt=""
                                                                                    src="../images/searchicon9.png" style="width: 20px; height: 20px; vertical-align: top;" />
                                                                            </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                业务来源：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxComboBox ID="dxeddlSourceTypeID" ClientInstanceName="dxeddlSourceTypeID" runat="server" Width="140px" DropDownStyle="DropDownList">
									                                <Items>
										                                <dxe:ListEditItem Text="来源1" Value="" />
									                                </Items>
								                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                业务性质：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxComboBox ID="dxeddlFlagReinsure" ClientInstanceName="dxeddlFlagReinsure" runat="server" Width="140px" DropDownStyle="DropDownList">
									                                <Items>
										                                <dxe:ListEditItem Text="新增" Value="1" />
										                                <dxe:ListEditItem Text="再保" Value="2" />
									                                </Items>
								                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td></td>
                                                        </tr>                                                        
                                                        <tr>                                                            
                                                            <td style="text-align: right;">
                                                                收款方式：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:DropDownList ID="ddlGatheringType" runat="server"  Width="150px">
                                                                    <asp:ListItem Text="收款方式1" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="收款方式2" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                录单人：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtCreatePerson" ClientInstanceName="dxetxtCreatePerson" runat="server" Width="140px"></dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                录单日期：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxDateEdit ID="dxeCreateTime" runat="server" Width="140px"></dxe:ASPxDateEdit>
                                                            </td>
                                                            <td></td>
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
                                                                    KeyFieldName="PolicyID" Width="100%" AutoGenerateColumns="False" 
                                                                    OnRowInserting="gridPolicyItem_RowInserting"
                                                                    OnRowUpdating="gridPolicyItem_RowUpdating" 
                                                                    OnRowUpdated="gridPolicyItem_RowUpdated"
                                                                    OnRowInserted="gridPolicyItem_RowInserted" 
                                                                    OnRowDeleting="gridPolicyItem_RowDeleting"
                                                                    OnRowDeleted="gridPolicyItem_RowDeleted">
                                                                    <%-- BeginRegion Columns --%>
                                                                    <Columns>                                                                        
                                                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="center"
                                                                            HeaderStyle-Wrap="False" AllowDragDrop="false">
                                                                            <NewButton Visible="true" />
                                                                            <EditButton Visible="true" />
                                                                            <DeleteButton Visible="true" />
                                                                        </dxwgv:GridViewCommandColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="投保单号" CellStyle-Wrap="False">                                                                            
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="CarNo" Caption="车牌号" CellStyle-Wrap="False">                                                                            
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="CiPremium" Caption="商业险保费" CellStyle-Wrap="False">                                                                            
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="CiProcessRate" Caption="商业险经纪费率(%)" CellStyle-Wrap="False">                                                                            
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="CiProcess" Caption="商业险经纪费" CellStyle-Wrap="False">                                                                            
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="AciPremium" Caption="交强险保费" CellStyle-Wrap="False">                                                                            
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="AciProcessRate" Caption="交强险经纪费率(%)" CellStyle-Wrap="False">                                                                            
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="AciProcess" Caption="交强险经纪费" CellStyle-Wrap="False">
                                                                        </dxwgv:GridViewDataColumn>
                                                                        <dxwgv:GridViewDataColumn FieldName="CstPremium" Caption="车船税" CellStyle-Wrap="False">
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
                                                                                            <dxe:ASPxTextBox ID="dxetxtGridPolicyItemCarNo" ClientInstanceName="dxetxtGridPolicyItemCarNo" runat="server" Width="120px">
                                                                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="必需项">
                                                                                                    <RequiredField IsRequired="true" />
                                                                                                </ValidationSettings>
                                                                                            </dxe:ASPxTextBox>
                                                                                        </td>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            商业险保费:
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <dxe:ASPxTextBox ID="dxetxtGridPolicyItemCiPremium" ClientInstanceName="dxetxtGridPolicyItemCiPremium" runat="server" Width="120px">
                                                                                                <ValidationSettings>
                                                                                                    <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                                </ValidationSettings>
                                                                                            </dxe:ASPxTextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            商业险经纪费率(%):
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <dxe:ASPxTextBox ID="dxetxtGridPolicyItemCiProcessRate" ClientInstanceName="dxetxtGridPolicyItemCiProcessRate" runat="server" Width="120px">
                                                                                                <ValidationSettings>
                                                                                                    <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                                </ValidationSettings>
                                                                                            </dxe:ASPxTextBox>
                                                                                        </td>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            商业险经纪费:
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <dxe:ASPxTextBox ID="dxetxtGridPolicyItemCiProcess" ClientInstanceName="dxetxtGridPolicyItemCiProcess" runat="server" Width="120px">
                                                                                                <ValidationSettings>
                                                                                                    <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                                </ValidationSettings>
                                                                                            </dxe:ASPxTextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            交强险保费:
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <dxe:ASPxTextBox ID="dxetxtGridPolicyItemAciPremium" ClientInstanceName="dxetxtGridPolicyItemAciPremium" runat="server" Width="120px">
                                                                                                <ValidationSettings>
                                                                                                    <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                                </ValidationSettings>
                                                                                            </dxe:ASPxTextBox>
                                                                                        </td>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            交强险经纪费率(%):
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <dxe:ASPxTextBox ID="dxetxtGridPolicyItemAciProcessRate" ClientInstanceName="dxetxtGridPolicyItemAciProcessRate" runat="server" Width="120px">
                                                                                                <ValidationSettings>
                                                                                                    <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                                </ValidationSettings>
                                                                                            </dxe:ASPxTextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            交强险经纪费:
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <dxe:ASPxTextBox ID="dxetxtGridPolicyItemAciProcess" ClientInstanceName="dxetxtGridPolicyItemAciProcess" runat="server" Width="120px">
                                                                                                <ValidationSettings>
                                                                                                    <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                                </ValidationSettings>
                                                                                            </dxe:ASPxTextBox>
                                                                                        </td>
                                                                                        <td style="white-space: nowrap; text-align: right;">
                                                                                            车船税:
                                                                                        </td>
                                                                                        <td style="text-align: left;">
                                                                                            <dxe:ASPxTextBox ID="dxetxtGridPolicyItemCstPremium" ClientInstanceName="dxetxtGridPolicyItemCstPremium" runat="server" Width="120px">
                                                                                                <ValidationSettings>
                                                                                                    <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                                                </ValidationSettings>
                                                                                            </dxe:ASPxTextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </div>
                                                                            <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                                                <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server">
                                                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server">
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
                                                上传附件
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; text-align: left;">
                                                <dxuc:ASPxUploadControl ID="filesUploadControl" ClientInstanceName="filesUploadControl" 
                                                    runat="server" ShowAddRemoveButtons="True"
                                                    Width="400px" ShowUploadButton="True" 
                                                    AddUploadButtonsHorizontalPosition="Center"
                                                    ShowProgressPanel="True" 
                                                    FileInputCount="5" RemoveButtonSpacing="8px" 
                                                    AddUploadButtonsSpacing="10" FileUploadMode="OnPageLoad"
                                                    OnPreRender="UploadControl_PreRender" 
                                                    OnFileUploadComplete="UploadControl_FileUploadComplete"
                                                    >
                                                    <ValidationSettings MaxFileSize="4000000" 
                                                    FileDoesNotExistErrorText="文件不存在" 
                                                    GeneralErrorText="上传发生错误" 
                                                    MaxFileSizeErrorText="文件太大" 
                                                    NotAllowedContentTypeErrorText="不允许上传此类型文件">
                                                    </ValidationSettings>
                                                    <ClientSideEvents 
                                                        FilesUploadComplete="function(s, e) { FileUploaded(s, e) }" 
                                                        FileUploadStart="function(s, e) { FileUploadStart(s, e); }"  />
                                                    <RemoveButton Text="" Image-Url="../images/file_remove.gif" Image-Height="25px" Image-Width="25px"
                                                        ImagePosition="Left">
                                                    </RemoveButton>
                                                    <AddButton Text="" Image-Url="../images/file_add.gif" Image-Height="25px" Image-Width="25px"
                                                        ImagePosition="Left">
                                                    </AddButton>
                                                    <UploadButton Text="" Image-Url="../images/file_upload.gif" Image-Height="25px" Image-Width="25px"
                                                        ImagePosition="Left">                                            
                                                    </UploadButton>                                        
                                                </dxuc:ASPxUploadControl>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; text-align: left;">
                                                文件列表                                                                        
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; text-align: left;" runat="server" id="tblcellgridDocList">
                                                <dxwgv:ASPxGridView ID="gridDocList" ClientInstanceName="gridDocList" runat="server"
                                                    KeyFieldName="PolicyDocID" Width="100%" AutoGenerateColumns="False" 
                                                    OnCustomCallback="gridDocList_CustomCallback"
                                                    >
                                                    <%-- BeginRegion Columns --%>
                                                    <Columns>
                                                        <dxwgv:GridViewDataColumn FieldName="DocName" Caption="文件名" CellStyle-Wrap="False" Width="25" Settings-AllowDragDrop="false">
                                                            <DataItemTemplate>
                                                                <a id="fileurl <%# Eval("PolicyDocID") %>" onclick="hlPolicyItemTogetherClick('<%# Eval("DocURL") %>');" href="#"><%# Eval("DocName")%></a>
                                                            </DataItemTemplate>
                                                        </dxwgv:GridViewDataColumn>
                                                        <dxwgv:GridViewDataColumn FieldName="DocURL" Caption="链接地址" CellStyle-Wrap="False">
                                                        </dxwgv:GridViewDataColumn>                                                                                                        
                                                    </Columns>
                                                    <%-- EndRegion --%>
                                                    <SettingsPager Mode="ShowAllRecords" />
                                                    <Settings ShowGroupPanel="false" /> 
                                                    <ClientSideEvents CustomButtonClick="" />
                                                    <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false"  />
                                                </dxwgv:ASPxGridView>                                                            
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
                                                <dxe:ASPxTextBox ID="dxetxtAuditPerson" ClientInstanceName="dxetxtAuditPerson" runat="server" Width="100px"></dxe:ASPxTextBox>
                                            </td>
                                            <td style="width: 10%; text-align: right;">
                                                审核日期：
                                            </td>
                                            <td style="width: 20%; text-align: left;">
                                                <dxe:ASPxDateEdit ID="dxeAuditTime" ClientInstanceName="dxeAuditTime" runat="server" Width="120px">
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
                                                <dxe:ASPxMemo runat="server" id="dxeMemo" ClientInstanceName="dxeMemo" Rows="10" Columns="72"></dxe:ASPxMemo>
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
                    <table style="width: 100%" runat="server" id="tblNewExecuteAction">
                        <tr>
                            <td style="width: 400px; text-align: left;">
                                &nbsp;
                            </td>
                            <td style="width:50px; text-align:left;">
                                <dxe:ASPxButton runat="server" id="dxebtnBottomAdd" ClientInstanceName="dxebtnBottomAdd" Text="新增" CausesValidation="true" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {btnAddClick(s,e);}" />
                                </dxe:ASPxButton> 
                            </td>
                            <td style="width:50px; text-align:left;">
                                <dxe:ASPxButton runat="server" id="dxebtnBottomSave" ClientInstanceName="dxebtnBottomSave" Text="保存" CausesValidation="true" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {dxebtntopSave_Click(s,e);}" />
                                </dxe:ASPxButton> 
                            </td>
                            <td style="width:70px; text-align:left;">
                                <dxe:ASPxButton runat="server" id="dxebtnBottomCheck" ClientInstanceName="dxebtnBottomCheck" Text="提交审核" CausesValidation="true" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {btnSaveCheckClick(s,e);}" />
                                </dxe:ASPxButton> 
                            </td>
                            <td style="width:50px; text-align:left;">
                                <dxe:ASPxButton runat="server" id="dxebtnCancel" ClientInstanceName="dxebtnCancel" Text="重置" CausesValidation="false" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {btnCancelClick();}" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width:50px; text-align:left;">
                                <dxe:ASPxButton runat="server" id="dxeClose" ClientInstanceName="dxeClose" Text="关闭" CausesValidation="false" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {btnCloseClick();}" />
                                </dxe:ASPxButton>
                            </td>                
                        </tr>
                        <tr>
                            <td style="width: 400px; text-align: left;">
                                &nbsp;
                            </td>
                            <td style="display:none;"><a id="hrefnewpolicy" href="PolicyInput.aspx">New</a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </asp:Panel>

</asp:Content>
