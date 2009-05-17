<%@ Page Title="车辆信息录入" Theme="Aqua" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" CodeBehind="CarPolicyItemInput.aspx.cs" Inherits="OSPortalWebApp.vehicleinsurance.CarPolicyItemInput" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>车辆信息录入</title>
    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});
            
            
            //if (canDisplay.toLowerCase() == "true") {
            //    //popupControl.ShowWindow();
            //    SetFormInputPopUpVisible();
            //}
            //else {
            //    //do nothing;
            //}

        });


        function btnAddCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("../otherinsurance/NewCustomer.aspx", self, myArguments);
        }

        function btnSelectCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("../otherinsurance/SelectCustomer.aspx", self, myArguments);
        }
        
    </script> 
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width:100%">
        
        <tr>
            <td style="width:100%;"> 
                <asp:Panel ID="npbasicheader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                        <div style="float:left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npbasicheader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                        </div>
                        <div style="float: left; margin-left:5px;">基本信息</div>
                        <div style="float: left; margin-left:5px;">
                            <asp:Label ID="lbl_npbasicheader" runat="server">(展开)</asp:Label>
                        </div>
                        
                    </div>
                </asp:Panel>                           
                <asp:Panel ID="npbasicdetail" runat="server" CssClass="collapsePanel" Height="0">
                            <table style="width:100%">
                                <tr>
                                  <td style="white-space:nowrap; text-align:right;">保单编号:</td>
                                  <td style="text-align:left;">
                                        <asp:TextBox runat="server" ID="TextBox1" Text='<%# Eval("CarNo") %>'  Enabled="false"></asp:TextBox>
                                   </td>
                                   <td style="white-space:nowrap; text-align:right;">交强险保单号:</td>
                                    <td style="text-align:left;">
                                        <asp:TextBox runat="server" ID="TextBox4" Text='<%# Eval("CarcaseNo") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="white-space:nowrap; text-align:right;">车牌号:</td>
                                    <td style="text-align:left;">
                                        <asp:TextBox runat="server" ID="txtGridPolicyCarInfoCarNo" Text='<%# Eval("CarNo") %>'  Enabled="false"></asp:TextBox>
                                    </td>
                                    <td style="white-space:nowrap; text-align:right;">车架号:</td>
                                    <td style="text-align:left;">
                                        <asp:TextBox runat="server" ID="txtGridPolicyCarInfoCarcaseNo" Text='<%# Eval("CarcaseNo") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="white-space:nowrap; text-align:right;">发动机号:</td>
                                    <td style="text-align:left;">
                                        <asp:TextBox runat="server" ID="txtGridPolicyCarInfoEngineNo" Text='<%# Eval("EngineNo") %>'></asp:TextBox>
                                    </td>
                                    <td style="white-space:nowrap; text-align:right;">核定载客/质量:</td>
                                    <td style="text-align:left;">
                                        <asp:TextBox runat="server" ID="txtGridPolicyCarInfoCapacity" Text='<%# Eval("Capacity") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="white-space:nowrap; text-align:right;">厂牌型号:</td>
                                    <td style="text-align:left;">
                                        <asp:TextBox runat="server" ID="txtGridPolicyCarInfoCarModel" Text='<%# Eval("CarModel") %>'></asp:TextBox>
                                    </td>
                                    <td style="white-space:nowrap; text-align:right;">使用性质:</td>
                                    <td style="text-align:left;">
                                        <asp:TextBox runat="server" ID="txtGridPolicyCarInfoCharacter" Text='<%# Eval("Character") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="white-space:nowrap; text-align:right;">初登日期:</td>
                                    <td style="text-align:left;">
                                        <asp:TextBox runat="server" ID="txtGridPolicyCarInfoRegisterDate" Text='<%# Eval("RegisterDate") %>'></asp:TextBox>
                                    </td>
                                    <td style="white-space:nowrap; text-align:right;">车辆价值:</td>
                                    <td style="text-align:left;">
                                        <asp:TextBox runat="server" ID="txtGridPolicyCarInfoCarValue" Text='<%# Eval("CarValue") %>'></asp:TextBox>
                                    </td>
                                </tr> 
                            </table>
                 </asp:Panel>
                 <ajaxToolkit:CollapsiblePanelExtender ID="cpeBasic" runat="Server"
                    TargetControlID="npbasicdetail"
                    ExpandControlID="npbasicheader"
                    CollapseControlID="npbasicheader" 
                    Collapsed="false"
                    TextLabelID="lbl_npbasicheader"
                    ImageControlID="img_npbasicheader"    
                    ExpandedText="(展开)"
                    CollapsedText="(隐藏)"
                    ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
                                            
        
        
        <tr>
            <td style="width:100%;">
                <asp:Panel ID="npGridPolicyItemHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npGridPolicyItem" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                        </div>
                        <div style="float: left; margin-left:5px;">车险项目</div>
                        <div style="float: left; margin-left:5px;">
                            <asp:Label ID="lbl_npGridPolicyItem" runat="server">(展开)</asp:Label>
                        </div>                                    
                    </div>
                </asp:Panel>  
                <asp:Panel ID="npGridPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                            <table style="width:100%">
                                <tr>
                                    <td>
                                        <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server" 
                                        KeyFieldName="CarPolicyItemID" Width="100%" AutoGenerateColumns="False" 
                                        OnRowInserting="gridPolicyItem_RowInserting" 
                                        OnRowUpdating="gridPolicyItem_RowUpdating" 
                                        OnRowUpdated="gridPolicyItem_RowUpdated" 
                                        OnRowInserted="gridPolicyItem_RowInserted"
                                        OnRowDeleting="gridPolicyItem_RowDeleting" 
                                        OnRowDeleted="gridPolicyItem_RowDeleted"
                                         >
                                            <%-- BeginRegion Columns --%>
                                                <Columns>                                                                                                                                           
                                                    <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" CellStyle-HorizontalAlign="Left" Width="81" HeaderStyle-Wrap="False" AllowDragDrop="false">
                                                        <NewButton Visible="true" />
                                                        <EditButton Visible="true" />
                                                        <DeleteButton Visible="true" />                                                            
                                                    </dxwgv:GridViewCommandColumn>
                                                    <dxwgv:GridViewDataColumn FieldName="CarPolicyItemName" Caption="保险险种" CellStyle-Wrap="False">
                                                    </dxwgv:GridViewDataColumn>
                                                    <dxwgv:GridViewDataColumn FieldName="Coverage" Caption="保险金额 " CellStyle-Wrap="False">
                                                    </dxwgv:GridViewDataColumn>
                                                    <dxwgv:GridViewDataColumn FieldName="Premium" Caption="保费" CellStyle-Wrap="False">
                                                    </dxwgv:GridViewDataColumn>
                                                    <dxwgv:GridViewDataColumn FieldName="Memo" Caption="备注" CellStyle-Wrap="False">
                                                    </dxwgv:GridViewDataColumn>
                                                </Columns>
                                            <%-- EndRegion --%>
                                            <SettingsPager Mode="ShowAllRecords"/>
                                            <Settings ShowGroupPanel="false" /> 
                                            <SettingsBehavior />                                                       
                                            <Templates>
                                                 <EditForm>                                                             
                                                 <div style="padding:4px 4px 3px 4px">
                                                    <table style=" width:90%;" runat="server" id="tblgridPolicyItemEditorTemplate">
                                                        <tr>
                                                            <td style="white-space:nowrap; text-align:right;">险种:</td>
                                                            <td style="text-align:left;">
                                                                <dxe:ASPxComboBox runat="server" ID="decbPolicyCarPolicyItemID" 
                                                                    AutoPostBack="false" ClientInstanceName="decbPolicyCarPolicyItemID" 
                                                                    DropDownButton-Enabled="true" DropDownStyle="DropDownList" Width="100px">
                                                                    <Items>
                                                                        <dxe:ListEditItem Text="编号三" Value="1" />
                                                                        <dxe:ListEditItem Text="编号四" Value="2" />
                                                                        <dxe:ListEditItem Text="编号五" Value="3" />
                                                                    </Items>
                                                                    <ClientSideEvents SelectedIndexChanged="" />
                                                                </dxe:ASPxComboBox>                                                                
                                                            </td>
                                                            <td style="white-space:nowrap; text-align:right;">保险金额:</td>
                                                            <td style="text-align:left;">
                                                                <asp:TextBox runat="server" ID="txtGridPolicyCoverage" Text='<%# Eval("Coverage") %>'></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>                                                            
                                                            <td style="white-space:nowrap; text-align:right;">保费:</td>
                                                            <td style="text-align:left;">
                                                                <asp:TextBox runat="server" ID="txtGridPolicyPremium" Text='<%# Eval("Premium") %>'></asp:TextBox>
                                                            </td>
                                                            <td style="white-space:nowrap; text-align:right;">备注:</td>
                                                            <td style="text-align:left;">
                                                                <asp:TextBox runat="server" ID="txtGridPolicyMemo" Text='<%# Eval("Memo") %>'></asp:TextBox>
                                                            </td>
                                                        </tr>                                                                                                            
                                                        
                                                    </table>
                                                    
                                                 </div>
                                                 <div style="text-align:right; padding:2px 2px 2px 2px">
                                                     <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server">
                                                     </dxwgv:ASPxGridViewTemplateReplacement>
                                                     <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server">
                                                     </dxwgv:ASPxGridViewTemplateReplacement>
                                                 </div>
                                                 </EditForm>
                                             </Templates>

                                        </dxwgv:ASPxGridView>
                                    </td>
                                </tr>
                            </table>

                 </asp:Panel>
                 <ajaxToolkit:CollapsiblePanelExtender ID="cpeGridPolicyItem" runat="Server"
                    TargetControlID="npGridPolicyItemDetail"
                    ExpandControlID="npGridPolicyItemHeader"
                    CollapseControlID="npGridPolicyItemHeader" 
                    Collapsed="false"
                    TextLabelID="lbl_npGridPolicyItem"
                    ImageControlID="img_npGridPolicyItem"    
                    ExpandedText="(展开)"
                    CollapsedText="(隐藏)"
                    ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
                    
        
        
        <tr>
        <td style="width:100%;">
            <asp:Panel ID="npCostSummaryHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                    <div style="float: left; vertical-align: middle;">
                        <asp:ImageButton ID="img_npCostSummaryHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                    </div>
                    <div style="float: left; margin-left:5px;">费用汇总</div>
                    <div style="float: left; margin-left:5px;">
                        <asp:Label ID="lbl_npCostSummaryHeader" runat="server">(展开)</asp:Label>
                    </div>
                    
                </div>
            </asp:Panel> 
            <asp:Panel ID="npCostSummaryDetail" runat="server" CssClass="collapsePanel" Height="0">
                        <table style="width:100%">
                            <tr>
                                <td style="width:14%;text-align:right;">商业险保费：</td>
                                <td style="width:12%;text-align:left;">
                                    <asp:TextBox ID="txtCiPremium" runat="server" Width="100px"></asp:TextBox>
                                </td>
                                <td style="width:14%;text-align:right;">交强险保费：</td>
                                <td style="width:12%;text-align:left;">
                                    <asp:TextBox ID="txtAciPremium" runat="server" Width="100px"></asp:TextBox>
                                </td>
                                
                                <td style="width:10%;text-align:right;">车船税：</td>
                                <td style="width:12%;text-align:left;">
                                    <asp:TextBox ID="txtCstPremium" runat="server" Width="100px"></asp:TextBox>
                                </td>
                                <td style="width:14%;text-align:right;">保费合计：</td>
                                <td style="width:12%;text-align:left;">
                                    <asp:TextBox ID="TextBox2" runat="server" Width="100px"></asp:TextBox>
                                </td>                                 
                            </tr> 
                           
                            <tr>
                                <td style="text-align:right;">商业险经纪费：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="txtCiProcess" runat="server" Width="100px"></asp:TextBox>
                                </td>
                                <td style="text-align:right;">交强险经纪费：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="txtAciProcess" runat="server" Width="100px"></asp:TextBox>
                                </td>
                                <td style="text-align:right;"></td>
                                <td style="text-align:left;"></td>
                                <td style="text-align:right;">经纪费合计：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="TextBox3" runat="server" Width="100px"></asp:TextBox>
                                </td>                                
                            </tr>
                                                               
                                                                                                                    
                        </table>
                        
             </asp:Panel>
             <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="Server"
                TargetControlID="npCostSummaryDetail"
                ExpandControlID="npCostSummaryHeader"
                CollapseControlID="npCostSummaryHeader" 
                Collapsed="false"
                TextLabelID="lbl_npCostSummaryHeader"
                ImageControlID="img_npCostSummaryHeader"    
                ExpandedText="(展开)"
                CollapsedText="(隐藏)"
                ExpandedImage="~/images/collapse_blue.jpg"
                CollapsedImage="~/images/expand_blue.jpg"
                SuppressPostBack="true" />
            </td>
        </tr>
        
        
        <tr>
            <td style="width:100%;">
                <asp:Panel ID="npOtherPolicyItemHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npOtherPolicyItemHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                        </div>
                        <div style="float: left; margin-left:5px;">其它项目</div>
                        <div style="float: left; margin-left:5px;">
                            <asp:Label ID="lbl_npOtherPolicyItemHeader" runat="server">(展开)</asp:Label>
                        </div>
                        
                    </div>
                </asp:Panel> 
                <asp:Panel ID="npOtherPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                            <table style="width:100%">
                                <tr>
                                    <td style="width:10%;text-align:right;">录单日期：</td>
                                    <td style="width:90%;text-align:left;">
                                        <dxe:ASPxDateEdit ID="deCreateTime" runat="server"></dxe:ASPxDateEdit>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td style="text-align:right;"></td>
                                    <td style="text-align:left;">                                                
                                        <textarea runat="server" id="taModifyMemo" rows="5" cols="72"></textarea>
                                    </td>
                                    <td></td>
                                </tr>
                                                                                                                       
                            </table>
                            
                 </asp:Panel>
                 <ajaxToolkit:CollapsiblePanelExtender ID="cpeOtherPolicyItem" runat="Server"
                    TargetControlID="npOtherPolicyItemDetail"
                    ExpandControlID="npOtherPolicyItemHeader"
                    CollapseControlID="npOtherPolicyItemHeader" 
                    Collapsed="false"
                    TextLabelID="lbl_npOtherPolicyItemHeader"
                    ImageControlID="img_npOtherPolicyItemHeader"    
                    ExpandedText="(展开)"
                    CollapsedText="(隐藏)"
                    ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
                </td>
            </tr>            
        
    </table>
    
    <table style="height:5px; background-color:#E0EDFF; width:100%; font-size:2px;"><tr><td></td></tr></table>
    
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="25px">
                <table style="width:100%">
                    <tr>
                        <td style="text-align:right;">
                            <asp:Button ID="btnadd" runat="server" Text="新增" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnsave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btncancel" runat="server" Text="取消" CssClass="input_2" />
                        </td>  
                        <td style="width:20px;text-align:left;">
                            &nbsp;
                        </td>                                                                  
                    </tr>
                </table>
                
     </asp:Panel>
     
</asp:Content>
