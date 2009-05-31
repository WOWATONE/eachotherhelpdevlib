using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessObjects
{
    [Serializable()]
    public class BO_P_Customer : BaseObject
    {
        public BO_P_Customer() { }

        public enum FieldList
        {
            CustID,
            CustName,
            Area,
            Plate,
            Address,
            PostCode,
            TradeType,
            IDNO,
            Contact,
            Tel,
            Mobile,
            Fax,
            Email,
            Sales
        }
    }
}
