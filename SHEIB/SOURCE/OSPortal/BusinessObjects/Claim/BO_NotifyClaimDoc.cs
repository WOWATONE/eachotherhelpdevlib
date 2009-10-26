using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Runtime.Serialization;

namespace BusinessObjects
{
    [Serializable()]
    public class BO_NotifyClaimDoc : BaseObject
    {

        public BO_NotifyClaimDoc() { }


        public BO_NotifyClaimDoc(Int32 id)
        {
            fetchByID(id);
        }


        #region Variables

        public enum FieldList
        {
            NotifyClaimDocID,
            NotifyID, 
            DocName, 
            DocURL
        }

        #endregion Variables


        #region Property


        public Int32 NotifyClaimDocID
        {
            get;
            set;
        }

        public String NotifyID
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



        public static List<BO_NotifyClaimDoc> FetchListByNotifyID(string notifyID)
        {
            List<BO_NotifyClaimDoc> list = new List<BO_NotifyClaimDoc>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT  NotifyClaimDocID, NotifyID, DocName, DocURL ");
            sb.Append(" FROM NotifyClaimDoc ");
            sb.Append(" WHERE NotifyID = @NotifyID");
            sb.Append(" ");
            sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@NotifyID", DbType.String, notifyID);

            BO_NotifyClaimDoc newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_NotifyClaimDoc();

                    newObj.NotifyClaimDocID = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.NotifyClaimDocID));
                    newObj.NotifyID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.NotifyID));
                    newObj.DocName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DocName));
                    newObj.DocURL = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DocURL));
                                        
                    list.Add(newObj);
                }
            }

            return list;
        }


        
        public static void Delete(Int32 id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM NotifyClaimDoc ");
            sb.Append(" WHERE NotifyClaimDocID = @NotifyClaimDocID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@NotifyClaimDocID", DbType.Int32, id);

            _db.ExecuteNonQuery(dbCommand);

        }

        public static void Delete(String notifyID, String docName)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM NotifyClaimDoc ");
            sb.Append(" WHERE NotifyID = @NotifyID ");
            sb.Append(" AND DocName = @DocName ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@NotifyID", DbType.String, notifyID);
            _db.AddInParameter(dbCommand, "@DocName", DbType.String, docName);
            _db.ExecuteNonQuery(dbCommand);

        }

        public static void DeleteByNotifyID(String notifyID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM NotifyClaimDoc ");
            sb.Append(" WHERE NotifyID = @NotifyID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@NotifyID", DbType.String, notifyID);

            _db.ExecuteNonQuery(dbCommand);

        }

        #endregion Methods


        #region Procedure


        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO NotifyClaimDoc ( ");
            sb.Append(" NotifyID, DocName, DocURL ");
            sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append(" @NotifyID, @DocName, @DocURL ");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@NotifyID", DbType.String, this.NotifyID);
            _db.AddInParameter(dbCommand, "@DocName", DbType.String, this.DocName);
            _db.AddInParameter(dbCommand, "@DocURL", DbType.String, this.DocURL);

            //ExecuteScalar return the value of first column in first row.
            
            Int32 theNewID;
            theNewID = Convert.ToInt32(_db.ExecuteScalar(dbCommand));

            fetchByID(theNewID);
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE NotifyClaimDoc SET ");
            sb.Append(" NotifyID=@NotifyID, DocName=@DocName, DocURL=@DocURL  ");
            sb.Append(" Where NotifyClaimDocID=@NotifyClaimDocID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@NotifyClaimDocID", DbType.Int32, this.NotifyClaimDocID);
            _db.AddInParameter(dbCommand, "@NotifyID", DbType.String, this.NotifyID);
            _db.AddInParameter(dbCommand, "@DocName", DbType.String, this.DocName);
            _db.AddInParameter(dbCommand, "@DocURL", DbType.String, this.DocURL);

            _db.ExecuteNonQuery(dbCommand);

        }



        private void fetchByID(Int32 id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT NotifyClaimDocID, NotifyID, DocName, DocURL ");
            sb.Append(" FROM NotifyClaimDoc ");
            sb.Append("  ");
            sb.Append(" WHERE NotifyID = @NotifyID");
            sb.Append(" ");
            sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@NotifyID", DbType.Int32, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.NotifyClaimDocID  = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.NotifyClaimDocID ));
                    this.NotifyID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.NotifyID));
                    this.DocName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DocName));
                    this.DocURL = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DocURL));
                                        
                }
            }
        }



        #endregion Procedure



    }
}
