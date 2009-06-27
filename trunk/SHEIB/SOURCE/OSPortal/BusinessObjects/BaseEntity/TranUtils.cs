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
    public class TranUtils : BaseObject
    {

        public static string GetPolicyID()
        {
            string id = "";
            StringBuilder sb = new StringBuilder();
            sb.Append("EXEC GetPolicyID @PolicyID OUTPUT;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddOutParameter(dbCommand, "@PolicyID", DbType.String, 10);

            _db.ExecuteNonQuery(dbCommand);

            id = _db.GetParameterValue(dbCommand, "@PolicyID").ToString();

            return id;

        }

        /// <summary>
        /// 取得客户编号
        /// </summary>
        /// <returns></returns>
        public static string GetCustomerID()
        {
            string id = "";
            StringBuilder sb = new StringBuilder();
            sb.Append("EXEC GetCustomerID @CustomerID OUTPUT;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddOutParameter(dbCommand, "@CustomerID", DbType.String, 10);

            _db.ExecuteNonQuery(dbCommand);

            id = _db.GetParameterValue(dbCommand, "@CustomerID").ToString();

            return id;

        }


        public static string GetAskPriceID()
        {
            string id = "";
            StringBuilder sb = new StringBuilder();
            sb.Append("EXEC GetAskPriceID @AskPriceID OUTPUT;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddOutParameter(dbCommand, "@AskPriceID", DbType.String, 10);

            _db.ExecuteNonQuery(dbCommand);

            id = _db.GetParameterValue(dbCommand, "@AskPriceID").ToString();

            return id;

        }


        public static string GetSerialID()
        {
            string id = "";
            StringBuilder sb = new StringBuilder();
            sb.Append("EXEC getSerialID @XLH OUTPUT;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddOutParameter(dbCommand, "@XLH", DbType.String, 10);

            _db.ExecuteNonQuery(dbCommand);

            id = _db.GetParameterValue(dbCommand, "@XLH").ToString();

            return id;

        }


        public static string GetInvoiceID()
        {
            string id = "";
            StringBuilder sb = new StringBuilder();
            sb.Append("EXEC GetInvoiceID @InvoiceID OUTPUT;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddOutParameter(dbCommand, "@InvoiceID", DbType.String, 10);

            _db.ExecuteNonQuery(dbCommand);

            id = _db.GetParameterValue(dbCommand, "@InvoiceID").ToString();

            return id;

        }


        public static string GetNoticeIDAgent()
        {
            string id = "";
            StringBuilder sb = new StringBuilder();
            sb.Append("EXEC GetNoticeIDAgent @NoticeIDAgent OUTPUT;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddOutParameter(dbCommand, "@NoticeIDAgent", DbType.String, 10);

            _db.ExecuteNonQuery(dbCommand);

            id = _db.GetParameterValue(dbCommand, "@NoticeIDAgent").ToString();

            return id;

        }


        public static string GetNoticeIDDirect()
        {
            string id = "";
            StringBuilder sb = new StringBuilder();
            sb.Append("EXEC GetNoticeIDDirect @NoticeIDDirect OUTPUT;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddOutParameter(dbCommand, "@NoticeIDDirect", DbType.String, 10);

            _db.ExecuteNonQuery(dbCommand);

            id = _db.GetParameterValue(dbCommand, "@NoticeIDDirect").ToString();

            return id;

        }

        
        public static string GetVoucherNo()
        {
            string id = "";
            StringBuilder sb = new StringBuilder();
            sb.Append("EXEC GetVoucherNo @VoucherNo OUTPUT;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddOutParameter(dbCommand, "@VoucherNo", DbType.String, 10);

            _db.ExecuteNonQuery(dbCommand);

            id = _db.GetParameterValue(dbCommand, "@VoucherNo").ToString();

            return id;

        }





    }
}
