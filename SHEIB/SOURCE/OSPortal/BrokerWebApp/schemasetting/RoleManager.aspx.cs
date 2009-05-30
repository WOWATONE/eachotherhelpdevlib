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
    public partial class RoleManager : System.Web.UI.Page
    {

        #region Variables

        private const String gridKeyName = "RoleID";
        private const String viewStateDatalistName = "SearchResultList";
        
        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            
            //

        }



        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            String theID = e.Keys[gridKeyName].ToString();
            BO_P_Role.Delete(theID);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
            
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //  
        }

        protected void gridSearchResult_PageIndexChanged(object sender, EventArgs e)
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
            String filterString="1=1";
            this.gridSearchResult.FilterEnabled = true;

            if (this.dxetxtRoleNo.Text.Trim() != "")
                filterString += " AND [RoleNo] = '" + this.dxetxtRoleNo.Text.Trim() + "'";
            
            if (this.dxetxtRoleName.Text.Trim() != "")
                filterString += " AND [RoleName] like '%" + this.dxetxtRoleName.Text.Trim() + "%'";

            if (filterString != "1=1")
                this.gridSearchResult.FilterExpression = filterString;
            else
                this.gridSearchResult.FilterExpression = "";
        }

        




    }
}
