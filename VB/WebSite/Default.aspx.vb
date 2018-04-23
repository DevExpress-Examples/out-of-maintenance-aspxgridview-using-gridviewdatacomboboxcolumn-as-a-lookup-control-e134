Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxGridView

Partial Public Class Grid_Binding_ComboBox_ComboBoxAsLookup
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		'Run time population of GridViewDataComboBoxColumn column with data
		Dim combo As GridViewDataComboBoxColumn = TryCast(grid.Columns("RunTime"), GridViewDataComboBoxColumn)
		combo.PropertiesComboBox.ValueType = GetType(Integer)
		combo.PropertiesComboBox.Items.Add("Beverages", 1)
		combo.PropertiesComboBox.Items.Add("Condiments", 2)
		combo.PropertiesComboBox.Items.Add("Confections", 3)
		combo.PropertiesComboBox.Items.Add("Dairy Products", 4)
		combo.PropertiesComboBox.Items.Add("Grains/Cereals", 5)
		combo.PropertiesComboBox.Items.Add("Meat/Poultry", 6)
		combo.PropertiesComboBox.Items.Add("Produce", 7)
		combo.PropertiesComboBox.Items.Add("Seafood", 8)
		grid.ExpandAll()
	End Sub
	Protected Sub grid_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
		Throw New InvalidOperationException("Data modifications are not allowed in the online demo")
	End Sub
End Class
