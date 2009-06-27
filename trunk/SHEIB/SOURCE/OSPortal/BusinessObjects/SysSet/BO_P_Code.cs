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
    public class BO_P_Code : BaseObject
    {


        public BO_P_Code() { }

        public enum AccountType
        {
            FeeCustomer_Agent=1,
            FeeCustomer_Direct = 6,            
            PayIn_Agent = 3,
            PayIn_Direct = 4,
            Process = 7
        }


        public enum GatheringType
        {
            Agent=1,
            Direct=2            
        }

        public enum AuditStatus
        {
            Appeal = 0,
            AuditOk = 1
        }

        public enum PCodeType
        {
            CodeTypeID,
            AccountType,
            AltType,
            Calamity,
            Currency,
            FeeType,
            GatheringType,
            OperationType,
            TradeName,
            Area,
	        PolicyStatus,
            PolicyType,
            AuditStatus,
            ProcessFeeType,
            InsType,     //业务类型
            GrdType      //行政级别
        }

        public enum FieldList
        {
            ID,
            CodeType,
            CodeID,
            CodeName,
            SortNo,
            Content1,
            Content2,
            Content3,
        }

        #region Property
        /// <summary>
        /// GUID
        /// </summary>
        public string ID
        {
            set;
            get;
        }
        /// <summary>
        /// 
        /// </summary>
        public string CodeType
        {
            set;
            get;
        }
        /// <summary>
        /// 
        /// </summary>
        public string CodeID
        {
            set;
            get;
        }
        /// <summary>
        /// 
        /// </summary>
        public string CodeName
        {
            set;
            get;
        }
        /// <summary>
        /// 
        /// </summary>
        public decimal SortNo
        {
            set;
            get;
        }
        /// <summary>
        /// 
        /// </summary>
        public string Content1
        {
            set;
            get;
        }
        /// <summary>
        /// 
        /// </summary>
        public string Content2
        {
            set;
            get;
        }
        /// <summary>
        /// 
        /// </summary>
        public string Content3
        {
            set;
            get;
        }

        #endregion Property


        #region Methods

        public static List<BO_P_Code> FetchList()
        {
            List<BO_P_Code> list = new List<BO_P_Code>();


            return list;
        }


        //根据数据字典类型返回此类型的CodeID，CodeName等内容
        public static DataSet GetListByCodeType(string sCodetype)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select [CodeID],[CodeName],[SortNo] ");
            sb.Append(" FROM P_Code (nolock) ");
            if (sCodetype.Trim() != "")
            {

                sb.Append(" where CodeType = '" + sCodetype + "' ORDER BY SortNo");
            }
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            return _db.ExecuteDataSet(dbCommand);
        }


        public static DataSet GetGatheringTypeList()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT * ");
            sb.Append(" FROM GatheringType ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetOperationTypeList()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT * ");
            sb.Append(" FROM OperationType ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetSourceTypeList()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT * ");
            sb.Append(" FROM SourceType ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            return _db.ExecuteDataSet(dbCommand);
        }


        public static DataSet GetCurencyList()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT * ");
            sb.Append(" FROM Curency ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            return _db.ExecuteDataSet(dbCommand);
        }

        #endregion Methods


    }
}
