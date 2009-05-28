<%@ Page Title="用户角色" Language="C#" Theme="Aqua" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true" CodeBehind="UserRole.aspx.cs" Inherits="BrokerWebApp.schemasetting.UserRole" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <title>用户角色</title>
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

        function btnCancelClick() {
            ASPxClientEdit.ClearEditorsInContainer(null);            
        }

        function gridCustomButtonClick(s, e) {
            //
        }

        function btnCloseClick() {
            window.close();
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
                    <table runat="server" id="tblerrmsg" visible="false">
                        <tr>
                            <td style=" width:100px;">&nbsp;</td>
                            <td class="red">该用户已存在。</td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td style="width:70px;text-align:right; white-space:nowrap;">用户编号：</td>
                            <td style="width:180px;text-align:left;">
                                <dxe:ASPxTextBox ID="dxetxtUserID" ClientInstanceName="txtUserID" runat="server" Width="100px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										<RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxTextBox>
                                <input type="hidden" id="originalUserID" runat="server" />
                            </td>
                            <td style="width:120px;text-align:right;white-space:nowrap;">密码：</td> 
                            <td style="width:180px;text-align:left;">                                                        
                                <dxe:ASPxTextBox ID="dxetxtPassword" Password="true" ClientInstanceName="dxetxtPassword" runat="server" Width="100px">
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
										<RequiredField ErrorText="不能为空" IsRequired="True" />                                        
                                    </ValidationSettings>
                                </dxe:ASPxTextBox>
                            </td>  
                            <td style="width:120px;text-align:right;white-space:nowrap;">部门：</td>
                            <td style="width:180px;text-align:left;">
                                <dxe:ASPxComboBox ID="dxeddlDeptID" ClientInstanceName="dxeddlDeptID" runat="server" Width="100px" DropDownStyle="DropDownList">
                                    <Items>
                                        <dxe:ListEditItem Text="业务部" Value="1" />
                                    </Items>
                                </dxe:ASPxComboBox>                                
                            </td>                                                                                                  
                            <td></td>                                                   
                        </tr> 
                        <tr>
                            <td style="text-align:right;">姓名(中)：</td>
                            <td style="text-align:left;">
                               <dxe:ASPxTextBox ID="dxetxtUserNameCn" ClientInstanceName="dxetxtUserNameCn" runat="server" Width="100px"></dxe:ASPxTextBox>                                                       
                            </td>
                            <td style="text-align:right;">姓名(英)：</td>
                            <td style="text-align:left;">
                               <dxe:ASPxTextBox ID="dxetxtUserNameEn" ClientInstanceName="dxetxtUserNameEn" runat="server" Width="100px"></dxe:ASPxTextBox>                                                        
                            </td>
                            <td style="text-align:right;">性别：</td>
                            <td style="text-align:left;">
                                <dxe:ASPxComboBox ID="dxeddlSex" ClientInstanceName="dxeddlSex" runat="server" Width="100px" DropDownStyle="DropDownList">
                                    <Items>
                                        <dxe:ListEditItem Text="男" Value="男" />
                                        <dxe:ListEditItem Text="女" Value="女" />
                                    </Items>
                                </dxe:ASPxComboBox>
                            </td>                            
                            <td></td>
                        </tr>
                        
                        <tr>
                            <td style="text-align:right;">身份证号：</td>
                            <td style="text-align:left;">
                                <dxe:ASPxTextBox ID="dxetxtIDNo" ClientInstanceName="dxetxtIDNo" runat="server" Width="100px"></dxe:ASPxTextBox>
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
                                <dxe:ASPxTextBox ID="dxetxtTitle" ClientInstanceName="dxetxtTitle" runat="server" Width="100px"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align:right;">状态：</td>
                            <td style="text-align:left;">
                               <dxe:ASPxComboBox ID="dxeddlStatus" ClientInstanceName="dxeddlStatus" runat="server" Width="100px" DropDownStyle="DropDownList">
                                    <Items>
                                        <dxe:ListEditItem Text="在职" Value="在职" />
                                        <dxe:ListEditItem Text="离职" Value="离职" />
                                    </Items>
                                </dxe:ASPxComboBox>                                                       
                            </td>
                            <td style="text-align:right;">地址：</td>
                            <td style="text-align:left;">
                                <dxe:ASPxTextBox ID="dxetxtAddress" ClientInstanceName="dxetxtAddress" runat="server" Width="100px"></dxe:ASPxTextBox>
                            </td>                            
                            <td></td>
                        </tr> 
                        <tr>
                            <td style="text-align:right;">邮编：</td>
                            <td style="text-align:left;">
                                <dxe:ASPxTextBox ID="dxetxtPostCode" ClientInstanceName="dxetxtPostCode" runat="server" Width="100px"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align:right;">电话：</td>
                            <td style="text-align:left;">
                                <dxe:ASPxTextBox ID="dxetxtTel" ClientInstanceName="dxetxtTel" runat="server" Width="100px"> </dxe:ASPxTextBox>                                                       
                            </td>
                            <td style="text-align:right;">传真：</td>
                            <td style="text-align:left;">
                                <dxe:ASPxTextBox ID="dxetxtFax" ClientInstanceName="dxetxtFax" runat="server" Width="100px"></dxe:ASPxTextBox>
                            </td>                            
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align:right;">电子邮件：</td>
                            <td style="text-align:left;">
                                <dxe:ASPxTextBox ID="dxetxtEmail" ClientInstanceName="dxetxtEmail" runat="server" Width="100px"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align:right;">执业证号：</td>
                            <td style="text-align:left;">
                                <dxe:ASPxTextBox ID="dxetxtCertNo" ClientInstanceName="dxetxtCertNo" runat="server" Width="100px"></dxe:ASPxTextBox>                                                       
                            </td>
                            <td style="text-align:right;">手机号码：</td>
                            <td style="text-align:left;">
                                <dxe:ASPxTextBox ID="dxetxtMobile" ClientInstanceName="dxetxtMobile" runat="server" Width="100px"></dxe:ASPxTextBox>                                                      
                            </td>                            
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align:right;">银行：</td>
                            <td style="text-align:left;">
                                <dxe:ASPxTextBox ID="dxetxtBankName" ClientInstanceName="dxetxtBankName" runat="server" Width="100px"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align:right;">银行帐号：</td>
                            <td style="text-align:left;">
                                <dxe:ASPxTextBox ID="dxetxtBankAccount" ClientInstanceName="dxetxtBankAccount" runat="server" Width="100px"></dxe:ASPxTextBox>
                            </td>
                            <td style="text-align:right;">备注：</td>
                            <td style="text-align:left;">
                                <dxe:ASPxTextBox ID="dxetxtRemark" ClientInstanceName="dxetxtRemark" runat="server" Width="100px"></dxe:ASPxTextBox>
                            </td>
                            <td></td>
                        </tr>                        
                        <tr>                                                    
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td style="text-align:right;"></td> 
                            <td style="text-align:left;"></td>                                                   
                            <td></td>
                        </tr>                                         
                    </table>
                    <table style="width:100%">
                        <tr>
                            <td style="width:400px;">&nbsp;</td>
                            <td style="width:75px;">
                                <dxe:ASPxButton runat="server" id="dxebtnSave" Text="保存" CausesValidation="true" >
                                </dxe:ASPxButton> 
                            </td>
                            <td style="width:75px;">
                                <dxe:ASPxButton runat="server" id="dxebtnCancel" Text="重置" CausesValidation="false" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {btnCancelClick();}" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width:75px;">
                                <dxe:ASPxButton runat="server" id="dxeClose" Text="关闭" CausesValidation="false" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {btnCloseClick();}" />
                                </dxe:ASPxButton>
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
