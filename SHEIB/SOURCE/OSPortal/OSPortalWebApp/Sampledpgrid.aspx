<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sampledpgrid.aspx.cs" Inherits="OSPortalWebApp.Sampledpgrid" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta content="zh-CN" http-equiv="Content-Language" />
    <script src="js/jquery-1.3.2.js" type="text/javascript"></script>	
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
  
    
    <asp:XmlDataSource ID="dsMenu" runat="server" DataFile="~/Demos.xml" XPath="//DemoGroup" EnableViewState="False" />
    
    
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="EmployeeID" OnCustomDataCallback="grid_CustomDataCallback" Width="100%">
        <Columns>
            <%-- BeginRegion Auto Generated Columns --%>
            <dxwgv:GridViewDataColumn FieldName="FirstName" VisibleIndex="1"/>
            <dxwgv:GridViewDataColumn FieldName="Title" VisibleIndex="4" />
            <dxwgv:GridViewDataColumn FieldName="Notes" Visible="False" />
            <dxwgv:GridViewDataColumn FieldName="LastName" VisibleIndex="2" />
            <dxwgv:GridViewDataColumn FieldName="BirthDate" VisibleIndex="3"/>
            <dxwgv:GridViewDataColumn FieldName="HireDate" VisibleIndex="5"/>
            <%-- EndRegion --%>
            <dxwgv:GridViewDataColumn Caption="Details" VisibleIndex="8" Width="5%">
                <DataItemTemplate>
                    <a href="javascript:void(0);" onclick="OnMoreInfoClick(this, '<%# Container.KeyValue %>')">More Info...</a>
                </DataItemTemplate>
            </dxwgv:GridViewDataColumn>
        </Columns>
        <SettingsPager Mode="ShowAllRecords"/>
    </dxwgv:ASPxGridView>
    <%-- BeginRegion DataSource --%>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/database/nwind.mdb"
        SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Photo], [Extension], [Notes] FROM [Employees] WHERE [Photo] is not null">
    </asp:AccessDataSource>
    <%-- EndRegion --%>
    
    
    
    </div>
    </form>
</body>
</html>
