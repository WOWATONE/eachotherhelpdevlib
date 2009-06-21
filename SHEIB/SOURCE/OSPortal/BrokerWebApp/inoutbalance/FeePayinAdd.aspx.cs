using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;
using System.Drawing;

namespace BrokerWebApp.inoutbalance
{
    public partial class FeePayinAdd : System.Web.UI.Page
    {
        #region Variables

        private DataTable _dtGrid;
        #endregion Variables

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {
                init();
                BindGrid();
            }
        }


        protected void gridPolicyItem_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();

        }

        protected void gridPolicyItem_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
        }

        protected void gridPolicyItem_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

            e.Cancel = true;
            this.gridPolicyItem.CancelEdit();
        }

        protected void gridPolicyItem_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            this.gridPolicyItem.DataBind();
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


        private void init()
        {
            //dxetxtPayFee.BackColor = Color.LightGray;
            //dxetxtFeeAdjust.BackColor = Color.LightGray;
            //dxetxtFee.BackColor = Color.LightGray;
            dxetxtCiPremium.BackColor = Color.LightGray;
            dxetxtAciPremium.BackColor = Color.LightGray;
            dxetxtCstPremium.BackColor = Color.LightGray;

            //dxetxtPayFee.ReadOnly = true;
            //dxetxtFeeAdjust.ReadOnly = true;
            //dxetxtFee.ReadOnly = true;
            dxetxtCiPremium.ReadOnly = true;
            dxetxtAciPremium.ReadOnly = true;
            dxetxtCstPremium.ReadOnly = true;



            DataSet dsList;

            //GatheringType
            this.dxeddlGatheringType.Items.Add("(全部)", "");
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.GatheringType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlGatheringType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }

            this.dxeddlProcessFeeType.Items.Add("(全部)", "");
            dsList = BO_P_Code.GetListByCodeType(BO_P_Code.PCodeType.ProcessFeeType.ToString());
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlProcessFeeType.Items.Add(row["CodeName"].ToString().Trim(), row["CodeID"].ToString().Trim());
                }
            }


            this.dxeddlCarrier.Items.Add("(全部)", "");
            dsList = BusinessObjects.SchemaSetting.BO_Carrier.GetCarrierList("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlCarrier.Items.Add(row["CarrierNameCn"].ToString().Trim(), row["CarrierID"].ToString().Trim());
                }
            }

            this.dxeddlBranch.Items.Add("(全部)", "");
            dsList = BusinessObjects.SchemaSetting.BO_Branch.GetBranchList("");
            if (dsList.Tables[0] != null)
            {
                foreach (DataRow row in dsList.Tables[0].Rows)
                {
                    this.dxeddlBranch.Items.Add(row["BranchName"].ToString().Trim(), row["BranchID"].ToString().Trim());
                }
            }

        }


        private void BindGrid()
        {
            string sVocherID = "";
            sVocherID = "0903052101";
            DataTable dt = BO_FeePayin.GetFeePayinAdd(sVocherID).Tables[0];
            this.gridPolicyItem.DataSource = dt;
            this.gridPolicyItem.DataBind();

            //取应收.
            //dxetxtPayFee.Text = dt.Compute("Sum(PayFeeBase)", "").ToString();
            //dxetxtFeeAdjust.Text = dt.Compute("Sum(FeeAdjust)", "").ToString();
            //dxetxtFee.Text = dt.Compute("Sum(Fee)", "").ToString();
            dxetxtCiPremium.Text = dt.Compute("Sum(CiPremium)", "").ToString();
            dxetxtAciPremium.Text = dt.Compute("Sum(AciPremium)", "").ToString();
            dxetxtCstPremium.Text = dt.Compute("Sum(CstPremium)", "").ToString();

        }


    }
}
