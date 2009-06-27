using System;
using System.Collections.Generic;
using System.Text;

using System.Xml;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;


namespace BusinessObjects
{
    public class DataService
    {
        public static readonly Database DB = DatabaseFactory.CreateDatabase();
        public static readonly DbConnection DBCon = DB.CreateConnection(); 
    }
}
