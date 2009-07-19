using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace BusinessObjects.Budget
{
    [Serializable()]
    public class BO_SignPremiumBudget : BaseObject
    {
        public BO_SignPremiumBudget() { }

        public BO_SignPremiumBudget(int id)
        {
            FetchByID(id);
        }

        public enum FieldList
        {
            SignPremiumBudgetID,
            SalesID,
            CustomerID,
            ProdTypeID,
            OperationType,
            PremiumBudget,
            ProcessBudget,
            NY,
            SalesName,
            CustName,
            ProdTypeName
        }

        #region Property
        /*预算编号*/
        public int SignPremiumBudgetID { get; set; }
        /*客户经理*/
        public string SalesID { get; set; }
        /*客户编号*/
        public string CustomerID { get; set; }
        /*险种*/
        public string ProdTypeID { get; set; }
        /*业务性质*/
        public string OperationType { get; set; }
        /*保费预算*/
        public Double PremiumBudget { get; set; }
        /*佣金预算*/
        public Double ProcessBudget { get; set; }
        /*年月*/
        public string NY { get; set; }
        public string SalesName { get; set; }
        public string CustName { get; set; }
        public string ProdTypeName { get; set; }
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
        /// 保存预算管理
        /// </summary>
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO SignPremiumBudget(SalesID, CustomerID, ProdTypeID, OperationType, PremiumBudget, ProcessBudget, NY) ");
            sb.Append(" VALUES(@SalesID, @CustomerID, @ProdTypeID, @OperationType, @PremiumBudget, @ProcessBudget, @NY)");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@SalesID", DbType.AnsiString, this.SalesID);
            _db.AddInParameter(dbCommand, "@CustomerID", DbType.AnsiString, this.CustomerID);
            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.AnsiString, this.ProdTypeID);
            _db.AddInParameter(dbCommand, "@OperationType", DbType.AnsiString, this.OperationType);
            _db.AddInParameter(dbCommand, "@PremiumBudget", DbType.Double, this.PremiumBudget);
            _db.AddInParameter(dbCommand, "@ProcessBudget", DbType.Double, this.ProcessBudget);
            _db.AddInParameter(dbCommand, "@NY", DbType.AnsiString, this.NY);
            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 修改预算管理
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update SignPremiumBudget ");
            sb.Append("Set SalesID=@SalesID, CustomerID=@CustomerID, ProdTypeID=@ProdTypeID, OperationType=@OperationType, PremiumBudget=@PremiumBudget, ProcessBudget=@ProcessBudget, NY=@NY ");
            sb.Append("Where SignPremiumBudgetID=@SignPremiumBudgetID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@SignPremiumBudgetID", DbType.Int32, this.SignPremiumBudgetID);
            _db.AddInParameter(dbCommand, "@SalesID", DbType.AnsiString, this.SalesID);
            _db.AddInParameter(dbCommand, "@CustomerID", DbType.AnsiString, this.CustomerID);
            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.AnsiString, this.ProdTypeID);
            _db.AddInParameter(dbCommand, "@OperationType", DbType.AnsiString, this.OperationType);
            _db.AddInParameter(dbCommand, "@PremiumBudget", DbType.Double, this.PremiumBudget);
            _db.AddInParameter(dbCommand, "@ProcessBudget", DbType.Double, this.ProcessBudget);
            _db.AddInParameter(dbCommand, "@NY", DbType.AnsiString, this.NY);
            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 删除预算管理
        /// </summary>
        /// <param name="signPremiumBudgetID"></param>
        public static void Delete(int signPremiumBudgetID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM SignPremiumBudget WHERE SignPremiumBudgetID = @SignPremiumBudgetID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@SignPremiumBudgetID", DbType.Int32, signPremiumBudgetID);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 根据查询条件取得预算管理列表
        /// </summary>
        /// <param name="sWhere"></param>
        /// <returns></returns>
        public static DataSet GetConsultFeeList(string sWhere)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ");
            sb.Append("S.SignPremiumBudgetID, P.UserNameCn as SalesName, C.CustName, PT.ProdTypeName, (Case OperationType When '1' Then '新增' When '2' Then '续保' End) As OperationTypeName, S.PremiumBudget, S.ProcessBudget, S.NY ");
            sb.Append("From SignPremiumBudget S (nolock) ");
            sb.Append("Left Join Customer C (nolock) On C.CustID=S.CustomerID ");
            sb.Append("Left Join P_User P (nolock) On P.UserID=S.SalesID ");
            sb.Append("Left Join ProductType PT (nolock) On PT.ProdTypeID=S.ProdTypeID ");
            sb.Append("Where 1=1 ");
            if (sWhere != "")
            {
                sb.Append(sWhere);
            }
            sb.Append(" Order By S.SalesID, S.NY, S.ProdTypeID, S.OperationType");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// 根据预算编号取得预算信息
        /// </summary>
        /// <param name="signPremiumBudgetID"></param>
        /// <returns></returns>
        public static BO_SignPremiumBudget GetConsultFeeByID(int signPremiumBudgetID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select * From SignPremiumBudget (nolock) ");
            sb.Append("Where SignPremiumBudgetID=@SignPremiumBudgetID");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@SignPremiumBudgetID", DbType.Int32, signPremiumBudgetID);

            BO_SignPremiumBudget signPremiumBudget = null;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    signPremiumBudget = new BO_SignPremiumBudget();
                    signPremiumBudget.SignPremiumBudgetID = Utility.GetIntFromReader(reader, FieldList.SignPremiumBudgetID.ToString());
                    signPremiumBudget.SalesID = Utility.GetStringFromReader(reader, FieldList.SalesID.ToString());
                    signPremiumBudget.CustomerID = Utility.GetStringFromReader(reader, FieldList.CustomerID.ToString());
                    signPremiumBudget.ProdTypeID = Utility.GetStringFromReader(reader, FieldList.ProdTypeID.ToString());
                    signPremiumBudget.OperationType = Utility.GetStringFromReader(reader, FieldList.OperationType.ToString());
                    signPremiumBudget.PremiumBudget = Utility.GetDoubleFromReader(reader, FieldList.PremiumBudget.ToString());
                    signPremiumBudget.ProcessBudget = Utility.GetDoubleFromReader(reader, FieldList.ProcessBudget.ToString());
                    signPremiumBudget.NY = Utility.GetStringFromReader(reader, FieldList.NY.ToString());

                    break;
                }
            }

            return signPremiumBudget;
        }
        #endregion

        #region Procedure

        private void FetchByID(int id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ");
            sb.Append("S.SignPremiumBudgetID, S.SalesID, P.UserNameCn as SalesName, S.CustomerID, C.CustName, S.ProdTypeID, PT.ProdTypeName, S.OperationType, S.PremiumBudget, S.ProcessBudget, S.NY ");
            sb.Append("From SignPremiumBudget S (nolock) ");
            sb.Append("Left Join Customer C (nolock) On C.CustID=S.CustomerID ");
            sb.Append("Left Join P_User P (nolock) On P.UserID=S.SalesID ");
            sb.Append("Left Join ProductType PT (nolock) On PT.ProdTypeID=S.ProdTypeID ");
            sb.Append("Where S.SignPremiumBudgetID=@SignPremiumBudgetID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@SignPremiumBudgetID", DbType.Int32, id);

            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    this.SignPremiumBudgetID = Utility.GetIntFromReader(reader, FieldList.SignPremiumBudgetID.ToString());
                    this.SalesID = Utility.GetStringFromReader(reader, FieldList.SalesID.ToString());
                    this.SalesName = Utility.GetStringFromReader(reader, FieldList.SalesName.ToString());
                    this.CustomerID = Utility.GetStringFromReader(reader, FieldList.CustomerID.ToString());
                    this.CustName = Utility.GetStringFromReader(reader, FieldList.CustName.ToString());
                    this.ProdTypeID = Utility.GetStringFromReader(reader, FieldList.ProdTypeID.ToString());
                    this.ProdTypeName = Utility.GetStringFromReader(reader, FieldList.ProdTypeName.ToString());
                    this.OperationType = Utility.GetStringFromReader(reader, FieldList.OperationType.ToString());
                    this.PremiumBudget = Utility.GetDoubleFromReader(reader, FieldList.PremiumBudget.ToString());
                    this.ProcessBudget = Utility.GetDoubleFromReader(reader, FieldList.ProcessBudget.ToString());
                    this.NY = Utility.GetStringFromReader(reader, FieldList.NY.ToString());
                    break;
                }
            }
        }

        #endregion Procedure
    }
}
