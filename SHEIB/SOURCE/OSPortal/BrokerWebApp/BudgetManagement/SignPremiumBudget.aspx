<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="SignPremiumBudget.aspx.cs" Inherits="BrokerWebApp.BudgetManagement.SignPremiumBudget" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>预算清单录入</title>
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

        function imgSelectCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
            var retrunval = window.showModalDialog("../popupselectrefs/PolicyCustomer.aspx", self, myArguments);

            if (!retrunval || isEmpty(retrunval)) {
                dxetxtCustName.SetValue("");
                setCustomerID("");
            }
            else {
                //split the return value;
                var thesplit_array = retrunval.split(";");
                dxetxtCustName.SetValue(thesplit_array[1]);
                setCustomerID(thesplit_array[0]);
                //
            }
        }

        function setCustomerID(thevalue) {
            var result = $("#<%=hidCustID.ClientID %>");
            result[0].value = thevalue;
        }

        function imgPolicyProdTypeClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=700px;dialogHeight=500px;center=yes;help=no";
            var retrunval = window.showModalDialog("../popupselectrefs/PolicyProdType.aspx", self, myArguments);
            if (!retrunval || isEmpty(retrunval)) {
                dxetxtProdTypeID.SetValue("");
                setProductTypeID("");
            }
            else {
                //split the return value;
                var thesplit_array = retrunval.split(";");
                dxetxtProdTypeID.SetValue(thesplit_array[1]);
                setProductTypeID(thesplit_array[0]);
            }
        }

        function setProductTypeID(thevalue) {
            var result = $("#<%=ptid.ClientID %>");
            result[0].value = thevalue;
        }

        function isEmpty(testVar) {
            if ((testVar == null) || (testVar.length == 0)) {
                return true;
            } else {
                return false;
            }
        }

        function btnCloseClick() {
            window.close();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="BudgetTabPage" ClientInstanceName="BudgetTabPage" runat="server"
        EnableHierarchyRecreation="True" Width="100%" ActiveTabIndex="0">
        <TabPages>
            <dxtc:TabPage Name="Budget" Text="预算清单">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl1" runat="server">
                        <label id="lblerrmsg" name="lblerrmsg" runat="server" class="red" visible="false"></label>
                        <table style="width: 80%">
                            <tr>
                                <td style="width:240px; text-align:right;">
                                    客户名称：
                                </td>
                                <td style="width:160px; text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtCustName" ClientInstanceName="dxetxtCustName" runat="server" Width="160px" ReadOnly="true">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="必填项" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox>
                                    <input type="hidden" id="hidCustID" name="hidCustID" runat="server" />
                                </td>
                                <td style="width:25px; text-align:left;">
                                    <img runat="server" id="imgSelectCustomer" onclick="imgSelectCustomerClick();" alt="" src="../images/searchicon9.png" style="width: 20px; height: 20px; vertical-align: middle;" />
                                </td>
                                <td style="width:80px; text-align:right;">
                                    客户经理：
                                </td>
                                <td style="text-align:left;">
                                    <dxe:ASPxComboBox ID="dxeddlSalesID" ClientInstanceName="dxeddlSalesID" runat="server" Width="160px" DropDownStyle="DropDownList">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="必填项" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    保险险种：
                                </td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtProdTypeID" ClientInstanceName="dxetxtProdTypeID" runat="server" Width="160px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="必填项" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox> 
                                    <input type="hidden" id="ptid" name="ptid" runat="server" /> 
                                </td>
                                <td style="text-align:left;">
                                    <img runat="server" id="img1" alt="" src="../images/searchicon9.png" style="width:20px; height:20px; vertical-align:middle;" onclick="imgPolicyProdTypeClick();" /> 
                                </td>
                                <td style="text-align:right;">
                                    业务性质：
                                </td>
                                <td style="text-align:left;">
                                    <dxe:ASPxComboBox ID="dxeddlOperationType" ClientInstanceName="dxeddlOperationType" runat="server" DropDownStyle="DropDownList"  Width="160px">
                                        <Items>
                                            <dxe:ListEditItem Text="新增" Value="1" />
                                            <dxe:ListEditItem Text="续保" Value="2" />
                                        </Items>
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="必填项" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">
                                    年月：
                                </td>
                                <td style="text-align:left;">
                                    <dxe:ASPxTextBox ID="dxetxtNY" ClientInstanceName="dxetxtNY" runat="server" Width="160px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="必填项" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox>
                                </td>
                                <td style="text-align:left;">
                                    (yyyymm)
                                </td>
                                <td style="text-align:right;">
                                    保单类别：
                                </td>
                                <td style="text-align:left;">
                                    <dxe:ASPxComboBox ID="dxeddlPremiumType" ClientInstanceName="dxeddlPremiumType" runat="server" DropDownStyle="DropDownList"  Width="160px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="必填项" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    保费预算：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtPremiumBudget" ClientInstanceName="dxetxtPremiumBudget" runat="server" Width="160px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="必填项" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox>
                                </td>
                                <td style="text-align:left;">
                                    &nbsp;
                                </td>
                                <td style="text-align: right;">
                                    佣金预算：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dextxtProcessBudget" ClientInstanceName="dextxtProcessBudget" runat="server" Width="160px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										    <RequiredField ErrorText="必填项" IsRequired="True" />                                        
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox>
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
                    <dxe:ASPxButton runat="server" id="dxebtnBottomSave" ClientInstanceName="dxebtnBottomSave" Text="保存"  CausesValidation="true" AutoPostBack="false" onclick="dxebtnBottomSave_Click">
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
