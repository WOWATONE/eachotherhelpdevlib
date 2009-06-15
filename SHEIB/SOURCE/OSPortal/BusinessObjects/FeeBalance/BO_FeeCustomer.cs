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
    public class BO_FeeCustomer : BO_Fee
    {

        public BO_FeeCustomer() { }


        public static DataSet GetCustomerFeeList(string sWhere)
        {
            //select a.VoucherID,a.FeeId,b.NoticeNo,c.CustomerID,
            //a.FeeDate,b.PayFeeBase,a.Fee,a.FeeAdjust,d.GatheringType,a.AuditStatus,c.SalesID,
            //(select AuditStautsName from AuditStauts where AuditStautsID=a.AuditStatus) AuditStautsName,
            //(select GatheringTypeName from GatheringType where GatheringTypeID=d.GatheringType) GatheringTypeName,
            //(select CustName from Customer where CustID=c.CustomerID) CustomerName,
            //(select UserNameCn from P_User where UserID=c.SalesID) SalesName
            //from fee a,PolicyPeriod b,Policy c,Notice d
            //where a.PolPeriodID=b.PolPeriodID
            //  and b.PolicyID=c.PolicyID
            //  and b.NoticeNo*=d.NoticeNo
            //  and a.AccountTypeID in ('1','6')

            string sSql = "";
            sSql = " select a.VoucherID,a.FeeId,b.NoticeNo,c.CustomerID,";
            sSql = sSql + "a.FeeDate,b.PayFeeBase,a.Fee,a.FeeAdjust,d.GatheringType,a.AuditStatus,c.SalesID,";
            sSql = sSql + "(select AuditStautsName from AuditStauts where AuditStautsID=a.AuditStatus) AuditStautsName,";
            sSql = sSql + "(select GatheringTypeName from GatheringType where GatheringTypeID=d.GatheringType) GatheringTypeName,";
            sSql = sSql + "(select CustName from Customer where CustID=c.CustomerID) CustomerName,";
            sSql = sSql + "(select UserNameCn from P_User where UserID=c.SalesID) SalesName";
            sSql = sSql + " from fee a,PolicyPeriod b,Policy c,Notice d";
            sSql = sSql + " where a.PolPeriodID=b.PolPeriodID";
            sSql = sSql + "  and b.PolicyID=c.PolicyID";
            sSql = sSql + "  and b.NoticeNo*=d.NoticeNo";
            sSql = sSql + "  and a.AccountTypeID in ('1','6')";
            if (sWhere != "")
            {
                sSql = sSql + sWhere;
            }
            DbCommand dbCommand = _db.GetSqlStringCommand(sSql);
            return _db.ExecuteDataSet(dbCommand);
        }

    }
}
