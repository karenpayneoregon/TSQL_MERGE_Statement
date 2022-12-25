## Working with T-SQL MERGE statement (C#)

Full [article](https://social.technet.microsoft.com/wiki/contents/articles/52491.working-with-t-sql-merge-statement-c.aspx) on Microsoft TechNet.

This article presents an efficient method to synchronize database tables using the MERGE Jump command rather than write separate SQL statements e.g. INSERT, UPDATE and DELETE against a target table by matching the records from a source table.

This code sample shows the very basics for doing bulk operations from data presented in a DataGridView that does not have its data source set by reading data from a delimited text file which has columns which match those in a SQL-Server database table. Also demonstrated is how to do a bulk operation on the same data where in a single operation the original data is upset (meaning if in the new data source, a record was modified or deleted it’s reflected in the source/original table) and additions are added to the source table.

# Important

12/2022 this branch is a slimmed down version and updated the .NET Framework, removed a base library.