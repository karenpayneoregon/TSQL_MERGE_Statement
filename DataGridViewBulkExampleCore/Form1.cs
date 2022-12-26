using System.Data;
using BulkCopyierLibrary;
using BulkCopyierLibraryCore;
using DataGridViewBulkExampleCore.Classes;

namespace DataGridViewBulkExampleCore;

public partial class Form1 : Form
{
    public Form1()
    {
        InitializeComponent();
        Shown += OnShown;
    }
    BindingSource _bindingSource = new BindingSource();
    private void OnShown(object? sender, EventArgs e)
    {
        _bindingSource.DataSource = DataOperations.ReadData();
        dataGridView1.DataSource = _bindingSource;
        dataGridView1.FixHeaders();
        dataGridView1.ExpandColumns();
    }

    private void UpdateButton_Click(object sender, EventArgs e)
    {
        var table = (DataTable)_bindingSource.DataSource;
        var changes = table.GetChanges(DataRowState.Modified);

        if (changes is not null)
        {
            SqlBulkOperations.UpdatePeople(table);
            table.AcceptChanges();
        }
        else
        {
            MessageBox.Show("No Changes");
        }
        
    }
}
