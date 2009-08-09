using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Runtime.Serialization;

namespace BusinessObjects.SchemaSetting
{
    [Serializable()]
    public class BO_CustClassify : BaseObject
    {
        public BO_CustClassify() { }


        public BO_CustClassify(String id)
        {
            fetchByID(id);
        }


        public enum FieldList
        {
            CustClassifyID,
            ParentID,
            CustClassifyName,
            OrderNo,
            ParentName,
            NewCustClassifyID
        }


        #region Property

        public string CustClassifyID
        {
            get;
            set;
        }

        public string ParentID
        {
            get;
            set;
        }

        public string CustClassifyName
        {
            get;
            set;
        }

        public Int32 OrderNo
        {
            get;
            set;
        }

        /// <summary>
        /// 上级企业目录名称
        /// </summary>
        public string ParentName
        {
            get;
            set;
        }

        /// <summary>
        /// 客户分类ID
        /// </summary>
        public string NewCustClassifyID
        {
            get;
            set;
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
        /// 保存险种信息
        /// </summary>
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO CustClassify(CustClassifyID, ParentID, CustClassifyName, OrderNo) ");
            sb.Append("VALUES(@CustClassifyID, @ParentID, @CustClassifyName, @OrderNo)");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CustClassifyID", DbType.AnsiString, this.CustClassifyID);
            _db.AddInParameter(dbCommand, "@ParentID", DbType.AnsiString, this.ParentID);
            _db.AddInParameter(dbCommand, "@CustClassifyName", DbType.AnsiString, this.CustClassifyName);
            _db.AddInParameter(dbCommand, "@OrderNo", DbType.Int32, this.OrderNo);
        
            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 修改险种
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update CustClassify Set CustClassifyID=@NewCustClassifyID, CustClassifyName=@CustClassifyName, OrderNo=@OrderNo Where CustClassifyID=@CustClassifyID ");
            sb.Append("Update CustClassify Set ParentId=@NewCustClassifyID Where ParentId=@CustClassifyID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@NewCustClassifyID", DbType.AnsiString, this.NewCustClassifyID);
            _db.AddInParameter(dbCommand, "@CustClassifyName", DbType.AnsiString, this.CustClassifyName);
            _db.AddInParameter(dbCommand, "@OrderNo", DbType.Int32, this.OrderNo);
            _db.AddInParameter(dbCommand, "@CustClassifyID", DbType.AnsiString, this.CustClassifyID);

            _db.ExecuteNonQuery(dbCommand);
        }

        public static List<BO_CustClassify> FetchLeafList(String whereFilter)
        {
            List<BO_CustClassify> list = new List<BO_CustClassify>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT CustClassifyID, ParentID, CustClassifyName, OrderNo ");
            sb.Append(" FROM CustClassify ");
            sb.Append(" WHERE 1 = 1 ");
            if (!string.IsNullOrEmpty(whereFilter))
                sb.Append(whereFilter);
            sb.Append(" ORDER BY ParentId, OrderNo ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_CustClassify newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_CustClassify();

                    newObj.CustClassifyID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustClassifyID));
                    newObj.ParentID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ParentID));
                    newObj.CustClassifyName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustClassifyName));
                    newObj.OrderNo = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.OrderNo));

                    list.Add(newObj);
                }
            }

            return list;
        }

        /// <summary>
        /// 得到所有企业目录信息
        /// </summary>
        /// <param name="whereFilter"></param>
        /// <returns></returns>
        public static DataSet GetCustClassifyList()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select CustClassifyID, isnull(ParentID, '0') as ParentID, CustClassifyName, OrderNo ");
            sb.Append("From CustClassify (nolock) ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// 判断是否存在指定企业目录
        /// </summary>
        /// <param name="custClassifyID"></param>
        /// <returns></returns>
        public static bool IfExistsCustClassifyID(string custClassifyID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select CustClassifyID From CustClassify (nolock) ");
            sb.Append("Where CustClassifyID=@CustClassifyID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustClassifyID", DbType.AnsiString, custClassifyID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 判断指定企业目录是否有子目录
        /// </summary>
        /// <param name="custClassifyID"></param>
        /// <returns></returns>
        public static bool IfHasChildCustClassify(string custClassifyID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select top 1 CustClassifyID ");
            sb.Append("From CustClassify (nolock) ");
            sb.Append("Where ParentId=@CustClassifyID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustClassifyID", DbType.AnsiString, custClassifyID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 删除企业目录信息
        /// </summary>
        /// <param name="custClassifyID"></param>
        public static void Delete(string custClassifyID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM CustClassify ");
            sb.Append(" WHERE CustClassifyID = @CustClassifyID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustClassifyID", DbType.AnsiString, custClassifyID);

            _db.ExecuteNonQuery(dbCommand);
        }
        #endregion Methods


        #region Procedure

        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT CC.CustClassifyID, CC.ParentID, CC.CustClassifyName, CC.OrderNo, isnull(CC1.CustClassifyName, '') as ParentName ");
            sb.Append(" FROM CustClassify CC (nolock) ");
            sb.Append(" Left Join CustClassify CC1 (nolock) On CC1.CustClassifyID=CC1.ParentId ");
            sb.Append(" WHERE CC.CustClassifyID = @CustClassifyID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CustClassifyID", DbType.String, id);

            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while(reader.Read())
                {
                    this.CustClassifyID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustClassifyID));
                    this.ParentID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ParentID));
                    this.CustClassifyName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustClassifyName));
                    this.OrderNo = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.OrderNo));
                    this.ParentName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ParentName));
                    break;
                }
            }
        }

        #endregion Procedure
    }
}
