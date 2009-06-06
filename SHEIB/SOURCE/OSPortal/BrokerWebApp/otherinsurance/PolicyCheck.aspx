<%@ Page Title="保单审核" Language="C#" Theme="Aqua" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" CodeBehind="PolicyCheck.aspx.cs" Inherits="OSPortalWebApp.otherinsurance.PolicyCheck" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>保单审核</title>
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
            

            //
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

        function gridGridProdIDChange() {
            var theValue = decbGridProdID.GetText();            
            detxtGridProdName.SetValue(theValue);
        }


        function FileUploadStart() {
            //document.getElementById("uploadedListFiles").innerHTML = "";
        }

        function FileUploaded(s, e) {
            var fieldSeparator = "|";
            if (e.isValid) {
                //var linkFile = document.createElement("a");
                //var indexSeparator = e.callbackData.indexOf(fieldSeparator);
                //var fileName = e.callbackData.substring(0, indexSeparator);
                //var pictureUrl = e.callbackData.substring(indexSeparator + fieldSeparator.length);
                //var date = new Date();
                //var imgSrc = "UploadImages/" + pictureUrl + "?dx=" + date.getTime();
                //linkFile.innerHTML = fileName;
                //linkFile.setAttribute("href", imgSrc);
                //linkFile.setAttribute("target", "_blank");
                //var container = document.getElementById("uploadedListFiles");
                //container.appendChild(linkFile);
                //container.appendChild(document.createElement("br"));
            }
        }

        function imgPolicyProdTypeClick() {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            window.showModalDialog("PolicyProdType.aspx", self, myArguments);
        }
        
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="insuranceDetailTabPage" ClientInstanceName="insuranceDetailTabPage" runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%">
        <ClientSideEvents 
            ActiveTabChanging="function(s, e) {}" 
            TabClick="function(s, e) {}" />
        <TabPages>
            
            <dxtc:TabPage Text="保单基本资料">                
                <ContentCollection>                
                <dxw:ContentControl ID="ContentControl1" runat="server">
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
                                                    <td style="width:240px;"></td>
                                                    <td style="width:70px;"></td>
                                                    <td style="width:180px;"></td>
                                                    <td style="width:70px;"></td>
                                                    <td style="width:160px;"></td>
                                                    <td></td>
                                                </tr>
                                            <tr>
                                                <td style="text-align:right;">保单编号：</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox ID="txtSN" runat="server" Width="100px"></asp:TextBox>
                                                    <asp:CheckBox runat="server" ID="chkTogether" Text="共保" />
                                                    <asp:CheckBox runat="server" ID="chkAgain" Text="再保" /> 
                                                </td>
                                                <td style="text-align:right;">投保人：</td>
                                                <td style="text-align:left;"> 
                                                    <asp:TextBox ID="txtpeoplefrom" runat="server" Width="90px" Text="张三"></asp:TextBox>&nbsp;
                                                    <img runat="server" id="imgadduser" onclick="btnAddCustomerClick();" alt="" src="../images/add_user_icon.png" style="width:20px; height:20px; vertical-align:top;" />
                                                    <img runat="server" id="imgpeoplesearch" onclick="btnSelectCustomerClick();" alt="" src="../images/searchicon9.png" style="width:20px; height:20px; vertical-align:top;" />                                                                                                       
                                                </td>
                                                <td style="text-align:right;">被保险人：</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox runat="server" ID="txtpeopleto" Width="100px" Text="张三"></asp:TextBox>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right;">保险险种：</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox ID="txtProdTypeID" runat="server" Width="100px"></asp:TextBox>
                                                    <img runat="server" id="img1" alt="" src="../images/searchicon9.png" style="width:20px; height:20px; vertical-align:top;" onclick="imgPolicyProdTypeClick();" />
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
                                                            <td style="text-align:right;">期次：</td>
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
                                                <td style="text-align:right;"></td>                                                
                                            </tr> 
                                            <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server" 
                                                    KeyFieldName="ItemID" Width="100%" AutoGenerateColumns="False" 
                                                    >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" Visible="false">
                                                                    <NewButton Visible="false" />
                                                                    <EditButton Visible="false" />
                                                                    <DeleteButton Visible="false" />
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ItemID" Caption="项目编号" CellStyle-Wrap="False" Visible="false">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProdName" Caption="项目名称" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Coverage" Caption="保额" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PremiumRate" Caption="费率" CellStyle-Wrap="False">
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
                                                <td style="width:11%;text-align:right;">保额：</td>
                                                <td style="width:22%;text-align:left;">
                                                    <asp:TextBox ID="txtprice" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:11%;text-align:right;">费率：</td>
                                                <td style="width:22%;text-align:left;">
                                                    <asp:TextBox ID="txtoriginalfee" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:11%;text-align:right;">保费：</td>
                                                <td style="width:20%;text-align:left;">
                                                    <asp:TextBox ID="txtmiddlefee" runat="server" Width="120px"></asp:TextBox>
                                                </td>
                                                <td></td>                                 
                                            </tr> 
                                              
                                            <tr>
                                                <td style="text-align:right;">经纪费率：</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox ID="txtchange" runat="server" Width="120px"></asp:TextBox>
                                                </td>
                                                <td style="text-align:right;">经纪费：</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
                                                </td>
                                                <td style="text-align:right;"></td>
                                                <td style="text-align:left;"></td>                                                
                                                <td></td>                                  
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
                                <table style="width:100%">
                                            <tr>
                                                <td style="text-align:right;"></td>                                                
                                            </tr> 
                                            <tr>
                                                <td>
                                                <dxwgv:ASPxGridView ID="gridCarrier" ClientInstanceName="gridCarrier" runat="server" 
                                                    KeyFieldName="CarrierID" Width="100%" AutoGenerateColumns="False"                                                     
                                                     >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" Visible="false">
                                                                    <NewButton Visible="false" />
                                                                    <EditButton Visible="false" />
                                                                    <DeleteButton Visible="false" />
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="CarrierNameCn" Caption="保险公司" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="分支机构" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyRate" Caption="份额比例(%)" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Premium" Caption="保费" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProcessRate" Caption="经纪费率" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Process" Caption="经纪费" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>                                                               
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowAllRecords"/>
                                                        <Settings ShowGroupPanel="false" />
                                                    </dxwgv:ASPxGridView>
                                                </td>
                                            </tr>
                                        </table>
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
                                                <td style="width:11%;text-align:right;">部门：</td>
                                                <td style="width:22%;text-align:left;">
                                                    <asp:DropDownList ID="ddlDeptId" runat="server">
                                                        <asp:ListItem Text="部门1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="部门2" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="部门3" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:11%;text-align:right;">客户经理：</td>
                                                <td style="width:22%;text-align:left;">
                                                    <asp:DropDownList ID="ddlcustomermanager" runat="server">
                                                        <asp:ListItem Text="经理1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="经理2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:11%;text-align:right;"></td>
                                                <td style="width:22%;text-align:left;"></td> 
                                                <td></td>                                 
                                            </tr> 
                                            <tr>
                                                <td style="text-align:right;">业务性质：</td>
                                                <td style="text-align:left;">
                                                    <asp:DropDownList ID="ddlKind" runat="server">
                                                        <asp:ListItem Text="业务性质1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="业务性质2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="text-align:right;">业务来源：</td>
                                                <td style="text-align:left;">
                                                    <asp:DropDownList ID="ddlFrom" runat="server">
                                                        <asp:ListItem Text="业务来源1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="业务来源2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="text-align:right;">收款方式：</td>
                                                <td style="text-align:left;">
                                                    <asp:DropDownList ID="ddlGatheringType" runat="server">
                                                        <asp:ListItem Text="收款方式1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="收款方式2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>                                                
                                                <td></td>                                 
                                            </tr>
                                            <tr>
                                                <td style="text-align:right;">录单人：</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox ID="txtCreatePerson" runat="server" Width="120px" Enabled="false"></asp:TextBox>
                                                </td> 
                                                <td style="text-align:right;">录单日期：</td> 
                                                <td style="text-align:left;">
                                                    <asp:TextBox ID="txtCreateTime" runat="server" Width="120px" Enabled="false"></asp:TextBox>
                                                </td>                                                
                                                <td></td>
                                                <td></td>
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
                    
            </dxw:ContentControl></ContentCollection></dxtc:TabPage>
                    
            <dxtc:TabPage Text="附件">
                <ContentCollection><dxw:ContentControl ID="ContentControl2" runat="server">
                    <table style="width:100%">
                        <tr>
                            <td style="width:100%;text-align:left;" colspan="2">附件列表</td>                            
                        </tr>
                        <tr>
                            <td style="width:10%;text-align:right;">1</td>
                            <td style="width:90%;text-align:left;">file1.doc</td>                            
                        </tr>
                        <tr>
                            <td style="width:10%;text-align:right;">2</td>
                            <td style="width:90%;text-align:left;">file2.doc</td>                            
                        </tr>
                    </table>            
                </dxw:ContentControl></ContentCollection>
            </dxtc:TabPage>
            
            
            <dxtc:TabPage Text="分    期" ClientVisible="true">
                <ContentCollection><dxw:ContentControl ID="ContentControl3" runat="server">
                    <table style="width:100%">
                        <tr>
                            <td>
                                <dxwgv:ASPxGridView ID="gridPeriod" ClientInstanceName="gridPeriod" runat="server" KeyFieldName="PolPeriodId" Width="100%"
                                >
                                    <%-- BeginRegion Columns --%>
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="false" Visible="false">
                                                <EditButton Visible="false" />
                                            </dxwgv:GridViewCommandColumn>
                                            <dxwgv:GridViewDataColumn FieldName="Period" Caption="期次" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataDateColumn FieldName="PayDate" Caption="付款日期" CellStyle-Wrap="false" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                            </dxwgv:GridViewDataDateColumn>
                                            <dxwgv:GridViewDataColumn FieldName="CarrierNameCn" Caption="保险公司" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="分支机构" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="PayFeeBase" Caption="保费" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>                                            
                                            <dxwgv:GridViewDataColumn FieldName="PayProcBase" Caption="经纪费" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>
                                        </Columns>
                                    <%-- EndRegion --%>
                                    <SettingsEditing PopupEditFormWidth="600px" />
                                    <Settings ShowGroupPanel="false" />
                                    <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                    
                                </dxwgv:ASPxGridView>
                            </td>
                        </tr>
                    </table>            
                </dxw:ContentControl></ContentCollection>
            </dxtc:TabPage>
            
            <dxtc:TabPage Text="审核信息">
                <ContentCollection><dxw:ContentControl ID="ContentControl4" runat="server">
                    <table style="width:100%">
                        <tr>
                            <td style="width:10%;text-align:right;">审核人：</td>
                            <td style="width:20%;text-align:left;">
                                <asp:TextBox ID="TextBox2" runat="server" Width="100px" Enabled="false"></asp:TextBox>
                            </td>
                            <td style="width:10%;text-align:right;">审核日期：</td>
                            <td style="width:20%;text-align:left;">
                                <dxe:ASPxDateEdit ID="ASPxDateEdit1" runat="server"></dxe:ASPxDateEdit>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align:right; vertical-align:top;">审核备注：</td>
                            <td style="text-align:left;" colspan="3">                                                
                                <textarea runat="server" id="Textarea1" rows="5" cols="72"></textarea>
                            </td>
                            <td></td>
                        </tr>
                    </table>            
                </dxw:ContentControl></ContentCollection>
            </dxtc:TabPage>
            
         
        </TabPages>
         
        
    </dxtc:ASPxPageControl>
    
    <table style="height:5px; background-color:#E0EDFF; width:100%; font-size:2px;"><tr><td></td></tr></table>
    
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="180px">
                <table style="width:100%">                    
                    <tr>
                        <td></td> 
                        <td style="text-align:right;" colspan="3">
                            <asp:Button ID="btnsave" runat="server" Text="返回修改" CssClass="input_2" />&nbsp;&nbsp;
                            <asp:Button ID="btnApplyCheck" runat="server" Text="审核通过" CssClass="input_2" />&nbsp;&nbsp;
                            <asp:Button ID="btnInvertCheck" runat="server" Text="反审核" CssClass="input_2" />&nbsp;&nbsp;
                            <asp:Button ID="btncancel" runat="server" Text="取消" CssClass="input_2" />
                        </td>  
                        <td></td>                                                                  
                    </tr>
                </table>
                
     </asp:Panel>
    
    
</asp:Content>
