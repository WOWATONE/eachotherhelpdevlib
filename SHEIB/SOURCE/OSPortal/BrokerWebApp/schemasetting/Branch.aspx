<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="Branch.aspx.cs" Inherits="BrokerWebApp.schemasetting.Branch" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保险公司分支机构</title>
    <script type="text/javascript">
        $(document).ready(function() {
            window.onunload = function() {
                var pWindow = window.dialogArguments;
                var thegrid = pWindow.gridSearchResult;

                if (thegrid != null) {
                    thegrid.PerformCallback('');
                }
                else {
                    //do nothing
                }
            };
        });

        function btnCloseClick() {
            window.close();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="BranchTabPage" 
        ClientInstanceName="BranchTabPage" runat="server" 
        EnableHierarchyRecreation="True" Width="100%" ActiveTabIndex="0">
        <TabPages>
            <dxtc:TabPage Name="Branch" Text="分支机构">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl1" runat="server">
                        <label id="lblerrmsg" name="lblerrmsg" runat="server" class="red" visible="false"></label>
                        <table style="width:80%">
                            <tr>
                                <td style="width:240px; text-align:right;">
                                    所属保险公司：</td>
                                <td style="width:240px; text-align:left;">
                                    <dxe:ASPxComboBox ID="dxeddlCarrier" ClientInstanceName="dxeddlCarrier" runat="server" Width="160px" DropDownStyle="DropDownList">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxComboBox></td>
                                <td style="width:80px; text-align:right;">
                                    所在省：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxComboBox ID="dxeddlProvince" ClientInstanceName="dxeddlProvince" runat="server" Width="160px" DropDownStyle="DropDownList">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxComboBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    分支机构简称：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtShortName" ClientInstanceName="dxetxtShortName" runat="server" Width="160px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox></td>
                                <td style="text-align:right;">
                                    编号：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtBranchID" ClientInstanceName="dxetxtBranchID" runat="server" Width="160px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    分支机构全称：</td>
                                <td style="text-align:left;" colspan="3">
                                    <dxe:ASPxTextBox ID="dxetxtBranchName" ClientInstanceName="dxetxtBranchName" runat="server" Width="480px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    详细地址：</td>
                                <td style="text-align:left;" colspan="3">
                                    <dxe:ASPxTextBox ID="dxetxtAddress" ClientInstanceName="dxetxtAddress" runat="server" Width="480px"></dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    联系人：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtContact" ClientInstanceName="dxetxtContact" runat="server" Width="160px"></dxe:ASPxTextBox></td>
                                <td style="text-align:right;">
                                    邮编：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtPostCode" ClientInstanceName="dxetxtPostCode" runat="server" Width="160px"></dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    联系电话：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtTel" ClientInstanceName="dxetxtTel" runat="server" Width="160px"></dxe:ASPxTextBox></td>
                                <td style="text-align:right;">
                                    传真：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtFax" ClientInstanceName="dxetxtFax" runat="server" Width="160px"></dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    电子邮箱：</td>
                                <td style="text-align:left;" colspan="3">
                                    <dxe:ASPxTextBox ID="dxetxtEMail" ClientInstanceName="dxetxtEMail" runat="server" Width="480px"></dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    开户银行：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtBankName" ClientInstanceName="dxetxtBankName" runat="server" Width="160px"></dxe:ASPxTextBox></td>
                                <td style="text-align:right;">
                                    银行账号：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtBankAccount" ClientInstanceName="dxetxtBankAccount" runat="server" Width="160px"></dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    备注：</td>
                                <td style="text-align:left;" colspan="3">
                                    <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" 
                                        style="width:100%;" Rows="4"></asp:TextBox></td>
                            </tr>
                        </table>
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