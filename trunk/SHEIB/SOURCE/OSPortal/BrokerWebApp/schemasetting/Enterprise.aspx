<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="Enterprise.aspx.cs" Inherits="BrokerWebApp.schemasetting.Enterprise" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>企业目录</title>
    
    <script type="text/javascript">
        $(document).ready(function() {
        window.onunload = function() {
                var pWindow = window.dialogArguments;
                pWindow.window.location.reload();
            };
        });

        function btnValidate(s, e) {
            var hidParentId = $("#<%=hidParentId.ClientID %>");
            if (!hidParentId[0] || hidParentId[0] == null)
                return;

            var parentId = hidParentId[0].value;

            if (parentId.length <= 0 || parentId == "0" || parentId == "L0")
                return;

            var custClassifyID = dxetxtCustClassifyID.GetText();
            if (custClassifyID.length <= 0)
                return;

            if (parentId.length > custClassifyID.length) {
                alert("企业目录编号必须以" + parentId + "开头。");
                e.processOnServer = false;
                return false;
            }

            if (parentId == custClassifyID) {
                alert("企业目录编号不能与上级目录编号相同。");
                e.processOnServer = false;
                return false;
            }

            if (custClassifyID.substr(0, parentId.length) != parentId) {
                alert("企业目录编号必须以" + parentId + "开头。");
                e.processOnServer = false;
                return false;
            }

            return true;
        }

        function btnCloseClick() {
            window.close();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="CustClassifyTabPage" 
        ClientInstanceName="CustClassifyTabPage" runat="server" 
        EnableHierarchyRecreation="True" Width="100%" ActiveTabIndex="0">
        <TabPages>
            <dxtc:TabPage Name="AddCustClassify" Text="企业目录">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl1" runat="server">
                        <div style=" text-align:center;">
                            <table style="width:100%;">
                                <tr>
                                    <td style="width:20%; text-align:right;">
                                        &nbsp;
                                        </td>
                                    <td style="width:20%; text-align:right;">
                                       上级目录：</td>
                                    <td style="width:40%; text-align:left;">
                                        <dxe:ASPxTextBox ID="dxetxtParent" ClientInstanceName="dxetxtParent" runat="server" Width="200px" Enabled="false"></dxe:ASPxTextBox>
                                        <input type="hidden" id="hidParentId" name="hidParentId" runat="server" value="" />
                                    </td>
                                    <td style="width:20%; text-align:left;">
                                        <label id="lblerrmsg" name="lblerrmsg" runat="server" class="red" visible="false"></label></td>
                                </tr>
                                <tr>
                                    <td>
                                       &nbsp;</td>
                                    <td style="text-align:right;">
                                       目录分类编号：
                                    </td>
                                    <td style="text-align:left;">
                                        <dxe:ASPxTextBox ID="dxetxtCustClassifyID" ClientInstanceName="dxetxtCustClassifyID" runat="server" Width="200px">
                                            <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										        <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                       &nbsp;</td>
                                    <td style="text-align:right;">
                                       目录分类名称：</td>
                                    <td style="text-align:left;">
                                        <dxe:ASPxTextBox ID="dxetxtCustClassifyName" ClientInstanceName="dxetxtCustClassifyName" runat="server" Width="200px">
                                            <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										        <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width:20%;">
                                       &nbsp;</td>
                                    <td style="text-align:right;">
                                       排序号：</td>
                                    <td style="text-align:left;">
                                        <dxe:ASPxTextBox ID="dxetxtOrderNo" ClientInstanceName="dxetxtOrderNo" runat="server" Width="200px">
                                            <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										        <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                            </ValidationSettings>
                                        </dxe:ASPxTextBox></td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>   
                        </div>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
        </TabPages>
    </dxtc:ASPxPageControl>
    <table style="height: 5px; background-color: #E0EDFF; width: 100%; font-size: 2px;">
        <tr>
            <td>
            </td>
        </tr>
    </table>
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="30px">
        <table style="width: 100%">
            <tr>
                <td style="width: 400px; text-align: left;">
                    &nbsp;
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnBottomSave" Text="保存" 
                        CausesValidation="true" AutoPostBack="false" onclick="dxebtnBottomSave_Click">
                        <ClientSideEvents Click="function(s, e) {btnValidate(s, e);}" />
                    </dxe:ASPxButton> 
                </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnClose" Text="关闭" CausesValidation="false" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnCloseClick();}" />
                    </dxe:ASPxButton>
                </td>                
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
