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
                value = reader.GetString(columnIndex);
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


    }
}
