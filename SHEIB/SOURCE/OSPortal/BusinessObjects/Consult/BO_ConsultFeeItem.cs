using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace BusinessObjects.Consult
{
    [Serializable()]
    public class BO_ConsultFeeItem : BaseObject
    {
        public BO_ConsultFeeItem() { }

        public BO_ConsultFeeItem(String id)
        {
            //FetchByID(id);
        }

        public enum FieldList
        {
            ConsultFeeItemID,
            ConsultFeeID,
            SerialNumber,
            ConsultFeeItem,
            ConsultFee
        }

        #region Property
        /*咨询项目Guid*/
        public string ConsultFeeItemID { get; set; }
        /*咨询费ID*/
        public string ConsultFeeID { get; set; }
        /*序号*/
        public int SerialNumber { get; set; }
        /*咨询项目*/
        public string ConsultFeeItem { get; set; }
        /*咨询费*/
        public Double ConsultFee { get; set; }
        #endregion

        #region Methods
        public void Save(ModifiedAction action)
        {
            if (action == ModifiedAction.Insert)
            {
                //add();
            }
            else if (action == ModifiedAction.Update)
            {
                //update();
            }
        }


        #endregion
    }
}
