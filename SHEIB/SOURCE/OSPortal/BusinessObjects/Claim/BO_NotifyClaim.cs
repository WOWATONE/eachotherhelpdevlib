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
            CaseEndRemark, 
            CreatePerson, 
            CreateDate, 
            ModifyDate,
            ModifyPerson, 
            DocCompleteDate, 
            LastPayDate, 
            CaseEndPerson,
            PolicyNo
        }


        #region Property

        /*理赔编号*/
        public string NotifyID { get; set; }

        /*投保编号*/
        public string PolicyID { get; set; }

        /*报案流水号*/
        public string NotifySerialNo { get; set; }

        /*报案时间*/
        public DateTime NotifyTime { get; set; }

        /*出险地点*/
        public string AccidentSpot { get; set; }

        /*出险时间*/
        public DateTime AccidentTime { get; set; }

        /*报案人*/
        public string NotifyPerson { get; set; }

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

        /*制单人*/
        public string CreatePerson { get; set; }

        /*制单日期*/
        public DateTime CreateDate { get; set; }

        /*修改人*/
        public string ModifyPerson { get; set; }

        /*修改日期*/
        public DateTime ModifyDate { get; set; }

        /*资料齐全日期*/
        public DateTime DocCompleteDate  { get; set; }

        /*赔款到账日期*/
        public DateTime LastPayDate { get; set; }

        /*结案人*/
        public string CaseEndPerson { get; set; }
                

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
            sb.Append("INSERT INTO NotifyClaim(NotifyID,PolicyID, ");
            sb.Append("NotifySerialNo, NotifyTime, AccidentSpot, AccidentTime, ");
            sb.Append("NotifyPerson, LossType, AccidentReason, NotifyLossFee, ");
            sb.Append("ContactPerson, ContactPhone, NotifyType, SpotCode, ");
            sb.Append("AccidentProc, AccidentDeal, NotifyRemark, NotifyCarrierTime, ");
            sb.Append("NotifyNo, CarrierContactPerson, CarrierContactPhone, PerambulateTime, ");
            sb.Append("Requirement, CaseEndTime, LastPayFee, AcquitFee, ");
            sb.Append("CaseEndRemark, CreatePerson, CreateDate, ModifyDate, ");
            sb.Append("ModifyPerson, DocCompleteDate, LastPayDate, CaseEndPerson ");
            sb.Append(" ");
            sb.Append(") ");
            sb.Append(" VALUES(");
            sb.Append("@NotifyID,@PolicyID, ");
            sb.Append("@NotifySerialNo, @NotifyTime, @AccidentSpot, @AccidentTime, ");
            sb.Append("@NotifyPerson, @LossType, @AccidentReason, @NotifyLossFee, ");
            sb.Append("@ContactPerson, @ContactPhone, @NotifyType, @SpotCode, ");
            sb.Append("@AccidentProc, @AccidentDeal, @NotifyRemark, @NotifyCarrierTime, ");
            sb.Append("@NotifyNo, @CarrierContactPerson, @CarrierContactPhone, @PerambulateTime, ");
            sb.Append("@Requirement, @CaseEndTime, @LastPayFee, @AcquitFee, ");
            sb.Append("@CaseEndRemark, @CreatePerson, @CreateDate, @ModifyDate, ");
            sb.Append("@ModifyPerson, @DocCompleteDate, @LastPayDate, @CaseEndPerson ");
            sb.Append(" ");
            sb.Append(") ");

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
            _db.AddInParameter(dbCommand, "DocCompleteDate", DbType.DateTime, this.DocCompleteDate);
            _db.AddInParameter(dbCommand, "LastPayDate", DbType.DateTime, this.LastPayDate);
            _db.AddInParameter(dbCommand, "CaseEndPerson", DbType.AnsiString, this.CaseEndPerson);
            
            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 修改咨询信息
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update NotifyClaim ");
            sb.Append("Set ");
            sb.Append("PolicyID=@PolicyID, ");
            sb.Append("NotifySerialNo=@NotifySerialNo, NotifyTime=@NotifyTime, AccidentSpot=@AccidentSpot, AccidentTime=@AccidentTime, ");
            sb.Append("NotifyPerson=@NotifyPerson, LossType=@LossType, AccidentReason=@AccidentReason, NotifyLossFee=@NotifyLossFee, ");
            sb.Append("ContactPerson=@ContactPerson, ContactPhone=@ContactPhone, NotifyType=@NotifyType, SpotCode=@SpotCode, ");
            sb.Append("AccidentProc=@AccidentProc, AccidentDeal=@AccidentDeal, NotifyRemark=@NotifyRemark, NotifyCarrierTime=@NotifyCarrierTime, ");
            sb.Append("NotifyNo=@NotifyNo, CarrierContactPerson=@CarrierContactPerson, CarrierContactPhone=@CarrierContactPhone, PerambulateTime=@PerambulateTime, ");
            sb.Append("Requirement=@Requirement, CaseEndTime=@CaseEndTime, LastPayFee=@LastPayFee, AcquitFee=@AcquitFee, ");
            sb.Append("CaseEndRemark=@CaseEndRemark, CreatePerson=@CreatePerson, CreateDate=@CreateDate, ModifyDate=@ModifyDate, ");
            sb.Append("ModifyPerson=@ModifyPerson, DocCompleteDate=@DocCompleteDate, LastPayDate=@LastPayDate, CaseEndPerson=@CaseEndPerson ");
            sb.Append(" ");
            sb.Append("Where NotifyID=@NotifyID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            //if (this.PerambulateTime == DateTime.MinValue)
            //    _db.AddInParameter(dbCommand, "PerambulateTime", DbType.DateTime, DBNull.Value);
            //else
            //    _db.AddInParameter(dbCommand, "PerambulateTime", DbType.DateTime, this.PerambulateTime);
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
            _db.AddInParameter(dbCommand, "DocCompleteDate", DbType.DateTime, this.DocCompleteDate);
            _db.AddInParameter(dbCommand, "LastPayDate", DbType.DateTime, this.LastPayDate);
            _db.AddInParameter(dbCommand, "CaseEndPerson", DbType.AnsiString, this.CaseEndPerson);
            
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
            sb.Append("NC.NotifyLossFee, isnull(C.LossRation, 0) as LossRation, isnull(NC.LastPayFee, 0) as LastPayFee, NC.CaseEndTime ");
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
// SELECT  A.NotifyID,A.NotifySerialNo, B.PolicyNo, A.AccidentReason,  A.NotifyTime, A.AccidentTime,A.NotifyCarrierTime, A.AccidentProc,  
//A.NotifyLossFee, A.DocCompleteDate,A.CaseEndTime, A.LastPayDate, 
//A.LastPayFee,A.NotifyRemark,A.NotifyNo,A.ContactPerson,
//A.ContactPhone,A.CarrierContactPerson,A.CarrierContactPhone,
//B.Beneficiary,B.PremiumBase ,
//(Select CustName from Customer where CustID = B.CustomerID) CustName,
//(Select ProdTypeName From ProductType where ProdTypeID = B.ProdTypeID) ProdTypeName ,
//dbo.GetPolicyCarrier(A.PolicyID) CarrierNameCn ,
//(Select UserNameCn From P_User where UserID=b.SalesID) SalesName
//FROM NotifyClaim A 
//  Left Join Policy B On A.PolicyID = B.PolicyID 


            
            sb.Append("SELECT  A.NotifyID,A.NotifySerialNo, B.PolicyNo, A.AccidentReason,  A.NotifyTime, A.AccidentTime,A.NotifyCarrierTime, A.AccidentProc,   ");
            sb.Append("A.NotifyLossFee, A.DocCompleteDate,A.CaseEndTime, A.LastPayDate,  ");
            sb.Append("A.LastPayFee,A.NotifyRemark,A.NotifyNo,A.ContactPerson,");
            sb.Append("A.LastPayFee,A.NotifyRemark,A.NotifyNo,A.ContactPerson, ");
            sb.Append("A.ContactPhone,A.CarrierContactPerson,A.CarrierContactPhone,");
            sb.Append("B.Beneficiary,B.PremiumBase ,");
            sb.Append("(Select CustName from Customer where CustID = B.CustomerID) CustName,");
            sb.Append("(Select ProdTypeName From ProductType where ProdTypeID = B.ProdTypeID) ProdTypeName , ");
            sb.Append("dbo.GetPolicyCarrier(A.PolicyID) CarrierNameCn , ");
            sb.Append("(Select UserNameCn From P_User where UserID=b.SalesID) SalesName");
            sb.Append(" FROM NotifyClaim A ");
            sb.Append(" Left Join Policy B On A.PolicyID = B.PolicyID ");
            sb.Append(" ");
            sb.Append("Where 1=1 ");
            if (sWhere != "")
            {
                sb.Append(sWhere);
            }
            sb.Append(" Order By A.NotifyID");

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
                if (reader.Read())
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
                    notifyClaim.NotifyLossFee = reader["NotifyLossFee"] == DBNull.Value ? -1 : Convert.ToDouble(reader["NotifyLossFee"]);
                    
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
                    notifyClaim.DocCompleteDate = Utility.GetDatetimeFromReader(reader, FieldList.DocCompleteDate.ToString());
                    notifyClaim.LastPayDate = Utility.GetDatetimeFromReader(reader, FieldList.LastPayDate.ToString());
                    notifyClaim.CaseEndPerson = Utility.GetStringFromReader(reader, FieldList.CaseEndPerson.ToString());
                    notifyClaim.PolicyNo = Utility.GetStringFromReader(reader, FieldList.PolicyNo.ToString());	
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
        public static DataTable GetPolicyByPolicyID(string policyID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("dbo.GetPolicyListByPolicyID");
            DbCommand dbCommand = _db.GetStoredProcCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ac_PolicyID", DbType.AnsiString, policyID);
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


        public static DataSet GetSelectPolicyList(string sWhere)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select ");
            sb.Append("b.PolicyID, b.Beneficiary,  ");
            sb.Append("(Select CustName from Customer where CustID=b.CustomerID) CustomerName, ");
            sb.Append("(Select DeptName from P_department where DeptID=b.DeptID) DeptName, ");
            sb.Append("(Select UserNameCn from p_user where userid=b.SalesID) UserName, ");
            sb.Append("(Select ProdTypeName from ProductType where ProdTypeID=b.ProdTypeID) ProdTypeName, ");
            sb.Append("Convert(varchar(10),b.StartDate,120) StartDate, ");
            sb.Append("Convert(varchar(10),b.EndDate,120) EndDate, ");
            sb.Append("dbo.GetPolicyCarrier(b.PolicyID) CarrierName, ");
            sb.Append("b.PolicyNo, ");
            sb.Append("b.PremiumBase ");
            sb.Append("from Policy b ");
            sb.Append("where ");
            sb.Append(" b.PolicyStatus='2' ");
            sb.Append(" and isnull(b.PrevPolicyID,'') = '' ");
            sb.Append(sWhere);
            sb.Append(" ");

            //DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetFeeNoticeAddSelectList");
            //_db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            //return _db.ExecuteDataSet(dbCommand);
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }
        
        #endregion


        #region reference list

        public static DataSet GetLossTypeList()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select ");
            sb.Append("CodeID AccountTypeID,CodeName AccountTypeName,SortNo ");
            sb.Append(" from p_code where codeType='LossType' ");
            
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }


        public static DataSet GetAccidentReasonList()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select ");
            sb.Append("CodeID AccountTypeID,CodeName AccountTypeName,SortNo ");
            sb.Append(" from p_code where codeType='AccidentReason' ");
            sb.Append(" ");
            sb.Append(" ");
            
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }

        #endregion reference list

    }
}