<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="ProductTypeList.aspx.cs" Inherits="OSPortalWebApp.ProductSetup.ProductTypeList" Title="" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register assembly="DevExpress.Web.ASPxTreeList.v8.3" namespace="DevExpress.Web.ASPxTreeList" tagprefix="dxwtl" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v8.3" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v8.3" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>险种</title>
    <script type="text/javascript">
        function cpSchemaDetail_Init() {
            var pageNumber = cpSchemaDetail.cpPageIndex + 1;
            var isFirst = (cpSchemaDetail.cpPageIndex == 0);
            var isLast = (cpSchemaDetail.cpPageIndex == (cpSchemaDetail.cpPageCount - 1));
            //lbPageInfo.SetText('Page: ' + pageNumber + ' of ' + CallbackPanel.cpPageCount);
            //btPrev.SetEnabled(!isFirst);
            //btNext.SetEnabled(!isLast);
        }
        
        function cpSchemaDetail_OnEndCallback() {
        //
        }     
        
        function menuClick(type) {
            var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("ProductType.aspx?Type="+type, self, myArguments);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="height:500px;" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="3" style="text-align:left;">
                <asp:Panel ID="npoperation" runat="server" CssClass="allborderPanel" Height="25px"> 
                    &nbsp;<input type="button" value="增加险种" class="input_2" onclick="javascript:menuClick('addProduct');" />
                    &nbsp;<input type="button" value="修改险种" class="input_2" onclick="javascript:menuClick('editProduct');"  />
                    &nbsp;<input type="button" value="删除险种" class="input_2"/>
                    &nbsp;<input type="button" value="增加项目" class="input_2" onclick="javascript:menuClick('addProductType');" />
                    &nbsp;<input type="button" value="修改项目" class="input_2" onclick="javascript:menuClick('editProductType');"  />
                    &nbsp;<input type="button" value="删除项目" class="input_2" />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td valign="top">

            <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" 
                Width="400px" Height="500px" View="GroupBox" ShowHeader="False">
                 <PanelCollection>
                     <dxp:panelcontent ID="Panelcontent1" runat="server">
                         
                         <dxwtl:ASPxTreeList ID="treeList" ClientInstanceName="treeList" runat="server" Width="100%" SummaryText="Summary">
                             <Columns>
                                 <dxwtl:TreeListTextColumn FieldName="Name">
                                     <PropertiesTextEdit EncodeHtml="True" />
                                 </dxwtl:TreeListTextColumn>                        
                             </Columns>
                             <Settings ShowColumnHeaders="false" />  
                             <SettingsBehavior AllowFocusedNode="True"/>   
                             <Styles>
                                <Indent BackColor="Transparent" />
                                <IndentWithButton BackColor="Transparent" />
                                <Node BackColor="Transparent" />
                                <Cell>
                                    <Paddings PaddingLeft="1px" />
                                </Cell>
                            </Styles>
                            <Templates>
                                <DataCell>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td></td>
                                            <td> </td>
                                            <td style="padding-bottom: 1px;"><%# Container.Text %></td>
                                        </tr>
                                    </table>                            
                                </DataCell>
                            </Templates>
                            <Border BorderWidth="0" />
                         </dxwtl:ASPxTreeList>
                         
                     </dxp:panelcontent>
                 </PanelCollection>
             </dxrp:ASPxRoundPanel>

        </td>
        
        <td>
            <div class="Spacer" style="width: 16px;"></div>
        </td>

        <td valign="top">
            <dxrp:ASPxRoundPanel id="ASPxRoundPanel2" runat="server" ShowHeader="False" Width="100%">
                <PanelCollection>
                    <dxrp:PanelContent ID="PanelContent2" runat="server">                 
                    
                    <dxcp:ASPxCallbackPanel runat="server" ID="cpSchemaDetail" ClientInstanceName="cpSchemaDetail" 
                    Height="500px" Width="455px" 
                    OnCallback="cpSchemaDetail_Callback" 
                    OnCustomJSProperties="cpSchemaDetail_CustomJSProperties">
                     <ClientSideEvents 
                        Init="function(s, e) { cpSchemaDetail_Init(); }" 
                        EndCallback="cpSchemaDetail_OnEndCallback"></ClientSideEvents>
                     <PanelCollection>
                     <dxrp:PanelContent ID="PanelContent3" runat="server">
                        <dxp:ASPxPanel EnableTheming="true" runat="server">
                            <Border BorderColor="#AECAF0" BorderWidth="1px" />
                            <Paddings Padding="2px" />
                            <PanelCollection>
                                <dxp:PanelContent>
                                    <table width="100%" cellpadding="5px" >
                                        <tr>
                                            <td style="text-align:right;">上级险种：</td>
                                            <td style="text-align:left;">C00002-家庭财产保险</td>
                                            <td style="text-align:right;"></td>
                                            <td style="text-align:left;"></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:right;">险种编号：</td>
                                            <td style="text-align:left;">C00002001</td>
                                            <td style="text-align:right;"></td>
                                            <td style="text-align:left;"></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:right;">险种名称：</td>
                                            <td style="text-align:left;">人保普通型家庭财产综合保险</td>
                                            <td style="text-align:right;"></td>
                                            <td style="text-align:left;"></td>
                                        </tr>                                        
                                        <tr>
                                            <td style="text-align:right;">险种大类：</td>
                                            <td style="text-align:left;">家财险</td>
                                            <td style="text-align:right;">标的类别：</td>
                                            <td style="text-align:left;">财产险类</td>
                                        </tr>                                        
                                    </table>
                                </dxp:PanelContent>
                            </PanelCollection>
                        </dxp:ASPxPanel>
                        <table width="100%">                            
                            <tr>
                                <td>
                                    
                                    <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server" 
                                                    KeyFieldName="ProdID" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="项目编号" FieldName="ProdNo" 
                                                VisibleIndex="0">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="项目名称" FieldName="ProdName" 
                                                VisibleIndex="1">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="保费费率" FieldName="PremiumRate" 
                                                VisibleIndex="2">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="是否主险" FieldName="FlagMain" 
                                                VisibleIndex="3">
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" 
                                            Summary-Text="第{0}页,共{1}页" >
                                           <Summary Text="第{0}页,共{1}页" />
                                        </SettingsPager>
                                        <Settings ShowGroupPanel="false" />
                                    </dxwgv:ASPxGridView>
                                    
                                </td>
                            </tr>
                        </table>

                     </dxrp:PanelContent>
                     </PanelCollection>
                 </dxcp:ASPxCallbackPanel>

                </dxrp:PanelContent></PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td>
        </tr>
        </table>
</asp:Content>
