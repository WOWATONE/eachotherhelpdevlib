<%@ Page Title="用户管理" Language="C#" Theme="Aqua" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" CodeBehind="UserManager.aspx.cs" Inherits="BrokerWebApp.schemasetting.UserManager" %>
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
    
    <title>用户管理</title>
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
            window.showModalDialog("UserEdit.aspx", self, myArguments);
            
        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            //debugger;
            var buttonID = e.buttonID;
            var userid = s.GetDataRow(e.visibleIndex).cells[1].innerText;
            
            var querystring;
            switch(buttonID)
                {
                case "编辑":
                    querystring = "UserEdit.aspx?userid=" + userid;
                    window.showModalDialog(querystring, self, myArguments);
                    break
                case "角色":
                    querystring = "UserRole.aspx?userid=" + userid;
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
													<td style="width:70px;text-align:right; white-space:nowrap;">用户编号：</td>
													<td style="width:110px;text-align:left;">
														<dxe:ASPxTextBox ID="dxetxtUserID" ClientInstanceName="txtUserID" runat="server" Width="100px"></dxe:ASPxTextBox>
													</td>
													<td style="width:20px;"></td>
													 <td style="width:70px;text-align:right;white-space:nowrap;">姓名：</td>
													<td style="width:110px;text-align:left;">
														<dxe:ASPxTextBox ID="dxetxtUserNameCn" ClientInstanceName="dxetxtUserNameCn" runat="server" Width="100px"></dxe:ASPxTextBox>
													</td>  
													<td style="width:120px;text-align:right;white-space:nowrap;">部门：</td> 
													<td style="width:100px;text-align:left;">                                                        
														<dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server" Width="100px" DropDownStyle="DropDownList">
															<Items>
																<dxe:ListEditItem Text="(全部)" Value="" />
																<dxe:ListEditItem Text="业务部" Value="1" />
															</Items>
														</dxe:ASPxComboBox> 
													</td>                                                                                                
													<td></td>                                                   
												</tr> 
												<tr>
													<td style="text-align:right;">身份证号：</td>
													<td style="text-align:left;">
													   <dxe:ASPxTextBox ID="dxetxtIDNo" ClientInstanceName="dxetxtIDNo" runat="server" Width="100px"></dxe:ASPxTextBox>                                                        
													</td>
													<td></td>
													<td style="text-align:right;">性别：</td>
													<td style="text-align:left;">
														<dxe:ASPxComboBox ID="dxeddlSex" ClientInstanceName="dxeddlSex" runat="server" Width="100px" DropDownStyle="DropDownList">
															<Items>
																<dxe:ListEditItem Text="(全部)" Value="" />
																<dxe:ListEditItem Text="男" Value="男" />
																<dxe:ListEditItem Text="女" Value="女" />
															</Items>
														</dxe:ASPxComboBox>
													</td>
													<td style="text-align:right;">职位：</td>
													<td style="text-align:left;">
														<dxe:ASPxTextBox ID="dxetxtTitle" ClientInstanceName="dxetxtTitle" runat="server" Width="100px"></dxe:ASPxTextBox>
													</td>
													<td></td>
												</tr>
												
												<tr>
													<td style="text-align:right;">地址：</td>
													<td style="text-align:left;">
													   <dxe:ASPxTextBox ID="dxetxtAddress" ClientInstanceName="dxetxtAddress" runat="server" Width="100px"></dxe:ASPxTextBox>                                                         
													</td>
													<td></td>
													<td style="text-align:right;">邮编：</td>
													<td style="text-align:left;">
														<dxe:ASPxTextBox ID="dxetxtPostCode" ClientInstanceName="dxetxtPostCode" runat="server" Width="100px"></dxe:ASPxTextBox>
													</td>
													<td style="text-align:right;">电话：</td>
													<td style="text-align:left;">
														<dxe:ASPxTextBox ID="dxetxtTel" ClientInstanceName="dxetxtTel" runat="server" Width="100px"> </dxe:ASPxTextBox>
													</td>
													<td></td>
												</tr>                                                
												<tr>
													<td style="text-align:right;">入司日期：</td>
													<td style="text-align:left;">
														<dxe:ASPxDateEdit ID="dtJoinDateStart" runat="server" Width="100px">
														</dxe:ASPxDateEdit>                                                       
													</td>
													<td style="text-align:center;"></td>
													<td style="text-align:right;">至&nbsp;&nbsp;</td>
													<td style="text-align:left;">
														<dxe:ASPxDateEdit ID="dtJoinDateEnd" runat="server" Width="100px">
														</dxe:ASPxDateEdit>
													</td>
													<td style="text-align:right;">状态：</td>
													<td style="text-align:left;">
														<dxe:ASPxComboBox ID="dxeddlStatus" ClientInstanceName="dxeddlStatus" runat="server" Width="100px" DropDownStyle="DropDownList">
															<Items>
																<dxe:ListEditItem Text="(全部)" Value="" />
																<dxe:ListEditItem Text="在职" Value="在职" />
																<dxe:ListEditItem Text="离职" Value="离职" />
															</Items>
														</dxe:ASPxComboBox>
													</td>
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
                                                    KeyFieldName="UserID" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true" 
                                                    OnRowDeleting="gridSearchResult_RowDeleting" 
                                                    OnRowDeleted="gridSearchResult_RowDeleted" 
                                                    OnCustomCallback="gridSearchResult_CustomCallBack"
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
                                                                        <dxwgv:GridViewCommandColumnCustomButton Text="角色">
                                                                        </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                                                    </CustomButtons>                                                   
                                                                </dxwgv:GridViewCommandColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="UserID" Caption="用户编号" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>  
                                                                <dxwgv:GridViewDataColumn FieldName="DeptName" Caption="部门" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                                  
                                                                <dxwgv:GridViewDataColumn FieldName="UserNameCn" Caption="姓名(中)" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>  
                                                                <dxwgv:GridViewDataColumn FieldName="UserNameEn" Caption="姓名(英)" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Sex" Caption="性别" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="IDNo" Caption="身份证号" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="Birthday" Caption="生日" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="JoinDate" Caption="入司日期" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Title" Caption="职位" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Status" Caption="状态" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Address" Caption="地址" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PostCode" Caption="邮编" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Tel" Caption="电话" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Fax" Caption="传真" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Email" Caption="电子邮件" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CertNo" Caption="执业证号" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Mobile" Caption="手机号码" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Remark" Caption="备注" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowPager"   />
                                                        <Settings ShowGroupPanel="true" ShowVerticalScrollBar="true" ShowGroupFooter="VisibleAlways" ShowGroupedColumns="true" ShowFilterRow="false" />
                                                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                                                        <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                                        <SettingsText CustomizationWindowCaption="个性化" />
                                                        <GroupSummary >
                                                            <dxwgv:ASPxSummaryItem FieldName="UserID" SummaryType="Count" ShowInGroupFooterColumn="UserID" DisplayFormat = "总计: {0}" />
                                                        </GroupSummary>
                                                        <TotalSummary >
                                                            <dxwgv:ASPxSummaryItem FieldName="UserID" SummaryType="Count" ShowInGroupFooterColumn="UserID" DisplayFormat = "总计: {0}" />
                                                        </TotalSummary>
                                                    </dxwgv:ASPxGridView> 
                                                    <asp:ObjectDataSource ID="DataSource" runat="server" 
                                                        SelectMethod="FetchList"
                                                        TypeName="BusinessObjects.BO_P_User" 
                                                        EnablePaging="False" 
                                                        >
                                                        <SelectParameters>                                                             
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                    <dxwgv:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridSearchResult"></dxwgv:ASPxGridViewExporter>
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
