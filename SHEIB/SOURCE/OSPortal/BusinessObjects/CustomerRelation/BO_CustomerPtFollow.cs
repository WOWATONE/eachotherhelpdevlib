using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace BusinessObjects
{
    [Serializable()]
    public class BO_CustomerPtFollow : BaseObject
    {
        public BO_CustomerPtFollow() { }

        public BO_CustomerPtFollow(String id)
        {
            //FetchByID(id);
        }

        public enum FieldList
        {
            FollowID,
            CustID,
            FollowType,
            FollowStage,
            FollowDate,
            FollowMemo,
            FollowPerson,
            NextFollow,
            NewFollowID
        }

        #region Property
        /*销售跟进GUID*/
        public string FollowID { get; set; }
        /*所属客户GUID*/
        public string CustID { get; set; }
        /*根据类型*/
        public string FollowType { get; set; }
        /*跟进程度*/
        public string FollowStage { get; set; }
        /*跟进日期*/
        public DateTime FollowDate { get; set; }
        /*跟进内容*/
        public string FollowMemo { get; set; }
        /*跟进人*/
        public string FollowPerson { get; set; }
        /*下次跟进日期*/
        public DateTime NextFollow { get; set; }
        /*新销售跟进GUID*/
        public string NewFollowID { get; set; }
        #endregion

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
        /// 保存销售跟进信息
        /// </summary>
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO CustomerPtFollow(FollowID, CustID, FollowType, FollowStage, FollowDate, FollowMemo, FollowPerson, NextFollow) ");
            sb.Append(" VALUES(@FollowID, @CustID, @FollowType, @FollowStage, @FollowDate, @FollowMemo, @FollowPerson, @NextFollow)");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@FollowID", DbType.AnsiString, this.FollowID);
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, this.CustID);
            _db.AddInParameter(dbCommand, "@FollowType", DbType.AnsiString, this.FollowType);
            _db.AddInParameter(dbCommand, "@FollowStage", DbType.AnsiString, this.FollowStage);
            if (this.FollowDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@FollowDate", DbType.DateTime, DBNull.Value);
            else
                _db.AddInParameter(dbCommand, "@FollowDate", DbType.DateTime, this.FollowDate);
            _db.AddInParameter(dbCommand, "@FollowMemo", DbType.AnsiString, this.FollowMemo);
            _db.AddInParameter(dbCommand, "@FollowPerson", DbType.AnsiString, this.FollowPerson);
            if (this.NextFollow == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@NextFollow", DbType.DateTime, DBNull.Value);
            else
                _db.AddInParameter(dbCommand, "@NextFollow", DbType.DateTime, this.NextFollow);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 修改销售跟进信息
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update CustomerPtFollow ");
            sb.Append("Set FollowID=@NewFollowID, CustID=@CustID, FollowType=@FollowType, FollowStage=@FollowStage, FollowDate=@FollowDate, FollowMemo=@FollowMemo, ");
            sb.Append("FollowPerson=@FollowPerson, NextFollow=@NextFollow ");
            sb.Append("Where FollowID=@FollowID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@FollowID", DbType.AnsiString, this.FollowID);
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, this.CustID);
            _db.AddInParameter(dbCommand, "@FollowType", DbType.AnsiString, this.FollowType);
            _db.AddInParameter(dbCommand, "@FollowStage", DbType.AnsiString, this.FollowStage);
            if (this.FollowDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@FollowDate", DbType.DateTime, DBNull.Value);
            else
                _db.AddInParameter(dbCommand, "@FollowDate", DbType.DateTime, this.FollowDate);
            _db.AddInParameter(dbCommand, "@FollowMemo", DbType.AnsiString, this.FollowMemo);
            _db.AddInParameter(dbCommand, "@FollowPerson", DbType.AnsiString, this.FollowPerson);
            if (this.NextFollow == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@NextFollow", DbType.DateTime, DBNull.Value);
            else
                _db.AddInParameter(dbCommand, "@NextFollow", DbType.DateTime, this.NextFollow);
            _db.AddInParameter(dbCommand, "@NewFollowID", DbType.AnsiString, this.NewFollowID);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 根据用户ID取得销售跟进信息
        /// </summary>
        /// <param name="custID"></param>
        /// <returns></returns>
        public static DataTable GetCustPtFollowByCustID(string custID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select FollowID, FollowType, FollowStage, FollowDate, FollowMemo, FollowPerson, NextFollow ");
            sb.Append("From CustomerPtFollow (nolock) ");
            sb.Append("Where CustID=@CustID ");
            sb.Append("Order By FollowID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, custID);

            return _db.ExecuteDataSet(dbCommand).Tables[0];
        }

        /// <summary>
        /// 判断是否存在销售跟进编号
        /// </summary>
        /// <param name="contactID"></param>
        /// <returns></returns>
        public static bool IfExistsFollowID(string followID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select FollowID From CustomerPtFollow (nolock) ");
            sb.Append("Where FollowID=@FollowID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@FollowID", DbType.AnsiString, followID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 删除销售跟进信息
        /// </summary>
        /// <param name="contactID"></param>
        public static void Delete(string followID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM CustomerPtFollow ");
            sb.Append(" WHERE FollowID = @FollowID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@FollowID", DbType.AnsiString, followID);

            _db.ExecuteNonQuery(dbCommand);
        }
        #endregion
    }
}