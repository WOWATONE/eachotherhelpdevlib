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
    public class BO_P_UserRole : BaseObject
    {

        public BO_P_UserRole() { }

        
        public enum FieldList
        {
            UserRoleID, 
            RoleID, 
            UserID
        }


        public enum UserRoleFieldList
        {
            UserRoleID,
            RoleID,
            UserID,
            RoleNo, 
            RoleName, 
            Remark
        }


        public static void Add(String roleID, String userID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" DELETE FROM P_UserRole WHERE RoleID=@RoleID AND UserID=@UserID; ");
            sb.Append("INSERT INTO P_UserRole(UserRoleID, RoleID, UserID)");
            sb.Append(" VALUES( ");
            sb.Append("@UserRoleID, @RoleID, @UserID");
            sb.Append(" );");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@UserRoleID", DbType.String, Guid.NewGuid().ToString());
            _db.AddInParameter(dbCommand, "@RoleID", DbType.String, roleID);
            _db.AddInParameter(dbCommand, "@UserID", DbType.String, userID);

            _db.ExecuteNonQuery(dbCommand);
        }

        public static void Delete(String roleID, String userID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" DELETE FROM P_UserRole WHERE RoleID=@RoleID AND UserID=@UserID; ");
            

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@UserRoleID", DbType.String, Guid.NewGuid().ToString());
            _db.AddInParameter(dbCommand, "@RoleID", DbType.String, roleID);
            _db.AddInParameter(dbCommand, "@UserID", DbType.String, userID);

            _db.ExecuteNonQuery(dbCommand);
        }


        public static DataTable UserIncludeRole(String userID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" SELECT A.RoleID, B.RoleName ");
            sb.Append(" FROM P_UserRole A  ");
            sb.Append(" INNER JOIN P_Role B ON A.RoleID = B.RoleID ");
            sb.Append(" WHERE A.UserID = @UserID ");


            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@UserID", DbType.String, userID);

            DataSet ds;
            ds = _db.ExecuteDataSet(dbCommand);

            return ds.Tables[0];
        }


        public static DataTable UserNotIncludeRole(String userID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" SELECT RoleID, RoleName FROM P_Role ");
            sb.Append(" WHERE RoleID NOT IN ( ");
            sb.Append(" SELECT A.RoleID FROM P_UserRole A ");
            sb.Append(" INNER JOIN P_Role B ON A.RoleID = B.RoleID ");
            sb.Append(" WHERE A.UserID = @UserID ");
            sb.Append(" ) ");


            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@UserID", DbType.String, userID);

            DataSet ds;
            ds = _db.ExecuteDataSet(dbCommand);

            return ds.Tables[0];
        }


        public static List<BO_P_Role> FetchListByUserId(String userID)
        {
            List<BO_P_Role> list = new List<BO_P_Role>();

            StringBuilder sb = new StringBuilder();
            sb.Append(" SELECT A.UserRoleID, A.RoleID, A.UserID, B.RoleNo, B.RoleName, B.Remark ");
            sb.Append(" FROM  P_UserRole A ");
            sb.Append(" INNER JOIN P_Role B ON A.RoleID = B.RoleID ");
            sb.Append(" WHERE A.UserID = @UserID");
            sb.Append(";");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@UserID", DbType.String, userID);

            BO_P_Role newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                Int32 loop = 0;
                while (reader.Read())
                {
                    newObj = new BO_P_Role();

                    newObj.RoleID = Utility.GetStringFromReader(reader, Convert.ToInt32(UserRoleFieldList.RoleID));
                    newObj.RoleNo = Utility.GetStringFromReader(reader, Convert.ToInt32(UserRoleFieldList.RoleNo));
                    newObj.RoleName = Utility.GetStringFromReader(reader, Convert.ToInt32(UserRoleFieldList.RoleName));
                    newObj.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(UserRoleFieldList.Remark));

                    list.Add(newObj);
                    loop += 1;
                }
            }

            return list;
        }

    }
}
