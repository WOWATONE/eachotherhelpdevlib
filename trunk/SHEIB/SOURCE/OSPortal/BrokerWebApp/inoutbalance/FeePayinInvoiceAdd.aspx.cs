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
    public partial class FeePayinInvoiceAdd : System.Web.UI.Page
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
            //dxetxtCiPremium.BackColor = Color.LightGray;
            //dxetxtAciPremium.BackColor = Color.LightGray;
            //dxetxtCstPremium.BackColor = Color.LightGray;

            //dxetxtPayFee.ReadOnly = true;
            //dxetxtFeeAdjust.ReadOnly = true;
            //dxetxtFee.ReadOnly = true;
            //dxetxtCiPremium.ReadOnly = true;
            //dxetxtAciPremium.ReadOnly = true;
            //dxetxtCstPremium.ReadOnly = true;

        }


        private void BindGrid()
        {
            string sVocherID = "";
            sVocherID = "0903052101";
            DataTable dt = BO_FeeCustomer.GetFeeCustomerAdd(sVocherID).Tables[0];
            this.gridPolicyItem.DataSource = dt;
            this.gridPolicyItem.DataBind();

            //取应收.
            //dxetxtPayFee.Text = dt.Compute("Sum(PayFeeBase)", "").ToString();
            //dxetxtFeeAdjust.Text = dt.Compute("Sum(FeeAdjust)", "").ToString();
            //dxetxtFee.Text = dt.Compute("Sum(Fee)", "").ToString();
            //dxetxtCiPremium.Text = dt.Compute("Sum(CiPremium)", "").ToString();
            //dxetxtAciPremium.Text = dt.Compute("Sum(AciPremium)", "").ToString();
            //dxetxtCstPremium.Text = dt.Compute("Sum(CstPremium)", "").ToString();

        }




    }
}
