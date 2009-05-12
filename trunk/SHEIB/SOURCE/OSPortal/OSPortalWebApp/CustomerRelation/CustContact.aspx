<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true"
    Theme="Aqua" CodeBehind="CustContact.aspx.cs" Inherits="OSPortalWebApp.CustomerRelation.CustContact"
    Title="" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>��ϵ���б�</title>

    <script type="text/javascript">
	    function imgCustNoClick() {
	        var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
	        window.showModalDialog("SelectCustomerNo.aspx", self, myArguments);
	    }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server" />
    <table style="width: 100%">
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            ������Ŀ</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(����)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="allborderPanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                ��ϵ��������
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:TextBox ID="txtContactName" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                �ͻ����ƣ�
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:TextBox ID="txtCustName" runat="server" Width="200px"></asp:TextBox>
                                <img runat="server" id="imgCustNoSearch" alt="" src="../images/searchicon9.png" style="width: 20px;
                                    height: 20px; vertical-align: top;" onclick="javascript:imgCustNoClick();" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                �ͻ�����
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:DropDownList ID="ddlCusomerManager" runat="server" Width="200px">
                                    <asp:ListItem Text="����" Value="1" Selected></asp:ListItem>
                                    <asp:ListItem Text="����" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 8%; text-align: right;">
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:Button ID="btnSearch" runat="server" Text="��ѯ" CssClass="input_2" />&nbsp;
                                <asp:Button ID="btnCancel" runat="server" Text="����" CssClass="input_2" />&nbsp;
                                <asp:Button ID="btnRefresh" runat="server" Text="ˢ��" CssClass="input_2" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearch" runat="Server" TargetControlID="npSearchDetail"
                    ExpandControlID="npSearchHeader" CollapseControlID="npSearchHeader" Collapsed="false"
                    TextLabelID="lbl_npSearchHeader" ImageControlID="img_npSearchHeader" ExpandedText="(����)"
                    CollapsedText="(չ��)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npSearchResultHeader" runat="server" CssClass="collapsePanelHeader"
                    Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchResultHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            �������</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npSearchResultHeader" runat="server">(����)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel">
                    <dxwgv:ASPxGridView ID="gridContactItem" ClientInstanceName="gridContactItem" runat="server"
                        KeyFieldName="ContactID" Width="100%" AutoGenerateColumns="False">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="��ϵ��GUID" FieldName="ContactID" VisibleIndex="0"
                                Visible="false">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="����" FieldName="ContactName" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="�Ա�" FieldName="Sex" VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="�ͻ�����" FieldName="CustName" VisibleIndex="3">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="ְλ" FieldName="Position" VisibleIndex="4">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="�绰" FieldName="Tel" VisibleIndex="5">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="����" FieldName="Fax" VisibleIndex="6">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="�ֻ�" FieldName="MobilePhone" VisibleIndex="7">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="�����ʼ�" FieldName="Email" VisibleIndex="8">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="�ͻ�����" FieldName="Sales" VisibleIndex="9">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" 
                            Summary-Text="��{0}ҳ,��{1}ҳ" >
                            <Summary Text="��{0}ҳ,��{1}ҳ" />
                        </SettingsPager>
                        <Settings ShowGroupPanel="false" />
                    </dxwgv:ASPxGridView>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearchResult" runat="Server" TargetControlID="npSearchResultDetail"
                    ExpandControlID="npSearchResultHeader" CollapseControlID="npSearchResultHeader"
                    Collapsed="false" TextLabelID="lbl_npSearchResultHeader" ImageControlID="img_npSearchResultHeader"
                    ExpandedText="(����)" CollapsedText="(չ��)" ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
            </td>
        </tr>
    </table>
</asp:Content>
