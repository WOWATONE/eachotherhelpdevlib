<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="PolicyInputList.aspx.cs" Inherits="BrokerWebApp.otherinsurance.PolicyInputList" %>

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
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保单录入列表</title>

    <script type="text/javascript">
        
        function getProductTypeID() {
            var result = $("#<%=ptid.ClientID %>");
            var ID = result[0].value;
            return ID;
        }
        function setProductTypeID(thevalue) {
            var result = $("#<%=ptid.ClientID %>");
            result[0].value = thevalue;
        }
        
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});

            lblCurrentDate.innerHTML = makewelcomeString();

        });

        function btnCreateClick() {
	        var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
	        window.showModalDialog("PolicyInput.aspx?pagemode=input", self, myArguments);
        }

        function gridCustomButtonClick(s, e) {
            s.GetRowValues(e.visibleIndex, "PolicyID", getTheSelectedRowsValues);
        }

        function getTheSelectedRowsValues(selectedValues) {
            if (selectedValues.length == 0) {
                //
            }
            else {
                var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=1000px;dialogHeight=800px;center=yes;help=no";
                var querystring;
                querystring = "PolicyInput.aspx?pagemode=input&id=" + selectedValues;
                window.showModalDialog(querystring, self, myArguments);
            }
        }

        function SelectedProdTypeNameIndexChanged(s, e) {
            var thevalue = s.GetValue();
            setProductTypeID(thevalue);
            var test = s.GetText();
            var sValue = s.GetValue();

            if (test.length > 0) {
                var index = test.lastIndexOf("∟");
                if (index >= 0) {
                    var testTmp = test.substr(index + 1);
                    s.SetText(testTmp);
                }
            }
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
    <table style="width: 100%">
        <tr>
            <td style="height: 40px; width: 45%;">
                <dxe:ASPxButton ID="debtnCreate" runat="server" Text="新建" AutoPostBack="false">
                    <clientsideevents click="btnCreateClick" />
                </dxe:ASPxButton>
            </td>
            <td style="height: 40px; width: 55%; color: #0E5ED5; text-align: left;">
                当前位置：非车险保单录入&nbsp;
                <asp:Label ID="LblUserNameTop" runat="server" Text="王六"></asp:Label>，您好！今天是
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
                            <td>
                                <table>
                                    <tr style="font-size: 1px; height: 2px;">
                                        <td style="width: 70px;">
                                        </td>
                                        <td style="width: 180px;">
                                        </td>
                                        <td style="width: 20px;">
                                        </td>
                                        <td style="width: 50px;">
                                        </td>
                                        <td style="width: 180px;">
                                        </td>
                                        <td style="width: 70px;">
                                        </td>
                                        <td style="width: 160px;">
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            保单编号：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server"
                                                Width="170px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td style="text-align: right;" colspan="2">
                                            投保编号：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server"
                                                Width="170px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td style="text-align: right;">
                                            投保客户：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="dxetxtCustomer" ClientInstanceName="dxetxtCustomer" runat="server"
                                                Width="155px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            部门：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server"
                                                Width="170px" DropDownStyle="DropDownList">
                                                <items>
													<dxe:ListEditItem Text="(全部)" Value="" />
													<dxe:ListEditItem Text="业务部" Value="1" />
												</items>
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: right;" colspan="2">
                                            客户经理：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server"
                                                Width="170px" DropDownStyle="DropDownList">
                                                <items>
													<dxe:ListEditItem Text="(全部)" Value="" />
												</items>
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: right;">
                                            保险险种：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlProdTypeName" ClientInstanceName="dxeddlProdTypeName"
                                                runat="server" Width="160px" DropDownStyle="DropDownList">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {SelectedProdTypeNameIndexChanged(s, e); return false;}" />
                                            </dxe:ASPxComboBox>  
                                            <input type="hidden" id="ptid" runat="server" />                                           
                                        </td>
                                        <td style="text-align: left;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            保险公司：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlCarrierId" ClientInstanceName="dxeddlCarrierId" runat="server"
                                                Width="170px" DropDownStyle="DropDownList">
                                                <items>
												    <dxe:ListEditItem Text="中国平安保险公司" Value="" />
											    </items>
                                            </dxe:ASPxComboBox>
                                            
                                        </td>
                                        <td style="text-align: right;" colspan="2">
                                            分支机构：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlBranchId" ClientInstanceName="dxeddlBranchId" runat="server"
                                                Width="170px" DropDownStyle="DropDownList">
                                                <items>
													<dxe:ListEditItem Text="中国平安保险公司" Value="" />
												</items>
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: right;">
                                            业务员：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="dxetxtCreatePerson" ClientInstanceName="dxetxtCreatePerson"
                                                runat="server" Width="155px">
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            业务来源：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlSourceTypeID" ClientInstanceName="dxeddlSourceTypeID"
                                                runat="server" Width="170px" DropDownStyle="DropDownList">
                                                <items>
																<dxe:ListEditItem Text="来源1" Value="" />
															</items>
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: right;" colspan="2">
                                            业务性质：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="dxeddlOperationType" ClientInstanceName="dxeddlOperationType"
                                                runat="server" Width="170px" DropDownStyle="DropDownList">
                                                <items>
													<dxe:ListEditItem Text="新增" Value="1" />
													<dxe:ListEditItem Text="再保" Value="2" />
												</items>
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: right;">
                                        </td>
                                        <td style="text-align: left;">
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            录单日期：
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxDateEdit ID="dxeStartDate" ClientInstanceName="dxeStartDate" runat="server">
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td style="text-align: center;">
                                            至
                                        </td>
                                        <td style="text-align: left;" colspan="2">
                                            <dxe:ASPxDateEdit ID="dxeEndDate" ClientInstanceName="dxeEndDate" runat="server">
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td style="text-align: right;" colspan="2">
                                            <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" OnClick="btnSearch_Click" />&nbsp;
                                            <input type="reset" value="重置" name="btnReset" id="btnReset" class="input_2" />&nbsp;
                                            <asp:Button ID="btnExport" runat="server" Text="Excel" OnClick="btnXlsExport_Click"
                                                CssClass="input_2" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
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
                                    DataSourceID="gd_DataSource" 
                                    KeyFieldName="PolicyID" AutoGenerateColumns="False"
                                    Settings-ShowFooter="true" Width="100%" SettingsPager-AlwaysShowPager="true"
                                    OnRowDeleting="gridSearchResult_RowDeleting"
                                    OnCustomCallback="gridSearchResult_CustomCallback" 
                                    OnHtmlRowCreated="gridSearchResult_HtmlRowCreated">
                                    <%-- BeginRegion Columns --%>
                                    <columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                                                    <NewButton Visible="False" />
                                                                    <EditButton Visible="False" />                                                                    
                                                                    <DeleteButton Visible="true" />
                                                                    <CustomButtons>
                                                                        <dxwgv:GridViewCommandColumnCustomButton Text="编辑">                                                                            
                                                                        </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                                                    </CustomButtons>                                                   
                                                                </dxwgv:GridViewCommandColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="保单编号" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="投保编号" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="UserNameCn" Caption="客户经理" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>      
                                                                <dxwgv:GridViewDataColumn FieldName="CarrierNameCn" Caption="保险公司" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="分支机构" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>                                
                                                                <dxwgv:GridViewDataColumn FieldName="ProdTypeName" Caption="险种" CellStyle-Wrap="False"> 
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Coverage" Caption="保额" CellStyle-Wrap="False">   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Premium" Caption="保费（原）" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Process" Caption="经纪费（原）" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CurrencyName" Caption="币种" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>              
                                                                <dxwgv:GridViewDataColumn FieldName="PremiumBase" Caption="保费（本）" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                                                                                 
                                                                <dxwgv:GridViewDataColumn FieldName="ProcessBase" Caption="经纪费（本）" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CustName" Caption="投保客户" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="CreatePerson" Caption="录单人" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="CreateTime" Caption="录单日期" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">                                                                   
                                                                </dxwgv:GridViewDataDateColumn>                                        
                                                                <dxwgv:GridViewDataColumn FieldName="SourceTypeName" Caption="业务来源" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>          
                                                                <dxwgv:GridViewDataColumn FieldName="FlagReinsureName" Caption="业务性质" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="GatheringTypeName" Caption="收款方式" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                        
                                                                <dxwgv:GridViewDataDateColumn FieldName="StartDate" Caption="保单起保日期" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">                                                                   
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="EndDate" Caption="保单终止日期" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">                                                                   
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Remark" Caption="审核备注" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                            </columns>
                                    <%-- EndRegion --%>
                                    <settingspager mode="ShowPager" pagesize="20" summary-visible="true" />
                                    <settings showgrouppanel="true" showverticalscrollbar="false" showgroupfooter="VisibleAlways"
                                        showgroupedcolumns="true" showfilterrow="false" />
                                    <settingsbehavior confirmdelete="true" autoexpandallgroups="true" />
                                    <settingstext customizationwindowcaption="个性化" />
                                    <groupsummary>
                                                            <dxwgv:ASPxSummaryItem FieldName="PolicyNo" SummaryType="Count" ShowInGroupFooterColumn="PolicyNo" DisplayFormat = "总计: {0}" />
                                                        </groupsummary>
                                    <totalsummary>
                                                            <dxwgv:ASPxSummaryItem FieldName="PolicyNo" SummaryType="Count" ShowInGroupFooterColumn="PolicyNo" DisplayFormat = "总计: {0}" />
                                                        </totalsummary>
                                    <clientsideevents custombuttonclick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                                </dxwgv:ASPxGridView>
                                <asp:ObjectDataSource ID="gd_DataSource" runat="server" 
                                    SelectMethod="FetchPolicyList"
                                    TypeName="BusinessObjects.Policy.BO_Policy" 
                                    EnablePaging="false"  CacheDuration="1"                                                                                                                                                      
                                    >
                                    <SelectParameters> 
                                         <asp:Parameter Name="sWhere" Type="String" Direction="Input" DefaultValue=" AND ISNULL(B.PolicyStatus,'0') = '0'" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <dxwgv:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridSearchResult">
                                </dxwgv:ASPxGridViewExporter>
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
