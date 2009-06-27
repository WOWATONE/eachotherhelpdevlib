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
    public class BO_Voucher : BaseObject
    {


        public BO_Voucher() { }

        public BO_Voucher(String id) {
            fetchByID(id);
        }

        public enum FieldList
        {            
            VoucherId, 
            VoucherNo, 
            AccountTypeID, 
            FeeDate, 
            Remark, 
            CreateTime, 
            CreatePerson, 
            ModifyTime, 
            ModifyPerson, 
            AuditTime, 
            AuditPerson, 
            InvoiceNO, 
            AuditStatus, 
            ProcessFeeType, 
            CarrierID, 
            BranchID, 
            GatheringType
        }


        #region Property

        public string VoucherId { get; set; }
        public string VoucherNo { get; set; }

        public Int32 AccountTypeID { get; set; }
        public DateTime FeeDate { get; set; }
        public string Remark { get; set; }
        public DateTime CreateTime { get; set; }
        public string CreatePerson { get; set; }
        public DateTime ModifyTime { get; set; }
        public string ModifyPerson { get; set; }
        
        public DateTime AuditTime { get; set; }
        public string AuditPerson { get; set; }
        public string InvoiceNO { get; set; }
        public string AuditStatus { get; set; }
        
        
        public string ProcessFeeType { get; set; }
        public string CarrierID { get; set; }
        public string BranchID { get; set; }
        public string GatheringType { get; set; }


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


        #endregion Methods


        #region Procedure


        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO Voucher ( ");
            sb.Append(" VoucherId, VoucherNo, AccountTypeID, FeeDate, Remark, CreateTime, CreatePerson, ");
            sb.Append(" ModifyTime, ModifyPerson, AuditTime, AuditPerson, InvoiceNO, ");
            sb.Append(" AuditStatus, ProcessFeeType, CarrierID, BranchID, GatheringType ");
            sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append(" @VoucherId, @VoucherNo, @AccountTypeID, @FeeDate, @Remark, @CreateTime, @CreatePerson, ");
            sb.Append(" @ModifyTime, @ModifyPerson, @AuditTime, @AuditPerson, @InvoiceNO, ");
            sb.Append(" @AuditStatus, @ProcessFeeType, @CarrierID, @BranchID, @GatheringType ");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@VoucherId", DbType.String, this.VoucherId);
            _db.AddInParameter(dbCommand, "@VoucherNo", DbType.String, this.VoucherNo);

            _db.AddInParameter(dbCommand, "@AccountTypeID", DbType.Int32, this.AccountTypeID);

            _db.AddInParameter(dbCommand, "@Remark", DbType.String, this.Remark);
            _db.AddInParameter(dbCommand, "@CreatePerson", DbType.String, this.CreatePerson);
            _db.AddInParameter(dbCommand, "@ModifyPerson", DbType.String, this.ModifyPerson);
            _db.AddInParameter(dbCommand, "@AuditPerson", DbType.String, this.AuditPerson);
            _db.AddInParameter(dbCommand, "@InvoiceNO", DbType.String, this.InvoiceNO);
            _db.AddInParameter(dbCommand, "@AuditStatus", DbType.String, this.AuditStatus);
            _db.AddInParameter(dbCommand, "@ProcessFeeType", DbType.String, this.ProcessFeeType);
            _db.AddInParameter(dbCommand, "@CarrierID", DbType.String, this.CarrierID);
            _db.AddInParameter(dbCommand, "@BranchID", DbType.String, this.BranchID);
            _db.AddInParameter(dbCommand, "@GatheringType", DbType.String, this.GatheringType);

            if (this.FeeDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@FeeDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@FeeDate", DbType.DateTime, this.FeeDate);

            if (this.CreateTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, this.CreateTime);

            if (this.ModifyTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@ModifyTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@ModifyTime", DbType.DateTime, this.ModifyTime);

            if (this.AuditTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, this.AuditTime);

            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE Voucher SET ");
            sb.Append(" VoucherNo=@VoucherNo, AccountTypeID=@AccountTypeID, FeeDate=@FeeDate, Remark=@Remark, CreateTime=@CreateTime, ");
            sb.Append(" CreatePerson=@CreatePerson, ModifyTime=@ModifyTime, ModifyPerson=@ModifyPerson, AuditTime=@AuditTime, AuditPerson=@AuditPerson, InvoiceNO=@InvoiceNO, ");
            sb.Append(" AuditStatus=@AuditStatus, ProcessFeeType=@ProcessFeeType, CarrierID=@CarrierID, BranchID=@BranchID, GatheringType=@GatheringType ");
            sb.Append(" Where VoucherId=@VoucherId;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@VoucherId", DbType.String, this.VoucherId);
            _db.AddInParameter(dbCommand, "@VoucherNo", DbType.String, this.VoucherNo);
            
            _db.AddInParameter(dbCommand, "@AccountTypeID", DbType.Int32, this.AccountTypeID);
            
            _db.AddInParameter(dbCommand, "@Remark", DbType.String, this.Remark);
            _db.AddInParameter(dbCommand, "@CreatePerson", DbType.String, this.CreatePerson);
            _db.AddInParameter(dbCommand, "@ModifyPerson", DbType.String, this.ModifyPerson);
            _db.AddInParameter(dbCommand, "@AuditPerson", DbType.String, this.AuditPerson);
            _db.AddInParameter(dbCommand, "@InvoiceNO", DbType.String, this.InvoiceNO);
            _db.AddInParameter(dbCommand, "@AuditStatus", DbType.String, this.AuditStatus);
            _db.AddInParameter(dbCommand, "@ProcessFeeType", DbType.String, this.ProcessFeeType);
            _db.AddInParameter(dbCommand, "@CarrierID", DbType.String, this.CarrierID);
            _db.AddInParameter(dbCommand, "@BranchID", DbType.String, this.BranchID);
            _db.AddInParameter(dbCommand, "@GatheringType", DbType.String, this.GatheringType);

            
            if (this.FeeDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@FeeDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@FeeDate", DbType.DateTime, this.FeeDate);

            if (this.CreateTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@CreateTime", DbType.DateTime, this.CreateTime);

            if (this.ModifyTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@ModifyTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@ModifyTime", DbType.DateTime, this.ModifyTime);

            if (this.AuditTime == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@AuditTime", DbType.DateTime, this.AuditTime);

            _db.ExecuteNonQuery(dbCommand);

        }



        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT  VoucherId, VoucherNo, AccountTypeID, FeeDate, Remark, CreateTime, ");
            sb.Append(" CreatePerson, ModifyTime, ModifyPerson, AuditTime, AuditPerson, InvoiceNO, ");
            sb.Append(" AuditStatus, ProcessFeeType, CarrierID, BranchID, GatheringType ");
            sb.Append(" FROM Voucher ");
            sb.Append(" WHERE VoucherId = @VoucherId");
            sb.Append(" ");
            sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@VoucherId", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    
                    this.VoucherId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.VoucherId));
                    this.VoucherNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.VoucherNo));
                    this.AccountTypeID = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.AccountTypeID));
                    this.FeeDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.FeeDate));
                    
                    this.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                    this.CreateTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.CreateTime));
                    this.CreatePerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CreatePerson));
                    this.ModifyTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.ModifyTime));
                    
                    this.ModifyPerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ModifyPerson));
                    this.AuditTime = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.AuditTime));

                    this.AuditPerson = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AuditPerson));
                    this.InvoiceNO = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.InvoiceNO));
                    this.AuditStatus = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AuditStatus));
                    this.ProcessFeeType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ProcessFeeType));
                    this.CarrierID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierID));
                    this.BranchID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchID));
                    this.GatheringType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.GatheringType));
                    
                }
            }
        }



        #endregion Procedure



    }
}
