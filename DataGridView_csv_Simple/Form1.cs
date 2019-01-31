using BulkCopyierLibrary;
using Microsoft.VisualBasic.FileIO;
using System;
using System.IO;
using System.Linq;
using System.Windows.Forms;

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
            DataGridView1.SuspendLayout();
            string[] fields;

            // Add reference for Microsoft.VisualBasic to your project for TextFieldParser
            using (var parser = new TextFieldParser(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "People.csv")))
            {
                parser.TextFieldType = FieldType.Delimited;
                parser.SetDelimiters(",");

                while (!parser.EndOfData)
                {
                    fields = parser.ReadFields();
                    DataGridView1.Rows.Add(fields[0], fields[1], fields[2], string.IsNullOrWhiteSpace(fields[3]) ? "9/23/1987" : fields[3]);
                }
            }

            DataGridView1.ExpandColumns();
            DataGridView1.ResumeLayout();

        }
        /// <summary>
        /// Here we export data from the DataGridView into our SQL Server table
        /// then present a dialog to show several rows of data retrieved from
        /// the data just inserted via the bulk operation and allow you to edit
        /// the data then by pressing the Update button create a temp table, push
        /// the data from the data in this dialog into the temp table followed
        /// by doing a merge operation. 
        /// 
        /// You could show all records too if desired by removal of the TOP clause
        /// in the SELECT statement in DataOperations class.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void exportButton_Click(object sender, EventArgs e)
        {
            var peopleList = DataGridView1.Rows.Cast<DataGridViewRow>()
                .Where((row) => !row.IsNewRow)
                .Select((row) => new Person
                {
                    FirstName = Convert.ToString(row.Cells["FirstNameColumn"].Value),
                    LastName = Convert.ToString(row.Cells["LastNameColumn"].Value),
                    Gender = Convert.ToInt32(row.Cells["GenderColumn"].Value),
                    BirthDay = Convert.ToDateTime(Convert.ToString(row.Cells["BirthdayColumn"].Value))
                }).ToList();
        

            var personExporter = new PersonExporter(peopleList,(int)numericUpDown1.Value);

            if (personExporter.Execute(truncateCheckBox.Checked))
            {
                var ops = new DataOperations();
                var dt = ops.GetPeople();
                if (!ops.IsSuccessFul)
                {
                    MessageBox.Show($"Operation failed{Environment.NewLine}{ops.LastExceptionMessage}");
                }

                var f = new frmResults();
                try
                {
                    /*
                     * Note: The DataGridView in the following form has no error handling when 
                     * changing values e.g. if you attempt an invalid date an alert appears, either
                     * correct the error or press ESC after the error message is closed. This
                     * allows you to concentrate on the lesson at hand, a MERGE operation
                     */
                    f.dataGridView1.DataSource = dt;

                    f.dataGridView1.Columns[0].ReadOnly = true;

                    if (f.ShowDialog() == DialogResult.OK)
                    {

                        /*
                         * IMPORTANT: At this point we have over 5,000 rows but if you press the
                         * Update button in the child form the MERGE operation will if nothing else
                         * leave you with 8 records because we did a TOP 8 in DataOperations.
                         * 
                         * So you may very well want to change from TOP 8 to a SELECT w/o the TOP n.
                         */
                        personExporter.UpdateData(dt);

                        if (personExporter.Exception.HasError)
                        {
                            MessageBox.Show($"Encountered issues{Environment.NewLine}{personExporter.Exception.Message}");
                        }
                        else
                        {
                            MessageBox.Show("Updates finished!!!");
                        }
                    }
                    else
                    {
                        MessageBox.Show("User cancelled updates");
                    }

                }
                finally
                {
                    f.Dispose();
                }
            }
            else
            {
                MessageBox.Show($"{personExporter.Exception.Message}");
            }
        }
    }
}
