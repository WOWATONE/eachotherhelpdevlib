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

        public enum CarPolicyStatusEnum
        {
            Input,
            AppealAudit,
            Audit
        }

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
            BankAccount,
            CarrierID,
            BranchID
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
           
        [DataMember]
        public string CarrierID{
            get;
            set;
        }

        [DataMember]
        public string BranchID
        {
            get;
            set;
        }


        [DataMember]
        public string CreatePersonName
        {
            get
            {
                String userID;
                userID = this.CreatePerson;
                BusinessObjects.BO_P_User theUser = new BusinessObjects.BO_P_User(userID);
                if (theUser.UserID != null)
                    return theUser.UserNameCn;
                else
                    return "";
            }
        }


        [DataMember]
        public string AuditPersonName
        {
            get
            {
                String userID;
                userID = this.AuditPerson;
                BusinessObjects.BO_P_User theUser = new BusinessObjects.BO_P_User(userID);
                if (theUser.UserID != null)
                    return theUser.UserNameCn;
                else
                    return "";
            }
        }

        [DataMember]
        public string ModifyPersonName
        {
            get
            {
                String userID;
                userID = this.ModifyPerson;
                BusinessObjects.BO_P_User theUser = new BusinessObjects.BO_P_User(userID);
                if (theUser.UserID != null)
                    return theUser.UserNameCn;
                else
                    return "";
            }
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


        public static DataTable FetchCarPolicyList(String sWhere)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(" SELECT ");
            sb.Append(" A1.AskPriceID, A1.TradeNo, A1.CustomerID, ");
            sb.Append(" A1.Beneficiary, A1.DeptId,");
            sb.Append(" A1.CarrierSales, ");
            sb.Append(" A1.SignDate, ISNULL(A1.PolicyStatus,'0') AS PolicyStatus,");
            sb.Append(" A1.GatheringType, A1.OperationType,");
            sb.Append(" A1.SourceTypeID, A1.Remark,");
            sb.Append(" A1.AuditTime, A1.AuditPerson,");
            sb.Append(" A1.AuditContent, M.UserNameCn AS CreatePersonName, A1.CreateTime,");
            sb.Append(" A1.CreatePerson, A1.ModifyTime,");
            sb.Append(" A1.ModifyPerson, A1.VolumnNo,");
            sb.Append(" A1.CarCount, A1.BankName,");
            sb.Append(" A1.BankAccount, A1.CarrierID, A1.BranchID,");
            sb.Append(" A1.SalesId, C.UserID, C.UserNameCn AS SalesIdName, ");
            sb.Append(" I.SourceTypeName, ");
            sb.Append(" J.GatheringTypeName, ");
            sb.Append(" L.OperationTypeName, ");
            sb.Append(" D.CarrierNameCn,  ");
            sb.Append(" E.BranchName, ");
            sb.Append(" K.DeptName, ");
            sb.Append(" G.CustName, ");
            sb.Append(" (Select Count(PolicyId) As CarNumber From Policy Where PolicyType = '1' And AskPriceID = A1.AskPriceID) As CarNumber ");
            sb.Append(" FROM CarPolicy A1 ");
            sb.Append(" LEFT JOIN P_User C ON A1.SalesId = C.UserID ");
            sb.Append(" LEFT JOIN Carrier D ON A1.CarrierID = D.CarrierID ");
            sb.Append(" LEFT JOIN Branch E ON A1.CarrierID = E.CarrierID AND A1.BranchID = E.BranchID ");

            sb.Append(" LEFT JOIN Customer G ON A1.CustomerID = G.CustID ");

            sb.Append(" LEFT JOIN SourceType I ON I.SourceTypeID = A1.SourceTypeID ");
            sb.Append(" LEFT JOIN GatheringType J ON J.GatheringTypeID = A1.GatheringType ");
            sb.Append(" LEFT JOIN P_Department K ON A1.DeptID = K.DeptID ");
            sb.Append(" LEFT JOIN OperationType L ON L.OperationTypeID = A1.OperationType ");
            sb.Append(" LEFT JOIN P_User M ON A1.CreatePerson = M.UserID ");
            sb.Append(" WHERE 1=1 ");
            sb.Append(sWhere);
            sb.Append(" ORDER BY A1.CreateTime DESC  ");
            
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            
            DataSet ds = _db.ExecuteDataSet(dbCommand);
            return ds.Tables[0];
        }


        public static void Delete(String id)
        {
            BO_CarPolicyDoc.DeleteByAskPriceID(id);

            DataTable dt = BO_Policy.FetchPolicyList(" AND B.AskPriceID = '" + id + "'");
            foreach (DataRow dr in dt.Rows)
            {
                String theID = dr["PolicyID"].ToString();
                BO_Policy.Delete(theID);
            }

            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM CarPolicy ");
            sb.Append(" WHERE AskPriceID = @AskPriceID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@AskPriceID", DbType.String, id);
            
            _db.ExecuteNonQuery(dbCommand);

        }

        public static void AuditCarPolicy(String askPriceID,
            String auditStatus, String person, String remark,
            ref Int32 resultSign, ref String resultMsg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("[dbo].[AuditAskPrice]");

            DbCommand dbCommand = _db.GetStoredProcCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ac_AskPriceID", DbType.String, askPriceID);
            _db.AddInParameter(dbCommand, "@ac_AuditStatus", DbType.String, auditStatus);
            _db.AddInParameter(dbCommand, "@ac_AuditPersion", DbType.String, person);
            //_db.AddInParameter(dbCommand, "@ac_Remark", DbType.String, remark);
            _db.AddOutParameter(dbCommand, "@ai_dm", DbType.Int32, 32);
            _db.AddOutParameter(dbCommand, "@ac_sm", DbType.String, 100);


            _db.ExecuteNonQuery(dbCommand);

            if (Convert.IsDBNull(_db.GetParameterValue(dbCommand, "@ai_dm")))
            {
                resultSign = 0;
            }
            else
            {
                resultSign = Convert.ToInt32(_db.GetParameterValue(dbCommand, "@ai_dm"));
            }
            if (Convert.IsDBNull(_db.GetParameterValue(dbCommand, "@ac_sm")))
                resultMsg = "";
            else
                resultMsg = Convert.ToString(_db.GetParameterValue(dbCommand, "@ac_sm"));
            
        }


        public static void AuditCarPolicySubmit(String askPriceID,
            String auditStatus, String person, String remark,
            ref Int32 resultSign, ref String resultMsg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("[dbo].[AuditAskPrice]");

            DbCommand dbCommand = _db.GetStoredProcCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ac_AskPriceID", DbType.String, askPriceID);
            _db.AddInParameter(dbCommand, "@ac_AuditStatus", DbType.String, auditStatus);
            _db.AddInParameter(dbCommand, "@ac_AuditPersion", DbType.String, person);
            //_db.AddInParameter(dbCommand, "@ac_Remark", DbType.String, remark);
            _db.AddOutParameter(dbCommand, "@ai_dm", DbType.Int32, 32);
            _db.AddOutParameter(dbCommand, "@ac_sm", DbType.String, 100);


            _db.ExecuteNonQuery(dbCommand);

            if (Convert.IsDBNull(_db.GetParameterValue(dbCommand, "@ai_dm")))
            {
                resultSign = 0;
            }
            else
            {
                resultSign = Convert.ToInt32(_db.GetParameterValue(dbCommand, "@ai_dm"));
            }
            if (Convert.IsDBNull(_db.GetParameterValue(dbCommand, "@ac_sm")))
                resultMsg = "";
            else
                resultMsg = Convert.ToString(_db.GetParameterValue(dbCommand, "@ac_sm"));
            

            //resultSign = 0;
            //resultMsg = "提交审核成功。";
        }


        #endregion Methods



        #region Procedure

        private void fetchByID(String askPriceID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT ");            
            sb.Append("AskPriceID, TradeNo, CustomerID, Beneficiary, DeptId, ");
            sb.Append("CarrierSales, SalesId, SignDate,");
            sb.Append("PolicyStatus, GatheringType, OperationType, ");
            sb.Append("SourceTypeID, Remark, AuditTime, AuditPerson, AuditContent, ");
            sb.Append("CreateTime, CreatePerson, ModifyTime, ");
            sb.Append("ModifyPerson, VolumnNo, CarCount, BankName, BankAccount, CarrierID, BranchID ");
            
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

                    this.CarrierID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierID));
                    this.BranchID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchID));
                }
            }

        }


        private void add()
        {
            StringBuilder sb = new StringBuilder();
                       
            sb.Append("INSERT INTO CarPolicy ( AskPriceID, TradeNo, CustomerID, Beneficiary,");
            sb.Append("DeptId, CarrierSales, SalesId, SignDate,");
            sb.Append("PolicyStatus, GatheringType, OperationType,");
            sb.Append("SourceTypeID, Remark, AuditTime, AuditPerson,");
            sb.Append("AuditContent, CreateTime, CreatePerson, ModifyTime,");
            sb.Append("ModifyPerson, VolumnNo, CarCount, BankName, BankAccount, ");
            sb.Append("CarrierID, BranchID");
            sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append("@AskPriceID, @TradeNo, @CustomerID, @Beneficiary,");
            sb.Append("@DeptId, @CarrierSales, @SalesId, @SignDate,");
            sb.Append("@PolicyStatus, @GatheringType, @OperationType,");
            sb.Append("@SourceTypeID, @Remark, @AuditTime, @AuditPerson,");
            sb.Append("@AuditContent, @CreateTime, @CreatePerson, @ModifyTime,");
            sb.Append("@ModifyPerson, @VolumnNo, @CarCount, @BankName, @BankAccount,");
            sb.Append("@CarrierID, @BranchID");
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
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, this.CreateTime);

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

            _db.AddInParameter(dbCommand, "@CarrierID", DbType.String, this.CarrierID );
            _db.AddInParameter(dbCommand, "@BranchID", DbType.String, this.BranchID);
            
            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE CarPolicy SET ");
            sb.Append("TradeNo=@TradeNo, CustomerID=@CustomerID, Beneficiary=@Beneficiary,");
            sb.Append("DeptId=@DeptId,CarrierSales=@CarrierSales, SalesId=@SalesId,");
            sb.Append("SignDate=@SignDate,PolicyStatus=@PolicyStatus, GatheringType=@GatheringType,");
            sb.Append("OperationType=@OperationType, SourceTypeID=@SourceTypeID, Remark=@Remark,");
            sb.Append("AuditTime=@AuditTime, AuditPerson=@AuditPerson, AuditContent=@AuditContent,");
            sb.Append("CreateTime=@CreateTime, CreatePerson=@CreatePerson, ModifyTime=@ModifyTime,");
            sb.Append("ModifyPerson=@ModifyPerson, VolumnNo=@VolumnNo, CarCount=@CarCount,");
            sb.Append("BankName=@BankName, BankAccount=@BankAccount,CarrierID=@CarrierID,");
            sb.Append("BranchID=@BranchID");
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
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, this.CreateTime);

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

            _db.AddInParameter(dbCommand, "@CarrierID", DbType.String, this.CarrierID);
            _db.AddInParameter(dbCommand, "@BranchID", DbType.String, this.BranchID);
            
            try
            {
                _db.ExecuteNonQuery(dbCommand);
            }
            catch (Exception ex)
            {
                throw ex;
            }


            StringBuilder sb1 = new StringBuilder();
            sb1.Append("UPDATE Policy SET ");
            sb1.Append(" CreateTime=@CreateTime");
            sb1.Append(" Where AskPriceID is not null and AskPriceID=@AskPriceID");

            DbCommand dbCommandPolicy = _db.GetSqlStringCommand(sb1.ToString());
            _db.AddInParameter(dbCommandPolicy, "@AskPriceID", DbType.String, this.AskPriceID);
            if (this.CreateTime == DateTime.MinValue)
                _db.AddInParameter(dbCommandPolicy, "@CreateTime", DbType.DateTime, DateTime.Now);
            else
                _db.AddInParameter(dbCommandPolicy, "@CreateTime", DbType.DateTime, this.CreateTime);

            try
            {
                _db.ExecuteNonQuery(dbCommandPolicy);
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }


        #endregion Procedure


    }
}
