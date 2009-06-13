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
    public class BO_ProductType : BaseObject
    {
        public BO_ProductType() { }

        public enum FieldList
        {
            ProdTypeID, 
            ProdClass, 
            ProdTypeName, 
            ParentId, 
            Layer
        }


        #region Property

        public string ProdTypeID
        {
            get;
            set;
        }

        public string ProdClass
        {
            get;
            set;
        }

        public string ProdTypeName
        {
            get;
            set;
        }

        public string ParentId
        {
            get;
            set;
        }

        public Int32 Layer
        {
            get;
            set;
        }


        #endregion Property


        #region Methods


        public static List<BO_ProductType> FetchList()
        {
            List<BO_ProductType> list = new List<BO_ProductType>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT ProdTypeID, ProdClass, ProdTypeName, ParentId, Layer ");
            sb.Append(" FROM ProductType ");
            sb.Append(" ORDER BY ProdClass ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_ProductType newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_ProductType();

                    newObj.ProdTypeID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdTypeID));
                    newObj.ProdClass = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdClass));
                    newObj.ProdTypeName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdTypeName));
                    newObj.ParentId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ParentId));
                    newObj.Layer = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.Layer));

                    list.Add(newObj);
                }
            }

            return list;
        }

        
        #endregion Methods


    }
}
