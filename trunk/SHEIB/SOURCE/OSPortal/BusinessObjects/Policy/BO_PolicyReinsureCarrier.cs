using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Runtime.Serialization;

namespace BusinessObjects.Policy
{
    [Serializable()]
    public class BO_PolicyReinsureCarrier : BaseObject
    {
        public BO_PolicyReinsureCarrier() { }

        #region Variables

        public enum FieldList
        {
            DeptID,
            DeptName,
            ShortName,
            Manager,
            ParentID,
            Tel,
            Fax
        }

        #endregion Variables


            #region Property

            #endregion Property


            #region Methods
            #endregion Methods
    }
}
