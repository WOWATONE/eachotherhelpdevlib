<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="FeeNoticeAdd.aspx.cs" Inherits="OSPortalWebApp.inoutbalance.FeeNoticeAdd" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v8.3" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dxwsc" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v8.3" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dxhe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <title>保费通知书录入</title>
    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});
            

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
        
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table style="width:100%">
        <tr>
            <td style="width:18%;text-align:right;">确认单号：</td>
            <td style="width:82%;text-align:left;" colspan="2">
                <asp:TextBox ID="txtNoticeNo" runat="server" Width="250px"></asp:TextBox> 
            </td>
        </tr>
        <tr>
            <td style="width:18%;text-align:right;">收费方式：</td>
            <td style="width:82%;text-align:left;" colspan="2">
                <asp:DropDownList ID="ddlFeeType" runat="server">
                    <asp:ListItem Text="代收" Value="1"></asp:ListItem>
                    <asp:ListItem Text="直付" Value="2"></asp:ListItem>
                </asp:DropDownList> 
            </td>
        </tr>
        <tr>
            <td style="width:18%;text-align:right;">通知日期：</td>
            <td style="width:82%;text-align:left;" colspan="2">
                <dxe:ASPxDateEdit ID="deNoticeDate" runat="server"></dxe:ASPxDateEdit> 
            </td>
        </tr>
        <tr>
            <td style="width:18%;text-align:right; vertical-align:top;">相关保单：</td>
            <td style="width:82%;text-align:left;" colspan="2">
                
                                                    <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server" 
                                                    KeyFieldName="PolicyID" Width="100%" AutoGenerateColumns="False" 
                                                    OnRowInserting="gridPolicyItem_RowInserting" 
                                                    OnRowUpdating="gridPolicyItem_RowUpdating" 
                                                    OnRowUpdated="gridPolicyItem_RowUpdated" 
                                                    OnRowInserted="gridPolicyItem_RowInserted"
                                                    OnRowDeleting="gridPolicyItem_RowDeleting" 
                                                    OnRowDeleted="gridPolicyItem_RowDeleted"
                                                     >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;">
                                                                    <NewButton Visible="True" />
                                                                    <EditButton Visible="true" />
                                                                    <DeleteButton Visible="true" />
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CustomerID" Caption="投保客户" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="保单号" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Fee" Caption="本期应收保费金额" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="AccountTypeID" Caption="收费方式" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowAllRecords"/>
                                                        <Settings ShowGroupPanel="false" />                                                        
                                                        <Templates>
                                                             <EditForm>                                                             
                                                             <div style="padding:4px 4px 3px 4px">
                                                                <dxwgv:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                                                             </div>
                                                             <div style="text-align:right; padding:2px 2px 2px 2px">
                                                                 <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server">
                                                                 </dxwgv:ASPxGridViewTemplateReplacement>
                                                                 <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                                                             </div>
                                                             </EditForm>
                                                         </Templates>

                                                    </dxwgv:ASPxGridView>
                                                
            </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td style="width:18%;text-align:right; vertical-align:top;">&nbsp;</td>
            <td style="width:18%;text-align:left; vertical-align:top;">
                <dxe:ASPxButton runat="server" ID="btnMake" Text="生成保费通知书" AutoPostBack="false"></dxe:ASPxButton>
            </td>
            <td style="width:64%;text-align:left; vertical-align:top;">                
            </td>
        </tr>
        <tr>
            <td style="width:18%;text-align:right;"></td>
            <td style="width:82%;text-align:left;" colspan="2">                                                
                <textarea runat="server" id="taModifyMemo" rows="25" cols="72"></textarea>
            </td>
        </tr>
        
        
        <tr>
            <td style="width:18%;text-align:right; vertical-align:top;">&nbsp;</td>
            <td style="width:82%;text-align:left;" colspan="2">
                <table style="margin:0 0 0 0; padding:0 0 0 0; width:100%;">
                    <tr>
                        <td style="width:120px;text-align:left;">
                            <dxe:ASPxButton runat="server" ID="btnSave" Text="保存保费通知书" AutoPostBack="false"></dxe:ASPxButton>
                        </td>
                        <td style="width:60px;text-align:left;">
                            <dxe:ASPxButton runat="server" ID="btnClose" Text="退出" AutoPostBack="false"></dxe:ASPxButton>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </td>
        </tr>
    
    
</asp:Content>
