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
    public class BO_PolicyPeriod : BaseObject
    {
        public BO_PolicyPeriod() { }
        

        public BO_PolicyPeriod(String id) {
            fetchByID(id);
        }


        #region Variables

        public enum FieldList
        {
            PolPeriodId, 
            PolicyId, 
            CarrierID, 
            BranchID, 
            Period, 
            PayDate, 
            PayFeeBase, 
            PayProcBase, 
            NoticeNo,
            CarrierNameCn,
            BranchName
        }

        #endregion Variables


        #region Property


        public String PolPeriodId
        {
            get;
            set;
        }

        public String PolicyId
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

        public Int32 Period
        {
            get;
            set;
        }

        public DateTime PayDate
        {
            get;
            set;
        }

        public Decimal PayFeeBase
        {
            get;
            set;
        }

        public Decimal PayProcBase
        {
            get;
            set;
        }

        
        public String NoticeNo
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



        public static List<BO_PolicyPeriod> FetchListByPolicy(String policyID)
        {
            List<BO_PolicyPeriod> list = new List<BO_PolicyPeriod>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT A.PolPeriodId, A.PolicyId, A.CarrierID, A.BranchID, A.Period, ");
            sb.Append(" A.PayDate, A.PayFeeBase, A.PayProcBase, A.NoticeNo, B.CarrierNameCn, C.BranchName ");
            sb.Append(" FROM PolicyPeriod A ");
            sb.Append(" LEFT JOIN Carrier B ON B.CarrierID = A.CarrierID ");
            sb.Append(" LEFT JOIN Branch C ON A.BranchID = C.BranchID ");
            sb.Append("  ");
            sb.Append(" WHERE A.PolicyID = @PolicyID");
            sb.Append(" ");
            sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyID", DbType.String, policyID);

            BO_PolicyPeriod newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_PolicyPeriod();

                    newObj.PolPeriodId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolPeriodId));
                    newObj.PolicyId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyId));
                    newObj.CarrierID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierID));
                    newObj.BranchID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchID));

                    newObj.Period = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.Period));

                    newObj.PayDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.PayDate));

                    newObj.PayFeeBase = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PayFeeBase));
                    newObj.PayProcBase = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PayProcBase));

                    newObj.NoticeNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.NoticeNo));
                    newObj.CarrierNameCn = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierNameCn));
                    newObj.BranchName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchName));
                    
                    list.Add(newObj);
                }
            }

            return list;
        }


        public static Boolean CheckPolicyBranchExist(String where)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT COUNT(A.PolPeriodId) ");
            sb.Append(" ");
            sb.Append(" FROM PolicyPeriod A ");
            sb.Append(" LEFT JOIN Carrier B ON A.CarrierID = B.CarrierID ");
            sb.Append(" LEFT JOIN Branch C ON A.BranchID = C.BranchID ");
            sb.Append(" WHERE 1=1 ");
            sb.Append(where);

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            Int32 count = Convert.ToInt32(_db.ExecuteScalar(dbCommand));
            if (count > 0)
                return true;
            else
                return false;

        }

        

        public static void Delete(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM PolicyPeriod ");
            sb.Append(" WHERE PolPeriodId = @PolPeriodId ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolPeriodId", DbType.String, id);

            _db.ExecuteNonQuery(dbCommand);

        }


        public static void Delete(String policyId, String branchID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM PolicyPeriod ");
            sb.Append(" WHERE PolicyId = @PolicyId ");
            sb.Append(" AND BranchID = @BranchID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyId", DbType.String, policyId);
            _db.AddInParameter(dbCommand, "@BranchID", DbType.String, branchID);

            _db.ExecuteNonQuery(dbCommand);

        }


        public static void DeleteByPolicyCarrier(String policyCarrierID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM PolicyPeriod ");
            sb.Append(" WHERE PolicyId IN ");
            sb.Append("  (SELECT PolicyID FROM PolicyCarrier WHERE PolicyCarrierID=@PolicyCarrierID)  ");
            sb.Append(" AND BranchID IN ");
            sb.Append("  (SELECT BranchID FROM PolicyCarrier WHERE PolicyCarrierID=@PolicyCarrierID)  ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PolicyCarrierID", DbType.String, policyCarrierID);

            _db.ExecuteNonQuery(dbCommand);

        }


        public static void DeleteByPolicyId(String policyId)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM PolicyPeriod ");
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
            sb.Append("INSERT INTO PolicyPeriod ( ");
            sb.Append(" PolPeriodId, PolicyId, CarrierID, BranchID, Period,  ");
            sb.Append(" PayDate, PayFeeBase, PayProcBase, NoticeNo");
            sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append(" @PolPeriodId, @PolicyId, @CarrierID, @BranchID, @Period,  ");
            sb.Append(" @PayDate, @PayFeeBase, @PayProcBase, @NoticeNo");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PolPeriodId", DbType.String, this.PolPeriodId);
            _db.AddInParameter(dbCommand, "@PolicyId", DbType.String, this.PolicyId);
            _db.AddInParameter(dbCommand, "@CarrierID", DbType.String, this.CarrierID);
            _db.AddInParameter(dbCommand, "@BranchID", DbType.String, this.BranchID);

            _db.AddInParameter(dbCommand, "@Period", DbType.Int32, this.Period);
            _db.AddInParameter(dbCommand, "@PayDate", DbType.DateTime, this.PayDate);
            _db.AddInParameter(dbCommand, "@PayFeeBase", DbType.Decimal, this.PayFeeBase);
            _db.AddInParameter(dbCommand, "@PayProcBase", DbType.Decimal, this.PayProcBase);

            _db.AddInParameter(dbCommand, "@NoticeNo", DbType.String, this.NoticeNo);
            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE PolicyPeriod SET ");
            sb.Append(" PolicyId=@PolicyId, CarrierID=@CarrierID, BranchID=@BranchID, Period=@Period,  ");
            sb.Append(" PayDate=@PayDate, PayFeeBase=@PayFeeBase, PayProcBase=@PayProcBase, NoticeNo=@NoticeNo ");
            sb.Append(" Where PolPeriodId=@PolPeriodId;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PolPeriodId", DbType.String, this.PolPeriodId);
            _db.AddInParameter(dbCommand, "@PolicyId", DbType.String, this.PolicyId);
            _db.AddInParameter(dbCommand, "@CarrierID", DbType.String, this.CarrierID);
            _db.AddInParameter(dbCommand, "@BranchID", DbType.String, this.BranchID);

            _db.AddInParameter(dbCommand, "@Period", DbType.Int32, this.Period);
            _db.AddInParameter(dbCommand, "@PayDate", DbType.DateTime, this.PayDate);
            _db.AddInParameter(dbCommand, "@PayFeeBase", DbType.Decimal, this.PayFeeBase);
            _db.AddInParameter(dbCommand, "@PayProcBase", DbType.Decimal, this.PayProcBase);

            _db.AddInParameter(dbCommand, "@NoticeNo", DbType.String, this.NoticeNo);
            
            _db.ExecuteNonQuery(dbCommand);

        }



        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT A.PolPeriodId, A.PolicyId, A.CarrierID, A.BranchID, A.Period, ");
            sb.Append(" A.PayDate, A.PayFeeBase, A.PayProcBase, A.NoticeNo, B.CarrierNameCn, C.BranchName ");
            sb.Append(" FROM PolicyPeriod A ");
            sb.Append(" LEFT JOIN Carrier B ON B.CarrierID = A.CarrierID ");
            sb.Append(" LEFT JOIN Branch C ON A.BranchID = C.BranchID ");
            sb.Append("  ");
            sb.Append(" WHERE A.PolPeriodId = @PolPeriodId");
            sb.Append(" ");
            sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PolPeriodId", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.PolPeriodId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolPeriodId));
                    this.PolicyId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyId));
                    this.CarrierID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierID));
                    this.BranchID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchID));
                    
                    this.Period = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.Period));

                    this.PayDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.PayDate));

                    this.PayFeeBase = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PayFeeBase));
                    this.PayProcBase = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.PayProcBase));

                    this.NoticeNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.NoticeNo));
                    this.CarrierNameCn = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierNameCn));
                    this.BranchName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchName));
                    
                }
            }
        }



        #endregion Procedure



    }
}
