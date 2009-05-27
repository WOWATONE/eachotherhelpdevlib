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
    public class BO_P_UserRole : BaseObject
    {

        public BO_P_UserRole() { }

        
        public enum FieldList
        {
            UserRoleID, 
            RoleID, 
            UserID
        }

    }
}
