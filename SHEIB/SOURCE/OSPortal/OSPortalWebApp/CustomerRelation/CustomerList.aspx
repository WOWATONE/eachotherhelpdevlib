<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true"
    Theme="Aqua" CodeBehind="CustomerList.aspx.cs" Inherits="OSPortalWebApp.CustomerRelation.CustomerList"
    Title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>�ͻ�¼���б�</title>

    <script type="text/javascript">
        function btnCreateClick() {
	        var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("Customer.aspx", self, myArguments);
        } 
        
        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            window.showModalDialog("Customer.aspx", self, myArguments);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width: 100%;">
        <tr>
            <td style="height: 40px; width: 100%;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 55px;">
                            <dxe:ASPxButton ID="debtnCreate" runat="server" Text="�½�" AutoPostBack="False">
                                <ClientSideEvents Click="btnCreateClick" />
                            </dxe:ASPxButton>
                        </td>
                        <td style="width: 55px;">
                            <dxe:ASPxButton ID="debtnPrint" runat="server" Text="��ӡ" AutoPostBack="false">
                                <ClientSideEvents Click="" />
                            </dxe:ASPxButton>
                        </td>
                        <td>
                            <dxe:ASPxButton ID="debtnExport" runat="server" Text="����" AutoPostBack="false">
                                <ClientSideEvents Click="" />
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
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
                            <td style="width: 33%; text-align: left;" colspan="2">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="radPerson" runat="server"
                                    Checked="True" Text="����" GroupName="PersonOrUnit" />&nbsp;&nbsp;<asp:RadioButton
                                        ID="radUnit" runat="server" Text="��λ" GroupName="PersonOrUnit" />
                            </td>
                            <td style="width: 8%; text-align: right;">
                            </td>
                            <td style="width: 25%; text-align: left;">
                            </td>
                            <td style="width: 8%; text-align: right;">
                            </td>
                            <td style="width: 26%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                �ͻ���ţ�
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:TextBox ID="txtCustNo" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                ���ڵ�����
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:DropDownList ID="ddlArea" runat="server" Width="200px">
                                    <asp:ListItem Text="������" Value="1" Selected></asp:ListItem>
                                    <asp:ListItem Text="�Ϻ���" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                �ͻ���ַ��
                            </td>
                            <td style="width: 26%; text-align: left;">
                                <asp:TextBox ID="txtAddress" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                �ͻ����ƣ�
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:TextBox ID="txtCustName" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                ��ҵ���ͣ�
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:DropDownList ID="ddlTradeType" runat="server" Width="200px">
                                    <asp:ListItem Text="��������" Value="1" Selected></asp:ListItem>
                                    <asp:ListItem Text="����" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 8%; text-align: right;">
                                ������飺
                            </td>
                            <td style="width: 26%; text-align: left;">
                                <asp:DropDownList ID="ddlPlate" runat="server" Width="200px">
                                    <asp:ListItem Text="ʯ�ͻ���" Value="1" Selected></asp:ListItem>
                                    <asp:ListItem Text="����" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 8%; text-align: right;">
                                ��֯���������<br />
                                /���֤���룺
                            </td>
                            <td style="width: 25%; text-align: left;">
                                <asp:TextBox ID="txtIDNO" runat="server" Width="200px"></asp:TextBox>
                            </td>
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
                            <td style="width: 26%; text-align: left;">
                                <asp:Button ID="btnSearch" runat="server" Text="��ѯ" CssClass="input_2" />&nbsp;
                                <asp:Button ID="btnCancel" runat="server" Text="����" CssClass="input_2" />&nbsp;
                                <asp:Button ID="btnRefresh" runat="server" Text="ˢ��" CssClass="input_2" />
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
                <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server"
                        KeyFieldName="CustNo" AutoGenerateColumns="False" Settings-ShowFooter="true"
                        Width="100%" SettingsPager-AlwaysShowPager="true" OnRowDeleting="gridSearchResult_RowDeleting"
                        OnRowDeleted="gridSearchResult_RowDeleted">
                        <Columns>
                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False"
                                VisibleIndex="0" Width="20px">
                                <NewButton Visible="False" />
                                <EditButton Visible="False" />
                                <DeleteButton Visible="true" />
                                <CustomButtons>
                                    <dxwgv:GridViewCommandColumnCustomButton Text="�༭">
                                    </dxwgv:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn Caption="�ͻ����" FieldName="CustNo" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="�ͻ�����" FieldName="CustName" VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="���ڵ���" FieldName="Area" VisibleIndex="3">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="�������" FieldName="Plate" VisibleIndex="4">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="�ͻ���ַ" FieldName="Address" VisibleIndex="5">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="��������" FieldName="PostCode" VisibleIndex="6">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="��ҵ����" FieldName="TradeType" VisibleIndex="7">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="����/����" FieldName="IDNO" VisibleIndex="8">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="��һ��ϵ��" FieldName="Contact" VisibleIndex="9">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="�绰" FieldName="Tel" VisibleIndex="10">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="�ֻ�" FieldName="Mobile" VisibleIndex="11">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="����" FieldName="Fax" VisibleIndex="12">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="�����ʼ�" FieldName="Email" VisibleIndex="13">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="�ͻ�����" FieldName="Sales" VisibleIndex="14">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" Summary-Text="��{0}ҳ,��{1}ҳ" />
                        <Settings ShowGroupPanel="false" />
                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
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
