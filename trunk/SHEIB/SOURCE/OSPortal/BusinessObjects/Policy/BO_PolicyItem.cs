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

        public BO_PolicyItem(String id) {
            fetchByID(id);
        }

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
            Process,
            PremiumRate
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

        public Decimal PremiumRate
        {
            get;
            set;
        }
                
        #endregion Property


        #region Methods


        public void Save(ModifiedAction action)
        {
            if (action == ModifiedAction.Insert)
            {
                add();
            }
            else
            {
                update();
            }
        }



        public static List<BO_PolicyItem> FetchListByPolicy(String policyID)
        {
            List<BO_PolicyItem> list = new List<BO_PolicyItem>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT A.ItemID, A.PolicyId, A.ProdID, B.ProdName, A.Coverage, A.Premium, A.ProcRate, A.Process, A.PremiumRate ");
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
                    newObj.PremiumRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PremiumRate));
                    list.Add(newObj);
                }
            }

            return list;
        }


        public static Boolean CheckPolicyProdtExist(String where)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT COUNT(ItemID) ");
            sb.Append(" ");
            sb.Append(" FROM PolicyItem ");
            sb.Append(" WHERE 1=1 ");
            sb.Append(where);

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            
            Int32 count = Convert.ToInt32(_db.ExecuteScalar(dbCommand));
            if (count > 0)
                return true;
            else
                return false;

        }



        public static void Delete(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM PolicyItem ");
            sb.Append(" WHERE ItemID = @ItemID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ItemID", DbType.String, id);

            _db.ExecuteNonQuery(dbCommand);

        }


        public static void DeleteByPolicyId(String policyId)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM PolicyItem ");
            sb.Append(" WHERE PolicyId = @PolicyId ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyId", DbType.String, policyId);

            _db.ExecuteNonQuery(dbCommand);

        }
       
        
        #endregion Methods


        #region Procedure


        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO PolicyItem ( ");
            sb.Append(" ItemID, PolicyId, ProdID, Coverage, Premium, ProcRate, Process, PremiumRate ");
            sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append(" @ItemID, @PolicyId, @ProdID, @Coverage, @Premium, @ProcRate, @Process, @PremiumRate ");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ItemID", DbType.String, this.ItemID);
            _db.AddInParameter(dbCommand, "@PolicyId", DbType.String, this.PolicyId);
            _db.AddInParameter(dbCommand, "@ProdID", DbType.String, this.ProdID);


            _db.AddInParameter(dbCommand, "@Coverage", DbType.Decimal, this.Coverage);
            _db.AddInParameter(dbCommand, "@Premium", DbType.Decimal, this.Premium);
            _db.AddInParameter(dbCommand, "@ProcRate", DbType.Decimal, this.ProcRate);
            _db.AddInParameter(dbCommand, "@Process", DbType.Decimal, this.Process);

            _db.AddInParameter(dbCommand, "@PremiumRate", DbType.Decimal, this.PremiumRate);

            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE PolicyItem SET ");
            sb.Append("PolicyId=@PolicyId, ProdID=@ProdID, Coverage=@Coverage, Premium=@Premium,");
            sb.Append("ProcRate=@ProcRate, Process=@Process, PremiumRate=@PremiumRate ");
            sb.Append(" Where ItemID=@ItemID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ItemID", DbType.String, this.ItemID);
            _db.AddInParameter(dbCommand, "@PolicyId", DbType.String, this.PolicyId);
            _db.AddInParameter(dbCommand, "@ProdID", DbType.String, this.ProdID);


            _db.AddInParameter(dbCommand, "@Coverage", DbType.Decimal, this.Coverage);
            _db.AddInParameter(dbCommand, "@Premium", DbType.Decimal, this.Premium);
            _db.AddInParameter(dbCommand, "@ProcRate", DbType.Decimal, this.ProcRate);
            _db.AddInParameter(dbCommand, "@Process", DbType.Decimal, this.Process);
            _db.AddInParameter(dbCommand, "@PremiumRate", DbType.Decimal, this.PremiumRate);

            _db.ExecuteNonQuery(dbCommand);

        }



        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT A.ItemID, A.PolicyId, A.ProdID, B.ProdName, A.Coverage, A.Premium, A.ProcRate, A.Process, A.PremiumRate ");
            sb.Append(" FROM PolicyItem A ");
            sb.Append(" LEFT JOIN Product B ON A.ProdID = B.ProdID ");
            sb.Append(" WHERE A.ItemID = @ItemID");
            sb.Append(" ");
            sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ItemID", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.ItemID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ItemID));
                    this.PolicyId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyId));
                    this.ProdID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdID));
                    this.ProdName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdName));

                    this.Coverage = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Coverage));
                    this.Premium = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Premium));
                    this.ProcRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.ProcRate));
                    this.Process = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Process));
                    this.PremiumRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PremiumRate));
                }
            }
        }



        #endregion Procedure
    



    }
}
