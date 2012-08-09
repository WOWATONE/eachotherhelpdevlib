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
    public class BO_CustomerDoc : BaseObject
    {
        public BO_CustomerDoc() { }

        public BO_CustomerDoc(String id)
        {
            fetchByID(id);
        }

        #region Variables
        public enum FieldList
        {
            CustDocID,
            CustID,
            CustDocName,
            CustURL
        }
        #endregion Variables

        #region Property
        public String CustDocID
        {
            get;
            set;
        }

        public String CustID
        {
            get;
            set;
        }

        public String CustDocName
        {
            get;
            set;
        }

        public String CustURL
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

        public static List<BO_CustomerDoc> FetchListByCustomer(String custID)
        {
            List<BO_CustomerDoc> list = new List<BO_CustomerDoc>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT CustDocID, CustID, CustDocName, " + "'/sheib'" + " + CustURL ");
            sb.Append(" FROM CustomerDoc (nolock) ");
            sb.Append(" WHERE CustID = @CustID");
            sb.Append(" ");
            sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, custID);

            BO_CustomerDoc newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_CustomerDoc();

                    newObj.CustDocID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustDocID));
                    newObj.CustID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustID));
                    newObj.CustDocName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustDocName));
                    newObj.CustURL = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustURL));

                    list.Add(newObj);
                }
            }

            return list;
        }

        public static void Delete(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM CustomerDoc ");
            sb.Append(" WHERE CustDocID = @CustDocID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustDocID", DbType.String, id);

            _db.ExecuteNonQuery(dbCommand);
        }

        public static void Delete(String custID, String custDocName)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM CustomerDoc ");
            sb.Append(" WHERE CustID = @CustID ");
            sb.Append(" AND CustDocName = @CustDocName ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustID", DbType.String, custID);
            _db.AddInParameter(dbCommand, "@CustDocName", DbType.String, custDocName);
            _db.ExecuteNonQuery(dbCommand);
        }

        public static void DeleteByCustID(String custID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM CustomerDoc ");
            sb.Append(" WHERE CustID = @CustID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustID", DbType.String, custID);

            _db.ExecuteNonQuery(dbCommand);
        }
        #endregion Methods

        #region Procedure
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO CustomerDoc ( ");
            sb.Append(" CustDocID, CustID, CustDocName, CustURL ");
            sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append(" @CustDocID, @CustID, @CustDocName, @CustURL ");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CustDocID", DbType.String, this.CustDocID);
            _db.AddInParameter(dbCommand, "@CustID", DbType.String, this.CustID);
            _db.AddInParameter(dbCommand, "@CustDocName", DbType.String, this.CustDocName);
            _db.AddInParameter(dbCommand, "@CustURL", DbType.String, this.CustURL);

            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);
        }

        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE CustomerDoc SET ");
            sb.Append(" CustID=@CustID, CustDocName=@CustDocName, CustURL=@CustURL  ");
            sb.Append(" Where CustDocID=@CustDocID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CustDocID", DbType.String, this.CustDocID);
            _db.AddInParameter(dbCommand, "@CustID", DbType.String, this.CustID);
            _db.AddInParameter(dbCommand, "@CustDocName", DbType.String, this.CustDocName);
            _db.AddInParameter(dbCommand, "@CustURL", DbType.String, this.CustURL);

            _db.ExecuteNonQuery(dbCommand);

        }

        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT CustDocID, CustID, CustDocName, CustURL ");
            sb.Append(" FROM CustomerDoc (nolock) ");
            sb.Append("  ");
            sb.Append(" WHERE A.CustDocID = @CustDocID");
            sb.Append(" ");
            sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CustDocID", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.CustDocID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustDocID));
                    this.CustID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustID));
                    this.CustDocName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustDocName));
                    this.CustURL = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustURL));

                }
            }
        }



        #endregion Procedure
    }
}
