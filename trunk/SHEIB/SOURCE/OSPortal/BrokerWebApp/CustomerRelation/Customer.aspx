<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master" AutoEventWireup="true" Theme="Aqua" CodeBehind="Customer.aspx.cs" Inherits="BrokerWebApp.CustomerRelation.Customer" Title="客户信息" %>
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
        function radCustTypeClick(CustType)
        {
            if(CustType == "1")
            {
                document.getElementById("spanPerson").style.display = "block";
                document.getElementById("spanUnit").style.display = "none";
            }
            else if(CustType == "0")
            {
                document.getElementById("spanPerson").style.display = "none";
                document.getElementById("spanUnit").style.display = "block";
            }
        }
        
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
                    <dxw:ContentControl ID="ContentControl1" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 200px; text-align: right;">
                                    <input type="radio" id="radPerson" name="radCustType" value="1" runat="server" checked onclick="javascript:radCustTypeClick(this.value);" />个人&nbsp;
                                    <input type="radio" id="radUnit" name="radCustType" value="0" runat="server" onclick="javascript:radCustTypeClick(this.value);" />单位
                                </td>
                                <td style="width: 170px; text-align: left;">
                                    &nbsp;
                                </td>
                                <td style="width: 100px; text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: left;">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    客户编号：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtCustID" ClientInstanceName="dxetxtCustID" runat="server" Width="160px"></dxe:ASPxTextBox>
                                </td>
                                <td style="text-align: right;">
                                    所在地区：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxComboBox ID="dxeddlArea" ClientInstanceName="dxeddlArea" runat="server" Width="160px" DropDownStyle="DropDownList"></dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    客户名称：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtCustName" ClientInstanceName="dxetxtCustName" runat="server" Width="160px"></dxe:ASPxTextBox>
                                </td>
                                <td style="text-align: right;">
                                    客户地址：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtAddress" ClientInstanceName="dxetxtAddress" runat="server" Width="160px"></dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    客户分类：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxComboBox ID="dxeddlCustClassify" ClientInstanceName="dxeddlCustClassify" runat="server" Width="160px" DropDownStyle="DropDownList"></dxe:ASPxComboBox>
                                </td>
                                <td style="text-align: right;">
                                    邮政编码：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtPostCode" ClientInstanceName="dxetxtPostCode" runat="server" Width="160px"></dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    行业类型：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxComboBox ID="dxeddlTradeType" ClientInstanceName="dxeddlTradeType" runat="server" Width="160px" DropDownStyle="DropDownList"></dxe:ASPxComboBox>
                                </td>
                                <td style="text-align: right;">
                                    <span id="spanPerson" style="display:block;">身份证号码：</span><span id="spanUnit" style="display:none;">组织机构号：</span>
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtIDNO" ClientInstanceName="dxetxtIDNO" runat="server" Width="160px"></dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    第一联系人姓名：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtContact" ClientInstanceName="dxetxtContact" runat="server" Width="160px"></dxe:ASPxTextBox>
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: left;">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    第一联系人电话：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtTel" ClientInstanceName="dxetxtTel" runat="server" Width="160px"></dxe:ASPxTextBox>
                                </td>
                                <td style="text-align: right;">
                                    部门：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxComboBox ID="dxeddlDepartment" ClientInstanceName="dxeddlDepartment" runat="server" Width="160px" DropDownStyle="DropDownList"></dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    第一联系人手机：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtMobile" ClientInstanceName="dxetxtMobile" runat="server" Width="160px"></dxe:ASPxTextBox>
                                </td>
                                <td style="text-align: right;">
                                    客户经理：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxComboBox ID="dxeddlSalesID" ClientInstanceName="dxeddlSalesID" runat="server" Width="160px" DropDownStyle="DropDownList"></dxe:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
        </TabPages>
    </dxtc:ASPxPageControl>
    <table style="height: 5px; background-color: #E0EDFF; width: 100%; font-size: 2px;">
        <tr>
            <td>
            </td>
        </tr>
    </table>
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="25px">
        <table style="width: 100%">
            <tr>
                <td style="text-align: right;">
                    <asp:Button ID="btnsave" runat="server" Text="保存" CssClass="input_2" />&nbsp;&nbsp;
                    <asp:Button ID="btncancel" runat="server" Text="取消" CssClass="input_2" />
                </td>
                <td style="width: 20px; text-align: left;">
                    &nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
