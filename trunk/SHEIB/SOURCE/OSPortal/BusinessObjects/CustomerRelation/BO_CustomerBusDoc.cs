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
    public class BO_CustomerBusDoc : BaseObject
    {
        public BO_CustomerBusDoc() { }

        public BO_CustomerBusDoc(String id)
        {
            fetchByID(id);
        }

        #region Variables
        public enum FieldList
        {
            CustBusDocID,
            CustID,
            CustBusDocName,
            CustBusDocURL
        }
        #endregion Variables

        #region Property
        public String CustBusDocID
        {
            get;
            set;
        }

        public String CustID
        {
            get;
            set;
        }

        public String CustBusDocName
        {
            get;
            set;
        }

        public String CustBusDocURL
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

        public static List<BO_CustomerBusDoc> FetchListByCustomer(String custID)
        {
            List<BO_CustomerBusDoc> list = new List<BO_CustomerBusDoc>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT CustBusDocID, CustID, CustBusDocName, CustBusDocURL ");
            sb.Append(" FROM CustomerBusDoc (nolock) ");
            sb.Append(" WHERE CustID = @CustID");
            sb.Append(" ");
            sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, custID);

            BO_CustomerBusDoc newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_CustomerBusDoc();

                    newObj.CustBusDocID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustBusDocID));
                    newObj.CustID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustID));
                    newObj.CustBusDocName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustBusDocName));
                    newObj.CustBusDocURL = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustBusDocURL));

                    list.Add(newObj);
                }
            }

            return list;
        }

        public static void Delete(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM CustomerBusDoc ");
            sb.Append(" WHERE CustBusDocID = @CustBusDocID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustBusDocID", DbType.String, id);

            _db.ExecuteNonQuery(dbCommand);
        }

        public static void Delete(String custID, String custBusDocName)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM CustomerBusDoc ");
            sb.Append(" WHERE CustID = @CustID ");
            sb.Append(" AND CustBusDocName = @CustBusDocName ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustID", DbType.String, custID);
            _db.AddInParameter(dbCommand, "@CustBusDocName", DbType.String, custBusDocName);
            _db.ExecuteNonQuery(dbCommand);
        }

        public static void DeleteByCustID(String custID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM CustomerBusDoc ");
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
            sb.Append("INSERT INTO CustomerBusDoc ( ");
            sb.Append(" CustBusDocID, CustID, CustBusDocName, CustBusDocURL ");
            sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append(" @CustBusDocID, @CustID, @CustBusDocName, @CustBusDocURL ");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CustBusDocID", DbType.String, this.CustBusDocID);
            _db.AddInParameter(dbCommand, "@CustID", DbType.String, this.CustID);
            _db.AddInParameter(dbCommand, "@CustBusDocName", DbType.String, this.CustBusDocName);
            _db.AddInParameter(dbCommand, "@CustBusDocURL", DbType.String, this.CustBusDocURL);

            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);
        }

        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE CustomerBusDoc SET ");
            sb.Append(" CustID=@CustID, CustBusDocName=@CustBusDocName, CustBusDocURL=@CustBusDocURL  ");
            sb.Append(" Where CustBusDocID=@CustBusDocID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CustBusDocID", DbType.String, this.CustBusDocID);
            _db.AddInParameter(dbCommand, "@CustID", DbType.String, this.CustID);
            _db.AddInParameter(dbCommand, "@CustBusDocName", DbType.String, this.CustBusDocName);
            _db.AddInParameter(dbCommand, "@CustBusDocURL", DbType.String, this.CustBusDocURL);

            _db.ExecuteNonQuery(dbCommand);

        }

        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT CustBusDocID, CustID, CustBusDocName, CustBusDocURL ");
            sb.Append(" FROM CustomerBusDoc (nolock) ");
            sb.Append("  ");
            sb.Append(" WHERE A.CustBusDocID = @CustBusDocID");
            sb.Append(" ");
            sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CustBusDocID", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.CustBusDocID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustBusDocID));
                    this.CustID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustID));
                    this.CustBusDocName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustBusDocName));
                    this.CustBusDocURL = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustBusDocURL));

                }
            }
        }



        #endregion Procedure
    }
}
