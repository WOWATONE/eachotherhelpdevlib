<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="BranchList.aspx.cs" Inherits="OSPortalWebApp.ProductSetup.BranchList" Title="" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxMenu" tagprefix="dxm" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v8.3" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v8.3" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>分支机构列表</title>
    <script type="text/javascript">
	    function menuClick(url) {
            var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("Branch.aspx", self, myArguments);
        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("Branch.aspx", self, myArguments);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width:100%">
        <tr>
            <td style="height:40px; width:60%;">
                <dxm:ASPxMenu EnableViewState="False" EncodeHtml="False" id="dpASPxMenu" 
                    runat="server" AllowSelectItem="True">
                    <Items>
                        <dxm:MenuItem Name="Branch.aspx" Text="新    建">
                        </dxm:MenuItem>
                    </Items>
                    <ClientSideEvents CloseUp="function(s, e) {
                        }" Init="function(s, e) {

                        }" ItemClick="function(s, e) {
                            var name = e.item.name;
                            menuClick(name);
                        }" ItemMouseOut="function(s, e) {
                        }" ItemMouseOver="function(s, e) {
                        }" PopUp="function(s, e) {
                    }" />
                </dxm:ASPxMenu>
            </td>
            <td style="height:40px; width:40%;">
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
                    <table>
                        <tr>
                            <td>
                            保险公司：<asp:DropDownList ID="ddlCarrier" runat="server" Width="200px">
                                        <asp:ListItem Text="全部" Value="1" Selected ></asp:ListItem>
                                        <asp:ListItem Text="中国人保" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="中国平安" Value="3"></asp:ListItem>
                                    </asp:DropDownList>&nbsp;
                            分支简称：<asp:TextBox ID="txtShortName" runat="server" Width="150px"></asp:TextBox>&nbsp;
                            <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" />&nbsp;
                            <asp:Button ID="btnCancel" runat="server" Text="重置" CssClass="input_2" />&nbsp;
                            <asp:Button ID="btnRefresh" runat="server" Text="刷新" CssClass="input_2" />
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
                    <table style="width:100%">
                       <tr>
                           <td>
                               
                               <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server" 
                                                    KeyFieldName="BranchID" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true" 
                                                    OnRowDeleting="gridSearchResult_RowDeleting" 
                                                    OnRowDeleted="gridSearchResult_RowDeleted">
                                   <Columns>
                                       <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" CellStyle-Wrap="False" VisibleIndex="0" Width="10%">
                                            <NewButton Visible="False" />
                                            <EditButton Visible="False" />                                                                    
                                            <DeleteButton Visible="true" />
                                            <CustomButtons>
                                                <dxwgv:GridViewCommandColumnCustomButton Text="编辑">                                                                            
                                                </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                            </CustomButtons>                                                   
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dxwgv:GridViewCommandColumn> 
                                       <dxwgv:GridViewDataTextColumn Caption="保险公司" FieldName="Carrier" 
                                           VisibleIndex="1">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="分支机构编号" FieldName="BranchNo" 
                                           VisibleIndex="2">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="分支结构简称" FieldName="ShortName" 
                                           VisibleIndex="3">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="分支结构全称" FieldName="BranchName" 
                                           VisibleIndex="4">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="联系人" FieldName="Contact" 
                                           VisibleIndex="5">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="电话" FieldName="Telephone" 
                                           VisibleIndex="6">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="地址" FieldName="Address" VisibleIndex="7">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="经纪费率" FieldName="ProcessRate" 
                                           VisibleIndex="8">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="佣金比例" FieldName="Commrate" 
                                           VisibleIndex="9">
                                       </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                   <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" 
                                        Summary-Text="第{0}页,共{1}页" >
                                       <Summary Text="第{0}页,共{1}页" />
                                    </SettingsPager>
                                    <Settings ShowGroupPanel="false" />
                                    <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                               </dxwgv:ASPxGridView>
                               
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
                    ExpandedText="(隐藏)"
                    CollapsedText="(展开)"
                    ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
    </table>
</asp:Content>
