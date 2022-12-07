<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Grid_Binding_ComboBox_ComboBoxAsLookup" %>
<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<%-- EndRegion --%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Using GridViewDataComboBoxColumn as a lookup control</title>
</head>
<body>
    <form id="form1" runat="server">

    <dx:ASPxGridView ID="grid" ClientInstanceName="grid" OnCustomErrorText="grid_CustomErrorText" runat="server" DataSourceID="ProductsDS"  
        Width="100%" AutoGenerateColumns="False" KeyFieldName="ProductID" OnRowUpdating="grid_RowUpdating">
        <columns>
            <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True" />
            <dx:GridViewDataTextColumn ReadOnly="True" VisibleIndex="1" FieldName="ProductID"/>
            <dx:GridViewDataTextColumn VisibleIndex="2" FieldName="ProductName"/>
            <dx:GridViewDataComboBoxColumn FieldName="CategoryID" Caption="Category LookUp" VisibleIndex="3">
                <PropertiesComboBox TextField="CategoryName" IncrementalFilteringMode="Contains" ValueField="CategoryID" DataSourceID="CategoriesDS"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Name="RunTime" FieldName="CategoryID" Caption="RunTime LookUp" VisibleIndex="5"/>
        </columns>
    </dx:ASPxGridView>
    <%-- BeginRegion DataSource --%>
    <asp:AccessDataSource ID="ProductsDS" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT `ProductID`, `ProductName`, `SupplierID`, `CategoryID`, `QuantityPerUnit`, `UnitPrice`, `UnitsInStock`, `UnitsOnOrder`, `ReorderLevel`, `Discontinued`, `EAN13` FROM `Products`">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="CategoriesDS" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT `CategoryID`, `CategoryName`, `Description`, `Picture` FROM `Categories`">
    </asp:AccessDataSource>
        <%-- EndRegion --%>
    </form>
</body>
</html>