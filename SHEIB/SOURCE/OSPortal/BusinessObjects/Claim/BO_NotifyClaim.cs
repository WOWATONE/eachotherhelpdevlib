using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace BusinessObjects
{
    [Serializable()]
    public class BO_NotifyClaim : BaseObject
    {
        public BO_NotifyClaim() { }

        public BO_NotifyClaim(String id)
        {
            //FetchByID(id);
        }

        public enum FieldList
        {
            NotifyID,
            PolicyID,
            CaseEndRemark,
            CreatePerson,
            CreateDate,
            ModifyDate,
            ModifyPerson,
            NotifySerialNo,
            NotifyTime,
            AccidentSpot,
            AccidentTime,
            NotifyPerson,
            LossType,
            AccidentReason,
            NotifyLossFee,
            ContactPerson,
            ContactPhone,
            NotifyType,
            SpotCode,
            AccidentProc,
            AccidentDeal,
            NotifyRemark,
            NotifyCarrierTime,
            NotifyNo,
            CarrierContactPerson,
            CarrierContactPhone,
            PerambulateTime,
            Requirement,
            CaseEndTime,
            LastPayFee,
            AcquitFee,
            PolicyNo
        }

        #region Property
        /*理赔编号*/
        public string NotifyID { get; set; }
        /*投保编号*/
        public string PolicyID { get; set; }
        /*报案时间*/
        public DateTime NotifyTime { get; set; }
        /*制单人*/
        public string CreatePerson { get; set; }
        /*制单日期*/
        public DateTime CreateDate { get; set; }
        /*修改人*/
        public string ModifyPerson { get; set; }
        /*修改日期*/
        public DateTime ModifyDate { get; set; }
        /*出险地点*/
        public string AccidentSpot { get; set; }
        /*出险时间*/
        public DateTime AccidentTime { get; set; }
        /*报案人*/
        public string NotifyPerson { get; set; }
        /*报案流水号*/
        public string NotifySerialNo { get; set; }
        /*损失性质*/
        public string LossType { get; set; }
        /*出险原因*/
        public string AccidentReason { get; set; }
        /*报损金额*/
        public Double NotifyLossFee { get; set; }
        /*联系人*/
        public string ContactPerson { get; set; }
        /*联系电话*/
        public string ContactPhone { get; set; }
        /*报案方式*/
        public string NotifyType { get; set; }
        /*出险地邮政编码*/
        public string SpotCode { get; set; }
        /*事故经过*/
        public string AccidentProc { get; set; }
        /*跟踪记录*/
        public string AccidentDeal { get; set; }
        /*备注*/
        public string NotifyRemark { get; set; }
        /*向保险公司报案时间*/
        public DateTime NotifyCarrierTime { get; set; }
        /*报案号*/
        public string NotifyNo { get; set; }
        /*保险公司办理人员*/
        public string CarrierContactPerson { get; set; }
        /*联系电话*/
        public string CarrierContactPhone { get; set; }
        /*查勘时间*/
        public DateTime PerambulateTime { get; set; }
        /*保险公司要求*/
        public string Requirement { get; set; }
        /*结案时间*/
        public DateTime CaseEndTime { get; set; }
        /*最终赔付金额*/
        public Double LastPayFee { get; set; }
        /*免赔额*/
        public Double AcquitFee { get; set; }
        /*备注*/
        public string CaseEndRemark { get; set; }
        /*保单编号*/
        public string PolicyNo { get; set; }
        #endregion

        #region Methods
        public void Save(ModifiedAction action)
        {
            if (action == ModifiedAction.Insert)
            {
                add();
            }
            else if (action == ModifiedAction.Update)
            {
                update();
            }
        }

        /// <summary>
        /// 保存理赔信息
        /// </summary>
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO NotifyClaim(NotifyID,PolicyID,CaseEndRemark,CreatePerson,CreateDate,ModifyDate,ModifyPerson,NotifySerialNo,NotifyTime,AccidentSpot,AccidentTime,NotifyPerson,LossType,AccidentReason,NotifyLossFee,ContactPerson, ");
            sb.Append("ContactPhone,NotifyType,SpotCode,AccidentProc,AccidentDeal,NotifyRemark,NotifyCarrierTime,NotifyNo,CarrierContactPerson,CarrierContactPhone,PerambulateTime,Requirement,CaseEndTime,LastPayFee,AcquitFee) ");
            sb.Append(" VALUES(@NotifyID,@PolicyID,@CaseEndRemark,@CreatePerson,@CreateDate,@ModifyDate,@ModifyPerson,@NotifySerialNo,@NotifyTime,@AccidentSpot,@AccidentTime,@NotifyPerson,@LossType,@AccidentReason,@NotifyLossFee,@ContactPerson, ");
            sb.Append("@ContactPhone,@NotifyType,@SpotCode,@AccidentProc,@AccidentDeal,@NotifyRemark,@NotifyCarrierTime,@NotifyNo,@CarrierContactPerson,@CarrierContactPhone,@PerambulateTime,@Requirement,@CaseEndTime,@LastPayFee,@AcquitFee)");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "NotifyID", DbType.AnsiString, this.NotifyID);
            _db.AddInParameter(dbCommand, "PolicyID", DbType.AnsiString, this.PolicyID);
            _db.AddInParameter(dbCommand, "NotifySerialNo", DbType.AnsiString, this.NotifySerialNo);
            _db.AddInParameter(dbCommand, "NotifyTime", DbType.DateTime, this.NotifyTime);
            _db.AddInParameter(dbCommand, "AccidentSpot", DbType.AnsiString, this.AccidentSpot);
            _db.AddInParameter(dbCommand, "AccidentTime", DbType.DateTime, this.AccidentTime);
            _db.AddInParameter(dbCommand, "NotifyPerson", DbType.AnsiString, this.NotifyPerson);
            _db.AddInParameter(dbCommand, "LossType", DbType.AnsiString, this.LossType);
            _db.AddInParameter(dbCommand, "AccidentReason", DbType.AnsiString, this.AccidentReason);
            _db.AddInParameter(dbCommand, "NotifyLossFee", DbType.Double, this.NotifyLossFee);
            _db.AddInParameter(dbCommand, "ContactPerson", DbType.AnsiString, this.ContactPerson);
            _db.AddInParameter(dbCommand, "ContactPhone", DbType.AnsiString, this.ContactPhone);
            _db.AddInParameter(dbCommand, "NotifyType", DbType.AnsiString, this.NotifyType);
            _db.AddInParameter(dbCommand, "SpotCode", DbType.AnsiString, this.SpotCode);
            _db.AddInParameter(dbCommand, "AccidentProc", DbType.AnsiString, this.AccidentProc);
            _db.AddInParameter(dbCommand, "AccidentDeal", DbType.AnsiString, this.AccidentDeal);
            _db.AddInParameter(dbCommand, "NotifyRemark", DbType.AnsiString, this.NotifyRemark);
            _db.AddInParameter(dbCommand, "NotifyCarrierTime", DbType.DateTime, this.NotifyCarrierTime);
            _db.AddInParameter(dbCommand, "NotifyNo", DbType.AnsiString, this.NotifyNo);
            _db.AddInParameter(dbCommand, "CarrierContactPerson", DbType.AnsiString, this.CarrierContactPerson);
            _db.AddInParameter(dbCommand, "CarrierContactPhone", DbType.AnsiString, this.CarrierContactPhone);
            _db.AddInParameter(dbCommand, "PerambulateTime", DbType.DateTime, this.PerambulateTime);
            _db.AddInParameter(dbCommand, "Requirement", DbType.AnsiString, this.Requirement);
            _db.AddInParameter(dbCommand, "CaseEndTime", DbType.DateTime, this.CaseEndTime);
            _db.AddInParameter(dbCommand, "LastPayFee", DbType.Double, this.LastPayFee);
            _db.AddInParameter(dbCommand, "AcquitFee", DbType.Double, this.AcquitFee);
            _db.AddInParameter(dbCommand, "CaseEndRemark", DbType.AnsiString, this.CaseEndRemark);
            _db.AddInParameter(dbCommand, "CreatePerson", DbType.AnsiString, this.CreatePerson);
            _db.AddInParameter(dbCommand, "CreateDate", DbType.DateTime, this.CreateDate);
            _db.AddInParameter(dbCommand, "ModifyDate", DbType.DateTime, this.ModifyDate);
            _db.AddInParameter(dbCommand, "ModifyPerson", DbType.AnsiString, this.ModifyPerson);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 修改咨询信息
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update NotifyClaim ");
            sb.Append("Set PolicyID=@PolicyID,CaseEndRemark=@CaseEndRemark,CreatePerson=@CreatePerson,CreateDate=@CreateDate,ModifyDate=@ModifyDate,ModifyPerson=@ModifyPerson,NotifySerialNo=@NotifySerialNo, ");
            sb.Append("NotifyTime=@NotifyTime,AccidentSpot=@AccidentSpot,AccidentTime=@AccidentTime,NotifyPerson=@NotifyPerson,LossType=@LossType,AccidentReason=@AccidentReason,NotifyLossFee=@NotifyLossFee,ContactPerson=@ContactPerson, ");
            sb.Append("ContactPhone=@ContactPhone,NotifyType=@NotifyType,SpotCode=@SpotCode,AccidentProc=@AccidentProc,AccidentDeal=@AccidentDeal,NotifyRemark=@NotifyRemark,NotifyCarrierTime=@NotifyCarrierTime,NotifyNo=@NotifyNo,");
            sb.Append("CarrierContactPerson=@CarrierContactPerson,CarrierContactPhone=@CarrierContactPhone,PerambulateTime=@PerambulateTime,Requirement=@Requirement,CaseEndTime=@CaseEndTime,LastPayFee=@LastPayFee,AcquitFee=@AcquitFee ");
            sb.Append("Where NotifyID=@NotifyID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "NotifyID", DbType.AnsiString, this.NotifyID);
            _db.AddInParameter(dbCommand, "PolicyID", DbType.AnsiString, this.PolicyID);
            _db.AddInParameter(dbCommand, "NotifySerialNo", DbType.AnsiString, this.NotifySerialNo);
            _db.AddInParameter(dbCommand, "NotifyTime", DbType.DateTime, this.NotifyTime);
            _db.AddInParameter(dbCommand, "AccidentSpot", DbType.AnsiString, this.AccidentSpot);
            _db.AddInParameter(dbCommand, "AccidentTime", DbType.DateTime, this.AccidentTime);
            _db.AddInParameter(dbCommand, "NotifyPerson", DbType.AnsiString, this.NotifyPerson);
            _db.AddInParameter(dbCommand, "LossType", DbType.AnsiString, this.LossType);
            _db.AddInParameter(dbCommand, "AccidentReason", DbType.AnsiString, this.AccidentReason);
            _db.AddInParameter(dbCommand, "NotifyLossFee", DbType.Double, this.NotifyLossFee);
            _db.AddInParameter(dbCommand, "ContactPerson", DbType.AnsiString, this.ContactPerson);
            _db.AddInParameter(dbCommand, "ContactPhone", DbType.AnsiString, this.ContactPhone);
            _db.AddInParameter(dbCommand, "NotifyType", DbType.AnsiString, this.NotifyType);
            _db.AddInParameter(dbCommand, "SpotCode", DbType.AnsiString, this.SpotCode);
            _db.AddInParameter(dbCommand, "AccidentProc", DbType.AnsiString, this.AccidentProc);
            _db.AddInParameter(dbCommand, "AccidentDeal", DbType.AnsiString, this.AccidentDeal);
            _db.AddInParameter(dbCommand, "NotifyRemark", DbType.AnsiString, this.NotifyRemark);
            _db.AddInParameter(dbCommand, "NotifyCarrierTime", DbType.DateTime, this.NotifyCarrierTime);
            _db.AddInParameter(dbCommand, "NotifyNo", DbType.AnsiString, this.NotifyNo);
            _db.AddInParameter(dbCommand, "CarrierContactPerson", DbType.AnsiString, this.CarrierContactPerson);
            _db.AddInParameter(dbCommand, "CarrierContactPhone", DbType.AnsiString, this.CarrierContactPhone);
            _db.AddInParameter(dbCommand, "PerambulateTime", DbType.DateTime, this.PerambulateTime);
            _db.AddInParameter(dbCommand, "Requirement", DbType.AnsiString, this.Requirement);
            _db.AddInParameter(dbCommand, "CaseEndTime", DbType.DateTime, this.CaseEndTime);
            _db.AddInParameter(dbCommand, "LastPayFee", DbType.Double, this.LastPayFee);
            _db.AddInParameter(dbCommand, "AcquitFee", DbType.Double, this.AcquitFee);
            _db.AddInParameter(dbCommand, "CaseEndRemark", DbType.AnsiString, this.CaseEndRemark);
            _db.AddInParameter(dbCommand, "CreatePerson", DbType.AnsiString, this.CreatePerson);
            _db.AddInParameter(dbCommand, "CreateDate", DbType.DateTime, this.CreateDate);
            _db.AddInParameter(dbCommand, "ModifyDate", DbType.DateTime, this.ModifyDate);
            _db.AddInParameter(dbCommand, "ModifyPerson", DbType.AnsiString, this.ModifyPerson);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 根据用户ID取得理赔信息
        /// </summary>
        /// <param name="custID"></param>
        /// <returns></returns>
        public static DataTable GetCustContactByCustID(string custID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select NC.NotifyID, P.PolicyNo, C.CarrierNameCn, PT.ProdTypeName, P.StartDate, P.EndDate, NC.NotifyTime, ");
            sb.Append("isnull(NC.NotifyLossFee, 0) as NotifyLossFee, isnull(C.LossRation, 0) as LossRation, isnull(NC.LastPayFee, 0) as LastPayFee, NC.CaseEndTime ");
            sb.Append("From NotifyClaim NC (nolock) ");
            sb.Append("Inner Join Policy P (nolock) On P.PolicyID=NC.PolicyID ");
            sb.Append("Left Join PolicyCarrier PC (nolock) On PC.PolicyID=P.PolicyID ");
            sb.Append("Left Join Carrier C (nolock) On C.CarrierID=PC.CarrierID ");
            sb.Append("Left Join ProductType PT (nolock) On PT.ProdTypeID=P.ProdTypeID ");
            sb.Append("Where P.CustomerID=@CustID ");
            sb.Append("Order By NC.NotifyID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, custID);

            return _db.ExecuteDataSet(dbCommand).Tables[0];
        }

        /// <summary>
        /// 删除理赔信息
        /// </summary>
        /// <param name="notifyID"></param>
        public static void Delete(string notifyID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM NotifyClaim WHERE NotifyID = @NotifyID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@NotifyID", DbType.AnsiString, notifyID);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 根据查询条件取得理赔列表
        /// </summary>
        /// <param name="sWhere"></param>
        /// <returns></returns>
        public static DataSet GetNotifyClaimList(string sWhere)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ");
            sb.Append("NC.NotifyID, P.PolicyNo, NC.NotifyNo, NC.NotifyTime, NC.AccidentTime, NC.NotifyPerson, NC.NotifyLossFee, ");
            sb.Append("NC.ContactPerson, NC.NotifyNo, NC.PerambulateTime, NC.CaseEndTime, NC.LastPayFee, NC.AcquitFee ");
            sb.Append("From NotifyClaim NC (nolock) ");
            sb.Append("Inner Join Policy P (nolock) ");
            sb.Append("On P.PolicyID=NC.PolicyID ");
            sb.Append("Where 1=1 ");
            if (sWhere != "")
            {
                sb.Append(sWhere);
            }
            sb.Append(" Order By NC.NotifyID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// 根据理赔编号取得理赔信息
        /// </summary>
        /// <param name="notifyID"></param>
        /// <returns></returns>
        public static BO_NotifyClaim GetNotifyClaimByNotifyID(string notifyID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select NC.*, P.PolicyNo From NotifyClaim NC (nolock) ");
            sb.Append("Inner Join Policy P (nolock) On P.PolicyID=NC.PolicyID ");
            sb.Append("Where NC.NotifyID=@NotifyID");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@NotifyID", DbType.AnsiString, notifyID);

            BO_NotifyClaim notifyClaim = null;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    notifyClaim = new BO_NotifyClaim();

                    notifyClaim.NotifyID = Utility.GetStringFromReader(reader, FieldList.NotifyID.ToString());
                    notifyClaim.PolicyID = Utility.GetStringFromReader(reader, FieldList.PolicyID.ToString());
                    notifyClaim.NotifySerialNo = Utility.GetStringFromReader(reader, FieldList.NotifySerialNo.ToString());
                    notifyClaim.NotifyTime = Utility.GetDatetimeFromReader(reader, FieldList.NotifyTime.ToString());
                    notifyClaim.AccidentSpot = Utility.GetStringFromReader(reader, FieldList.AccidentSpot.ToString());
                    notifyClaim.AccidentTime = Utility.GetDatetimeFromReader(reader, FieldList.AccidentTime.ToString());
                    notifyClaim.NotifyPerson = Utility.GetStringFromReader(reader, FieldList.NotifyPerson.ToString());
                    notifyClaim.LossType = Utility.GetStringFromReader(reader, FieldList.LossType.ToString());
                    notifyClaim.AccidentReason = Utility.GetStringFromReader(reader, FieldList.AccidentReason.ToString());
                    notifyClaim.NotifyLossFee = Utility.GetDoubleFromReader(reader, FieldList.NotifyLossFee.ToString());
                    notifyClaim.ContactPerson = Utility.GetStringFromReader(reader, FieldList.ContactPerson.ToString());
                    notifyClaim.ContactPhone = Utility.GetStringFromReader(reader, FieldList.ContactPhone.ToString());
                    notifyClaim.NotifyType = Utility.GetStringFromReader(reader, FieldList.NotifyType.ToString());
                    notifyClaim.SpotCode = Utility.GetStringFromReader(reader, FieldList.SpotCode.ToString());
                    notifyClaim.AccidentProc = Utility.GetStringFromReader(reader, FieldList.AccidentProc.ToString());
                    notifyClaim.AccidentDeal = Utility.GetStringFromReader(reader, FieldList.AccidentDeal.ToString());
                    notifyClaim.NotifyRemark = Utility.GetStringFromReader(reader, FieldList.NotifyRemark.ToString());
                    notifyClaim.NotifyCarrierTime = Utility.GetDatetimeFromReader(reader, FieldList.NotifyCarrierTime.ToString());
                    notifyClaim.NotifyNo = Utility.GetStringFromReader(reader, FieldList.NotifyNo.ToString());
                    notifyClaim.CarrierContactPerson = Utility.GetStringFromReader(reader, FieldList.CarrierContactPerson.ToString());
                    notifyClaim.CarrierContactPhone = Utility.GetStringFromReader(reader, FieldList.CarrierContactPhone.ToString());
                    notifyClaim.PerambulateTime = Utility.GetDatetimeFromReader(reader, FieldList.PerambulateTime.ToString());
                    notifyClaim.Requirement = Utility.GetStringFromReader(reader, FieldList.Requirement.ToString());
                    notifyClaim.CaseEndTime = Utility.GetDatetimeFromReader(reader, FieldList.CaseEndTime.ToString());
                    notifyClaim.LastPayFee = Utility.GetDoubleFromReader(reader, FieldList.LastPayFee.ToString());
                    notifyClaim.AcquitFee = Utility.GetDoubleFromReader(reader, FieldList.AcquitFee.ToString());
                    notifyClaim.CaseEndRemark = Utility.GetStringFromReader(reader, FieldList.CaseEndRemark.ToString());
                    notifyClaim.CreatePerson = Utility.GetStringFromReader(reader, FieldList.CreatePerson.ToString());
                    notifyClaim.CreateDate = Utility.GetDatetimeFromReader(reader, FieldList.CreateDate.ToString());
                    notifyClaim.ModifyDate = Utility.GetDatetimeFromReader(reader, FieldList.ModifyDate.ToString());
                    notifyClaim.ModifyPerson = Utility.GetStringFromReader(reader, FieldList.ModifyPerson.ToString());
                    notifyClaim.PolicyNo = Utility.GetStringFromReader(reader, FieldList.PolicyNo.ToString());	
                    break;
                }
            }

            return notifyClaim;
        }

        /// <summary>
        /// 取得保单编号列表(临时用)
        /// </summary>
        /// <returns></returns>
        public static DataSet GetPolicyNoList()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select Distinct PolicyNo From Policy (nolock)");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// 根据保单编号取得保单信息
        /// </summary>
        /// <param name="policyNo"></param>
        /// <returns></returns>
        public static DataTable GetPolicyByPolicyNo(string policyNo)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select P.PolicyID, C.CarrierNameEn, CUST.CustName, B.BranchName, P.Beneficiary, PT.ProdTypeName, P.StartDate, P.EndDate, PU.UserNameCn ");
            sb.Append("From Policy P (nolock) ");
            sb.Append("Left Join PolicyCarrier PC (nolock) On PC.PolicyID=P.PolicyID ");
            sb.Append("Left Join Carrier C (nolock) On C.CarrierID=PC.CarrierID ");
            sb.Append("Left Join Customer CUST (nolock) On CUST.CustID=P.CustomerID ");
            sb.Append("Left Join Branch B (nolock) On B.BranchID=PC.BranchId ");
            sb.Append("Left Join ProductType PT (nolock) On PT.ProdTypeID=P.ProdTypeID ");
            sb.Append("Left Join P_User PU (nolock) On PU.UserID=P.SalesId ");
            sb.Append("Where P.PolicyNo=@PolicyNo");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyNo", DbType.AnsiString, policyNo);
            return _db.ExecuteDataSet(dbCommand).Tables[0];
        }

        /// <summary>
        /// 判断是否存在报案号
        /// </summary>
        /// <param name="notifyNo"></param>
        /// <returns></returns>
        public static bool IfExistsNotifyNo(string notifyNo)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select NotifyNo From NotifyClaim (nolock) ");
            sb.Append("Where NotifyNo=@NotifyNo");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@NotifyNo", DbType.AnsiString, notifyNo);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }
        #endregion
    }
}