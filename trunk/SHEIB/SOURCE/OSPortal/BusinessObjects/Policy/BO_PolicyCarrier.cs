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
    public class BO_PolicyCarrier : BaseObject
    {
        public BO_PolicyCarrier() { }

        public BO_PolicyCarrier(String id)
        {
            fetchByID(id);
        }

        #region Variables

        public enum FieldList
        {
            PolicyCarrierID, 
            PolicyID, 
            CarrierID, 
            BranchID, 
            PolicyRate, 
            Premium, 
            PremiumBase, 
            Process, 
            ProcessRate, 
            ProcessBase,
            CarrierNameCn,
            BranchName
        }

        #endregion Variables


        #region Property

        public String PolicyCarrierID
        {
            get;
            set;
        }

        public String PolicyID
        {
            get;
            set;
        }

        public String CarrierID
        {
            get;
            set;
        }

        public String BranchID
        {
            get;
            set;
        }
        
        public Decimal PolicyRate
        {
            get;
            set;
        }

        public Decimal  Premium
        {
            get;
            set;
        }
        public Decimal PremiumBase
        {
            get;
            set;
        }

        public Decimal Process
        {
            get;
            set;
        }
        public Decimal ProcessRate
        {
            get;
            set;
        }

        public Decimal ProcessBase
        {
            get;
            set;
        }

        public String CarrierNameCn
        {
            get;
            set;
        }

        public String BranchName
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

        public static List<BO_PolicyCarrier> FetchListByPolicy(String policyID)
        {
            List<BO_PolicyCarrier> list = new List<BO_PolicyCarrier>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT A.PolicyCarrierID, A.PolicyID, A.CarrierID, A.BranchID, A.PolicyRate, A.Premium, A.PremiumBase, A.Process, A.ProcessRate, A.ProcessBase, ");
            sb.Append(" B.CarrierNameCn, C.BranchName");
            sb.Append(" FROM PolicyCarrier A ");
            sb.Append(" LEFT JOIN Carrier B ON A.CarrierID = B.CarrierID ");
            sb.Append(" LEFT JOIN Branch C ON A.BranchID = C.BranchID ");
            sb.Append(" WHERE A.PolicyID = @PolicyID");
            sb.Append(" ");
            sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyID", DbType.String, policyID);

            BO_PolicyCarrier newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_PolicyCarrier();

                    newObj.PolicyCarrierID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyCarrierID));
                    newObj.PolicyID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyID));
                    newObj.CarrierID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierID));
                    newObj.BranchID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchID));
                    
                    newObj.PolicyRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PolicyRate));

                    newObj.Premium = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Premium));
                    newObj.PremiumBase = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PremiumBase));
                    newObj.Process = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Process));
                    newObj.ProcessRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.ProcessRate));
                    newObj.ProcessBase = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.ProcessBase));

                    newObj.CarrierNameCn = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierNameCn));
                    newObj.BranchName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchName));
                    
                    list.Add(newObj);
                }
            }

            return list;
        }

        public static Boolean CheckPolicyCarrierBranchExist(String where)
        {
            
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT COUNT(A.PolicyCarrierID) ");
            sb.Append(" ");
            sb.Append(" FROM PolicyCarrier A ");
            sb.Append(" LEFT JOIN Carrier B ON A.CarrierID = B.CarrierID ");
            sb.Append(" LEFT JOIN Branch C ON A.BranchID = C.BranchID ");
            sb.Append(" WHERE 1=1 ");
            sb.Append(where);

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            
            Int32 count = Convert.ToInt32(_db.ExecuteScalar(dbCommand));
            if (count > 0)
                return true ;
            else
                return false;

        }

        public static void Delete(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM PolicyCarrier ");
            sb.Append(" WHERE PolicyCarrierID = @PolicyCarrierID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyCarrierID", DbType.String, id);

            _db.ExecuteNonQuery(dbCommand);

            BO_PolicyPeriod.DeleteByPolicyCarrier(id);

        }

        public static void DeleteByPolicyId(String policyId)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM PolicyCarrier ");
            sb.Append(" WHERE PolicyId = @PolicyId ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyId", DbType.String, policyId);

            _db.ExecuteNonQuery(dbCommand);

        }

        #endregion Methods


        #region Procedure


        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO PolicyCarrier ( ");
            sb.Append("PolicyCarrierID, PolicyID, CarrierID, BranchID, PolicyRate,"); 
			sb.Append("Premium, PremiumBase, Process, ProcessRate, ProcessBase"); 
			sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append("@PolicyCarrierID, @PolicyID, @CarrierID, @BranchID, @PolicyRate,");
            sb.Append("@Premium, @PremiumBase, @Process, @ProcessRate, @ProcessBase");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PolicyCarrierID", DbType.String, this.PolicyCarrierID);
            _db.AddInParameter(dbCommand, "@PolicyID", DbType.String, this.PolicyID);
            _db.AddInParameter(dbCommand, "@CarrierID", DbType.String, this.CarrierID);
            _db.AddInParameter(dbCommand, "@BranchID", DbType.String, this.BranchID);


            _db.AddInParameter(dbCommand, "@PolicyRate", DbType.Decimal, this.PolicyRate);
            _db.AddInParameter(dbCommand, "@Premium", DbType.Decimal, this.Premium);
            _db.AddInParameter(dbCommand, "@PremiumBase", DbType.Decimal, this.PremiumBase);
            _db.AddInParameter(dbCommand, "@Process", DbType.Decimal, this.Process);
            _db.AddInParameter(dbCommand, "@ProcessRate", DbType.Decimal, this.ProcessRate);
            _db.AddInParameter(dbCommand, "@ProcessBase", DbType.Decimal, this.ProcessBase);
                        
            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);

            dealWithPolicyPeriod();
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE PolicyCarrier SET ");
            sb.Append("PolicyID=@PolicyID, CarrierID=@CarrierID, BranchID=@BranchID, PolicyRate=@PolicyRate,");
            sb.Append("Premium=@Premium, PremiumBase=@PremiumBase, Process=@Process, ProcessRate=@ProcessRate, ProcessBase=@ProcessBase");
            sb.Append(" Where PolicyCarrierID=@PolicyCarrierID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PolicyCarrierID", DbType.String, this.PolicyCarrierID);
            _db.AddInParameter(dbCommand, "@PolicyID", DbType.String, this.PolicyID);
            _db.AddInParameter(dbCommand, "@CarrierID", DbType.String, this.CarrierID);
            _db.AddInParameter(dbCommand, "@BranchID", DbType.String, this.BranchID);


            _db.AddInParameter(dbCommand, "@PolicyRate", DbType.Decimal, this.PolicyRate);
            _db.AddInParameter(dbCommand, "@Premium", DbType.Decimal, this.Premium);
            _db.AddInParameter(dbCommand, "@PremiumBase", DbType.Decimal, this.PremiumBase);
            _db.AddInParameter(dbCommand, "@Process", DbType.Decimal, this.Process);
            _db.AddInParameter(dbCommand, "@ProcessRate", DbType.Decimal, this.ProcessRate);
            _db.AddInParameter(dbCommand, "@ProcessBase", DbType.Decimal, this.ProcessBase);
            
            _db.ExecuteNonQuery(dbCommand);

            dealWithPolicyPeriod();

        }



        private void fetchByID(String policyCarrierID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT A.PolicyCarrierID, A.PolicyID, A.CarrierID, A.BranchID, A.PolicyRate, A.Premium, A.PremiumBase, A.Process, A.ProcessRate, A.ProcessBase, ");
            sb.Append(" B.CarrierNameCn, C.BranchName");
            sb.Append(" FROM PolicyCarrier A ");
            sb.Append(" LEFT JOIN Carrier B ON A.CarrierID = B.CarrierID ");
            sb.Append(" LEFT JOIN Branch C ON A.BranchID = C.BranchID ");
            sb.Append(" WHERE A.PolicyCarrierID = @PolicyCarrierID");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PolicyCarrierID", DbType.String, policyCarrierID);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.PolicyCarrierID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyCarrierID));
                    this.PolicyID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyID));
                    this.CarrierID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierID));
                    this.BranchID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchID));

                    this.PolicyRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PolicyRate));

                    this.Premium = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Premium));
                    this.PremiumBase = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PremiumBase));
                    this.Process = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Process));
                    this.ProcessRate = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.ProcessRate));
                    this.ProcessBase = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.ProcessBase));

                    this.CarrierNameCn = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierNameCn));
                    this.BranchName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchName));
                }
            }
        }


        private void dealWithPolicyPeriod()
        {
            String where = " AND A.PolicyId ='" + this.PolicyID + "'";
            where += " AND A.BranchID ='" + this.BranchID + "'";
            Boolean exist = BO_PolicyPeriod.CheckPolicyBranchExist(where);
            if (exist)
            {
                //do nothing
            }
            else
            {
                BO_PolicyPeriod objNew;
                BO_Policy objPolicy = new BO_Policy(this.PolicyID);
                Int32 times = objPolicy.PeriodTimes;

                if (times < 1) times = 1;

                for (int i = 1; i <= times; i++)
                {
                    objNew = new BO_PolicyPeriod();
                    objNew.PolPeriodId = Guid.NewGuid().ToString();
                    objNew.PolicyId = this.PolicyID;
                    objNew.CarrierID = this.CarrierID;
                    objNew.BranchID = this.BranchID;
                    objNew.Period = i;
                    objNew.PayDate = DateTime.Now;
                    objNew.PayFeeBase = this.PremiumBase / times;
                    objNew.PayProcBase = this.ProcessBase / times;
                    objNew.NoticeNo = "";
                    objNew.Save(ModifiedAction.Insert);
                }
                
            }
        }


        #endregion Procedure
    
    
    }
}
