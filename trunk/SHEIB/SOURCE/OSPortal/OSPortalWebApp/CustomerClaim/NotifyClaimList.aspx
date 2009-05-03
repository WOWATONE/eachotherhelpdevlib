<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="NotifyClaimList.aspx.cs" Inherits="OSPortalWebApp.CustomerClaim.NotifyClaimList" Title="" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxMenu" tagprefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保险公司列表</title>
    <script type="text/javascript">
	    function menuClick(url) {
            var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=750px;center=yes;help=no";
            window.showModalDialog("NotifyClaim.aspx", self, myArguments);
        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=750px;center=yes;help=no";
            window.showModalDialog("NotifyClaim.aspx", self, myArguments);
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
                        <dxm:MenuItem Name="NotifyClaim.aspx" Text="新    建">
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
                    <table style="width:90%">
                        <tr>
                            <td style="width:10%; text-align:right;">
                                保单编号：
                            </td>
                            <td style="width:25%; text-align:left;">
                                <asp:TextBox ID="txtPolicyNo" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width:10%; text-align:right;">
                                报案号：
                            </td>
                            <td style="width:25%; text-align:left;">
                                <asp:TextBox ID="txtNotifyNo" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="text-align:left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width:10%; text-align:right;">
                                报案开始日期：
                            </td>
                            <td style="width:25%; text-align:left;">
                                <dxe:ASPxDateEdit ID="deStartNotifyTime" runat="server"></dxe:ASPxDateEdit>
                            </td>
                            <td style="width:10%; text-align:right;">
                                报案结束日期：
                            </td>
                            <td style="width:25%; text-align:left;">
                                <dxe:ASPxDateEdit ID="deEndNotifyTime" runat="server"></dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align:left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width:10%; text-align:right;">
                                出险开始日期：
                            </td>
                            <td style="width:25%; text-align:left;">
                                <dxe:ASPxDateEdit ID="deStartAccidentTime" runat="server"></dxe:ASPxDateEdit>
                            </td>
                            <td style="width:10%; text-align:right;">
                                报案结束日期：
                            </td>
                            <td style="width:25%; text-align:left;">
                                <dxe:ASPxDateEdit ID="deEndAccidentTime" runat="server"></dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align:left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width:10%; text-align:right;">
                                报案人：
                            </td>
                            <td style="width:25%; text-align:left;">
                                <asp:DropDownList ID="ddlNotifyPerson" runat="server" Width="100px">
                                    <asp:ListItem Text="张三" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="王五" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width:10%; text-align:right;">
                                联系人：
                            </td>
                            <td style="width:25%; text-align:left;">
                                <asp:DropDownList ID="ddlContactPerson" runat="server" Width="100px">
                                    <asp:ListItem Text="张三" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="王五" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:left;">
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
                                                    KeyFieldName="NotifyID" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true" 
                                                    OnRowDeleting="gridSearchResult_RowDeleting" 
                                                    OnRowDeleted="gridSearchResult_RowDeleted">
                                   <Columns>
                                       <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                            <NewButton Visible="False" />
                                            <EditButton Visible="False" />                                                                    
                                            <DeleteButton Visible="true" />
                                            <CustomButtons>
                                                <dxwgv:GridViewCommandColumnCustomButton Text="编辑">                                                                            
                                                </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                            </CustomButtons>                                                   
                                        </dxwgv:GridViewCommandColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="理赔编号" FieldName="NotifyID" 
                                           VisibleIndex="1">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="保单编号" FieldName="PolicyNo" 
                                           VisibleIndex="2">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="报案流水号" FieldName="NotifySerialNo" 
                                           VisibleIndex="3">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="报案时间" FieldName="NotifyTime" 
                                           VisibleIndex="4">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="出险时间" FieldName="AccidentTime" 
                                           VisibleIndex="5">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="报案人" FieldName="NotifyPerson" 
                                           VisibleIndex="6">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="报损金额" FieldName="NotifyLossFee" 
                                           VisibleIndex="7">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="联系人" FieldName="ContactPerson" 
                                           VisibleIndex="8">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="报案方式" FieldName="NotifyType" 
                                           VisibleIndex="9">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="报案号" FieldName="NotifyNo" 
                                           VisibleIndex="10">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="查勘时间" FieldName="PerambulateTime" 
                                           VisibleIndex="11">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="结案时间" FieldName="CaseEndTime" 
                                           VisibleIndex="12">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="最终赔付金额" FieldName="LastPayFee" 
                                           VisibleIndex="13">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="免赔额" FieldName="AcquitFee" 
                                           VisibleIndex="14">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="制单人" FieldName="CreatePerson" 
                                           VisibleIndex="15">
                                       </dxwgv:GridViewDataTextColumn>
                                       <dxwgv:GridViewDataTextColumn Caption="制单日期" FieldName="CreateDate" 
                                           VisibleIndex="16">
                                       </dxwgv:GridViewDataTextColumn>
                                   </Columns>
                                   <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" Summary-Text="第{0}页,共{1}页" />
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
