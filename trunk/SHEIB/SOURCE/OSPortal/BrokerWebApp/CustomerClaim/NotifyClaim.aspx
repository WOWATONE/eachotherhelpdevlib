<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="NotifyClaim.aspx.cs" Inherits="BrokerWebApp.CustomerClaim.NotifyClaim" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>

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


            var theNotifyID = dxetxtNotifyID.GetValueString();
            if (isEmpty(theNotifyID)) {
                setDxeButtonsUnableOrEnable(false);
            }
            else {
                setDxeButtonsUnableOrEnable(true);
            }
        });

        function setDxeButtonsUnableOrEnable(val) {
            gridTraceInfoItem.SetClientVisible(val);
            filesUploadControl.SetClientVisible(val);
            gridDocList.SetClientVisible(val);
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
            var retrunval = window.showModalDialog(querystring, self, myArguments);
            if (isEmpty(retrunval)) {
                //do nothing;
            }
            else {
                //debugger;
                setHidePolicyID(retrunval[0][0]);
                dxetxtPolicyID.SetValue(retrunval[0][0]);
                dxetxtBeneficiary.SetValue(retrunval[0][1]);
                dxetxtCustName.SetValue(retrunval[0][2]);
                dxetxtUserNameCn.SetValue(retrunval[0][3]);
                dxetxtProdTypeName.SetValue(retrunval[0][4]);
                dxetxtStartDate.SetValue(retrunval[0][5]);
                dxetxtEndDate.SetValue(retrunval[0][6]);
                dxetxtCarrierNameCn.SetValue(retrunval[0][7]);
                dxetxtPolicyNo.SetValue(retrunval[0][8]);
                dxetxtPremiumBase.SetValue(retrunval[0][9]);               
            }
        }


        function dxebtnNotifyInfoSaveEndCase_Click(s, e) {
            var pid = dxetxtPolicyID.GetValueString();
            if (isEmpty(pid)) {
                alert("请先选择保单。");
                return;
            }
            if (s.CauseValidation()) {
                dxeNotifyInfoSaveEndCaseCallback.PerformCallback("");
            }
        }
        function dxeNotifyInfoSaveEndCaseCallbackComplete(s, e) {
            var retrunval = e.result;
            switch (retrunval) {
                case "notifynoexist":
                    alert("报案号不唯一");
                    break
                default:
                    dxebtnBottomEndCase.SetEnabled(false);
                    dxebtnBottomSave.SetEnabled(false);
                    alert("保存成功");
            }         
        }

        function dxebtnNotifyInfoSave_Click(s, e) {
            var pid = dxetxtPolicyID.GetValueString();
            if (isEmpty(pid)) {
                alert("请先选择保单。");
                return;
            }
            
            //if (s.CauseValidation()) {
                dxeNotifyInfoSaveCallback.PerformCallback("");
            //}
        }
        function dxeNotifyInfoSaveCallbackComplete(s, e) {
            var retrunval = e.result;
            switch (retrunval) {
                case "notifynoexist":
                    alert("报案号不唯一");
                    break
                default:
                    var nid = dxetxtNotifyID.GetValueString();
                    if (isEmpty(nid)) {
                        dxetxtNotifyID.SetValue(e.result);
                    }
                    setDxeButtonsUnableOrEnable(true);
                    alert("保存成功");
            }
        }

        function gridTraceInfoItem_EndCallback(s, e) {
            //
        }
        
        function setHidePolicyID(thevalue) {
            var result = $("#<%=hidPolicyID.ClientID %>");
            result[0].value = thevalue;
        }
        
        function isEmpty(testVar) {
            if ((testVar == null) || (testVar.length == 0)) {
                return true;
            } else {
                return false;
            }
        }

        
    </script>
    
    <script type="text/javascript">
        function FileUploadStart(s, e) {
            //
        }
        
        function FileUploaded(s, e) {
            gridDocList.PerformCallback();
        }

        function hlPolicyItemTogetherClick(params) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
            var url = params;
            window.open(url);
        }
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <input type="hidden" id="pagemode" runat="server" value="" />
    <dxcb:ASPxCallback ID="dxeNotifyInfoSaveCallback" ClientInstanceName="dxeNotifyInfoSaveCallback" runat="server"
        OnCallback="dxeNotifyInfoSave_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {dxeNotifyInfoSaveCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="dxeNotifyInfoSaveEndCaseCallback" ClientInstanceName="dxeNotifyInfoSaveEndCaseCallback"
        runat="server" OnCallback="dxeNotifyInfoSaveEndCase_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {dxeNotifyInfoSaveEndCaseCallbackComplete(s,e);}" />
    </dxcb:ASPxCallback>
    
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
                            <td style="width: 35%;"></td>
                            <td style="width: 15%;"></td>
                            <td style="width: 30%;"></td>
                            <td></td>
                        </tr>
                        <tr style=" display:none; ">
                            <td>
                                
                            </td>
                            <td>
                                <dxe:ASPxTextBox  ID="dxetxtPolicyID" ClientInstanceName="dxetxtPolicyID" runat="server" Width="160px" ReadOnly="false" ClientVisible="false"></dxe:ASPxTextBox>
                            </td>
                            <td></td>
                            <td>
                                <dxe:ASPxTextBox  ID="dxetxtNotifyID" ClientInstanceName="dxetxtNotifyID" runat="server" Width="160px" ReadOnly="false" ClientVisible="false"></dxe:ASPxTextBox>
                            </td>
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
                                            <dxe:ASPxTextBox ID="dxetxtPolicyNo" ClientInstanceName="dxetxtPolicyNo" runat="server" Width="200px" ReadOnly="true"></dxe:ASPxTextBox> 
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
                                <dxe:ASPxTextBox ID="dxetxtCarrierNameCn" ClientInstanceName="dxetxtCarrierNameCn" runat="server" Width="250px" ReadOnly="false"></dxe:ASPxTextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                投保人：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCustName" ClientInstanceName="dxetxtCustName" runat="server" Width="250px" ReadOnly="true"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                险种：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtProdTypeName" ClientInstanceName="dxetxtProdTypeName" runat="server" Width="250px" ReadOnly="true"></dxe:ASPxTextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                被保险人：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtBeneficiary" ClientInstanceName="dxetxtBeneficiary" runat="server" Width="250px" ReadOnly="true"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                客户经理：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtUserNameCn" ClientInstanceName="dxetxtUserNameCn" runat="server" Width="250px" ReadOnly="true"></dxe:ASPxTextBox>
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
                                <dxe:ASPxTextBox ID="dxetxtPremiumBase" ClientInstanceName="dxetxtPremiumBase" runat="server" Width="250px" ReadOnly="true"></dxe:ASPxTextBox>
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
                            <td style="width: 15%;"></td>
                            <td style="width: 35%;"></td>
                            <td style="width: 15%;"></td>
                            <td style="width: 30%;"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                客户报案人：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtNotifyPerson" ClientInstanceName="dxetxtNotifyPerson" runat="server" Width="160px">
                                    <ClientSideEvents LostFocus="function(s ,e) { NotifyPersonLostFocus(s, e) }" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                出险地点：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtAccidentSpot" ClientInstanceName="dxetxtAccidentSpot" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>                            
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                客户向我司<br />
                                报案时间：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="dxedeNotifyTime" ClientInstanceName="dxedeNotifyTime" runat="server" Width="160px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: right;">
                                报损金额：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtNotifyLossFee" ClientInstanceName="dxetxtNotifyLossFee" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                出险日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="dxedeAccidentTime" ClientInstanceName="dxedeAccidentTime" runat="server" Width="160px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: right;">
                                损失性质：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlLossType" ClientInstanceName="dxeddlLossType" runat="server" Width="160px" DropDownStyle="DropDownList">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxComboBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                出险原因：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlAccidentReason" ClientInstanceName="dxeddlAccidentReason" runat="server" Width="160px" DropDownStyle="DropDownList">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                                联系电话：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtContactPhone" ClientInstanceName="dxetxtContactPhone" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                客户联系人：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtContactPerson" ClientInstanceName="dxetxtContactPerson" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>                        
                        <tr>
                            <td style="text-align: right; vertical-align: top;">
                                事故描述：
                            </td>
                            <td style="text-align: left;" colspan="3">                                
                                <dxe:ASPxMemo runat="server" ID="dxetxtAccidentProc" ClientInstanceName="dxetxtAccidentProc"
                                    Rows="10" Columns="120">
                                </dxe:ASPxMemo>
                            </td>
                            <td></td>
                        </tr>                        
                        <tr>
                            <td style="text-align: right;">
                                向保险公司<br />
                                报案日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="dxedeNotifyCarrierTime" ClientInstanceName="dxedeNotifyCarrierTime" runat="server" Width="160px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: right;">
                                报案号：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtNotifyNo" ClientInstanceName="dxetxtNotifyNo" runat="server" Width="160px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxTextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                保险公司<br />
                                办案人员：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCarrierContactPerson" ClientInstanceName="dxetxtCarrierContactPerson" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                办案人员<br />
                                联系电话：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCarrierContactPhone" ClientInstanceName="dxetxtCarrierContactPhone" runat="server" Width="160px"></dxe:ASPxTextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                查勘日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="dxedePerambulateTime" ClientInstanceName="dxedePerambulateTime" runat="server" Width="160px"></dxe:ASPxDateEdit>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
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
                    
                    <table style="width: 100%">
                        <tr>
                            <td style="text-align: right;">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dxwgv:ASPxGridView ID="gridTraceInfoItem" ClientInstanceName="gridTraceInfoItem" runat="server"
                                    KeyFieldName="FollowID" Width="100%" AutoGenerateColumns="False" 
                                    OnRowInserting="gridTraceInfoItem_RowInserting"
                                    OnRowUpdating="gridTraceInfoItem_RowUpdating" 
                                    OnRowDeleting="gridTraceInfoItem_RowDeleting"
                                    OnStartRowEditing="gridTraceInfoItem_StartRowEditing" 
                                    OnHtmlEditFormCreated="gridTraceInfoItem_HtmlEditFormCreated"
                                    OnRowValidating="gridTraceInfoItem_RowValidating">
                                    <%-- BeginRegion Columns --%>
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left"
                                            Width="81" AllowDragDrop="false">
                                            <NewButton Visible="True" />
                                            <EditButton Visible="true" />
                                            <DeleteButton Visible="true" />
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataDateColumn FieldName="FollowDate" Caption="跟进日期" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataColumn FieldName="FollowContent" Caption="跟进工作" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="FollowNextContent" Caption="下一步工作" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="LoseStatusName" Caption="赔案状态" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="EstimateFeel" Caption="估计金额" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="NotifyID" Caption="NotifyID" CellStyle-Wrap="False"
                                            Visible="false">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="FollowID" Caption="FollowID" CellStyle-Wrap="False"
                                            Visible="false">
                                        </dxwgv:GridViewDataColumn>
                                    </Columns>
                                    <Settings ShowGroupPanel="false" ShowFooter="True" ShowGroupFooter="VisibleAlways" />
                                    <TotalSummary>
                                        <dxwgv:ASPxSummaryItem FieldName="FollowDate" SummaryType="Count" DisplayFormat="数量:#" />
                                        <dxwgv:ASPxSummaryItem FieldName="EstimateFeel" SummaryType="Sum" DisplayFormat="c" />
                                    </TotalSummary>
                                    <%-- EndRegion --%>
                                    <SettingsPager Mode="ShowAllRecords" />
                                    <ClientSideEvents EndCallback="function(s, e) {gridTraceInfoItem_EndCallback();}" />
                                    <SettingsBehavior ConfirmDelete="true" AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
                                    <Templates>
                                        <EditForm>
                                            <div style="padding: 4px 4px 3px 4px">
                                                <table style="width: 90%;" runat="server" id="gridTraceInfoItem_EditorTemplate">
                                                    <tr>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            跟进日期:
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <dxe:ASPxDateEdit ID="gridTraceInfoItem_dxedeFollowDate" ClientInstanceName="gridTraceInfoItem_dxedeFollowDate" runat="server"
                                                                Width="120px" EditFormatString="yyyy-MM-dd">
                                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                                                    <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                </ValidationSettings>
                                                            </dxe:ASPxDateEdit>
                                                        </td>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            赔案状态:
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <dxe:ASPxComboBox runat="server" ID="gridTraceInfoItem_dxeddlLoseStatus" AutoPostBack="false"
                                                                ClientInstanceName="gridTraceInfoItem_dxeddlLoseStatus" DropDownButton-Enabled="true"
                                                                DropDownStyle="DropDownList" Width="120px">
                                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                                                    <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                </ValidationSettings>
                                                                <ClientSideEvents />
                                                            </dxe:ASPxComboBox>
                                                        </td>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            估计金额:
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <dxe:ASPxTextBox ID="gridTraceInfoItem_dxetxtEstimateFeel" ClientInstanceName="gridTraceInfoItem_dxetxtEstimateFeel"
                                                                runat="server" Width="120px">
                                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                                                    <RegularExpression ValidationExpression="^\d+(\.\d+)?" ErrorText="格式不对" />
                                                                    <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                </ValidationSettings>
                                                                <ClientSideEvents />
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                    </tr>
                                                    <tr>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            跟进工作:
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <dxe:ASPxMemo runat="server" ID="gridTraceInfoItem_dxetxtFollowContent" ClientInstanceName="gridTraceInfoItem_dxetxtFollowContent"
                                                                Rows="10" Columns="40">
                                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                                                    <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                </ValidationSettings>                                                                
                                                            </dxe:ASPxMemo>
                                                        </td>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            下一步工作:
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <dxe:ASPxMemo runat="server" ID="gridTraceInfoItem_dxetxtFollowNextContent" ClientInstanceName="gridTraceInfoItem_dxetxtFollowNextContent"
                                                                Rows="10" Columns="40">
                                                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                                                    <RequiredField IsRequired="true" ErrorText="必需项" />
                                                                </ValidationSettings>
                                                            </dxe:ASPxMemo>
                                                        </td>
                                                        <td style="white-space: nowrap; text-align: right;">
                                                            
                                                        </td>
                                                        <td style="text-align: left;">
                                                            
                                                        </td>
                                                    </tr>                                                    
                                                </table>
                                            </div>
                                            <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                    runat="server">
                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                    runat="server">
                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                            </div>
                                        </EditForm>
                                    </Templates>
                                    <ClientSideEvents />
                                </dxwgv:ASPxGridView>
                            </td>
                        </tr>
                    </table>
                    
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
                <asp:Panel ID="npUploadDocHeader" runat="server" CssClass="collapsePanelHeader" Height="25px">
                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_UploadDocHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText="" />
                        </div>
                        <div style="float: left; margin-left: 5px;">
                            相关资料</div>
                        <div style="float: left; margin-left: 5px;">
                            <asp:Label ID="lbl_UploadDocHeader" runat="server">(隐藏)</asp:Label>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="npUploadDocDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 15%;"></td>
                            <td style="width: 35%;"></td>
                            <td style="width: 15%;"></td>
                            <td style="width: 30%;"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align:middle;">
                                
                            </td>
                            <td colspan="3" style="text-align: left;">
                                <dxuc:ASPxUploadControl ID="filesUploadControl" ClientInstanceName="filesUploadControl"
                                            runat="server" ShowAddRemoveButtons="true" Width="400px" ShowUploadButton="True"
                                            AddUploadButtonsHorizontalPosition="Center" ShowProgressPanel="True" FileInputCount="5"
                                            RemoveButtonSpacing="8px" AddUploadButtonsSpacing="10" FileUploadMode="OnPageLoad"
                                            OnPreRender="UploadControl_PreRender" OnFileUploadComplete="UploadControl_FileUploadComplete">
                                            <ValidationSettings MaxFileSize="4000000" FileDoesNotExistErrorText="文件不存在" GeneralErrorText="上传发生错误"
                                                MaxFileSizeErrorText="文件太大" NotAllowedContentTypeErrorText="不允许上传此类型文件">
                                            </ValidationSettings>
                                            <ClientSideEvents FilesUploadComplete="function(s, e) { FileUploaded(s, e) }" FileUploadStart="function(s, e) { FileUploadStart(s, e); }" />
                                            <RemoveButton Text="" Image-Url="../images/file_remove.gif" Image-Height="25px" Image-Width="25px"
                                                ImagePosition="Left">
                                            </RemoveButton>
                                            <AddButton Text="" Image-Url="../images/file_add.gif" Image-Height="25px" Image-Width="25px"
                                                ImagePosition="Left">
                                            </AddButton>
                                            <UploadButton Text="" Image-Url="../images/file_upload.gif" Image-Height="25px" Image-Width="25px"
                                                ImagePosition="Left">
                                            </UploadButton>
                                        </dxuc:ASPxUploadControl>
                            </td>                            
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="5" style="width: 100%; text-align: left;">
                                
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="4">
                                <dxwgv:ASPxGridView ID="gridDocList" ClientInstanceName="gridDocList" runat="server"
                                            KeyFieldName="NotifyClaimDocID" Width="100%" AutoGenerateColumns="False" OnCustomCallback="gridDocList_CustomCallback" OnHtmlRowCreated="gridDocList_HtmlRowCreated">
                                            <%-- BeginRegion Columns --%>
                                            <Columns>
                                                <dxwgv:GridViewDataColumn FieldName="DocName" Caption="文件名" CellStyle-Wrap="False"
                                                    Width="25" Settings-AllowDragDrop="false">                                                    
                                                    <DataItemTemplate>
                                                        <asp:HyperLink runat="server" ID="docitemlnk"></asp:HyperLink>
                                                    </DataItemTemplate>
                                                </dxwgv:GridViewDataColumn>
                                                <dxwgv:GridViewDataColumn FieldName="DocURL" Caption="链接地址" CellStyle-Wrap="False">
                                                </dxwgv:GridViewDataColumn>
                                            </Columns>
                                            <%-- EndRegion --%>
                                            <SettingsPager Mode="ShowAllRecords" />
                                            <Settings ShowGroupPanel="false" />
                                            <ClientSideEvents CustomButtonClick="" />
                                            <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
                                        </dxwgv:ASPxGridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <ajaxToolkit:CollapsiblePanelExtender ID="cpeUploadDoc" runat="Server" TargetControlID="npUploadDocDetail"
                    ExpandControlID="npUploadDocHeader" CollapseControlID="npUploadDocHeader" Collapsed="false"
                    TextLabelID="lbl_UploadDocHeader" ImageControlID="img_UploadDocHeader" ExpandedText="(隐藏)"
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
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 10%;"></td>
                            <td style="width: 25%;"></td>
                            <td style="width: 10%;"></td>
                            <td style="width: 25%;"></td>
                            <td style="width: 10%;"></td>
                            <td style="width: 25%;"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                资料齐全日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="dxedeDocCompleteDate" ClientInstanceName="dxedeDocCompleteDate" runat="server" Width="120px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: right;">
                                赔付金额：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtLastPayFee" ClientInstanceName="dxetxtLastPayFee" runat="server" Width="120px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                赔款到帐日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="dxedeLastPayDate" ClientInstanceName="dxedeLastPayDate" runat="server" Width="120px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                结案日期：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="dxedeCaseEndTime" ClientInstanceName="dxedeCaseEndTime" runat="server" Width="120px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td style="text-align: right;">
                                结案人：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxComboBox ID="dxeddlCaseEndPerson" ClientInstanceName="dxeddlCaseEndPerson" runat="server" Width="160px" DropDownStyle="DropDownList">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="text-align: right;">
                            </td>
                            <td style="text-align: left;">
                            </td>
                            <td></td>
                        </tr>                        
                        <tr>
                            <td style="text-align: right;">
                                制单人：
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxTextBox ID="dxetxtCreatePerson" ClientInstanceName="dxetxtCreatePerson" runat="server" Width="120px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxTextBox>
                            </td>
                            <td style="text-align: right;">
                                制单日期:
                            </td>
                            <td style="text-align: left;">
                                <dxe:ASPxDateEdit ID="dxedeCreateDate" ClientInstanceName="dxedeCreateDate" runat="server" Width="120px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
									    <RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
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
                <td></td>
                <td style="width: 400px; text-align: left;">
                    &nbsp;
                </td>
                <td style="width: 50px; text-align: left;">
                        <dxe:ASPxButton runat="server" ID="dxebtnBottomEndCase" ClientInstanceName="dxebtnBottomEndCase"
                            Text="结案" CausesValidation="true" AutoPostBack="false">
                            <ClientSideEvents Click="function(s, e) {dxebtnNotifyInfoSaveEndCase_Click(s,e);}" />
                        </dxe:ASPxButton>
                    </td>
                <td style="width:50px; text-align:left;">
                    <dxe:ASPxButton runat="server" id="dxebtnBottomSave" ClientInstanceName="dxebtnBottomSave" Text="保存" 
                        CausesValidation="false" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {dxebtnNotifyInfoSave_Click(s,e);}" />
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