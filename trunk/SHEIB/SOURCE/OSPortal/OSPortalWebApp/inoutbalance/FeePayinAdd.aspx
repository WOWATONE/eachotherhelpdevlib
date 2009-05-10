<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="FeePayinAdd.aspx.cs" Inherits="OSPortalWebApp.inoutbalance.FeePayinAdd" %>
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
    
    <title>解付保费录入</title>
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

        function imgSearchClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=450px;center=yes;help=no";
            window.showModalDialog("FeeCustomerPolicySelect.aspx", self, myArguments);
            gridPolicyItem.PerformCallback('');
        }

        function btnAddPolicyClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=500px;center=yes;help=no";
            window.showModalDialog("FeeInvoiceSearch.aspx", self, myArguments);
            gridPolicyItem.PerformCallback('');
        }
        
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <table style="width:100%">
        <tr>
            <td>
                <asp:Panel ID="npGridPolicyItemHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npGridPolicyItem" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                        </div>
                        <div style="float: left; margin-left:5px;">保单</div>
                        <div style="float: left; margin-left:5px;">
                            <asp:Label ID="lbl_npGridPolicyItem" runat="server">(展开)</asp:Label>
                        </div>                                    
                    </div>
                </asp:Panel>
                <asp:Panel ID="npGridPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">                        
                 <table style="width:100%">
                    <tr>
                        <td style="width:10%;text-align:right;">
                            <dxe:ASPxButton runat="server" ID="btnAddPolicy" AutoPostBack="false" Text="添加保单">
                                <ClientSideEvents Click="btnAddPolicyClick" />
                            </dxe:ASPxButton>
                        </td>
                        <td style="width:12%;text-align:right;">流水号：</td>  
                        <td style="width:78%;text-align:left;">001031</td>                                              
                    </tr> 
                    <tr>
                        <td colspan="3">
                            <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server" 
                            DataSourceID=""
                            KeyFieldName="PolicyNo" Width="100%" AutoGenerateColumns="False" 
                            OnRowInserting="gridPolicyItem_RowInserting" 
                            OnRowUpdating="gridPolicyItem_RowUpdating" 
                            OnRowUpdated="gridPolicyItem_RowUpdated" 
                            OnRowInserted="gridPolicyItem_RowInserted"
                            OnRowDeleting="gridPolicyItem_RowDeleting" 
                            OnRowDeleted="gridPolicyItem_RowDeleted"
                             >
                                <%-- BeginRegion Columns --%>
                                    <Columns>
                                        <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False">
                                            <EditButton Visible="true" />
                                            <DeleteButton Visible="true" />
                                        </dxwgv:GridViewCommandColumn>
                                        <dxwgv:GridViewDataColumn FieldName="PolicyNo" Caption="保单编号" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="StandardFeeBase" Caption="本期应收保费(本)" CellStyle-Wrap="False">
                                            <EditFormSettings VisibleIndex="1" />
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="GotFeeBase" Caption="本期已收保费(本)" CellStyle-Wrap="False">
                                            <EditFormSettings VisibleIndex="2" />
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="GettingFeeBase" Caption="本期实收保费" CellStyle-Wrap="False">
                                            <EditFormSettings VisibleIndex="3" />
                                        </dxwgv:GridViewDataColumn>
                                        
                                        <dxwgv:GridViewDataColumn FieldName="StandardProcessFeeBase" Caption="本期应解付保费(本)" CellStyle-Wrap="False">
                                            <EditFormSettings VisibleIndex="4" />
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="GotProcessFee" Caption="本期已解付保费(本)" CellStyle-Wrap="False">
                                            <EditFormSettings VisibleIndex="5" />
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="GettingProcessFee" Caption="本期实解付保费" CellStyle-Wrap="False">
                                            <EditFormSettings VisibleIndex="6" />
                                        </dxwgv:GridViewDataColumn>
                                        
                                        <dxwgv:GridViewDataColumn FieldName="CustomerID" Caption="投保客户" CellStyle-Wrap="False">
                                            <EditFormSettings VisibleIndex="7" />
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="ProdTypeID" Caption="险种名称" CellStyle-Wrap="False">
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="CarrierId" Caption="保险公司" CellStyle-Wrap="False">
                                            <EditFormSettings VisibleIndex="8" />
                                        </dxwgv:GridViewDataColumn>
                                        <dxwgv:GridViewDataColumn FieldName="BranchId" Caption="分支机构" CellStyle-Wrap="False">
                                            <EditFormSettings VisibleIndex="9" />
                                        </dxwgv:GridViewDataColumn>
                                    </Columns>
                                <%-- EndRegion --%>
                                <SettingsPager Mode="ShowAllRecords"/>
                                <Settings ShowGroupPanel="false" />                                                        
                                <Templates>
                                     <EditForm>                                                             
                                     <div style="padding:4px 4px 3px 4px">
                                        <table>
                                            <tr>
                                                <td style="white-space:nowrap; text-align:right;">保单编号:</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox runat="server" ID="txtGridPolicyNo" Text='<%# Eval("PolicyNo") %>'  Enabled="false"></asp:TextBox>
                                                </td>
                                                <td style="white-space:nowrap; text-align:right;">本期已收保费(本):</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox runat="server" ID="txtGridGotFeeBase" Text='<%# Eval("GotFeeBase") %>' ></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="white-space:nowrap; text-align:right;">本期实收保费:</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox runat="server" ID="txtGridGettingFeeBase" Text='<%# Eval("GettingFeeBase") %>' ></asp:TextBox>
                                                </td>
                                                <td style="white-space:nowrap; text-align:right;">本期应解付保费(本):</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox runat="server" ID="txtGridStandardProcessFeeBase" Text='<%# Eval("StandardProcessFeeBase") %>' ></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="white-space:nowrap; text-align:right;">本期已解付保费(本):</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox runat="server" ID="txtGridGotProcessFee" Text='<%# Eval("GotProcessFee") %>' ></asp:TextBox>
                                                </td>
                                                <td style="white-space:nowrap; text-align:right;">本期实解付保费:</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox runat="server" ID="txtGridGettingProcessFee" Text='<%# Eval("GettingProcessFee") %>' ></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="white-space:nowrap; text-align:right;">险种名称:</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox runat="server" ID="txtGridProdTypeID" Text='<%# Eval("ProdTypeID") %>' Enabled="false"></asp:TextBox>
                                                </td>
                                                <td style="white-space:nowrap; text-align:right;">保险公司:</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox runat="server" ID="txtGridCarrierId" Text='<%# Eval("CarrierId") %>' Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="white-space:nowrap; text-align:right;">分支机构:</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox runat="server" ID="txtGridBranchId" Text='<%# Eval("BranchId") %>' Enabled="false"></asp:TextBox>
                                                </td>
                                                <td style="white-space:nowrap; text-align:right;">投保客户:</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox runat="server" ID="txtGridCustomerID" Text='<%# Eval("CustomerID") %>' Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
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
            <td>
                <asp:Panel ID="npOtherPolicyItemHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npOtherPolicyItemHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                        </div>
                        <div style="float: left; margin-left:5px;">总计</div>
                        <div style="float: left; margin-left:5px;">
                            <asp:Label ID="lbl_npOtherPolicyItemHeader" runat="server">(展开)</asp:Label>
                        </div>
                        
                    </div>
                </asp:Panel>
                <asp:Panel ID="npOtherPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table style="width:100%">
                        <tr>
                            <td style="width:11%;text-align:right;">收费形式：</td>
                            <td style="width:22%;text-align:left;">
                                <asp:DropDownList ID="ddlAccountType" runat="server">
                                                        <asp:ListItem Text="代收" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="直付" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                            </td>
                            <td style="width:11%;text-align:right;">收费方式：</td>
                            <td style="width:22%;text-align:left;">
                                <asp:DropDownList ID="ddlFeeType" runat="server">
                                                        <asp:ListItem Text="现金" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="支票" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                            </td>
                            <td style="width:11%;text-align:right;">币种：</td>
                            <td style="width:20%;text-align:left;">
                                <asp:DropDownList ID="ddlCurCode" runat="server">
                                                        <asp:ListItem Text="人民币" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="美元" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="英镑" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                            </td>                                  
                        </tr> 
                        <tr>
                            <td style="width:11%;text-align:right;">汇率：</td>
                            <td style="width:22%;text-align:left;">
                                <asp:TextBox ID="txtchange" runat="server" Width="140px"></asp:TextBox>
                            </td>
                            <td style="width:11%;text-align:right;">实付保费：</td>
                            <td style="width:22%;text-align:left;">
                                <asp:TextBox ID="txtlocalfee" runat="server" Width="140px"></asp:TextBox>
                            </td>
                            <td style="width:11%;text-align:right;">解付保费：</td>
                            <td style="width:20%;text-align:left;">
                                <asp:TextBox ID="txtJInE" runat="server" Width="140px"></asp:TextBox>
                            </td>                                  
                        </tr>
                        <tr>
                            <td style="width:11%;text-align:right;">金额调整：</td>
                            <td style="width:22%;text-align:left;">
                                <asp:TextBox ID="txtAdjust" runat="server" Width="140px"></asp:TextBox>
                            </td>
                            <td style="width:11%;text-align:right;">解款日期：</td>
                            <td style="width:22%;text-align:left;">
                                <dxe:ASPxDateEdit ID="deGotDate" runat="server"></dxe:ASPxDateEdit> 
                            </td>
                            <td style="width:11%;text-align:right;">开票日期：：</td>
                            <td style="width:20%;text-align:left;">
                                <dxe:ASPxDateEdit ID="deReleaseDate" runat="server"></dxe:ASPxDateEdit>
                            </td>                                  
                        </tr>  
                        <tr>
                            <td style="width:11%;text-align:right;">开票金额：</td>
                            <td style="width:22%;text-align:left;">
                                <asp:TextBox ID="txtRealFee" runat="server" Width="140px"></asp:TextBox>
                            </td>
                            <td style="width:11%;text-align:right;">备注：</td>
                            <td style="width:56%;text-align:left;" colspan="3">
                                <asp:TextBox ID="txtMemo" runat="server" Width="300px"></asp:TextBox>
                            </td>                                  
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
        
        
        <tr>
            <td style="height:5px; background-color:#E0EDFF; width:100%; font-size:2px;"></td>
        </tr>
        
        <tr>
            <td style="width:100%">
                <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="30px" Width="100%">
                            <table style="width:100%">
                                <tr>
                                    <td style="width:180px;text-align:left;"></td>
                                    <td style="width:60px;text-align:left;">
                                        <dxe:ASPxButton runat="server" ID="ASPxButton5" Text="审核" AutoPostBack="false"></dxe:ASPxButton>
                                    </td>
                                    <td style="width:100px;text-align:left;">
                                        <dxe:ASPxButton runat="server" ID="ASPxButton1" Text="提交审核" AutoPostBack="false"></dxe:ASPxButton>
                                    </td>
                                    <td style="width:100px;text-align:left;">
                                        <dxe:ASPxButton runat="server" ID="ASPxButton2" Text="反审核" AutoPostBack="false"></dxe:ASPxButton>
                                    </td>
                                    <td style="width:60px;text-align:left;">
                                        <dxe:ASPxButton runat="server" ID="ASPxButton3" Text="保存" AutoPostBack="false"></dxe:ASPxButton>
                                    </td>
                                    <td style="width:60px;text-align:left;">
                                        <dxe:ASPxButton runat="server" ID="btnClose" Text="退出" AutoPostBack="false"></dxe:ASPxButton>
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                            
                 </asp:Panel>
            </td>
        </tr>
        
    </table>
     
        
</asp:Content>
