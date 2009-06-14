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

        public static DataSet GetNoticePolicyList(string sNoticeNo)
        {
            
            //SQL
            //select a.PolicyID,b.PolicyNo,b.CustomerID,(select CustName from  customer where custID=b.CustomerID) CustName, 
            //CarrierID,BranchID,Period,PayDate,PayFeeBase,
            //CiPremium,AciPremium,CstPremium
            //from PolicyPeriod a,Policy b
            //where a.PolicyID=b.PolicyID
            StringBuilder sb = new StringBuilder();
            sb.Append("select a.PolPeriodId,a.PolicyID,b.PolicyNo,b.CustomerID,(select CustName from  customer where custID=b.CustomerID) CustName, ");
            sb.Append("CarrierID,BranchID,Period,PayDate,PayFeeBase,");
            sb.Append("CiPremium,AciPremium,CstPremium");
            sb.Append(" from PolicyPeriod a,Policy b");
            sb.Append(" where a.PolicyID=b.PolicyID ");
            sb.Append(" and a.NoticeNo='" + sNoticeNo + "'");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetCustomerFeeSelectList(string sWhere)
        {
            
            //SQL
            //        select a.PolicyID,b.PolicyNo,b.CustomerID,
            //(select CustName from  customer where custID=b.CustomerID) CustName, 
            //CarrierID,(select CarrierNameCn from Carrier where CarrierID=a.CarrierID) CarrierName,
            //BranchID,(select BranchName from Branch where BranchID=a.BranchID) BranchName,
            //Period,PayDate,
            //b.PremiumBase,
            //PayFeeBase,
            //(select sum(fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('1','6')) PayedFee,
            //b.ProdTypeID,(select ProdTypeName from ProductType where ProdTypeID=b.ProdTypeID) ProdTypeName,
            //b.GatheringType,(select GatheringTypeName from GatheringType where GatheringTypeID=b.GatheringType) GatheringTypeName,
            //CiPremium,AciPremium,CstPremium,
            //b.SalesID,(select UserNameCn from P_User where UserID=b.SalesID) SalesName,b.CarrierSales
            //from PolicyPeriod a,Policy b
            //where a.PolicyID=b.PolicyID
            //  and isnull(a.NoticeNo,'')=''

            StringBuilder sb = new StringBuilder();
            sb.Append("select a.PolicyID,b.PolicyNo,b.CustomerID, ");
            sb.Append("(select CustName from  customer where custID=b.CustomerID) CustName, ");
            sb.Append("CarrierID,(select CarrierNameCn from Carrier where CarrierID=a.CarrierID) CarrierName,");
            sb.Append("BranchID,(select BranchName from Branch where BranchID=a.BranchID) BranchName,");
            sb.Append("Period,PayDate,b.PremiumBase,PayFeeBase,");
            sb.Append("(select sum(fee) from fee where PolPeriodID=a.PolPeriodID and AccountTypeID in ('1','6')) PayedFee,");
            sb.Append("b.ProdTypeID,(select ProdTypeName from ProductType where ProdTypeID=b.ProdTypeID) ProdTypeName,");
            sb.Append("b.GatheringType,(select GatheringTypeName from GatheringType where GatheringTypeID=b.GatheringType) GatheringTypeName,");
            sb.Append("CiPremium,AciPremium,CstPremium,");
            sb.Append("b.SalesID,(select UserNameCn from P_User where UserID=b.SalesID) SalesName,b.CarrierSales");
            sb.Append(" from PolicyPeriod a,Policy b");
            sb.Append(" where a.PolicyID=b.PolicyID ");
            sb.Append("  and isnull(a.NoticeNo,'')='' ");
            sb.Append( sWhere);
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }








        #endregion Methods


    }
}
