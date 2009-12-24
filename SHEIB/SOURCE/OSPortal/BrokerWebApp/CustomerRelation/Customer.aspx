<%@ Page Language="C#" MasterPageFile="~/SiteMastePages/PopupUploadMaster.Master"
    AutoEventWireup="true" Theme="Aqua" CodeBehind="Customer.aspx.cs" Inherits="BrokerWebApp.CustomerRelation.Customer"
    Title="客户信息" %>

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
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallback"
    TagPrefix="dxcb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>客户信息</title>

    <script type="text/javascript">
        $(document).ready(function() {
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

        function radCustTypeClick(CustType) {
            var lblCustType = $("#<%=lblCustType.ClientID %>");
            if (CustType == "1") {
                lblCustType[0].innerHTML = "身份证号码：";
            }
            else if (CustType == "0") {
                lblCustType[0].innerHTML = "组织机构号：";
            }
        }

        function SelectedIndexChanged(s, e) {
            var hidCustClassify = $("#<%=hidCustClassify.ClientID %>");
            hidCustClassify[0].value = s.GetValue();
            var test = s.GetText();
            if (test.length > 0) {
                var index = test.lastIndexOf("∟");
                if (index >= 0) {
                    var testTmp = test.substr(index + 1);
                    s.SetText(testTmp);
                }
            }
        }

        function DepartmentSelectedIndexChanged(s, e) {
            var value = s.GetValue();
            if (value.length > 0)
                dxeddlSalesID.PerformCallback(s.GetValue());
        }

        function AddInfoFileUploaded(s, e) {
            gridAddInfoDocList.PerformCallback();
        }

        function AddInfoFileUploadStart(s, e) {
            //
        }

        function CustomerPtFileUploaded(s, e) {
            gridPtFollowDocList.PerformCallback();
        }

        function CustomerPtUploadStart(s, e) {
            //
        }

        function BusDocFileUploaded(s, e) {
            gridBusDocList.PerformCallback();
        }

        function BusDocFileUploadStart(s, e) {
            //
        }

        function hlPolicyItemTogetherClick(params) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
            var url = params;
            window.open(url);
        }

        function btnValidate(s, e) {
            var idno = dxetxtIDNO.GetText();
            if (idno.length == 0)
                return;

            var radPerson = $("#<%=radPerson.ClientID %>");
            if (radPerson[0].checked) {
                if (!isIdCardNo(idno)) {
                    alert("身份证号码错误!");
                    e.processOnServer = false;
                    return false;
                }
            }
            else {
                if (idno.length < 5) {
                    alert("组织机构号码长度不能低于5位!");
                    e.processOnServer = false;
                    return false;
                }
            }

            return true;
        }

        function isIdCardNo(sId) {
            var aCity = { 11: "北京", 12: "天津", 13: "河北", 14: "山西", 15: "内蒙古", 21: "辽宁", 22: "吉林", 23: "黑龙江", 31: "上海", 32: "江苏", 33: "浙江", 34: "安徽", 35: "福建", 36: "江西", 37: "山东", 41: "河南", 42: "湖北", 43: "湖南", 44: "广东", 45: "广西", 46: "海南", 50: "重庆", 51: "四川", 52: "贵州", 53: "云南", 54: "西藏", 61: "陕西", 62: "甘肃", 63: "青海", 64: "宁夏", 65: "新疆", 71: "台湾", 81: "香港", 82: "澳门", 91: "国外" };
            var iSum = 0;
            if (!/^\d{17}(\d|x)$/i.test(sId)) return false;
            sId = sId.replace(/x$/i, "a");
            if (aCity[parseInt(sId.substr(0, 2))] == null) return false;  //"Error:非法地区"
            var sBirthday = sId.substr(6, 4) + "-" + Number(sId.substr(10, 2)) + "-" + Number(sId.substr(12, 2));
            var d = new Date(sBirthday.replace(/-/g, "/"));
            if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate())) return false; //"Error:非法生日"
            for (var i = 17; i >= 0; i--)
                iSum += (Math.pow(2, i) % 11) * parseInt(sId.charAt(17 - i), 11);
            if (iSum % 11 != 1) return false;

            return true;
        }

        function PolicyViewTransfer(id) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=700px;center=yes;help=no";
            var querystring;
            querystring = "../PolicyViewTransfer.aspx?id=" + id;
            window.showModalDialog(querystring, self, myArguments);
        }

        function NotifyClaimView(id) {
            var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=900px;dialogHeight=800px;center=yes;help=no";
            var querystring;
            querystring = "../CustomerClaim/NotifyClaimView.aspx?id=" + id;
            window.showModalDialog(querystring, self, myArguments);
        }

        function btnCloseClick() {
            window.close();
        }

        function gridBusDocListCustomButtonClick(s, e) {
            if (e.buttonID == "删除") {
                if (!confirm("确定删除吗?"))
                    return false;
                var sCustBusDocID = s.GetDataRow(e.visibleIndex).cells[1].innerText;

                dxeDeleteCustomerBusDocCallback.PerformCallback(sCustBusDocID);
                
            }
            else
                return false;
        }

        function deleteCustomerBusDocCallbackComplete(s, e) {
            if (e.result != "" && e.result != "ok") {
                alert(e.result);
                return false;
            }
            gridBusDocList.PerformCallback();
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" ID="ScriptManager1" />
    <dxcb:ASPxCallback ID="dxeDeleteCustomerBusDocCallback" ClientInstanceName="dxeDeleteCustomerBusDocCallback"
        runat="server" OnCallback="dxeDeleteCustomerBusDocCallback_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) { deleteCustomerBusDocCallbackComplete(s, e); }" />
    </dxcb:ASPxCallback>
    <dxtc:ASPxPageControl ID="customerDetailTabPage" ClientInstanceName="customerDetailTabPage"
        runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True" Width="100%">
        <TabPages>
            <dxtc:TabPage Name="CustInfo" Text="客户资料">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl1" runat="server">
                        <label id="lblerrmsg" name="lblerrmsg" runat="server" class="red" visible="false">
                        </label>
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 120px; text-align: right;">
                                    <input type="radio" id="radPerson" name="radCustType" value="1" runat="server" checked
                                        onclick="javascript:radCustTypeClick(this.value);" />个人&nbsp;
                                    <input type="radio" id="radUnit" name="radCustType" value="0" runat="server" onclick="javascript:radCustTypeClick(this.value);" />单位
                                </td>
                                <td style="width: 240px; text-align: left;">
                                    &nbsp;
                                </td>
                                <td style="width: 120px; text-align: right;">
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
                                    <dxe:ASPxTextBox ID="dxetxtCustID" ClientInstanceName="dxetxtCustID" runat="server"
                                        Width="160px" Enabled="false">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="true" ValidationGroup="BaseGroup">
                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox>
                                </td>
                                <td style="text-align: right;">
                                    所在地区：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxComboBox ID="dxeddlArea" ClientInstanceName="dxeddlArea" runat="server"
                                        Width="160px" DropDownStyle="DropDownList">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="true" ValidationGroup="BaseGroup">
                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                        </ValidationSettings>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    客户名称：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtCustName" ClientInstanceName="dxetxtCustName" runat="server"
                                        Width="160px">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="true" ValidationGroup="BaseGroup">
                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox>
                                </td>
                                <td style="text-align: right;">
                                    客户地址：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtAddress" ClientInstanceName="dxetxtAddress" runat="server"
                                        Width="160px">
                                    </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    客户分类：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxComboBox ID="dxeddlCustClassify" ClientInstanceName="dxeddlCustClassify"
                                        runat="server" Width="160px" DropDownStyle="DropDownList">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="true" ValidationGroup="BaseGroup">
                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                        </ValidationSettings>
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { SelectedIndexChanged(s, e); return false;}" />
                                    </dxe:ASPxComboBox>
                                    <input type="hidden" id="hidCustClassify" name="hidCustClassify" runat="server" value="" />
                                </td>
                                <td style="text-align: right;">
                                    邮政编码：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtPostCode" ClientInstanceName="dxetxtPostCode" runat="server"
                                        Width="160px" MaxLength="6">
                                    </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    行业类型：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxComboBox ID="dxeddlTradeType" ClientInstanceName="dxeddlTradeType" runat="server"
                                        Width="160px" DropDownStyle="DropDownList">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="true" ValidationGroup="BaseGroup">
                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                        </ValidationSettings>
                                    </dxe:ASPxComboBox>
                                </td>
                                <td style="text-align: right;">
                                    <asp:Label ID="lblCustType" runat="server" Text="身份证号码："></asp:Label>
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtIDNO" ClientInstanceName="dxetxtIDNO" runat="server" Width="160px">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="true" ValidationGroup="BaseGroup">
                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                        </ValidationSettings>
                                    </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    第一联系人姓名：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtContact" ClientInstanceName="dxetxtContact" runat="server"
                                        Width="160px">
                                    </dxe:ASPxTextBox>
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
                                    <dxe:ASPxTextBox ID="dxetxtTel" ClientInstanceName="dxetxtTel" runat="server" Width="160px">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td style="text-align: right;">
                                    部门：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxComboBox ID="dxeddlDepartment" ClientInstanceName="dxeddlDepartment" runat="server"
                                        Width="160px" DropDownStyle="DropDownList">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="true" ValidationGroup="BaseGroup">
                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                        </ValidationSettings>
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { DepartmentSelectedIndexChanged(s, e) }" />
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    第一联系人手机：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtMobile" ClientInstanceName="dxetxtMobile" runat="server"
                                        Width="160px">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td style="text-align: right;">
                                    客户经理：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxComboBox ID="dxeddlSalesID" ClientInstanceName="dxeddlSalesID" runat="server"
                                        Width="160px" DropDownStyle="DropDownList" OnCallback="dxeddlSalesID_Callback">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" CausesValidation="true" ValidationGroup="BaseGroup">
                                            <RequiredField IsRequired="true" ErrorText="必需项" />
                                        </ValidationSettings>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="AddInfo" Text="附加资料">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl2" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 150px; text-align: right;">
                                    主要业务：
                                </td>
                                <td style="width: 170px; text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtMainOper" ClientInstanceName="dxetxtMainOper" runat="server"
                                        Width="160px">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td style="width: 100px; text-align: right;">
                                </td>
                                <td rowspan="3" style="text-align: left;">
                                    <asp:TextBox ID="txtBackground" runat="server" TextMode="MultiLine" Style="width: 200px"
                                        Rows="6"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    资产规模：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtAssetSize" ClientInstanceName="dxetxtAssetSize" runat="server"
                                        Width="160px">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td style="text-align: right;">
                                    背景资料：
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    主要产品：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtMainProduct" ClientInstanceName="dxetxtMainProduct" runat="server"
                                        Width="160px">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    风险资料：
                                </td>
                                <td style="text-align: left;">
                                    <asp:TextBox ID="txtRisk" runat="server" TextMode="MultiLine" Style="width: 200px"
                                        Rows="6"></asp:TextBox>
                                </td>
                                <td style="text-align: right;">
                                    其他信息：
                                </td>
                                <td style="text-align: left;">
                                    <asp:TextBox ID="txtOtherInfo" runat="server" TextMode="MultiLine" Style="width: 200px"
                                        Rows="6"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    备注：
                                </td>
                                <td style="text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtRemark" ClientInstanceName="dxetxtRemark" runat="server"
                                        Width="160px">
                                    </dxe:ASPxTextBox>
                                </td>
                                <td style="text-align: right;">
                                    &nbsp;
                                </td>
                                <td style="text-align: left;">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; vertical-align: top;">
                                    附件：
                                </td>
                                <td style="text-align: left; vertical-align: top;" colspan="3">
                                    <dxuc:ASPxUploadControl ID="addInfoUploadControl" ClientInstanceName="addInfoUploadControl"
                                        runat="server" ShowAddRemoveButtons="True" Width="400px" ShowUploadButton="True"
                                        AddUploadButtonsHorizontalPosition="Center" ShowProgressPanel="True" FileInputCount="3"
                                        RemoveButtonSpacing="8px" AddUploadButtonsSpacing="10" FileUploadMode="OnPageLoad"
                                        OnFileUploadComplete="UploadControl_AddInfoUploadComplete">
                                        <ValidationSettings MaxFileSize="100000000" FileDoesNotExistErrorText="文件不存在" GeneralErrorText="上传发生错误"
                                            MaxFileSizeErrorText="文件太大" NotAllowedContentTypeErrorText="不允许上传此类型文件">
                                        </ValidationSettings>
                                        <ClientSideEvents FilesUploadComplete="function(s, e) { AddInfoFileUploaded(s, e) }"
                                            FileUploadStart="function(s, e) { AddInfoFileUploadStart(s, e); }" />
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
                            <tr>
                                <td style="text-align: right; vertical-align: top;">
                                    文件列表：
                                </td>
                                <td style="text-align: left; vertical-align: top;" colspan="3">
                                    <dxwgv:ASPxGridView ID="gridAddInfoDocList" ClientInstanceName="gridAddInfoDocList"
                                        runat="server" SettingsBehavior-AllowSort="false" KeyFieldName="CustDocID" Width="80%"
                                        AutoGenerateColumns="False" OnCustomCallback="gridAddInfoDocList_CustomCallback">
                                        <%-- BeginRegion Columns --%>
                                        <Columns>
                                            <dxwgv:GridViewDataColumn FieldName="CustDocName" Caption="文件名" CellStyle-Wrap="False"
                                                Width="25" Settings-AllowDragDrop="false">
                                                <DataItemTemplate>
                                                    <a id="fileurl <%# Eval("CustDocID") %>" onclick="hlPolicyItemTogetherClick('<%# Eval("CustURL") %>');"
                                                        href="#">
                                                        <%# Eval("CustDocName")%></a>
                                                </DataItemTemplate>
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="CustURL" Caption="链接地址" CellStyle-Wrap="False">
                                            </dxwgv:GridViewDataColumn>
                                        </Columns>
                                        <%-- EndRegion --%>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <Settings ShowGroupPanel="false" />
                                        <ClientSideEvents CustomButtonClick="" />
                                        <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="BusDoc" Text="业务单证">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl7" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 150px; text-align: right; vertical-align: top;">
                                    单证：
                                </td>
                                <td style="text-align: left; vertical-align: top;">
                                    <dxuc:ASPxUploadControl ID="busDocUploadControl" ClientInstanceName="busDocUploadControl"
                                        runat="server" ShowAddRemoveButtons="True" Width="400px" ShowUploadButton="True"
                                        AddUploadButtonsHorizontalPosition="Center" ShowProgressPanel="True" FileInputCount="2"
                                        RemoveButtonSpacing="8px" AddUploadButtonsSpacing="10" FileUploadMode="OnPageLoad"
                                        OnFileUploadComplete="UploadControl_BusDocUploadComplete">
                                        <ValidationSettings MaxFileSize="100000000" FileDoesNotExistErrorText="文件不存在" GeneralErrorText="上传发生错误"
                                            MaxFileSizeErrorText="文件太大" NotAllowedContentTypeErrorText="不允许上传此类型文件">
                                        </ValidationSettings>
                                        <ClientSideEvents FilesUploadComplete="function(s, e) { BusDocFileUploaded(s, e) }"
                                            FileUploadStart="function(s, e) { BusDocFileUploadStart(s, e); }" />
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
                            <tr>
                                <td style="text-align: right; vertical-align: top;">
                                    单证列表：
                                </td>
                                <td style="text-align: left; vertical-align: top;">
                                    <dxwgv:ASPxGridView ID="gridBusDocList" ClientInstanceName="gridBusDocList" runat="server"
                                        SettingsBehavior-AllowSort="false" KeyFieldName="CustBusDocID" Width="80%" AutoGenerateColumns="False"
                                        OnCustomCallback="gridBusDocList_CustomCallback" OnHtmlRowCreated="gridBusDocList_HtmlRowCreated"
                                        OnRowDeleting="gridBusDocList_RowDeleting">
                                        <%-- BeginRegion Columns --%>
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" CellStyle-Wrap="False" Width="20px">
                                                <NewButton Visible="False" />
                                                <EditButton Visible="False" />
                                                <DeleteButton Visible="true" />
                                             </dxwgv:GridViewCommandColumn>
                                            <dxwgv:GridViewDataColumn FieldName="CustBusDocName" Caption="文件名" CellStyle-Wrap="False"
                                                Width="25" Settings-AllowDragDrop="false">
                                                <DataItemTemplate>
                                                    <asp:HyperLink runat="server" ID="docitemlnk"></asp:HyperLink>
                                                </DataItemTemplate>
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="CustBusDocURL" Caption="链接地址" CellStyle-Wrap="False">
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="CustID" Caption="客户编号" CellStyle-Wrap="False" Visible="false">
                                            </dxwgv:GridViewDataColumn>
                                        </Columns>
                                        <%-- EndRegion --%>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <Settings ShowGroupPanel="false" />
                                        <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="CustContact" Text="联系人">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl3" runat="server">
                        <table style="width: 100%;">
                            <tr>
                                <td style="text-align: left;">
                                    联系人记录：
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dxwgv:ASPxGridView ID="gridContactItem" ClientInstanceName="gridContactItem" runat="server"
                                        KeyFieldName="ContactID" Width="100%" AutoGenerateColumns="False" SettingsBehavior-AllowSort="false"
                                        OnRowInserting="gridContactItem_RowInserting" SettingsBehavior-AllowDragDrop="false"
                                        OnRowUpdating="gridContactItem_RowUpdating" OnRowUpdated="gridContactItem_RowUpdated"
                                        OnRowInserted="gridContactItem_RowInserted" OnRowDeleting="gridContactItem_RowDeleting"
                                        OnRowDeleted="gridContactItem_RowDeleted">
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" Width="15px" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                                <NewButton Visible="true" />
                                                <EditButton Visible="true" />
                                                <DeleteButton Visible="true" />
                                            </dxwgv:GridViewCommandColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="联系人GUID" FieldName="ContactID" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="姓名" FieldName="ContactName" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="职位" FieldName="Position" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="性别" FieldName="Sex" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="电话" FieldName="Tel" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="传真" FieldName="Fax" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="手机" FieldName="MobilePhone" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="电子邮件" FieldName="Email" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="兴趣爱好" FieldName="Interest" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center" Visible="false">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="备注" FieldName="Remark" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center" Visible="false">
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <Settings ShowGroupPanel="false" />
                                        <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                        <SettingsText CustomizationWindowCaption="个性化" />
                                        <Templates>
                                            <EditForm>
                                                <div style="padding: 4px 4px 3px 4px; text-align: center;">
                                                    <table style="width: 70%;" runat="server" id="tblgridContactItemEditorTemplate">
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                姓名：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtContactName" ClientInstanceName="dxetxtContactName" runat="server"
                                                                    Text='<%# Eval("ContactName") %>'>
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                性别：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxComboBox ID="dxeddlSex" ClientInstanceName="dxeddlSex" runat="server" DropDownStyle="DropDownList"
                                                                    SelectedIndex='<%# GetSelectedIndex(Eval("Sex"), "Sex")%>' Width="160px">
                                                                    <Items>
                                                                        <dxe:ListEditItem Text="男" Value="男" />
                                                                        <dxe:ListEditItem Text="女" Value="女" />
                                                                    </Items>
                                                                </dxe:ASPxComboBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                职位：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtPosition" ClientInstanceName="dxetxtPosition" runat="server"
                                                                    Text='<%# Eval("Position") %>'>
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                电话：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtTel" ClientInstanceName="dxetxtTel" runat="server" Text='<%# Eval("Tel") %>'>
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                手机：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtMobilePhone" ClientInstanceName="dxetxtMobilePhone" runat="server"
                                                                    Text='<%# Eval("MobilePhone") %>'>
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                传真：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtFax" ClientInstanceName="dxetxtFax" runat="server" Text='<%# Eval("Fax") %>'>
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                邮件：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtEmail" ClientInstanceName="dxetxtEmail" runat="server"
                                                                    Text='<%# Eval("Email") %>'>
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                &nbsp;
                                                            </td>
                                                            <td style="text-align: left;">
                                                                &nbsp;
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
                    <dxw:ContentControl ID="ContentControl4" runat="server">
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
                                        SettingsBehavior-AllowSort="false" SettingsBehavior-AllowDragDrop="false" OnRowInserting="gridCustomerPtItem_RowInserting"
                                        OnRowUpdating="gridCustomerPtItem_RowUpdating" OnRowUpdated="gridCustomerPtItem_RowUpdated"
                                        OnRowInserted="gridCustomerPtItem_RowInserted" OnRowDeleting="gridCustomerPtItem_RowDeleting"
                                        OnRowDeleted="gridCustomerPtItem_RowDeleted">
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" VisibleIndex="0" Width="15px">
                                                <NewButton Visible="true" />
                                                <EditButton Visible="true" />
                                                <DeleteButton Visible="true" />
                                            </dxwgv:GridViewCommandColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="销售跟进编号" FieldName="FollowID" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataDateColumn Caption="跟进日期" FieldName="FollowDate" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                            </dxwgv:GridViewDataDateColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="跟进类型" FieldName="FollowType" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="跟进程度" FieldName="FollowStage" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="跟进内容" FieldName="FollowMemo" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center" Width="50%">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="跟进人" FieldName="FollowPerson" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center" Visible="false">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataDateColumn Caption="下次跟进日期" FieldName="NextFollow" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center" Visible="false" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                            </dxwgv:GridViewDataDateColumn>
                                        </Columns>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <Settings ShowGroupPanel="false" />
                                        <SettingsBehavior ConfirmDelete="true" AutoExpandAllGroups="true" />
                                        <SettingsText CustomizationWindowCaption="个性化" />
                                        <Templates>
                                            <EditForm>
                                                <div style="padding: 4px 4px 3px 4px; text-align: center;">
                                                    <table style="width: 70%;" runat="server" id="tblgridPtFollowItemEditorTemplate">
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                跟进编号：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtFollowID" ClientInstanceName="dxetxtFollowID" runat="server"
                                                                    Text='<%# Eval("FollowID") %>' Enabled="false">
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                跟进类型：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxComboBox ID="dxeddlFollowType" ClientInstanceName="dxeddlFollowType" runat="server"
                                                                    DropDownStyle="DropDownList" SelectedIndex='<%# GetSelectedIndex(Eval("FollowType"), "FollowType")%>'>
                                                                    <Items>
                                                                        <dxe:ListEditItem Text="面谈" Value="面谈" />
                                                                        <dxe:ListEditItem Text="电话" Value="电话" />
                                                                        <dxe:ListEditItem Text="Email" Value="Email" />
                                                                        <dxe:ListEditItem Text="其他" Value="其他" />
                                                                    </Items>
                                                                </dxe:ASPxComboBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                跟进程度：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxComboBox ID="dxeddlFollowStage" ClientInstanceName="dxeddlFollowStage" runat="server"
                                                                    DropDownStyle="DropDownList" SelectedIndex='<%# GetSelectedIndex(Eval("FollowStage"), "FollowStage")%>'>
                                                                    <Items>
                                                                        <dxe:ListEditItem Text="接触" Value="接触" />
                                                                        <dxe:ListEditItem Text="说明" Value="说明" />
                                                                        <dxe:ListEditItem Text="促成" Value="促成" />
                                                                        <dxe:ListEditItem Text="签单" Value="签单" />
                                                                        <dxe:ListEditItem Text="其他" Value="其他" />
                                                                    </Items>
                                                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                跟进时间：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxDateEdit ID="dxeFollowDate" ClientInstanceName="dxeFollowDate" runat="server"
                                                                    Text='<%# GetDate(Eval("FollowDate"))%>'>
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                跟进人：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtFollowPerson" ClientInstanceName="dxetxtFollowPerson"
                                                                    runat="server" Text='<%# Eval("FollowPerson") %>'>
                                                                </dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                下次跟进：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxDateEdit ID="dxeNextFollow" ClientInstanceName="dxeNextFollow" runat="server"
                                                                    Text='<%# GetDate(Eval("NextFollow"))%>'>
                                                                </dxe:ASPxDateEdit>
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
                                    <dxuc:ASPxUploadControl ID="CustomerPTUploadControl" ClientInstanceName="CustomerPTUploadControl"
                                        runat="server" ShowAddRemoveButtons="True" Width="400px" ShowUploadButton="True"
                                        AddUploadButtonsHorizontalPosition="Center" ShowProgressPanel="True" FileInputCount="3"
                                        RemoveButtonSpacing="8px" AddUploadButtonsSpacing="10" FileUploadMode="OnPageLoad"
                                        OnFileUploadComplete="UploadControl_CustomerPTUploadControl">
                                        <ValidationSettings MaxFileSize="100000000" FileDoesNotExistErrorText="文件不存在" GeneralErrorText="上传发生错误"
                                            MaxFileSizeErrorText="文件太大" NotAllowedContentTypeErrorText="不允许上传此类型文件">
                                        </ValidationSettings>
                                        <ClientSideEvents FilesUploadComplete="function(s, e) { CustomerPtFileUploaded(s, e) }"
                                            FileUploadStart="function(s, e) { CustomerPtUploadStart(s, e); }" />
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
                            <tr>
                                <td>
                                    <dxwgv:ASPxGridView ID="gridPtFollowDocList" ClientInstanceName="gridPtFollowDocList"
                                        runat="server" SettingsBehavior-AllowSort="false" KeyFieldName="CustomerPtFollowDocID"
                                        Width="80%" AutoGenerateColumns="False" OnCustomCallback="gridPtFollowDocList_CustomCallback">
                                        <%-- BeginRegion Columns --%>
                                        <Columns>
                                            <dxwgv:GridViewDataColumn FieldName="FollowDocName" Caption="文件名" CellStyle-Wrap="False"
                                                Width="25" Settings-AllowDragDrop="false">
                                                <DataItemTemplate>
                                                    <a id="fileurl <%# Eval("CustomerPtFollowDocID") %>" onclick="hlPolicyItemTogetherClick('<%# Eval("FollowDocUrl") %>');"
                                                        href="#">
                                                        <%# Eval("FollowDocName")%></a>
                                                </DataItemTemplate>
                                            </dxwgv:GridViewDataColumn>
                                            <dxwgv:GridViewDataColumn FieldName="FollowDocUrl" Caption="链接地址" CellStyle-Wrap="False">
                                            </dxwgv:GridViewDataColumn>
                                        </Columns>
                                        <%-- EndRegion --%>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <Settings ShowGroupPanel="false" />
                                        <ClientSideEvents CustomButtonClick="" />
                                        <SettingsBehavior AllowDragDrop="false" AllowGroup="false" AllowMultiSelection="false" />
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="NotifyClaim" Text="理赔记录">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl5" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <dxwgv:ASPxGridView ID="gridNotifyClaimItem" ClientInstanceName="gridNotifyClaimItem"
                                        runat="server" SettingsBehavior-AllowSort="false" KeyFieldName="NotifyID" Width="100%"
                                        AutoGenerateColumns="False" Settings-ShowFooter="true" SettingsPager-AlwaysShowPager="true"
                                        SettingsBehavior-AllowDragDrop="false">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="理赔编号" FieldName="NotifyID" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                                <DataItemTemplate>
                                                    <a href="javascript:NotifyClaimView('<%# Eval("NotifyID") %>');">
                                                        <%# Eval("NotifyID") %></a>
                                                </DataItemTemplate>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="保单编号" FieldName="PolicyNo" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="保险公司" FieldName="CarrierNameCn" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="险种名称" FieldName="ProdTypeName" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataDateColumn Caption="起保日期" FieldName="StartDate" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                            </dxwgv:GridViewDataDateColumn>
                                            <dxwgv:GridViewDataDateColumn Caption="截止日期" FieldName="EndDate" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                            </dxwgv:GridViewDataDateColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="报案时间" FieldName="NotifyTime" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="报损金额" FieldName="NotifyLossFee" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="赔付率" FieldName="LossRation" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="实赔金额" FieldName="LastPayFee" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataDateColumn Caption="结案日" FieldName="CaseEndTime" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd">
                                            </dxwgv:GridViewDataDateColumn>
                                        </Columns>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem FieldName="NotifyLossFee" SummaryType="Sum" ShowInGroupFooterColumn="NotifyLossFee"
                                                DisplayFormat="合计: {0}" />
                                        </TotalSummary>
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem FieldName="LastPayFee" SummaryType="Sum" ShowInGroupFooterColumn="LastPayFee"
                                                DisplayFormat="合计: {0}" />
                                        </TotalSummary>
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Name="SignPremium" Text="签单记录">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl6" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <dxwgv:ASPxGridView ID="gridPolicyItem" ClientInstanceName="gridPolicyItem" runat="server"
                                        SettingsBehavior-AllowSort="false" KeyFieldName="PolicyID" Width="100%" AutoGenerateColumns="False"
                                        Settings-ShowFooter="true" SettingsPager-AlwaysShowPager="true" SettingsBehavior-AllowDragDrop="false">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="投保单号" FieldName="PolicyID" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                                <DataItemTemplate>
                                                    <a href="javascript:PolicyViewTransfer('<%# Eval("PolicyID") %>');">
                                                        <%# Eval("PolicyID")%></a>
                                                </DataItemTemplate>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="保单编号" FieldName="PolicyNo" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="批改号" FieldName="AltNO" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="保费" FieldName="PremiumBase" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="经纪费" FieldName="ProcessBase" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="创建时间" FieldName="CreateTime" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="审批时间" FieldName="AuditTime" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="保单开始日期" FieldName="StartDate" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="保单结束日期" FieldName="EndDate" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="险种" FieldName="ProdTypeName" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="业务员" FieldName="CarrierSales" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="审核状态" FieldName="PolicyStatusName" CellStyle-Wrap="False"
                                                HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem FieldName="PremiumBase" SummaryType="Sum" ShowInGroupFooterColumn="PremiumBase"
                                                DisplayFormat="合计: {0}" />
                                        </TotalSummary>
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem FieldName="ProcessBase" SummaryType="Sum" ShowInGroupFooterColumn="ProcessBase"
                                                DisplayFormat="合计: {0}" />
                                        </TotalSummary>
                                    </dxwgv:ASPxGridView>
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
    <asp:Panel ID="npExecuteAction" runat="server" CssClass="allborderPanel" Height="30px">
        <table style="width: 100%">
            <tr>
                <td style="width: 400px; text-align: left;">
                    &nbsp;
                </td>
                <td style="width: 50px; text-align: left;">
                    <dxe:ASPxButton runat="server" ID="dxebtnBottomSave" Text="保存" CausesValidation="true"
                        AutoPostBack="false" ValidationGroup="BaseGroup" OnClick="dxebtnBottomSave_Click">
                        <ClientSideEvents Click="function(s, e) {btnValidate(s, e);}" />
                    </dxe:ASPxButton>
                </td>
                <td style="width: 50px; text-align: left;">
                    <dxe:ASPxButton runat="server" ID="dxebtnClose" Text="关闭" CausesValidation="false"
                        AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {btnCloseClick();}" />
                    </dxe:ASPxButton>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
