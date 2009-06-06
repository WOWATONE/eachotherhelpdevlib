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
    public class BO_Policy : BaseObject
    {

        public BO_Policy() { }


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

        public static DataTable FetchPolicyCarrierList(String policyStatus)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" SELECT NewID() AS KeyGUID, A.Premium, A.Process, A.PremiumBase, A.ProcessBase, ");
            sb.Append(" B.PolicyID, B.PolicyNo, ");
            sb.Append(" B.SalesId, C.UserID, C.UserNameCn, ");
            sb.Append(" B.Coverage, B.CreatePerson, ");
            sb.Append(" B.Currency, H.CurrencyName, ");
            sb.Append(" B.SourceTypeID,I.SourceTypeName, ");
            sb.Append(" B.GatheringType,J.GatheringTypeName, ");
            sb.Append(" B.FlagReinsure,");
            sb.Append(" CASE WHEN B.FlagReinsure=1 THEN '再保' ELSE '新增' END AS FlagReinsureName,");
            sb.Append(" B.StartDate,B.EndDate,");
            sb.Append(" A.CarrierID, D.CarrierNameCn,  ");
            sb.Append(" A.BranchID, E.BranchName, ");
            sb.Append(" B.ProdTypeID, F.ProdTypeName, ");
            sb.Append(" B.CustomerID, G.CustName, ");
            sb.Append(" B.CreatePerson,B.CreateTime, ");
            sb.Append(" B.AuditPerson,B.AuditTime, ");
            sb.Append(" B.ModifyPerson,B.ModifyTime, ");
            sb.Append(" B.Remark ");
            
            sb.Append(" FROM PolicyCarrier A ");
            sb.Append(" INNER JOIN Policy B ON A.PolicyID = B.PolicyID ");
            sb.Append(" LEFT JOIN P_User C ON B.SalesId = C.UserID ");
            sb.Append(" INNER JOIN Carrier D ON A.CarrierID = D.CarrierID ");
            sb.Append(" INNER JOIN Branch E ON A.CarrierID = E.CarrierID AND A.BranchID = E.BranchID ");
            sb.Append(" INNER JOIN ProductType F ON B.ProdTypeID = F.ProdTypeID ");
            sb.Append(" INNER JOIN Customer G ON B.CustomerID = G.CustID ");
            sb.Append(" LEFT JOIN Curency H ON H.CurID = B.Currency ");
            sb.Append(" LEFT JOIN SourceType I ON I.SourceTypeID = B.SourceTypeID ");
            sb.Append(" LEFT JOIN GatheringType J ON J.GatheringTypeID = B.GatheringType ");
            sb.Append(" WHERE B.PolicyStatus = @PolicyStatus ");
            //sb.Append("  ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyStatus", DbType.String, policyStatus);

            DataSet ds = _db.ExecuteDataSet(dbCommand);
            return ds.Tables[0];
        }

        #endregion Methods

    }
}
