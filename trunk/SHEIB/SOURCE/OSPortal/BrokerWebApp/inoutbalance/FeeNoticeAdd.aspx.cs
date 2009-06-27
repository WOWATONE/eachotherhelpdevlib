﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessObjects;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Text;
using DevExpress.Web.ASPxHtmlEditor;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;

namespace BrokerWebApp.inoutbalance
{
    public partial class FeeNoticeAdd : BasePage
    {

        #region Variables

        private const string inputQueryStringIDKey = "NoticeNo";
           
        
        #endregion Variables


        protected void Page_Load(object sender, EventArgs e)
        {
            this.Initialization();

            if (!this.Page.IsPostBack)
            {                
                
                dxeNoticeDate.Date = DateTime.Today;
                this.dxetxtNoticeNo.Text = Page.Request.QueryString[inputQueryStringIDKey];
                loadValue(this.dxetxtNoticeNo.Text);
            }
            else
            {
                //do nothing;
            }
                        

            if (!IsPostBack && !IsCallback)
            {
                BindGrid();
            }

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //
        }

        private void BindGrid()
        {
            DataTable dt = getGridData();
            this.gridPolicyItem.DataSource = dt;
            this.gridPolicyItem.DataBind();
        }


        private DataTable getGridData()
        {
            Boolean includePolPeriodId = false;
            String sBefore = " and (";
            String sAfter = " ) ";
            String sWhere = " ";
            if (String.IsNullOrEmpty(this.dxetxtNoticeNo.Text.Trim()))
            {
                String strPolPeriodIds = this.txtSelectedPolPeriodIds.Value;
                String[] ppids;
                //ppids = strPolPeriodIds.Split(new Char[] { ';' });
                ppids = strPolPeriodIds.Split(new String[] { ";" }, StringSplitOptions.None);

                foreach (string s in ppids)
                {
                    if (s.Trim() != "")
                    {
                        if (s.Trim().Length == 36)
                        {
                            if (sWhere.Trim() != "")
                                sWhere += " or a.PolPeriodId = '" + s.Trim() + "' ";
                            else
                                sWhere += " a.PolPeriodId = '" + s.Trim() + "' ";
                            
                            includePolPeriodId = true;
                        }
                    }
                }

                if (includePolPeriodId)
                    sWhere = sBefore + sWhere + sAfter;
                else
                    sWhere = " and a.NoticeNo !='' and a.NoticeNo ='-1' ";
            }
            else
            {
                savePolicyPeriod(this.dxetxtNoticeNo.Text.Trim(),this.txtSelectedPolPeriodIds.Value);
                sWhere = " and a.NoticeNo ='" + this.dxetxtNoticeNo.Text.Trim() + "'"; ;
            }
            DataTable dt = BO_Notice.GetFeeNoticeAddList(sWhere).Tables[0];

            return dt;
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


        protected void dxeSaveCallback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {            
            String thePolicyID = saveNotice(e.Parameter);
            e.Result = thePolicyID;
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


        private string saveNotice(String parameter)
        {
            String json = parameter;

            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json));
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(NoticeInfo));
            NoticeInfo obj;

            obj = (NoticeInfo)serializer.ReadObject(ms);
            ms.Close();

            BusinessObjects.BO_Notice objLoad;
            if (String.IsNullOrEmpty(obj.NoticeNo))
            {
                objLoad = new BO_Notice();
                if (obj.GatheringType == Convert.ToInt32(BO_P_Code.GatheringType.Agent).ToString())
                    objLoad.NoticeNo = TranUtils.GetNoticeIDDirect();
                else
                    objLoad.NoticeNo = TranUtils.GetNoticeIDAgent();
                objLoad.CreateTime = DateTime.Now;
                objLoad.CreatePersion = this.CurrentUserID;
                objLoad.GatheringType = obj.GatheringType;
                objLoad.NoticeDate = obj.NoticeDate;
                objLoad.Save(ModifiedAction.Insert);
            }
            else
            {                
                objLoad = new BO_Notice(obj.NoticeNo);
                objLoad.NoticeDate = obj.NoticeDate;
                objLoad.GatheringType = obj.GatheringType; 
                objLoad.Save(ModifiedAction.Update);
            }

            savePolicyPeriod(objLoad.NoticeNo);

            return objLoad.NoticeNo;

        }


        private void savePolicyPeriod(String noticeNo)
        {
            DataTable dt = getGridData();
            DataRow dr;
            String thePolPeriodId;
            BusinessObjects.Policy.BO_PolicyPeriod obj;
            Int32 rowCount = dt.Rows.Count;
            for (Int32 i = 0; i < rowCount; i++)
            {
                dr = dt.Rows[i];
                thePolPeriodId = dr[0].ToString();
                obj = new BusinessObjects.Policy.BO_PolicyPeriod(thePolPeriodId);
                obj.NoticeNo = noticeNo;
                obj.Save(ModifiedAction.Update);
            }
        }


        private void savePolicyPeriod(String noticeNo, String polPeriodIds)
        {
            BusinessObjects.Policy.BO_PolicyPeriod obj;
            String[] ppids;
            ppids = polPeriodIds.Split(new String[] { ";" }, StringSplitOptions.None);

            foreach (String s in ppids)
            {
                if (s.Trim() != "")
                {
                    if (s.Trim().Length == 36)
                    {
                        obj = new BusinessObjects.Policy.BO_PolicyPeriod(s);
                        obj.NoticeNo = noticeNo;
                        obj.Save(ModifiedAction.Update);
                    }
                }
            }
        }



        private void loadValue(String noticeNO)
        {
            if (String.IsNullOrEmpty(noticeNO.Trim())) return;

            ListEditItem theselected;
            BusinessObjects.BO_Notice obj;

            obj = new BusinessObjects.BO_Notice(noticeNO);

            

            //dxeddlDeptID
            if (!String.IsNullOrEmpty(obj.GatheringType))
            {
                theselected = this.dxeddlGatheringType.Items.FindByValue(obj.GatheringType);
                if (theselected != null)
                {
                    dxeddlGatheringType.SelectedItem = theselected;
                }
            }

            this.dxeNoticeDate.Date = obj.NoticeDate;
            
        }


    
    
    }


    




    [DataContract(Namespace = "http://www.sheib.com")]
    public class NoticeInfo
    {
        public NoticeInfo()
        { }


        [DataMember]
        public string GatheringType { get; set; }

        [DataMember]
        public string NoticeNo { get; set; }

        [DataMember]
        public DateTime NoticeDate { get; set; }


    }


}
