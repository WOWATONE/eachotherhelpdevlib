﻿<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupMaster.Master" AutoEventWireup="true"
    Theme="Aqua" CodeBehind="Customer.aspx.cs" Inherits="OSPortalWebApp.CustomerRelation.Customer"
    Title="" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel"
    TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxUploadControl"
    TagPrefix="dxuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>客户信息</title>

    <script type="text/javascript">
        function CustomerPTUploadStart() {
            //document.getElementById("uploadedListFiles").innerHTML = "";
        }

        function CustomerPTUploaded(s, e) {
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
        
        function AddInfoUploadStart() {
            //document.getElementById("uploadedListFiles").innerHTML = "";
        }

        function AddInfoUploaded(s, e) {
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
    <dxtc:ASPxPageControl ID="customerDetailTabPage" ClientInstanceName="customerDetailTabPage"
        runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%">
        <TabPages>
            <dxtc:TabPage Name="CustInfo" Text="客户资料">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 15%; text-align: right;">
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    <asp:RadioButton ID="radPerson" runat="server" Checked="True" Text="个人" GroupName="PersonOrUnit" />
                                    &nbsp;&nbsp;<asp:RadioButton ID="radUnit" runat="server" Text="单位" GroupName="PersonOrUnit" />
                                </td>
                                <td style="width: 15%; text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%; text-align: right;">
                                    客户编号：
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    <asp:TextBox ID="txtCustNo" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width: 15%; text-align: right;">
                                    所在地区：
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    <asp:DropDownList ID="ddlArea" runat="server" Width="200px">
                                        <asp:ListItem Text="北京市" Value="1" Selected></asp:ListItem>
                                        <asp:ListItem Text="上海市" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%; text-align: right;">
                                    客户名称：
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    <asp:TextBox ID="txtCustName" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width: 15%; text-align: right;">
                                    地址：
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    <asp:TextBox ID="txtAddress" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%; text-align: right;">
                                    客户分类：
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    <asp:DropDownList ID="ddlGrade" runat="server" Width="200px">
                                        <asp:ListItem Text="A－管理公司" Value="1" Selected></asp:ListItem>
                                        <asp:ListItem Text="B－总公司" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="C－集团外" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="D－个人" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 15%; text-align: right;">
                                    邮政编码：
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    <asp:TextBox ID="txtPostCode" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%; text-align: right;">
                                    所属行业：
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    <asp:DropDownList ID="ddlTradeType" runat="server" Width="200px">
                                        <asp:ListItem Text="政府机关" Value="1" Selected></asp:ListItem>
                                        <asp:ListItem Text="其他" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 15%; text-align: right;">
                                    组织机构代码号<br />
                                    /身份证号码：
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    <asp:TextBox ID="txtIDNO" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%; text-align: right;">
                                    第一联系人姓名：
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    <asp:TextBox ID="txtContact" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width: 15%; text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%; text-align: right;">
                                    第一联系人电话：
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    <asp:TextBox ID="txtTel" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width: 15%; text-align: right;">
                                    部门：
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" Width="200px">
                                        <asp:ListItem Text="客户服务部" Value="1" Selected></asp:ListItem>
                                        <asp:ListItem Text="特殊风险部" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="财险部" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%; text-align: right;">
                                    第一联系人手机：
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    <asp:TextBox ID="txtMobile" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width: 15%; text-align: right;">
                                    客户经理：
                                </td>
                                <td style="width: 35%; text-align: left;">
                                    <asp:DropDownList ID="ddlSales" runat="server" Width="200px">
                                        <asp:ListItem Text="张三" Value="1" Selected></asp:ListItem>
                                        <asp:ListItem Text="李四" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="AddInfo" Text="附加资料">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 10%; text-align: right;">
                                    主要业务：
                                </td>
                                <td style="width: 40%; text-align: left;">
                                    <asp:TextBox ID="txtMainOper" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width: 10%; text-align: right;">
                                </td>
                                <td rowspan="3" style="width: 40%; text-align: left;">
                                    <asp:TextBox ID="txtBackground" runat="server" TextMode="MultiLine" Style="width: 300px"
                                        Rows="6"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; text-align: right;">
                                    资产规模：
                                </td>
                                <td style="width: 40%; text-align: left;">
                                    <asp:TextBox ID="txtAssetSize" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width: 10%; text-align: right;">
                                    背景资料：
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; text-align: right;">
                                    主要产品：
                                </td>
                                <td style="width: 40%; text-align: left;">
                                    <asp:TextBox ID="txtMainProduct" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width: 10%; text-align: right;">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; text-align: right;">
                                    风险资料：
                                </td>
                                <td style="width: 40%; text-align: left;">
                                    <asp:TextBox ID="txtRisk" runat="server" TextMode="MultiLine" Style="width: 300px"
                                        Rows="6"></asp:TextBox>
                                </td>
                                <td style="width: 10%; text-align: right;">
                                    其他信息：
                                </td>
                                <td style="width: 40%; text-align: left;">
                                    <asp:TextBox ID="txtOtherInfo" runat="server" TextMode="MultiLine" Style="width: 300px"
                                        Rows="6"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; text-align: right;">
                                    备注：
                                </td>
                                <td style="width: 40%; text-align: left;">
                                    <asp:TextBox ID="txtRemark" runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td style="width: 10%; text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="width: 40%; text-align: left;">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%; text-align: right; vertical-align: top;">
                                    附件：
                                </td>
                                <td style="text-align: left; vertical-align: top;" colspan="3">
                                    <dxuc:ASPxUploadControl ID="AddInfoUploadControl" runat="server" ShowAddRemoveButtons="True"
                                        Width="400px" ShowUploadButton="True" AddUploadButtonsHorizontalPosition="Center"
                                        ShowProgressPanel="True" ClientInstanceName="UploadControl" OnFileUploadComplete="UploadControl_AddInfoUploadComplete"
                                        FileInputCount="1" RemoveButtonSpacing="8px" AddUploadButtonsSpacing="10">
                                        <ValidationSettings MaxFileSize="4000000" AllowedContentTypes="*">
                                        </ValidationSettings>
                                        <ClientSideEvents FileUploadComplete="function(s, e) { AddInfoUploaded(s, e) }" FileUploadStart="function(s, e) { AddInfoUploadStart(); }" />
                                        <RemoveButton Text="" Image-Url="../images/file_remove.gif" Image-Height="25px" Image-Width="25px"
                                            ImagePosition="Left">
                                            <Image Height="25px" Width="25px" Url="../images/file_remove.gif"></Image>
                                        </RemoveButton>
                                        <AddButton Text="" Image-Url="../images/file_add.gif" Image-Height="25px" Image-Width="25px"
                                            ImagePosition="Left">
                                            <Image Height="25px" Width="25px" Url="../images/file_add.gif"></Image>
                                        </AddButton>
                                        <UploadButton Text="" Image-Url="../images/file_upload.gif" Image-Height="25px" Image-Width="25px"
                                            ImagePosition="Left">
                                            <Image Height="25px" Width="25px" Url="../images/file_upload.gif"></Image>
                                        </UploadButton>
                                    </dxuc:ASPxUploadControl>
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="CustAlert" Text="特别提醒" Visible="false">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <div style="width: 100%; text-align: center;">
                            <table style="width: 80%;">
                                <tr>
                                    <td style="width: 65%; text-align: left;">
                                        提醒列表：
                                    </td>
                                    <td style="width: 35%; text-align: left;">
                                        提醒间隔：
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 70%; text-align: center; vertical-align: top;">
                                        <dxwgv:ASPxGridView ID="gridAlertList" ClientInstanceName="gridAlertList" runat="server"
                                            KeyFieldName="ID" Width="100%" AutoGenerateColumns="False">
                                            <Columns>
                                                <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="ID" VisibleIndex="0" Visible="False">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="设置人" FieldName="SetSales" VisibleIndex="0">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="接收人" FieldName="ReceiveSales" VisibleIndex="1">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="提醒间隔" FieldName="AlertPeriodMode" VisibleIndex="2">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="开始提醒时间" FieldName="AlertDateTime" VisibleIndex="3">
                                                </dxwgv:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                        </dxwgv:ASPxGridView>
                                    </td>
                                    <td style="width: 30%; text-align: center;">
                                        <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" Height="100%"
                                            View="GroupBox" ShowHeader="False">
                                            <PanelCollection>
                                                <dxp:PanelContent runat="server">
                                                    <table style="width: 100%; height: 100%;">
                                                        <tr>
                                                            <td style="width: 50%; text-align: left;">
                                                                <asp:TextBox ID="txtAlertPeriod" runat="server" Width="120px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ddlAlertMode" runat="server" Width="120px">
                                                                    <asp:ListItem Text="小时" Value="1" Selected></asp:ListItem>
                                                                    <asp:ListItem Text="天" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="月" Value="3"></asp:ListItem>
                                                                    <asp:ListItem Text="年" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Text="只提醒一次" Value="5"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%; text-align: left;">
                                                                开始时间：
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="text-align: left;">
                                                                <dxe:ASPxDateEdit ID="deAlertDateTime" runat="server" EditFormat="Custom" EditFormatString="yyyy-MM-dd HH:mm:ss">
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="text-align: left;">
                                                                部门：<asp:TextBox ID="txtDepartment" runat="server" Width="150px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="text-align: left;">
                                                                姓名：<asp:TextBox ID="txtName" runat="server" Width="100px"></asp:TextBox><asp:Button
                                                                    ID="btnSearch" runat="server" Text="查找" CssClass="input_2" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 50%; text-align: center;">
                                                                <asp:Button ID="btlDeleteAlert" runat="server" Text="删除" CssClass="input_2" />
                                                            </td>
                                                            <td style="width: 50%; text-align: center;">
                                                                <asp:Button ID="btnAddAlert" runat="server" Text="添加" CssClass="input_2" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </dxp:PanelContent>
                                            </PanelCollection>
                                        </dxrp:ASPxRoundPanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 70%; text-align: left;">
                                        提醒内容：
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtAlertContent" runat="server" TextMode="MultiLine" Style="width: 100%"
                                            Rows="6"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="CustContact" Text="联系人">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width: 100%;">
                            <tr>
                                <td style="text-align: left;">
                                    联系人记录：
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxwgv:ASPxGridView ID="gridContactItem" ClientInstanceName="gridContactItem" runat="server"
                                        KeyFieldName="ContactID" Width="100%" AutoGenerateColumns="False" OnRowInserting="gridContactItem_RowInserting"
                                        OnRowUpdating="gridContactItem_RowUpdating" OnRowUpdated="gridContactItem_RowUpdated"
                                        OnRowInserted="gridContactItem_RowInserted" OnRowDeleting="gridContactItem_RowDeleting"
                                        OnRowDeleted="gridContactItem_RowDeleted">
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" VisibleIndex="0" Width="15px">
                                                <NewButton Visible="true" />
                                                <EditButton Visible="true" />
                                                <DeleteButton Visible="true" />
                                            </dxwgv:GridViewCommandColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="联系人GUID" FieldName="ContactID" VisibleIndex="1"
                                                Visible="false">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="姓名" FieldName="ContactName" VisibleIndex="2">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="所属客户GUID" FieldName="CustID" VisibleIndex="3"
                                                Visible="false">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="职位" FieldName="Position" VisibleIndex="4">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="性别" FieldName="Sex" VisibleIndex="5">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="电话" FieldName="Tel" VisibleIndex="6">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="传真" FieldName="Fax" VisibleIndex="7">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="手机" FieldName="MobilePhone" VisibleIndex="8">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="电子邮件" FieldName="Email" VisibleIndex="9">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="兴趣爱好" FieldName="Interest" VisibleIndex="10"
                                                Visible="false">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="备注" FieldName="Remark" VisibleIndex="11" Visible="false">
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <Settings ShowGroupPanel="false" />
                                        <Templates>
                                            <EditForm>
                                                <div style="padding: 4px 4px 3px 4px; text-align: center;">
                                                    <table style="width: 70%;" runat="server" id="tblgridContactItemEditorTemplate">
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                姓名：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox runat="server" ID="txtContactName" Text='<%# Eval("ContactName") %>'></asp:TextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                性别：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:DropDownList runat="server" ID="ddlSex">
                                                                    <asp:ListItem Text="男" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="女" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                职位：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox runat="server" ID="txtPosition" Text='<%# Eval("Position") %>'></asp:TextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                电话：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox runat="server" ID="txtTel" Text='<%# Eval("Tel") %>'></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                手机：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox runat="server" ID="txtMobilePhone" Text='<%# Eval("MobilePhone") %>'></asp:TextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                传真：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox runat="server" ID="txtFax" Text='<%# Eval("Fax") %>'></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                邮件：
                                                            </td>
                                                            <td style="text-align: left;" colspan="3">
                                                                <asp:TextBox runat="server" ID="txtEmail" Text='<%# Eval("Email") %>'></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right; vertical-align: top;">
                                                                兴趣：
                                                            </td>
                                                            <td style="text-align: left;" colspan="3">
                                                                <asp:TextBox ID="txtInterest" runat="server" TextMode="MultiLine" Rows="4" Style="width: 450px"
                                                                    Text='<%# Eval("Interest") %>'></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right; vertical-align: top;">
                                                                备注：
                                                            </td>
                                                            <td style="text-align: left;" colspan="3">
                                                                <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" Rows="4" Style="width: 450px"
                                                                    Text='<%# Eval("Remark") %>'></asp:TextBox>
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
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="PtFollow" Text="销售跟进">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="text-align: left; width: 100%;">
                                    销售跟进记录：
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxwgv:ASPxGridView ID="gridCustomerPtItem" ClientInstanceName="gridCustomerPtItem"
                                        runat="server" KeyFieldName="FollowID" Width="100%" AutoGenerateColumns="False"
                                        OnRowInserting="gridCustomerPtItem_RowInserting" OnRowUpdating="gridCustomerPtItem_RowUpdating"
                                        OnRowUpdated="gridCustomerPtItem_RowUpdated" OnRowInserted="gridCustomerPtItem_RowInserted"
                                        OnRowDeleting="gridCustomerPtItem_RowDeleting" OnRowDeleted="gridCustomerPtItem_RowDeleted">
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" VisibleIndex="0" Width="15px">
                                                <NewButton Visible="true" />
                                                <EditButton Visible="true" />
                                                <DeleteButton Visible="true" />
                                            </dxwgv:GridViewCommandColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="跟进日期" FieldName="FollowDate" VisibleIndex="1">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="跟进类型" FieldName="FollowType" VisibleIndex="2">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="跟进程度" FieldName="FollowStage" VisibleIndex="3">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="跟进内容" FieldName="FollowMemo" VisibleIndex="4"
                                                Width="50%">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="跟进GUID" FieldName="FollowID" VisibleIndex="5"
                                                Visible="False">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="所属客户GUID" FieldName="CustID" VisibleIndex="6"
                                                Visible="False">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="跟进人" FieldName="FollowPerson" VisibleIndex="7"
                                                Visible="False">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="下次跟进日期" FieldName="NextFollow" VisibleIndex="8"
                                                Visible="False">
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <Settings ShowGroupPanel="false" />
                                        <Templates>
                                            <EditForm>
                                                <div style="padding: 4px 4px 3px 4px; text-align: center;">
                                                    <table style="width: 70%;" runat="server" id="tblgridContactItemEditorTemplate">
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                跟进类型：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:DropDownList runat="server" ID="ddlFollowType">
                                                                    <asp:ListItem Text="面谈" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="电话" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                跟进程度：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:DropDownList runat="server" ID="ddlFollowStage">
                                                                    <asp:ListItem Text="接触" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="说明" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                跟进时间：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxDateEdit ID="deFollowDate" runat="server">
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                跟进人：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox runat="server" ID="txtFollowPerson" Text='<%# Eval("FollowPerson") %>'></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                下次跟进：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxDateEdit ID="deNextFollow" runat="server">
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                            </td>
                                                            <td style="text-align: left;">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right; vertical-align: top;">
                                                                跟进内容：
                                                            </td>
                                                            <td style="text-align: left;" colspan="3">
                                                                <asp:TextBox ID="txtFollowMemo" runat="server" TextMode="MultiLine" Rows="4" Style="width: 450px"
                                                                    Text='<%# Eval("FollowMemo") %>'></asp:TextBox>
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
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    附件：
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxuc:ASPxUploadControl ID="CustomerPTUploadControl" runat="server" ShowAddRemoveButtons="True"
                                        Width="400px" ShowUploadButton="True" AddUploadButtonsHorizontalPosition="Center"
                                        ShowProgressPanel="True" ClientInstanceName="UploadControl" OnFileUploadComplete="UploadControl_CustomerPTUploadComplete"
                                        FileInputCount="1" RemoveButtonSpacing="8px" AddUploadButtonsSpacing="10">
                                        <ValidationSettings MaxFileSize="4000000" AllowedContentTypes="*">
                                        </ValidationSettings>
                                        <ClientSideEvents FileUploadComplete="function(s, e) { CustomerPTUploaded(s, e) }"
                                            FileUploadStart="function(s, e) { CustomerPTUploadStart(); }" />
                                        <RemoveButton Text="" Image-Url="../images/file_remove.gif" Image-Height="25px" Image-Width="25px"
                                            ImagePosition="Left">
                                            <Image Height="25px" Width="25px" Url="../images/file_remove.gif"></Image>
                                        </RemoveButton>
                                        <AddButton Text="" Image-Url="../images/file_add.gif" Image-Height="25px" Image-Width="25px"
                                            ImagePosition="Left">
                                            <Image Height="25px" Width="25px" Url="../images/file_add.gif"></Image>
                                        </AddButton>
                                        <UploadButton Text="" Image-Url="../images/file_upload.gif" Image-Height="25px" Image-Width="25px"
                                            ImagePosition="Left">
                                            <Image Height="25px" Width="25px" Url="../images/file_upload.gif"></Image>
                                        </UploadButton>
                                    </dxuc:ASPxUploadControl>
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="NotifyClaim" Text="理赔记录">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <dxwgv:ASPxGridView ID="gridNotifyItem" ClientInstanceName="gridNotifyItem" runat="server"
                                        KeyFieldName="NotifyID" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="理赔单号" FieldName="NotifyID" VisibleIndex="0">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="保单编号" FieldName="PolicyID" VisibleIndex="1">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="保险公司" FieldName="Carrier" VisibleIndex="2">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="险种名称" FieldName="ProdTypeName" VisibleIndex="3">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="投保客户" FieldName="CustName" VisibleIndex="4">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="主标的值" FieldName="MainTarget" VisibleIndex="5"
                                                Visible="false">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="次标的值" FieldName="SubTarget" VisibleIndex="6"
                                                Visible="false">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="起保日期" FieldName="StartDate" VisibleIndex="7">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="报案日" FieldName="NotifyTime" VisibleIndex="8">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="上报金额" FieldName="NotifyLossFee" VisibleIndex="9">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="赔付比例" FieldName="LossRation" VisibleIndex="10">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="实赔金额" FieldName="LastPayFee" VisibleIndex="11">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="结案日" FieldName="CaseEndTime" VisibleIndex="12">
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <Settings ShowGroupPanel="false" />
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    <asp:Button ID="btnNotifyContent" runat="server" Text="理赔内容" CssClass="input_2" />
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="SignPremium" Text="签单记录">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td colspan=2>
                                    <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server"
                                        KeyFieldName="PolicyID" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="序号" FieldName="PolicyID" VisibleIndex="0">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="起保日期" FieldName="StartDate" VisibleIndex="1">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="终止日期" FieldName="EndDate" VisibleIndex="2">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="保单号" FieldName="PolicyNo" VisibleIndex="3">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="险种" FieldName="ProdType" VisibleIndex="4">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="保费" FieldName="Premium" VisibleIndex="5">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="保险公司及分支机构" FieldName="CarrierBranch" VisibleIndex="6">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="客户经理" FieldName="Sales" VisibleIndex="7">
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <Settings ShowGroupPanel="false" />
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left; width:50%;">
                                    保费合计：&nbsp;<asp:TextBox runat="server" ID="txtTotalPremium" Text="250" Enabled="false"></asp:TextBox>
                                </td>
                                <td style="text-align: right;">
                                    <asp:Button ID="btnPolicyContent" runat="server" Text="保单内容" CssClass="input_2" />
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
        </TabPages>
    </dxtc:ASPxPageControl>
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="25px">
        <table style="width: 100%">
            <tr>
                <td style="text-align: right;">
                    <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;
                    <asp:Button ID="btnClose" runat="server" Text="关闭" CssClass="input_2" />
                </td>
                <td style="width: 20px; text-align: left;">
                    &nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>