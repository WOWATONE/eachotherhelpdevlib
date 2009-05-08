<%@ Page Title="����¼��" Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="PolicyInput.aspx.cs" Inherits="OSPortalWebApp.otherinsurance.PolicyInput" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>����¼��</title>
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
    </script>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="insuranceDetailTabPage" ClientInstanceName="insuranceDetailTabPage" runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%">
        <ClientSideEvents 
            ActiveTabChanging="function(s, e) {}" 
            TabClick="function(s, e) {}" />
        <TabPages>
            
            <dxtc:TabPage Text="������������">                
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
                                    <div style="float: left; margin-left:5px;">������������</div>
                                    <div style="float: left; margin-left:5px;">
                                        <asp:Label ID="lbl_npbasicheader" runat="server">(չ��)</asp:Label>
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
                                                <td style="text-align:right;">������ţ�</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox ID="txtSN" runat="server" Width="120px"></asp:TextBox>&nbsp;<asp:CheckBox runat="server" ID="chkAgain" Text="�ٱ�" />
                                                </td>
                                                <td style="text-align:right;">Ͷ���ˣ�</td>
                                                <td style="text-align:left;"> 
                                                    <asp:TextBox ID="txtpeoplefrom" runat="server" Width="100px" Text="����"></asp:TextBox>&nbsp;
                                                    <img runat="server" id="imgadduser" onclick="btnAddCustomerClick();" alt="" src="../images/add_user_icon.png" style="width:20px; height:20px; vertical-align:top;" />
                                                    <img runat="server" id="imgpeoplesearch" onclick="btnSelectCustomerClick();" alt="" src="../images/searchicon9.png" style="width:20px; height:20px; vertical-align:top;" />                                                                                                       
                                                </td>
                                                <td style="text-align:right;">�������ˣ�</td>
                                                <td style="text-align:left;">
                                                    <asp:TextBox runat="server" ID="txtpeopleto" Width="150px" Text="����"></asp:TextBox>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right;">�������֣�</td>
                                                <td style="text-align:left;">
                                                    <asp:DropDownList ID="ddlCategory" runat="server">
                                                    <asp:ListItem Text="����1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="����2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="����3" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                                </td>
                                                <td style="text-align:right;">�������ޣ�</td>
                                                <td>
                                                    <dxe:ASPxDateEdit ID="deStartDate" runat="server"></dxe:ASPxDateEdit>                                                    
                                                </td>
                                                <td>
                                                    <dxe:ASPxDateEdit ID="deEndDate" runat="server"></dxe:ASPxDateEdit>
                                                </td>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td style="width:92px;text-align:right;">�ڴΣ�</td>
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
                                ExpandedText="(չ��)"
                                CollapsedText="(����)"
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
                                    <div style="float: left; margin-left:5px;">���չ�˾</div>
                                    <div style="float: left; margin-left:5px;">
                                        <asp:Label ID="lbl_npPolicyCompanyHeader" runat="server">(չ��)</asp:Label>
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
                                                    OnStartRowEditing="gridCarrier_StartRowEditing"
                                                    OnRowInserting="gridCarrier_RowInserting" 
                                                    OnRowUpdating="gridCarrier_RowUpdating" 
                                                    OnRowUpdated="gridCarrier_RowUpdated" 
                                                    OnRowInserted="gridCarrier_RowInserted"
                                                    OnRowDeleting="gridCarrier_RowDeleting" 
                                                    OnRowDeleted="gridCarrier_RowDeleted"
                                                     >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;">
                                                                    <NewButton Visible="True" />
                                                                    <EditButton Visible="true" />
                                                                    <DeleteButton Visible="true" />
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CarrierNo" Caption="���չ�˾���" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="CarrierNameCn" Caption="���չ�˾" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="��֧����" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="PolicyRate" Caption="�ݶ����" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Premium" Caption="����" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProcessRate" Caption="���ͷѱ���" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Process" Caption="���ͷ�" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Poundage" Caption="������" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Tax" Caption="˰��" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>                                                                 
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowAllRecords"/>
                                                        <Settings ShowGroupPanel="false" />                                                        
                                                        <Templates>
                                                             <EditForm>                                                             
                                                             <div style="padding:4px 4px 3px 4px">                                                                
                                                                <table style=" width:90%;" runat="server" id="tblgridCarrierEditorTemplate">
                                                                    <tr>
                                                                        <td style="white-space:nowrap; text-align:right;">���չ�˾���:</td>
                                                                        <td style="text-align:left;">
                                                                           <dxe:ASPxComboBox runat="server" ID="decbGridCarrierNo" 
                                                                                AutoPostBack="false" ClientInstanceName="decbGridCarrierNo" 
                                                                                DropDownButton-Enabled="true" DropDownStyle="DropDownList" Width="100px">
                                                                                <Items>
                                                                                    <dxe:ListEditItem Text="�й�ƽ��" Value="1" />
                                                                                    <dxe:ListEditItem Text="�й�̩��" Value="2" />
                                                                                    <dxe:ListEditItem Text="�й�����" Value="3" />
                                                                                </Items>
                                                                                <ClientSideEvents SelectedIndexChanged="" />
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                        <td style="white-space:nowrap; text-align:right;">���չ�˾:</td>
                                                                        <td style="text-align:left;">
                                                                            <dxe:ASPxTextBox runat="server" ID="detxtGridCarrierNameCn" ClientInstanceName="detxtGridCarrierNameCn" Text='<%# Eval("CarrierNameCn") %>' Enabled="false"></dxe:ASPxTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="white-space:nowrap; text-align:right;">��֧����:</td>
                                                                        <td style="text-align:left;">
                                                                            <dxe:ASPxComboBox runat="server" ID="decbGridBranchName" 
                                                                                AutoPostBack="false" ClientInstanceName="decbGridBranchName"
                                                                                DropDownButton-Enabled="true" DropDownStyle="DropDownList" Width="100px">
                                                                                <Items>
                                                                                    <dxe:ListEditItem Text="ƽ����֧1" Value="1" />
                                                                                    <dxe:ListEditItem Text="̩����֧1" Value="2" />
                                                                                    <dxe:ListEditItem Text="������֧1" Value="3" />
                                                                                </Items>                                                                                
                                                                                <ClientSideEvents SelectedIndexChanged="" />
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                        <td style="white-space:nowrap; text-align:right;">�ݶ����:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridPolicyRate" Text='<%# Eval("PolicyRate") %>'></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="white-space:nowrap; text-align:right;">����:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridPremium" Text='<%# Eval("Premium") %>'></asp:TextBox>
                                                                        </td>
                                                                        <td style="white-space:nowrap; text-align:right;">���ͷѱ���:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridProcessRate" Text='<%# Eval("ProcessRate") %>'></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="white-space:nowrap; text-align:right;">���ͷ�:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridProcess" Text='<%# Eval("Process") %>'></asp:TextBox>
                                                                        </td>
                                                                        <td style="white-space:nowrap; text-align:right;">������:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridPoundage" Text='<%# Eval("Poundage") %>'></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="white-space:nowrap; text-align:right;">˰��:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridTax" Text='<%# Eval("Tax") %>'></asp:TextBox>
                                                                        </td>
                                                                        <td style="white-space:nowrap; text-align:right;">:</td>
                                                                        <td style="text-align:left;">
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
                            <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
                                TargetControlID="npPolicyCompanyDetail"
                                ExpandControlID="npPolicyCompanyHeader"
                                CollapseControlID="npPolicyCompanyHeader" 
                                Collapsed="false"
                                TextLabelID="lbl_npPolicyCompanyHeader"
                                ImageControlID="img_npPolicyCompanyHeader"    
                                ExpandedText="(չ��)"
                                CollapsedText="(����)"
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
                                    <div style="float: left; margin-left:5px;">������Ŀ</div>
                                    <div style="float: left; margin-left:5px;">
                                        <asp:Label ID="lbl_npGridPolicyItem" runat="server">(չ��)</asp:Label>
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
                                                                <dxwgv:GridViewDataColumn FieldName="ItemID" Caption="��Ŀ���" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProdID" Caption="��Ŀ����" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProdName" Caption="��Ŀ����" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Coverage" Caption="����" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Premium" Caption="����" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="ProcRate" Caption="���ͷ���" CellStyle-Wrap="False">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="Process" Caption="���ͷ�" CellStyle-Wrap="False">
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
                                                                        <td style="white-space:nowrap; text-align:right;">��Ŀ���:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridItemID" Text='<%# Eval("ItemID") %>'  Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                        <td style="white-space:nowrap; text-align:right;">��Ŀ����:</td>
                                                                        <td style="text-align:left;">
                                                                            <dxe:ASPxComboBox runat="server" ID="decbGridProdID" 
                                                                                AutoPostBack="false" ClientInstanceName="decbGridProdID" 
                                                                                DropDownButton-Enabled="true" DropDownStyle="DropDownList" Width="100px">
                                                                                <Items>
                                                                                    <dxe:ListEditItem Text="������" Value="1" />
                                                                                    <dxe:ListEditItem Text="������" Value="2" />
                                                                                    <dxe:ListEditItem Text="������" Value="3" />
                                                                                </Items>
                                                                                <ClientSideEvents SelectedIndexChanged="gridGridProdIDChange" />
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="white-space:nowrap; text-align:right;">��Ŀ����:</td>
                                                                        <td style="text-align:left;">
                                                                            <dxe:ASPxTextBox runat="server" ID="detxtGridProdName" ClientInstanceName="detxtGridProdName" Text='<%# Eval("ProdName") %>' Enabled="false"></dxe:ASPxTextBox>
                                                                        </td>
                                                                        <td style="white-space:nowrap; text-align:right;">����:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridCoverage" Text='<%# Eval("Coverage") %>'></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="white-space:nowrap; text-align:right;">����:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridPremium" Text='<%# Eval("Premium") %>'></asp:TextBox>
                                                                        </td>
                                                                        <td style="white-space:nowrap; text-align:right;">���ͷ���:</td>
                                                                        <td style="text-align:left;">
                                                                            <asp:TextBox runat="server" ID="txtGridProcRate" Text='<%# Eval("ProcRate") %>'></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="white-space:nowrap; text-align:right;">���ͷ�:</td>
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
                                ExpandedText="(չ��)"
                                CollapsedText="(����)"
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
                                    <div style="float: left; margin-left:5px;">������Ŀ</div>
                                    <div style="float: left; margin-left:5px;">
                                        <asp:Label ID="lbl_npOtherPolicyItemHeader" runat="server">(չ��)</asp:Label>
                                    </div>
                                    
                                </div>
                            </asp:Panel> 
                            <asp:Panel ID="npOtherPolicyItemDetail" runat="server" CssClass="collapsePanel" Height="0">
                                        <table style="width:100%">
                                            <tr>
                                                <td style="width:11%;text-align:right;">���</td>
                                                <td style="width:22%;text-align:left;">
                                                    <asp:TextBox ID="txtprice" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:11%;text-align:right;">���ѣ�ԭ����</td>
                                                <td style="width:22%;text-align:left;">
                                                    <asp:TextBox ID="txtoriginalfee" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:11%;text-align:right;">���֣�</td>
                                                <td style="width:20%;text-align:left;">
                                                    <asp:DropDownList ID="DropDownList2" runat="server">
                                                        <asp:ListItem Text="�����" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="��Ԫ" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Ӣ��" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">������ʣ�</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtchange" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;">���ѣ�������</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtlocalfee" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;">���ͷѣ�</td>
                                                <td style="width:23%;text-align:left;">
                                                    <asp:TextBox ID="txtmiddlefee" runat="server" Width="120px"></asp:TextBox>
                                                </td>                                  
                                            </tr>                                             
                                            <tr>
                                                <td style="width:8%;text-align:right;">���ţ�</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlDeptId" runat="server">
                                                        <asp:ListItem Text="����1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="����2" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="����3" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">�ͻ�����</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlcustomermanager" runat="server">
                                                        <asp:ListItem Text="����1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="����2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">ҵ�����ʣ�</td>
                                                <td style="width:23%;text-align:left;">
                                                    <asp:DropDownList ID="ddlKind" runat="server">
                                                        <asp:ListItem Text="ҵ������1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="ҵ������2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">�տʽ��</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlGatheringType" runat="server">
                                                        <asp:ListItem Text="�տʽ1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="�տʽ2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">¼���ˣ�</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtCreatePerson" runat="server" Width="120px" Enabled="false"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;">¼�����ڣ�</td>
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
                                ExpandedText="(չ��)"
                                CollapsedText="(����)"
                                ExpandedImage="~/images/collapse_blue.jpg"
                                CollapsedImage="~/images/expand_blue.jpg"
                                SuppressPostBack="true" />
                            </td>
                        </tr>
                    </table>
                    
            </dxw:ContentControl></ContentCollection></dxtc:TabPage>
                    
            <dxtc:TabPage Text="����">
                <ContentCollection><dxw:ContentControl runat="server">
                    <table style="width:100%">
                        <tr>
                            <td style="width:100%;text-align:left;">����</td>                            
                        </tr>
                        <tr>
                            <td style="width:100%;text-align:left;">
                                <dxuc:ASPxUploadControl ID="filesUploadControl" runat="server" 
                                    ShowAddRemoveButtons="True" Width="400px"
                                    ShowUploadButton="True" AddUploadButtonsHorizontalPosition="Center" ShowProgressPanel="True"
                                    ClientInstanceName="UploadControl" 
                                    OnFileUploadComplete="UploadControl_FileUploadComplete" 
                                    FileInputCount="5" RemoveButtonSpacing="8px" AddUploadButtonsSpacing="10">
                                    <ValidationSettings MaxFileSize="4000000" AllowedContentTypes="*"></ValidationSettings>
                                    <ClientSideEvents
                                         fileuploadcomplete="function(s, e) { FileUploaded(s, e) }"
                                         fileuploadstart="function(s, e) { FileUploadStart(); }"
                                    />
                                    <RemoveButton Text="" Image-Url="../images/file_remove.gif" Image-Height="25px" Image-Width="25px" ImagePosition="Left"></RemoveButton>
                                    <AddButton Text="" Image-Url="../images/file_add.gif" Image-Height="25px" Image-Width="25px" ImagePosition="Left"></AddButton>
                                    <UploadButton Text="" Image-Url="../images/file_upload.gif" Image-Height="25px" Image-Width="25px" ImagePosition="Left"></UploadButton> 
                                                                       
                                </dxuc:ASPxUploadControl>

                            </td>                            
                        </tr>
                    </table>            
                </dxw:ContentControl></ContentCollection>
            </dxtc:TabPage>
            
            
            <dxtc:TabPage Text="��    ��" ClientVisible="true">
                <ContentCollection><dxw:ContentControl ID="ContentControl2" runat="server">
                    <table style="width:100%">
                        <tr>
                            <td>
                                <dxwgv:ASPxGridView ID="gridPeriod" ClientInstanceName="gridPeriod" runat="server" KeyFieldName="PolPeriodId" Width="100%"
                                OnStartRowEditing="gridPeriod_StartRowEditing"
                                OnRowInserting="gridPeriod_RowInserting" 
                                OnRowUpdating="gridPeriod_RowUpdating" 
                                OnRowUpdated="gridPeriod_RowUpdated" 
                                OnRowInserted="gridPeriod_RowInserted"
                                OnRowDeleting="gridPeriod_RowDeleting" 
                                OnRowDeleted="gridPeriod_RowDeleted"
                                >
                                    <%-- BeginRegion Columns --%>
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="false">
                                                <EditButton Visible="true" />
                                            </dxwgv:GridViewCommandColumn>
                                            <dxwgv:GridViewDataColumn FieldName="Period" Caption="�ڴ�" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="CarrierNameCn" Caption="���չ�˾" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="��֧����" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="PayDate" Caption="��������" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="PayFeeBase" Caption="����" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>                                            
                                            <dxwgv:GridViewDataColumn FieldName="PayProcBase" Caption="���ͷ�" CellStyle-Wrap="false">
                                            </dxwgv:GridViewDataColumn>
                                        </Columns>
                                    <%-- EndRegion --%>
                                    <SettingsEditing PopupEditFormWidth="600px" />
                                    <Settings ShowGroupPanel="false" />
                                    <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                    <Templates>
                                         <EditForm>                                                             
                                         <div style="padding:4px 4px 3px 4px">                                                                
                                            <table style=" width:90%;" runat="server" id="tblgridPeriodEditorTemplate">
                                                <tr>
                                                    <td style="white-space:nowrap; text-align:right;">�ڴ�:</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxTextBox runat="server" ID="detxtGridPeriodPeriod" ClientInstanceName="detxtGridPeriodPeriod" Text='<%# Eval("Period") %>' Enabled="false"></dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="white-space:nowrap; text-align:right;">���չ�˾:</td>
                                                    <td style="text-align:left;">
                                                       <dxe:ASPxTextBox runat="server" ID="detxtGridPeriodCarrierNameCn" ClientInstanceName="detxtGridPeriodCarrierNameCn" Text='<%# Eval("CarrierNameCn") %>' Enabled="false"></dxe:ASPxTextBox>
                                                    </td>                                                    
                                                </tr>
                                                <tr>
                                                    <td style="white-space:nowrap; text-align:right;">��֧����:</td>
                                                    <td style="text-align:left;">
                                                       <dxe:ASPxTextBox runat="server" ID="detxtGridPeriodBranchName" ClientInstanceName="detxtGridPeriodBranchName" Text='<%# Eval("BranchName") %>' Enabled="false"></dxe:ASPxTextBox> 
                                                    </td>
                                                    <td style="white-space:nowrap; text-align:right;">��������:</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="detxtGridPeriodPayDate" ClientInstanceName="detxtGridPeriodPayDate" runat="server"></dxe:ASPxDateEdit> 
                                                    </td>
                                                </tr>
                                                <tr>                                                    
                                                    <td style="white-space:nowrap; text-align:right;">����:</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxTextBox runat="server" ID="detxtGridPeriodPayFeeBase" ClientInstanceName="detxtGridPeriodPayFeeBase" Text='<%# Eval("PayFeeBase") %>'></dxe:ASPxTextBox>
                                                    </td>
                                                    <td style="white-space:nowrap; text-align:right;">���ͷ�:</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxTextBox runat="server" ID="detxtGridPeriodPayProcBase" ClientInstanceName="detxtGridPeriodPayProcBase" Text='<%# Eval("PayProcBase") %>'></dxe:ASPxTextBox>
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
                </dxw:ContentControl></ContentCollection>
            </dxtc:TabPage>
            
         
        </TabPages>
         
        
    </dxtc:ASPxPageControl>
    
    <table style="height:5px; background-color:#E0EDFF; width:100%; font-size:2px;"><tr><td></td></tr></table>
    
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="25px">
                <table style="width:100%">
                    <tr>
                        <td style="text-align:right;">
                            <asp:Button ID="btnadd" runat="server" Text="����" CssClass="input_2" />&nbsp;&nbsp;
                            <asp:Button ID="btnsave" runat="server" Text="����" CssClass="input_2" />&nbsp;&nbsp;
                            <asp:Button ID="btnApplyCheck" runat="server" Text="�ύ���" CssClass="input_2" />&nbsp;&nbsp;
                            <asp:Button ID="btncancel" runat="server" Text="ȡ��" CssClass="input_2" />
                        </td>  
                        <td style="width:20px;text-align:left;">
                            &nbsp;
                        </td>                                                                  
                    </tr>
                </table>
                
     </asp:Panel>
                                        
</asp:Content>
