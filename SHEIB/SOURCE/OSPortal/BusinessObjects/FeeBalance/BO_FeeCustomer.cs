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
        public static DataSet GetFeeCustomerList(string sWhere)
        {

            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeeCustomerList");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        // FeeCustomerAdd.aspx 列表
        public static DataSet GetFeeCustomerAdd(string sVoucherID)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeeCustomerAdd");
            _db.AddInParameter(dbCommand, "@ac_VoucherID", DbType.String, sVoucherID);
            return _db.ExecuteDataSet(dbCommand);
        }


        //FeeCustomerAddSelect.aspx 列表
        public static DataSet GetFeeCustomerAddSelectList(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeeCustomerAddSelectList");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

    }
}


