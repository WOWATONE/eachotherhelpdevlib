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
            String theUserID = e.Keys["UserID"].ToString();
            BO_P_User.Delete(theUserID);
            e.Cancel = true;
            this.gridSearchResult.CancelEdit();
            refreshDataForGrid();
        }

        protected void gridSearchResult_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            //  
        }


        private void GetSearchResultDataForGrid()
        {
            _datalist = BO_P_User.FetchList();
        }


        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            this.gridSearchResult.DataSource = _datalist;
            this.gridSearchResult.DataBind();
            this.gridExport.WriteXlsToResponse();
        }

        protected void gridSearchResult_CustomCallBack(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            refreshDataForGrid();                        
        }


        private void refreshDataForGrid()
        {
            GetSearchResultDataForGrid();
            ViewState[viewStateDatalistName] = _datalist;
            this.gridSearchResult.DataSource = _datalist;
            this.gridSearchResult.DataBind();
        }


    }
}
