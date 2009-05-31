<%@ Page Title="用户角色" Language="C#" Theme="Aqua" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" CodeBehind="UserRole.aspx.cs" Inherits="BrokerWebApp.schemasetting.UserRole" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <title>用户角色</title>
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

        function btnCancelClick() {
            ASPxClientEdit.ClearEditorsInContainer(null);            
        }

        function gridCustomButtonClick(s, e) {
            //
        }

        function btnCloseClick() {
            window.close();
        }

        function dxebtnMoveLeftClick() {
            var direction = "movefromrighttoleft";
            if (dxelbxOther.GetSelectedIndex() < 0) {
                alert("请选择其它角色。");
            }
            else {
                dxebtnMoveLeft.SetEnabled(false);
                dxebtnMoveRight.SetEnabled(false);          
                dxeMoveCallback.PerformCallback(direction);
            }
        }

        function dxebtnMoveRightClick() {
            var direction = "movefromlefttoright";
            //debugger;
            if (dxelbxIn.GetSelectedIndex() < 0) {
                alert("请选择所属角色。");
            }
            else {
                dxebtnMoveLeft.SetEnabled(false);
                dxebtnMoveRight.SetEnabled(false);
                dxeMoveCallback.PerformCallback(direction);
            }
            
        }


        function moveCallbackComplete(s, e) {
            var item;
            var itemIndex;
            if (e.result == "movefromrighttoleft") {
                item = dxelbxOther.GetSelectedItem();
                itemIndex = dxelbxOther.GetSelectedIndex();
                dxelbxIn.AddItem(item.text, item.value);
                dxelbxOther.RemoveItem(itemIndex);
            }
            else {
                item = dxelbxIn.GetSelectedItem();
                itemIndex = dxelbxIn.GetSelectedIndex();
                dxelbxOther.AddItem(item.text, item.value);
                dxelbxIn.RemoveItem(itemIndex);
            }
            dxelbxOther.SetSelectedItem(null);
            dxelbxIn.SetSelectedItem(null);
            dxebtnMoveLeft.SetEnabled(true);
            dxebtnMoveRight.SetEnabled(true);
        }
        
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <dxcb:ASPxCallback ID="dxeMoveCallback" ClientInstanceName="dxeMoveCallback" runat="server" OnCallback="dxeMoveCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {moveCallbackComplete(s,e);}" />        
    </dxcb:ASPxCallback>
    
    <table style="width:100%">
        <tr>
            <td style="width:100%;" colspan="2"> 
                <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                        </div>
                        <div style="float:left; margin-left:5px;">所属项目</div>
                        <div style="float:left; margin-left:5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(展开)</asp:Label>
                        </div>
                        
                    </div>
                </asp:Panel>                           
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table runat="server" id="tblerrmsg" visible="false">
                        <tr>
                            <td style=" width:100px;">&nbsp;</td>
                            <td class="red"></td>
                        </tr>
                    </table>
                    <table>                         
                        <tr>
                            <td style="text-align:right;">用户编号：</td>
                            <td style="text-align:left;">
                               <dxe:ASPxLabel ID="dxelblUserID" runat="server" ClientInstanceName="dxelblUserID"></dxe:ASPxLabel>                                                       
                            </td>
                            <td style="text-align:right;">姓名(中)：</td>
                            <td style="text-align:left;">
                                <dxe:ASPxLabel ID="dxelblUserNameCn" runat="server" ClientInstanceName="dxelblUserNameCn"></dxe:ASPxLabel>
                                <input type="hidden" id="originalUserID" runat="server" />
                            </td>                           
                            <td></td>
                        </tr> 
                        <tr>
                            <td colspan="5">&nbsp;</td>
                        </tr>                                       
                    </table>
                    <table style="width:100%"> 
                        <tr>
                            <td style="text-align:center; width:2%"></td>
                            <td style="text-align:center; width:35%">所属角色</td>
                            <td style="text-align:center; width:25%"></td>
                            <td style="text-align:center;width:35%">其它角色</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <dxe:ASPxListBox ID="dxelbxIn" runat="server" ClientInstanceName="dxelbxIn" Width="300px" Height="500px">
                                    <Items>
                                        
                                    </Items>                                    
                                </dxe:ASPxListBox>
                            </td>
                            <td style="text-align:center; vertical-align:middle;">
                                <dxe:ASPxButton runat="server" id="dxebtnMoveLeft" ClientInstanceName="dxebtnMoveLeft" Text="<<" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) { dxebtnMoveLeftClick(); }" />
                                </dxe:ASPxButton>
                                &nbsp;
                                <dxe:ASPxButton runat="server" id="dxebtnMoveRight" ClientInstanceName="dxebtnMoveRight" Text=">>" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) { dxebtnMoveRightClick(); }" />
                                </dxe:ASPxButton> 
                            </td>
                            <td>
                                <dxe:ASPxListBox ID="dxelbxOther" runat="server" ClientInstanceName="dxelbxOther" Width="300px" Height="500px">
                                    <Items>
                                        
                                    </Items>
                                </dxe:ASPxListBox>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        
                        <tr>
                            <td></td>
                            <td></td>
                            <td style="text-align:center; vertical-align:middle;">
                                <dxe:ASPxButton runat="server" id="dxebtnClose" ClientInstanceName="dxebtnMoveLeft" Text="关闭" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) { btnCloseClick(); }" />
                                </dxe:ASPxButton>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    
                    
                         
                 </asp:Panel>
                 <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearch" runat="Server"
                    TargetControlID="npSearchDetail"
                    ExpandControlID="npSearchHeader"
                    CollapseControlID="npSearchHeader" 
                    Collapsed="false"
                    TextLabelID="lbl_npSearchHeader"
                    ImageControlID="img_npSearchHeader"    
                    ExpandedText="(展开)"
                    CollapsedText="(隐藏)"
                    ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
    </table>
    
</asp:Content>
