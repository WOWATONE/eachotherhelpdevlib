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
            AccountTypeID,
            FeeDate,
            Remark,
            CreateTime,
            CreatePerson,
            ModifyTime,
            ModifyPerson,
            AuditStatus,
            AuditTime,
            AuditPerson,
            VoucherNo,
            InvoiceNO,
            ProcessFeeType,
            CarrierID,
            BranchID,
            GatheringType
        }

        #region Property
        public string VoucherId { get; set; }
        public int AccountTypeID { get; set; }
        public DateTime FeeDate { get; set; }
        public string Remark { get; set; }
        public DateTime CreateTime { get; set; }
        public string CreatePerson { get; set; }
        public DateTime ModifyTime { get; set; }
        public string ModifyPerson { get; set; }
        public string AuditStatus { get; set; }
        public DateTime AuditTime { get; set; }
        public string AuditPerson { get; set; }
        public string VoucherNo { get; set; }
        public string InvoiceNO { get; set; }
        public string ProcessFeeType { get; set; }
        public string CarrierID { get; set; }
        public string BranchID { get; set; }
        public string GatheringType { get; set; }


        #endregion Property


        #region Methods


        #endregion Methods


    }
}
