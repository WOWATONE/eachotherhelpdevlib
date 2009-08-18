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
            string sSql = "";
            sSql = sSql + "select NoticeNo, ";
            sSql = sSql + "dbo.GetNoticeCustomer(a.NoticeNo) CustomerName,";
            sSql = sSql + "dbo.GetNoticeSales(a.NoticeNo) SalesName,GatheringType,NoticeDate,";
            sSql = sSql + "(Select GatheringTypeName From GatheringType Where GatheringTypeID=a.GatheringType) GatheringTypeName,";
            sSql = sSql + "(select sum(PayFeeBase) from PolicyPeriod where NoticeNo=a.NoticeNo) PayFee,AuditStatus,";
            sSql = sSql + "(select AuditStatusName from AuditStatus where AuditStatusID=a.AuditStatus) AuditStatusName,";
            sSql = sSql + "AuditTime,AuditPersion,(select count(1) from PolicyPeriod where NoticeNo=a.NoticeNo) PolicyCount";
            sSql = sSql + " from Notice a";
            sSql = sSql + " where 1=1 ";
            sSql = sSql + sWhere;

            DbCommand dbCommand = _db.GetSqlStringCommand(sSql);

            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetFeeNoticeAddList(string sWhere)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select a.PolPeriodId,a.PolicyID,b.PolicyNo,b.CustomerID,(select CustName from  customer where custID=b.CustomerID) CustName, ");
            sb.Append("CarrierID,BranchID,Period,PayDate,PayFeeBase,");
            sb.Append("CiPremium,AciPremium,CstPremium,(Select IsNull(AuditStatus,'0') from Notice where NoticeNo=a.NoticeNo) AuditStatus ");
            sb.Append(" from PolicyPeriod a,Policy b");
            sb.Append(" where a.PolicyID=b.PolicyID ");            
            sb.Append(sWhere);

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetFeeNoticeAddSelectList(string sWhere)
        {

            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeeNoticeAddSelectList");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetFeeNoticeAddPrint(string sNoticeNo)
        {

            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeeNoticeAddPrint");
            _db.AddInParameter(dbCommand, "@ac_NoticeNo", DbType.String, sNoticeNo);
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

        public static void AuditNotice(string NoticeNo,string AuditStatus,string  AuditPersion,ref Int32 resultSign, ref String resultMsg)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.AuditNotice");
            _db.AddInParameter(dbCommand, "@ac_NoticeNo", DbType.String, NoticeNo);
            _db.AddInParameter(dbCommand, "@ac_AuditStatus", DbType.String, AuditStatus);
            _db.AddInParameter(dbCommand, "@ac_AuditPersion", DbType.String, AuditPersion);
            _db.AddOutParameter(dbCommand, "@ai_dm", DbType.Int16,4);
            _db.AddOutParameter(dbCommand, "@ac_sm", DbType.String, 100);
            _db.ExecuteNonQuery(dbCommand);


            resultSign = Convert.ToInt32(_db.GetParameterValue(dbCommand, "@ai_dm"));
            resultMsg = Convert.ToString(_db.GetParameterValue(dbCommand, "@ac_sm"));

        }

        /// <summary>
        /// 是否存在保单
        /// </summary>
        /// <param name="custID"></param>
        /// <returns></returns>
        public static bool IfExistsPolicy(string NoticeNo)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select top 1 PolicyID ");
            sb.Append("From PolicyPeriod ");
            sb.Append("Where NoticeNo=@NoticeNo");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@NoticeNo", DbType.AnsiString, NoticeNo);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        public static void Delete(string NoticeNo)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM Notice ");
            sb.Append(" WHERE NoticeNo = @NoticeNo ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@NoticeNo", DbType.AnsiString, NoticeNo);

            _db.ExecuteNonQuery(dbCommand);
        }

        #endregion Procedure



    }
}
