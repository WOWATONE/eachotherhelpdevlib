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
    public class Bo_FeePayinInvoice : BO_Fee
    {

        //FeePayinInvoice列表
        public static DataSet GetFeePayinInvoiceList(string sWhere)
        {
            //select a.* from (
            //select a.VoucherID,a.FeeId,c.CustomerID,c.ProdTypeID,b.CarrierID,b.BranchID,c.PolicyID,c.PolicyNo,b.NoticeNo,
            //a.FeeDate,b.PayProcBase,CarrierSales,
            //(select sum(Fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('7')) PayedFee,
            //a.Fee,a.FeeAdjust,a.InvoiceNO,a.AuditStatus,c.SalesID,a.ProcessFeeType,
            //(select AuditStatusName from AuditStatus where AuditStatusID=a.AuditStatus) AuditStatusName,
            //(select GatheringTypeName from GatheringType where GatheringTypeID=a.GatheringType) GatheringTypeName,
            //(select CustName from Customer where CustID=c.CustomerID) CustomerName,
            //(select UserNameCn from P_User where UserID=c.SalesID) SalesName,
            //(select ProdTypeName from ProductType where ProdTypeID=c.ProdTypeID) ProdTypeName,
            //(select CarrierNameCn from Carrier where CarrierID=b.CarrierID) CarrierName,
            //(select BranchName from Branch where BranchID=b.BranchID) BranchName,
            // (select ProcessFeeTypeName from ProcessFeeType where ProcessFeeTypeID=a.ProcessFeeType) ProcessFeeTypeName
            // from VoucherFee a,PolicyPeriod b,Policy c
            // where a.PolPeriodID=b.PolPeriodID
            //  and a.VoucherId=a.VoucherId
            //  and b.PolicyID=c.PolicyID
            //  and a.AccountTypeID in ('5')
            // ) a


            string sSql = "";
            sSql = sSql + " select a.* from (";
            sSql = sSql + "select a.VoucherID,a.FeeId,c.CustomerID,c.ProdTypeID,b.CarrierID,b.BranchID,c.PolicyID,c.PolicyNo,b.NoticeNo,";
            sSql = sSql + "a.FeeDate,b.PayProcBase,CarrierSales,";
            sSql = sSql + "(select sum(Fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('7')) PayedFee,";
            sSql = sSql + "a.Fee,a.FeeAdjust,a.InvoiceNO,a.AuditStatus,c.SalesID,a.ProcessFeeType,";
            sSql = sSql + "(select AuditStatusName from AuditStatus where AuditStatusID=a.AuditStatus) AuditStatusName,";
            sSql = sSql + "(select GatheringTypeName from GatheringType where GatheringTypeID=a.GatheringType) GatheringTypeName,";
            sSql = sSql + "(select CustName from Customer where CustID=c.CustomerID) CustomerName,";
            sSql = sSql + "(select UserNameCn from P_User where UserID=c.SalesID) SalesName,";
            sSql = sSql + "(select ProdTypeName from ProductType where ProdTypeID=c.ProdTypeID) ProdTypeName,";
            sSql = sSql + "(select CarrierNameCn from Carrier where CarrierID=b.CarrierID) CarrierName,";
            sSql = sSql + "(select BranchName from Branch where BranchID=b.BranchID) BranchName,";
            sSql = sSql + " (select ProcessFeeTypeName from ProcessFeeType where ProcessFeeTypeID=a.ProcessFeeType) ProcessFeeTypeName";
            sSql = sSql + " from VoucherFee a,PolicyPeriod b,Policy c";
            sSql = sSql + " where a.PolPeriodID=b.PolPeriodID";
            sSql = sSql + "  and a.VoucherId=a.VoucherId";
            sSql = sSql + "  and b.PolicyID=c.PolicyID";
            sSql = sSql + "  and a.AccountTypeID in ('5')";
            sSql = sSql + " ) a";
            if (sWhere != "")
            {
                sSql = sSql + sWhere;
            }
            DbCommand dbCommand = _db.GetSqlStringCommand(sSql);
            return _db.ExecuteDataSet(dbCommand);
        }

        //FeePayinInvoiceAdd.aspx 列表
        public static DataSet GetFeePayinInvoiceAdd(string sVoucherID)
        {

            string sSql = "";

            //            select a.* from (
            //select a.VoucherID,a.FeeId,c.CustomerID,c.ProdTypeID,b.CarrierID,b.BranchID,c.PolicyID,c.PolicyNo,b.NoticeNo,
            //a.FeeDate,b.PayFeeBase,
            //(select sum(Fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('3','4')) PayedFee,
            //b.PayProcBase,
            //a.Fee,a.FeeAdjust,a.AuditStatus,c.SalesID,CiPremium,AciPremium,CstPremium,
            //a.ProcessFeeType,
            //(select AuditStatusName from AuditStatus where AuditStatusID=a.AuditStatus) AuditStatusName,
            //(select GatheringTypeName from GatheringType where GatheringTypeID=a.GatheringType) GatheringTypeName,
            //(select CustName from Customer where CustID=c.CustomerID) CustomerName,
            //(select UserNameCn from P_User where UserID=c.SalesID) SalesName,
            //(select ProdTypeName from ProductType where ProdTypeID=c.ProdTypeID) ProdTypeName,
            //(select CarrierNameCn from Carrier where CarrierID=b.CarrierID) CarrierName,
            //(select BranchName from Branch where BranchID=b.BranchID) BranchName,
            // (select ProcessFeeTypeName from ProcessFeeType where ProcessFeeTypeID=a.ProcessFeeType) ProcessFeeTypeName
            // from VoucherFee a,PolicyPeriod b,Policy c
            // where a.PolPeriodID=b.PolPeriodID
            //  and b.PolicyID=c.PolicyID
            //  and a.AccountTypeID in ('3','4')
            // ) a

            //where 1=1



            sSql = sSql + "select a.* from (";
            sSql = sSql + "select a.VoucherID,a.FeeId,c.CustomerID,c.ProdTypeID,b.CarrierID,b.BranchID,c.PolicyID,c.PolicyNo,b.NoticeNo,";
            sSql = sSql + "a.FeeDate,b.PayFeeBase,";
            sSql = sSql + "(select sum(Fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('3','4')) PayedFee,";
            sSql = sSql + "b.PayProcBase,";
            sSql = sSql + "a.Fee,a.FeeAdjust,a.AuditStatus,c.SalesID,CiPremium,AciPremium,CstPremium,";
            sSql = sSql + "a.ProcessFeeType,";
            sSql = sSql + "(select AuditStatusName from AuditStatus where AuditStatusID=a.AuditStatus) AuditStatusName,";
            sSql = sSql + "(select GatheringTypeName from GatheringType where GatheringTypeID=a.GatheringType) GatheringTypeName,";
            sSql = sSql + "(select CustName from Customer where CustID=c.CustomerID) CustomerName,";
            sSql = sSql + "(select UserNameCn from P_User where UserID=c.SalesID) SalesName,";
            sSql = sSql + "(select ProdTypeName from ProductType where ProdTypeID=c.ProdTypeID) ProdTypeName,";
            sSql = sSql + "(select CarrierNameCn from Carrier where CarrierID=b.CarrierID) CarrierName,";
            sSql = sSql + "(select BranchName from Branch where BranchID=b.BranchID) BranchName,";
            sSql = sSql + " (select ProcessFeeTypeName from ProcessFeeType where ProcessFeeTypeID=a.ProcessFeeType) ProcessFeeTypeName";
            sSql = sSql + " from VoucherFee a,PolicyPeriod b,Policy c";
            sSql = sSql + " where a.PolPeriodID=b.PolPeriodID";
            sSql = sSql + "  and b.PolicyID=c.PolicyID";
            sSql = sSql + "  and a.AccountTypeID in ('3','4')";
            sSql = sSql + " ) a";
            sSql = sSql + " where VoucherID ='" + sVoucherID + "'";


            DbCommand dbCommand = _db.GetSqlStringCommand(sSql);
            return _db.ExecuteDataSet(dbCommand);
        }


        //FeePayinInvoiceAddSelect.aspx 列表
        public static DataSet GetFeePayinInvoiceSelectList(string sWhere)
        {
            //select a.*,(PayProcBase-PayedProc) PayProcFee from (
            //select a.VoucherID,a.FeeId,b.CustomerID,b.ProdTypeID,a.CarrierID,a.BranchID,b.PolicyID,b.PolicyNo,a.NoticeNo,a.PolPeriodID,
            //FeeDate,a.PayProcBase,CarrierSales,
            //a.PayFeeBase PayFee,PayFeeBase PayinFee,PayProcBase PayinInvoiceFee,PayProcBase PayProc,
            //(select sum(fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('1','6')) PayedFee,
            //(select sum(Fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('5')) PayinInvoiceedFee,
            //(select sum(fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('3','4')) PayinedFee,
            //(select sum(fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('7')) PayedProc,
            //a.Fee,a.FeeAdjust,a.InvoiceNO,a.AuditStatus,b.SalesID,a.ProcessFeeType,
            //(select AuditStatusName from AuditStatus where AuditStatusID=a.AuditStatus) AuditStatusName,
            //(select GatheringTypeName from GatheringType where GatheringTypeID=a.GatheringType) GatheringTypeName,
            //(select CustName from Customer where CustID=b.CustomerID) CustomerName,
            //(select UserNameCn from P_User where UserID=b.SalesID) SalesName,
            //(select ProdTypeName from ProductType where ProdTypeID=b.ProdTypeID) ProdTypeName,
            //(select CarrierNameCn from Carrier where CarrierID=a.CarrierID) CarrierName,
            //(select BranchName from Branch where BranchID=a.BranchID) BranchName,
            // (select ProcessFeeTypeName from ProcessFeeType where ProcessFeeTypeID=a.ProcessFeeType) ProcessFeeTypeName
            // from VoucherFee a,Policy b
            // where a.PolicyID=b.PolicyID
            //  and a.AccountTypeID in ('3','4')
            // ) a



            string sSql = "";
            sSql = sSql + "select a.*,(PayProcBase-PayedProc) PayProcFee from (";
            sSql = sSql + "select a.VoucherID,a.FeeId,b.CustomerID,b.ProdTypeID,a.CarrierID,a.BranchID,b.PolicyID,b.PolicyNo,a.NoticeNo,a.PolPeriodID,";
            sSql = sSql + "FeeDate,a.PayProcBase,CarrierSales,";
            sSql = sSql + "a.PayFeeBase PayFee,PayFeeBase PayinFee,PayProcBase PayinInvoiceFee,PayProcBase PayProc,";
            sSql = sSql + "(select sum(fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('1','6')) PayedFee,";
            sSql = sSql + "(select sum(Fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('5')) PayinInvoiceedFee,";
            sSql = sSql + "(select sum(fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('3','4')) PayinedFee,";
            sSql = sSql + "(select sum(fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('7')) PayedProc,";
            sSql = sSql + "a.Fee,a.FeeAdjust,a.InvoiceNO,a.AuditStatus,b.SalesID,a.ProcessFeeType,";
            sSql = sSql + "(select AuditStatusName from AuditStatus where AuditStatusID=a.AuditStatus) AuditStatusName,";
            sSql = sSql + "(select GatheringTypeName from GatheringType where GatheringTypeID=a.GatheringType) GatheringTypeName,";
            sSql = sSql + "(select CustName from Customer where CustID=b.CustomerID) CustomerName,";
            sSql = sSql + "(select UserNameCn from P_User where UserID=b.SalesID) SalesName,";
            sSql = sSql + "(select ProdTypeName from ProductType where ProdTypeID=b.ProdTypeID) ProdTypeName,";
            sSql = sSql + "(select CarrierNameCn from Carrier where CarrierID=a.CarrierID) CarrierName,";
            sSql = sSql + "(select BranchName from Branch where BranchID=a.BranchID) BranchName,";
            sSql = sSql + " (select ProcessFeeTypeName from ProcessFeeType where ProcessFeeTypeID=a.ProcessFeeType) ProcessFeeTypeName";
            sSql = sSql + " from VoucherFee a,Policy b";
            sSql = sSql + " where a.PolicyID=b.PolicyID";
            sSql = sSql + "  and a.AccountTypeID in ('3','4')";
            sSql = sSql + " ) a";
            sSql = sSql + " where 1=1";
            if (sWhere != "")
            {
                sSql = sSql + sWhere;
            }
            DbCommand dbCommand = _db.GetSqlStringCommand(sSql);
            return _db.ExecuteDataSet(dbCommand);
        }


    }
}
