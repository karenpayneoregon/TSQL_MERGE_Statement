using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;

namespace BulkCopyierLibrary
{
    public static class EnumerableExtensions
    {
        public static DataTable AsDataTable<T>(this IEnumerable<T> data)
        {
            PropertyDescriptorCollection pdc = TypeDescriptor.GetProperties(typeof(T));
            var table = new DataTable();

            foreach (PropertyDescriptor prop in pdc)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);

            foreach (T item in data)
            {
                var row = table.NewRow();
                foreach (PropertyDescriptor prop in pdc)
                    row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;

                table.Rows.Add(row);
            }

            return table;

        }
    }
}
