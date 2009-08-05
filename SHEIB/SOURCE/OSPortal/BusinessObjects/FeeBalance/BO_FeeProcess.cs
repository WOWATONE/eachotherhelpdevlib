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
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeeProcessList");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        //FeePayinInvoiceAdd.aspx 列表
        public static DataSet GetFeeProcessAdd(string sVoucherID)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeeProcessAdd");
            _db.AddInParameter(dbCommand, "@ac_VoucherID", DbType.String, sVoucherID);
            return _db.ExecuteDataSet(dbCommand);
        }


        //FeePayinInvoiceAddSelect.aspx 列表
        public static DataSet GetFeeProcessAddSelectList(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeeProcessAddSelectList");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetFeeProcessAddPrint(string sVoucherID)
        {

            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeeProcessAddPrint");
            _db.AddInParameter(dbCommand, "@ac_VoucherID", DbType.String, sVoucherID);
            return _db.ExecuteDataSet(dbCommand);
        }
    }
}
