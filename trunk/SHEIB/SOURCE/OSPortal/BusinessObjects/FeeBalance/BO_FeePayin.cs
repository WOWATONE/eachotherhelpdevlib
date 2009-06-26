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
    public class BO_FeePayin : BO_Fee
    {

        //FeePayin列表
        public static DataSet GetFeePayinList(string sWhere)
        {
            //             select a.* from (
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
            //(select ProcessFeeTypeName from ProcessFeeType where ProcessFeeTypeID=a.ProcessFeeType) ProcessFeeTypeName
            // from VoucherFee a,PolicyPeriod b,Policy c
            // where a.PolPeriodID=b.PolPeriodID
            //  and b.PolicyID=c.PolicyID
            //  and a.AccountTypeID in ('3','4')
            // ) a

            string sSql = "";
            sSql = sSql + " select a.* from (";
            sSql = sSql + "select a.VoucherID,a.FeeId,c.CustomerID,c.ProdTypeID,b.CarrierID,b.BranchID,c.PolicyID,c.PolicyNo,b.NoticeNo,";
            sSql = sSql + "a.FeeDate,b.PayFeeBase,";
            sSql = sSql + "(select sum(Fee) from VoucherFee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('3','4')) PayedFee,";
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
            sSql = sSql + "(select ProcessFeeTypeName from ProcessFeeType where ProcessFeeTypeID=a.ProcessFeeType) ProcessFeeTypeName";
            sSql = sSql + " from VoucherFee a,PolicyPeriod b,Policy c";
            sSql = sSql + " where a.PolPeriodID=b.PolPeriodID";
            sSql = sSql + "  and b.PolicyID=c.PolicyID";
            sSql = sSql + "  and a.AccountTypeID in ('3','4')";
            sSql = sSql + " ) a";
            if (sWhere != "")
            {
                sSql = sSql + sWhere;
            }
            DbCommand dbCommand = _db.GetSqlStringCommand(sSql);
            return _db.ExecuteDataSet(dbCommand);
        }

        // FeeCustomerAdd.aspx 列表
        public static DataSet GetFeePayinAdd(string sVoucherID)
        {

            string sSql = "";

            //            select a.* from (
            //select a.VoucherID,a.FeeId,c.CustomerID,c.ProdTypeID,b.CarrierID,b.BranchID,c.PolicyID,c.PolicyNo,b.NoticeNo,
            //a.FeeDate,b.PayFeeBase,
            //(select sum(Fee) from VoucherFee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('3','4')) PayedFee,
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


        //FeeCustomerAddSelect.aspx 列表
        public static DataSet GetFeePayinAddSelectList(string sWhere)
        {

            //select a.*,(PayFeeBase-PayedFee) PayFee from 
            //(
            //select a.FeeID,a.NoticeNo,a.PolicyID,b.PolicyNo,b.DeptID,b.CustomerID,b.ProdTypeID,PolPeriodID,FeeDate,CarrierSales,
            //B.GatheringType,PremiumBase,a.PayFeeBase,
            //(select sum(Fee) from VoucherFee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('3','4')) PayedFee,
            //a.PayProcBase,CarrierID,BranchID,Period,PayDate,CiPremium,AciPremium,CstPremium,c.NoticeDate,
            //(select CustName from  customer where custID=b.CustomerID) CustName, 
            //(select ProdTypeName from ProductType where ProdTypeID=b.ProdTypeID) ProdTypeName,
            //(select GatheringTypeName from GatheringType where GatheringTypeID=b.GatheringType) GatheringTypeName,
            //(select UserNameCn from P_User where UserID=b.SalesID) SalesName,
            //(select CarrierNameCn from Carrier where CarrierID=a.CarrierID) CarrierName,
            //(select BranchName from Branch where BranchID=a.BranchID) BranchName
            //  from VoucherFee a,Policy b,Notice c
            //  where a.PolicyID=b.PolicyID
            //    and a.NoticeNo=c.NoticeNo
            //    and a.AccountTypeID in ('1','6')
            //) a
            //where 1=1

            //select * from  PolicyPeriodFee
            //where PayFee = PayedFee
            //  and PayinFee <> PayinedFee


            //select * from (
            //Select a.PolperiodID,a.NoticeNo, a.Payfee, a.Feedate, a.Payedfee, a.Payinfee, a.PayinID, a.Payindate, a.Payinedfee, a.PayinInvoicefee,
            //       a.Payininvoicedate, a.Payininvoiceedfee, a.Payproc, a.PayprocID, a.Payprocdate, a.Payedproc,
            //       a.PolperiodID, a.Period, a.PolicyID, a.CarrierID, a.CarrierName, a.BranchID, a.BranchName, a.Paydate,
            //       a.Payfeebase, a.Payprocbase,a.NoticeDate,
            //       b.PolicyNo,b.DeptID,b.CustomerID,b.ProdTypeID,b.SalesID,b.CarrierSales,b.CiPremium,b.AciPremium,b.CstPremium,b.GatheringType,b.PremiumBase,
            //      (select CustName from  customer where custID=b.CustomerID) CustName, 
            //      (select ProdTypeName from ProductType where ProdTypeID=b.ProdTypeID) ProdTypeName,
            //      (select GatheringTypeName from GatheringType where GatheringTypeID=b.GatheringType) GatheringTypeName,
            //      (select UserNameCn from P_User where UserID=b.SalesID) SalesName
            // From PolicyperiodFee a, Policy b
            // Where a.Policyid = b.Policyid 
            //      And Payfee = Payedfee 
            //      And Payinfee <> Payinedfee
            //) a



            //sSql = sSql + "select * from (";
            //sSql = sSql + "Select a.PolperiodID,a.NoticeNo, a.Payfee, a.Feedate, a.Payedfee, a.Payinfee, a.PayinID, a.Payindate, a.Payinedfee, a.PayinInvoicefee,";
            //sSql = sSql + "       a.Payininvoicedate, a.Payininvoiceedfee, a.Payproc, a.PayprocID, a.Payprocdate, a.Payedproc,";
            //sSql = sSql + "       a.Period, a.PolicyID, a.CarrierID, a.CarrierName, a.BranchID, a.BranchName, a.Paydate,";
            //sSql = sSql + "       a.Payfeebase, a.Payprocbase,a.NoticeDate,";
            //sSql = sSql + "       b.PolicyNo,b.DeptID,b.CustomerID,b.ProdTypeID,b.SalesID,b.CarrierSales,b.CiPremium,b.AciPremium,b.CstPremium,b.GatheringType,b.PremiumBase,";
            //sSql = sSql + "      (select CustName from  customer where custID=b.CustomerID) CustName, ";
            //sSql = sSql + "      (select ProdTypeName from ProductType where ProdTypeID=b.ProdTypeID) ProdTypeName,";
            //sSql = sSql + "      (select GatheringTypeName from GatheringType where GatheringTypeID=b.GatheringType) GatheringTypeName,";
            //sSql = sSql + "      (select UserNameCn from P_User where UserID=b.SalesID) SalesName";
            //sSql = sSql + " From PolicyperiodFee a, Policy b";
            //sSql = sSql + " Where a.Policyid = b.Policyid ";
            //sSql = sSql + "      And Payfee = Payedfee ";
            //sSql = sSql + "      And Payinfee <> Payinedfee";
            //sSql = sSql + ") a";

            string sSql = "";
            sSql = sSql + "select * from (";
            sSql = sSql + "Select a.PolperiodID,a.PolicyID,a.NoticeNo, a.Payfee, a.Feedate, a.Payedfee, a.Payinfee, a.Payinedfee,(a.Payinfee - a.Payinedfee) Fee,a.Payproc, ";
            sSql = sSql + "       a.Period,a.CarrierID, a.CarrierName, a.BranchID, a.BranchName, a.Paydate,";
            sSql = sSql + "       a.Payfeebase, a.Payprocbase,a.NoticeDate,";
            sSql = sSql + "       b.PolicyNo,b.DeptID,b.CustomerID,b.ProdTypeID,b.SalesID,b.CarrierSales,b.CiPremium,b.AciPremium,b.CstPremium,b.GatheringType,b.PremiumBase,";
            sSql = sSql + "       (select CustName from  customer where custID=b.CustomerID) CustName, ";
            sSql = sSql + "       (select ProdTypeName from ProductType where ProdTypeID=b.ProdTypeID) ProdTypeName,";
            sSql = sSql + "       (select GatheringTypeName from GatheringType where GatheringTypeID=b.GatheringType) GatheringTypeName,";
            sSql = sSql + "       (select UserNameCn from P_User where UserID=b.SalesID) SalesName";
            sSql = sSql + " From Policyperiodfee a, Policy b";
            sSql = sSql + " Where a.Policyid = b.Policyid ";
            sSql = sSql + "      And Payfee = Payedfee ";
            sSql = sSql + "      And Payinfee <> Payinedfee";
            sSql = sSql + ") a";
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



//Select a.Noticeno, a.Payfee, a.Feedate, a.Payedfee, a.Payinfee, a.Payinid, a.Payindate, a.Payinedfee, a.Payininvoicefee,
//             a.Payininvoiceid, a.Payininvoicedate, a.Payininvoiceedfee, a.Payproc, a.Payprocid, a.Payprocdate, a.Payedproc,
//             a.Polperiodid, a.Period, a.Policyid, a.Carrierid, a.Carriername, a.Branchid, a.Branchname, a.Paydate,
//             a.Payfeebase, a.Payprocbase
//From Policyperiodfee a, Policy b
//Where a.Policyid = b.Policyid And Payfee = Payedfee And Payinfee <> Payinedfee