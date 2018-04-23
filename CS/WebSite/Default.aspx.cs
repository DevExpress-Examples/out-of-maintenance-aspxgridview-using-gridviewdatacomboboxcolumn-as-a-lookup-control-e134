using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web;

public partial class Grid_Binding_ComboBox_ComboBoxAsLookup : System.Web.UI.Page {
    protected void Page_Init(object sender, EventArgs e) {
        //Run time population of GridViewDataComboBoxColumn column with data
        GridViewDataComboBoxColumn combo = grid.Columns["RunTime"] as GridViewDataComboBoxColumn;
        combo.PropertiesComboBox.ValueType = typeof(int);
        combo.PropertiesComboBox.IncrementalFilteringMode = IncrementalFilteringMode.Contains;
        combo.PropertiesComboBox.Items.Add("Beverages", 1);
        combo.PropertiesComboBox.Items.Add("Condiments", 2);
        combo.PropertiesComboBox.Items.Add("Confections", 3);
        combo.PropertiesComboBox.Items.Add("Dairy Products", 4);
        combo.PropertiesComboBox.Items.Add("Grains/Cereals", 5);
        combo.PropertiesComboBox.Items.Add("Meat/Poultry", 6);
        combo.PropertiesComboBox.Items.Add("Produce", 7);
        combo.PropertiesComboBox.Items.Add("Seafood", 8);      
    }
    protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
        throw new CallbackException("Data modifications are not allowed in the online demo");
    }
    protected void grid_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
    {
        if (e.Exception is CallbackException)
            e.ErrorText = e.Exception.Message;
    }
}
