﻿using System;
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
            GatheringType,
            CreatePersion,
            CreateTime,
            AuditStatus,
            AuditTime,
            AuditPersion
        }

        #region Property
        public string NoticeNo { get; set; }
        public DateTime NoticeDate { get; set; }
        public string Content { get; set; }
        public string GatheringType { get; set; }
        public string CreatePersion { get; set; }
        public DateTime CreateTime { get; set; }
        public string AuditStatus { get; set; }
        public DateTime AuditTime { get; set; }
        public string AuditPersion { get; set; }
        public string GatheringTypeName { get; set; }
        public string CreatePersionName { get; set; }
        public string AuditPersionName { get; set; }


        #endregion Property


        #region Methods

        public static DataSet GetFeeNoticeList(string sWhere)
        {
            //NoticePolicyPeriod 未视图
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ");
            sb.Append("NoticeNo,NoticeDate,Content,CustID,");
            sb.Append("GatheringType,CreatePersion,CreateTime,AuditStatus,AuditTime,AuditPersion,CustID,SalesId,CustName,SalesName,");
            sb.Append("(Select GatheringTypeName From GatheringType Where GatheringTypeID=a.GatheringType) GatheringTypeName,");
            sb.Append("CreatePersionName,AuditPersionName,AuditStatusName,PayFee");
            sb.Append(" From NoticePolicyPeriod a ");
            sb.Append(" where 1=1 ");
            sb.Append(sWhere);

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetFeeNoticeAddList(string sWhere)
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
            sb.Append(sWhere);

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetFeeNoticeAddSelectList(string sWhere)
        {

            //SQL
            //select * from 
            //(
            //select a.PolicyID,b.PolicyNo,b.CustomerID,
            //(select CustName from  customer where custID=b.CustomerID) CustName, 
            //CarrierID,(select CarrierNameCn from Carrier where CarrierID=a.CarrierID) CarrierName,
            //BranchID,(select BranchName from Branch where BranchID=a.BranchID) BranchName,
            //Period,PayDate,
            //b.PremiumBase,
            //PayFeeBase,
            //(select PayedFee from PolicyPeriodFee where PolPeriodID=a.PolPeriodID ) PayedFee,
            //b.ProdTypeID,(select ProdTypeName from ProductType where ProdTypeID=b.ProdTypeID) ProdTypeName,
            //b.GatheringType,(select GatheringTypeName from GatheringType where GatheringTypeID=b.GatheringType) GatheringTypeName,
            //CiPremium,AciPremium,CstPremium,
            //b.SalesID,(select UserNameCn from P_User where UserID=b.SalesID) SalesName,b.CarrierSales
            //from PolicyPeriod a,Policy b
            //where a.PolicyID=b.PolicyID
            //  and isnull(a.NoticeNo,'')=''
            //) a

            string sSql = "";
            sSql = sSql + "select * from ";
            sSql = sSql + "(";
            sSql = sSql + " select a.PolPeriodId, a.PolicyID,b.PolicyNo,b.CustomerID,";
            sSql = sSql + "(select CustName from  customer where custID=b.CustomerID) CustName, ";
            sSql = sSql + "CarrierID,(select CarrierNameCn from Carrier where CarrierID=a.CarrierID) CarrierName,";
            sSql = sSql + "BranchID,(select BranchName from Branch where BranchID=a.BranchID) BranchName,";
            sSql = sSql + "Period,PayDate,";
            sSql = sSql + "b.PremiumBase,";
            sSql = sSql + "PayFeeBase,";
            sSql = sSql + "(select PayedFee from PolicyPeriodFee where PolPeriodID=a.PolPeriodID ) PayedFee,";
            sSql = sSql + "b.ProdTypeID,(select ProdTypeName from ProductType where ProdTypeID=b.ProdTypeID) ProdTypeName,";
            sSql = sSql + "b.GatheringType,(select GatheringTypeName from GatheringType where GatheringTypeID=b.GatheringType) GatheringTypeName,";
            sSql = sSql + "CiPremium,AciPremium,CstPremium,";
            sSql = sSql + "b.SalesID,(select UserNameCn from P_User where UserID=b.SalesID) SalesName,b.CarrierSales";
            sSql = sSql + " from PolicyPeriod a,Policy b";
            sSql = sSql + " where a.PolicyID=b.PolicyID";
            sSql = sSql + "  and isnull(a.NoticeNo,'')=''";
            sSql = sSql + ") a where 1=1 ";
            if (sWhere != "")
            {
                sSql = sSql + sWhere;
            }
            DbCommand dbCommand = _db.GetSqlStringCommand(sSql);
            return _db.ExecuteDataSet(dbCommand);
        }








        #endregion Methods


    }
}
