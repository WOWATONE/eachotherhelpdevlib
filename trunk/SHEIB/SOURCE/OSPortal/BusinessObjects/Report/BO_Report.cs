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



        public static DataSet GetInsuranceCommission1(string sWhere)
        {

            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.rpt_CreateInsuranceCommission1");

            return _db.ExecuteDataSet(dbCommand);
            
        }

        public static DataSet GetInsuranceCommission2(string sWhere)
        {

            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.rpt_CreateInsuranceCommission2");

            return _db.ExecuteDataSet(dbCommand);

        }

        public static DataSet GetAccounting(string sWhere)
        {
           
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.Accounting");
            _db.AddInParameter(dbCommand,"@ac_where",DbType.String,sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }


        #endregion Methods


    }
}
