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
            <dxtc:TabPage Name="AddInfo" Text="附加资料">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl2" runat="server">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 150px; text-align: right;">
                                    主要业务：
                                </td>
                                <td style="width: 170px; text-align: left;">
                                    <dxe:ASPxTextBox ID="dxetxtMainOper" ClientInstanceName="dxetxtMainOper" runat="server" Width="160px"></dxe:ASPxTextBox>
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
                                    <dxe:ASPxTextBox ID="dxetxtAssetSize" ClientInstanceName="dxetxtAssetSize" runat="server" Width="160px"></dxe:ASPxTextBox>
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
                                    <dxe:ASPxTextBox ID="dxetxtMainProduct" ClientInstanceName="dxetxtMainProduct" runat="server" Width="160px"></dxe:ASPxTextBox>
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
                                    <dxe:ASPxTextBox ID="dxetxtRemark" ClientInstanceName="dxetxtRemark" runat="server" Width="160px"></dxe:ASPxTextBox>
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
                                        KeyFieldName="ContactID" Width="100%" AutoGenerateColumns="False" OnRowInserting="gridContactItem_RowInserting"
                                        OnRowUpdating="gridContactItem_RowUpdating" OnRowUpdated="gridContactItem_RowUpdated"
                                        OnRowInserted="gridContactItem_RowInserted" OnRowDeleting="gridContactItem_RowDeleting"
                                        OnRowDeleted="gridContactItem_RowDeleted">
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn Caption="&nbsp;" Width="15px" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                                <NewButton Visible="true" />
                                                <EditButton Visible="true" />
                                                <DeleteButton Visible="true" />
                                            </dxwgv:GridViewCommandColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="联系人GUID" FieldName="ContactID" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center"
                                                Visible="false">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="姓名" FieldName="ContactName" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="所属客户GUID" FieldName="CustID" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center"
                                                Visible="false">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="职位" FieldName="Position" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="性别" FieldName="Sex" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="电话" FieldName="Tel" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="传真" FieldName="Fax" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="手机" FieldName="MobilePhone" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="电子邮件" FieldName="Email" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="兴趣爱好" FieldName="Interest" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center"
                                                Visible="false">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="备注" FieldName="Remark" CellStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center" Visible="false">
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
                                                                联系人GUID：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtContactID" ClientInstanceName="dxetxtContactID" runat="server" Text='<%# Eval("ContactID") %>'></dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                姓名：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtContactName" ClientInstanceName="dxetxtContactName" runat="server" Text='<%# Eval("ContactName") %>'></dxe:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                性别：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxComboBox ID="dxeddlSex" ClientInstanceName="dxeddlSex" runat="server" DropDownStyle="DropDownList"></dxe:ASPxComboBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                职位：
                                                            </td>
                                                            <td style="text-align: left;">
                                                               <dxe:ASPxTextBox ID="dxetxtPosition" ClientInstanceName="dxetxtPosition" runat="server" Text='<%# Eval("Position") %>'></dxe:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                电话：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                 <dxe:ASPxTextBox ID="dxetxtTel" ClientInstanceName="dxetxtTel" runat="server" Text='<%# Eval("Tel") %>'></dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                手机：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtMobilePhone" ClientInstanceName="dxetxtMobilePhone" runat="server" Text='<%# Eval("MobilePhone") %>'></dxe:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                传真：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtFax" ClientInstanceName="dxedxetxtFax" runat="server" Text='<%# Eval("Fax") %>'></dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                邮件：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtEmail" ClientInstanceName="dxetxtEmail" runat="server" Text='<%# Eval("Email") %>'></dxe:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap; text-align: right;">
                                                                所属客户：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <dxe:ASPxTextBox ID="dxetxtCustID" ClientInstanceName="dxetxtCustID" runat="server" Text='<%# Eval("CustID") %>'></dxe:ASPxTextBox>
                                                            </td>
                                                            <td style="white-space: nowrap; text-align: right;"> 
                                                            </td>
                                                            <td style="text-align: left;">
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
                    <input type="button" value="取消" class="input_2" onclick="javascript:window.close();" />
                </td>
                <td style="width: 20px; text-align: left;">
                    &nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
