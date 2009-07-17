using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxEditors;
using System.IO;
using DevExpress.Web.ASPxUploadControl;


namespace BrokerWebApp.vehicleinsurance
{
    public partial class CarPolicyAlert : BasePage
    {

        #region Variables

        private DataTable _dtGridPolicyItem;
        private DataTable _dtGridCarrier;

        private DataTable _dtGridPeriod;

        private const string UploadDirectory = "~/UploadControl/UploadImages/";
        private const int ThumbnailSize = 100;

        //enctype="multipart/form-data">

        #endregion Variables




    }
}
