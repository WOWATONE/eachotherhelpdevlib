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
    public class BO_CarPolicyDoc : BaseObject
    {

        public BO_CarPolicyDoc() { }


        public BO_CarPolicyDoc(String id)
        {
            fetchByID(id);
        }


        #region Variables

        public enum FieldList
        {
            CarPolicyDocID,
            AskPriceID, 
            DocName, 
            DocURL
        }

        #endregion Variables


        #region Property


        public String CarPolicyDocID
        {
            get;
            set;
        }

        public String AskPriceID
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



        public static List<BO_CarPolicyDoc> FetchListByCarPolicy(String carPolicyID)
        {
            List<BO_CarPolicyDoc> list = new List<BO_CarPolicyDoc>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT CarPolicyDocID, AskPriceID, DocName, DocURL ");
            sb.Append(" FROM CarPolicyDoc ");
            sb.Append(" WHERE CarPolicyDocID = @CarPolicyDocID");
            sb.Append(" ");
            sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CarPolicyDocID", DbType.String, carPolicyID);

            BO_CarPolicyDoc newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_CarPolicyDoc();

                    newObj.CarPolicyDocID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarPolicyDocID));
                    newObj.AskPriceID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AskPriceID));
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
            sb.Append("DELETE FROM CarPolicyDoc ");
            sb.Append(" WHERE CarPolicyDocID = @CarPolicyDocID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CarPolicyDocID", DbType.String, id);

            _db.ExecuteNonQuery(dbCommand);

        }

        public static void Delete(String askPriceID, String docName)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM CarPolicyDoc ");
            sb.Append(" WHERE AskPriceID = @AskPriceID ");
            sb.Append(" AND DocName = @DocName ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@AskPriceID", DbType.String, askPriceID);
            _db.AddInParameter(dbCommand, "@DocName", DbType.String, docName);
            _db.ExecuteNonQuery(dbCommand);

        }
        

        #endregion Methods


        #region Procedure


        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO CarPolicyDoc ( ");
            sb.Append(" CarPolicyDocID, AskPriceID, DocName, DocURL ");
            sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append(" @CarPolicyDocID, @AskPriceID, @DocName, @DocURL ");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CarPolicyDocID", DbType.String, this.CarPolicyDocID);
            _db.AddInParameter(dbCommand, "@AskPriceID", DbType.String, this.AskPriceID);
            _db.AddInParameter(dbCommand, "@DocName", DbType.String, this.DocName);
            _db.AddInParameter(dbCommand, "@DocURL", DbType.String, this.DocURL);

            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE CarPolicyDoc SET ");
            sb.Append(" AskPriceID=@AskPriceID, DocName=@DocName, DocURL=@DocURL  ");
            sb.Append(" Where CarPolicyDocID=@CarPolicyDocID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CarPolicyDocID", DbType.String, this.CarPolicyDocID);
            _db.AddInParameter(dbCommand, "@AskPriceID", DbType.String, this.AskPriceID);
            _db.AddInParameter(dbCommand, "@DocName", DbType.String, this.DocName);
            _db.AddInParameter(dbCommand, "@DocURL", DbType.String, this.DocURL);

            _db.ExecuteNonQuery(dbCommand);

        }



        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT CarPolicyDocID, AskPriceID, DocName, DocURL ");
            sb.Append(" FROM CarPolicyDoc ");
            sb.Append("  ");
            sb.Append(" WHERE A.AskPriceID = @AskPriceID");
            sb.Append(" ");
            sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@AskPriceID", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.CarPolicyDocID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarPolicyDocID));
                    this.AskPriceID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AskPriceID));
                    this.DocName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DocName));
                    this.DocURL = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DocURL));
                                        
                }
            }
        }



        #endregion Procedure




    }
}
