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
    public class BO_Product : BaseObject
    {

        public BO_Product() { }

        public BO_Product(String id)
        {
            fetchByID(id);
        }

        public enum FieldList
        {
            ProdID, 
            ProdName, 
            ProdTypeID, 
            ProdTypeName,
            Brief, 
            PremiumRate, 
            FlagMain, 
            Remark, 
            ProcRate,
            NewProdID
        }

        #region Property

        public string ProdID
        {
            get;
            set;
        }

        public string ProdName
        {
            get;
            set;
        }

        public string ProdTypeID
        {
            get;
            set;
        }

        public string ProdTypeName
        {
            get;
            set;
        }

        public string Brief
        {
            get;
            set;
        }

        public Decimal PremiumRate
        {
            get;
            set;
        }

        public Boolean FlagMain
        {
            get;
            set;
        }

        public String Remark
        {
            get;
            set;
        }

        public Decimal ProcRate
        {
            get;
            set;
        }

        /// <summary>
        /// 新项目编号
        /// </summary>
        public string NewProdID
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
        /// 保存项目信息
        /// </summary>
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO Product(ProdID, ProdName, ProdTypeID, Brief, PremiumRate, FlagMain, Remark, ProcRate) ");
            sb.Append("VALUES(@ProdID, @ProdName, @ProdTypeID, @Brief, @PremiumRate, @FlagMain, @Remark, @ProcRate)");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ProdID", DbType.AnsiString, this.ProdID);
            _db.AddInParameter(dbCommand, "@ProdName", DbType.AnsiString, this.ProdName);
            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.AnsiString, this.ProdTypeID);
            _db.AddInParameter(dbCommand, "@Brief", DbType.AnsiString, this.Brief);
            _db.AddInParameter(dbCommand, "@PremiumRate", DbType.Decimal, this.PremiumRate);
            _db.AddInParameter(dbCommand, "@FlagMain", DbType.Boolean, this.FlagMain);
            _db.AddInParameter(dbCommand, "@Remark", DbType.AnsiString, this.Remark);
            _db.AddInParameter(dbCommand, "@ProcRate", DbType.Decimal, this.ProcRate);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 修改项目
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update Product ");
            sb.Append("Set ProdID=@NewProdID, ProdName=@ProdName, Brief=@Brief, PremiumRate=@PremiumRate, FlagMain=@FlagMain, Remark=@Remark, ProcRate=@ProcRate ");
            sb.Append("Where ProdID=@ProdID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@NewProdID", DbType.AnsiString, this.NewProdID);
            _db.AddInParameter(dbCommand, "@ProdName", DbType.AnsiString, this.ProdName);
            _db.AddInParameter(dbCommand, "@Brief", DbType.AnsiString, this.Brief);
            _db.AddInParameter(dbCommand, "@PremiumRate", DbType.Decimal, this.PremiumRate);
            _db.AddInParameter(dbCommand, "@FlagMain", DbType.Boolean, this.FlagMain);
            _db.AddInParameter(dbCommand, "@Remark", DbType.AnsiString, this.Remark);
            _db.AddInParameter(dbCommand, "@ProcRate", DbType.Decimal, this.ProcRate);
            _db.AddInParameter(dbCommand, "@ProdID", DbType.AnsiString, this.ProdID);

            _db.ExecuteNonQuery(dbCommand);
        }

        public static List<BO_Product> FetchList(String whereFilter)
        {
            List<BO_Product> list = new List<BO_Product>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT A.ProdID, A.ProdName, A.ProdTypeID, B.ProdTypeName, A.Brief, ");
            sb.Append(" A.PremiumRate, A.FlagMain, A.Remark, A.ProcRate ");
            sb.Append(" FROM Product A ");
            sb.Append(" LEFT JOIN ProductType B ON A.ProdTypeID = B.ProdTypeID ");
            sb.Append(" WHERE 1=1 ");
            sb.Append(whereFilter);
            sb.Append(" ORDER BY B.ProdTypeName,A.ProdName ");
            
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            
            BO_Product newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_Product();

                    newObj.ProdID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdID));
                    newObj.ProdName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdName));
                    newObj.ProdTypeID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdTypeID));
                    newObj.ProdTypeName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdTypeName));
                    newObj.Brief = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Brief));

                    newObj.PremiumRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PremiumRate));
                    newObj.FlagMain = Utility.GetBooleanFromReader(reader, Convert.ToInt32(FieldList.FlagMain));
                    newObj.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                    newObj.ProcRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.ProcRate));

                    list.Add(newObj);
                }
            }

            return list;
        }

        /// <summary>
        /// 判断是否存在指定项目
        /// </summary>
        /// <param name="prodID"></param>
        /// <returns></returns>
        public static bool IfExistsProdID(string prodID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ProdID From Product (nolock) ");
            sb.Append("Where ProdID=@ProdID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ProdID", DbType.AnsiString, prodID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 根据险种编号取得项目信息
        /// </summary>
        /// <param name="prodTypeID"></param>
        /// <returns></returns>
        public static DataTable GetProductByProdTypeID(string prodTypeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ProdTypeID, ProdID, ProdName, isnull(PremiumRate, 0) as PremiumRate, isnull(ProcRate, 0) as ProcRate ");
            sb.Append("From Product (nolock) ");
            sb.Append("Where ProdTypeID=@ProdTypeID ");
            sb.Append("Order By ProdID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.AnsiString, prodTypeID);
            return _db.ExecuteDataSet(dbCommand).Tables[0];
        }

        /// <summary>
        /// 删除险种项目
        /// </summary>
        /// <param name="prodID"></param>
        public static void Delete(string prodID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM Product ");
            sb.Append(" WHERE ProdID = @ProdID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ProdID", DbType.AnsiString, prodID);

            _db.ExecuteNonQuery(dbCommand);
        }
        #endregion Methods

        #region Procedure

        private void fetchByID(string id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select P.ProdID, P.ProdName, P.ProdTypeID, PT.ProdTypeName, P.Brief, isnull(P.PremiumRate, 0) as PremiumRate, P.FlagMain, P.Remark, isnull(P.ProcRate, 0) as ProcRate ");
            sb.Append("From Product P (nolock) ");
            sb.Append("Inner Join ProductType PT (nolock) On PT.ProdTypeID=P.ProdTypeID ");
            sb.Append("Where P.ProdID=@ProdID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ProdID", DbType.String, id);

            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while(reader.Read())
                {
                    this.ProdID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdID));
                    this.ProdName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdName));
                    this.ProdTypeID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdTypeID));
                    this.ProdTypeName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdTypeName));
                    this.Brief = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Brief));
                    this.PremiumRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PremiumRate));
                    this.FlagMain = Utility.GetBooleanFromReader(reader, Convert.ToInt32(FieldList.FlagMain));
                    this.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                    this.ProcRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.ProcRate));
                    break;
                }
            }
        }

        #endregion Procedure

    }
}
