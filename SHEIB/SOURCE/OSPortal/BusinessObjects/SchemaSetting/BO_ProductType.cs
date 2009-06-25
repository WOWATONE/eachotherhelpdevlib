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
    public class BO_ProductType : BaseObject
    {
        public BO_ProductType() { }


        public BO_ProductType(String id)
        {
            fetchByID(id);
        }


        public enum FieldList
        {
            ProdTypeID, 
            ProdClass, 
            ProdTypeName, 
            ParentId, 
            Layer,
            ParentName,
            ProdClassName,
            NewProdTypeID
        }


        #region Property

        public string ProdTypeID
        {
            get;
            set;
        }

        public string ProdClass
        {
            get;
            set;
        }

        public string ProdTypeName
        {
            get;
            set;
        }

        public string ParentId
        {
            get;
            set;
        }

        public Int32 Layer
        {
            get;
            set;
        }

        /// <summary>
        /// 上级险种名称
        /// </summary>
        public string ParentName
        {
            get;
            set;
        }

        /// <summary>
        /// 大类名称
        /// </summary>
        public string ProdClassName
        {
            get;
            set;
        }

        /// <summary>
        /// 新险种编号
        /// </summary>
        public string NewProdTypeID
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
            sb.Append("INSERT INTO ProductType(ProdTypeID, ProdClass, ProdTypeName, ParentId, Layer) ");
            sb.Append("VALUES(@ProdTypeID, @ProdClass, @ProdTypeName, @ParentId, @Layer)");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.AnsiString, this.ProdTypeID);
            _db.AddInParameter(dbCommand, "@ProdClass", DbType.AnsiString, this.ProdClass);
            _db.AddInParameter(dbCommand, "@ProdTypeName", DbType.AnsiString, this.ProdTypeName);
            _db.AddInParameter(dbCommand, "@ParentId", DbType.AnsiString, this.ParentId);
            _db.AddInParameter(dbCommand, "@Layer", DbType.Int32, this.Layer);
        
            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 修改险种
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update ProductType Set ProdTypeID=@NewProdTypeID, ProdClass=@ProdClass, ProdTypeName=@ProdTypeName Where ProdTypeID=@ProdTypeID ");
            sb.Append("Update ProductType Set ParentId=@NewProdTypeID Where ParentId=@ProdTypeID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@NewProdTypeID", DbType.AnsiString, this.NewProdTypeID);
            _db.AddInParameter(dbCommand, "@ProdClass", DbType.AnsiString, this.ProdClass);
            _db.AddInParameter(dbCommand, "@ProdTypeName", DbType.AnsiString, this.ProdTypeName);
            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.AnsiString, this.ProdTypeID);

            _db.ExecuteNonQuery(dbCommand);
        }

        public static List<BO_ProductType> FetchLeafList(String whereFilter)
        {
            List<BO_ProductType> list = new List<BO_ProductType>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT ProdTypeID, ProdClass, ProdTypeName, ParentId, Layer ");
            sb.Append(" FROM ProductType ");
            sb.Append(" WHERE Layer = 3 ");
            sb.Append(" ORDER BY ProdClass ,ParentId, Layer ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_ProductType newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_ProductType();

                    newObj.ProdTypeID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdTypeID));
                    newObj.ProdClass = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdClass));
                    newObj.ProdTypeName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdTypeName));
                    newObj.ParentId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ParentId));
                    newObj.Layer = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.Layer));

                    list.Add(newObj);
                }
            }

            return list;
        }

        /// <summary>
        /// 得到所有险种信息
        /// </summary>
        /// <param name="whereFilter"></param>
        /// <returns></returns>
        public static DataSet GetProductType()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select Layer ");
            sb.Append("From ProductType (nolock) ");
            sb.Append("Group By Layer ");
            sb.Append("Order By Layer ");
            sb.Append("Select ProdTypeID, ProdClass, ProdTypeName, ParentId, Layer ");
            sb.Append("From ProductType (nolock) ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// 判断是否存在指定险种
        /// </summary>
        /// <param name="prodTypeID"></param>
        /// <returns></returns>
        public static bool IfExistsProdTypeID(string prodTypeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ProdTypeID From ProductType (nolock) ");
            sb.Append("Where ProdTypeID=@ProdTypeID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.AnsiString, prodTypeID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 判断保单中是否有指定险种
        /// </summary>
        /// <param name="prodTypeID"></param>
        /// <returns></returns>
        public static bool IfExistsInPolicy(string prodTypeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select top 1 ProdTypeID ");
            sb.Append("From Policy (nolock) ");
            sb.Append("Where ProdTypeID=@ProdTypeID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.AnsiString, prodTypeID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 判断险种项目中是否有指定险种
        /// </summary>
        /// <param name="prodTypeID"></param>
        /// <returns></returns>
        public static bool IfExistsInProduct(string prodTypeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select top 1 ProdTypeID ");
            sb.Append("From Product (nolock) ");
            sb.Append("Where ProdTypeID=@ProdTypeID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.AnsiString, prodTypeID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 判断指定险种是否有子险种
        /// </summary>
        /// <param name="prodTypeID"></param>
        /// <returns></returns>
        public static bool IfHasChildProductType(string prodTypeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select top 1 ProdTypeID ");
            sb.Append("From ProductType (nolock) ");
            sb.Append("Where ParentId=@ProdTypeID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.AnsiString, prodTypeID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 删除险种信息
        /// </summary>
        /// <param name="prodTypeID"></param>
        public static void Delete(string prodTypeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM ProductType ");
            sb.Append(" WHERE ProdTypeID = @ProdTypeID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.AnsiString, prodTypeID);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 取得险种大类
        /// </summary>
        /// <param name="sCodetype"></param>
        /// <returns></returns>
        public static DataSet GetProdClassList(string sProdClassNo)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select ProdClassNo, ProdClassName ");
            sb.Append("FROM ProdClass (nolock) ");
            if (sProdClassNo.Trim() != "")
            {
                sb.Append("And ProdClassNo = '" + sProdClassNo + "' ");
            }
            sb.Append("ORDER BY ProdClassNo");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            return _db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// 取得指定险种级别
        /// </summary>
        /// <param name="prodTypeID"></param>
        /// <returns></returns>
        public static int GetLayerByProdTypeID(string prodTypeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select Layer From ProductType (nolock) Where ProdTypeID=@ProdTypeID");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.AnsiString, prodTypeID);
            object value = _db.ExecuteScalar(dbCommand);
            if (value != null && value != DBNull.Value)
                return Convert.ToInt32(value);
            else
                return 0;
        }
        #endregion Methods


        #region Procedure

        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT PT.ProdTypeID, PT.ProdClass, PT.ProdTypeName, PT.ParentId, PT.Layer, isnull(PT1.ProdTypeName, '') as ParentName, isnull(PC.ProdClassName,'') as ProdClassName ");
            sb.Append(" FROM ProductType PT (nolock) ");
            sb.Append(" Left Join ProductType PT1 (nolock) On PT1.ProdTypeID=PT.ParentId ");
            sb.Append(" Left Join ProdClass PC (nolock) On PC.ProdClassNo=PT.ProdClass ");
            sb.Append(" WHERE PT.ProdTypeID = @ProdTypeID");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while(reader.Read())
                {
                    this.ProdTypeID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdTypeID));
                    this.ProdClass = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdClass));
                    this.ProdTypeName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdTypeName));
                    this.ParentId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ParentId));
                    this.Layer = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.Layer));
                    this.ParentName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ParentName));
                    this.ProdClassName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdClassName));
                    break;
                }
            }
        }

        #endregion Procedure
    }
}
