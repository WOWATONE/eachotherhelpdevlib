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
    public class BO_P_Role : BaseObject
    {
        public BO_P_Role() { }

        public BO_P_Role(String id)
        {
            fetchByID(id);
        }

        public enum FieldList
        {
            RoleID, 
            RoleNo, 
            RoleName, 
            Remark
        }


        #region Property

        public string RoleID
        {
            get;
            set;
        }

        public string RoleNo
        {
            get;
            set;
        }

        public string RoleName
        {
            get;
            set;
        }

        public string Remark
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


        public static List<BO_P_Role> FetchList()
        {
            List<BO_P_Role> list = new List<BO_P_Role>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT RoleID, RoleNo, RoleName, Remark");
            sb.Append(" FROM P_Role;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_P_Role newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                Int32 loop = 0;
                while (reader.Read())
                {
                    newObj = new BO_P_Role();

                    newObj.RoleID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.RoleID));
                    newObj.RoleNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.RoleNo));
                    newObj.RoleName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.RoleName));
                    newObj.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                    
                    list.Add(newObj);
                    loop += 1;
                }
            }

            return list;
        }

        public static Int32 FetchListCount()
        {
            List<BO_P_Role> list = new List<BO_P_Role>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT COUNT(RoleID) AS TotalCount ");
            sb.Append(" FROM P_Role;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
                        
            Int32 count;
            count = Convert.ToInt32(_db.ExecuteScalar(dbCommand));
            return count;
        }
                                
        public static void Delete(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM P_Role ");
            sb.Append(" WHERE RoleID = @RoleID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@RoleID", DbType.String, id);

            _db.ExecuteNonQuery(dbCommand);

        }


        #endregion Methods



        #region Procedure

        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT RoleID, RoleNo, RoleName, Remark ");
            sb.Append(" FROM P_Role ");
            sb.Append(" WHERE RoleName = @RoleName ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@RoleName", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.RoleID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.RoleID));
                    this.RoleNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.RoleNo));
                    this.RoleName  = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.RoleName));
                    this.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                }
            }
        }


        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO P_Role(RoleID, RoleNo, RoleName, Remark)");
            sb.Append(" VALUES( ");
            sb.Append("@RoleID, @RoleNo, @RoleName, @Remark");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@RoleID", DbType.String, this.RoleID);
            _db.AddInParameter(dbCommand, "@RoleNo", DbType.String, this.RoleNo);
            _db.AddInParameter(dbCommand, "@RoleName", DbType.String, this.RoleName);
            _db.AddInParameter(dbCommand, "@Remark", DbType.String, this.Remark);
            
            _db.ExecuteNonQuery(dbCommand);
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE P_Role SET RoleNo=@RoleNo, ");
            sb.Append(" RoleName=@RoleName, Remark=@Remark ");
            sb.Append(" Where RoleID=@RoleID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@RoleID", DbType.String, this.RoleID);
            _db.AddInParameter(dbCommand, "@RoleNo", DbType.String, this.RoleNo);
            _db.AddInParameter(dbCommand, "@RoleName", DbType.String, this.RoleName);
            _db.AddInParameter(dbCommand, "@Remark", DbType.String, this.Remark);
            

            _db.ExecuteNonQuery(dbCommand);

        }


        #endregion Procedure





    }
}
