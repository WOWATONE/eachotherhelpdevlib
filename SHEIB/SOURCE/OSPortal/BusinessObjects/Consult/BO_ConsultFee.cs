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
    public class BO_ConsultFee : BaseObject
    {
        public BO_ConsultFee() { }

        public BO_ConsultFee(String id)
        {
            //FetchByID(id);
        }

        public enum FieldList
        {
            ConsultFeeID,
            ConsultFeeNo,
            ConsultDate,
            SalesID,
            CustID,
            Contact,
            Tel,
            ConsultFee,
            InvoiceNO,
            AuditTime,
            AuditPerson,
            CreateTime,
            CreatePerson,
            ModifyTime,
            ModifyPerson,
            FeeDate,
            FeePersion
        }

        #region Property
        /*咨询编号*/
        public string ConsultFeeID { get; set; }
        /*咨询号*/
        public string ConsultFeeNo { get; set; }
        /*咨询日期*/
        public DateTime ConsultDate { get; set; }
        /*客户经理*/
        public string SalesID { get; set; }
        /*客户*/
        public string CustID { get; set; }
        /*联系人*/
        public string Contact { get; set; }
        /*联系方式*/
        public string Tel { get; set; }
        /*咨询费(总)*/
        public Double ConsultFee { get; set; }
        /*发票号*/
        public string InvoiceNO { get; set; }
        /*审核人*/
        public DateTime AuditTime { get; set; }
        /*审核人*/
        public string AuditPerson { get; set; }
        /*单据创建时间*/
        public DateTime CreateTime { get; set; }
        /*单据创建人*/
        public string CreatePerson { get; set; }
        /*修改时间*/
        public DateTime ModifyTime { get; set; }
        /*修改人*/
        public string ModifyPerson { get; set; }
        /*收费日期*/
        public DateTime FeeDate { get; set; }
        /*收费人*/
        public string FeePersion { get; set; }
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
        /// 保存咨询信息
        /// </summary>
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO ConsultFee(ConsultFeeID, ConsultFeeNo, ConsultDate, SalesID, CustID, Contact, Tel, ConsultFee, InvoiceNO, AuditTime, AuditPerson, CreateTime, CreatePerson, ModifyTime, ModifyPerson, FeeDate, FeePersion) ");
            sb.Append(" VALUES(@ConsultFeeID, @ConsultFeeNo, @ConsultDate, @SalesID, @CustID, @Contact, @Tel, @ConsultFee, @InvoiceNO, @AuditTime, @AuditPerson, @CreateTime, @CreatePerson, @ModifyTime, @ModifyPerson, @FeeDate, @FeePersion)");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ConsultFeeID", DbType.AnsiString, this.ConsultFeeID);
            _db.AddInParameter(dbCommand, "@ConsultFeeNo", DbType.AnsiString, this.ConsultFeeNo);
            _db.AddInParameter(dbCommand, "@ConsultDate", DbType.DateTime, this.ConsultDate);
            _db.AddInParameter(dbCommand, "@SalesID", DbType.AnsiString, this.SalesID);
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, this.CustID);
            _db.AddInParameter(dbCommand, "@Contact", DbType.AnsiString, this.Contact);
            _db.AddInParameter(dbCommand, "@Tel", DbType.AnsiString, this.Tel);
            _db.AddInParameter(dbCommand, "@ConsultFee", DbType.Double, this.ConsultFee);
            _db.AddInParameter(dbCommand, "@InvoiceNO", DbType.AnsiString, this.InvoiceNO);
            if (this.AuditTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, DBNull.Value);
            else
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, this.AuditTime);
            _db.AddInParameter(dbCommand, "@AuditPerson", DbType.AnsiString, this.AuditPerson);
            _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, this.CreateTime);
            _db.AddInParameter(dbCommand, "@CreatePerson", DbType.AnsiString, this.CreatePerson);
            _db.AddInParameter(dbCommand, "@ModifyTime", DbType.DateTime, this.ModifyTime);
            _db.AddInParameter(dbCommand, "@ModifyPerson", DbType.AnsiString, this.ModifyPerson);
            _db.AddInParameter(dbCommand, "@FeeDate", DbType.DateTime, this.FeeDate);
            _db.AddInParameter(dbCommand, "@FeePersion", DbType.AnsiString, this.FeePersion);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 修改咨询信息
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update ConsultFee ");
            sb.Append("Set ConsultFeeNo=@ConsultFeeNo, ConsultDate=@ConsultDate, SalesID=@SalesID, CustID=@CustID, Contact=@Contact, Tel=@Tel, ConsultFee=@ConsultFee, InvoiceNO=@InvoiceNO, ");
            sb.Append("AuditTime=@AuditTime, AuditPerson=@AuditPerson, CreateTime=@CreateTime, CreatePerson=@CreatePerson, ModifyTime=@ModifyTime, ModifyPerson=@ModifyPerson, FeeDate=@FeeDate, FeePersion=@FeePersion ");
            sb.Append("Where ConsultFeeID=@ConsultFeeID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ConsultFeeID", DbType.AnsiString, this.ConsultFeeID);
            _db.AddInParameter(dbCommand, "@ConsultFeeNo", DbType.AnsiString, this.ConsultFeeNo);
            _db.AddInParameter(dbCommand, "@ConsultDate", DbType.DateTime, this.ConsultDate);
            _db.AddInParameter(dbCommand, "@SalesID", DbType.AnsiString, this.SalesID);
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, this.CustID);
            _db.AddInParameter(dbCommand, "@Contact", DbType.AnsiString, this.Contact);
            _db.AddInParameter(dbCommand, "@Tel", DbType.AnsiString, this.Tel);
            _db.AddInParameter(dbCommand, "@ConsultFee", DbType.Double, this.ConsultFee);
            _db.AddInParameter(dbCommand, "@InvoiceNO", DbType.AnsiString, this.InvoiceNO);
            if (this.AuditTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, DBNull.Value);
            else
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, this.AuditTime);
            _db.AddInParameter(dbCommand, "@AuditPerson", DbType.AnsiString, this.AuditPerson);
            _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, this.CreateTime);
            _db.AddInParameter(dbCommand, "@CreatePerson", DbType.AnsiString, this.CreatePerson);
            _db.AddInParameter(dbCommand, "@ModifyTime", DbType.DateTime, this.ModifyTime);
            _db.AddInParameter(dbCommand, "@ModifyPerson", DbType.AnsiString, this.ModifyPerson);
            _db.AddInParameter(dbCommand, "@FeeDate", DbType.DateTime, this.FeeDate);
            _db.AddInParameter(dbCommand, "@FeePersion", DbType.AnsiString, this.FeePersion);


            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 删除咨询费信息
        /// </summary>
        /// <param name="consultFeeID"></param>
        public static void Delete(string consultFeeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM ConsultFee WHERE ConsultFeeID = @ConsultFeeID ");
            sb.Append("DELETE FROM ConsultFeeItem WHERE ConsultFeeID = @ConsultFeeID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ConsultFeeID", DbType.AnsiString, consultFeeID);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 根据查询条件取得咨询费列表
        /// </summary>
        /// <param name="sWhere"></param>
        /// <returns></returns>
        public static DataSet GetConsultFeeList(string sWhere)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ");
            sb.Append("CF.ConsultFeeID, CF.ConsultFeeNo, CF.ConsultDate, C.CustName, P.UserNameCn as SalesName, CF.Contact, CF.Tel, CF.ConsultFee, CF.InvoiceNO, '未审核' as AuditStatus "); //?//
            sb.Append("From ConsultFee CF (nolock) ");
            sb.Append("Left Join Customer C (nolock) On C.CustID=CF.CustID ");
            sb.Append("Left Join P_User P (nolock) On P.UserID=C.SalesID ");
            sb.Append("Where 1=1 ");
            if (sWhere != "")
            {
                sb.Append(sWhere);
            }
            sb.Append(" Order By CF.ConsultFeeID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// 根据咨询ID取得咨询信息
        /// </summary>
        /// <param name="consultFeeID"></param>
        /// <returns></returns>
        public static BO_ConsultFee GetConsultFeeByID(string consultFeeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select * From ConsultFee (nolock) ");
            sb.Append("Where ConsultFeeID=@ConsultFeeID");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ConsultFeeID", DbType.AnsiString, consultFeeID);

            BO_ConsultFee consultFee = null;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    consultFee = new BO_ConsultFee();

                    consultFee.ConsultFeeID = Utility.GetStringFromReader(reader, FieldList.ConsultFeeID.ToString());
                    consultFee.ConsultFeeNo = Utility.GetStringFromReader(reader, FieldList.ConsultFeeNo.ToString());
                    consultFee.ConsultDate = Utility.GetDatetimeFromReader(reader, FieldList.ConsultDate.ToString());
                    consultFee.SalesID = Utility.GetStringFromReader(reader, FieldList.SalesID.ToString());
                    consultFee.CustID = Utility.GetStringFromReader(reader, FieldList.CustID.ToString());
                    consultFee.Contact = Utility.GetStringFromReader(reader, FieldList.Contact.ToString());
                    consultFee.Tel = Utility.GetStringFromReader(reader, FieldList.Tel.ToString());
                    consultFee.ConsultFee = Utility.GetDoubleFromReader(reader, FieldList.ConsultFee.ToString());
                    consultFee.InvoiceNO = Utility.GetStringFromReader(reader, FieldList.InvoiceNO.ToString());
                    consultFee.AuditTime = Utility.GetDatetimeFromReader(reader, FieldList.AuditTime.ToString());
                    consultFee.AuditPerson = Utility.GetStringFromReader(reader, FieldList.AuditPerson.ToString());
                    consultFee.CreateTime = Utility.GetDatetimeFromReader(reader, FieldList.CreateTime.ToString());
                    consultFee.CreatePerson = Utility.GetStringFromReader(reader, FieldList.CreatePerson.ToString());
                    consultFee.ModifyTime = Utility.GetDatetimeFromReader(reader, FieldList.ModifyTime.ToString());
                    consultFee.ModifyPerson = Utility.GetStringFromReader(reader, FieldList.ModifyPerson.ToString());
                    consultFee.FeeDate = Utility.GetDatetimeFromReader(reader, FieldList.FeeDate.ToString());
                    consultFee.FeePersion = Utility.GetStringFromReader(reader, FieldList.FeePersion.ToString());

                    break;
                }
            }

            return consultFee;
        }

        /// <summary>
        /// 判断是否存在咨询号
        /// </summary>
        /// <param name="consultFeeNo"></param>
        /// <returns></returns>
        public static bool IfExistsConsultFeeNo(string consultFeeNo)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ConsultFeeNo From ConsultFee (nolock) ");
            sb.Append("Where ConsultFeeNo=@ConsultFeeNo");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ConsultFeeNo", DbType.AnsiString, consultFeeNo);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 根据ConsultFeeID取得ConsultFeeNo
        /// </summary>
        /// <param name="consultFeeNo"></param>
        /// <returns></returns>
        public static string GetConsultFeeNoByConsultFeeID(string consultFeeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ConsultFeeNo From ConsultFee Where ConsultFeeID=@ConsultFeeID");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ConsultFeeID", DbType.AnsiString, consultFeeID);

            object value = _db.ExecuteScalar(dbCommand);
            if (value == null || value == DBNull.Value)
                return "";
            else
                return value.ToString();
        }
        #endregion
    }
}
