--- for writing article

SELECT Id,
       FirstName,
       LastName,
       Gender,
       BirthDay
FROM dbo.Person;


SELECT name FROM tempdb.sys.objects WHERE name LIKE N'#TmpPersonTable%';

IF EXISTS(SELECT [name] FROM tempdb.sys.tables WHERE [name] like '#TmpPersonTable%') BEGIN
   DROP TABLE #tempTable;
END;