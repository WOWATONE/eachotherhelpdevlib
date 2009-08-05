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
    public class Bo_FeeInvoice : BO_Fee
    {

        //FeePayinInvoice列表
        public static DataSet GetFeeInvoiceList(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeeInvoiceList");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        //FeePayinInvoiceAdd.aspx 列表
        public static DataSet GetFeeInvoiceAdd(string sVoucherID)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeeInvoiceAdd");
            _db.AddInParameter(dbCommand, "@ac_VoucherID", DbType.String, sVoucherID);
            return _db.ExecuteDataSet(dbCommand);
        }


        //FeeInvoiceAddSelect.aspx 列表
        public static DataSet GetFeeInvoiceSelectList(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeeInvoiceAddSelectList");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetFeeInvoiceAddPrint(string sVoucherID)
        {

            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeeInvoiceAddPrint");
            _db.AddInParameter(dbCommand, "@ac_VoucherID", DbType.String, sVoucherID);
            return _db.ExecuteDataSet(dbCommand);
        }

    }
}
