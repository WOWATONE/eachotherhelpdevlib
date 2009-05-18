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


        function btnAddPolicyClick() {
            var myArguments = "resizable:no;scroll:yes;status:no;dialogWidth=950px;dialogHeight=500px;center=yes;help=no";
            window.showModalDialog("FeeNoticeAddSelect.aspx", self, myArguments);
            gridPolicyItem.PerformCallback('');
        }
        
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table style="width:100%">
        <tr>
            <td style="width:12%;text-align:right;">收费方式：</td>
            <td style="width:88%;text-align:left;">
                <asp:DropDownList ID="ddlFeeType" runat="server">
                    <asp:ListItem Text="代收" Value="1"></asp:ListItem>
                    <asp:ListItem Text="直付" Value="2"></asp:ListItem>
                </asp:DropDownList> 
            </td>
        </tr>
        <tr>
            <td style="text-align:right;">通知书号：</td>
            <td style="text-align:left;">
                <asp:TextBox ID="txtNoticeNo" runat="server" Width="250px"></asp:TextBox> 
            </td>
        </tr>        
        <tr>
            <td style="text-align:right;">通知日期：</td>
            <td style="text-align:left;">
                <dxe:ASPxDateEdit ID="deNoticeDate" runat="server"></dxe:ASPxDateEdit> 
            </td>
        </tr>
        <tr>
            <td style="text-align:right; vertical-align:top;">对应保单：</td>
            <td style="text-align:left;">
                <dxe:ASPxButton runat="server" ID="btnAddPolicy" AutoPostBack="false" Text="添加保单">
                    <ClientSideEvents Click="btnAddPolicyClick" />
                </dxe:ASPxButton>
            </td>
        </tr>
        <tr>
            <td style="text-align:right; vertical-align:top;"></td>
            <td style="text-align:left;">
                
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
                                                                    <NewButton Visible="false" />
                                                                    <EditButton Visible="false" />
                                                                    <DeleteButton Visible="true" />
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CustomerID" Caption="投保客户" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="投保单号" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="保单号" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Fee" Caption="本次应收保费" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="AccountTypeID" Caption="应收日期" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>     
                                                                <dxwgv:GridViewDataColumn FieldName="Fee" Caption="商业险保费" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="Fee" Caption="交强险保费" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="Fee" Caption="车船税" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>                                                              
                                                            </Columns>
                                                            <Settings ShowGroupPanel="false" ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" />
                                                            <TotalSummary>
                                                                 <dxwgv:ASPxSummaryItem FieldName="PolicyNo" SummaryType="Count" DisplayFormat="#"/>
                                                                 <dxwgv:ASPxSummaryItem FieldName="Fee" SummaryType="Sum" DisplayFormat="c" />
                                                            </TotalSummary>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowAllRecords"/>                                                  
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
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:right;"></td>
            <td style="text-align:left;">&nbsp;</td>
        </tr>
        
        
        <tr>
            <td style="width:100%;text-align:center;" colspan="2">
                <table style="margin:0 0 0 0; padding:0 0 0 0; width:90%;">
                    <tr>
                        <td></td>
                        <td style="width:60px;text-align:left;">
                            <dxe:ASPxButton runat="server" ID="btnSave" Text="保存" AutoPostBack="false"></dxe:ASPxButton>
                        </td>
                        <td style="width:60px;text-align:left;">
                            <dxe:ASPxButton runat="server" ID="ASPxButton1" Text="审核" AutoPostBack="false"></dxe:ASPxButton>
                        </td>
                        <td style="width:70px;text-align:left;">
                            <dxe:ASPxButton runat="server" ID="ASPxButton2" Text="反审核" AutoPostBack="false"></dxe:ASPxButton>
                        </td>
                        <td style="width:100px;text-align:left;">
                            <dxe:ASPxButton runat="server" ID="ASPxButton3" Text="打印单证" AutoPostBack="false"></dxe:ASPxButton>
                        </td>
                        <td style="width:60px;text-align:left;">
                            <dxe:ASPxButton runat="server" ID="btnClose" Text="退出" AutoPostBack="false"></dxe:ASPxButton>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    
</asp:Content>
