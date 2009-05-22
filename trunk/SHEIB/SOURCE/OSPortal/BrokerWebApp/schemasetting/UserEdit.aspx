<%@ Page Title="用户修改" Language="C#" Theme="Aqua" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="BrokerWebApp.schemasetting.UserEdit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户管理</title>
    <script type="text/javascript">
        $(document).ready(function() {
            //jQuery.noticeAdd({
            //    text: 'This is a notification that you have to remove',
            //    stay: true
            //});
            

        });

        function btnCreateClick() {
	        
                //var myArguments="resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
                //window.showModalDialog("FeeNoticeAdd.aspx", self, myArguments);
            
        }

        function gridCustomButtonClick(s, e) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            //window.showModalDialog("FeeNoticeAdd.aspx", self, myArguments);
        }

        function imgPolicyProdTypeClick() {
            //var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
            //window.showModalDialog("PolicyProdType.aspx", self, myArguments);
        }
        
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    
    <table style="width:100%">
        <tr>
            <td style="width:100%;" colspan="2"> 
                <asp:Panel ID="npSearchHeader" runat="server" CssClass="collapsePanelHeader" Height="25px"> 
                    <div style="padding:5px; cursor: pointer; vertical-align: middle;">
                        <div style="float: left; vertical-align: middle;">
                            <asp:ImageButton ID="img_npSearchHeader" runat="server" ImageUrl="~/images/expand_blue.jpg" AlternateText=""/>
                        </div>
                        <div style="float:left; margin-left:5px;">所属项目</div>
                        <div style="float:left; margin-left:5px;">
                            <asp:Label ID="lbl_npSearchHeader" runat="server">(展开)</asp:Label>
                        </div>
                        
                    </div>
                </asp:Panel>                           
                <asp:Panel ID="npSearchDetail" runat="server" CssClass="collapsePanel" Height="0">
                    <table>
                        <tr>
                            <td style="width:70px;text-align:right; white-space:nowrap;">用户编号：</td>
                            <td style="width:110px;text-align:left;">
                                <asp:TextBox ID="txtUserID" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td style="width:120px;text-align:right;white-space:nowrap;">密码：</td> 
                            <td style="width:110px;text-align:left;">                                                        
                                <asp:TextBox ID="txtPassword" runat="server" Width="100px"></asp:TextBox>
                            </td>  
                            <td style="width:120px;text-align:right;white-space:nowrap;">部门：</td>
                            <td style="width:110px;text-align:left;">
                                <asp:DropDownList ID="ddlDeptID" runat="server" Width="100px">
                                    <asp:ListItem Text="(全部)" Value="1"></asp:ListItem>
                                </asp:DropDownList>                                
                            </td>                                                                                                  
                            <td></td>                                                   
                        </tr> 
                        <tr>
                            <td style="text-align:right;">姓名(中)：</td>
                            <td style="text-align:left;">
                               <asp:TextBox ID="txtUserNameCn" runat="server" Width="100px"></asp:TextBox>                                                        
                            </td>
                            <td style="text-align:right;">姓名(英)：</td>
                            <td style="text-align:left;">
                               <asp:TextBox ID="txtUserNameEn" runat="server" Width="100px"></asp:TextBox>                                                        
                            </td>
                            <td style="text-align:right;">性别：</td>
                            <td style="text-align:left;">
                                <asp:DropDownList runat="server" ID="ddlSex" Width="100px">
                                    <asp:ListItem Text="男" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="女" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>                            
                            <td></td>
                        </tr>
                        
                        <tr>
                            <td style="text-align:right;">身份证号：</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtIDNo" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td style="text-align:right;">生日：</td>
                            <td style="text-align:left;">
                               <dxe:ASPxDateEdit ID="dtBirthday" runat="server" Width="100px">
                                </dxe:ASPxDateEdit>                                                         
                            </td>
                            <td style="text-align:right;">入司日期：</td>
                            <td style="text-align:left;">
                                <dxe:ASPxDateEdit ID="dtJoinDate" runat="server" Width="100px">
                                </dxe:ASPxDateEdit>
                            </td>                            
                            <td></td>
                        </tr>                                                
                        <tr>
                            <td style="text-align:right;">职位：</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtTitle" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td style="text-align:right;">状态：</td>
                            <td style="text-align:left;">
                               <asp:DropDownList runat="server" ID="ddlStatus" Width="100px">
                                    <asp:ListItem Text="在职" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="离职" Value="2"></asp:ListItem>
                                </asp:DropDownList>                                                        
                            </td>
                            <td style="text-align:right;">地址：</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtAddress" runat="server" Width="100px"></asp:TextBox>
                            </td>                            
                            <td></td>
                        </tr> 
                        <tr>
                            <td style="text-align:right;">邮编：</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtPostCode" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td style="text-align:right;">电话：</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtTel" runat="server" Width="100px"></asp:TextBox>                                                       
                            </td>
                            <td style="text-align:right;">传真：</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtFax" runat="server" Width="100px"></asp:TextBox>
                            </td>                            
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align:right;">电子邮件：</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtEmail" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td style="text-align:right;">执业证号：</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtCertNo" runat="server" Width="100px"></asp:TextBox>                                                       
                            </td>
                            <td style="text-align:right;">手机号码：</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtMobile" runat="server" Width="100px"></asp:TextBox>                                                      
                            </td>                            
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align:right;">银行：</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtBankName" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td style="text-align:right;">银行帐号：</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtBankAccount" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td style="text-align:right;">备注：</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtRemark" runat="server" Width="100px"></asp:TextBox>
                            </td>
                            <td></td>
                        </tr>                        
                        <tr>                                                    
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td style="text-align:right;" colspan="2">
                                <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="input_2" OnClick="btnSave_Click" />&nbsp;
                                <input type="reset" id="btnReset" runat="server" value="重置" class="input_2" />                                                       
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
                    ExpandedText="(展开)"
                    CollapsedText="(隐藏)"
                    ExpandedImage="~/images/collapse_blue.jpg"
                    CollapsedImage="~/images/expand_blue.jpg"
                    SuppressPostBack="true" />
            </td>
        </tr>
    </table>
        
</asp:Content>
