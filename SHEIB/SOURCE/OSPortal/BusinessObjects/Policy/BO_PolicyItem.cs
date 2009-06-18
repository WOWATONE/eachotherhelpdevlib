using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Runtime.Serialization;

namespace BusinessObjects.Policy
{
    [Serializable()]
    public class BO_PolicyItem : BaseObject
    {

        public BO_PolicyItem() { }

        #region Variables

        public enum FieldList
        {
            ItemID, 
            PolicyId, 
            ProdID, 
            ProdName,
            Coverage, 
            Premium, 
            ProcRate, 
            Process
        }

        #endregion Variables


        #region Property

        public String ItemID
        {
            get;
            set;
        }

        public String PolicyId
        {
            get;
            set;
        }

        public String ProdID
        {
            get;
            set;
        }

        public String ProdName
        {
            get;
            set;
        }

        public Decimal Coverage
        {
            get;
            set;
        }

        public Decimal Premium
        {
            get;
            set;
        }

        public Decimal ProcRate
        {
            get;
            set;
        }

        public Decimal Process
        {
            get;
            set;
        }

                
        #endregion Property


        #region Methods

        public static List<BO_PolicyItem> FetchListByPolicy(String policyID)
        {
            List<BO_PolicyItem> list = new List<BO_PolicyItem>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT A.ItemID, A.PolicyId, A.ProdID, B.ProdName, A.Coverage, A.Premium, A.ProcRate, A.Process ");
            sb.Append(" FROM PolicyItem A ");
            sb.Append(" LEFT JOIN Product B ON A.ProdID = B.ProdID ");
            sb.Append(" WHERE A.PolicyID = @PolicyID");
            sb.Append(" ");
            sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyID", DbType.String, policyID);

            BO_PolicyItem newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_PolicyItem();

                    newObj.ItemID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ItemID));
                    newObj.PolicyId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyId));
                    newObj.ProdID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdID));
                    newObj.ProdName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdName));

                    newObj.Coverage = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Coverage));
                    newObj.Premium = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Premium));
                    newObj.ProcRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.ProcRate));
                    newObj.Process = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Process));
                    
                    list.Add(newObj);
                }
            }

            return list;
        }

       #endregion Methods
    }
}
