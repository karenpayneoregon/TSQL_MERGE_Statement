using BaseLibrary;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace BulkCopyierLibrary
{
    /// <summary>
    /// Responsible for bulk and merge operations
    /// </summary>
    public class PersonExporter : BaseSqlServerConnections
    {
        public ErrorInformation Exception = new ErrorInformation();
        public List<Person> List;
        public int BatchSize { get; set; }

        /// <summary>
        /// Set BatchSize to a default of 100
        /// </summary>
        /// <param name="pList">List of person</param>
        public PersonExporter(List<Person> pList)
        {
            List = pList;
            BatchSize = 100;

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="pList">List of person</param>
        /// <param name="pBatchSize">A value to indicate when to write data to the backend database</param>
        public PersonExporter(List<Person> pList, int pBatchSize)
        {
            List = pList;
            BatchSize = pBatchSize;

        }
        /// <summary>
        /// Simple bulk copy with no column mappings as in this case the fields in
        /// Person class names and data types are a match to the table in the database.
        /// 
        /// If an exception is thrown, the caller can check Exception property of this
        /// class for the exception message.
        /// </summary>
        /// <param name="pReset">Passing true will empty the current table's data while not passing a value will not empty the tables content</param>
        /// <returns>Success of the operation</returns>
        public bool Execute(bool pReset = false)
        {
            DefaultCatalog = "BulkCopyDatabaseCodeSample";
            bool success = true;
            using (var cn = new SqlConnection { ConnectionString = ConnectionString })
            {
                cn.Open();

                if (pReset)
                {
                    using (SqlCommand cmd = new SqlCommand() { Connection = cn })
                    {
                        // allows us to start fresh :-)
                        cmd.CommandText = "TRUNCATE TABLE Person";
                        cmd.ExecuteNonQuery();
                    }
                }

                SqlTransaction transaction = cn.BeginTransaction();

                using (var sbc = new SqlBulkCopy(cn, SqlBulkCopyOptions.Default, transaction))
                {

                    // you should tinker with this in your project
                    sbc.BatchSize = BatchSize;
                    sbc.DestinationTableName = "Person";

                    try
                    {
                        sbc.WriteToServer(List.AsDataTable());
                    }
                    catch (Exception ex)
                    {

                        transaction.Rollback();
                        cn.Close();

                        Exception.HasError = true;
                        Exception.Message = ex.Message;
                        success = false;
                    }
                }

                transaction.Commit();
            }

            return success;
        }
        public void UpdateData(DataTable pDataTable)
        {
            using (var cn = new SqlConnection() { ConnectionString = ConnectionString })
            {
                using (var cmd = new SqlCommand("", cn))
                {
                    try
                    {
                        cn.Open();

                        //Creating temp table on database which is used them removed after the merge
                        cmd.CommandText = @"CREATE TABLE #TmpPersonTable(
                                [Id] [INT],
                                [FirstName] [TEXT] NULL,
                                [LastName] [TEXT] NULL,
                                [Gender] [INT] NULL,[BirthDay] [DATETIME2](7) NULL)";

                        cmd.ExecuteNonQuery();

                        //Bulk operation into temp table
                        using (var bulkcopy = new SqlBulkCopy(cn))
                        {
                            // you should experiment with this in your project
                            bulkcopy.BulkCopyTimeout = 660;
                            bulkcopy.DestinationTableName = "#TmpPersonTable";
                            bulkcopy.WriteToServer(pDataTable);
                            bulkcopy.Close();
                        }

                        // you should tinker with this in your project
                        cmd.CommandTimeout = 300;

                        cmd.CommandText = @"
                            MERGE INTO dbo.Person AS P
                            USING dbo.#TmpPersonTable AS S
                            ON P.Id = S.Id
                            WHEN MATCHED THEN
                                UPDATE SET P.FirstName = S.FirstName ,
                                           P.LastName = S.LastName ,
                                           P.Gender = S.Gender ,
                                           P.BirthDay = S.BirthDay
                            WHEN NOT MATCHED THEN
                                INSERT ( FirstName ,
                                         LastName ,
                                         Gender ,
                                         BirthDay
                                       )
                                VALUES ( S.FirstName ,
                                         S.LastName ,
                                         S.Gender ,
                                         S.BirthDay
                                       )
                            WHEN NOT MATCHED BY SOURCE THEN
                                DELETE;
                            DROP TABLE #TmpPersonTable";

                        cmd.ExecuteNonQuery();

                    }
                    catch (Exception ex)
                    {
                        Exception.HasError = true;
                        Exception.Message = ex.Message;
                    }
                    finally
                    {
                        cn.Close();
                    }
                }
            }
        }
    }

}
