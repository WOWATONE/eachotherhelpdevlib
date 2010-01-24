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
    public class BO_Report : BaseObject
    {

        public BO_Report() { }

        #region Methods



        public static DataSet GetInsuranceCommission1(string sBeginDate, string sEndDate)
        {

            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.rpt_InsuranceCommissionByProdType");
            _db.AddInParameter(dbCommand, "@ac_BeginDate", DbType.String, sBeginDate);
            _db.AddInParameter(dbCommand, "@ac_EndDate", DbType.String, sEndDate);

            return _db.ExecuteDataSet(dbCommand);
            
        }

        public static DataSet GetInsuranceCommission2(string sBeginDate, string sEndDate)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.rpt_InsuranceCommissionByArea");
            _db.AddInParameter(dbCommand, "@ac_BeginDate", DbType.String, sBeginDate);
            _db.AddInParameter(dbCommand, "@ac_EndDate", DbType.String, sEndDate);

            return _db.ExecuteDataSet(dbCommand);

        }

        public static DataSet GetAccounting(string sWhere)
        {           
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.Accounting");
            _db.AddInParameter(dbCommand,"@ac_where",DbType.String,sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetPremiumReceivablePeriodReport(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetPremiumReceivablePeriodReport");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetPremiumReceivablePeriodReportSum(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetPremiumReceivablePeriodReportSum");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetProcessReceivablePeriodReport(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetProcessReceivablePeriodReport");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }



        public static DataSet GetPremiumActualOverdueReport(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetPremiumActualOverdueReport");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetPremiumActualOverdueReportSum(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetPremiumActualOverdueReportSum");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetInsuranceCommissionTradeReport(string lsStartDate,string lsEndDate)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.rpt_InsuranceCommissionTrade");
            _db.AddInParameter(dbCommand, "@ac_BeginDate", DbType.String, lsStartDate);
            _db.AddInParameter(dbCommand, "@ac_EndDate", DbType.String, lsEndDate);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet RptStatisticByProdType(string sNy)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.RptStatisticByProdType");
            _db.AddInParameter(dbCommand, "@ac_Ny", DbType.String, sNy);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet RptStatisticByCustomer(string sNy)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.RptStatisticByCustomer");
            _db.AddInParameter(dbCommand, "@ac_Ny", DbType.String, sNy);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet RptStatisticByCarrier(string sNy)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.RptStatisticByCarrier");
            _db.AddInParameter(dbCommand, "@ac_Ny", DbType.String, sNy);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet RptCustomerPremiumStruct(string lsStartDate, string lsEndDate)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.RptCustomerPremiumStruct");
            _db.AddInParameter(dbCommand, "@ac_BeginDate", DbType.String, lsStartDate);
            _db.AddInParameter(dbCommand, "@ac_EndDate", DbType.String, lsEndDate);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet RptCustomerProcessStruct(string lsStartDate, string lsEndDate)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.RptCustomerProcessStruct");
            _db.AddInParameter(dbCommand, "@ac_BeginDate", DbType.String, lsStartDate);
            _db.AddInParameter(dbCommand, "@ac_EndDate", DbType.String, lsEndDate);
            return _db.ExecuteDataSet(dbCommand);
        }


        public static DataSet RptInvoiceProcStruct(string sYear)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.RptInvoiceProcStruct");
            _db.AddInParameter(dbCommand, "@ac_Year", DbType.String, sYear);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet RptRealPremiumStruct(string sNy)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.RptRealPremiumStruct");
            _db.AddInParameter(dbCommand, "@ac_Ny", DbType.String, sNy);
            return _db.ExecuteDataSet(dbCommand);
        }
        
        #endregion Methods


    }
}
