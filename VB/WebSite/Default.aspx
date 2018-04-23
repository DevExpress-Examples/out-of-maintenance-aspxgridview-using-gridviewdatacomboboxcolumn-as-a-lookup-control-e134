<%-- BeginRegion --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Grid_Binding_ComboBox_ComboBoxAsLookup" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v7.3"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v7.3"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v7.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v7.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Using GridViewDataComboBoxColumn as a lookup control</title>
</head>
<body>
	<form id="form1" runat="server">

	<dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="ProductsDS"  
		Width="100%" AutoGenerateColumns="False" KeyFieldName="ProductID" OnRowUpdating="grid_RowUpdating">
		<columns>
			<dxwgv:GridViewCommandColumn VisibleIndex="0">
				<EditButton Visible="True"/>
			</dxwgv:GridViewCommandColumn>
			<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="1" FieldName="ProductID"/>
			<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="ProductName"/>
			<dxwgv:GridViewDataComboBoxColumn FieldName="CategoryID" Caption="Category LookUp" VisibleIndex="3">
				<PropertiesComboBox TextField="CategoryName" ValueField="CategoryID" DataSourceID="CategoriesDS"></PropertiesComboBox>
			</dxwgv:GridViewDataComboBoxColumn>
			<dxwgv:GridViewDataComboBoxColumn Name="RunTime" FieldName="CategoryID" Caption="RunTime LookUp" VisibleIndex="5"/>
		</columns>
	</dxwgv:ASPxGridView>
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
