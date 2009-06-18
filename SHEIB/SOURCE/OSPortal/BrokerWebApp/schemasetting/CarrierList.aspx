<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="CarrierList.aspx.cs" Inherits="BrokerWebApp.schemasetting.CarrierList" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3.Export" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxMenu" tagprefix="dxm" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v8.3" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保险公司列表</title>
    <script type="text/javascript">
        function btnCreateClick(url) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("Carrier.aspx", self, myArguments);
        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            var carrierID = s.GetDataRow(e.visibleIndex).cells[1].innerText;
            window.showModalDialog("Carrier.aspx?CarrierID=" + carrierID, self, myArguments);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width:100%">
        <tr>
            <td style="height:40px; width:100%;">
                <dxe:ASPxButton ID="debtnCreate" runat="server" Text="新建" AutoPostBack="False">
                    <ClientSideEvents Click="btnCreateClick" />
                </dxe:ASPxButton>
            </td>
        </tr>
        <tr>
            <td style="width:100%;">
                <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                        </div>
                        <div style="float:left; margin-left:5px;">所属项目</div>
                        <div style="float:left; margin-left:5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel> 
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width:80px; text-align: right;">
                                公司编号：
                            </td>
                            <td style="width:170px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCarrierID" ClientInstanceName="dxetxtCarrierID" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td style="width:70px; text-align: right;">
                                公司名称：
                            </td>
                            <td style="width:170px; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCarrierNameCn" ClientInstanceName="dxetxtCarrierNameCn" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: left;">
                                <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" OnClick="btnSearch_Click" />&nbsp;
                                <input type="reset" value="重置" name="btnReset" id="btnReset" class="input_2" />&nbsp;
                                <asp:Button ID="btnXlsExport" runat="server" Text="Excel" OnClick="btnXlsExport_Click" CssClass="input_2" /> 
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
                    ExpandedText="(隐藏)"
                    CollapsedText="(展开)"
                    ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width:100%;">
                <asp:Panel ID="npSearchResultHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                        <div style="float:left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchResultHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                        </div>
                        <div style="float:left; margin-left:5px;">搜索结果</div>
                        <div style="float:left; margin-left:5px;">
                            <asp:Label ID="lbl_npSearchResultHeader" runat="server">(隐藏)</asp:Label>
                        </div>                                    
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                   <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server" 
                                        KeyFieldName="CarrierID" AutoGenerateColumns="False" 
                                        Settings-ShowFooter="true" Width="100%" 
                                        SettingsPager-AlwaysShowPager="true" 
                                        OnRowDeleting="gridSearchResult_RowDeleting" 
                                        OnCustomCallback="gridSearchResult_CustomCallBack">
                        <Columns>
                           <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" Width="20px">
                                <NewButton Visible="False" />
                                <EditButton Visible="False" />                                                                    
                                <DeleteButton Visible="true" />
                                <CustomButtons>
                                    <dxwgv:GridViewCommandColumnCustomButton Text="编辑">                                                                            
                                    </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                </CustomButtons>                                                   
                           </dxwgv:GridViewCommandColumn> 
                           <dxwgv:GridViewDataTextColumn Caption="保险公司编号" FieldName="CarrierID" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                           </dxwgv:GridViewDataTextColumn>
                           <dxwgv:GridViewDataTextColumn Caption="保险公司名称" FieldName="CarrierNameCn" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                           </dxwgv:GridViewDataTextColumn>
                           <dxwgv:GridViewDataTextColumn Caption="行业类型" FieldName="InsType" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                           </dxwgv:GridViewDataTextColumn>
                           <dxwgv:GridViewDataTextColumn Caption="行政级别" FieldName="GrdType" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                           </dxwgv:GridViewDataTextColumn>
                           <dxwgv:GridViewDataTextColumn Caption="省份" FieldName="Province" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                           </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowPager" />
                        <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways" ShowGroupedColumns="true" ShowFilterRow="false" />
                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                        <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                        <SettingsText CustomizationWindowCaption="个性化" />
                        <GroupSummary >
                            <dxwgv:ASPxSummaryItem FieldName="CarrierID" SummaryType="Count" ShowInGroupFooterColumn="CarrierID" DisplayFormat = "总计: {0}" />
                        </GroupSummary>
                        <TotalSummary >
                            <dxwgv:ASPxSummaryItem FieldName="CarrierID" SummaryType="Count" ShowInGroupFooterColumn="CarrierID" DisplayFormat = "总计: {0}" />
                        </TotalSummary>
                   </dxwgv:ASPxGridView>
                   <dxwgv:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridSearchResult"></dxwgv:ASPxGridViewExporter>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearchResult" runat="Server"
                    TargetControlID="npSearchResultDetail"
                    ExpandControlID="npSearchResultHeader"
                    CollapseControlID="npSearchResultHeader" 
                    Collapsed="false"
                    TextLabelID="lbl_npSearchResultHeader"
                    ImageControlID="img_npSearchResultHeader"    
                    ExpandedText="(隐藏)"
                    CollapsedText="(展开)"
                    ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
    </table>
</asp:Content>