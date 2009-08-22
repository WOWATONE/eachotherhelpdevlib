<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="Carrier.aspx.cs" Inherits="BrokerWebApp.schemasetting.Carrier" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保险公司信息</title>
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
    <dxtc:ASPxPageControl ID="carrierInfoTabPage" 
        ClientInstanceName="carrierInfoTabPage" runat="server" 
        EnableHierarchyRecreation="True" Width="100%" ActiveTabIndex="0">
        <TabPages>
            <dxtc:TabPage Name="BasicInfo" Text="基本资料">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl1" runat="server">
                        <label id="lblerrmsg" name="lblerrmsg" runat="server" class="red" visible="false"></label>
                        <table style="width:80%">
                            <tr>
                                <td style="width:240px; text-align:right;">
                                    保险公司编号：</td>
                                <td style="width:240px; text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtCarrierID" ClientInstanceName="dxetxtCarrierID" runat="server" Width="160px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox></td>
                                <td style="width:80px; text-align:right;">
                                   公司名称(中文)：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtShortName" ClientInstanceName="dxetxtShortName" runat="server" Width="160px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    公司简称：</td>
                                <td style="text-align:left;" colspan="3">
                                    <dxe:ASPxTextBox ID="dxetxtCarrierNameCn" ClientInstanceName="dxetxtCarrierNameCn" runat="server" Width="480px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    公司名称(英文)：</td>
                                <td style="text-align:left;" colspan="3">
                                    <dxe:ASPxTextBox ID="dxetxtCarrierNameEn" ClientInstanceName="dxetxtCarrierNameEn" runat="server" Width="480px"></dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    业务类型：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxComboBox ID="dxeddlInsType" ClientInstanceName="dxeddlInsType" runat="server" Width="160px" DropDownStyle="DropDownList"></dxe:ASPxComboBox>
                                </td>
                                <td style="text-align:right;">
                                    行政级别：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxComboBox ID="dxeddlGrdType" ClientInstanceName="dxeddlGrdType" runat="server" Width="160px" DropDownStyle="DropDownList"></dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    所在省：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxComboBox ID="dxeddlProvince" ClientInstanceName="dxeddlProvince" runat="server" Width="160px" DropDownStyle="DropDownList"></dxe:ASPxComboBox>
                                </td>
                                <td style="text-align:right;"></td>
                                <td style="text-align:left;"></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    地址：</td>
                                <td style="text-align:left;" colspan="3">
                                    <dxe:ASPxTextBox ID="dxetxtAddress" ClientInstanceName="dxetxtAddress" runat="server" Width="480px"></dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    电话：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtTel" ClientInstanceName="dxetxtTel" runat="server" Width="160px"></dxe:ASPxTextBox></td>
                                <td style="text-align:right;">
                                    邮编：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtPostcode" ClientInstanceName="dxetxtPostcode" runat="server" Width="160px"></dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    传真：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtFax" ClientInstanceName="dxetxtFax" runat="server" Width="160px"></dxe:ASPxTextBox></td>
                                <td style="text-align:right;">
                                    联系人：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtContact" ClientInstanceName="dxetxtContact" runat="server" Width="160px"></dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    电子邮箱：</td>
                                <td style="text-align:left;" colspan="3">
                                    <dxe:ASPxTextBox ID="dxetxtEmail" ClientInstanceName="dxetxtEmail" runat="server" Width="480px"></dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    公司网址：</td>
                                <td style="text-align:left;" colspan="3">
                                    <dxe:ASPxTextBox ID="dxetxtURL" ClientInstanceName="dxetxtURL" runat="server" Width="480px"></dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    保险编号串：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtPolicyNoHeader" ClientInstanceName="dxetxtPolicyNoHeader" runat="server" Width="160px"></dxe:ASPxTextBox></td>
                                <td style="text-align:right;">
                                    </td>
                                <td style="text-align:left;">
                                    </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="AdditionalInfo" Text="附加资料">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl2" runat="server">
                        <table style="width:80%">
                            <tr>
                                <td style="width:240px; text-align:right;">
                                    开户银行：</td>
                                <td style="text-align:left;" colspan="3">
                                    <dxe:ASPxTextBox ID="dxetxtBankName" ClientInstanceName="dxetxtBankName" runat="server" Width="480px"></dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="width:240px; text-align:right;">
                                    银行账号：</td>
                                <td style="text-align:left;" colspan="3">
                                    <dxe:ASPxTextBox ID="dxetxtBankAccount" ClientInstanceName="dxetxtBankAccount" runat="server" Width="480px"></dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="width:240px; text-align:right;">
                                    盈利水平：</td>
                                <td style="width:240px; text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtPayoffLevel" ClientInstanceName="dxetxtPayoffLevel" runat="server" Width="160px"></dxe:ASPxTextBox></td>
                                <td style="width:80px; text-align:right;">
                                    赔付率：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtLossRation" ClientInstanceName="dxetxtLossRation" runat="server" Width="160px"></dxe:ASPxTextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    保费规模：</td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtPremiumSize" ClientInstanceName="dxetxtPremiumSize" runat="server" Width="160px"></dxe:ASPxTextBox></td>
                                <td style="text-align:right;"></td>
                                <td style="text-align:left;"></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    公司简介：</td>
                                <td style="text-align:left;" colspan="3">
                                    <asp:TextBox ID="txtProfile" runat="server" TextMode="MultiLine" 
                                        style="width:480px;" Rows="8"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    备注：</td>
                                <td style="text-align:left;" colspan="3">
                                    <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" 
                                        style="width:480px;" Rows="4"></asp:TextBox>
                                </td>
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