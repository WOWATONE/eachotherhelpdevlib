<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true"
    Theme="Aqua" CodeBehind="SignPremiumBudget.aspx.cs" Inherits="OSPortalWebApp.BudgetManagement.SignPremiumBudget"
    Title="" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>预算清单录入</title>

    <script type="text/javascript">
        function imgPolicyProdTypeClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("../otherinsurance/PolicyProdType.aspx", self, myArguments);
        }
        
        function imgCustNoClick() {
	        var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
	        window.showModalDialog("../CustomerRelation/SelectCustomerNo.aspx", self, myArguments);
	    }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dxtc:ASPxPageControl ID="BudgetTabPage" ClientInstanceName="BudgetTabPage" runat="server"
        EnableHierarchyRecreation="True" Width="100%" ActiveTabIndex="0">
        <TabPages>
            <dxtc:TabPage Name="Budget" Text="预算清单">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl1" runat="server">
                        <table style="width: 80%">
                            <tr>
                                <td style="width: 10%; text-align: right;">
                                </td>
                                <td style="width: 20%; text-align: right;">
                                    客户经理：
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <asp:DropDownList runat="server" ID="ddlSalesID" Width="200px">
                                        <asp:ListItem Text="张三" Value="1" Selected></asp:ListItem>
                                        <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 20%; text-align: right;">
                                    客户名称：
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <asp:TextBox ID="txtCustomerID" runat="server" Width="160px"></asp:TextBox>
                                    <img runat="server" id="imgCustNoSearch" alt="" src="../images/searchicon9.png" style="width:20px; height:20px; vertical-align:top;" onclick="javascript:imgCustNoClick();" /> 
                                </td>
                                <td style="width: 10%; text-align: left;">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; text-align: right;">
                                </td>
                                <td style="width: 20%; text-align: right;">
                                    险种：
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <asp:TextBox ID="txtProdTypeID" runat="server" Width="160px"></asp:TextBox>
                                    <img runat="server" id="imgpeoplesearch" alt="" src="../images/searchicon9.png" style="width: 20px;
                                        height: 20px; vertical-align: top;" onclick="javascript:imgPolicyProdTypeClick();" />
                                </td>
                                <td style="width: 20%; text-align: right;">
                                    业务性质：
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <asp:DropDownList runat="server" ID="ddlOperationType" Width="200px">
                                        <asp:ListItem Text="新增" Value="1" Selected></asp:ListItem>
                                        <asp:ListItem Text="续保" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 10%; text-align: left;">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; text-align: right;">
                                </td>
                                <td style="width: 20%; text-align: right;">
                                    收入类型：
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <asp:DropDownList runat="server" ID="ddlIncomeType" Width="200px">
                                        <asp:ListItem Text="保费" Value="1" Selected></asp:ListItem>
                                        <asp:ListItem Text="佣金" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 20%; text-align: right;">
                                    年月：
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <asp:TextBox ID="txtNY" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width: 10%; text-align: left;">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; text-align: right;">
                                </td>
                                <td style="width: 20%; text-align: right;">
                                    保费预算：
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <asp:TextBox ID="txtPremiumBudget" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width: 20%; text-align: right;">
                                    佣金预算：
                                </td>
                                <td style="width: 20%; text-align: left;">
                                    <asp:TextBox ID="txtProcessBudget" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width: 10%; text-align: left;">
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
        </TabPages>
    </dxtc:ASPxPageControl>
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="25px">
        <table style="width: 100%">
            <tr>
                <td style="text-align: center;">
                    <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="input_2" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
