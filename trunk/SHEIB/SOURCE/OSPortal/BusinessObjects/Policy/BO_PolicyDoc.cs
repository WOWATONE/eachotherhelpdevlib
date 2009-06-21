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
    public class BO_PolicyDoc : BaseObject
    {
        public BO_PolicyDoc() { }


        public BO_PolicyDoc(String id)
        {
            fetchByID(id);
        }


        #region Variables

        public enum FieldList
        {
            PolicyDocID, 
            PolicyID, 
            DocName, 
            DocURL
        }

        #endregion Variables


        #region Property


        public String PolicyDocID
        {
            get;
            set;
        }

        public String PolicyID
        {
            get;
            set;
        }

        public String DocName
        {
            get;
            set;
        }

        public String DocURL
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



        public static List<BO_PolicyDoc> FetchListByPolicy(String policyID)
        {
            List<BO_PolicyDoc> list = new List<BO_PolicyDoc>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT PolicyDocID, PolicyID, DocName, DocURL ");
            sb.Append(" FROM PolicyDoc ");
            sb.Append(" WHERE PolicyID = @PolicyID");
            sb.Append(" ");
            sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyID", DbType.String, policyID);

            BO_PolicyDoc newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_PolicyDoc();

                    newObj.PolicyDocID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyDocID));
                    newObj.PolicyID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyID));
                    newObj.DocName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DocName));
                    newObj.DocURL = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DocURL));
                                        
                    list.Add(newObj);
                }
            }

            return list;
        }


        
        public static void Delete(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM PolicyDoc ");
            sb.Append(" WHERE PolicyDocID = @PolicyDocID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyDocID", DbType.String, id);

            _db.ExecuteNonQuery(dbCommand);

        }

        public static void Delete(String policyID, String docName)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM PolicyDoc ");
            sb.Append(" WHERE PolicyID = @PolicyID ");
            sb.Append(" AND DocName = @DocName ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyID", DbType.String, policyID);
            _db.AddInParameter(dbCommand, "@DocName", DbType.String, docName);
            _db.ExecuteNonQuery(dbCommand);

        }
        

        #endregion Methods


        #region Procedure


        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO PolicyDoc ( ");
            sb.Append(" PolicyDocID, PolicyID, DocName, DocURL ");
            sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append(" @PolicyDocID, @PolicyID, @DocName, @DocURL ");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PolicyDocID", DbType.String, this.PolicyDocID);
            _db.AddInParameter(dbCommand, "@PolicyID", DbType.String, this.PolicyID);
            _db.AddInParameter(dbCommand, "@DocName", DbType.String, this.DocName);
            _db.AddInParameter(dbCommand, "@DocURL", DbType.String, this.DocURL);

            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE PolicyDoc SET ");
            sb.Append(" PolicyID=@PolicyID, DocName=@PolicyID, DocURL=@PolicyID  ");
            sb.Append(" Where PolicyDocID=@PolicyDocID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PolicyDocID", DbType.String, this.PolicyDocID);
            _db.AddInParameter(dbCommand, "@PolicyID", DbType.String, this.PolicyID);
            _db.AddInParameter(dbCommand, "@DocName", DbType.String, this.DocName);
            _db.AddInParameter(dbCommand, "@DocURL", DbType.String, this.DocURL);

            _db.ExecuteNonQuery(dbCommand);

        }



        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT PolicyDocID, PolicyID, DocName, DocURL ");
            sb.Append(" FROM PolicyDoc ");
            sb.Append("  ");
            sb.Append(" WHERE A.PolicyDocID = @PolicyDocID");
            sb.Append(" ");
            sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PolicyDocID", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.PolicyDocID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyDocID));
                    this.PolicyID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyID));
                    this.DocName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DocName));
                    this.DocURL = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DocURL));
                                        
                }
            }
        }



        #endregion Procedure



    }
}
