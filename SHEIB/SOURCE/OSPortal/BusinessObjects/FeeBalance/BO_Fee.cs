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
            VoucherID,
            PolPeriodID,
            Fee,
            FeeAdjust
        }

        #region Property
        public string FeeId { get; set; }
        public string VoucherID { get; set; }
        public string PolPeriodID { get; set; }
        public Double Fee { get; set; }
        public Double FeeAdjust { get; set; }


        #endregion Property


    }
}
