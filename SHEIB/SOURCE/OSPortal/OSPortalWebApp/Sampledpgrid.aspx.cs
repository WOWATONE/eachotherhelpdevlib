using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView.Rendering;
using System.Drawing;
using System.Data;
using System.IO;
using System.Drawing.Imaging;

namespace OSPortalWebApp
{
    public partial class Sampledpgrid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grid_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            //grid.DataBind();
        }
        protected void grid_RowCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            //if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data) return;
            //Label label = grid.FindRowCellTemplateControl(e.VisibleIndex, null, "changePercent") as Label;
            //decimal change = (decimal)grid.GetRowValues(e.VisibleIndex, "Change");
            //label.Text = string.Format("{0:p}", change);
            //System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)grid.FindRowCellTemplateControl(e.VisibleIndex, null, "changeImage");
            //img.Visible = false;
            //if (change != 0)
            //{
            //    img.Visible = true;
            //    img.ImageUrl = change < 0 ? "~/Images/arRed.gif" : "~/Images/arGreen.gif";
            //    label.ForeColor = change < 0 ? Color.Red : Color.Green;
            //}
        }

        protected void grid_CustomDataCallback(object sender,
            DevExpress.Web.ASPxGridView.ASPxGridViewCustomDataCallbackEventArgs e)
        {
            e.Result = GetNotes(e.Parameters);
        }
        object GetNotes(string id)
        {
            AccessDataSource ds = new AccessDataSource();
            ds.DataFile = AccessDataSource1.DataFile;
            ds.SelectCommand = string.Format("Select Notes FROM [Employees] WHERE [EmployeeId]={0}", id);
            DataView view = (DataView)ds.Select(DataSourceSelectArguments.Empty);
            if (view.Count > 0)
            {
                return view[0]["Notes"];
            }
            return null;
        }
        void PostImage(string id)
        {
            byte[] image = FindImage(id);
            WriteBinaryImage(image);
        }
        void WriteBinaryImage(byte[] image)
        {
            if (image != null)
            {
                Response.ContentType = "image/jpeg";
                using (MemoryStream ms = new MemoryStream(image))
                {
                    using (Bitmap bmp = (Bitmap)Bitmap.FromStream(ms))
                    {
                        bmp.Save(Response.OutputStream, ImageFormat.Jpeg);
                    }
                }
            }
            else
            {
                Response.ContentType = "image/gif";
            }
            Response.End();
        }
        byte[] FindImage(string id)
        {
            AccessDataSource ds = new AccessDataSource();
            ds.DataFile = AccessDataSource1.DataFile;
            ds.SelectCommand = "select Photo from [Employees] where employeeid=" + id;
            DataView view = (DataView)ds.Select(DataSourceSelectArguments.Empty);
            if (view.Count > 0) return view[0][0] as byte[];
            return null;
        }

    }
}
