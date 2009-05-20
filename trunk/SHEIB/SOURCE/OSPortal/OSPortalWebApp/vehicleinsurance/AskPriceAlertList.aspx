<%@ Page Title="ѯ�۵������б�" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="AskPriceAlertList.aspx.cs" Inherits="OSPortalWebApp.vehicleinsurance.AskPriceAlertList" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ѯ�۵������б�</title>
    <script type="text/javascript">
	    $(document).ready(function() {
	        //jQuery.noticeAdd({
	        //    text: 'This is a notification that you have to remove',
	        //    stay: true
	    //});

	    lblCurrentDate.innerHTML = makewelcomeString();

	});


	function btnCreateClick() {
	    var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
	    window.showModalDialog("AskPriceAlert.aspx", "", myArguments);
	}

	function gridCustomButtonClick(s, e) {
	    var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
	    window.showModalDialog("AskPriceAlert.aspx", self, myArguments);
	}
	function imgPolicyProdTypeClick() {
	    var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
	    //window.showModalDialog("PolicyProdType.aspx", self, myArguments);
	}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <table style="width:100%"> 
                    <tr>
                        <td style="height:40px; width:45%;">
                            <dxe:ASPxButton ID="debtnCreate" runat="server" Text="�½�" AutoPostBack="false">
                                <ClientSideEvents Click="btnCreateClick" />
                            </dxe:ASPxButton>
                        </td>
                        <td style="height:40px; width:55%;text-align:left;color:#0E5ED5;">
                            ��ǰλ�ã�ѯ�۵�����&nbsp;&nbsp;
					                            <asp:label id="LbUserNameTop" runat="server" Text="����"></asp:label>�����ã�������
						                        <label id="lblCurrentDate"></label>
                        </td>
                    </tr>                   
                    <tr>
                        <td style="width:100%;" colspan="2"> 
                            <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float:left; vertical-align: middle;">
                                        <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                    <div style="float:left; margin-left:5px;">������Ŀ</div>
                                    <div style="float:left; margin-left:5px;">
                                        <asp:Label ID="lbl_npSearchHeader" runat="server">(չ��)</asp:Label>
                                    </div>
                                    
                                </div>
                            </asp:Panel>                           
                            <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                                
                                                                        
                                <table>
                                                <tr>
                                                    <td style="width:70px;text-align:right;">Ͷ�����ţ�</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:TextBox ID="txtPrePolicyNo" runat="server" Width="175px"></asp:TextBox>
                                                    </td>
                                                    
                                                    <td style="width:70px;text-align:right;">������ţ�</td>
                                                    <td style="width:180px;text-align:left;">
                                                        <asp:TextBox ID="txtPolicyNo" runat="server" Width="175px"></asp:TextBox>
                                                    </td>
                                                    <td style="width:70px;text-align:right;">Ͷ���ͻ���</td>
                                                    <td style="width:160px;text-align:left;">
                                                        <asp:TextBox ID="txtCustomer" runat="server" Width="175px"></asp:TextBox> 
                                                    </td>
                                                    <td></td>                                                    
                                                </tr> 
                                                <tr>
                                                    <td style="text-align:right;">���ţ�</td>
                                                    <td style="text-align:left;">
                                                       <asp:DropDownList runat="server" ID="ddlDeptId">
                                                            <asp:ListItem Text="(ȫ��)" Value=""></asp:ListItem>
                                                        </asp:DropDownList>                                                         
                                                    </td>
                                                    <td style="text-align:right;">�ͻ�����</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlSalesId">
                                                            <asp:ListItem Text="(ȫ��)" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align:right;">���֣�</td>
                                                    <td style="text-align:left;">
                                                        <asp:TextBox ID="txtProdTypeID" runat="server" Width="120px"></asp:TextBox>
                                                        <img runat="server" id="imgpeoplesearch" alt="" src="../images/searchicon9.png" style="width:20px; height:20px; vertical-align:top;" onclick="imgPolicyProdTypeClick();" />                                                        
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;">ҵ����Դ��</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlSourceTypeID">
                                                            <asp:ListItem Text="��Դ1" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>                                                       
                                                    </td>
                                                    <td style="text-align:right;">ҵ�����ʣ�</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlFlagContinue">
                                                            <asp:ListItem Text="����" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align:right;">¼���ˣ�</td>
                                                    <td style="text-align:left;">
                                                        <asp:TextBox ID="txtCreatePerson" runat="server" Width="155px"></asp:TextBox>                                                       
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;">���չ�˾��</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlCarrierId">
                                                            <asp:ListItem Text="�й�ƽ�����չ�˾" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>                                                       
                                                    </td>
                                                    <td style="text-align:right;">��֧������</td>
                                                    <td style="text-align:left;">
                                                        <asp:DropDownList runat="server" ID="ddlBranchId">
                                                            <asp:ListItem Text="�й�ƽ�����չ�˾" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align:right;"></td>
                                                    <td style="text-align:left;"></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;">Ͷ�����ڣ�</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deStartDate" runat="server">
                                                        </dxe:ASPxDateEdit>                                                       
                                                    </td>
                                                    <td style="text-align:center;">��</td>
                                                    <td style="text-align:left;">
                                                        <dxe:ASPxDateEdit ID="deEndDate" runat="server"></dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="text-align:right;" colspan="2">
                                                        <asp:Button ID="btnSearch" runat="server" Text="��ѯ" CssClass="input_2" />&nbsp;
                                                        <asp:Button ID="btnCancel" runat="server" Text="����" CssClass="input_2" />&nbsp;
                                                        <asp:Button ID="btnRefresh" runat="server" Text="ˢ��" CssClass="input_2" />
                                                    </td>
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
                                ExpandedText="(չ��)"
                                CollapsedText="(����)"
                                ExpandedImage="~/images/collapse_blue.jpg"
                                CollapsedImage="~/images/expand_blue.jpg"
                                SuppressPostBack="true" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;" colspan="2">
                            <asp:Panel ID="npSearchResultHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                                <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                                    <div style="float:left; vertical-align: middle;">
                                        <asp:ImageButton ID="img_npSearchResultHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                                    </div>
                                    <div style="float: left; margin-left:5px;">�������</div>
                                    <div style="float: left; margin-left:5px;">
                                        <asp:Label ID="lbl_npSearchResultHeader" runat="server">(չ��)</asp:Label>
                                    </div>
                                    
                                </div>
                            </asp:Panel>  
                            <asp:Panel ID="npSearchResultDetail" runat="server" CssClass="collapsePanel" Height="0">
                                     
                                     
                                <table style="width:100%">
                                           <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="gridSearchResult" ClientInstanceName="gridSearchResult" runat="server" 
                                                    KeyFieldName="PrePolicyNo" AutoGenerateColumns="False" 
                                                    Settings-ShowFooter="true" Width="100%" 
                                                    SettingsPager-AlwaysShowPager="true" 
                                                    OnRowDeleting="gridSearchResult_RowDeleting" 
                                                    OnRowDeleted="gridSearchResult_RowDeleted"
                                                    >
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False">
                                                                    <NewButton Visible="False" />
                                                                    <EditButton Visible="False" />                                                                    
                                                                    <DeleteButton Visible="false" />
                                                                    <CustomButtons>
                                                                        <dxwgv:GridViewCommandColumnCustomButton Text="�༭">                                                                            
                                                                        </dxwgv:GridViewCommandColumnCustomButton>                                                                        
                                                                    </CustomButtons>                                                   
                                                                </dxwgv:GridViewCommandColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="PrePolicyNo" Caption="Ͷ������" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="UserNameCn" Caption="�ͻ�����" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>      
                                                                <dxwgv:GridViewDataColumn FieldName="CarrierNameCn" Caption="���չ�˾" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="BranchName" Caption="��֧����" CellStyle-Wrap="False">                                                                    
                                                                </dxwgv:GridViewDataColumn>                                
                                                                <dxwgv:GridViewDataColumn FieldName="CarCount" Caption="������Ŀ" CellStyle-Wrap="False"> 
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CiPremium" Caption="��ҵ�ձ���" CellStyle-Wrap="False">   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="AciPremium" Caption="��ǿ�ձ���" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CstPremium" Caption="����˰" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>              
                                                                <dxwgv:GridViewDataColumn FieldName="PremiumTotal" Caption="���Ѻϼ�" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>         
                                                                <dxwgv:GridViewDataColumn FieldName="CiProcess" Caption="��ҵ�վ��ͷ�" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                     
                                                                <dxwgv:GridViewDataColumn FieldName="AciProcess" Caption="��ǿ�վ��ͷ�" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                                
                                                                <dxwgv:GridViewDataColumn FieldName="ProcessTotal" Caption="���ͷѺϼ�" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                                                                                                         
                                                                <dxwgv:GridViewDataColumn FieldName="CustName" Caption="Ͷ���ͻ�" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>   
                                                                <dxwgv:GridViewDataColumn FieldName="CreatePerson" Caption="¼����" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>                                                        
                                                                <dxwgv:GridViewDataDateColumn FieldName="CreateTime" Caption="¼������" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">                                                                   
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="SourceTypeName" Caption="ҵ����Դ" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="OperationTypeName" Caption="ҵ������" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="GatheringTypeName" Caption="�տʽ" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="StartDate" Caption="����������" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">                                                                   
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="EndDate" Caption="������ֹ����" CellStyle-Wrap="False" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">                                                                   
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="CheckMemo" Caption="��˱�ע" CellStyle-Wrap="False">                                                                   
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsPager Mode="ShowPager" PageSize="20" Summary-Visible="true" />
                                                        <Settings ShowGroupPanel="false" />
                                                        <ClientSideEvents CustomButtonClick="function(s, e) {gridCustomButtonClick(s,e);return false;}" />
                                                        
                                                    </dxwgv:ASPxGridView>                                                    
                                                </td>
                                            </tr>
                                        </table>
       
       
                             </asp:Panel>
                             <ajaxToolkit:CollapsiblePanelExtender ID="cpeSearchResult" runat="Server"
                                TargetControlID="npSearchResultDetail"
                                ExpandControlID="npSearchResultHeader"
                                CollapseControlID="npSearchResultHeader" 
                                Collapsed="false"
                                TextLabelID="lbl_npSearchResultHeader"
                                ImageControlID="img_npSearchResultHeader"    
                                ExpandedText="(չ��)"
                                CollapsedText="(����)"
                                ExpandedImage="~/images/collapse_blue.jpg"
                                CollapsedImage="~/images/expand_blue.jpg"
                                SuppressPostBack="true" />
                        </td>
                    </tr>                      
     </table>
     
</asp:Content>
