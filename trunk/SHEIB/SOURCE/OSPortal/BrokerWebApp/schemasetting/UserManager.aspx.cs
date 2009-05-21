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
        private const String  viewStateDatalistName = "SearchResultList";
        private List<BO_P_User> _datalist;

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState[viewStateDatalistName] == null)
            {
                GetSearchResultDataForGrid();
                ViewState[viewStateDatalistName] = _datalist;
            }
            else
            {
                _datalist = ViewState[viewStateDatalistName] as List<BO_P_User>;
            }

            if (!IsPostBack && !IsCallback)
            {
                this.gridSearchResult.DataSource = _datalist;
                this.gridSearchResult.DataBind();
            }

        }



        protected void gridSearchResult_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            //DataTable dt = ((DataTable)ViewState["PolicyItemGridData"]);
            //DataRow row = dt.Rows.Find(e.Keys["ID"]);
            //dt.Rows.Remove(row);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridSearchResult.DataBind();
        }


        private void GetSearchResultDataForGrid()
        {
            _datalist = BO_P_User.FetchList();
        }
    }
}
