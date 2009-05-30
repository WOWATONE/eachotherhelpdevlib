using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BrokerWebApp.BaseClass;
using System.Data;
using BusinessObjects;

namespace BrokerWebApp.schemasetting
{
    public partial class UserManager : BasePage
    {
        #region Variables

        private const String gridKeyName = "UserID";
        
        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            //
        }
        

        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String theUserID = e.Keys[gridKeyName].ToString();
            BO_P_User.Delete(theUserID);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
            
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //  
        }

        protected void gridSearchResult_CustomCallBack(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            //                       
        }
                
        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.gridExport.WriteXlsToResponse();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //add filter expression
        }

        

    }
}
