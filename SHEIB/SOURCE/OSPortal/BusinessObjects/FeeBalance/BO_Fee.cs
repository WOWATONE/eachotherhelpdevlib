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
            FeeAdjust,
            FeeRemark,
            CreateTime,
            CreatePerson,
            ModifyTime,
            ModifyPerson,
            AuditStatus,
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
        public Double FeeAdjust { get; set; }
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
        public int AuditStatus { get; set; }
        /*审核时间*/
        public DateTime AuditTime { get; set; }
        /*审核人*/
        public string AuditPerson { get; set; }

        #endregion Property


    }
}
