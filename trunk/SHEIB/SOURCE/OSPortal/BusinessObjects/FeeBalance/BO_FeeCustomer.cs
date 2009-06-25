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

        //FeeCustomer列表
        public static DataSet GetCustomerFeeList(string sWhere)
        {
            //select a.VoucherID,a.FeeId,b.NoticeNo,c.CustomerID,
            //a.FeeDate,b.PayFeeBase,a.Fee,a.FeeAdjust,d.GatheringType,a.AuditStatus,c.SalesID,
            //(select AuditStatusName from AuditStatus where AuditStatusID=a.AuditStatus) AuditStatusName,
            //(select GatheringTypeName from GatheringType where GatheringTypeID=d.GatheringType) GatheringTypeName,
            //(select CustName from Customer where CustID=c.CustomerID) CustomerName,
            //(select UserNameCn from P_User where UserID=c.SalesID) SalesName
            //from VoucherFee a,PolicyPeriod b,Policy c,Notice d
            //where a.PolPeriodID=b.PolPeriodID
            //  and b.PolicyID=c.PolicyID
            //  and b.NoticeNo*=d.NoticeNo
            //  and a.AccountTypeID in ('1','6')

            string sSql = "";
            sSql = " select a.VoucherID,a.FeeId,b.NoticeNo,c.CustomerID,";
            sSql = sSql + "a.FeeDate,b.PayFeeBase,a.Fee,a.FeeAdjust,d.GatheringType,a.AuditStatus,c.SalesID,";
            sSql = sSql + "(select AuditStatusName from AuditStatus where AuditStatusID=a.AuditStatus) AuditStatusName,";
            sSql = sSql + "(select GatheringTypeName from GatheringType where GatheringTypeID=d.GatheringType) GatheringTypeName,";
            sSql = sSql + "(select CustName from Customer where CustID=c.CustomerID) CustomerName,";
            sSql = sSql + "(select UserNameCn from P_User where UserID=c.SalesID) SalesName";
            sSql = sSql + " from VoucherFee a,PolicyPeriod b,Policy c,Notice d";
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

        // FeeCustomerAdd.aspx 列表
        public static DataSet GetFeeCustomerAdd(string sVoucherID)
        {

            string sSql = "";

            //select a.* from (
            // select a.VoucherID,a.FeeId,b.NoticeNo,c.CustomerID,c.ProdTypeID,b.CarrierID,b.BranchID,c.PolicyID,c.PolicyNo,
            // a.FeeDate,b.PayFeeBase,(select sum(Fee) from fee where PolPeriodID=a.PolPeriodID) PayedFee,
            // a.Fee,a.FeeAdjust,d.GatheringType,a.AuditStatus,c.SalesID,CiPremium,AciPremium,CstPremium,
            // (select AuditStatusName from AuditStatus where AuditStatusID=a.AuditStatus) AuditStatusName,
            // (select GatheringTypeName from GatheringType where GatheringTypeID=d.GatheringType) GatheringTypeName,
            // (select CustName from Customer where CustID=c.CustomerID) CustomerName,
            // (select UserNameCn from P_User where UserID=c.SalesID) SalesName,
            // (select ProdTypeName from ProductType where ProdTypeID=c.ProdTypeID) ProdTypeName,
            // (select CarrierNameCn from Carrier where CarrierID=b.CarrierID) CarrierName,
            // (select BranchName from Branch where BranchID=b.BranchID) BranchName
            //  from fee a,PolicyPeriod b,Policy c,Notice d
            //  where a.PolPeriodID=b.PolPeriodID
            //   and b.PolicyID=c.PolicyID
            //   and b.NoticeNo*=d.NoticeNo
            //   and a.AccountTypeID in ('1','6')
            //) a
            //where 1=1



            sSql = sSql + "select a.* from (";
            sSql = sSql + " select a.VoucherID,a.FeeId,b.NoticeNo,c.CustomerID,c.ProdTypeID,b.CarrierID,b.BranchID,c.PolicyID,c.PolicyNo,";
            sSql = sSql + " a.FeeDate,b.PayFeeBase,(select sum(Fee) from fee where PolPeriodID=a.PolPeriodID) PayedFee,";
            sSql = sSql + " a.Fee,a.FeeAdjust,d.GatheringType,a.AuditStatus,c.SalesID,CiPremium,AciPremium,CstPremium,";
            sSql = sSql + " (select AuditStatusName from AuditStatus where AuditStatusID=a.AuditStatus) AuditStatusName,";
            sSql = sSql + " (select GatheringTypeName from GatheringType where GatheringTypeID=d.GatheringType) GatheringTypeName,";
            sSql = sSql + " (select CustName from Customer where CustID=c.CustomerID) CustomerName,";
            sSql = sSql + " (select UserNameCn from P_User where UserID=c.SalesID) SalesName,";
            sSql = sSql + " (select ProdTypeName from ProductType where ProdTypeID=c.ProdTypeID) ProdTypeName,";
            sSql = sSql + " (select CarrierNameCn from Carrier where CarrierID=b.CarrierID) CarrierName,";
            sSql = sSql + " (select BranchName from Branch where BranchID=b.BranchID) BranchName";
            sSql = sSql + "  from VoucherFee a,PolicyPeriod b,Policy c,Notice d";
            sSql = sSql + "  where a.PolPeriodID=b.PolPeriodID";
            sSql = sSql + "   and b.PolicyID=c.PolicyID";
            sSql = sSql + "   and b.NoticeNo*=d.NoticeNo";
            sSql = sSql + "   and a.AccountTypeID in ('1','6')";
            sSql = sSql + ") a";
            sSql = sSql + " where VoucherID ='" + sVoucherID + "'";


            DbCommand dbCommand = _db.GetSqlStringCommand(sSql);
            return _db.ExecuteDataSet(dbCommand);
        }


        //FeeCustomerAddSelect.aspx 列表
        public static DataSet GetFeeCustomerAddSelectList(string sWhere)
        {

            //select a.*,(PayFeeBase-PayedFee) PayFee from 
            //(
            //select a.NoticeNo,a.PolicyID,b.PolicyNo,b.DeptID,b.CustomerID,b.ProdTypeID,
            //B.GatheringType,PremiumBase,a.PayFeeBase,
            //(select sum(Fee) from fee where PolPeriodID=a.PolPeriodID) PayedFee,
            //CarrierID,BranchID,Period,PayDate,CiPremium,AciPremium,CstPremium,c.NoticeDate,
            //(select CustName from  customer where custID=b.CustomerID) CustName, 
            //(select ProdTypeName from ProductType where ProdTypeID=b.ProdTypeID) ProdTypeName,
            //(select GatheringTypeName from GatheringType where GatheringTypeID=b.GatheringType) GatheringTypeName,
            //(select UserNameCn from P_User where UserID=b.SalesID) SalesName,
            //(select CarrierNameCn from Carrier where CarrierID=a.CarrierID) CarrierName,
            //(select BranchName from Branch where BranchID=a.BranchID) BranckName
            //  from PolicyPeriod a,Policy b,Notice c
            //  where a.PolicyID=b.PolicyID
            //    and a.NoticeNo=c.NoticeNo
            //) a
            // where 1=1

            string sSql = "";
            sSql = sSql + "select a.*,(PayFeeBase-PayedFee) PayFee from ";
            sSql = sSql + "(";
            sSql = sSql + "select a.NoticeNo,a.PolicyID,b.PolicyNo,b.DeptID,b.CustomerID,b.ProdTypeID,";
            sSql = sSql + "B.GatheringType,PremiumBase,a.PayFeeBase,";
            sSql = sSql + "(select sum(Fee) from fee where PolPeriodID=a.PolPeriodID) PayedFee,";
            sSql = sSql + "CarrierID,BranchID,Period,PayDate,CiPremium,AciPremium,CstPremium,c.NoticeDate,";
            sSql = sSql + "(select CustName from  customer where custID=b.CustomerID) CustName, ";
            sSql = sSql + "(select ProdTypeName from ProductType where ProdTypeID=b.ProdTypeID) ProdTypeName,";
            sSql = sSql + "(select GatheringTypeName from GatheringType where GatheringTypeID=b.GatheringType) GatheringTypeName,";
            sSql = sSql + "(select UserNameCn from P_User where UserID=b.SalesID) SalesName,";
            sSql = sSql + "(select CarrierNameCn from Carrier where CarrierID=a.CarrierID) CarrierName,";
            sSql = sSql + "(select BranchName from Branch where BranchID=a.BranchID) BranckName";
            sSql = sSql + "  from PolicyPeriod a,Policy b,Notice c";
            sSql = sSql + "  where a.PolicyID=b.PolicyID";
            sSql = sSql + "    and a.NoticeNo=c.NoticeNo";
            sSql = sSql + ") a";
            sSql = sSql + " where 1=1 ";
            if (sWhere != "")
            {
                sSql = sSql + sWhere;
            }
            DbCommand dbCommand = _db.GetSqlStringCommand(sSql);
            return _db.ExecuteDataSet(dbCommand);
        }

    }
}


