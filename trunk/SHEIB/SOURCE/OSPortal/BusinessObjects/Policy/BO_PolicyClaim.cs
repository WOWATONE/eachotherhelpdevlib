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
    public class BO_PolicyClaim : BaseObject
    {

        public BO_PolicyClaim() { }


        #region Variables

        public enum FieldList
        {
            DeptID,
            DeptName,
            ShortName,
            Manager,
            ParentID,
            Tel,
            Fax
        }

        #endregion Variables


        #region Property
        #endregion Property


        #region Methods

        public static void DeleteByPolicyId(String policyId)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM PolicyClaim ");
            sb.Append(" WHERE PolicyId = @PolicyId ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyId", DbType.String, policyId);

            _db.ExecuteNonQuery(dbCommand);

        }

        #endregion Methods

    }
}
