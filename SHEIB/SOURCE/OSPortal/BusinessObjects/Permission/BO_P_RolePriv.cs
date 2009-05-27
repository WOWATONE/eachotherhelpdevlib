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
    public class BO_P_RolePriv : BaseObject
    {

        public BO_P_RolePriv() { }

        
        public enum FieldList
        {
            RolePrivID, 
            RoleID, 
            MenuID, 
            PrivID
        }

    }
}
