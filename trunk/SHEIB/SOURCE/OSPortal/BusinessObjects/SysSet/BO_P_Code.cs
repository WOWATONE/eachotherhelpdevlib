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
            ProcessFeeType
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


        #endregion Methods


    }
}
