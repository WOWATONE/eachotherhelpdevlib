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
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeePayinList");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        // FeeCustomerAdd.aspx 列表
        public static DataSet GetFeePayinAdd(string sVoucherID)
        {

            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeePayinAdd");
            _db.AddInParameter(dbCommand, "@ac_VoucherID", DbType.String, sVoucherID);
            return _db.ExecuteDataSet(dbCommand);
           
        }


        public static DataSet GetFeePayinAddSelectList(string sWhere)
        {

            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeePayinAddSelectList");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetFeePayinAddSelectListIncludeUnPayin(string sWhere)
        {

            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeePayinAddSelectListIncludeUnPayin");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetFeePayinAddPrint(string sVoucherID)
        {

            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeePayinAddPrint");
            _db.AddInParameter(dbCommand, "@ac_VoucherID", DbType.String, sVoucherID);
            return _db.ExecuteDataSet(dbCommand);
        }

    }


}
