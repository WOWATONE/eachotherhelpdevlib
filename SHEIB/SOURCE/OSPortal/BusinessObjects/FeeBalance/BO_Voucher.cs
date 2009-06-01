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
    public class BO_Voucher : BaseObject
    {


        public BO_Voucher() { }

        public enum FieldList
        {
            VoucherId,
            VoucherNo,
            AccountTypeID,
            FeeDate,
            Fee,
            FeeBase,
            Remark,
            CreateTime,
            CreatePerson,
            ModifyTime,
            ModifyPerson,
            FlagAudited,
            AuditTime,
            AuditPerson,
            InvoiceNO,
        }

        #region Property
        /*凭证编号*/
        public string VoucherId { get; set; }
        /*收据号*/
        public string VoucherNo { get; set; }
        /*收付类别*/
        public int AccountTypeID { get; set; }
        /*收费日期*/
        public DateTime FeeDate { get; set; }
        /*费用*/
        public Double Fee { get; set; }
        /*费用本位币*/
        public Double FeeBase { get; set; }
        /*备注*/
        public string Remark { get; set; }
        /*创建时间*/
        public DateTime CreateTime { get; set; }
        /*创建人*/
        public string CreatePerson { get; set; }
        /*修改人*/
        public DateTime ModifyTime { get; set; }
        /*修改人*/
        public string ModifyPerson { get; set; }
        /*审核标志*/
        public int FlagAudited { get; set; }
        /*审核时间*/
        public DateTime AuditTime { get; set; }
        /*审核人*/
        public string AuditPerson { get; set; }
        /*发票号码*/
        public string InvoiceNO { get; set; }

        #endregion Property


        #region Methods

        public static List<BO_Voucher> FetchList()
        {
            List<BO_Voucher> list = new List<BO_Voucher>();

            StringBuilder sb = new StringBuilder();
            sb.Append("select ");
            sb.Append("VoucherId,VoucherNo,AccountTypeID,FeeDate,Fee,FeeBase,Remark,CreateTime,CreatePerson,ModifyTime,ModifyPerson,FlagAudited,AuditTime,AuditPerson,InvoiceNO");
            sb.Append("FROM Fee ");


            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_Voucher newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_Voucher();
                    newObj.VoucherId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.VoucherId));
                    newObj.VoucherNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.VoucherNo));
                    newObj.AccountTypeID = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.AccountTypeID));
                    newObj.FeeDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.FeeDate));
                    newObj.Fee = Utility.GetDoubleFromReader(reader, Convert.ToInt32(FieldList.Fee));
                    newObj.FeeBase = Utility.GetDoubleFromReader(reader, Convert.ToInt32(FieldList.FeeBase));
                    newObj.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                    newObj.CreateTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.CreateTime));
                    newObj.CreatePerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CreatePerson));
                    newObj.ModifyTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.ModifyTime));
                    newObj.ModifyPerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ModifyPerson));
                    newObj.FlagAudited = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.FlagAudited));
                    newObj.AuditTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.AuditTime));
                    newObj.AuditPerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AuditPerson));
                    newObj.InvoiceNO = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.InvoiceNO));

                    list.Add(newObj);
                }
            }

            return list;
        }


        #endregion Methods


    }
}
