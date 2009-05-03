<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="TargetTypeList.aspx.cs" Inherits="OSPortalWebApp.ProductSetup.TargetTypeList" Title="" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register assembly="DevExpress.Web.ASPxTreeList.v8.3" namespace="DevExpress.Web.ASPxTreeList" tagprefix="dxwtl" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v8.3" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v8.3" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>标的</title>
    <script type="text/javascript">
        function menuClick(type) {
            if(type=="addTarget")
            {
                var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=400px;dialogHeight=200px;center=yes;help=no";
                window.showModalDialog("Target.aspx", self, myArguments);
            }
            else{
                var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=400px;dialogHeight=400px;center=yes;help=no";
                window.showModalDialog("TargetProperty.aspx?Type="+type, self, myArguments);
            }
        }
        
        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=400px;dialogHeight=200px;center=yes;help=no";
            window.showModalDialog("Target.aspx", self, myArguments);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="height:500px;Width:800px;" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2" style="text-align:left;width:60%;">
                <asp:Panel ID="Panel1" runat="server" CssClass="allborderPanel" Height="25px"> 
                    &nbsp;<input type="button" value="增加标的" class="input_2" onclick="javascript:menuClick('addTarget');" />
                </asp:Panel>
            </td>
            <td>
                <asp:Panel ID="npoperation" runat="server" CssClass="allborderPanel" Height="25px"> 
                    &nbsp;<input type="button" value="增加描述" class="input_2" onclick="javascript:menuClick('addProperty');" />
                    &nbsp;<input type="button" value="修改描述" class="input_2" onclick="javascript:menuClick('editProperty');"  />
                    &nbsp;<input type="button" value="删除描述" class="input_2"/>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td valign="top">

            <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" 
                Width="400px" Height="500px" View="GroupBox" ShowHeader="False">
                 <PanelCollection>
                     <dxp:panelcontent ID="Panelcontent1" runat="server">
                         <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server" 
                                                    KeyFieldName="TargetTypeID" AutoGenerateColumns="False" 
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

                                    <CellStyle Wrap="False"></CellStyle>
                                </dxwgv:GridViewCommandColumn>
                                 <dxwgv:GridViewDataTextColumn VisibleIndex="0" Caption="标的种类编号" 
                                     FieldName="TypeNo">
                                 </dxwgv:GridViewDataTextColumn>
                                 <dxwgv:GridViewDataTextColumn Caption="标的种类名称" FieldName="TypeName" 
                                     VisibleIndex="1">
                                 </dxwgv:GridViewDataTextColumn>
                             </Columns>
                            <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" 
                                 Summary-Text="第{0}页,共{1}页" >
                            <Summary Text="第{0}页,共{1}页"></Summary>
                             </SettingsPager>
                            <Settings ShowGroupPanel="false" />
                            <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                         </dxwgv:ASPxGridView>
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
                    </dxrp:PanelContent>
                </PanelCollection>
            </dxrp:ASPxRoundPanel>
        </td>
        </tr>
        </table>
</asp:Content>
