using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace OSPortalWebApp.vehicleinsurance
{
    public partial class CarPolicyInputList : System.Web.UI.Page
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

            _dtGridAskPrice.Columns.Add("SalesId", typeof(String));
            _dtGridAskPrice.Columns.Add("UserNameCn", typeof(String));
            _dtGridAskPrice.Columns.Add("CarrierID", typeof(String));
            _dtGridAskPrice.Columns.Add("CarrierNameCn", typeof(String));

            _dtGridAskPrice.Columns.Add("BranchID", typeof(String));
            _dtGridAskPrice.Columns.Add("BranchName", typeof(String));

            _dtGridAskPrice.Columns.Add("CarCount", typeof(Int32));

            _dtGridAskPrice.Columns.Add("CiPremium", typeof(Decimal));
            _dtGridAskPrice.Columns.Add("AciPremium", typeof(Decimal));
            _dtGridAskPrice.Columns.Add("CstPremium", typeof(Decimal));
            _dtGridAskPrice.Columns.Add("PremiumTotal", typeof(Decimal));

            _dtGridAskPrice.Columns.Add("CiProcess", typeof(Decimal));
            _dtGridAskPrice.Columns.Add("AciProcess", typeof(Decimal));
            _dtGridAskPrice.Columns.Add("CstProcess", typeof(Decimal));
            _dtGridAskPrice.Columns.Add("ProcessTotal", typeof(Decimal));


            _dtGridAskPrice.Columns.Add("Currency", typeof(String));
            _dtGridAskPrice.Columns.Add("Premium", typeof(Decimal));

            _dtGridAskPrice.Columns.Add("CustomerID", typeof(String));
            _dtGridAskPrice.Columns.Add("CustName", typeof(String));
            _dtGridAskPrice.Columns.Add("CreatePerson", typeof(String));
            _dtGridAskPrice.Columns.Add("CreateTime", typeof(DateTime));
            _dtGridAskPrice.Columns.Add("SourceTypeID", typeof(String));
            _dtGridAskPrice.Columns.Add("SourceTypeName", typeof(String));


            _dtGridAskPrice.Columns.Add("OperationTypeID", typeof(String));
            _dtGridAskPrice.Columns.Add("OperationTypeName", typeof(String));
            _dtGridAskPrice.Columns.Add("GatheringTypeID", typeof(String));
            _dtGridAskPrice.Columns.Add("GatheringTypeName", typeof(String));


            _dtGridAskPrice.Columns.Add("StartDate", typeof(DateTime));
            _dtGridAskPrice.Columns.Add("EndDate", typeof(DateTime));
            _dtGridAskPrice.Columns.Add("CheckMemo", typeof(String));


            _dtGridAskPrice.Rows.Add(new object[] { "1", "1",
                "王怡", "1", "平安保险", "1", "上海平安", 
                5, 5000, 4000, 3000, 12000,
                50, 40, 30, 120, 
                "人民币", 8000, "0001", "王海", 
                "王五",
                new DateTime(DateTime.Now.Year-1,DateTime.Now.Month,DateTime.Now.Day,1,1,1),
                "1", "来源", "1", "新增", "1", "支票", 
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1), 
                new DateTime(DateTime.Now.Year+1,DateTime.Now.Month,DateTime.Now.Day,1,1,1),
                "备注"
            });


            _dtGridAskPrice.Rows.Add(new object[] { "2", "2",
                "王怡-1", "1", "平安保险", "1", "上海平安", 
                5, 5000, 4000, 3000, 12000,
                50, 40, 30, 120, 
                "人民币", 8000, "0001", "王海-1", 
                "王五",
                new DateTime(DateTime.Now.Year-1,DateTime.Now.Month,DateTime.Now.Day,1,1,1),
                "1", "来源", "1", "新增", "1", "支票", 
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1), 
                new DateTime(DateTime.Now.Year+1,DateTime.Now.Month,DateTime.Now.Day,1,1,1),
                "备注"
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
