﻿using System;
using System.Collections.Generic;
//using System.Linq;
using System.Text;

using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;

namespace BusinessObjects
{
    public class BaseObject
    {
        #region Variable

        protected static Database _db = DataService.DB;
        protected static Int32 IdentityInitialValue = 0;

        #endregion Variable
    }
}
