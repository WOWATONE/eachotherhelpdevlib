<%@ Page Title="角色定义" Language="C#" Theme="Aqua" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" CodeBehind="RoleManager.aspx.cs" Inherits="BrokerWebApp.schemasetting.RoleManager" %>
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
    <title>角色定义</title>
    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});

            lblCurrentDate.innerHTML = makewelcomeString();

        });

        function btnCreateClick() {
	        
            var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=960px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("RoleEdit.aspx", self, myArguments);
            
        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=960px;dialogHeight=700px;center=yes;help=no";
            
            var buttonID = e.buttonID;
            var guid = s.keys[e.visibleIndex];
            var noint = s.GetDataRow(e.visibleIndex).cells[1].innerText;
            
            var querystring;
            switch(buttonID)
                {
                case "编辑":
                    querystring = "RoleEdit.aspx?id=" + noint;
                    window.showModalDialog(querystring, self, myArguments);
                    break
                case "权限":
                    querystring = "RolePermission.aspx?id=" + guid;
                    window.showModalDialog(querystring, self, myArguments);
                    break
               default:
                 //do nothing;
               }
            
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
                        <td style="height:40px; width:55%;color:#0E5ED5;text-align:left;">
                            当前位置：用户管理&nbsp;
                            <asp:label id="LbUserNameTop" runat="server" Text="王六"></asp:label>，您好！今天是
	                        <label id="lblCurrentDate"></label>					                        
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
													<td style="width:70px;text-align:right; white-space:nowrap;">角色编号：</td>
													<td style="width:110px;text-align:left;">
														<dxe:ASPxTextBox ID="dxetxtRoleNo" ClientInstanceName="txtUserID" runat="server" Width="100px"></dxe:ASPxTextBox>
													</td>
													<td style="width:20px;"></td>
													 <td style="width:70px;text-align:right;white-space:nowrap;">角色名称：</td>
													<td style="width:110px;text-align:left;">
														<dxe:ASPxTextBox ID="dxetxtRoleName" ClientInstanceName="dxetxtUserNameCn" runat="server" Width="100px"></dxe:ASPxTextBox>
													</td>  
													<td style="width:120px;text-align:right;white-space:nowrap;"></td> 
													<td style="width:100px;text-align:left;"></td>                                                                                                
													<td></td>                                                   
												</tr>
												<tr>                                                    
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td style="text-align:right;" colspan="2">
														<asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" OnClick="btnSearch_Click" />&nbsp;
														<input type="reset" value="重置" name="btnReset" id="btnReset" class="input_2" />&nbsp;
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
                                                    DataSourceID="DataSource"
                                                    KeyFieldName="RoleID" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true" 
                                                    OnRowDeleting="gridSearchResult_RowDeleting" 
                                                    OnRowDeleted="gridSearchResult_RowDeleted" 
                                                    OnCustomCallback="gridSearchResult_CustomCallBack"
                                                    OnPageIndexChanged="gridSearchResult_PageIndexChanged"                                                     
                                                    >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False">
                                                                    <NewButton Visible="False" />
                                                                    <EditButton Visible="false" />                                                                    
                                                                    <DeleteButton Visible="true" />
                                                                    <CustomButtons>
                                                                        <dxwgv:GridViewCommandColumnCustomButton Text="编辑">                                                                            
                                                                        </dxwgv:GridViewCommandColumnCustomButton>
                                                                        <dxwgv:GridViewCommandColumnCustomButton Text="权限">
                                                                        </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                                                    </CustomButtons>                                                   
                                                                </dxwgv:GridViewCommandColumn> 
                                                                <dxwgv:GridViewDataColumn FieldName="RoleID" Caption="角色ID" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center" Visible="false">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                               
                                                                <dxwgv:GridViewDataColumn FieldName="RoleNo" Caption="角色编号" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>  
                                                                <dxwgv:GridViewDataColumn FieldName="RoleName" Caption="角色名称" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Remark" Caption="备注" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowPager"   />
                                                        <Settings ShowGroupPanel="true" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways" ShowGroupedColumns="true" ShowFilterRow="false" />
                                                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                                                        <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                                        <SettingsText CustomizationWindowCaption="个性化" />
                                                        <GroupSummary >
                                                            <dxwgv:ASPxSummaryItem FieldName="RoleNo" SummaryType="Count" ShowInGroupFooterColumn="RoleNo" DisplayFormat = "总计: {0}" />
                                                        </GroupSummary>
                                                        <TotalSummary >
                                                            <dxwgv:ASPxSummaryItem FieldName="RoleNo" SummaryType="Count" ShowInGroupFooterColumn="RoleNo" DisplayFormat = "总计: {0}" />
                                                        </TotalSummary>                                                      
                                                    </dxwgv:ASPxGridView> 
                                                    <dxwgv:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridSearchResult"></dxwgv:ASPxGridViewExporter>
                                                    <asp:ObjectDataSource ID="DataSource" runat="server" 
                                                        SelectMethod="FetchList"
                                                        TypeName="BusinessObjects.BO_P_Role" 
                                                        EnablePaging="false"                                                                                                                                                       
                                                        >
                                                        <SelectParameters> 
                                                             
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
