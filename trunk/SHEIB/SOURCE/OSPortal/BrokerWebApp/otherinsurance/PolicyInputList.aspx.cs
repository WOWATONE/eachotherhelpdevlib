using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BrokerWebApp.otherinsurance
{
 
    public partial class PolicyInputList : System.Web.UI.Page
    {

        #region Variables

        private DataTable _dtGrid;

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["GridData"] == null)
            {
                GetPolicyItemDataForGrid();
                ViewState["GridData"] = _dtGrid;
            }

            this.gridSearchResult.DataSource = ViewState["GridData"];

            if (!IsPostBack && !IsCallback)
                this.gridSearchResult.DataBind();
        }



        private void GetPolicyItemDataForGrid()
        {
            _dtGrid = new DataTable();
            _dtGrid.PrimaryKey = new DataColumn[] { 
            _dtGrid.Columns.Add("PolicyNo", typeof(Int32)) };

            _dtGrid.Columns.Add("PrePolicyNo", typeof(Int32));
            _dtGrid.Columns.Add("SalesId", typeof(Int32));
            _dtGrid.Columns.Add("Sales", typeof(String));

            _dtGrid.Columns.Add("CarrierId", typeof(Int32));
            _dtGrid.Columns.Add("Carrier", typeof(String));

            _dtGrid.Columns.Add("BranchId", typeof(Int32));
            _dtGrid.Columns.Add("Branch", typeof(String));

            _dtGrid.Columns.Add("ProdTypeID", typeof(Int32));
            _dtGrid.Columns.Add("ProdType", typeof(String));

            _dtGrid.Columns.Add("Coverage", typeof(Double));
            _dtGrid.Columns.Add("Premium", typeof(Double));
            _dtGrid.Columns.Add("Process", typeof(Double));
            _dtGrid.Columns.Add("Currency", typeof(String));
            _dtGrid.Columns.Add("PremiumBase", typeof(Double));
            _dtGrid.Columns.Add("ProcessBase", typeof(Double));

            _dtGrid.Columns.Add("CustomerID", typeof(Int32));
            _dtGrid.Columns.Add("Customer", typeof(String));
            _dtGrid.Columns.Add("CreatePerson", typeof(String));
            _dtGrid.Columns.Add("CreateTime", typeof(DateTime));
            _dtGrid.Columns.Add("SourceTypeID", typeof(Int32));
            _dtGrid.Columns.Add("SourceType", typeof(String));
            _dtGrid.Columns.Add("FlagContinueID", typeof(Int32));
            _dtGrid.Columns.Add("FlagContinue", typeof(String));
            _dtGrid.Columns.Add("GatheringTypeID", typeof(Int32));
            _dtGrid.Columns.Add("GatheringType", typeof(String));
            _dtGrid.Columns.Add("StartDate", typeof(DateTime));
            _dtGrid.Columns.Add("EndDate", typeof(DateTime));
            _dtGrid.Columns.Add("CheckMemo", typeof(String));


            _dtGrid.Rows.Add(new object[] { 1, 1,
                1, "王怡", 1, "平安保险", 1, "上海平安", 
                1, "盛世寿险", 5000, 5000,5000, "人民币",
                500, 300, 1, "王五", "王海", new DateTime(DateTime.Now.Year-1,DateTime.Now.Month,DateTime.Now.Day,1,1,1),
                1, "来源", 1, "新增", 1, "支票", 
                new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day,1,1,1), 
                new DateTime(DateTime.Now.Year+1,DateTime.Now.Month,DateTime.Now.Day,1,1,1),
                "备注"
            });

            DataRow dr = _dtGrid.NewRow();
            dr[0] = 2;
            dr[1] = 2;
            dr[2] = 2;
            dr[3] = "王怡";
            dr[4] = 1;
            dr[5] = "平安保险";
            dr[6] = 1;
            dr[7] = "上海平安";
            dr[8] = 1;
            dr[9] = "盛世寿险";
            dr[10] = 5000;
            dr[11] = 5000;
            dr[12] = 5000;
            dr[13] = "人民币";

            
            dr[14] = 500;
            dr[15] = 300;
            dr[16] = 1;
            dr[17] = "王五";
            dr[18] = "王海";
            dr[19] = new DateTime(DateTime.Now.Year - 1, DateTime.Now.Month, DateTime.Now.Day, 1, 1, 1);

            dr[20] = 1;
            dr[21] = "来源";
            dr[22] = 1;
            dr[23] = "新增";
            dr[24] = 1;
            dr[25] = "支票";
            dr[26] = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 1, 1, 1);
            dr[27] = new DateTime(DateTime.Now.Year + 1, DateTime.Now.Month, DateTime.Now.Day, 1, 1, 1);
            dr[28] = "备注";
            _dtGrid.Rows.Add(dr);



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

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            //this.gridExport.WriteXlsToResponse();
        }

    }
}
