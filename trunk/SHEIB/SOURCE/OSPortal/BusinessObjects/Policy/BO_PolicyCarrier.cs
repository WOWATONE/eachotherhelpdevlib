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
            ProcessBase
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
            sb.Append("SELECT PolicyCarrierID, PolicyID, CarrierID, BranchID, PolicyRate, Premium, PremiumBase, Process, ProcessRate, ProcessBase ");
            sb.Append(" FROM PolicyCarrier ");
            sb.Append(" WHERE PolicyID = @PolicyID");
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
                    
                    list.Add(newObj);
                }
            }

            return list;
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

        }


        #endregion Procedure
    }
}
