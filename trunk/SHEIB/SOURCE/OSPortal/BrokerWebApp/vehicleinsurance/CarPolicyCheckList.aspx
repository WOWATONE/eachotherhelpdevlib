<%@ Page Title="ѯ�۵������б�" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="CarPolicyCheckList.aspx.cs" Inherits="BrokerWebApp.vehicleinsurance.CarPolicyCheckList" %>
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
    <title>ѯ�۵������б�</title>
    <script type="text/javascript">
	    $(document).ready(function() {
	        //jQuery.noticeAdd({
	        //    text: 'This is a notification that you have to remove',
	        //    stay: true
	    //});

	    lblCurrentDate.innerHTML = makewelcomeString();

	});

	function gridCheckCustomButtonClick(s, e) {
	    s.GetRowValues(e.visibleIndex, "PolicyID", getTheSelectedRowsValues);	    
	}

	function getTheSelectedRowsValues(selectedValues) {
	    if (selectedValues.length == 0) {
	        //
	    }
	    else {
	        var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=1000px;dialogHeight=800px;center=yes;help=no";
	        var querystring;
	        querystring = "CarPolicyInput.aspx?pagemode=audit&id=" + selectedValues;
	        window.showModalDialog(querystring, self, myArguments);
	    }
	}

	function Carrier_SelectedIndexChanged(s, e) {
	    var thejsonstring = dxeddlCarrierId.GetSelectedItem().value;
	    dxeddlBranchId.PerformCallback(thejsonstring);
	}
	
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <table style="width:100%"> 
        <tr>
            <td style="height:40px; width:45%;">
            </td>
            <td style="height:40px; width:55%;text-align:left;color:#0E5ED5;">
                ��ǰλ�ã�ѯ�۵�����&nbsp;&nbsp;
                <asp:label id="LbUserNameTop" runat="server" Text="����"></asp:label>�����ã�������
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
                        <div style="float:left; margin-left:5px;">������Ŀ</div>
                        <div style="float:left; margin-left:5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(չ��)</asp:Label>
                        </div>
                        
                    </div>
                </asp:Panel>                           
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                    
                     <table>
                        <tr>
                            <td style="width: 70px; text-align: right;">
                                ѯ�۵��ţ�
                            </td>
                            <td style="width: 150px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtAskPriceID" ClientInstanceName="dxetxtAskPriceID" runat="server" Width="140px"></dxe:ASPxTextBox>
                            </td>
                            <td style="width: 70px; text-align: right;">
                                Ͷ����ţ�
                            </td>
                            <td style="width: 150px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server" Width="140px"></dxe:ASPxTextBox>
                            </td>
                            <td style="width: 70px; text-align: right;">
                                Ͷ���ͻ���
                            </td>
                            <td style="width: 150px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCustomer" ClientInstanceName="dxetxtCustomer" runat="server" Width="140px"></dxe:ASPxTextBox> 
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                ���ţ�
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server" Width="140px" DropDownStyle="DropDownList">
									<Items>
									</Items>
								</dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                �ͻ�����
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlSalesId" ClientInstanceName="dxeddlSalesId" runat="server" Width="140px" DropDownStyle="DropDownList">
									<Items>
									</Items>
								</dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                ���ƺţ�
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCarCount" ClientInstanceName="dxetxtCarCount" runat="server" Width="140px"></dxe:ASPxTextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                ҵ����Դ��
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlSourceTypeID" ClientInstanceName="dxeddlSourceTypeID" runat="server" Width="140px" DropDownStyle="DropDownList">
									<Items>
									</Items>
								</dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                ҵ�����ʣ�
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlOperationType" ClientInstanceName="dxeddlOperationType" runat="server" Width="140px" DropDownStyle="DropDownList">
									<Items>
									</Items>
								</dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                ¼���ˣ�
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCreatePerson" ClientInstanceName="dxetxtCreatePerson" runat="server" Width="140px"></dxe:ASPxTextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                ���չ�˾��
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlCarrierId" ClientInstanceName="dxeddlCarrierId" runat="server" Width="140px" DropDownStyle="DropDownList">
									<Items>										
									</Items>
									<ClientSideEvents SelectedIndexChanged="Carrier_SelectedIndexChanged" />
								</dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                ��֧������
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlBranchId" ClientInstanceName="dxeddlBranchId" runat="server" Width="140px" DropDownStyle="DropDownList" OnCallback="CarrierBranchIDCallback">
									<Items>										
									</Items>
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
                                ¼�����ڣ�
                            </td>
                            <td style="text-align: left;" colspan="3">
                                <table style="margin-left:-3px;">
                                    <tr>
                                        <td>
                                            <dxe:ASPxDateEdit ID="dxeStartDate" runat="server" Width="140px">
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td>��</td>
                                        <td>
                                            <dxe:ASPxDateEdit ID="dxeEndDate" runat="server" Width="140px">
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>                                
                            </td>
                            
                            <td style="text-align: right;" colspan="2">
                                <asp:Button ID="btnSearch" runat="server" Text="��ѯ" CssClass="input_2" OnClick="btnSearch_Click" />&nbsp;
                                <input type="reset" value="����" name="btnReset" id="btnReset" class="input_2" />&nbsp;
                                <asp:Button ID="btnExport" runat="server" Text="Excel" OnClick="btnXlsExport_Click" CssClass="input_2" />
                            </td>
                            <td></td>
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
                    ExpandedText="(չ��)"
                    CollapsedText="(����)"
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
                        <div style="float: left; margin-left:5px;">�������</div>
                        <div style="float: left; margin-left:5px;">
                            <asp:Label ID="lbl_npSearchResultHeader" runat="server">(չ��)</asp:Label>
                        </div>
                        
                    </div>
                </asp:Panel>  
                <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                      
                      <table style="width:100%">
                                           <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server"
                                                        DataSourceID="ds_gridSearchResult"
                                                        KeyFieldName="PolicyID" AutoGenerateColumns="False" Settings-ShowFooter="true"
                                                        Width="100%" SettingsPager-AlwaysShowPager="true" 
                                                        OnRowDeleting="gridSearchResult_RowDeleting" 
                                                        OnCustomCallback="gridSearchResult_CustomCallback" 
                                                        >
                                                        <%-- BeginRegion Columns --%>
                                                        <Columns>
                                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False">
                                                                <NewButton Visible="False" />
                                                                <EditButton Visible="False" />
                                                                <DeleteButton Visible="false" />
                                                                <CustomButtons>
                                                                    <dxwgv:GridViewCommandColumnCustomButton Text="���">
                                                                    </dxwgv:GridViewCommandColumnCustomButton>
                                                                </CustomButtons>
                                                            </dxwgv:GridViewCommandColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="AskPriceID" Caption="ѯ�۵���" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="PolicyID" Caption="Ͷ������" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="�������" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="PrevPolicyID" Caption="���ĵ���" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="CarNo" Caption="���ƺ���" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="UserNameCn" Caption="�ͻ�����" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="CarrierNameCn" Caption="���չ�˾" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="��֧����" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="CiPremium" Caption="��ҵ�ձ���" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="AciPremium" Caption="��ǿ�ձ���" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="CstPremium" Caption="����˰" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="CiProcess" Caption="��ҵ�վ��ͷ�" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="AciProcess" Caption="��ǿ�վ��ͷ�" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="CustName" Caption="Ͷ���ͻ�" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="CreatePerson" Caption="¼����" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataDateColumn FieldName="CreateTime" Caption="¼������" CellStyle-Wrap="False"
                                                                PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                                            </dxwgv:GridViewDataDateColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="SourceTypeName" Caption="ҵ����Դ" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="OperationTypeName" Caption="ҵ������" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="GatheringTypeName" Caption="�տʽ" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                            <dxwgv:GridViewDataDateColumn FieldName="StartDate" Caption="����������" CellStyle-Wrap="False"
                                                                PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                                            </dxwgv:GridViewDataDateColumn>
                                                            <dxwgv:GridViewDataDateColumn FieldName="EndDate" Caption="������ֹ����" CellStyle-Wrap="False"
                                                                PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                                            </dxwgv:GridViewDataDateColumn>
                                                            <dxwgv:GridViewDataColumn FieldName="Remark" Caption="��˱�ע" CellStyle-Wrap="False">
                                                            </dxwgv:GridViewDataColumn>
                                                        </Columns>
                                                        <Settings ShowGroupPanel="true" ShowFooter="True" ShowGroupFooter="VisibleAlways" />
                                                        <SettingsBehavior AllowDragDrop="false" AllowGroup="false" />
                                                        <TotalSummary>
                                                            <dxwgv:ASPxSummaryItem FieldName="PolicyID" SummaryType="Count" DisplayFormat="#" /> 
                                                            <dxwgv:ASPxSummaryItem FieldName="CiPremium" SummaryType="Sum" DisplayFormat="c" />
                                                            <dxwgv:ASPxSummaryItem FieldName="CiProcess" SummaryType="Sum" DisplayFormat="c" />
                                                            <dxwgv:ASPxSummaryItem FieldName="AciPremium" SummaryType="Sum" DisplayFormat="c" />
                                                            <dxwgv:ASPxSummaryItem FieldName="AciProcess" SummaryType="Sum" DisplayFormat="c" />
                                                            <dxwgv:ASPxSummaryItem FieldName="CstPremium" SummaryType="Sum" DisplayFormat="c" />                                                                               
                                                        </TotalSummary>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" />
                                                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCheckCustomButtonClick(s,e);return false;}" />
                                                    </dxwgv:ASPxGridView>
                                                    <dxwgv:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridSearchResult"></dxwgv:ASPxGridViewExporter>
                                                    <asp:ObjectDataSource ID="ds_gridSearchResult" runat="server" 
                                                        SelectMethod="FetchPolicyList"
                                                        TypeName="BusinessObjects.Policy.BO_Policy" 
                                                        EnablePaging="false"  CacheDuration="1"                                                                                                                                                      
                                                        >
                                                        <SelectParameters> 
                                                             <asp:Parameter Name="sWhere" Type="String" Direction="Input" DefaultValue=" and ISNULL(B.PolicyStatus,'0') = '1' and ISNULL(B.AskPriceID,'') != '' " />
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
                    ExpandedText="(չ��)"
                    CollapsedText="(����)"
                    ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>                      
     </table>
     
</asp:Content>
