<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="TargetProperty.aspx.cs" Inherits="OSPortalWebApp.ProductSetup.TargetProperty" Title="" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v8.3" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v8.3" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>标的描述</title>
    <script type="text/javascript">
        function SetPropertyTypeVisible(value)
        {
            if(value == 2)
            { 
                document.getElementById("trEnumTypeNum").style.display = "";
                document.getElementById("trgridSearchResult").style.display = "";
            }
            else
            {
                document.getElementById("trEnumTypeNum").style.display = "none";
                document.getElementById("trgridSearchResult").style.display = "none";
            }
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="TargetPropertyTabPage" 
        ClientInstanceName="TargetPropertyTabPage" runat="server" 
        EnableHierarchyRecreation="True" Width="100%" ActiveTabIndex="0">
        <TabPages>
            <dxtc:TabPage Name="BasicInfo" Text="基本信息">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        
                        <table style="width:100%;">
                            <tr>
                                <td style="width:10px">
                                    &nbsp;</td>
                                <td colspan="2">
                                    标的描述：&nbsp;<asp:TextBox ID="txtPropertyName" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:10px;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width:10px;">
                                    &nbsp;</td>
                                <td colspan="2">
                                    数据类型：</td>
                                <td style="width:10px;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width:10px;">
                                    &nbsp;</td>
                                <td style="width:50%;">
                                    <input type="radio" id="radPropertyType1" name="radPropertyType" checked="checked" onclick="javascript:SetPropertyTypeVisible(1);"/>&nbsp;文字描述
                                    </td>
                                <td style="width:50%;">
                                    <input type="radio" id="radPropertyType2" name="radPropertyType" onclick="javascript:SetPropertyTypeVisible(2);"/>&nbsp;多选一
                                    </td>
                                <td style="width:10px;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width:10px;">
                                    </td>
                                <td style="width:50%;">
                                    <input type="radio" id="radPropertyType3" name="radPropertyType" onclick="javascript:SetPropertyTypeVisible(3);"/>&nbsp;日期</td>
                                <td style="width:50%;">
                                    <input type="radio" id="radPropertyType4" name="radPropertyType" onclick="javascript:SetPropertyTypeVisible(4);"/>&nbsp;是非判断</td>
                                <td style="width:10px;">
                                    &nbsp;</td>
                            </tr>
                            <tr id="trEnumTypeNum">
                                <td style="width:10px;">
                                    &nbsp;</td>
                                <td colspan="2">
                                    选项数目：&nbsp;<asp:TextBox ID="txtEnumTypeNum" runat="server" Width="100px"></asp:TextBox></td>
                                <td style="width:10px;">
                                    &nbsp;</td>
                            </tr>
                            <tr id="trgridSearchResult">
                                <td style="width:10px;">
                                    &nbsp;</td>
                                <td colspan="2">
                                    <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server" 
                                                    KeyFieldName="EnumTypeId" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn FieldName="EnumTypeId" VisibleIndex="0" 
                                                Width="20%" Caption="&nbsp;&nbsp;&nbsp;">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="序号" FieldName="EnumId" VisibleIndex="1" 
                                                Width="30%">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="可选项目" FieldName="EnumValue" 
                                                VisibleIndex="2" Width="50px">
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPager Mode="ShowAllRecords"/>
                                        <Settings ShowGroupPanel="false" />
                                    </dxwgv:ASPxGridView>
                                </td>
                                <td style="width:10px;">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="AdditionalInfo" Text="附加信息">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width:100%;">
                            <tr>
                                <td style="width:10px">
                                    &nbsp;</td>
                                <td colspan="2">
                                    标的编号：&nbsp;<asp:TextBox ID="txtTypeNo" runat="server" Width="200px"></asp:TextBox></td>
                                <td style="width:10px;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width:10px">
                                    &nbsp;</td>
                                <td colspan="2" style="height:5px;">
                                    </td>
                                <td style="width:10px;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width:10px">
                                    &nbsp;</td>
                                <td colspan="2">
                                    标的编号的设置将会在保单标的中用于排序，<br />
                                    排序规则是从小到大</td>
                                <td style="width:10px;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width:10px">
                                    &nbsp;</td>
                                <td colspan="2" style="height:5px;">
                                    </td>
                                <td style="width:10px;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width:10px">
                                    &nbsp;</td>
                                <td colspan="2">
                                    <asp:CheckBox ID="chkMainFlag" runat="server" Text="主标的" />&nbsp;
                                    <asp:CheckBox ID="chkSubFlag" runat="server" Text="副标的" /></td>
                                <td style="width:10px;">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
        </TabPages>
    </dxtc:ASPxPageControl>
    <table style="width:100%;">
        <tr>
            <td style="width:10px">
                    &nbsp;</td>
                <td style="text-align:center;">
                    <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="input_2" /></td>
                <td style="width:10px;">
                    &nbsp;</td>
        </tr>
    </table>
</asp:Content>
