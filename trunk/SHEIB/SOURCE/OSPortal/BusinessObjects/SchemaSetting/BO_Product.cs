using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Runtime.Serialization;

namespace BusinessObjects.SchemaSetting
{
    [Serializable()]
    public class BO_Product : BaseObject
    {

        public BO_Product() { }

        public enum FieldList
        {
            ProdID, 
            ProdName, 
            ProdTypeID, 
            ProdTypeName,
            Brief, 
            PremiumRate, 
            FlagMain, 
            Remark, 
            ProcRate
        }

        #region Property

        public string ProdID
        {
            get;
            set;
        }

        public string ProdName
        {
            get;
            set;
        }

        public string ProdTypeID
        {
            get;
            set;
        }

        public string ProdTypeName
        {
            get;
            set;
        }

        public string Brief
        {
            get;
            set;
        }

        public Decimal PremiumRate
        {
            get;
            set;
        }

        public Boolean FlagMain
        {
            get;
            set;
        }

        public String Remark
        {
            get;
            set;
        }

        public Decimal ProcRate
        {
            get;
            set;
        }


        #endregion Property


        #region Methods


        public static List<BO_Product> FetchList(String whereFilter)
        {
            List<BO_Product> list = new List<BO_Product>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT A.ProdID, A.ProdName, A.ProdTypeID, B.ProdTypeName, A.Brief, ");
            sb.Append(" A.PremiumRate, A.FlagMain, A.Remark, A.ProcRate ");
            sb.Append(" FROM Product A ");
            sb.Append(" LEFT JOIN ProductType B ON A.ProdTypeID = B.ProdTypeID ");
            sb.Append(" ORDER BY B.ProdTypeName,A.ProdName ");
            
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_Product newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_Product();

                    newObj.ProdID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdID));
                    newObj.ProdName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdName));
                    newObj.ProdTypeID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdTypeID));
                    newObj.ProdTypeName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdTypeName));
                    newObj.Brief = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Brief));

                    newObj.PremiumRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PremiumRate));
                    newObj.FlagMain = Utility.GetBooleanFromReader(reader, Convert.ToInt32(FieldList.FlagMain));
                    newObj.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                    newObj.ProcRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.ProcRate));

                    list.Add(newObj);
                }
            }

            return list;
        }

        #endregion Methods



    }
}
