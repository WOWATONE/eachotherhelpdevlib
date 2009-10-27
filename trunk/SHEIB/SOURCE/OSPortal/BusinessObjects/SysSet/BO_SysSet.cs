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
    public class BO_SysSet : BaseObject
    {
        public BO_SysSet() { }

        public enum FieldList
        {
            ParamId,
            ParamName,
            ParamType,
            ParamData,
            FlagDelete,
            Remark
        }

        #region Property
        public int ParamId { get; set; }
        public string ParamName { get; set; }
        public int ParamType { get; set; }
        public string ParamData { get; set; }
        public int FlagDelete { get; set; }
        public string Remark { get; set; }
        #endregion

        #region Methods
        public void Save(ModifiedAction action)
        {
            if (action == ModifiedAction.Insert)
            {
                //add();
            }
            else if (action == ModifiedAction.Update)
            {
                update();
            }
        }

        /// <summary>
        /// 修改提醒服务
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update SysSet ");
            sb.Append("Set ParamData=@ParamData ");
            sb.Append("Where ParamId=@ParamId");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ParamId", DbType.Int32, this.ParamId);
            _db.AddInParameter(dbCommand, "@ParamData", DbType.AnsiString, this.ParamData);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 取得服务提醒信息
        /// </summary>
        /// <returns></returns>
        public static DataTable GetSysSetList(string sWhere)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ParamId, isnull(ParamName, '') as ParamName, isnull(ParamType, 0) as ParamType, isnull(ParamData, '0') as ParamData, isnull(FlagDelete, 0) as FlagDelete, isnull(Remark, '') as Remark ");
            sb.Append("From SysSet (nolock) ");
            sb.Append("Where 1=1 ");
            sb.Append(sWhere);
            sb.Append("Order by ParamId");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand).Tables[0];
        }
        #endregion

        public static DataSet MessageRemindCustomerBirthday(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.MessageRemindCustomerBirthday");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet MessageRemindCustomerPtFollow(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.MessageRemindCustomerPtFollow");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet MessageRemindPayInOut(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.MessageRemindPayInOut");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet MessageRemindPremiumContinue(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.MessageRemindPremiumContinue");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet MessageRemindProcess(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.MessageRemindProcess");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

    }
}
