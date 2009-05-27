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
    public class BO_P_Priv : BaseObject
    {

        public BO_P_Priv() { }

        public BO_P_Priv(String id)
        {
            //fetchByID(id);
        }

        public enum FieldList
        {
            PrivID, 
            PrivName, 
            MenuID, 
            PrivType
        }


        #region Property

        public string PrivID
        {
            get;
            set;
        }

        public string PrivName
        {
            get;
            set;
        }

        public string MenuID
        {
            get;
            set;
        }

        public string PrivType
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

        public static List<BO_P_Priv> FetchList()
        {
            List<BO_P_Priv> list = new List<BO_P_Priv>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT PrivID, PrivName, MenuID, PrivType");
            sb.Append(" FROM P_Priv;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_P_Priv newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_P_Priv();

                    newObj.PrivID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PrivID));
                    newObj.PrivName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PrivName));
                    newObj.MenuID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.MenuID));
                    newObj.PrivType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PrivType));

                    list.Add(newObj);
                }
            }

            return list;
        }


        public static void Delete(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM P_Priv ");
            sb.Append(" WHERE PrivID = @PrivID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PrivID", DbType.String, id);

            _db.ExecuteNonQuery(dbCommand);

        }


        #endregion Methods




        #region Procedure

        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT  PrivID, PrivName, MenuID, PrivType ");
            sb.Append(" FROM P_Priv;");
            sb.Append(" WHERE PrivID = @PrivID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PrivID", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.PrivID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PrivID));
                    this.PrivName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PrivName));
                    this.MenuID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.MenuID));
                    this.PrivType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PrivType));
                }
            }
        }


        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO P_Priv(PrivID, PrivName, MenuID, PrivType)");
            sb.Append(" VALUES( ");
            sb.Append("@PrivID, @PrivName, @MenuID, @PrivType");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PrivID", DbType.String, this.PrivID);
            _db.AddInParameter(dbCommand, "@PrivName", DbType.String, this.PrivName);
            _db.AddInParameter(dbCommand, "@MenuID", DbType.String, this.MenuID);
            _db.AddInParameter(dbCommand, "@PrivType", DbType.String, this.PrivType);

            _db.ExecuteNonQuery(dbCommand);
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE P_Priv SET ");
            sb.Append(" PrivName=@PrivName, MenuID=@MenuID, PrivType=@PrivType ");
            sb.Append(" Where PrivID=@PrivID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PrivID", DbType.String, this.PrivID);
            _db.AddInParameter(dbCommand, "@PrivName", DbType.String, this.PrivName);
            _db.AddInParameter(dbCommand, "@MenuID", DbType.String, this.MenuID);
            _db.AddInParameter(dbCommand, "@PrivType", DbType.String, this.PrivType);


            _db.ExecuteNonQuery(dbCommand);

        }


        #endregion Procedure





    }
}
