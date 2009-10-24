<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="NotifyClaim.aspx.cs" Inherits="BrokerWebApp.CustomerClaim.NotifyClaim" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>赔案登记</title>
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
    
	    function imgPolicyNoClick() {
	        //var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
	        //window.showModalDialog("SelectPolicyNo.aspx", self, myArguments);
	    }
	    
	    function CaseEndClick() {
	        //var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
	        //window.showModalDialog("CaseEnd.aspx", self, myArguments);
	    }
	    
	    function ClaimMaterialClick() {
	        //var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
	        //window.showModalDialog("ClaimMaterial.aspx", self, myArguments);
	    }

	    function NotifyPersonLostFocus(s, e) {
	        dxetxtContactPerson.SetText(s.GetText());
	    }

	    function btnCloseClick() {
	        window.close();
	    }
    </script>
    <script type="text/javascript">
        function dxebtnSelectPolicyView_Click(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=1000px;dialogHeight=800px;center=yes;help=no";
            var querystring;
            querystring = "NotifyClaimPolicySelect.aspx";
            window.showModalDialog(querystring, self, myArguments);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <label id="lblerrmsg" name="lblerrmsg" runat="server" class="red" visible="false"></label>
    <table style="width: 100%">
        <tr style="height: 10px;">
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npBaseInfoHeader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npBaseInfoHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            基本信息</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npBaseInfoHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npBaseInfoDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 15%;"><input type="hidden" id="hidPolicyID" name="hidPolicyID" value="" runat="server" /></td>
                            <td style="width: 25%;"></td>
                            <td style="width: 15%;"></td>
                            <td style="width: 25%;"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                保单号：
                            </td>
                            <td style="text-align: left;">
                                <table style="margin-left: -3px; text-align: left;">
                                    <tr>
                                        <td>
                                            <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxTextBox> 
                                        </td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxButton AutoPostBack="False" runat="server" ID="dxebtnSelectPolicyView" ClientInstanceName="dxebtnSelectPolicyView"
                                                Text="选择保单" Style="margin: 0px;" Visible="true" CausesValidation="false">
                                                <ClientSideEvents Click="function(s, e) {dxebtnSelectPolicyView_Click(s,e);return false;}" />
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                                
                            </td>
                            <td style="text-align: right;">
                                保险公司：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCarrierNameCn" ClientInstanceName="dxetxtCarrierNameCn" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxTextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                投保人：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCustName" ClientInstanceName="dxetxtCustName" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                险种：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtProdTypeName" ClientInstanceName="dxetxtProdTypeName" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxTextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                被保险人：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtBeneficiary" ClientInstanceName="dxetxtBeneficiary" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                客户经理：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtUserNameCn" ClientInstanceName="dxetxtUserNameCn" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxTextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                保险期限：
                            </td>
                            <td style="text-align: left;">
                                <table style=" padding-left:-3px; margin-left:-3px;">
                                    <tr>
                                        <td>
                                            <dxe:ASPxTextBox ID="dxetxtStartDate" ClientInstanceName="dxetxtStartDate" runat="server" Width="120px" ReadOnly="true"></dxe:ASPxTextBox>
                                        </td>
                                        <td>至</td>
                                        <td>
                                            <dxe:ASPxTextBox ID="dxetxtEndDate" ClientInstanceName="dxetxtEndDate" runat="server" Width="120px" ReadOnly="true"></dxe:ASPxTextBox>
                                        </td>
                                    </tr>
                                </table>                                
                            </td>
                            <td style="text-align: right;">
                                保费：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtPremiumBase" ClientInstanceName="dxetxtPremiumBase" runat="server" Width="160px" ReadOnly="true"></dxe:ASPxTextBox>
                            </td>
                            <td></td>
                        </tr>                        
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeBaseInfo" runat="Server" TargetControlID="npBaseInfoDetail"
                    ExpandControlID="npBaseInfoHeader" CollapseControlID="npBaseInfoHeader" Collapsed="false"
                    TextLabelID="lbl_npBaseInfoHeader" ImageControlID="img_npBaseInfoHeader" ExpandedText="(隐藏)"
                    CollapsedText="(展开)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npNotifyInfoHeader" runat="server" CssClass="collapsePanelHeader"
                    Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npNotifyInfoHeader" runat="server" ImageUrl="~/images/expand_blue.jpg"
                                AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            报案信息</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npNotifyInfoHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npNotifyInfoDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 5%; text-align: right;">
                            </td>
                            <td style="width: 10%; text-align: right;">
                                报案人：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtNotifyPerson" ClientInstanceName="dxetxtNotifyPerson" runat="server" Width="160px">
                                    <ClientSideEvents LostFocus="function(s ,e) { NotifyPersonLostFocus(s, e) }" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="width: 10%; text-align: right;">
                                报案方式：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlNotifyType" ClientInstanceName="dxeddlNotifyType" runat="server" Width="160px" DropDownStyle="DropDownList">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="width: 5%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; text-align: right;">
                            </td>
                            <td style="width: 10%; text-align: right;">
                                客户向我司<br />
                                报案时间：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxDateEdit ID="deNotifyTime" ClientInstanceName="deNotifyTime" runat="server" Width="160px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 10%; text-align: right;">
                                出险地点：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtAccidentSpot" ClientInstanceName="dxetxtAccidentSpot" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td style="width: 5%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; text-align: right;">
                            </td>
                            <td style="width: 10%; text-align: right;">
                                出险时间：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxDateEdit ID="deAccidentTime" ClientInstanceName="deAccidentTime" runat="server" Width="160px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 10%; text-align: right;">
                                损失性质：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlLossType" ClientInstanceName="dxeddlLossType" runat="server" Width="160px" DropDownStyle="DropDownList">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; text-align: right;">
                            </td>
                            <td style="width: 10%; text-align: right;">
                                出险原因：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlAccidentReason" ClientInstanceName="dxeddlAccidentReason" runat="server" Width="160px" DropDownStyle="DropDownList">
                                    <Items>
                                        <dxe:ListEditItem Text="意外" Value="意外" />
                                        <dxe:ListEditItem Text="火灾" Value="火灾" />
                                        <dxe:ListEditItem Text="盗窃" Value="盗窃" />
                                        <dxe:ListEditItem Text="台风" Value="台风" />
                                        <dxe:ListEditItem Text="其他" Value="其他" />
                                    </Items>
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="width: 10%; text-align: right;">
                                报损金额：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtNotifyLossFee" ClientInstanceName="dxetxtNotifyLossFee" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td style="width: 5%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; text-align: right;">
                            </td>
                            <td style="width: 10%; text-align: right;">
                                联系人：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtContactPerson" ClientInstanceName="dxetxtContactPerson" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td style="width: 10%; text-align: right;">
                                联系电话：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtContactPhone" ClientInstanceName="dxetxtContactPhone" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td style="width: 5%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; text-align: right;">
                            </td>
                            <td style="width: 10%; text-align: right;">
                                状态：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <input type="button" id="btn1" name="btn1" value="已报案" class="input_2" onclick="javascript:ClaimMaterialClick();"/>&nbsp;&nbsp;
                                <input type="button" id="btn2" name="btn2" value="资料不全" class="input_2" onclick="javascript:ClaimMaterialClick();"/>&nbsp;&nbsp;
                                <input type="button" id="btn3" name="btn3" value="资料已齐" class="input_2" onclick="javascript:ClaimMaterialClick();"/>&nbsp;&nbsp;
                                <input type="button" id="btn4" name="btn4" value="结案" class="input_2" onclick="javascript:CaseEndClick();"/>
                            </td>
                            <td style="width: 10%; text-align: right;">
                            </td>
                            <td style="width: 35%; text-align: left;">
                            </td>
                            <td style="width: 5%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; text-align: right;">
                            </td>
                            <td style="width: 10%; text-align: right; vertical-align: top;">
                                事故描述：
                            </td>
                            <td style="text-align: left;" colspan="3">
                                <asp:TextBox ID="txtAccidentProc" runat="server" TextMode="MultiLine" Style="width: 400px;"
                                    Rows="4"></asp:TextBox>
                            </td>
                            <td style="width: 5%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; text-align: right;">
                            </td>
                            <td style="width: 10%; text-align: right; vertical-align: top;">
                                跟踪记录：
                            </td>
                            <td style="text-align: left;" colspan="3">
                                <asp:TextBox ID="txtAccidentDeal" runat="server" TextMode="MultiLine" Style="width: 400px;"
                                    Rows="4"></asp:TextBox>
                            </td>
                            <td style="width: 5%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; text-align: right;">
                            </td>
                            <td style="width: 10%; text-align: right;">
                                向保险公司<br />
                                报案时间：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxDateEdit ID="deNotifyCarrierTime" ClientInstanceName="deNotifyCarrierTime" runat="server" Width="160px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 10%; text-align: right;">
                                报案号：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtNotifyNo" ClientInstanceName="dxetxtNotifyNo" runat="server" Width="160px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="width: 5%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; text-align: right;">
                            </td>
                            <td style="width: 10%; text-align: right;">
                                保险公司<br />
                                办理人员：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCarrierContactPerson" ClientInstanceName="dxetxtCarrierContactPerson" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td style="width: 10%; text-align: right;">
                                联系电话：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCarrierContactPhone" ClientInstanceName="dxetxtCarrierContactPhone" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td style="width: 5%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; text-align: right;">
                            </td>
                            <td style="width: 10%; text-align: right;">
                                查勘时间：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxDateEdit ID="dePerambulateTime" ClientInstanceName="dePerambulateTime" runat="server" Width="160px"></dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 10%; text-align: right;">
                            </td>
                            <td style="width: 35%; text-align: left;">
                            </td>
                            <td style="width: 5%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; text-align: right;">
                            </td>
                            <td style="width: 10%; text-align: right; vertical-align: top;">
                                保险公司要求：
                            </td>
                            <td style="text-align: left;" colspan="3">
                                <asp:TextBox ID="txtRequirement" runat="server" TextMode="MultiLine" Style="width: 400px;"
                                    Rows="4"></asp:TextBox>
                            </td>
                            <td style="width: 5%; text-align: left;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 5%; text-align: right;">
                            </td>
                            <td style="width: 10%; text-align: right;">
                                制单人：
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCreatePerson" ClientInstanceName="dxetxtCreatePerson" runat="server" Width="160px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="width: 10%; text-align: right;">
                                制单日期:
                            </td>
                            <td style="width: 35%; text-align: left;">
                                <dxe:ASPxDateEdit ID="deCreateDate" ClientInstanceName="deCreateDate" runat="server" Width="160px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="width: 5%; text-align: left;">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeNotifyInfo" runat="Server" TargetControlID="npNotifyInfoDetail"
                    ExpandControlID="npNotifyInfoHeader" CollapseControlID="npNotifyInfoHeader" Collapsed="false"
                    TextLabelID="lbl_npNotifyInfoHeader" ImageControlID="img_npNotifyInfoHeader"
                    ExpandedText="(隐藏)" CollapsedText="(展开)" ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg" SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npTraceInfoHeader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npTraceInfoHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            跟踪信息</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npTraceInfoHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npTraceInfoDetail" runat="server" CssClass="collapsePanel" Height="0">
                    
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeTraceInfo" runat="Server" TargetControlID="npTraceInfoDetail"
                    ExpandControlID="npTraceInfoHeader" CollapseControlID="npTraceInfoHeader" Collapsed="false"
                    TextLabelID="lbl_npTraceInfoHeader" ImageControlID="img_npTraceInfoHeader" ExpandedText="(隐藏)"
                    CollapsedText="(展开)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
        <tr>
            <td style="width: 100%;">
                <asp:Panel ID="npEndCaseHeader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npEndCaseHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            结案信息</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_npEndCaseHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="npEndCaseDetail" runat="server" CssClass="collapsePanel" Height="0">
                    
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeEndCase" runat="Server" TargetControlID="npEndCaseDetail"
                    ExpandControlID="npEndCaseHeader" CollapseControlID="npEndCaseHeader" Collapsed="false"
                    TextLabelID="lbl_npEndCaseHeader" ImageControlID="img_npEndCaseHeader" ExpandedText="(隐藏)"
                    CollapsedText="(展开)" ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>        
    </table>
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