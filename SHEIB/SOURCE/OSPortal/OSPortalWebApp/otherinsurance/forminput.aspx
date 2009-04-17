<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMastePages/ContentMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="forminput.aspx.cs" Inherits="OSPortalWebApp.otherinsurance.forminput" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta content="zh-CN" http-equiv="Content-Language" />
    <link rel="stylesheet" type="text/css" href="../css/ie.css" />
    <script src="../js/jquery-1.3.2.js" type="text/javascript"></script>
	<script src="../js/jquerynotice/jquery.notice.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/jquery-ui-1.7.1.custom.min.js"></script>
    <script type="text/javascript" src="../js/ui.datepicker-zh-CN.js"></script>
    <link type="text/css" href="../js/css/smoothness/jquery-ui-1.7.1.custom.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="../js/jquerynotice/jquery.notice.css" />
	<script type="text/javascript">
	    $(document).ready(function() {
	        jQuery.noticeAdd({
	            text: 'This is a notification that you have to remove',
	            stay: true
	        });

	        $("#<%=txtStartDate.ClientID %>").datepicker(
                {
                    minDate: null,
                    maxDate: null,
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    changeYear: true
                }
            );

                $("#<%=txtEndDate.ClientID %>").datepicker(
                {
                    minDate: null,
                    maxDate: null,
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    changeYear: true
                }
            );
            
	    });
    </script>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxtc:ASPxPageControl ID="carTabPage" runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%">
        <TabPages>
            <dxtc:TabPage Text="������������"><ContentCollection><dxw:ContentControl runat="server">
                <table style="width:99%">
                    <tr>
                        <td style="width:100%;">                            
                            <dxrp:ASPxRoundPanel EnableViewState="False" HeaderText="������������" ID="rpbasic" EnableDefaultAppearance="False" Width="100%" runat="server" BackColor="#F8FAFD" ShowHeader="false"  HorizontalAlign="Center">
                                 <PanelCollection>
                                     <dxrp:PanelContent ID="PanelContent2" runat="server">
                                        <table style="width:100%">
                                            <tr>
                                                <td style="width:8%;text-align:right;">������ţ�</td>
                                                <td style="width:25%;text-align:left;"><asp:TextBox ID="txtSN" runat="server" Width="200px"></asp:TextBox></td>
                                                <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkReinsurance" runat="server" /></td>
                                                <td style="width:25%;text-align:left;"><asp:Button ID="btnReinsurance" runat="server" Text="�ٱ���" CssClass="input_2" /> </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:8%;text-align:right;">Ͷ���ˣ�</td>
                                                <td style="width:25%;text-align:left;"><asp:TextBox ID="txtpeoplefrom" runat="server" Width="154px" Text="����"></asp:TextBox>&nbsp;&nbsp;<asp:Button ID="btnpeoplesearch" runat="server" Text="����" CssClass="input_2" /></td>
                                                <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkTogether" runat="server" /></td>
                                                <td style="width:25%;text-align:left;"><asp:Button ID="btnTogether" runat="server" Text="��  ��" CssClass="input_2" /> </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:8%;text-align:right;">�������ˣ�</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlpeopleto" runat="server">
                                                        <asp:ListItem Text="����" Value="1" Selected ></asp:ListItem>
                                                        <asp:ListItem Text="����" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="����" Value="3"></asp:ListItem>
                                                        </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;"><asp:CheckBox ID="chkStage" runat="server" /></td>
                                                <td style="width:25%;text-align:left;"><asp:Button ID="btnStage" runat="server" Text="��  ��" CssClass="input_2" /> </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;"></td>
                                            </tr>
                                            <tr>
                                                <td style="width:8%;text-align:right;">���չ�˾��</td>
                                                <td style="width:25%;text-align:left;">
                                                <asp:DropDownList ID="ddlCompany" runat="server">
                                                    <asp:ListItem Text="ƽ������" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="���ٱ���" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="̩������" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">��֧������</td>
                                                <td style="width:25%;text-align:left;">
                                                <asp:DropDownList ID="DropDownList1" runat="server">
                                                    <asp:ListItem Text="ƽ��1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="ƽ��2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="ƽ��3" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">ҵ��Ա��</td>
                                                <td style="width:23%;text-align:left;">
                                                    <asp:TextBox ID="txtagent" runat="server" Width="100px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:8%;text-align:right;">�������֣�</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlCategory" runat="server">
                                                    <asp:ListItem Text="����1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="����2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="����3" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">�������ޣ�</td>
                                                <td style="width:56%;text-align:left;" colspan=3>
                                                    <asp:TextBox ID="txtStartDate" runat="server" Width="100px"></asp:TextBox>&nbsp;��&nbsp;<asp:TextBox ID="txtEndDate" runat="server" Width="100px"></asp:TextBox>
                                                </td>
                                            </tr>

                                        </table>
                                        
                                      </dxrp:PanelContent>
                                 </PanelCollection>
                             </dxrp:ASPxRoundPanel>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;">
                            <dxrp:ASPxRoundPanel EnableViewState="False" HeaderText="������Ŀ" ID="rpinsuranceitem" EnableDefaultAppearance="False" Width="100%" runat="server" BackColor="#F8FAFD" ShowHeader="true"  HorizontalAlign="Center">
                                 <PanelCollection>
                                     <dxrp:PanelContent ID="PanelContent1" runat="server">
                                        <table style="width:100%">
                                            <tr>
                                                <td style="width:8%;text-align:right;"><asp:Button ID="btnProductAdd" Text="����" runat="server" CssClass="input_2" /></td>
                                                
                                            </tr> 
                                            <tr>
                                                <td>
                                                    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" KeyFieldName="CustomerID" Width="100%">
                                                        <%-- BeginRegion Columns --%>
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn VisibleIndex="0">
                                                                    <EditButton Visible="true" />
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="���" VisibleIndex="1">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="��Ŀ����" VisibleIndex="2">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="��Ŀ����" VisibleIndex="3">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="����" VisibleIndex="4">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="����" VisibleIndex="5">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="����" VisibleIndex="6">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="���ͷ���" VisibleIndex="7">
                                                                </dxwgv:GridViewDataColumn>
                                                                <dxwgv:GridViewDataColumn FieldName="���ͷ�" VisibleIndex="8">
                                                                </dxwgv:GridViewDataColumn>
                                                            </Columns>
                                                        <%-- EndRegion --%>
                                                        <SettingsEditing PopupEditFormWidth="600px" />
                                                        <Settings ShowGroupPanel="false" />
                                                    </dxwgv:ASPxGridView>
                                                </td>
                                            </tr>
                                        </table>
                                        
                                      </dxrp:PanelContent>
                                 </PanelCollection>
                             </dxrp:ASPxRoundPanel>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;">
                            <dxrp:ASPxRoundPanel EnableViewState="False" HeaderText="������Ŀ" ID="rpother" EnableDefaultAppearance="False" Width="100%" runat="server" BackColor="#F8FAFD" ShowHeader="true"  HorizontalAlign="Center">
                                 <PanelCollection>
                                     <dxrp:PanelContent ID="PanelContent3" runat="server">
                                        <table style="width:100%">
                                            <tr>
                                                <td style="width:11%;text-align:right;">���</td>
                                                <td style="width:22%;text-align:left;">
                                                    <asp:TextBox ID="txtprice" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:11%;text-align:right;">���ʣ�</td>
                                                <td style="width:22%;text-align:left;">
                                                    <asp:TextBox ID="txtrate" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:11%;text-align:right;">���ѣ�ԭ����</td>
                                                <td style="width:20%;text-align:left;">
                                                    <asp:TextBox ID="txtoriginalfee" runat="server" Width="140px"></asp:TextBox>
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">���֣�</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="DropDownList2" runat="server">
                                                        <asp:ListItem Text="�����" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="��Ԫ" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Ӣ��" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">������ʣ�</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtchange" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;">���ѣ�������</td>
                                                <td style="width:23%;text-align:left;">
                                                    <asp:TextBox ID="txtlocalfee" runat="server" Width="140px"></asp:TextBox>
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">���ͷ��ʣ�</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtmiddlerate" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;">���ͷѣ�</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtmiddlefee" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;">
                                                    
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">ԭ�����ӣ�</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtfile" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:25%;text-align:left;">
                                                    
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;">
                                                    
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
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;">
                                                    
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">ҵ����Դ��</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlSourceTypeID" runat="server">
                                                        <asp:ListItem Text="��Դ1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="��Դ2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">ҵ�����ʣ�</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:DropDownList ID="ddlKind" runat="server">
                                                        <asp:ListItem Text="ҵ������1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="ҵ������2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width:8%;text-align:right;">�տʽ��</td>
                                                <td style="width:23%;text-align:left;">
                                                    <asp:DropDownList ID="ddlGatheringType" runat="server">
                                                        <asp:ListItem Text="�տʽ1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="�տʽ2" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>                                  
                                            </tr> 
                                            <tr>
                                                <td style="width:8%;text-align:right;">¼���ˣ�</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtCreatePerson" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;">¼�����ڣ�</td>
                                                <td style="width:25%;text-align:left;">
                                                    <asp:TextBox ID="txtCreateTime" runat="server" Width="140px"></asp:TextBox>
                                                </td>
                                                <td style="width:8%;text-align:right;"></td>
                                                <td style="width:23%;text-align:left;">
                                                    
                                                </td>                                  
                                            </tr>                                            
                                        </table>
                                        
                                      </dxrp:PanelContent>
                                 </PanelCollection>
                             </dxrp:ASPxRoundPanel>
                            </td>
                        </tr>
                    </table>
                    
            </dxw:ContentControl></ContentCollection></dxtc:TabPage>
                    
            <dxtc:TabPage Text="�������">
                <ContentCollection><dxw:ContentControl runat="server">
                    <table style="width:100%">
                        <tr>
                            <td style="width:8%;text-align:left;">������<asp:TextBox it="txtTargetType" runat="server" ReadOnly></asp:TextBox></td>
                            
                        </tr> 
                        <tr>
                            <td>
                                <dxwgv:ASPxGridView ID="gridTargetProperty" ClientInstanceName="grid" runat="server" KeyFieldName="CustomerID" Width="100%">
                                    <%-- BeginRegion Columns --%>
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                                                <EditButton Visible="false" />
                                            </dxwgv:GridViewCommandColumn>
                                            <dxwgv:GridViewDataColumn FieldName="���" VisibleIndex="1">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="��Ŀ" VisibleIndex="2">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="��Ŀ˵��" VisibleIndex="3">
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
    
    <table style="height:5px;"><tr><td></td></tr></table>
    
    <dxrp:ASPxRoundPanel EnableViewState="False" HeaderText="ִ�ж���" ID="ASPxRoundPanel1" EnableDefaultAppearance="False" Width="100%" runat="server" BackColor="#F8FAFD" ShowHeader="false"  HorizontalAlign="Center">
         <PanelCollection>
             <dxrp:PanelContent ID="PanelContent4" runat="server">
                <table style="width:100%">
                    <tr>
                        <td style="width:100%;text-align:right;">
                            <asp:Button ID="btnadd" runat="server" Text="����" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnsave" runat="server" Text="����" CssClass="input_2" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btncancel" runat="server" Text="ȡ��" CssClass="input_2" />
                        </td>  
                        <td style="width:20%;text-align:left;">
                            
                        </td>                                                                  
                    </tr>
                </table>
                
              </dxrp:PanelContent>
         </PanelCollection>
     </dxrp:ASPxRoundPanel>
                 
                 

</asp:Content>
