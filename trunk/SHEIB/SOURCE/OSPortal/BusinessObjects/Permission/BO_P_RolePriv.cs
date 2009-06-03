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
    public class BO_P_RolePriv : BaseObject
    {

        public BO_P_RolePriv() { }

        
        public enum FieldList
        {
            RolePrivID, 
            RoleID,  
            PrivID
        }


        public static void Add(String roleID, String privID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" DELETE FROM P_RolePriv WHERE RoleID=@RoleID AND PrivID=@PrivID; ");
            sb.Append("INSERT INTO P_RolePriv(RolePrivID,RoleID, PrivID)");
            sb.Append(" VALUES( ");
            sb.Append("@RolePrivID, @RoleID, @PrivID");
            sb.Append(" );");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@RolePrivID", DbType.String, Guid.NewGuid().ToString());
            _db.AddInParameter(dbCommand, "@RoleID", DbType.String, roleID);
            _db.AddInParameter(dbCommand, "@PrivID", DbType.String, privID);

            _db.ExecuteNonQuery(dbCommand);
        }

        public static void Delete(String roleID, String privID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" DELETE FROM P_RolePriv WHERE RoleID=@RoleID AND PrivID=@PrivID; ");
            

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@RoleID", DbType.String, roleID);
            _db.AddInParameter(dbCommand, "@PrivID", DbType.String, privID);

            _db.ExecuteNonQuery(dbCommand);
        }


    }
}
