using System;
using System.Data;
using System.Windows.Forms;
using BulkCopyierLibrary;

namespace DataGridView_csv_Simple
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            Shown += Form1_Shown;
        }

        private void Form1_Shown(object sender, EventArgs e)
        {
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.DataSource = DataOperations.ReadData();
        }

        private void MergeButton_Click(object sender, EventArgs e)
        {
            var (success, exception) = Exporter.UpdateData((DataTable)dataGridView1.DataSource);
            MessageBox.Show(success ? "Done" : $"Error\n{exception.Message}");
        }
    }
}
