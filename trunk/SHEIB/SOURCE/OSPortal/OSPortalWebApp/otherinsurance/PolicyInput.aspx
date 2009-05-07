<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="PolicyInput.aspx.cs" Inherits="OSPortalWebApp.otherinsurance.PolicyInput" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保单录入</title>
    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});
            
            
            ////var popupControl = ASPxPopupSelectInsuranceClientControl;
            //var canDisplay = "";
            //if (canDisplay.toLowerCase() == "true") {
            //    //popupControl.ShowWindow();
            //    SetFormInputPopUpVisible();
            //}
            //else {
            //    //do nothing;
            //}

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

        function btnAddCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("NewCustomer.aspx", self, myArguments);
        }

        function btnSelectCustomerClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("SelectCustomer.aspx", self, myArguments);
        }
        
        
    </script>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="insuranceDetailTabPage" ClientInstanceName="insuranceDetailTabPage" runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%">
        <ClientSideEvents 
            ActiveTabChanging="function(s, e) {}" 
            TabClick="function(s, e) { tabItemClick();}" />
        <TabPages>
            
            <dxtc:TabPage Text="保单基本资料">                
                <ContentCollection>                
                <dxw:ContentControl runat="server">
                <table style="width:99%">
                    <tr>
                        <td style="width:100%;"> 
                            <asp:Panel ID="npbasicheader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float:left; vertical-align: middle;">
                                        <asp:ImageButton ID="img_npbasicheader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                    <div style="float: left; margin-left:5px;">保单基本数据</div>
                                    <div style="float: left; margin-left:5px;">
                                        <asp:Label ID="lbl_npbasicheader" runat="server">(展开)</asp:Label>
                                    </div>
                                    
                                </div>
                            </asp:Panel>                           
                            <asp:Panel ID="npbasicdetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width:100%">
                                            <tr style="font-size:1px; height:2px;">
                                                    <td style="width:70px;"></td>
                                                    <td style="width:180px;"></td>
                                                    <td style="width:70px;"></td>
                                                    <td style="width:180px;"></td>
                                                    <td style="width:70px;"></td>
                                                    <td style="width:160px;"></td>
                                                    <td></td>
                                                </tr>
                                            <tr>
                                                <td style="text-align:right;">保单编号：</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox ID="txtSN" runat="server" Width="150px"></asp:TextBox>
                                                </td>
                                                <td style="text-align:right;">投保人：</td>
                                                <td style="text-align:left;"> 
                                                    <asp:TextBox ID="txtpeoplefrom" runat="server" Width="100px" Text="张三"></asp:TextBox>&nbsp;
                                                    <img runat="server" id="imgadduser" onclick="btnAddCustomerClick();" alt="" src="../images/add_user_icon.png" style="width:20px; height:20px; vertical-align:top;" />
                                                    <img runat="server" id="imgpeoplesearch" onclick="btnSelectCustomerClick();" alt="" src="../images/searchicon9.png" style="width:20px; height:20px; vertical-align:top;" />                                                                                                       
                                                </td>
                                                <td style="text-align:right;">被保险人：</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox runat="server" ID="txtpeopleto" Width="150px" Text="张三"></asp:TextBox>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right;">保险险种：</td>
                                                <td style="text-align:left;">
                                                    <asp:DropDownList ID="ddlCategory" runat="server">
                                                    <asp:ListItem Text="保险1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="保险2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="保险3" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                                </td>
                                                <td style="text-align:right;">保险期限：</td>
                                                <td>
                                                    <dxe:ASPxDateEdit ID="deStartDate" runat="server"></dxe:ASPxDateEdit>                                                    
                                                </td>
                                                <td>
                                                    <dxe:ASPxDateEdit ID="deEndDate" runat="server"></dxe:ASPxDateEdit>
                                                </td>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td style="width:92px;text-align:right;">期次：</td>
                                                            <td style="text-align:left;">
                                                                <asp:TextBox runat="server" ID="txtStage" Width="50px" Text="1"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td></td>
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
                            <asp:Panel ID="npPolicyCompanyHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float: left; vertical-align: middle;">
                                        <asp:ImageButton ID="img_npPolicyCompanyHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                    <div style="float: left; margin-left:5px;">保险公司</div>
                                    <div style="float: left; margin-left:5px;">
                                        <asp:Label ID="lbl_npPolicyCompanyHeader" runat="server">(展开)</asp:Label>
                                    </div>                                    
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="npPolicyCompanyDetail" runat="server" CssClass="collapsePanel" Height="0">
                            </asp:Panel>
                            <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
                                TargetControlID="npPolicyCompanyDetail"
                                ExpandControlID="npPolicyCompanyHeader"
                                CollapseControlID="npPolicyCompanyHeader" 
                                Collapsed="false"
                                TextLabelID="lbl_npPolicyCompanyHeader"
                                ImageControlID="img_npPolicyCompanyHeader"    
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
                                    <div style="float: left; margin-left:5px;">保险项目</div>
                                    <div style="float: left; margin-left:5px;">
                                        <asp:Label ID="lbl_npGridPolicyItem" runat="server">(展开)</asp:Label>
                                    </div>                                    
                                </div>
                            </asp:Panel>  
                            <asp:Panel ID="npGridPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width:100%">
                                            <tr>
                                                <td style="width:8%;text-align:right;"></td>                                                
                                            </tr> 
                                            <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server" 
                                                    KeyFieldName="ItemID" Width="100%" AutoGenerateColumns="False" 
                                                    OnRowInserting="gridPolicyItem_RowInserting" 
                                                    OnRowUpdating="gridPolicyItem_RowUpdating" 
                                                    OnRowUpdated="gridPolicyItem_RowUpdated" 
                                                    OnRowInserted="gridPolicyItem_RowInserted"
                                                    OnRowDeleting="gridPolicyItem_RowDeleting" 
                                                    OnRowDeleted="gridPolicyItem_RowDeleted"
                                                     >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" VisibleIndex="0">
                                                                    <NewButton Visible="True" />
                                                                    <EditButton Visible="true" />
                                                                    <DeleteButton Visible="true" />
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ItemID" Caption="项目编号" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProdID" Caption="项目编码" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProdName" Caption="项目名称" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Coverage" Caption="保额" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Premium" Caption="保费" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProcRate" Caption="经纪费率" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Process" Caption="经纪费" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowAllRecords"/>
                                                        <Settings ShowGroupPanel="false" />                                                        
                                                        <Templates>
                                                             <EditForm>                                                             
                                                             <div style="padding:4px 4px 3px 4px">
                                                                <table style=" width:90%;" runat="server" id="tblgridPolicyItemEditorTemplate">
                                                                    <tr>
                                                                        <td style="white-space:nowrap; text-align:right;">项目编号:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridItemID" Text='<%# Eval("ItemID") %>'  Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                        <td style="white-space:nowrap; text-align:right;">项目编码:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:DropDownList ID="ddlGridProdID" runat="server">
                                                                                <asp:ListItem Text="编码三" Value="1"></asp:ListItem>
                                                                                <asp:ListItem Text="编码四" Value="2"></asp:ListItem>
                                                                                <asp:ListItem Text="编码五" Value="3"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="white-space:nowrap; text-align:right;">项目名称:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridProdName" Text='<%# Eval("ProdName") %>' Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                        <td style="white-space:nowrap; text-align:right;">保额:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridCoverage" Text='<%# Eval("Coverage") %>'></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="white-space:nowrap; text-align:right;">保费:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridPremium" Text='<%# Eval("Premium") %>'></asp:TextBox>
                                                                        </td>
                                                                        <td style="white-space:nowrap; text-align:right;">经纪费率:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridProcRate" Text='<%# Eval("ProcRate") %>'></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="white-space:nowrap; text-align:right;">经纪费:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridProcess" Text='<%# Eval("Process") %>'></asp:TextBox>
                                                                        </td>
                                                                        <td style="white-space:nowrap; text-align:right;"></td>
                                                                        <td style="text-align:left;"></td>
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
                                                <td style="width:11%;text-align:right;">保额：</td>
                                                <td style="width:22%;text-align:left;">
                                                    <asp:TextBox ID="txtprice" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:11%;text-align:right;">保费（原）：</td>
                                                <td style="width:22%;text-align:left;">
                                                    <asp:TextBox ID="txtoriginalfee" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:11%;text-align:right;">币种：</td>
                                                <td style="width:20%;text-align:left;">
                                                    <asp:DropDownList ID="DropDownList2" runat="server">
                                                        <asp:ListItem Text="人民币" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="美元" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="英镑" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">换算汇率：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtchange" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;">保费（本）：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtlocalfee" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;">经纪费：</td>
                                                <td style="width:23%;text-align:left;">
                                                    <asp:TextBox ID="txtmiddlefee" runat="server" Width="120px"></asp:TextBox>
                                                </td>                                  
                                            </tr>                                             
                                            <tr>
                                                <td style="width:8%;text-align:right;">部门：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlDeptId" runat="server">
                                                        <asp:ListItem Text="部门1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="部门2" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="部门3" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">客户经理：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlcustomermanager" runat="server">
                                                        <asp:ListItem Text="经理1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="经理2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">业务性质：</td>
                                                <td style="width:23%;text-align:left;">
                                                    <asp:DropDownList ID="ddlKind" runat="server">
                                                        <asp:ListItem Text="业务性质1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="业务性质2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">收款方式：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlGatheringType" runat="server">
                                                        <asp:ListItem Text="收款方式1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="收款方式2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">录单人：</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtCreatePerson" runat="server" Width="120px" Enabled="false"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;">录单日期：</td>
                                                <td style="width:23%;text-align:left;">
                                                    <asp:TextBox ID="txtCreateTime" runat="server" Width="120px" Enabled="false"></asp:TextBox>
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
                    </table>
                    
            </dxw:ContentControl></ContentCollection></dxtc:TabPage>
                    
            <dxtc:TabPage Text="附件">
                <ContentCollection><dxw:ContentControl runat="server">
                    <table style="width:100%">
                        <tr>
                            <td style="width:8%;text-align:left;">附件：<asp:TextBox it="txtTargetType" runat="server" ReadOnly></asp:TextBox></td>
                            
                        </tr>
                    </table>            
                </dxw:ContentControl></ContentCollection>
            </dxtc:TabPage>
            
            
            <dxtc:TabPage Text="分    期" ClientVisible="true">
                <ContentCollection><dxw:ContentControl ID="ContentControl2" runat="server">
                    <table style="width:100%">
                        <tr>
                            <td>
                                <dxwgv:ASPxGridView ID="gridPeriod" ClientInstanceName="gridPeriod" runat="server" KeyFieldName="PolPeriodId" Width="100%">
                                    <%-- BeginRegion Columns --%>
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="false" VisibleIndex="0">
                                                <NewButton Visible="true" />
                                                <EditButton Visible="true" />
                                            </dxwgv:GridViewCommandColumn>
                                            <dxwgv:GridViewDataColumn FieldName="Period" Caption="期数" CellStyle-Wrap="false" VisibleIndex="1">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="PayDate" Caption="付款日期 " CellStyle-Wrap="false" VisibleIndex="2">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="PayFee" Caption="保费金额" CellStyle-Wrap="false" VisibleIndex="3">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="FeeProcRate" Caption="经纪费率" CellStyle-Wrap="false" VisibleIndex="4">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="FeeProcFee" Caption="经纪费" CellStyle-Wrap="false" VisibleIndex="5">
                                            </dxwgv:GridViewDataColumn>
                                        </Columns>
                                    <%-- EndRegion --%>
                                    <SettingsEditing PopupEditFormWidth="600px" />
                                    <Settings ShowGroupPanel="false" />
                                </dxwgv:ASPxGridView>
                            </td>
                        </tr>
                    </table>            
                </dxw:ContentControl></ContentCollection>
            </dxtc:TabPage>
            
         
        </TabPages>
         
        
    </dxtc:ASPxPageControl>
    
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
