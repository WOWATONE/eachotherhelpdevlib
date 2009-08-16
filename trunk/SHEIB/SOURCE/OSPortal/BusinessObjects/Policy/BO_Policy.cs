using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Runtime.Serialization;

namespace BusinessObjects.Policy
{
    [Serializable()]
    [DataContract(Namespace = "http://www.sheib.com")]
    public class BO_Policy : BaseObject
    {

        public BO_Policy() { }

        public BO_Policy(String id)
        {
            fetchByID(id);
        }

        public enum PolicyTypeEnum
        {
            Other,
            Vehicle
        }

        public enum PolicyStatusEnum{
            Input,
            AppealAudit, 
            Audit
        }

        #region Variables
        
        public enum FieldList
        {
            PolicyID, 
            PrevPolicyID, 
            PolicyNo, 
            PolicyType, 
            PolicyStatus, 
            AltNO, 
            FlagAlt, 
            CustomerID, 
            Beneficiary, 
            CarrierSales, 
            DeptId, 
            SalesId, 
            ProdTypeID,
            SignDate, 
            StartDate, 
            EndDate, 
            Currency, 
            Coverage, 
            PremiumRate, 
            Premium, 
            ConversionRate, 
            PremiumBase, 
            Process, 
            ProcessRate, 
            ProcessBase,
            GatheringType, 
            OperationType, 
            SourceTypeID, 
            Special, 
            Remark, 
            AuditTime, 
            AuditPerson, 
            CreateTime, 
            CreatePerson, 
            ModifyTime, 
            ModifyPerson,
            VolumnNo, 
            FlagReinsure, 
            FlagTogether, 
            AciPolicyNo, 
            AskPriceID, 
            BankName, 
            BankAccount, 
            CiPremium, 
            CiProcessRate, 
            CiProcess, 
            AciPremium,
            AciProcessRate, 
            AciProcess, 
            CstPremium, 
            PeriodTimes, 
            CarNo, 
            CarcaseNo, 
            EngineNo, 
            Capacity, 
            UseCharacter, 
            RegisterDate, 
            CarValue, 
            CarUser
        }

        #endregion Variables


        #region Property
        [DataMember]
        public string PolicyID
        {
            get;
            set;
        }

        [DataMember]
        public string PrevPolicyID
        {
            get;
            set;
        }

        [DataMember]
        public string PolicyNo
        {
            get;
            set;
        }

        [DataMember]
        public string PolicyType
        {
            get;
            set;
        }
                

        [DataMember]
        public string PolicyStatus
        {
            get;
            set;
        }

        [DataMember]
        public string AltNO
        {
            get;
            set;
        }

        [DataMember]
        public string FlagAlt
        {
            get;
            set;
        }

        [DataMember]
        public string CustomerID
        {
            get;
            set;
        }

        public string CustomerName
        {
            get
            {
                BusinessObjects.BO_Customer theObj;
                theObj = BusinessObjects.BO_Customer.GetCustomerByID(this.CustomerID);
                if (theObj == null)
                    return "";
                else
                    return theObj.CustName;
            }
        }


        [DataMember]
        public string Beneficiary
        {
            get;
            set;
        }

        [DataMember]
        public string CarrierSales
        {
            get;
            set;
        }

        [DataMember]
        public string DeptId
        {
            get;
            set;
        }

        [DataMember]
        public string SalesId
        {
            get;
            set;
        }

        [DataMember]
        public string ProdTypeID
        {
            get;
            set;
        }

        public string ProdTypeName
        {
            get
            {
                BusinessObjects.SchemaSetting.BO_ProductType thePt;
                thePt = new BusinessObjects.SchemaSetting.BO_ProductType(this.ProdTypeID);
                return thePt.ProdTypeName;
            }
        }

        [DataMember]
        public DateTime SignDate
        {
            get;
            set;
        }

        [DataMember]
        public DateTime StartDate
        {
            get;
            set;
        }

        [DataMember]
        public DateTime EndDate
        {
            get;
            set;
        }

        [DataMember]
        public string Currency
        {
            get;
            set;
        }

        [DataMember]
        public Decimal Coverage
        {
            get;
            set;
        }

        [DataMember]
        public Decimal PremiumRate
        {
            get;
            set;
        }

        [DataMember]
        public Decimal Premium
        {
            get;
            set;
        }

        [DataMember]
        public Decimal ConversionRate
        {
            get;
            set;
        }

        [DataMember]
        public Decimal PremiumBase
        {
            get;
            set;
        }

        [DataMember]
        public Decimal Process
        {
            get;
            set;
        }

        [DataMember]
        public Decimal ProcessRate
        {
            get;
            set;
        }

        [DataMember]
        public Decimal ProcessBase
        {
            get;
            set;
        }


        [DataMember]
        public string GatheringType
        {
            get;
            set;
        }

        [DataMember]
        public string OperationType
        {
            get;
            set;
        }

        [DataMember]
        public string SourceTypeID
        {
            get;
            set;
        }

        [DataMember]
        public string Special
        {
            get;
            set;
        }

        [DataMember]
        public string Remark
        {
            get;
            set;
        }

        [DataMember]
        public DateTime AuditTime
        {
            get;
            set;
        }

        [DataMember]
        public string AuditPerson
        {
            get;
            set;
        }

        [DataMember]
        public DateTime CreateTime
        {
            get;
            set;
        }

        [DataMember]
        public string CreatePerson
        {
            get;
            set;
        }

        [DataMember]
        public DateTime ModifyTime
        {
            get;
            set;
        }

        [DataMember]
        public string ModifyPerson
        {
            get;
            set;
        }

        [DataMember]
        public string VolumnNo
        {
            get;
            set;
        }

        [DataMember]
        public Int32 FlagReinsure
        {
            get;
            set;
        }

        [DataMember]
        public Int32 FlagTogether
        {
            get;
            set;
        }

        [DataMember]
        public string AciPolicyNo
        {
            get;
            set;
        }

