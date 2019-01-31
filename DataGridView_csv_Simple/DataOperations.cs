using System;
using BaseLibrary;
using System.Data;
using System.Data.SqlClient;

namespace DataGridView_csv_Simple
{
    /// <summary>
    /// Responsible for retrieving data just inserted from PersonExporter.PersonExporter method
    /// which in turn is presented in a child form to display and/or modify the data.
    /// </summary>
    public class DataOperations : BaseSqlServerConnections
    {
        /*
         * Note TOP 8, this will wipe out all but 8 records in the merge operation so if you want
         * to see all 5,000 records affected remove the TOP 8 clause. If you leave "as is" you can
         * remove it then run the code again to re-populate the initial 5,000 plus records.
         */
        string selectQuery = "SELECT TOP 8 Id,FirstName,LastName,Gender,BirthDay FROM BulkCopyDatabaseCodeSample.dbo.Person";

        public DataOperations()
        {
            DefaultCatalog = "BulkCopyDatabaseCodeSample";
        }
        public DataTable GetPeople()
        {
            var dt = new DataTable();

            using (var cn = new SqlConnection { ConnectionString = ConnectionString })
            {
                using (var cmd = new SqlCommand() { Connection = cn, CommandText = selectQuery})
                {
                    try
                    {
                        cn.Open();
                        dt.Load(cmd.ExecuteReader());
                    }
                    catch (Exception ex)
                    {
                        mHasException = true;
                        mLastException = ex;
                    }
                }
            }

            return dt;
        }
    }
}
