using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace BusinessObjects.Consult
{
    [Serializable()]
    public class BO_ConsultFeeItem : BaseObject
    {
        public BO_ConsultFeeItem() { }

        public BO_ConsultFeeItem(String id)
        {
            //FetchByID(id);
        }

        public enum FieldList
        {
            ConsultFeeItemID,
            ConsultFeeID,
            SerialNumber,
            ConsultFeeItem,
            ConsultFee
        }

        #region Property
        /*咨询项目Guid*/
        public string ConsultFeeItemID { get; set; }
        /*咨询费ID*/
        public string ConsultFeeID { get; set; }
        /*序号*/
        public int SerialNumber { get; set; }
        /*咨询项目*/
        public string ConsultFeeItem { get; set; }
        /*咨询费*/
        public Double ConsultFee { get; set; }
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
        /// 保存咨询费项目信息
        /// </summary>
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO ConsultFeeItem(ConsultFeeID, ConsultFeeItem, ConsultFee) ");
            sb.Append(" VALUES( @ConsultFeeID, @ConsultFeeItem, @ConsultFee)");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ConsultFeeID", DbType.AnsiString, this.ConsultFeeID);
            _db.AddInParameter(dbCommand, "@ConsultFeeItem", DbType.AnsiString, this.ConsultFeeItem);
            _db.AddInParameter(dbCommand, "@ConsultFee", DbType.Double, this.ConsultFee);

            _db.ExecuteNonQuery(dbCommand);
        }

        public void delete(string consultFeeItemID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Delete from ConsultFeeItem  ");
            sb.Append("Where  ConsultFeeItemID = @ConsultFeeItemID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ConsultFeeItemID", DbType.Int16, int.Parse(consultFeeItemID));

            _db.ExecuteNonQuery(dbCommand);
        }

        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update ConsultFeeItem set  ConsultFeeItem =@ConsultFeeItem , ConsultFee=@ConsultFee  ");
            sb.Append("Where ConsultFeeItemID = @ConsultFeeItemID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ConsultFeeItemID", DbType.Int16, int.Parse(this.ConsultFeeItemID));
            _db.AddInParameter(dbCommand, "@ConsultFeeItem", DbType.AnsiString, this.ConsultFeeItem);
            _db.AddInParameter(dbCommand, "@ConsultFee", DbType.Double, this.ConsultFee);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 根据ConsultFeeID取得咨询费项目信息
        /// </summary>
        /// <param name="consultFeeID"></param>
        /// <returns></returns>
        public static DataTable GetConsultFeeItemByConsultFeeID(string consultFeeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ConsultFeeItemID, SerialNumber, ConsultFeeItem, ConsultFee ");
            sb.Append("From ConsultFeeItem (nolock) ");
            sb.Append("Where ConsultFeeID=@ConsultFeeID ");
            sb.Append("Order By SerialNumber");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ConsultFeeID", DbType.AnsiString, consultFeeID);

            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];
            value.PrimaryKey = new DataColumn[] { value.Columns["ConsultFeeItemID"] };
            return value;
        }

        /// <summary>
        /// 根据ConsultFeeID清除咨询费项目信息
        /// </summary>
        /// <param name="consultFeeID"></param>
        public static void ClearConsultFeeItemByConsultFeeID(string consultFeeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Delete From ConsultFeeItem Where ConsultFeeID=@ConsultFeeID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ConsultFeeID", DbType.AnsiString, consultFeeID);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 判断是否存在咨询项目Guid
        /// </summary>
        /// <param name="consultFeeNo"></param>
        /// <returns></returns>
        public static bool IfExistsConsultFeeItemID(string consultFeeItemID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ConsultFeeItemID From ConsultFeeItem (nolock) ");
            sb.Append("Where ConsultFeeItemID=@ConsultFeeItemID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ConsultFeeItemID", DbType.AnsiString, consultFeeItemID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }
        #endregion
    }
}
