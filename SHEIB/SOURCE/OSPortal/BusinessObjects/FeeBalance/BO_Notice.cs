using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Runtime.Serialization;

namespace BusinessObjects
{
    [Serializable()]
    public class BO_Notice : BaseObject
    {


        public BO_Notice() { }

        public enum FieldList
        {
            NoticeNo,
            NoticeDate,
            Content,
            CustID,
            SalesId,
            GatheringType,
            CreatePersion,
            CreateTime,
            FlagAudited,
            AuditTime,
            AuditPersion,
            CustName,
            GatheringTypeName,
            CreatePersionName,
            AuditPersionName,
            SalesName
        }

        #region Property
        public string NoticeNo { get; set; }
        public DateTime NoticeDate { get; set; }
        public string Content { get; set; }
        public string CustID { get; set; }
        public string GatheringType { get; set; }
        public string CreatePersion { get; set; }
        public DateTime CreateTime { get; set; }
        public int FlagAudited { get; set; }
        public DateTime AuditTime { get; set; }
        public string AuditPersion { get; set; }
        public string CustName { get; set; }
        public string GatheringTypeName { get; set; }
        public string CreatePersionName { get; set; }
        public string AuditPersionName { get; set; }
        public string SalesId { get; set; }
        public string SalesName { get; set; }

        #endregion Property


        #region Methods

        public static List<BO_Notice> FetchList()
        {
            List<BO_Notice> list = new List<BO_Notice>();

            StringBuilder sb = new StringBuilder();
            sb.Append("select ");
            sb.Append("NoticeNo,NoticeDate,Content,CustID,");
            sb.Append("GatheringType,CreatePersion,CreateTime,FlagAudited,AuditTime,AuditPersion,CustID,SalesId,");
            sb.Append("(Select CustName From Customer Where CustID=a.CustID) CustName,");
            sb.Append("(Select GatheringTypeName From GatheringType Where GatheringTypeID=a.GatheringType) GatheringTypeName,");
            sb.Append("(Select UserNameCn From P_User Where UserID=a.CreatePersion) CreatePersionName,");
            sb.Append("(Select UserNameCn From P_User Where UserID=a.SalesId) SalesName,");
            sb.Append("(Select UserNameCn From P_User Where UserID=a.AuditPersion) AuditPersionName, ");
            sb.Append("(select sum(PayFeeBase) from PolicyPeriod where NoticeNo=a.NoticeNo) PayFee");
            sb.Append("From Notice a ");
            sb.Append("where 1=1 ");
            //sb.Append(sWhere);

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_Notice newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_Notice();
                    newObj.NoticeNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.NoticeNo));
                    newObj.NoticeDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.NoticeDate));
                    newObj.Content = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Content));
                    newObj.CustID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustID));
                    newObj.GatheringType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.GatheringType));
                    newObj.CreatePersion = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CreatePersion));
                    newObj.CreateTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.CreateTime));
                    newObj.FlagAudited = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.FlagAudited));
                    newObj.AuditTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.AuditTime));
                    newObj.AuditPersion = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AuditPersion));
                    newObj.CustName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustName));
                    newObj.GatheringTypeName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.GatheringTypeName));
                    newObj.CreatePersionName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CreatePersionName));
                    newObj.AuditPersionName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AuditPersionName));
                    newObj.SalesId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.SalesId));
                    newObj.SalesName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.SalesName));

                    list.Add(newObj);
                }
            }

            return list;
        }


        public static DataSet GetNoticeList(string sWhere)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ");
            sb.Append("NoticeNo,NoticeDate,Content,CustID,");
            sb.Append("GatheringType,CreatePersion,CreateTime,FlagAudited,AuditTime,AuditPersion,CustID,SalesId,");
            sb.Append("(Select CustName From Customer Where CustID=a.CustID) CustName,");
            sb.Append("(Select GatheringTypeName From GatheringType Where GatheringTypeID=a.GatheringType) GatheringTypeName,");
            sb.Append("(Select UserNameCn From P_User Where UserID=a.CreatePersion) CreatePersionName,");
            sb.Append("(Select UserNameCn From P_User Where UserID=a.SalesId) SalesName,");
            sb.Append("(Select UserNameCn From P_User Where UserID=a.AuditPersion) AuditPersionName,");
            sb.Append("(select sum(PayFeeBase) from PolicyPeriod where NoticeNo=a.NoticeNo) PayFee");
            sb.Append(" From Notice a ");
            sb.Append(" where 1=1 ");
            sb.Append(sWhere);

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            return _db.ExecuteDataSet(dbCommand);
        }


        #endregion Methods


    }
}
