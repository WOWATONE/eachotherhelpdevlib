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
    public class BO_FeeProcess : BO_Fee
    {

        //FeePayinInvoice列表
        public static DataSet GetFeeProcessList(string sWhere)
        {
            //select a.* from (
            //select a.VoucherID,a.FeeId,c.CustomerID,c.ProdTypeID,b.CarrierID,b.BranchID,c.PolicyID,c.PolicyNo,b.NoticeNo,
            //a.FeeDate,b.PayProcBase,CarrierSales,b.PayinInvoiceDate,b.PayinInvoiceFee,
            //(select sum(Fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('7')) PayedFee,
            //a.Fee,a.FeeAdjust,a.InvoiceNO,a.AuditStatus,c.SalesID,a.ProcessFeeType,
            //(select AuditStautsName from AuditStauts where AuditStautsID=a.AuditStatus) AuditStautsName,
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
            //  and a.AccountTypeID in ('7')
            // ) a


            string sSql = "";
            sSql = sSql + " select a.* from (";
            sSql = sSql + "select a.VoucherID,a.FeeId,c.CustomerID,c.ProdTypeID,b.CarrierID,b.BranchID,c.PolicyID,c.PolicyNo,b.NoticeNo,";
            sSql = sSql + "a.FeeDate,b.PayProcBase,CarrierSales,b.PayinInvoiceDate,b.PayinInvoiceFee,";
            sSql = sSql + "(select sum(Fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('7')) PayedFee,";
            sSql = sSql + "a.Fee,a.FeeAdjust,a.InvoiceNO,a.AuditStatus,c.SalesID,a.ProcessFeeType,";
            sSql = sSql + "(select AuditStautsName from AuditStauts where AuditStautsID=a.AuditStatus) AuditStautsName,";
            sSql = sSql + "(select GatheringTypeName from GatheringType where GatheringTypeID=a.GatheringType) GatheringTypeName,";
            sSql = sSql + "(select CustName from Customer where CustID=c.CustomerID) CustomerName,";
            sSql = sSql + "(select UserNameCn from P_User where UserID=c.SalesID) SalesName,";
            sSql = sSql + "(select ProdTypeName from ProductType where ProdTypeID=c.ProdTypeID) ProdTypeName,";
            sSql = sSql + "(select CarrierNameCn from Carrier where CarrierID=b.CarrierID) CarrierName,";
            sSql = sSql + "(select BranchName from Branch where BranchID=b.BranchID) BranchName,";
            sSql = sSql + " (select ProcessFeeTypeName from ProcessFeeType where ProcessFeeTypeID=a.ProcessFeeType) ProcessFeeTypeName";
            sSql = sSql + " from VoucherFee a,PolicyPeriodFee b,Policy c";
            sSql = sSql + " where a.PolPeriodID=b.PolPeriodID";
            sSql = sSql + "  and a.VoucherId=a.VoucherId";
            sSql = sSql + "  and b.PolicyID=c.PolicyID";
            sSql = sSql + "  and a.AccountTypeID in ('7')";
            sSql = sSql + " ) a";
            if (sWhere != "")
            {
                sSql = sSql + sWhere;
            }
            DbCommand dbCommand = _db.GetSqlStringCommand(sSql);
            return _db.ExecuteDataSet(dbCommand);
        }

        //FeePayinInvoiceAdd.aspx 列表
        public static DataSet GetFeeProcessAdd(string sVoucherID)
        {

            string sSql = "";

            //Select a.*
            //From (Select a.Voucherid, a.Feeid, c.Customerid, c.Prodtypeid, b.Carrierid, b.Branchid, c.Policyid, c.Policyno,
            //  b.Noticeno, a.Feedate, b.Payprocbase, Carriersales, b.Payininvoicedate, b.Payininvoicefee,PayinInvoiceID,
            //  (Select Sum(Fee) From Fee Where Polperiodid = a.Polperiodid And Accounttypeid In ('7')) Payedfee, a.Fee,
            //  a.Feeadjust, a.Invoiceno, a.Auditstatus, c.Salesid, a.Processfeetype,
            //  (Select Auditstautsname From Auditstauts Where Auditstautsid = a.Auditstatus) Auditstautsname,
            //  (Select Gatheringtypename From Gatheringtype Where Gatheringtypeid = a.Gatheringtype) Gatheringtypename,
            //  (Select Custname From Customer Where Custid = c.Customerid) Customername,
            //  (Select Usernamecn From p_User Where Userid = c.Salesid) Salesname,
            //  (Select Prodtypename From Producttype Where Prodtypeid = c.Prodtypeid) Prodtypename,
            //  (Select Carriernamecn From Carrier Where Carrierid = b.Carrierid) Carriername,
            //  (Select Branchname From Branch Where Branchid = b.Branchid) Branchname,
            //  (Select Processfeetypename From Processfeetype Where Processfeetypeid = a.Processfeetype) Processfeetypename
            //   From Voucherfee a, Policyperiodfee b, Policy c
            //   Where a.Polperiodid = b.Polperiodid And a.Voucherid = a.Voucherid And b.Policyid = c.Policyid And
            //               a.Accounttypeid In ('7')) a
            //where 1=1



            sSql = sSql + "select a.* from (";
            sSql = sSql + " Select a.Voucherid, a.Feeid, c.Customerid, c.Prodtypeid, b.Carrierid, b.Branchid, c.PolicyID, c.PolicyNo,";
            sSql = sSql + " b.Noticeno, a.Feedate, b.Payprocbase, Carriersales, b.Payininvoicedate, b.PayinInvoiceedFee,b.PayinInvoiceID,";
            sSql = sSql + " (Select Sum(Fee) From Fee Where Polperiodid = a.Polperiodid And Accounttypeid In ('7')) Payedfee, a.Fee,";
            sSql = sSql + " a.Feeadjust, a.Invoiceno, a.Auditstatus, c.Salesid, a.Processfeetype,";
            sSql = sSql + " (Select Auditstautsname From Auditstauts Where Auditstautsid = a.Auditstatus) Auditstautsname,";
            sSql = sSql + " (Select Gatheringtypename From Gatheringtype Where Gatheringtypeid = a.Gatheringtype) Gatheringtypename,";
            sSql = sSql + " (Select Custname From Customer Where Custid = c.Customerid) Customername,";
            sSql = sSql + " (Select Usernamecn From p_User Where Userid = c.Salesid) Salesname,";
            sSql = sSql + " (Select Prodtypename From Producttype Where Prodtypeid = c.Prodtypeid) Prodtypename,";
            sSql = sSql + " (Select Carriernamecn From Carrier Where Carrierid = b.Carrierid) Carriername,";
            sSql = sSql + " (Select Branchname From Branch Where Branchid = b.Branchid) Branchname,";
            sSql = sSql + " (Select Processfeetypename From Processfeetype Where Processfeetypeid = a.Processfeetype) Processfeetypename";
            sSql = sSql + "  From Voucherfee a, Policyperiodfee b, Policy c";
            sSql = sSql + "  Where a.Polperiodid = b.Polperiodid And a.Voucherid = a.Voucherid And b.Policyid = c.Policyid And";
            sSql = sSql + "              a.Accounttypeid In ('7')) a";
            sSql = sSql + " where VoucherID ='" + sVoucherID + "'";


            DbCommand dbCommand = _db.GetSqlStringCommand(sSql);
            return _db.ExecuteDataSet(dbCommand);
        }


        //FeePayinInvoiceAddSelect.aspx 列表
        public static DataSet GetFeeProcessAddSelectList(string sWhere)
        {
            //            Select a.*
            //From (Select a.Voucherid, a.Feeid, c.Customerid, c.Prodtypeid, b.Carrierid, b.Branchid, c.Policyid, c.Policyno,
            //  b.Noticeno, a.Feedate, b.Payprocbase, Carriersales, b.Payininvoicedate, b.Payininvoicefee,PayinInvoiceID,
            //  (Select Sum(Fee) From Fee Where Polperiodid = a.Polperiodid And Accounttypeid In ('7')) Payedfee, a.Fee,
            //  a.Feeadjust, a.Invoiceno, a.Auditstatus, c.Salesid, a.Processfeetype,
            //  (Select Auditstautsname From Auditstauts Where Auditstautsid = a.Auditstatus) Auditstautsname,
            //  (Select Gatheringtypename From Gatheringtype Where Gatheringtypeid = a.Gatheringtype) Gatheringtypename,
            //  (Select Custname From Customer Where Custid = c.Customerid) Customername,
            //  (Select Usernamecn From p_User Where Userid = c.Salesid) Salesname,
            //  (Select Prodtypename From Producttype Where Prodtypeid = c.Prodtypeid) Prodtypename,
            //  (Select Carriernamecn From Carrier Where Carrierid = b.Carrierid) Carriername,
            //  (Select Branchname From Branch Where Branchid = b.Branchid) Branchname,
            //  (Select Processfeetypename From Processfeetype Where Processfeetypeid = a.Processfeetype) Processfeetypename
            //   From Voucherfee a, Policyperiodfee b, Policy c
            //   Where a.Polperiodid = b.Polperiodid And a.Voucherid = a.Voucherid And b.Policyid = c.Policyid And
            //               a.Accounttypeid In ('5')) a


            string sSql = "";
            sSql = sSql + "Select a.*";
            sSql = sSql + "From (Select a.Voucherid, a.Feeid, c.Customerid, c.Prodtypeid, b.Carrierid, b.Branchid, c.PolicyID, c.PolicyNo,";
            sSql = sSql + "  b.Noticeno, a.Feedate, b.Payprocbase, Carriersales, b.Payininvoicedate, b.Payininvoicefee,PayinInvoiceID,";
            sSql = sSql + "  (Select Sum(Fee) From Fee Where Polperiodid = a.Polperiodid And Accounttypeid In ('7')) Payedfee, a.Fee,";
            sSql = sSql + "  a.Feeadjust, a.Invoiceno, a.Auditstatus, c.Salesid, a.Processfeetype,";
            sSql = sSql + "  (Select Auditstautsname From Auditstauts Where Auditstautsid = a.Auditstatus) Auditstautsname,";
            sSql = sSql + "  (Select Gatheringtypename From Gatheringtype Where Gatheringtypeid = a.Gatheringtype) Gatheringtypename,";
            sSql = sSql + "  (Select Custname From Customer Where Custid = c.Customerid) Customername,";
            sSql = sSql + "  (Select Usernamecn From p_User Where Userid = c.Salesid) Salesname,";
            sSql = sSql + "  (Select Prodtypename From Producttype Where Prodtypeid = c.Prodtypeid) Prodtypename,";
            sSql = sSql + "  (Select Carriernamecn From Carrier Where Carrierid = b.Carrierid) Carriername,";
            sSql = sSql + "  (Select Branchname From Branch Where Branchid = b.Branchid) Branchname,";
            sSql = sSql + "  (Select Processfeetypename From Processfeetype Where Processfeetypeid = a.Processfeetype) Processfeetypename";
            sSql = sSql + "   From Voucherfee a, Policyperiodfee b, Policy c";
            sSql = sSql + "   Where a.Polperiodid = b.Polperiodid And a.Voucherid = a.Voucherid And b.Policyid = c.Policyid ";
            sSql = sSql + "            And a.Accounttypeid In ('5')) a";
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
