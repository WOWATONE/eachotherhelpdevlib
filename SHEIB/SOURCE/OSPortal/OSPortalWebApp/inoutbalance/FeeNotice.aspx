<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="FeeNotice.aspx.cs" Inherits="OSPortalWebApp.inoutbalance.FeeNotice" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保费通知书列表</title>
    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});

            lblCurrentDate.innerHTML = makewelcomeString();

        });

        function btnCreateClick() {
	        
                var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
                window.showModalDialog("FeeNoticeAdd.aspx", self, myArguments);
            
        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("FeeNoticeAdd.aspx", self, myArguments);
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <table style="width:100%">
                    <tr>
                        <td style="height:40px; width:45%;">
                            <dxe:ASPxButton ID="debtnCreate" runat="server" Text="新建" AutoPostBack="false">
                                <ClientSideEvents Click="btnCreateClick" />
                            </dxe:ASPxButton>
                        </td>
                        <td style="height:40px; width:55%;">
                            <table style="margin:0px; padding:0px; width:100%; border:0px; text-align:left">
				                        <tr>
					                        <td style="width:100%;PADDING-RIGHT: 20px; text-align:right;color:#0E5ED5;">
					                            当前位置：保费通知书&nbsp;&nbsp;
					                            <asp:label id="LbUserNameTop" runat="server" Text="王六"></asp:label>，您好！今天是
						                        <label id="lblCurrentDate"></label>
					                        </td>
				                        </tr>
	                        </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;" colspan="2"> 
                            <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float: left; vertical-align: middle;">
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
                                                    <td style="width:70px;text-align:right; white-space:nowrap;">保单编号：</td>
                                                    <td style="width:100px;text-align:left;">
                                                        <asp:TextBox ID="txtPolicyNo" runat="server" Width="95px"></asp:TextBox>
                                                    </td>
                                                    <td style="width:20px;"></td>
                                                    <td style="width:120px;text-align:right;white-space:nowrap;">通知书编号：</td>
                                                    <td style="width:100px;text-align:left;">
                                                        <asp:TextBox ID="txtPrePolicyNo" runat="server" Width="95px"></asp:TextBox>
                                                    </td>
                                                    <td style="width:160px;text-align:right;white-space:nowrap;">收费方式：</td> 
                                                    <td style="width:100px;text-align:left;">                                                        
                                                        <asp:DropDownList ID="ddlFeeType" runat="server">
                                                            <asp:ListItem Text="代收" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="直付" Value="2"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td></td>                                                   
                                                </tr>                                                 
                                                <tr>
                                                    <td style="text-align:right;">通知日期：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deStartDate" runat="server">
                                                        </dxe:ASPxDateEdit>                                                       
                                                    </td>
                                                    <td style="text-align:center;">--></td>
                                                    <td style="text-align:left;" colspan="2">
                                                        <dxe:ASPxDateEdit ID="deEndDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="text-align:right;" colspan="2">
                                                        <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" />&nbsp;
                                                        <asp:Button ID="btnCancel" runat="server" Text="重置" CssClass="input_2" />&nbsp;
                                                        <asp:Button ID="btnRefresh" runat="server" Text="刷新" CssClass="input_2" />
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
                                                    KeyFieldName="NoticeId" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true" 
                                                    OnRowDeleting="gridSearchResult_RowDeleting" 
                                                    OnRowDeleted="gridSearchResult_RowDeleted"
                                                    >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" CellStyle-Wrap="False" VisibleIndex="0">
                                                                    <NewButton Visible="False" />
                                                                    <EditButton Visible="false" />                                                                    
                                                                    <DeleteButton Visible="true" />
                                                                    <CustomButtons>
                                                                        <dxwgv:GridViewCommandColumnCustomButton Text="编辑">                                                                            
                                                                        </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                                                    </CustomButtons>                                                   
                                                                </dxwgv:GridViewCommandColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="NoticeId" Visible="false" Caption="通知书GUID" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="NoticeNo" Caption="通知书编号" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>  
                                                                <dxwgv:GridViewDataColumn FieldName="FeeTypeName" Caption="收费方式" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Fee" Caption="应收保费金额" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="NoticeDate" Caption="通知日期" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowPager"   />
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
                                ExpandedText="(展开)"
                                CollapsedText="(隐藏)"
                                ExpandedImage="~/images/collapse_blue.jpg"
                                CollapsedImage="~/images/expand_blue.jpg"
                                SuppressPostBack="true" />
                        </td>
                    </tr>                    
     </table>
     
</asp:Content>
