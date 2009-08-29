<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="PolicyCheckList.aspx.cs" Inherits="BrokerWebApp.otherinsurance.PolicyCheckList" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3.Export" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保单审核列表</title>
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


	    function gridCustomButtonClick(s, e) {
	        s.GetRowValues(e.visibleIndex, "PolicyID;PrevPolicyID", getTheSelectedRowsValues);
	        //PrevPolicyID
	    }

	    function getTheSelectedRowsValues(selectedValues) {
	        //var isAlert = gridSearchResult.cpCusJSproperty_IsAlert;
	        //var isAlert = gridSearchResult.cpCusJSproperty_IsAlert[0];
	        if (selectedValues.length == 0) {
	            //
	        }
	        else {
	            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=1000px;dialogHeight=800px;center=yes;help=no";
	            var querystring;
	            if (isEmpty(selectedValues[1]))
	                querystring = "PolicyInput.aspx?pagemode=audit&id=" + selectedValues[0];	                
	            else
	                querystring = "PolicyAlter.aspx?pagemode=audit&id=" + selectedValues[0];
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

	    function Carrier_SelectedIndexChanged(s, e) {
	        var thejsonstring = dxeddlCarrierId.GetSelectedItem().value;
	        dxeddlBranchId.PerformCallback(thejsonstring);
	    }

	    function dxeddlDeptID_SelectedIndexChanged(s, e) {
	        var thejsonstring = dxeddlDeptID.GetSelectedItem().value;
	        dxeddlSalesId.PerformCallback(thejsonstring);
	    }
	    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <table style="width:100%">                    
                    <tr>
                        <td style="height:40px; width:45%;">
                                                        
                        </td>
                        <td style="height:40px; width:55%;color:#0E5ED5;text-align:left;">
                            当前位置：非车险保单审核&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:label id="LblUserNameTop" runat="server" Text="<%=CurrentUserName%>"></asp:label>，您好！今天是
	                        <label id="lblCurrentDate"></label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;" colspan="2"> 
                            <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float:left; vertical-align: middle;">
                                        <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                    <div style="float:left; margin-left:5px;">所属项目</div>
                                    <div style="float:left; margin-left:5px;">
                                        <asp:Label ID="lbl_npSearchHeader" runat="server">(展开)</asp:Label>
                                    </div>
                                    
                                </div>
                            </asp:Panel>                           
                            <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                                
                                <table>
                                    <tr>
                                        <td>                                        
                                            <table>
                                                <tr style="font-size:1px; height:2px;">
                                                    <td style="width:70px;"></td>
                                                    <td style="width:250px;"></td>
                                                    <td style="width:70px;"></td>
                                                    <td style="width:250px;"></td>
                                                    <td style="width:70px;"></td>
                                                    <td style="width:250px;"></td>
                                                </tr> 
                                                <tr>
                                                    <td style="text-align:right;">保单编号：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server" Width="240px"></dxe:ASPxTextBox>
                                                    </td>                                                    
                                                    <td style="text-align:right;">投保编号：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxTextBox ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server" Width="240px"></dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align:right;">批单编号：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxTextBox ID="dxetxtAltNO" ClientInstanceName="dxetxtAltNO" runat="server" Width="240px"></dxe:ASPxTextBox>
                                                    </td>                                                                                                     
                                                </tr> 
                                                <tr>
                                                    <td style="text-align:right;">投保客户：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCustomer" ClientInstanceName="dxetxtCustomer" runat="server" Width="240px"></dxe:ASPxTextBox> 
                                                    </td> 
                                                    <td style="text-align:right;">部门：</td>
                                                    <td style="text-align:left;">
                                                       <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server" Width="240px" DropDownStyle="DropDownList">
															<Items>
															</Items>
															<ClientSideEvents SelectedIndexChanged="dxeddlDeptID_SelectedIndexChanged" />
														</dxe:ASPxComboBox>                                                         
                                                    </td>
                                                    <td style="text-align:right;">客户经理：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server" Width="240px" DropDownStyle="DropDownList" OnCallback="dxeddlSalesIdCallback">
															<Items>
															</Items>
														</dxe:ASPxComboBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;">保险险种：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxComboBox ID="dxeddlProdTypeName" ClientInstanceName="dxeddlProdTypeName"
                                                            runat="server" Width="240px" DropDownStyle="DropDownList">
                                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {SelectedProdTypeNameIndexChanged(s, e); return false;}" />
                                                        </dxe:ASPxComboBox>   
                                                        <input type="hidden" id="ptid" runat="server" />                                                                                                                                                                    
                                                    </td> 
                                                    <td style="text-align:right;">保险公司：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxComboBox ID="dxeddlCarrierId" ClientInstanceName="dxeddlCarrierId" runat="server" Width="240px" DropDownStyle="DropDownList">
															<Items>
															</Items>
															<ClientSideEvents SelectedIndexChanged="Carrier_SelectedIndexChanged" />
														</dxe:ASPxComboBox>                                                       
                                                    </td>
                                                    <td style="text-align:right;">分支机构：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxComboBox ID="dxeddlBranchId" ClientInstanceName="dxeddlBranchId" runat="server" Width="240px" DropDownStyle="DropDownList" OnCallback="CarrierBranchIDCallback">
															<Items>
															</Items>
														</dxe:ASPxComboBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;">业务员：</td>
                                                    <td style="text-align:left;"> 
                                                        <dxe:ASPxTextBox ID="dxetxtCarrierSales" ClientInstanceName="dxetxtCarrierSales" runat="server" Width="240px"></dxe:ASPxTextBox>                                                                                                             
                                                    </td>                                                
                                                    <td style="text-align:right;">业务来源：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxComboBox ID="dxeddlSourceTypeID" ClientInstanceName="dxeddlSourceTypeID" runat="server" Width="240px" DropDownStyle="DropDownList">
															<Items>
															</Items>
														</dxe:ASPxComboBox>                                                        
                                                    </td>
                                                    <td style="text-align:right;">业务性质：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxComboBox ID="dxeddlOperationType" ClientInstanceName="dxeddlOperationType"
                                                            runat="server" Width="240px" DropDownStyle="DropDownList">
                                                            <items>
															</items>
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                </tr>                                                
                                                <tr>
                                                    <td style="text-align:right;">录单日期：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="dxeStartDate" runat="server" Width="240px">
                                                        </dxe:ASPxDateEdit>                                                       
                                                    </td>
                                                    <td style="text-align: center;">至</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="dxeEndDate" runat="server" Width="240px"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="text-align:right;">审核状态：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxComboBox ID="dxeddlCheckState" ClientInstanceName="dxeddlCheckState" runat="server" Width="240px" DropDownStyle="DropDownList">
															<Items>
																<dxe:ListEditItem Text="待审核" Value="1" />
																<dxe:ListEditItem Text="已审核" Value="2" />
															</Items>
														</dxe:ASPxComboBox> 
                                                    </td>                                                     
                                                </tr>  
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td style="text-align:right;" colspan="2">
                                                        <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" OnClick="btnSearch_Click" />&nbsp;
                                                        <input type="reset" value="重置" name="btnReset" id="btnReset" class="input_2" />&nbsp;
                                                        <asp:Button ID="btnExport" runat="server" Text="Excel" OnClick="btnXlsExport_Click" CssClass="input_2" /> 
                                                    </td> 
                                                </tr>                               
                                            </table>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                                        
                                     
                             </asp:Panel>
                             <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearch" runat="Server"
                                TargetControlID="npSearchDetail"
                                ExpandControlID="npSearchHeader"
                                CollapseControlID="npSearchHeader" 
                                Collapsed="false"
                                TextLabelID="lbl_npSearchHeader"
                                ImageControlID="img_npSearchHeader"    
                                ExpandedText="(展开)"
                                CollapsedText="(隐藏)"
                                ExpandedImage="~/images/collapse_blue.jpg"
                                CollapsedImage="~/images/expand_blue.jpg"
                                SuppressPostBack="true" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;" colspan="2">
                            <asp:Panel ID="npSearchResultHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float:left; vertical-align: middle;">
                                        <asp:ImageButton ID="img_npSearchResultHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                    <div style="float:left; margin-left:5px;">搜索结果</div>
                                    <div style="float:left; margin-left:5px;">
                                        <asp:Label ID="lbl_npSearchResultHeader" runat="server">(展开)</asp:Label>
                                    </div>
                                    
                                </div>
                            </asp:Panel>  
                            <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width:100%">
                                           <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server" 
                                                    DataSourceID="gd_DataSource"
                                                    KeyFieldName="PolicyID" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true" 
                                                    OnRowDeleting="gridSearchResult_RowDeleting"
                                                    OnCustomCallback="gridSearchResult_CustomCallback"
                                                    OnHtmlRowCreated="gridSearchResult_HtmlRowCreated" 
                                                    OnHtmlCommandCellPrepared="gridSearchResult_CommandCellPrepared" 
                                                    OnHtmlRowPrepared="gridSearchResult_RowPrepared"  
                                                    OnCustomJSProperties="gridSearchResult_CustomJSProperties"
                                                    >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                                                    <NewButton Visible="False" />
                                                                    <EditButton Visible="False" />                                                                    
                                                                    <DeleteButton Visible="false" />
                                                                    <CustomButtons>
                                                                        <dxwgv:GridViewCommandColumnCustomButton Text="审核">                                                                            
                                                                        </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                                                    </CustomButtons>                                                   
                                                                </dxwgv:GridViewCommandColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="保单编号" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="投保编号" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="AltNO" Caption="批单编号" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="SalesIdName" Caption="客户经理" CellStyle-Wrap="False">                                                                   
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
                                                                <dxwgv:GridViewDataColumn FieldName="CreatePersonName" Caption="录单人" CellStyle-Wrap="False">                                                                   
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
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowPager"  PageSize="20" Summary-Visible="true" />
                                                        <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways" ShowGroupedColumns="true" ShowFilterRow="false" />
                                                        <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                                        <SettingsText CustomizationWindowCaption="个性化" />
                                                        <GroupSummary >
                                                            <dxwgv:ASPxSummaryItem FieldName="PolicyNo" SummaryType="Count" ShowInGroupFooterColumn="PolicyNo" DisplayFormat = "总计: {0}" />
                                                        </GroupSummary>
                                                        <TotalSummary >
                                                            <dxwgv:ASPxSummaryItem FieldName="PolicyNo" SummaryType="Count" ShowInGroupFooterColumn="PolicyNo" DisplayFormat = "总计: {0}" />
                                                        </TotalSummary>
                                                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                                                        
                                                    </dxwgv:ASPxGridView> 
                                                    <dxwgv:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridSearchResult"></dxwgv:ASPxGridViewExporter>
                                                    <asp:ObjectDataSource ID="gd_DataSource" runat="server" 
                                                        SelectMethod="FetchPolicyList"
                                                        TypeName="BusinessObjects.Policy.BO_Policy" 
                                                        EnablePaging="false"  CacheDuration="1"                                                                                                                                                      
                                                        >
                                                        <SelectParameters> 
                                                             <asp:Parameter Name="sWhere" Type="String" Direction="Input" DefaultValue=" AND ISNULL(B.PolicyStatus,'0') = '1' AND ISNULL(B.PolicyType,'0') ='0' " />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>                                                   
                                                </td>
                                            </tr>
                                        </table>
       
                             </asp:Panel>
                             <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearchResult" runat="Server"
                                TargetControlID="npSearchResultDetail"
                                ExpandControlID="npSearchResultHeader"
                                CollapseControlID="npSearchResultHeader" 
                                Collapsed="false"
                                TextLabelID="lbl_npSearchResultHeader"
                                ImageControlID="img_npSearchResultHeader"    
                                ExpandedText="(展开)"
                                CollapsedText="(隐藏)"
                                ExpandedImage="~/images/collapse_blue.jpg"
                                CollapsedImage="~/images/expand_blue.jpg"
                                SuppressPostBack="true" />
                        </td>
                    </tr>                    
     </table>
    
    
    
    
</asp:Content>
