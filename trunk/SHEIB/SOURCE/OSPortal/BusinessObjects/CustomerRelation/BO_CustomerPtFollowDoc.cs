using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Runtime.Serialization;

namespace BusinessObjects.CustomerRelation
{
    [Serializable()]
    public class BO_CustomerPtFollowDoc : BaseObject
    {
        public BO_CustomerPtFollowDoc() { }

        public BO_CustomerPtFollowDoc(String id)
        {
            fetchByID(id);
        }

        #region Variables
        public enum FieldList
        {
            CustomerPtFollowDocID,
            FollowID,
            FollowDocName,
            FollowDocUrl
        }
        #endregion Variables

        #region Property
        public String CustomerPtFollowDocID
        {
            get;
            set;
        }

        public String FollowID
        {
            get;
            set;
        }

        public String FollowDocName
        {
            get;
            set;
        }

        public String FollowDocUrl
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

        public static List<BO_CustomerPtFollowDoc> FetchListByFollowID(String followID)
        {
            List<BO_CustomerPtFollowDoc> list = new List<BO_CustomerPtFollowDoc>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT CustomerPtFollowDocID, FollowID, FollowDocName, FollowDocUrl,(Select CustID from CustomerPtFollow Where FollowID=a.FollowID) CustID");
            sb.Append(" FROM CustomerPtFollowDoc a ");
            sb.Append(" WHERE FollowID = @FollowID");
            sb.Append(" ");
            sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@FollowID", DbType.AnsiString, followID);

            BO_CustomerPtFollowDoc newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_CustomerPtFollowDoc();

                    newObj.CustomerPtFollowDocID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustomerPtFollowDocID));
                    newObj.FollowID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.FollowID));
                    newObj.FollowDocName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.FollowDocName));
                    newObj.FollowDocUrl = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.FollowDocUrl));

                    list.Add(newObj);
                }
            }

            return list;
        }

        public static void Delete(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM CustomerPtFollowDoc ");
            sb.Append(" WHERE CustomerPtFollowDocID = @CustomerPtFollowDocID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustomerPtFollowDocID", DbType.String, id);

            _db.ExecuteNonQuery(dbCommand);
        }

        public static void Delete(String followID, String followDocName)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM CustomerPtFollowDoc ");
            sb.Append(" WHERE FollowID = @FollowID ");
            sb.Append(" AND FollowDocName = @FollowDocName ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@FollowID", DbType.String, followID);
            _db.AddInParameter(dbCommand, "@FollowDocName", DbType.String, followDocName);
            _db.ExecuteNonQuery(dbCommand);
        }

        public static void DeleteByFollowID(String followID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM CustomerPtFollowDoc ");
            sb.Append(" WHERE FollowID = @FollowID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@FollowID", DbType.String, followID);

            _db.ExecuteNonQuery(dbCommand);
        }
        #endregion Methods

        #region Procedure
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO CustomerPtFollowDoc ( ");
            sb.Append(" CustomerPtFollowDocID, FollowID, FollowDocName, FollowDocUrl ");
            sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append(" @CustomerPtFollowDocID, @FollowID, @FollowDocName, @FollowDocUrl ");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CustomerPtFollowDocID", DbType.String, this.CustomerPtFollowDocID);
            _db.AddInParameter(dbCommand, "@FollowID", DbType.String, this.FollowID);
            _db.AddInParameter(dbCommand, "@FollowDocName", DbType.String, this.FollowDocName);
            _db.AddInParameter(dbCommand, "@FollowDocUrl", DbType.String, this.FollowDocUrl);

            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);
        }

        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE CustomerPtFollowDoc SET ");
            sb.Append(" FollowID=@FollowID, FollowDocName=@FollowDocName, FollowDocUrl=@FollowDocUrl  ");
            sb.Append(" Where CustomerPtFollowDocID=@CustomerPtFollowDocID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CustomerPtFollowDocID", DbType.String, this.CustomerPtFollowDocID);
            _db.AddInParameter(dbCommand, "@FollowID", DbType.String, this.FollowID);
            _db.AddInParameter(dbCommand, "@FollowDocName", DbType.String, this.FollowDocName);
            _db.AddInParameter(dbCommand, "@FollowDocUrl", DbType.String, this.FollowDocUrl);

            _db.ExecuteNonQuery(dbCommand);

        }

        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT CustomerPtFollowDocID, FollowID, FollowDocName, FollowDocUrl ");
            sb.Append(" FROM CustomerPtFollowDoc (nolock) ");
            sb.Append("  ");
            sb.Append(" WHERE A.CustomerPtFollowDocID = @CustomerPtFollowDocID");
            sb.Append(" ");
            sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CustomerPtFollowDocID", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.CustomerPtFollowDocID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustomerPtFollowDocID));
                    this.FollowID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.FollowID));
                    this.FollowDocName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.FollowDocName));
                    this.FollowDocUrl = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.FollowDocUrl));

                }
            }
        }



        #endregion Procedure
    }
}
