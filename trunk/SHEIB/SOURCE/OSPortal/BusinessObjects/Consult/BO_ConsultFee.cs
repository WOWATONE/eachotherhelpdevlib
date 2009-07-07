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
                //add();
            }
            else if (action == ModifiedAction.Update)
            {
                //update();
            }
        }

        /// <summary>
        /// 删除咨询费信息
        /// </summary>
        /// <param name="consultFeeID"></param>
        public static void Delete(string consultFeeID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM ConsultFee ");
            sb.Append(" WHERE ConsultFeeID = @ConsultFeeID ");

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
            sb.Append("CF.ConsultFeeID, CF.ConsultFeeNo, isnull(CF.ConsultDate,'') as ConsultDate, C.CustName, P.UserNameCn as SalesName, CF.Contact, CF.Tel, CF.ConsultFee, CF.InvoiceNO, '未审核' as AuditStatus "); //?//
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
        /// 根据咨询号取得咨询信息
        /// </summary>
        /// <param name="consultFeeNo"></param>
        /// <returns></returns>
        public static BO_ConsultFee GetConsultFeeByID(string consultFeeNo)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select * From ConsultFee (nolock) ");
            sb.Append("Where ConsultFeeNo=@ConsultFeeNo");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ConsultFeeNo", DbType.AnsiString, consultFeeNo);

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
        #endregion
    }
}
