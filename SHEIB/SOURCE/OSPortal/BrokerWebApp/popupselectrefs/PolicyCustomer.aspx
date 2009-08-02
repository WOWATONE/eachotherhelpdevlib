<%@ Page Title="" Language="C#" Theme="Aqua" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" CodeBehind="PolicyCustomer.aspx.cs" Inherits="BrokerWebApp.popupselectrefs.PolicyCustomer" %>
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
    <title>客户选择</title>
    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});


            window.onunload = function() {
                //var pWindow = window.dialogArguments;
            };





        });
        
        
        function OnGridSelectionChanged(s, e) {
            //            
        }

        
        function OnGridRowClick(s, e) {
            //
        }
        
        function rdoSelected_onclick(theindex) {
            
            //Clear the text selection
            //_aspxClearSelection();
            //Unselect all rows
            gridSearchResult.SelectAllRowsOnPage(false);
            //Select the row
            gridSearchResult.SelectRow(theindex, true);

        }

        function OnEndCallBack(s, e) {

            var rowvalues = gridSearchResult.GetSelectedFieldValues("CustID", OnGetSelectedFieldValues);
            //gridSearchResult.UnselectAllRowsOnPage(false);
            //gridSearchResult.SelectRowOnPage(e.visibleIndex, true);
            //var iindex = gridSearchResult.GetFocusedRowIndex();

        }

        function OnGetSelectedFieldValues(selectedValues) {
            
            if (selectedValues.length == 0) return;
            
            var theselectedKey = selectedValues[0];
            var theselectedID = "rdoSelected" + theselectedKey;            
            var theClientID = gridSearchResult.mainElement.id;
            var inputs = $("#" + theClientID + " INPUT[type='radio']");

            for (i = 0; i < inputs.length; i++) {
                if (inputs[i].id == theselectedID) {
                    inputs[i].checked= true;
                }
                else {
                    //
                }
            }
            // /g 替换所有匹配的字符， /i 忽略大小写
            //newstr=str.replace(/apples/gi, "oranges");
        }

        function btnOk_Click() {

            gridSearchResult.GetSelectedFieldValues("CustID;CustName", getTheSelectedRowsValues);
            
        }

        function getTheSelectedRowsValues(selectedValues) {
            if (selectedValues.length == 0) {
                alert("请先选择行");
                return;
            }
            else {
                window.returnValue = selectedValues[0][0] + ";" + selectedValues[0][1];
                window.close();
            }
        }
        
        
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <table style="width:100%">
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
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
                                        <td>                                        
                                            <table>
                                                <tr style="font-size:1px; height:2px;">
                                                    <td style="width:70px;"></td>
                                                    <td style="width:110px;"></td>
                                                    <td style="width:70px;"></td>
                                                    <td style="width:110px;"></td>
                                                    <td></td>
                                                </tr> 
                                                <tr>
                                                    <td style="text-align:right;">客户名称：</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxTextBox ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server" Width="100px"></dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="text-align:right;"></td>
                                                    <td style="text-align:left;"></td>
                                                    <td></td>                                                    
                                                </tr> 
                                                                                                
                                                <tr>
                                                    <td style="text-align:right;"></td>
                                                    <td style="text-align:left;"></td>
                                                    <td style="text-align:right;" colspan="2">
                                                        <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="input_2" OnClick="btnSearch_Click"/>&nbsp;
                                                        <input type="reset" value="重置" name="btnReset" id="btnReset" class="input_2" />&nbsp;  
                                                        <input type="button" value="确定" name="btnOk" id="btnok" class="input_2" onclick="btnOk_Click();" />                                                      
                                                    </td>
                                                    <td>&nbsp;</td>
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
                                                    DataSourceID="DataSource"
                                                    KeyFieldName="CustID" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true" EnableRowsCache="false" EnableViewState="false"
                                                    OnDataBinding="gridSearchResult_DataBinding" OnPageIndexChanged="gridSearchResult_PageIndexChanged"
                                                    OnHtmlRowCreated="gridSearchResult_HtmlRowCreated"
                                                    >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" Visible="false" VisibleIndex="0">
                                                                     <HeaderTemplate>                                                                         
                                                                     </HeaderTemplate>                                                                     
                                                                     <HeaderStyle Paddings-PaddingTop="1" Paddings-PaddingBottom="1" HorizontalAlign="Center"/>
                                                                 </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataCheckColumn Caption="&nbsp;" FieldName="">
                                                                    <DataItemTemplate>
                                                                        <input type="radio" id="rdoSelected<%# Eval("CustID") %>" name="rdoSelected" onclick="rdoSelected_onclick('<%# Container.ItemIndex %>');" />                                                                                                                                              
                                                                    </DataItemTemplate>
                                                                </dxwgv:GridViewDataCheckColumn>

                                                                <dxwgv:GridViewDataColumn FieldName="CustID" Caption="客户编号" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="CustName" Caption="客户名称" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CustClassifyName" Caption="客户分类" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="SalesName" Caption="客户经理" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Address" Caption="客户地址" CellStyle-Wrap="False" Visible="false">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <Styles>
                                                             <CommandColumn Paddings-PaddingTop="1" Paddings-PaddingBottom="1" HorizontalAlign="Center"></CommandColumn>
                                                        </Styles>
                                                        <SettingsPager Mode="ShowPager"   />
                                                        <Settings ShowGroupPanel="false" ShowVerticalScrollBar="false" ShowGroupFooter="VisibleAlways" ShowGroupedColumns="true" ShowFilterRow="false" />
                                                        <SettingsBehavior AllowFocusedRow="false" ConfirmDelete="true" AutoExpandAllGroups="true" AllowMultiSelection="false" />
                                                        <SettingsText CustomizationWindowCaption="个性化" />
                                                        <GroupSummary >
                                                            <dxwgv:ASPxSummaryItem FieldName="CustName" SummaryType="Count" ShowInGroupFooterColumn="CustName" DisplayFormat = "总计: {0}" />
                                                        </GroupSummary>
                                                        <TotalSummary >
                                                            <dxwgv:ASPxSummaryItem FieldName="CustName" SummaryType="Count" ShowInGroupFooterColumn="CustName" DisplayFormat = "总计: {0}" />
                                                        </TotalSummary>
                                                        <ClientSideEvents SelectionChanged="function(s, e) { OnGridSelectionChanged(s,e); }" RowClick="function(s, e) { OnGridRowClick(s,e); }" EndCallback="function(s, e) { OnEndCallBack(s,e); }" />
                                                        
                                                    </dxwgv:ASPxGridView> 
                                                    <dxwgv:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridSearchResult"></dxwgv:ASPxGridViewExporter>
                                                    <asp:ObjectDataSource ID="DataSource" runat="server" 
                                                        SelectMethod="GetCustomerList"
                                                        TypeName="BusinessObjects.BO_Customer" 
                                                        EnablePaging="false"                                                                                                                                                       
                                                        >
                                                        <SelectParameters> 
                                                             <asp:Parameter Name="sWhere" Type="String" Direction="Input" DefaultValue="" />
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
