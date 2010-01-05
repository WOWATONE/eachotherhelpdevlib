﻿using System;
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
            //FeeCustomer_Agent=1,
            FeeCustomer = 1,            
            PayIn = 3,
            Invoice = 5,
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
            GrdType,     //行政级别
            LossType,    //理赔损失性质
            NotifyType,   //报案方式
            SourceType,
            PremiumType //保单类别(0签单保费 1实收保费)
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
            NewCodeID
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
        /// <summary>
        /// 新代码编号
        /// </summary>
        public string NewCodeID
        {
            set;
            get;
        }
        #endregion Property


        #region Methods
        public void Save(ModifiedAction action)
        {
            if (action == ModifiedAction.Insert)
            {
                add();
            }
            else if (action == ModifiedAction.Update)
            {
                update();
            }
        }

        /// <summary>
        /// 保存代码表信息
        /// </summary>
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO P_Code(CodeType, CodeID, CodeName, SortNo, Content1, Content2, Content3) ");
            sb.Append(" VALUES(@CodeType, @CodeID, @CodeName, @SortNo, @Content1, @Content2, @Content3)");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CodeType", DbType.AnsiString, this.CodeType);
            _db.AddInParameter(dbCommand, "@CodeID", DbType.AnsiString, this.CodeID);
            _db.AddInParameter(dbCommand, "@CodeName", DbType.AnsiString, this.CodeName);
            _db.AddInParameter(dbCommand, "@SortNo", DbType.Decimal, this.SortNo);
            _db.AddInParameter(dbCommand, "@Content1", DbType.AnsiString, this.Content1);
            _db.AddInParameter(dbCommand, "@Content2", DbType.AnsiString, this.Content2);
            _db.AddInParameter(dbCommand, "@Content3", DbType.AnsiString, this.Content3);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 修改代码表信息
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update P_Code ");
            sb.Append("Set CodeID=@NewCodeID, CodeName=@CodeName, SortNo=@SortNo,Content1=@Content1, Content2=@Content2, Content3=@Content3 ");
            sb.Append("Where CodeType=@CodeTypeID And CodeID=@CodeID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CodeTypeID", DbType.AnsiString, this.CodeType);
            _db.AddInParameter(dbCommand, "@CodeID", DbType.AnsiString, this.CodeID);
            _db.AddInParameter(dbCommand, "@CodeName", DbType.AnsiString, this.CodeName);
            _db.AddInParameter(dbCommand, "@SortNo", DbType.Decimal, this.SortNo);
            _db.AddInParameter(dbCommand, "@Content1", DbType.AnsiString, this.Content1);
            _db.AddInParameter(dbCommand, "@Content2", DbType.AnsiString, this.Content2);
            _db.AddInParameter(dbCommand, "@Content3", DbType.AnsiString, this.Content3);
            _db.AddInParameter(dbCommand, "@NewCodeID", DbType.AnsiString, this.NewCodeID);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 删除代码表信息
        /// </summary>
        /// <param name="contactID"></param>
        public static void Delete(string codeTypeID, string codeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM P_Code ");
            sb.Append(" WHERE CodeType = @CodeTypeID And CodeID=@CodeID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CodeTypeID", DbType.AnsiString, codeTypeID);
            _db.AddInParameter(dbCommand, "@CodeID", DbType.AnsiString, codeID);

            _db.ExecuteNonQuery(dbCommand);
        }

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
            sb.Append(" FROM OperationType  Order by SortNo");

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

        /// <summary>
        /// 取得代码类型列表
        /// </summary>
        /// <returns></returns>
        public static DataSet GetCodeTypeList()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select CodeTypeID, isnull(Name, '') as Name ");
            sb.Append("From P_CodeType (nolock) ");
            sb.Append("Order By CodeTypeID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            return _db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// 根据代码类型取得代码列表
        /// </summary>
        /// <param name="?"></param>
        /// <returns></returns>
        public static DataSet GetCodeListByCodeTypeID(string codeTypeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ID, CodeType, CodeID, CodeName, SortNo, Content1, Content2, Content3 ");
            sb.Append("From P_Code (nolock) ");
            sb.Append("Where CodeType=@CodeType ");
            sb.Append("Order By CodeID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CodeType", DbType.AnsiString, codeTypeID);

            return _db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// 根据代码类型修改代码类型名称
        /// </summary>
        /// <param name="codeTypeID"></param>
        /// <param name="name"></param>
        public static void UpdatePCodeType(string codeTypeID, string name)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update P_CodeType ");
            sb.Append("Set Name=@Name ");
            sb.Append("Where CodeTypeID=@CodeTypeID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CodeTypeID", DbType.AnsiString, codeTypeID);
            _db.AddInParameter(dbCommand, "@Name", DbType.AnsiString, name);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 添加代码类型
        /// </summary>
        /// <param name="codeTypeID"></param>
        /// <param name="name"></param>
        public static void InsertPCodeType(string codeTypeID, string name)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Insert Into P_CodeType(CodeTypeID, Name) ");
            sb.Append("Values(@CodeTypeID, @Name)");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CodeTypeID", DbType.AnsiString, codeTypeID);
            _db.AddInParameter(dbCommand, "@Name", DbType.AnsiString, name);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 删除代码类型
        /// </summary>
        /// <param name="codeTypeID"></param>
        public static void DeletePCodeType(string codeTypeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Delete From P_CodeType Where CodeTypeID=@CodeTypeID ");
            sb.Append("Delete From P_Code Where CodeType=@CodeTypeID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CodeTypeID", DbType.AnsiString, codeTypeID);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 判断是否存在代码类型编号
        /// </summary>
        /// <param name="codeTypeID"></param>
        /// <returns></returns>
        public static bool IfExistsCodeTypeID(string codeTypeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select CodeTypeID From P_CodeType (nolock) ");
            sb.Append("Where CodeTypeID=@CodeTypeID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CodeTypeID", DbType.AnsiString, codeTypeID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 判断是否已经存在代码编号在P_Code
        /// </summary>
        /// <param name="codeTypeID"></param>
        /// <returns></returns>
        public static bool IfExistsCodeID(string codeTypeID, string codeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select CodeType, CodeID From P_Code (nolock) ");
            sb.Append("Where CodeType=@CodeTypeID And CodeID=@CodeID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CodeTypeID", DbType.AnsiString, codeTypeID);
            _db.AddInParameter(dbCommand, "@CodeID", DbType.AnsiString, codeID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }
        #endregion Methods


    }
}
