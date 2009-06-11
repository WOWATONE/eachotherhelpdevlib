using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace BusinessObjects
{
    public static class Utility
    {

        public static string GetStringFromReader(IDataReader reader, Int32 columnIndex)
        {
            string value = "";
            if (!Convert.IsDBNull(reader[columnIndex]))
            {
                value = reader.GetString(columnIndex).Trim();
            }
            return value;
        }

        public static Int32 GetIntFromReader(IDataReader reader, Int32 columnIndex)
        {
            Int32 value = 0;
            if (!Convert.IsDBNull(reader[columnIndex]))
            {
                value = reader.GetInt32(columnIndex);
            }
            return value;
        }


        public static DateTime GetDatetimeFromReader(IDataReader reader, Int32 columnIndex)
        {

            DateTime value = DateTime.SpecifyKind(DateTime.MinValue, DateTimeKind.Utc);
            if (!Convert.IsDBNull(reader[columnIndex]))
            {
                value = reader.GetDateTime(columnIndex);
            }
            return value;
        }

        public static Double GetDoubleFromReader(IDataReader reader, Int32 columnIndex)
        {
            double value = 0;
            if (!Convert.IsDBNull(reader[columnIndex]))
            {
                value = reader.GetDouble(columnIndex);
            }
            return value;
        }


        public static Boolean GetBooleanFromReader(IDataReader reader, Int32 columnIndex)
        {
            Boolean value = false;
            if (!Convert.IsDBNull(reader[columnIndex]))
            {
                value = reader.GetBoolean(columnIndex);
            }
            return value;
        }

        public static Decimal GetDecimalFromReader(IDataReader reader, Int32 columnIndex)
        {
            Decimal value = 0;
            if (!Convert.IsDBNull(reader[columnIndex]))
            {
                value = reader.GetDecimal(columnIndex);
            }
            return value;
        }

        public static string GetStringFromReader(IDataReader reader, string columnName)
        {
            string value = "";
            if (!Convert.IsDBNull(reader[columnName]))
            {
                value = reader[columnName].ToString().Trim();
            }
            return value;
        }

        public static Int32 GetIntFromReader(IDataReader reader, string columnName)
        {
            Int32 value = 0;
            if (!Convert.IsDBNull(reader[columnName]))
            {
                value = Convert.ToInt32(reader[columnName]);
            }
            return value;
        }


        public static DateTime GetDatetimeFromReader(IDataReader reader, string columnName)
        {

            DateTime value = DateTime.SpecifyKind(DateTime.MinValue, DateTimeKind.Utc);
            if (!Convert.IsDBNull(reader[columnName]))
            {
                value = Convert.ToDateTime(reader[columnName]);
            }
            return value;
        }

        public static Double GetDoubleFromReader(IDataReader reader, string columnName)
        {
            double value = 0;
            if (!Convert.IsDBNull(reader[columnName]))
            {
                value = Convert.ToDouble(reader[columnName]);
            }
            return value;
        }


        public static Boolean GetBooleanFromReader(IDataReader reader, string columnName)
        {
            Boolean value = false;
            if (!Convert.IsDBNull(reader[columnName]))
            {
                value = Convert.ToBoolean(reader[columnName]);
            }
            return value;
        }

        public static Decimal GetDecimalFromReader(IDataReader reader, string columnName)
        {
            Decimal value = 0;
            if (!Convert.IsDBNull(reader[columnName]))
            {
                value = Convert.ToDecimal(reader[columnName]);
            }
            return value;
        }
    }
}
