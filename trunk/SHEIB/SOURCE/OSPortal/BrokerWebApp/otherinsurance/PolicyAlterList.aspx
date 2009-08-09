﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="PolicyAlterList.aspx.cs" Inherits="BrokerWebApp.otherinsurance.PolicyAlterList" %>
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
    <title>保单批改列表</title>
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



	    function gridAuditCustomButtonClick(s, e) {
	        s.GetRowValues(e.visibleIndex, "PolicyID", getTheAuditSelectedRowsValues);
	    }

	    function getTheAuditSelectedRowsValues(selectedValues) {
	        if (selectedValues.length == 0) {
	            //
	        }
	        else {
	            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=1000px;dialogHeight=800px;center=yes;help=no";
	            var querystring;
	            querystring = "PolicyAlter.aspx?pid=" + selectedValues;
	            window.showModalDialog(querystring, self, myArguments);
	        }
	    }

	    function gridAlertCustomButtonClick(s, e) {
	        s.GetRowValues(e.visibleIndex, "PolicyID", getTheAlertSelectedRowsValues);
	    }

	    function getTheAlertSelectedRowsValues(selectedValues) {
	        if (selectedValues.length == 0) {
	            //
	        }
	        else {
	            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=1000px;dialogHeight=800px;center=yes;help=no";
	            var querystring;
	            querystring = "PolicyAlter.aspx?input=input&id=" + selectedValues;
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

	    function policyTab_Changing(s, e) {
	        //
	        if (e.tab.index == 1) {
	            //                             
	        }
	    }

	    function policyTab_Click(s, e) {
	        //
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
                        <td style="height:40px; width:55%; color:#0E5ED5;text-align:left;">
                            当前位置：非车险保单批改&nbsp;&nbsp;
                            <asp:label id="LblUserNameTop" runat="server" Text="王六"></asp:label>，您好！今天是
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
                                                    <td></td>
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
                                                    <td style="text-align:right;">批单编号</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxTextBox ID="dxetxtPrevPolicyID" ClientInstanceName="dxetxtPrevPolicyID" runat="server" Width="240px"></dxe:ASPxTextBox>
                                                    </td> 
                                                    <td></td>                                                   
                                                </tr> 
                                                <tr>
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
                                                    <td style="text-align:right;">投保客户：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCustomer" ClientInstanceName="dxetxtCustomer" runat="server" Width="240px"></dxe:ASPxTextBox>                                                        
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
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
                                                    <td style="text-align:right;">保险险种：</td>
                                                    <td style="text-align:left;">
                                                        <table style="margin-left:-3px;">
                                                            <tr>
                                                                <td style="text-align:left;">
                                                                    <dxe:ASPxComboBox ID="dxeddlProdTypeName" ClientInstanceName="dxeddlProdTypeName"
                                                                        runat="server" Width="240px" DropDownStyle="DropDownList">
                                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {SelectedProdTypeNameIndexChanged(s, e); return false;}" />
                                                                    </dxe:ASPxComboBox>  
                                                                    <input type="hidden" id="ptid" runat="server" />                                                                                                                                                                     
                                                                </td>
                                                                <td style="text-align:left;"></td>
                                                            </tr>
                                                        </table>                                                       
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
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
                                                    <td style="text-align:right;">录单人：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxTextBox ID="dxetxtCreatePerson" ClientInstanceName="dxetxtCreatePerson" runat="server" Width="240px"></dxe:ASPxTextBox> 
                                                    </td>                                                    
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;">录入日期：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="dxeStartDate" runat="server" Width="240px">
                                                        </dxe:ASPxDateEdit>                                                       
                                                    </td>
                                                    <td style="text-align:right;">至</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="dxeEndDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="text-align:right;"></td>
                                                    <td style="text-align:left;">                                                                                                             
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;"></td>
                                                    <td style="text-align:left;"></td>
                                                    <td style="text-align:right;"></td>
                                                    <td style="text-align:left;"></td>
                                                    <td style="text-align:right;" colspan="2">
                                                        <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" OnClick="btnSearch_Click" />&nbsp;
                                                        <input type="reset" value="重置" name="btnReset" id="btnReset" class="input_2" />&nbsp;
                                                        <asp:Button ID="btnExport" runat="server" Text="Excel" OnClick="btnXlsExport_Click" CssClass="input_2" /> 
                                                    </td>
                                                    <td></td>
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
                                    <div style="float: left; margin-left:5px;">搜索结果</div>
                                    <div style="float: left; margin-left:5px;">
                                        <asp:Label ID="lbl_npSearchResultHeader" runat="server">(展开)</asp:Label>
                                    </div>
                                    
                                </div>
                            </asp:Panel>  
                            <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        
                                        <dxtc:ASPxPageControl ID="policyTabPage" ClientInstanceName="policyTabPage"
                                            runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%" 
                                            AutoPostBack="false" EnableCallBacks="true" EnableViewState="true" OnActiveTabChanged="policyTabPage_ActiveTabChanged"
                                            >
                                            <ClientSideEvents ActiveTabChanging="function(s, e) {policyTab_Changing(s,e);}" TabClick="function(s, e) {policyTab_Click(s,e);}" />
                                            <TabPages>
                                                <dxtc:TabPage Text="批改单">
                                                    <ContentCollection>
                                                        <dxw:ContentControl ID="cc_alert" runat="server">
			                                                <table style="width:100%">
                                                               <tr>
                                                                    <td>
                                                                        <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server" 
                                                                        DataSourceID="AltDataSource"
                                                                        KeyFieldName="KeyGUID" AutoGenerateColumns="False" 
                                                                        Settings-ShowFooter="true" Width="100%" 
                                                                        SettingsPager-AlwaysShowPager="true" 
                                                                        OnRowDeleting="gridSearchResult_RowDeleting"
                                                                        OnCustomCallback="gridSearchResult_CustomCallback" 
                                                                        OnHtmlRowCreated="gridSearchResult_HtmlRowCreated"
                                                                        >
                                                                            <%-- BeginRegion Columns --%>
                                                                                <Columns>
                                                                                    <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                                                                        <CustomButtons>
                                                                                            <dxwgv:GridViewCommandColumnCustomButton Text="修改">                                                                            
                                                                                            </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                                                                        </CustomButtons>                                                   
                                                                                    </dxwgv:GridViewCommandColumn> 
                                                                                    <dxwgv:GridViewDataColumn FieldName="PrevPolicyID" Caption="批单编号" VisibleIndex="1" CellStyle-Wrap="False">                                                                    
                                                                                    </dxwgv:GridViewDataColumn>                                                               
                                                                                    <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="保单编号" VisibleIndex="2" CellStyle-Wrap="False">                                                                    
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="投保编号" VisibleIndex="3" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>   
                                                                                    <dxwgv:GridViewDataColumn FieldName="UserNameCn" Caption="客户经理" VisibleIndex="4" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>      
                                                                                    <dxwgv:GridViewDataColumn FieldName="CarrierNameCn" Caption="保险公司" VisibleIndex="5" CellStyle-Wrap="False">                                                                    
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="分支机构" VisibleIndex="6" CellStyle-Wrap="False">                                                                    
                                                                                    </dxwgv:GridViewDataColumn>                                
                                                                                    <dxwgv:GridViewDataColumn FieldName="ProdTypeName" Caption="险种" VisibleIndex="7" CellStyle-Wrap="False"> 
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataColumn FieldName="Coverage" Caption="保额" VisibleIndex="8" CellStyle-Wrap="False">   
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataColumn FieldName="Premium" Caption="保费（原）" VisibleIndex="9" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataColumn FieldName="Process" Caption="经纪费（原）" VisibleIndex="9" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataColumn FieldName="CurrencyName" Caption="币种" VisibleIndex="10" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>              
                                                                                    <dxwgv:GridViewDataColumn FieldName="PremiumBase" Caption="保费（本）" VisibleIndex="11" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>                                                         
                                                                                    <dxwgv:GridViewDataColumn FieldName="ProcessBase" Caption="经纪费（本）" VisibleIndex="13" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataColumn FieldName="CustName" Caption="投保客户" VisibleIndex="14" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>                                                                
                                                                                    <dxwgv:GridViewDataColumn FieldName="CreatePerson" Caption="录单人" VisibleIndex="15" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataDateColumn FieldName="CreateTime" Caption="录单日期" VisibleIndex="16" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">                                                                   
                                                                                    </dxwgv:GridViewDataDateColumn>                                        
                                                                                    <dxwgv:GridViewDataColumn FieldName="SourceTypeName" Caption="业务来源" VisibleIndex="17" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>          
                                                                                    <dxwgv:GridViewDataColumn FieldName="FlagReinsureName" Caption="业务性质" VisibleIndex="18" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>   
                                                                                    <dxwgv:GridViewDataColumn FieldName="GatheringTypeName" Caption="收款方式" VisibleIndex="19" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>                                                        
                                                                                    <dxwgv:GridViewDataDateColumn FieldName="StartDate" Caption="保单起保日期" VisibleIndex="20" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">                                                                   
                                                                                    </dxwgv:GridViewDataDateColumn>
                                                                                    <dxwgv:GridViewDataDateColumn FieldName="EndDate" Caption="保单终止日期" VisibleIndex="21" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">                                                                   
                                                                                    </dxwgv:GridViewDataDateColumn>                                                                
                                                                                    <dxwgv:GridViewDataColumn FieldName="Remark" Caption="审核备注" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                </Columns>
                                                                            <%-- EndRegion --%>
                                                                            <SettingsPager Mode="ShowPager"  PageSize="20" Summary-Visible="true"  />
                                                                            <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways" ShowGroupedColumns="true" ShowFilterRow="false" />
                                                                            <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                                                            <SettingsText CustomizationWindowCaption="个性化" />
                                                                            <GroupSummary >
                                                                                <dxwgv:ASPxSummaryItem FieldName="PolicyNo" SummaryType="Count" ShowInGroupFooterColumn="PolicyNo" DisplayFormat = "总计: {0}" />
                                                                            </GroupSummary>
                                                                            <TotalSummary >
                                                                                <dxwgv:ASPxSummaryItem FieldName="PolicyNo" SummaryType="Count" ShowInGroupFooterColumn="PolicyNo" DisplayFormat = "总计: {0}" />
                                                                            </TotalSummary>
                                                                            <ClientSideEvents CustomButtonClick="function(s, e) {gridAlertCustomButtonClick(s,e);return false;}" />
                                                                            
                                                                        </dxwgv:ASPxGridView> 
                                                                        <dxwgv:ASPxGridViewExporter ID="gridAlertExport" runat="server" GridViewID="gridSearchResult"></dxwgv:ASPxGridViewExporter>
                                                                        <asp:ObjectDataSource ID="AltDataSource" runat="server" 
                                                                            SelectMethod="FetchPolicyList"
                                                                            TypeName="BusinessObjects.Policy.BO_Policy" 
                                                                            EnablePaging="false"  CacheDuration="1"                                                                                                                                                      
                                                                            >
                                                                            <SelectParameters> 
                                                                                 <asp:Parameter Name="sWhere" Type="String" Direction="Input" DefaultValue=" AND ISNULL(B.PolicyStatus,'0') = '0' AND ISNULL(B.PrevPolicyID,'') !='' AND ISNULL(B.PolicyType,'0') ='0' " />
                                                                            </SelectParameters>
                                                                        </asp:ObjectDataSource>                                                    
                                                                    </td>
                                                                </tr>
                                                            </table>
			                                            </dxw:ContentControl>
                                                    </ContentCollection>
                                                </dxtc:TabPage>
                                                <dxtc:TabPage Text="已审核单">
                                                    <ContentCollection>
                                                        <dxw:ContentControl ID="cc_audit" runat="server">
			                                            
			                                                <table style="width:100%">
                                                               <tr>
                                                                    <td>
                                                                        <dxwgv:ASPxGridView ID="gridAuditSearchResult" ClientInstanceName="gridAuditSearchResult" runat="server" 
                                                                        DataSourceID="DataSource"
                                                                        KeyFieldName="KeyGUID" AutoGenerateColumns="False" 
                                                                        Settings-ShowFooter="true" Width="100%" 
                                                                        SettingsPager-AlwaysShowPager="true"
                                                                        OnCustomCallback="gridAuditSearchResult_CustomCallback"
                                                                        >
                                                                            <%-- BeginRegion Columns --%>
                                                                                <Columns>
                                                                                    <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                                                                        <CustomButtons>
                                                                                            <dxwgv:GridViewCommandColumnCustomButton Text="批单">                                                                            
                                                                                            </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                                                                        </CustomButtons>                                                   
                                                                                    </dxwgv:GridViewCommandColumn> 
                                                                                    <dxwgv:GridViewDataColumn FieldName="PrevPolicyID" Caption="批单编号" VisibleIndex="1" CellStyle-Wrap="False">                                                                    
                                                                                    </dxwgv:GridViewDataColumn>                                                               
                                                                                    <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="保单编号" VisibleIndex="2" CellStyle-Wrap="False">                                                                    
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="投保编号" VisibleIndex="3" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>   
                                                                                    <dxwgv:GridViewDataColumn FieldName="UserNameCn" Caption="客户经理" VisibleIndex="4" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>      
                                                                                    <dxwgv:GridViewDataColumn FieldName="CarrierNameCn" Caption="保险公司" VisibleIndex="5" CellStyle-Wrap="False">                                                                    
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="分支机构" VisibleIndex="6" CellStyle-Wrap="False">                                                                    
                                                                                    </dxwgv:GridViewDataColumn>                                
                                                                                    <dxwgv:GridViewDataColumn FieldName="ProdTypeName" Caption="险种" VisibleIndex="7" CellStyle-Wrap="False"> 
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataColumn FieldName="Coverage" Caption="保额" VisibleIndex="8" CellStyle-Wrap="False">   
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataColumn FieldName="Premium" Caption="保费（原）" VisibleIndex="9" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataColumn FieldName="Process" Caption="经纪费（原）" VisibleIndex="9" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataColumn FieldName="CurrencyName" Caption="币种" VisibleIndex="10" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>              
                                                                                    <dxwgv:GridViewDataColumn FieldName="PremiumBase" Caption="保费（本）" VisibleIndex="11" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>                                                         
                                                                                    <dxwgv:GridViewDataColumn FieldName="ProcessBase" Caption="经纪费（本）" VisibleIndex="13" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataColumn FieldName="CustName" Caption="投保客户" VisibleIndex="14" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>                                                                
                                                                                    <dxwgv:GridViewDataColumn FieldName="CreatePerson" Caption="录单人" VisibleIndex="15" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                    <dxwgv:GridViewDataDateColumn FieldName="CreateTime" Caption="录单日期" VisibleIndex="16" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">                                                                   
                                                                                    </dxwgv:GridViewDataDateColumn>                                        
                                                                                    <dxwgv:GridViewDataColumn FieldName="SourceTypeName" Caption="业务来源" VisibleIndex="17" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>          
                                                                                    <dxwgv:GridViewDataColumn FieldName="FlagReinsureName" Caption="业务性质" VisibleIndex="18" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>   
                                                                                    <dxwgv:GridViewDataColumn FieldName="GatheringTypeName" Caption="收款方式" VisibleIndex="19" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>                                                        
                                                                                    <dxwgv:GridViewDataDateColumn FieldName="StartDate" Caption="保单起保日期" VisibleIndex="20" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">                                                                   
                                                                                    </dxwgv:GridViewDataDateColumn>
                                                                                    <dxwgv:GridViewDataDateColumn FieldName="EndDate" Caption="保单终止日期" VisibleIndex="21" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">                                                                   
                                                                                    </dxwgv:GridViewDataDateColumn>                                                                
                                                                                    <dxwgv:GridViewDataColumn FieldName="Remark" Caption="审核备注" CellStyle-Wrap="False">                                                                   
                                                                                    </dxwgv:GridViewDataColumn>
                                                                                </Columns>
                                                                            <%-- EndRegion --%>
                                                                            <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" />
                                                                            <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways" ShowGroupedColumns="true" ShowFilterRow="false" />
                                                                            <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                                                            <SettingsText CustomizationWindowCaption="个性化" />
                                                                            <GroupSummary >
                                                                                <dxwgv:ASPxSummaryItem FieldName="PolicyNo" SummaryType="Count" ShowInGroupFooterColumn="PolicyNo" DisplayFormat = "总计: {0}" />
                                                                            </GroupSummary>
                                                                            <TotalSummary >
                                                                                <dxwgv:ASPxSummaryItem FieldName="PolicyNo" SummaryType="Count" ShowInGroupFooterColumn="PolicyNo" DisplayFormat = "总计: {0}" />
                                                                            </TotalSummary>
                                                                            <ClientSideEvents CustomButtonClick="function(s, e) {gridAuditCustomButtonClick(s,e);return false;}" />
                                                                            
                                                                        </dxwgv:ASPxGridView> 
                                                                        <dxwgv:ASPxGridViewExporter ID="gridAuditExport" runat="server" GridViewID="gridAuditSearchResult"></dxwgv:ASPxGridViewExporter>
                                                                        <asp:ObjectDataSource ID="DataSource" runat="server" 
                                                                            SelectMethod="FetchPolicyList"
                                                                            TypeName="BusinessObjects.Policy.BO_Policy" 
                                                                            EnablePaging="false"  CacheDuration="1"                                                                                                                                                      
                                                                            >
                                                                            <SelectParameters> 
                                                                                 <asp:Parameter Name="sWhere" Type="String" Direction="Input" DefaultValue=" AND ISNULL(B.PolicyStatus,'0') = '0' AND ISNULL(B.PrevPolicyID,'') ='' AND ISNULL(B.PolicyType,'0') ='0'" />
                                                                            </SelectParameters>
                                                                        </asp:ObjectDataSource>                                                    
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            
			                                            </dxw:ContentControl>
                                                    </ContentCollection>
                                                </dxtc:TabPage>
                                            </TabPages>
                                        </dxtc:ASPxPageControl>
                                        
                                        
                                        
       
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