        [DataMember]
        public string AskPriceID
        {
            get;
            set;
        }

        [DataMember]
        public string BankName
        {
            get;
            set;
        }

        [DataMember]
        public string BankAccount
        {
            get;
            set;
        }

        [DataMember]
        public Decimal CiPremium
        {
            get;
            set;
        }

        [DataMember]
        public Decimal CiProcessRate
        {
            get;
            set;
        }

        [DataMember]
        public Decimal CiProcess
        {
            get;
            set;
        }

        [DataMember]
        public Decimal AciPremium
        {
            get;
            set;
        }

        [DataMember]
        public Decimal AciProcessRate
        {
            get;
            set;
        }

        [DataMember]
        public Decimal AciProcess
        {
            get;
            set;
        }

        [DataMember]
        public Decimal CstPremium
        {
            get;
            set;
        }

        [DataMember]
        public Int32 PeriodTimes
        {
            get;
            set;
        }

        [DataMember]
        public string CarNo
        {
            get;
            set;
        }

        [DataMember]
        public string CarcaseNo
        {
            get;
            set;
        }

        [DataMember]
        public string EngineNo
        {
            get;
            set;
        }

        [DataMember]
        public string Capacity
        {
            get;
            set;
        }

        [DataMember]
        public string UseCharacter
        {
            get;
            set;
        }

        [DataMember]
        public DateTime RegisterDate
        {
            get;
            set;
        }

        [DataMember]
        public string CarValue
        {
            get;
            set;
        }

        [DataMember]
        public string CarUser
        {
            get;
            set;
        }
         
        #endregion Property


        #region Methods

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

        public static DataTable FetchPolicyCarrierList(String policyStatus)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" SELECT NewID() AS KeyGUID, A.Premium, A.Process, A.PremiumBase, A.ProcessBase, ");
            sb.Append(" B.PolicyID, B.PrevPolicyID, B.PolicyNo, ");
            sb.Append(" B.SalesId, C.UserID, C.UserNameCn, ");
            sb.Append(" B.Coverage, B.CreatePerson, ");
            sb.Append(" B.Currency, H.CurrencyName, ");
            sb.Append(" B.SourceTypeID,I.SourceTypeName, ");
            sb.Append(" B.GatheringType,J.GatheringTypeName, ");
            sb.Append(" B.OperationType,L.OperationTypeName, ");
            sb.Append(" B.FlagReinsure,");
            sb.Append(" CASE WHEN B.FlagReinsure=1 THEN '再保' ELSE '新增' END AS FlagReinsureName,");
            sb.Append(" B.StartDate,B.EndDate,");
            sb.Append(" A.CarrierID, D.CarrierNameCn,  ");
            sb.Append(" A.BranchID, E.BranchName, ");
            sb.Append(" B.CarrierSales, B.DeptId, K.DeptName, ");
            sb.Append(" B.ProdTypeID, F.ProdTypeName, ");
            sb.Append(" B.CustomerID, G.CustName, ");
            sb.Append(" B.CreatePerson,B.CreateTime, ");
            sb.Append(" B.AuditPerson,B.AuditTime, ");
            sb.Append(" B.ModifyPerson,B.ModifyTime, ");
            sb.Append(" B.Remark ");

            sb.Append(" FROM Policy B ");
            sb.Append(" LEFT JOIN PolicyCarrier A ON A.PolicyID = B.PolicyID ");
            sb.Append(" LEFT JOIN P_User C ON B.SalesId = C.UserID ");
            sb.Append(" LEFT JOIN Carrier D ON A.CarrierID = D.CarrierID ");
            sb.Append(" LEFT JOIN Branch E ON A.CarrierID = E.CarrierID AND A.BranchID = E.BranchID ");
            sb.Append(" LEFT JOIN ProductType F ON B.ProdTypeID = F.ProdTypeID ");
            sb.Append(" LEFT JOIN Customer G ON B.CustomerID = G.CustID ");
            sb.Append(" LEFT JOIN Curency H ON H.CurID = B.Currency ");
            sb.Append(" LEFT JOIN SourceType I ON I.SourceTypeID = B.SourceTypeID ");
            sb.Append(" LEFT JOIN GatheringType J ON J.GatheringTypeID = B.GatheringType ");
            sb.Append(" LEFT JOIN P_Department K ON B.DeptID = K.DeptID ");
            sb.Append(" LEFT JOIN OperationType L ON B.OperationType = L.OperationTypeID ");
            sb.Append(" WHERE ISNULL(B.PolicyStatus,'0') = @PolicyStatus ");
            sb.Append(" ORDER BY B.CreateTime DESC  ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyStatus", DbType.String, policyStatus);

