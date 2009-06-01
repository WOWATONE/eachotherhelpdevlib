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
    public class BO_Fee : BaseObject
    {


        public BO_Fee() { }

        public enum FieldList
        {
            FeeId,
            PolPeriodID,
            VoucherID,
            FeeDate,
            FeeTypeId,
            AccountTypeId,
            CurCode,
            Fee,
            FeeBase,
            FeeRemark,
            CreateTime,
            CreatePerson,
            ModifyTime,
            ModifyPerson,
            FlagAudited,
            AuditTime,
            AuditPerson
        }

        #region Property

        /*费用GUID*/
        public string FeeId { get; set; }
        /*保单分期GUID*/
        public string PolPeriodID { get; set; }
        /*凭证GUID*/
        public string VoucherID { get; set; }
        /*收费日期*/
        public DateTime FeeDate { get; set; }
        /*收费方式*/
        public int FeeTypeId { get; set; }
        /*收付类别*/
        public int AccountTypeId { get; set; }
        /*币种*/
        public string CurCode { get; set; }
        /*实收费用*/
        public Double Fee { get; set; }
        /*费用本位币*/
        public Double FeeBase { get; set; }
        /*备注*/
        public string FeeRemark { get; set; }
        /*创建日期*/
        public DateTime CreateTime { get; set; }
        /*创建人*/
        public string CreatePerson { get; set; }
        /*修改日期*/
        public DateTime ModifyTime { get; set; }
        /*修改人*/
        public string ModifyPerson { get; set; }
        /*是否审核*/
        public int FlagAudited { get; set; }
        /*审核时间*/
        public DateTime AuditTime { get; set; }
        /*审核人*/
        public string AuditPerson { get; set; }

        #endregion Property


        #region Methods

        public static List<BO_Fee> FetchList()
        {
            List<BO_Fee> list = new List<BO_Fee>();

            StringBuilder sb = new StringBuilder();
            sb.Append("select ");
            sb.Append("FeeId,PolPeriodID,VoucherID,FeeDate,FeeTypeId,AccountTypeId,CurCode,Fee,");
            sb.Append("FeeBase,FeeRemark,CreateTime,CreatePerson,ModifyTime,ModifyPerson,FlagAudited,AuditTime,AuditPerson ");
            sb.Append("FROM Fee ");


            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_Fee newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_Fee();

                    newObj.FeeId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.FeeId));
                    newObj.PolPeriodID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolPeriodID));
                    newObj.VoucherID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.VoucherID));
                    newObj.FeeDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.FeeDate));
                    newObj.FeeTypeId = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.FeeTypeId));

                    newObj.AccountTypeId = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.AccountTypeId));
                    newObj.CurCode = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CurCode));
                    newObj.Fee = Utility.GetDoubleFromReader(reader, Convert.ToInt32(FieldList.Fee));
                    newObj.FeeBase = Utility.GetDoubleFromReader(reader, Convert.ToInt32(FieldList.FeeBase));
                    newObj.FeeRemark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.FeeRemark));
                    newObj.CreateTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.CreateTime));
                    newObj.CreatePerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CreatePerson));
                    newObj.ModifyTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.ModifyTime));
                    newObj.ModifyPerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ModifyPerson));
                    newObj.FlagAudited = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.FlagAudited));
                    newObj.AuditTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.AuditTime));
                    newObj.AuditPerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AuditPerson));




                    list.Add(newObj);
                }
            }

            return list;
        }


        #endregion Methods


    }
}
