using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;


namespace BrokerWebApp.inoutbalance
{
    public partial class FeeNoticeAdd : System.Web.UI.Page
    {

        #region Variables

        private const string inputQueryStringIDKey = "NoticeNo";
                
        private string theID;

        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.Page.IsPostBack)
            {                
                deNoticeDate.Date = DateTime.Today;
                this.dxetxtNoticeNo.Text = Page.Request.QueryString[inputQueryStringIDKey];
            }
            else
            {
                //do nothing;
            }

            this.Initialization();

            if (!IsPostBack && !IsCallback)
            {
                BindGrid();
            }

        }

        private void BindGrid()
        {
            Boolean includePolPeriodId = false;
            String sBefore = " and (";
            String sAfter = " ) ";
            String sWhere=" 1=1 ";
            if (String.IsNullOrEmpty(this.dxetxtNoticeNo.Text.Trim()))
            {
                String strPolPeriodIds= this.txtSelectedPolPeriodIds.Value;
                String[] ppids;
                //ppids = strPolPeriodIds.Split(new Char[] { ';' });
                ppids = strPolPeriodIds.Split(new String[] { ";" }, StringSplitOptions.None);
                
                foreach (string s in ppids)
                {
                    if (s.Trim() != "")
                    {
                        sWhere += " or a.PolPeriodId = '" + s.Trim() + "' ";
                        if (s.Trim().Length == 36)
                            includePolPeriodId = true;                        
                    }                        
                }

                if (includePolPeriodId)
                    sWhere = sBefore + sWhere + sAfter;
                else
                    sWhere = " and a.NoticeNo !='' ";
            }
            else
            {
                sWhere = " and a.NoticeNo ='" + this.dxetxtNoticeNo.Text.Trim()  + "'"; ;
            }
            DataTable dt = BO_Notice.GetFeeNoticeAddList(sWhere).Tables[0];
            this.gridPolicyItem.DataSource = dt;
            this.gridPolicyItem.DataBind();

        }


        private void Initialization()
        {

            DataSet dsList;

            //收费类型
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.GatheringType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlGatheringType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }

            
        }


        protected void gridPolicyItem_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            BindGrid();
        }

        protected void gridPolicyItem_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        

    }
}
