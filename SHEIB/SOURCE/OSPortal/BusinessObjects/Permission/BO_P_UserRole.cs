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

    }
}
