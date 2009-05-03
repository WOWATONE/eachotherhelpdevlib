<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="NotifyClaim.aspx.cs" Inherits="OSPortalWebApp.CustomerClaim.NotifyClaim" Title="" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v8.3" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel"
    TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>赔案登记</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width:100%">
        <tr>
            <td style="width:100%;">
                <asp:Panel ID="npBaseInfoHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npBaseInfoHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                        </div>
                        <div style="float:left; margin-left:5px;">基本信息</div>
                        <div style="float:left; margin-left:5px;">
                            <asp:Label ID="lbl_npBaseInfoHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npBaseInfoDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width:100%">
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right;">
                                保单号：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtPolicyNo" runat="server" Width="200px"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="查找" CssClass="input_2" /></td>
                            <td style="width:10%; text-align:right;">
                                保险公司：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtCarrier" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:5%; text-align:left;"></td>
                        </tr>
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right;">
                                投保人：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtCustomer" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:10%; text-align:right;">
                                分支机构：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtBranch" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:5%; text-align:left;"></td>
                        </tr>
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right;">
                                被保险人：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtBeneficiary" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:10%; text-align:right;">
                                险种：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtProdType" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:5%; text-align:left;"></td>
                        </tr>
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right;">
                                保险期限：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtStartDate" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:10%; text-align:left;">
                                至</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtEndDate" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:5%; text-align:left;"></td>
                        </tr>
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right;">
                                客户经理：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtSales" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:10%; text-align:right;">
                                </td>
                            <td style="width:35%; text-align:left;">
                                </td>
                            <td style="width:5%; text-align:left;"></td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeBaseInfo" runat="Server"
                    TargetControlID="npBaseInfoDetail"
                    ExpandControlID="npBaseInfoHeader"
                    CollapseControlID="npBaseInfoHeader" 
                    Collapsed="false"
                    TextLabelID="lbl_npBaseInfoHeader"
                    ImageControlID="img_npBaseInfoHeader"    
                    ExpandedText="(隐藏)"
                    CollapsedText="(展开)"
                    ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width:100%;">
                <asp:Panel ID="npNotifyInfoHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                        <div style="float:left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npNotifyInfoHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                        </div>
                        <div style="float:left; margin-left:5px;">报案信息</div>
                        <div style="float:left; margin-left:5px;">
                            <asp:Label ID="lbl_npNotifyInfoHeader" runat="server">(隐藏)</asp:Label>
                        </div>                                    
                    </div>
                </asp:Panel>
                <asp:Panel ID="npNotifyInfoDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width:100%">
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right;">
                                客户向我司<br />报案时间：</td>
                            <td style="width:35%; text-align:left;">
                                <dxe:ASPxDateEdit ID="deNotifyTime" runat="server"/></td>
                            <td style="width:10%; text-align:right;">
                                出险地点：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtAccidentSpot" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:5%; text-align:left;"></td>
                        </tr>
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right;">
                                出险时间：</td>
                            <td style="width:35%; text-align:left;">
                                <dxe:ASPxDateEdit ID="deAccidentTime" runat="server"/></td>
                            <td style="width:10%; text-align:right;">
                                损失性质：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:DropDownList ID="ddlLossType" runat="server" Width="200px">
                                    <asp:ListItem Text="自有财产损失" Value="1" Selected ></asp:ListItem>
                                    <asp:ListItem Text="第三者财产损失" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="第三者人身伤害" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="其他" Value="4"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right;">
                                出险原因：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:DropDownList ID="ddlAccidentReason" runat="server" Width="200px">
                                    <asp:ListItem Text="意外" Value="1" Selected ></asp:ListItem>
                                    <asp:ListItem Text="火灾" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="盗窃" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="台风" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="其他" Value="5"></asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width:10%; text-align:right;">
                                报损金额：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtNotifyLossFee" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:5%; text-align:left;"></td>
                        </tr>
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right;">
                                联系人：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtContactPerson" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:10%; text-align:right;">
                                联系方式：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtContact" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:5%; text-align:left;"></td>
                        </tr>
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right;">
                                状态：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:Button ID="btn1" runat="server" Text="已报案" CssClass="input_2" />&nbsp;&nbsp;
                                <asp:Button ID="btn2" runat="server" Text="资料不全" CssClass="input_2" />&nbsp;&nbsp;
                                <asp:Button ID="btn3" runat="server" Text="资料已齐" CssClass="input_2" />&nbsp;
                                <asp:Button ID="btn4" runat="server" Text="结案" CssClass="input_2" />
                            </td>
                            <td style="width:10%; text-align:right;">
                                </td>
                            <td style="width:35%; text-align:left;">
                                </td>
                            <td style="width:5%; text-align:left;"></td>
                        </tr>
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right; vertical-align:top;">
                                事故描述：</td>
                            <td style="text-align:left;" colspan="3">
                                <asp:TextBox ID="txtAccidentProc" runat="server" TextMode="MultiLine" 
                                    style="width:400px;" Rows="4"></asp:TextBox></td>
                            <td style="width:5%; text-align:left;">
                                </td>
                        </tr>
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right; vertical-align:top;">
                                跟踪记录：</td>
                            <td style="text-align:left;" colspan="3">
                                <asp:TextBox ID="txtAccidentDeal" runat="server" TextMode="MultiLine" 
                                    style="width:400px;" Rows="4"></asp:TextBox></td>
                            <td style="width:5%; text-align:left;">
                                </td>
                        </tr>
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right;">
                                向保险公司<br />报案时间：</td>
                            <td style="width:35%; text-align:left;">
                                <dxe:ASPxDateEdit ID="deNotifyCarrierTime" runat="server"/></td>
                            <td style="width:10%; text-align:right;">
                                报案号：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtNotifyNo" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:5%; text-align:left;"></td>
                        </tr>
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right;">
                                保险公司<br />办理人员：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtCarrierContactPerson" runat="server" Width="80px"></asp:TextBox>&nbsp;&nbsp;
                                联系电话：<asp:TextBox ID="txtCarrierContactPhone" runat="server" Width="80px"></asp:TextBox>
                            </td>
                            <td style="width:10%; text-align:right;">
                                查勘时间：</td>
                            <td style="width:35%; text-align:left;">
                                <dxe:ASPxDateEdit ID="dePerambulateTime" runat="server"/></td>
                            <td style="width:5%; text-align:left;"></td>
                        </tr>
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right; vertical-align:top;">
                                保险公司要求：</td>
                            <td style="text-align:left;" colspan="3">
                                <asp:TextBox ID="txtRequirement" runat="server" TextMode="MultiLine" 
                                    style="width:400px;" Rows="4"></asp:TextBox></td>
                            <td style="width:5%; text-align:left;">
                                </td>
                        </tr>
                        <tr>
                            <td style="width:5%; text-align:right;"></td>
                            <td style="width:10%; text-align:right;">
                                客户经理：</td>
                            <td style="width:35%; text-align:left;">
                                <asp:TextBox ID="txtSales2" runat="server" Width="200px"></asp:TextBox></td>
                            <td style="width:10%; text-align:right;">
                                制单日期:</td>
                            <td style="width:35%; text-align:left;">
                                <dxe:ASPxDateEdit ID="deCreateDate" runat="server"/></td>
                            <td style="width:5%; text-align:left;"></td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeNotifyInfo" runat="Server"
                    TargetControlID="npNotifyInfoDetail"
                    ExpandControlID="npNotifyInfoHeader"
                    CollapseControlID="npNotifyInfoHeader" 
                    Collapsed="false"
                    TextLabelID="lbl_npNotifyInfoHeader"
                    ImageControlID="img_npNotifyInfoHeader"    
                    ExpandedText="(隐藏)"
                    CollapsedText="(展开)"
                    ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width:100%">
                <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="25px">
                    <table style="width:100%">
                        <tr>
                            <td style="text-align:center;">
                                <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="input_2" />
                            </td>                                                                 
                        </tr>
                    </table>     
                </asp:Panel>
            </td>
        </tr>
    </table>             
</asp:Content>
