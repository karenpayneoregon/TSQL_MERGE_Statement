using System.Data;
using System.Data.SqlClient;

namespace BulkCopyierLibraryCore
{

    public class DataOperations 
    {
        public static DataTable ReadData()
        {
            string connectionString =
                "Data Source=.\\sqlexpress;Initial Catalog=BulkCopyDatabaseCodeSample;Integrated Security=True;Encrypt=False";

            string selectQuery = "SELECT Id,FirstName,LastName,Gender,BirthDay FROM BulkCopyDatabaseCodeSample.dbo.Person1";
            var dt = new DataTable();

            using var cn = new SqlConnection { ConnectionString = connectionString };
            using var cmd = new SqlCommand() { Connection = cn, CommandText = selectQuery};
            cn.Open();
            dt.Load(cmd.ExecuteReader());
            dt.Columns["Id"]!.ColumnMapping = MappingType.Hidden;

            return dt;
        }
    }
}
