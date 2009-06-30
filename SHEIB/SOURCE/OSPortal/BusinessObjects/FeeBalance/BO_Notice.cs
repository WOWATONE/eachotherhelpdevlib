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

        public BO_Notice(String id)
        {
            fetchByID(id);
        }

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
            AuditPersion,
            GatheringTypeName,
            CreatePersionName,
            AuditPersionName
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


        public static DataSet GetNoticeReport(string sSql)
        {
            DbCommand dbCommand = _db.GetSqlStringCommand(sSql);
            return _db.ExecuteDataSet(dbCommand);
        }



        public void Save(ModifiedAction action)
        {
            if (action == ModifiedAction.Insert)
            {
                add();
            }
            else
            {
                update();
            }
        }





        #endregion Methods


        #region Procedure


        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO Notice ( ");
            sb.Append(" NoticeNo, NoticeDate, [Content], GatheringType, ");
            sb.Append(" CreatePersion, CreateTime, AuditTime, AuditPersion, AuditStatus ");
            
            sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append(" @NoticeNo, @NoticeDate, @Content, @GatheringType, ");
            sb.Append(" @CreatePersion, @CreateTime, @AuditTime, @AuditPersion, @AuditStatus ");
            
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@NoticeNo", DbType.String, this.NoticeNo);

            if (this.NoticeDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@NoticeDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@NoticeDate", DbType.DateTime, this.NoticeDate);

            
            _db.AddInParameter(dbCommand, "@Content", DbType.String, this.Content);
            _db.AddInParameter(dbCommand, "@GatheringType", DbType.String, this.GatheringType);
            _db.AddInParameter(dbCommand, "@CreatePersion", DbType.String, this.CreatePersion);

            if (this.CreateTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, this.CreateTime);

            if (this.AuditTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, this.AuditTime);
            _db.AddInParameter(dbCommand, "@AuditPersion", DbType.String, this.AuditPersion);
            _db.AddInParameter(dbCommand, "@AuditStatus", DbType.String, this.AuditStatus);

            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE Notice SET ");
            sb.Append(" NoticeDate=@NoticeDate, [Content]=@Content, GatheringType=@GatheringType, CreatePersion=@CreatePersion, ");
            sb.Append(" CreateTime=@CreateTime, AuditTime=@AuditTime, AuditPersion=@AuditPersion, AuditStatus=@AuditStatus  ");
            sb.Append(" Where NoticeNo=@NoticeNo;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@NoticeNo", DbType.String, this.NoticeNo);

            if (this.NoticeDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@NoticeDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@NoticeDate", DbType.DateTime, this.NoticeDate);
            
            _db.AddInParameter(dbCommand, "@Content", DbType.String, this.Content);
            _db.AddInParameter(dbCommand, "@GatheringType", DbType.String, this.GatheringType);
            _db.AddInParameter(dbCommand, "@CreatePersion", DbType.String, this.CreatePersion);

            if (this.CreateTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, this.CreateTime);

            if (this.AuditTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, this.AuditTime);
            
            _db.AddInParameter(dbCommand, "@AuditPersion", DbType.String, this.AuditPersion);
            _db.AddInParameter(dbCommand, "@AuditStatus", DbType.String, this.AuditStatus);

            _db.ExecuteNonQuery(dbCommand);

        }



        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ");
            sb.Append("NoticeNo,NoticeDate,Content,");
            sb.Append("GatheringType,CreatePersion,CreateTime,AuditStatus,AuditTime,AuditPersion,");
            sb.Append("(Select GatheringTypeName From GatheringType Where GatheringTypeID=a.GatheringType) GatheringTypeName,");
            sb.Append("CreatePersionName,AuditPersionName");
            sb.Append(" From NoticePolicyPeriod a ");
            sb.Append(" where NoticeNo=@NoticeNo ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@NoticeNo", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.NoticeNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.NoticeNo));
                    this.NoticeDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.NoticeDate));
                    this.Content = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Content));
                    this.GatheringType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.GatheringType));

                    this.CreatePersion = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CreatePersion));
                    this.CreateTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.CreateTime));
                    this.AuditStatus = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AuditStatus));
                    this.AuditTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.AuditTime));
                    this.AuditPersion = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AuditPersion));
                    this.GatheringTypeName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.GatheringTypeName));
                    this.CreatePersionName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CreatePersionName));
                    this.AuditPersionName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AuditPersionName));
                    
                }
            }

        }



        #endregion Procedure



    }
}
