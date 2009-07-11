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
    public class BO_CarPolicy : BaseObject
    {

        public BO_CarPolicy() { }

        public BO_CarPolicy(String id)
        {
            fetchByID(id);
        }


        #region Variables

        public enum FieldList
        {
            AskPriceID, 
            TradeNo, 
            CustomerID, 
            Beneficiary, 
            DeptId, 
            CarrierSales, 
            SalesId, 
            SignDate, 
            Coverage, 
            PremiumBase, 
            ProcessRate, 
            ProcessBase,
            PolicyStatus, 
            GatheringType, 
            OperationType, 
            SourceTypeID, 
            Remark, 
            AuditTime, 
            AuditPerson, 
            AuditContent, 
            CreateTime, 
            CreatePerson, 
            ModifyTime,
            ModifyPerson, 
            VolumnNo, 
            CarCount, 
            BankName, 
            BankAccount
        }

        #endregion Variables


        #region Property
        
         
        [DataMember]
        public string AskPriceID
        {
            get;
            set;
        }

        [DataMember]
        public string TradeNo
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
        public string DeptId
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
        public string SalesId
        {
            get;
            set;
        }

        [DataMember]
        public DateTime SignDate
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
        public Decimal PremiumBase
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
        public string PolicyStatus
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
        public string AuditContent
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
        public Int32 CarCount
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


        public static DataTable FetchPolicyList(String sWhere)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" SELECT NewID() AS KeyGUID, A.Premium, A.Process, A.PremiumBase, A.ProcessBase, ");
            sb.Append(" B.PolicyID, B.PrevPolicyID, B.PolicyNo, ");
            sb.Append(" B.SalesId, C.UserID, C.UserNameCn, ");
            sb.Append(" B.Coverage, B.CreatePerson, ");
            sb.Append(" B.Currency, H.CurrencyName, ");
            sb.Append(" B.SourceTypeID,I.SourceTypeName, ");
            sb.Append(" B.GatheringType,J.GatheringTypeName, ");
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
            sb.Append(" WHERE 1=1 ");
            sb.Append(sWhere);

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            DataSet ds = _db.ExecuteDataSet(dbCommand);
            return ds.Tables[0];
        }

        #endregion Methods



        #region Procedure

        private void fetchByID(String askPriceID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT ");            
            sb.Append("AskPriceID, TradeNo, CustomerID, Beneficiary, DeptId, ");
            sb.Append("CarrierSales, SalesId, SignDate, Coverage, PremiumBase, ");
            sb.Append("ProcessRate, ProcessBase, ");
            sb.Append("PolicyStatus, GatheringType, OperationType, ");
            sb.Append("SourceTypeID, Remark, AuditTime, AuditPerson, AuditContent, ");
            sb.Append("CreateTime, CreatePerson, ModifyTime, ");
            sb.Append("ModifyPerson, VolumnNo, CarCount, BankName, BankAccount ");
            
            sb.Append(" FROM CarPolicy ");
            sb.Append(" WHERE AskPriceID = @AskPriceID ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@AskPriceID", DbType.String, askPriceID);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.AskPriceID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AskPriceID));
                    this.TradeNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.TradeNo));
                    this.CustomerID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustomerID));
                    this.Beneficiary = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Beneficiary));
                    this.PolicyStatus = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyStatus));
                    this.DeptId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptId));
                    this.CarrierSales = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierSales));
                    this.SalesId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.SalesId));
                    
                    this.SignDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.SignDate));
                    
                    
                    this.Coverage = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Coverage));
                    this.PremiumBase = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PremiumBase));
                    this.ProcessRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.ProcessRate));
                    this.ProcessBase = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.ProcessBase));

                    this.GatheringType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.GatheringType));
                    this.OperationType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.OperationType));
                    this.SourceTypeID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.SourceTypeID));
                    this.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));

                    this.AuditTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.AuditTime));
                    this.AuditContent = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AuditContent));

                    this.AuditPerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AuditPerson));

                    this.CreateTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.CreateTime));

                    this.CreatePerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CreatePerson));

                    this.ModifyTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.ModifyTime));

                    this.ModifyPerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ModifyPerson));

                    this.VolumnNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.VolumnNo));
                    this.CarCount = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.CarCount));
                    
                    this.BankName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankName));
                    this.BankAccount = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankAccount));
                }
            }

        }


        private void add()
        {
            StringBuilder sb = new StringBuilder();
                       
            sb.Append("INSERT INTO CarPolicy ( AskPriceID, TradeNo, CustomerID, Beneficiary,");
            sb.Append("DeptId, CarrierSales, SalesId, SignDate, Coverage,");
            sb.Append("PremiumBase, ProcessRate, ProcessBase,");
            sb.Append("PolicyStatus, GatheringType, OperationType,");
            sb.Append("SourceTypeID, Remark, AuditTime, AuditPerson,");
            sb.Append("AuditContent, CreateTime, CreatePerson, ModifyTime,");
            sb.Append("ModifyPerson, VolumnNo, CarCount, BankName, BankAccount");            
            sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append("@AskPriceID, @TradeNo, @CustomerID, @Beneficiary,");
            sb.Append("@DeptId, @CarrierSales, @SalesId, @SignDate, @Coverage,");
            sb.Append("@PremiumBase, @ProcessRate, @ProcessBase,");
            sb.Append("@PolicyStatus, @GatheringType, @OperationType,");
            sb.Append("@SourceTypeID, @Remark, @AuditTime, @AuditPerson,");
            sb.Append("@AuditContent, @CreateTime, @CreatePerson, @ModifyTime,");
            sb.Append("@ModifyPerson, @VolumnNo, @CarCount, @BankName, @BankAccount");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            
            _db.AddInParameter(dbCommand, "@AskPriceID", DbType.String, this.AskPriceID);
            _db.AddInParameter(dbCommand, "@TradeNo", DbType.String, this.TradeNo);
            _db.AddInParameter(dbCommand, "@PolicyStatus", DbType.String, this.PolicyStatus);
            _db.AddInParameter(dbCommand, "@CustomerID", DbType.String, this.CustomerID);
            _db.AddInParameter(dbCommand, "@Beneficiary", DbType.String, this.Beneficiary);
            _db.AddInParameter(dbCommand, "@CarrierSales", DbType.String, this.CarrierSales);
            _db.AddInParameter(dbCommand, "@DeptId", DbType.String, this.DeptId);
            _db.AddInParameter(dbCommand, "@SalesId", DbType.String, this.SalesId);
            
            if (this.SignDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@SignDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@SignDate", DbType.DateTime, this.SignDate);

            _db.AddInParameter(dbCommand, "@Coverage", DbType.Decimal, this.Coverage);
            _db.AddInParameter(dbCommand, "@PremiumBase", DbType.Decimal, this.PremiumBase);
            _db.AddInParameter(dbCommand, "@ProcessRate", DbType.Decimal, this.ProcessRate);
            _db.AddInParameter(dbCommand, "@ProcessBase", DbType.Decimal, this.ProcessBase);
            _db.AddInParameter(dbCommand, "@GatheringType", DbType.String, this.GatheringType);
            _db.AddInParameter(dbCommand, "@OperationType", DbType.String, this.OperationType);
            _db.AddInParameter(dbCommand, "@SourceTypeID", DbType.String, this.SourceTypeID);
            _db.AddInParameter(dbCommand, "@Remark", DbType.String, this.Remark);

            if (this.AuditTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, this.AuditTime);



            _db.AddInParameter(dbCommand, "@AuditPerson", DbType.String, this.AuditPerson);
            _db.AddInParameter(dbCommand, "@AuditContent", DbType.String, this.AuditContent);

            if (this.CreateTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, DateTime.Now);
            else
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, DateTime.Now);

            _db.AddInParameter(dbCommand, "@CreatePerson", DbType.String, this.CreatePerson);

            if (this.ModifyTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@ModifyTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@ModifyTime", DbType.DateTime, this.ModifyTime);

            _db.AddInParameter(dbCommand, "@ModifyPerson", DbType.String, this.ModifyPerson);
            _db.AddInParameter(dbCommand, "@VolumnNo", DbType.String, this.VolumnNo);
            _db.AddInParameter(dbCommand, "@CarCount", DbType.Int32, this.CarCount);
            
            _db.AddInParameter(dbCommand, "@BankName", DbType.String, this.BankName);
            _db.AddInParameter(dbCommand, "@BankAccount", DbType.String, this.BankAccount);
            
            
            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE CarPolicy SET ");
            sb.Append("TradeNo=@TradeNo, CustomerID=@CustomerID, Beneficiary=@Beneficiary, DeptId=@DeptId,");
            sb.Append("CarrierSales=@CarrierSales, SalesId=@,SalesId SignDate=@SignDate, Coverage=@Coverage, PremiumBase=@PremiumBase,");
            sb.Append("ProcessRate=@ProcessRate, ProcessBase=@ProcessBase, PolicyStatus=@PolicyStatus, GatheringType=@GatheringType,");
            sb.Append("OperationType=@OperationType, SourceTypeID=@SourceTypeID, Remark=@Remark, AuditTime=@AuditTime, ");
            sb.Append("AuditPerson=@AuditPerson, AuditContent=@AuditContent, CreateTime=@CreateTime, CreatePerson=@CreatePerson, ModifyTime=@ModifyTime,");
            sb.Append("ModifyPerson=@ModifyPerson, VolumnNo=@VolumnNo, CarCount=@CarCount, BankName=@BankName, BankAccount=@BankAccount");
            sb.Append(" Where AskPriceID=@AskPriceID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());


            _db.AddInParameter(dbCommand, "@AskPriceID", DbType.String, this.AskPriceID);
            _db.AddInParameter(dbCommand, "@TradeNo", DbType.String, this.TradeNo);
            _db.AddInParameter(dbCommand, "@PolicyStatus", DbType.String, this.PolicyStatus);
            _db.AddInParameter(dbCommand, "@CustomerID", DbType.String, this.CustomerID);
            _db.AddInParameter(dbCommand, "@Beneficiary", DbType.String, this.Beneficiary);
            _db.AddInParameter(dbCommand, "@CarrierSales", DbType.String, this.CarrierSales);
            _db.AddInParameter(dbCommand, "@DeptId", DbType.String, this.DeptId);
            _db.AddInParameter(dbCommand, "@SalesId", DbType.String, this.SalesId);

            if (this.SignDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@SignDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@SignDate", DbType.DateTime, this.SignDate);

            _db.AddInParameter(dbCommand, "@Coverage", DbType.Decimal, this.Coverage);
            _db.AddInParameter(dbCommand, "@PremiumBase", DbType.Decimal, this.PremiumBase);
            _db.AddInParameter(dbCommand, "@ProcessRate", DbType.Decimal, this.ProcessRate);
            _db.AddInParameter(dbCommand, "@ProcessBase", DbType.Decimal, this.ProcessBase);
            _db.AddInParameter(dbCommand, "@GatheringType", DbType.String, this.GatheringType);
            _db.AddInParameter(dbCommand, "@OperationType", DbType.String, this.OperationType);
            _db.AddInParameter(dbCommand, "@SourceTypeID", DbType.String, this.SourceTypeID);
            _db.AddInParameter(dbCommand, "@Remark", DbType.String, this.Remark);

            if (this.AuditTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, this.AuditTime);



            _db.AddInParameter(dbCommand, "@AuditPerson", DbType.String, this.AuditPerson);
            _db.AddInParameter(dbCommand, "@AuditContent", DbType.String, this.AuditContent);

            if (this.CreateTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, DateTime.Now);
            else
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, DateTime.Now);

            _db.AddInParameter(dbCommand, "@CreatePerson", DbType.String, this.CreatePerson);

            if (this.ModifyTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@ModifyTime", DbType.DateTime, DateTime.Now);
            else
                _db.AddInParameter(dbCommand, "@ModifyTime", DbType.DateTime, this.ModifyTime);

            _db.AddInParameter(dbCommand, "@ModifyPerson", DbType.String, this.ModifyPerson);
            _db.AddInParameter(dbCommand, "@VolumnNo", DbType.String, this.VolumnNo);
            _db.AddInParameter(dbCommand, "@CarCount", DbType.Int32, this.CarCount);

            _db.AddInParameter(dbCommand, "@BankName", DbType.String, this.BankName);
            _db.AddInParameter(dbCommand, "@BankAccount", DbType.String, this.BankAccount);
            
            
            try
            {
                _db.ExecuteNonQuery(dbCommand);
            }
            catch (Exception ex)
            {
                throw ex;
            }



        }


        #endregion Procedure


    }
}