            DataSet ds = _db.ExecuteDataSet(dbCommand);
            return ds.Tables[0];
        }

        /// <summary>
        /// 根据用户ID取得保单信息
        /// </summary>
        /// <param name="custID"></param>
        /// <returns></returns>
        public static DataTable GetPolicyByCustID(string custID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select P.PolicyID, P.PolicyNo, P.StartDate, P.EndDate, PT.ProdTypeName, isnull(P.Premium, 0) as Premium, C.CarrierNameCn, B.BranchName, U.UserNameCn ");
            sb.Append("From Policy P (nolock) ");
            sb.Append("Inner Join ProductType PT (nolock) On PT.ProdTypeID=P.ProdTypeID ");
            sb.Append("Inner Join PolicyCarrier PC (nolock) On PC.PolicyID=P.PolicyID ");
            sb.Append("Inner Join Carrier C (nolock) On C.CarrierID=PC.CarrierId ");
            sb.Append("Inner Join Branch B (nolock) On B.BranchID=PC.BranchId ");
            sb.Append("Inner Join P_User U (nolock) On U.UserID=P.SalesID ");
            sb.Append("Where P.CustomerID=@CustID ");
            sb.Append("Order By P.PolicyID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, custID);

            return _db.ExecuteDataSet(dbCommand).Tables[0];
        }

        /// <summary>
        /// 根据用户ID取得保单信息
        /// </summary>
        /// <param name="custID"></param>
        /// <returns></returns>
        public static DataTable GetCustomerPolicy(string custID)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetCustomerPolicy");
            _db.AddInParameter(dbCommand, "@ac_CustomerID", DbType.AnsiString, custID);
            return _db.ExecuteDataSet(dbCommand).Tables[0];
        }

        public static DataTable FetchPolicyList(String sWhere)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" SELECT NewID() AS KeyGUID, A.Premium, A.Process, A.PremiumBase, A.ProcessBase, ");
            sb.Append(" B.PolicyID, B.PrevPolicyID, B.PolicyNo, ISNULL(B.PolicyStatus,'0') AS PolicyStatus, ");
            sb.Append(" ISNULL(B.PolicyType,'0') AS PolicyType, ");
            sb.Append(" B.SalesId, C.UserID, C.UserNameCn, ");
            sb.Append(" B.Coverage, B.CreatePerson, ");
            sb.Append(" B.Currency, H.CurrencyName, ");
            sb.Append(" B.SourceTypeID,I.SourceTypeName, ");
            sb.Append(" B.GatheringType,J.GatheringTypeName, ");
            sb.Append(" B.OperationType,L.OperationTypeName, ");
            sb.Append(" B.FlagReinsure,");
            sb.Append(" CASE WHEN B.FlagReinsure=1 THEN '再保' ELSE '新增' END AS FlagReinsureName,");
            sb.Append(" B.StartDate,B.EndDate,");
            sb.Append(" A.CarrierID, D.CarrierNameCn,  ");
            sb.Append(" A.BranchID, E.BranchName, ");
            sb.Append(" B.CarrierSales, B.DeptId, K.DeptName, ");
            sb.Append(" B.ProdTypeID, F.ProdTypeName, ");
            sb.Append(" B.CustomerID, G.CustName, ");
            sb.Append(" B.CreatePerson,B.CreateTime, ");
            sb.Append(" B.AuditPerson,B.AuditTime, ");
            sb.Append(" B.ModifyPerson,B.ModifyTime, ");
            sb.Append(" B.Remark, B.AskPriceID, B.BankName, B.BankAccount, B.CiPremium, ");
            sb.Append(" B.CiProcessRate, B.CiProcess, B.AciPremium, B.AciProcessRate,  ");
            sb.Append(" B.AciProcess, B.CstPremium, B.PeriodTimes, B.CarNo, B.CarcaseNo, ");
            sb.Append(" B.EngineNo, B.Capacity, B.UseCharacter, B.RegisterDate, B.CarValue, B.CarUser, ");
            sb.Append(" B.AltNO, B.AciPolicyNo ");
            sb.Append(" FROM Policy B ");
            sb.Append(" LEFT JOIN PolicyCarrier A ON A.PolicyID = B.PolicyID ");
            sb.Append(" LEFT JOIN P_User C ON B.SalesId = C.UserID ");
            sb.Append(" LEFT JOIN Carrier D ON A.CarrierID = D.CarrierID ");
            sb.Append(" LEFT JOIN Branch E ON A.CarrierID = E.CarrierID AND A.BranchID = E.BranchID ");
            sb.Append(" LEFT JOIN ProductType F ON B.ProdTypeID = F.ProdTypeID ");
            sb.Append(" LEFT JOIN Customer G ON B.CustomerID = G.CustID ");
            sb.Append(" LEFT JOIN Curency H ON H.CurID = B.Currency ");
            sb.Append(" LEFT JOIN SourceType I ON I.SourceTypeID = B.SourceTypeID ");
            sb.Append(" LEFT JOIN GatheringType J ON J.GatheringTypeID = B.GatheringType ");
            sb.Append(" LEFT JOIN P_Department K ON B.DeptID = K.DeptID ");
            sb.Append(" LEFT JOIN OperationType L ON B.OperationType = L.OperationTypeID ");
            sb.Append(" WHERE 1=1 ");
            sb.Append(sWhere);

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            
            DataSet ds = _db.ExecuteDataSet(dbCommand);
            return ds.Tables[0];
        }

        public static void Delete(String id)
        {
            BO_PolicyCarrier.DeleteByPolicyId(id);
            BO_PolicyClaim.DeleteByPolicyId(id);
            BO_PolicyDoc.DeleteByPolicyId(id);
            BO_PolicyItem.DeleteByPolicyId(id);
            BO_PolicyPeriod.DeleteByPolicyId(id);
            BO_PolicyReinsureCarrier.DeleteByPolicyId(id);
            
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM Policy ");
            sb.Append(" WHERE PolicyID = @PolicyID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyID", DbType.String, id);

            _db.ExecuteNonQuery(dbCommand);

        }


        public static void AuditByAskPriceID(String id, String theStatus)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE Policy SET ");
            sb.Append(" PolicyStatus=@PolicyStatus ");
            sb.Append(" WHERE AskPriceID=@AskPriceID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@AskPriceID", DbType.String, id);
            _db.AddInParameter(dbCommand, "@PolicyStatus", DbType.String, theStatus);
            
            _db.ExecuteNonQuery(dbCommand);

        }


        public static void ChangePeriod(String id)
        {
            List<BO_PolicyCarrier> theList;
            theList = BO_PolicyCarrier.FetchListByPolicy(id);
            BO_PolicyPeriod objNew;

            BO_Policy objPolicy = new BO_Policy(id);
            Int32 times = objPolicy.PeriodTimes;
            if (times < 1) times = 1;

            BO_PolicyPeriod.DeleteByPolicyId(id);

            foreach (BO_PolicyCarrier item in theList)
            {
                for (int i = 1; i <= times; i++)
                {
                    objNew = new BO_PolicyPeriod();
                    objNew.PolPeriodId = Guid.NewGuid().ToString();
                    objNew.PolicyId = item.PolicyID;
                    objNew.CarrierID = item.CarrierID;
                    objNew.BranchID = item.BranchID;
                    objNew.Period = i;
                    objNew.PayDate = DateTime.Now;

                    objNew.PayFeeBase = item.PremiumBase / times;
                    objNew.PayProcBase = item.ProcessBase / times;

                    objNew.NoticeNo = "";
                    objNew.Save(ModifiedAction.Insert);
                }
            }

        }


        public static void ChangePolicyCarrierRateValue(String id)
        {
            BO_Policy objPolicy = new BO_Policy(id);
            List<BO_PolicyCarrier> thelist = BO_PolicyCarrier.FetchListByPolicy(id);
            foreach (BO_PolicyCarrier item in thelist)
            {
                item.Premium = objPolicy.Premium * item.PolicyRate / 100;
                item.PremiumBase = objPolicy.PremiumBase * item.PolicyRate / 100;
                item.Process = objPolicy.Process * item.PolicyRate / 100;
                item.ProcessBase = objPolicy.ProcessBase * item.PolicyRate / 100;
                item.Save(ModifiedAction.Update);
            }
        }


        public static DataSet GetPolicyFee(string sPolicyID)
        {

            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.spGetPolicyFee");
            _db.AddInParameter(dbCommand, "@ac_PolicyID", DbType.String, sPolicyID);
            return _db.ExecuteDataSet(dbCommand);
            //return null;
        }


        public static void AuditPolicy(String policyID, 
            String auditStatus, String person, String remark, 
            ref Int32 resultSign, ref String resultMsg)
        {
            BO_Policy theObj = new BO_Policy(policyID);
            if (theObj.PolicyType == Convert.ToInt32(PolicyTypeEnum.Vehicle).ToString())
                AuditVehiclePolicy(policyID, auditStatus, person, remark, ref resultSign, ref resultMsg);
            else
                AuditOtherPolicy(policyID, auditStatus, person, remark, ref resultSign, ref resultMsg);
        }


        public static void AuditPolicySubmit(String policyID,
            String auditStatus, String person, 
            ref Int32 resultSign, ref String resultMsg)
        {
            BO_Policy theObj = new BO_Policy(policyID);
            if (theObj.PolicyType == Convert.ToInt32(PolicyTypeEnum.Vehicle).ToString())
                AuditVehiclePolicySubmit(policyID, auditStatus, person,  ref resultSign, ref resultMsg);
            else
                AuditOtherPolicySubmit(policyID, auditStatus, person, ref resultSign, ref resultMsg);
        }

        #endregion Methods


        #region Procedure

        private void fetchByID(String policyID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT ");
            sb.Append("PolicyID, PrevPolicyID, PolicyNo, PolicyType, PolicyStatus, ");
            sb.Append("AltNO, FlagAlt, CustomerID, Beneficiary, CarrierSales, ");
            sb.Append("DeptId, SalesId, ProdTypeID, SignDate, StartDate, ");
            sb.Append("EndDate, Currency, Coverage, PremiumRate, Premium, ");
            sb.Append("ConversionRate, PremiumBase, Process, ProcessRate, ProcessBase, ");
            sb.Append("GatheringType, OperationType, SourceTypeID, Special, Remark, ");
            sb.Append("AuditTime, AuditPerson, CreateTime, CreatePerson, ModifyTime, ");
            sb.Append("ModifyPerson, VolumnNo, FlagReinsure, FlagTogether, AciPolicyNo, ");
            sb.Append("AskPriceID, BankName, BankAccount, CiPremium, CiProcessRate,  ");
            sb.Append("CiProcess, AciPremium, AciProcessRate, AciProcess, CstPremium,  ");
            sb.Append("PeriodTimes, CarNo, CarcaseNo, EngineNo, Capacity, ");
            sb.Append("UseCharacter, RegisterDate, CarValue, CarUser ");
            
            sb.Append(" FROM Policy ");
            sb.Append(" WHERE PolicyID = @PolicyID ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PolicyID", DbType.String, policyID);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.PolicyID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyID));
                    this.PrevPolicyID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PrevPolicyID));
                    this.PolicyNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyNo));
                    this.PolicyType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyType));
                    this.PolicyStatus = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyStatus));
                    this.AltNO = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AltNO));
                    this.FlagAlt = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.FlagAlt));
                    this.CustomerID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustomerID));
                    this.Beneficiary = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Beneficiary));
                    this.CarrierSales = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierSales));
                    this.DeptId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptId));
                    this.SalesId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.SalesId));
                    this.ProdTypeID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProdTypeID));

                    this.SignDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.SignDate));
                    this.StartDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.StartDate));
                    this.EndDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.EndDate));

                    this.Currency = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Currency));

                    this.Coverage = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Coverage));
                    this.PremiumRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PremiumRate));
                    this.Premium = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Premium));
                    this.ConversionRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.ConversionRate));
                    this.PremiumBase = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PremiumBase));
                    this.Process = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Process));
                    this.ProcessRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.ProcessRate));
                    this.ProcessBase = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.ProcessBase));

                    this.GatheringType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.GatheringType));
                    this.OperationType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.OperationType));
                    this.SourceTypeID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.SourceTypeID));
                    this.Special = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Special));
                    this.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));

                    this.AuditTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.AuditTime));

                    this.AuditPerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AuditPerson));

                    this.CreateTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.CreateTime));

                    this.CreatePerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CreatePerson));

                    this.ModifyTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.ModifyTime));

                    this.ModifyPerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ModifyPerson));

                    this.VolumnNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.VolumnNo));
                    this.FlagReinsure = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.FlagReinsure));
                    this.FlagTogether = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.FlagTogether));

                    this.AciPolicyNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AciPolicyNo));
                    this.AskPriceID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AskPriceID));
                    this.BankName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankName));
                    this.BankAccount = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankAccount));

                    this.CiPremium = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.CiPremium));
                    this.CiProcessRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.CiProcessRate));
                    this.CiProcess = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.CiProcess));
                    this.AciPremium = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.AciPremium));
                    this.AciProcessRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.AciProcessRate));
                    this.AciProcess = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.AciProcess));
                    this.CstPremium = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.CstPremium));
                   
                    this.PeriodTimes = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.PeriodTimes));

                    this.CarNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarNo));
                    this.CarcaseNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarcaseNo));
                    this.EngineNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.EngineNo));
                    this.Capacity = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Capacity));
                    this.UseCharacter = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UseCharacter));

                    this.RegisterDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.RegisterDate));

                    this.CarValue = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarValue));
                    this.CarUser = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarUser));

                    
                }
            }
        }


        private void add()
        {
            StringBuilder sb = new StringBuilder();
			sb.Append("INSERT INTO Policy ( PolicyID, PrevPolicyID, PolicyNo,"); 
			sb.Append("PolicyType, PolicyStatus, AltNO, FlagAlt,"); 
			sb.Append("CustomerID, Beneficiary, CarrierSales,"); 
			sb.Append("DeptId, SalesId, ProdTypeID,"); 
			sb.Append("SignDate, StartDate, EndDate, Currency,"); 
			sb.Append("Coverage, PremiumRate, Premium, ConversionRate,"); 
			sb.Append("PremiumBase, Process, ProcessRate, ProcessBase,"); 
			sb.Append("GatheringType, OperationType, SourceTypeID,"); 
			sb.Append("Special, Remark, AuditTime, AuditPerson, CreateTime,"); 
			sb.Append("CreatePerson, ModifyTime, ModifyPerson,"); 
			sb.Append("VolumnNo, FlagReinsure, FlagTogether, AciPolicyNo,"); 
			sb.Append("AskPriceID, BankName, BankAccount, CiPremium, CiProcessRate,"); 
			sb.Append("CiProcess, AciPremium, AciProcessRate, AciProcess, ");
			sb.Append("CstPremium, PeriodTimes,CarNo, CarcaseNo, ");
			sb.Append("EngineNo, Capacity, UseCharacter,");
			sb.Append("RegisterDate, CarValue, CarUser");
            sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append("@PolicyID, @PrevPolicyID, @PolicyNo,");
            sb.Append("@PolicyType, @PolicyStatus, @AltNO, @FlagAlt,");
            sb.Append("@CustomerID, @Beneficiary, @CarrierSales,");
            sb.Append("@DeptId, @SalesId, @ProdTypeID,");
            sb.Append("@SignDate, @StartDate, @EndDate, @Currency,");
            sb.Append("@Coverage, @PremiumRate, @Premium, @ConversionRate,");
            sb.Append("@PremiumBase, @Process, @ProcessRate, @ProcessBase,");
            sb.Append("@GatheringType, @OperationType, @SourceTypeID,");
            sb.Append("@Special, @Remark, @AuditTime, @AuditPerson, @CreateTime,");
            sb.Append("@CreatePerson, @ModifyTime, @ModifyPerson,");
            sb.Append("@VolumnNo, @FlagReinsure, @FlagTogether, @AciPolicyNo,");
            sb.Append("@AskPriceID, @BankName, @BankAccount, @CiPremium, @CiProcessRate,");
            sb.Append("@CiProcess, @AciPremium, @AciProcessRate, @AciProcess, ");
            sb.Append("@CstPremium, @PeriodTimes,@CarNo, @CarcaseNo, ");
            sb.Append("@EngineNo, @Capacity, @UseCharacter,");
            sb.Append("@RegisterDate, @CarValue, @CarUser");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PolicyID", DbType.String, this.PolicyID);
            _db.AddInParameter(dbCommand, "@PrevPolicyID", DbType.String, this.PrevPolicyID);
            _db.AddInParameter(dbCommand, "@PolicyNo", DbType.String, this.PolicyNo);
            _db.AddInParameter(dbCommand, "@PolicyType", DbType.String, this.PolicyType);
            _db.AddInParameter(dbCommand, "@PolicyStatus", DbType.String, this.PolicyStatus);
            _db.AddInParameter(dbCommand, "@AltNO", DbType.String, this.AltNO);
            _db.AddInParameter(dbCommand, "@FlagAlt", DbType.String, this.FlagAlt);
            _db.AddInParameter(dbCommand, "@CustomerID", DbType.String, this.CustomerID);
            _db.AddInParameter(dbCommand, "@Beneficiary", DbType.String, this.Beneficiary);
            _db.AddInParameter(dbCommand, "@CarrierSales", DbType.String, this.CarrierSales);
            _db.AddInParameter(dbCommand, "@DeptId", DbType.String, this.DeptId);
            _db.AddInParameter(dbCommand, "@SalesId", DbType.String, this.SalesId);
            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.String, this.ProdTypeID);

            if (this.SignDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@SignDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@SignDate", DbType.DateTime, this.SignDate);

            if (this.StartDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@StartDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@StartDate", DbType.DateTime, this.StartDate);

            if (this.EndDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@EndDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@EndDate", DbType.DateTime, this.EndDate);

            _db.AddInParameter(dbCommand, "@Currency", DbType.String, this.Currency);
            _db.AddInParameter(dbCommand, "@Coverage", DbType.Decimal, this.Coverage);
            _db.AddInParameter(dbCommand, "@PremiumRate", DbType.Decimal, this.PremiumRate);
            _db.AddInParameter(dbCommand, "@Premium", DbType.Decimal, this.Premium);
            _db.AddInParameter(dbCommand, "@ConversionRate", DbType.Decimal, this.ConversionRate);
            _db.AddInParameter(dbCommand, "@PremiumBase", DbType.Decimal, this.PremiumBase);
            _db.AddInParameter(dbCommand, "@Process", DbType.Decimal, this.Process);
            _db.AddInParameter(dbCommand, "@ProcessRate", DbType.Decimal, this.ProcessRate);
            _db.AddInParameter(dbCommand, "@ProcessBase", DbType.Decimal, this.ProcessBase);
            _db.AddInParameter(dbCommand, "@GatheringType", DbType.String, this.GatheringType);
            _db.AddInParameter(dbCommand, "@OperationType", DbType.String, this.OperationType);
            _db.AddInParameter(dbCommand, "@SourceTypeID", DbType.String, this.SourceTypeID);
            _db.AddInParameter(dbCommand, "@Special", DbType.String, this.Special);
            _db.AddInParameter(dbCommand, "@Remark", DbType.String, this.Remark);

            if (this.AuditTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, this.AuditTime);

            

            _db.AddInParameter(dbCommand, "@AuditPerson", DbType.String, this.AuditPerson);

            if (this.CreateTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, DateTime.Now);
            else
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, this.CreateTime);

            _db.AddInParameter(dbCommand, "@CreatePerson", DbType.String, this.CreatePerson);

            if (this.ModifyTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@ModifyTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@ModifyTime", DbType.DateTime, this.ModifyTime);

            _db.AddInParameter(dbCommand, "@ModifyPerson", DbType.String, this.ModifyPerson);
            _db.AddInParameter(dbCommand, "@VolumnNo", DbType.String, this.VolumnNo);
            _db.AddInParameter(dbCommand, "@FlagReinsure", DbType.Int32, this.FlagReinsure);
            _db.AddInParameter(dbCommand, "@FlagTogether", DbType.Int32, this.FlagTogether);
            _db.AddInParameter(dbCommand, "@AciPolicyNo", DbType.String, this.AciPolicyNo);
            _db.AddInParameter(dbCommand, "@AskPriceID", DbType.String, this.AskPriceID);
            _db.AddInParameter(dbCommand, "@BankName", DbType.String, this.BankName);
            _db.AddInParameter(dbCommand, "@BankAccount", DbType.String, this.BankAccount);
            _db.AddInParameter(dbCommand, "@CiPremium", DbType.Decimal, this.CiPremium);
            _db.AddInParameter(dbCommand, "@CiProcessRate", DbType.Decimal, this.CiProcessRate);
            _db.AddInParameter(dbCommand, "@CiProcess", DbType.Decimal, this.CiProcess);
            _db.AddInParameter(dbCommand, "@AciPremium", DbType.Decimal, this.AciPremium);
            _db.AddInParameter(dbCommand, "@AciProcessRate", DbType.Decimal, this.AciProcessRate);
            _db.AddInParameter(dbCommand, "@AciProcess", DbType.Decimal, this.AciProcess);
            _db.AddInParameter(dbCommand, "@CstPremium", DbType.Decimal, this.CstPremium);

            if (this.PeriodTimes < 1)
                _db.AddInParameter(dbCommand, "@PeriodTimes", DbType.Int32, 1);
            else
                _db.AddInParameter(dbCommand, "@PeriodTimes", DbType.Int32, this.PeriodTimes);
            
            _db.AddInParameter(dbCommand, "@CarNo", DbType.String, this.CarNo);
            _db.AddInParameter(dbCommand, "@CarcaseNo", DbType.String, this.CarcaseNo);
            _db.AddInParameter(dbCommand, "@EngineNo", DbType.String, this.EngineNo);
            _db.AddInParameter(dbCommand, "@Capacity", DbType.String, this.Capacity);
            _db.AddInParameter(dbCommand, "@UseCharacter", DbType.String, this.UseCharacter);
            
            if (this.RegisterDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@RegisterDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@RegisterDate", DbType.DateTime, this.RegisterDate);

            _db.AddInParameter(dbCommand, "@CarValue", DbType.String, this.CarValue);
            _db.AddInParameter(dbCommand, "@CarUser", DbType.String, this.CarUser);


            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);            

        }


        private void update()
        {
            
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE Policy SET ");
            sb.Append("PrevPolicyID=@PrevPolicyID, PolicyNo=@PolicyNo,");
            sb.Append("PolicyType=@PolicyType, PolicyStatus=@PolicyStatus, AltNO=@AltNO, FlagAlt=@FlagAlt,");
            sb.Append("CustomerID=@CustomerID, Beneficiary=@Beneficiary, CarrierSales=@CarrierSales,");
            sb.Append("DeptId=@DeptId, SalesId=@SalesId, ProdTypeID=@ProdTypeID,");
            sb.Append("SignDate=@SignDate, StartDate=@StartDate, EndDate=@EndDate, Currency=@Currency,");
            sb.Append("Coverage=@Coverage, PremiumRate=@PremiumRate, Premium=@Premium, ConversionRate=@ConversionRate,");
            sb.Append("PremiumBase=@PremiumBase, Process=@Process, ProcessRate=@ProcessRate, ProcessBase=@ProcessBase,");
            sb.Append("GatheringType=@GatheringType, OperationType=@OperationType, SourceTypeID=@SourceTypeID,");
            sb.Append("Special=@Special, Remark=@Remark, AuditTime=@AuditTime, AuditPerson=@AuditPerson, CreateTime=@CreateTime,");
            sb.Append("CreatePerson=@CreatePerson, ModifyTime=@ModifyTime, ModifyPerson=@ModifyPerson,");
            sb.Append("VolumnNo=@VolumnNo, FlagReinsure=@FlagReinsure, FlagTogether=@FlagTogether, AciPolicyNo=@AciPolicyNo,");
            sb.Append("AskPriceID=@AskPriceID, BankName=@BankName, BankAccount=@BankAccount, CiPremium=@CiPremium, CiProcessRate=@CiProcessRate,");
            sb.Append("CiProcess=@CiProcess, AciPremium=@AciPremium, AciProcessRate=@AciProcessRate, AciProcess=@AciProcess, ");
            sb.Append("CstPremium=@CstPremium, PeriodTimes=@PeriodTimes,CarNo=@CarNo, CarcaseNo=@CarcaseNo, ");
            sb.Append("EngineNo=@EngineNo, Capacity=@Capacity, UseCharacter=@UseCharacter,");
            sb.Append("RegisterDate=@RegisterDate, CarValue=@CarValue, CarUser=@CarUser");
            sb.Append(" Where PolicyID=@PolicyID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PolicyID", DbType.String, this.PolicyID);
            _db.AddInParameter(dbCommand, "@PrevPolicyID", DbType.String, this.PrevPolicyID);
            _db.AddInParameter(dbCommand, "@PolicyNo", DbType.String, this.PolicyNo);
            _db.AddInParameter(dbCommand, "@PolicyType", DbType.String, this.PolicyType);
            _db.AddInParameter(dbCommand, "@PolicyStatus", DbType.String, this.PolicyStatus);
            _db.AddInParameter(dbCommand, "@AltNO", DbType.String, this.AltNO);
            _db.AddInParameter(dbCommand, "@FlagAlt", DbType.String, this.FlagAlt);
            _db.AddInParameter(dbCommand, "@CustomerID", DbType.String, this.CustomerID);
            _db.AddInParameter(dbCommand, "@Beneficiary", DbType.String, this.Beneficiary);
            _db.AddInParameter(dbCommand, "@CarrierSales", DbType.String, this.CarrierSales);
            _db.AddInParameter(dbCommand, "@DeptId", DbType.String, this.DeptId);
            _db.AddInParameter(dbCommand, "@SalesId", DbType.String, this.SalesId);
            _db.AddInParameter(dbCommand, "@ProdTypeID", DbType.String, this.ProdTypeID);

            if (this.SignDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@SignDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@SignDate", DbType.DateTime, this.SignDate);

            if (this.StartDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@StartDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@StartDate", DbType.DateTime, this.StartDate);

            if (this.EndDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@EndDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@EndDate", DbType.DateTime, this.EndDate);

            _db.AddInParameter(dbCommand, "@Currency", DbType.String, this.Currency);
            _db.AddInParameter(dbCommand, "@Coverage", DbType.Decimal, this.Coverage);
            _db.AddInParameter(dbCommand, "@PremiumRate", DbType.Decimal, this.PremiumRate);
            _db.AddInParameter(dbCommand, "@Premium", DbType.Decimal, this.Premium);
            _db.AddInParameter(dbCommand, "@ConversionRate", DbType.Decimal, this.ConversionRate);
            _db.AddInParameter(dbCommand, "@PremiumBase", DbType.Decimal, this.PremiumBase);
            _db.AddInParameter(dbCommand, "@Process", DbType.Decimal, this.Process);
            _db.AddInParameter(dbCommand, "@ProcessRate", DbType.Decimal, this.ProcessRate);
            _db.AddInParameter(dbCommand, "@ProcessBase", DbType.Decimal, this.ProcessBase);
            _db.AddInParameter(dbCommand, "@GatheringType", DbType.String, this.GatheringType);
            _db.AddInParameter(dbCommand, "@OperationType", DbType.String, this.OperationType);
            _db.AddInParameter(dbCommand, "@SourceTypeID", DbType.String, this.SourceTypeID);
            _db.AddInParameter(dbCommand, "@Special", DbType.String, this.Special);
            _db.AddInParameter(dbCommand, "@Remark", DbType.String, this.Remark);

            if (this.AuditTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, this.AuditTime);

            
            _db.AddInParameter(dbCommand, "@AuditPerson", DbType.String, this.AuditPerson);

            if (this.CreateTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, this.CreateTime);

            _db.AddInParameter(dbCommand, "@CreatePerson", DbType.String, this.CreatePerson);

            if (this.ModifyTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@ModifyTime", DbType.DateTime, DateTime.Now);
            else
                _db.AddInParameter(dbCommand, "@ModifyTime", DbType.DateTime, this.ModifyTime);

            _db.AddInParameter(dbCommand, "@ModifyPerson", DbType.String, this.ModifyPerson);
            _db.AddInParameter(dbCommand, "@VolumnNo", DbType.String, this.VolumnNo);
            _db.AddInParameter(dbCommand, "@FlagReinsure", DbType.Int32, this.FlagReinsure);
            _db.AddInParameter(dbCommand, "@FlagTogether", DbType.Int32, this.FlagTogether);
            _db.AddInParameter(dbCommand, "@AciPolicyNo", DbType.String, this.AciPolicyNo);
            _db.AddInParameter(dbCommand, "@AskPriceID", DbType.String, this.AskPriceID);
            _db.AddInParameter(dbCommand, "@BankName", DbType.String, this.BankName);
            _db.AddInParameter(dbCommand, "@BankAccount", DbType.String, this.BankAccount);
            _db.AddInParameter(dbCommand, "@CiPremium", DbType.Decimal, this.CiPremium);
            _db.AddInParameter(dbCommand, "@CiProcessRate", DbType.Decimal, this.CiProcessRate);
            _db.AddInParameter(dbCommand, "@CiProcess", DbType.Decimal, this.CiProcess);
            _db.AddInParameter(dbCommand, "@AciPremium", DbType.Decimal, this.AciPremium);
            _db.AddInParameter(dbCommand, "@AciProcessRate", DbType.Decimal, this.AciProcessRate);
            _db.AddInParameter(dbCommand, "@AciProcess", DbType.Decimal, this.AciProcess);
            _db.AddInParameter(dbCommand, "@CstPremium", DbType.Decimal, this.CstPremium);

            if (this.PeriodTimes < 1)
                _db.AddInParameter(dbCommand, "@PeriodTimes", DbType.Int32, 1);
            else
                _db.AddInParameter(dbCommand, "@PeriodTimes", DbType.Int32, this.PeriodTimes);
            
            _db.AddInParameter(dbCommand, "@CarNo", DbType.String, this.CarNo);
            _db.AddInParameter(dbCommand, "@CarcaseNo", DbType.String, this.CarcaseNo);
            _db.AddInParameter(dbCommand, "@EngineNo", DbType.String, this.EngineNo);
            _db.AddInParameter(dbCommand, "@Capacity", DbType.String, this.Capacity);
            _db.AddInParameter(dbCommand, "@UseCharacter", DbType.String, this.UseCharacter);

            if (this.RegisterDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@RegisterDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@RegisterDate", DbType.DateTime, this.RegisterDate);

            
            _db.AddInParameter(dbCommand, "@CarValue", DbType.String, this.CarValue);
            _db.AddInParameter(dbCommand, "@CarUser", DbType.String, this.CarUser);

            Boolean needChangePeriod = false;
            BO_Policy theCompare = new BO_Policy(this.PolicyID);

            if (theCompare.PeriodTimes != this.PeriodTimes) needChangePeriod = true;
            if (theCompare.Coverage != this.Coverage) needChangePeriod = true;
            if (theCompare.Premium != this.Premium) needChangePeriod = true;
            if (theCompare.PremiumBase != this.PremiumBase) needChangePeriod = true;
            if (theCompare.PremiumRate != this.PremiumRate) needChangePeriod = true;
            if (theCompare.Process != this.Process) needChangePeriod = true;
            if (theCompare.ProcessBase != this.ProcessBase) needChangePeriod = true;
            if (theCompare.ProcessRate != this.ProcessRate) needChangePeriod = true;
            if (theCompare.CiPremium != this.CiPremium) needChangePeriod = true;
            if (theCompare.CiProcessRate != this.CiProcessRate) needChangePeriod = true;
            if (theCompare.CiProcess != this.CiProcess) needChangePeriod = true;

            try
            {
                _db.ExecuteNonQuery(dbCommand);

                if (needChangePeriod)
                {
                    ChangePolicyCarrierRateValue(this.PolicyID);
                    ChangePeriod(this.PolicyID);                    
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

            

        }


        private static void AuditOtherPolicy(String policyID,
            String auditStatus, String person, String remark,
            ref Int32 resultSign, ref String resultMsg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("[dbo].[AuditPolicy]");

            DbCommand dbCommand = _db.GetStoredProcCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ac_PolicyID", DbType.String, policyID);
            _db.AddInParameter(dbCommand, "@ac_AuditStatus", DbType.String, auditStatus);
            _db.AddInParameter(dbCommand, "@ac_AuditPersion", DbType.String, person);
            _db.AddInParameter(dbCommand, "@ac_Remark", DbType.String, remark);
            _db.AddOutParameter(dbCommand, "@ai_dm", DbType.Int32, 32);
            _db.AddOutParameter(dbCommand, "@ac_sm", DbType.String, 100);


            _db.ExecuteNonQuery(dbCommand);

            resultSign = Convert.ToInt32(_db.GetParameterValue(dbCommand, "@ai_dm"));
            resultMsg = Convert.ToString(_db.GetParameterValue(dbCommand, "@ac_sm"));

        }


        private static void AuditVehiclePolicy(String policyID,
            String auditStatus, String person, String remark,
            ref Int32 resultSign, ref String resultMsg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("[dbo].[AuditCarPolicy]");

            DbCommand dbCommand = _db.GetStoredProcCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ac_PolicyID", DbType.String, policyID);
            _db.AddInParameter(dbCommand, "@ac_AuditStatus", DbType.String, auditStatus);
            _db.AddInParameter(dbCommand, "@ac_AuditPersion", DbType.String, person);
            _db.AddInParameter(dbCommand, "@ac_Remark", DbType.String, remark);
            _db.AddOutParameter(dbCommand, "@ai_dm", DbType.Int32, 32);
            _db.AddOutParameter(dbCommand, "@ac_sm", DbType.String, 100);


            _db.ExecuteNonQuery(dbCommand);

            resultSign = Convert.ToInt32(_db.GetParameterValue(dbCommand, "@ai_dm"));
            resultMsg = Convert.ToString(_db.GetParameterValue(dbCommand, "@ac_sm"));

        }


        private static void AuditOtherPolicySubmit(String policyID,
            String auditStatus, String person,
            ref Int32 resultSign, ref String resultMsg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("[dbo].[AuditPolicySubmit]");

            DbCommand dbCommand = _db.GetStoredProcCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ac_PolicyID", DbType.String, policyID);
            _db.AddInParameter(dbCommand, "@ac_AuditStatus", DbType.String, auditStatus);
            _db.AddInParameter(dbCommand, "@ac_AuditPersion", DbType.String, person);
            _db.AddOutParameter(dbCommand, "@ai_dm", DbType.Int32, 32);
            _db.AddOutParameter(dbCommand, "@ac_sm", DbType.String, 100);


            _db.ExecuteNonQuery(dbCommand);

            resultSign = Convert.ToInt32(_db.GetParameterValue(dbCommand, "@ai_dm"));
            resultMsg = Convert.ToString(_db.GetParameterValue(dbCommand, "@ac_sm"));

        }

        private static void AuditVehiclePolicySubmit(String policyID,
            String auditStatus, String person,
            ref Int32 resultSign, ref String resultMsg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("[dbo].[AuditCarPolicySubmit]");

            DbCommand dbCommand = _db.GetStoredProcCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ac_PolicyID", DbType.String, policyID);
            _db.AddInParameter(dbCommand, "@ac_AuditStatus", DbType.String, auditStatus);
            _db.AddInParameter(dbCommand, "@ac_AuditPersion", DbType.String, person);
            _db.AddOutParameter(dbCommand, "@ai_dm", DbType.Int32, 32);
            _db.AddOutParameter(dbCommand, "@ac_sm", DbType.String, 100);


            _db.ExecuteNonQuery(dbCommand);

            resultSign = Convert.ToInt32(_db.GetParameterValue(dbCommand, "@ai_dm"));
            resultMsg = Convert.ToString(_db.GetParameterValue(dbCommand, "@ac_sm"));

        }


        //取保单综合信息
        public static DataSet GetPolicyByCarrier(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetPolicyByCarrier");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetPolicyList(string sWhere)
        {
            DbCommand dbCommand = _db.GetStoredProcCommand("dbo.GetPolicyList");
            _db.AddInParameter(dbCommand, "@ac_where", DbType.String, sWhere);
            return _db.ExecuteDataSet(dbCommand);
        }

        #endregion Procedure


    }
}
