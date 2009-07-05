using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BrokerWebApp.vehicleinsurance
{
    public partial class CarPolicyList : BasePage
    {
        #region Variables

        private DataTable _dtGridAskPrice;

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            GetAskPriceDataForGrid();

            this.gridSearchResult.DataSource = _dtGridAskPrice;

            if (!IsPostBack && !IsCallback)
                this.gridSearchResult.DataBind();
        }


        private void GetAskPriceDataForGrid()
        {
            _dtGridAskPrice = new DataTable();
            _dtGridAskPrice.PrimaryKey = new DataColumn[] { 
            _dtGridAskPrice.Columns.Add("PrePolicyNo", typeof(String)) };

            _dtGridAskPrice.Columns.Add("F1", typeof(String));
            _dtGridAskPrice.Columns.Add("F2", typeof(String));
            _dtGridAskPrice.Columns.Add("F3", typeof(String));
            _dtGridAskPrice.Columns.Add("F4", typeof(String));
            _dtGridAskPrice.Columns.Add("F5", typeof(String));

            _dtGridAskPrice.Columns.Add("F6", typeof(String));
            _dtGridAskPrice.Columns.Add("F7", typeof(String));
            _dtGridAskPrice.Columns.Add("F8", typeof(DateTime));
            _dtGridAskPrice.Columns.Add("F9", typeof(String));
            _dtGridAskPrice.Columns.Add("F10", typeof(Decimal));

            _dtGridAskPrice.Columns.Add("F11", typeof(Decimal));
            _dtGridAskPrice.Columns.Add("F12", typeof(Decimal));
            _dtGridAskPrice.Columns.Add("F13", typeof(Decimal));
            _dtGridAskPrice.Columns.Add("F14", typeof(Decimal));
            _dtGridAskPrice.Columns.Add("F15", typeof(Decimal));
            _dtGridAskPrice.Columns.Add("F16", typeof(Decimal));


            _dtGridAskPrice.Rows.Add(new object[] { "1", "1", "1",
                "平安保险", "上海平安", "7001", "王怡", "经理", 
                new DateTime(DateTime.Now.Year-1,DateTime.Now.Month,DateTime.Now.Day,1,1,1),
                "来源",
                1000, 2000, 3000, 6000, 500, 600,1100
            });


            _dtGridAskPrice.Rows.Add(new object[] { "2", "2", "2",
               "平安保险", "上海平安", "7001", "王怡-1", "经理", 
                new DateTime(DateTime.Now.Year-1,DateTime.Now.Month,DateTime.Now.Day,1,1,1),
                "来源",
                1000, 2000, 3000, 6000, 500, 600,1100
            });

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



    }
}
