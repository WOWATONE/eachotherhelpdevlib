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
    public class BO_Fee : BaseObject
    {


        public BO_Fee() { }

        public BO_Fee(String id)
        {
            fetchByID(id);
        }

        public enum FieldList
        {
            FeeId,
            VoucherID,
            PolPeriodID,
            Fee,
            FeeAdjust
        }

        #region Property

        public string FeeId { get; set; }
        public string VoucherID { get; set; }
        public string PolPeriodID { get; set; }
        public Decimal  Fee { get; set; }
        public Decimal FeeAdjust { get; set; }


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


        public static void Delete(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM Fee ");
            sb.Append(" WHERE FeeId = @FeeId ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@FeeId", DbType.String, id);

            _db.ExecuteNonQuery(dbCommand);

        }


        public static Boolean PolPeriodExist(string polPeriodId)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT COUNT(PolPeriodID) ");
            sb.Append(" ");
            sb.Append(" FROM Fee ");
            sb.Append(" WHERE PolPeriodID=@PolPeriodID ");
            
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PolPeriodID", DbType.String, polPeriodId);
            
            Int32 count = Convert.ToInt32(_db.ExecuteScalar(dbCommand));
            if (count > 0)
                return true;
            else
                return false;
        }

        #endregion Methods


        #region Procedure


        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO Fee ( ");
            sb.Append("  FeeId, PolPeriodID, VoucherID, Fee, FeeAdjust ");
            sb.Append(")");
            sb.Append(" VALUES( ");
            sb.Append("  @FeeId, @PolPeriodID, @VoucherID, @Fee, @FeeAdjust ");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@FeeId", DbType.String, this.FeeId);
            _db.AddInParameter(dbCommand, "@PolPeriodID", DbType.String, this.PolPeriodID);
            _db.AddInParameter(dbCommand, "@VoucherID", DbType.String, this.VoucherID);
            
            _db.AddInParameter(dbCommand, "@Fee", DbType.Decimal, this.Fee);
            _db.AddInParameter(dbCommand, "@FeeAdjust", DbType.Decimal, this.FeeAdjust);

            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE Fee SET ");
            sb.Append(" PolPeriodID=@PolPeriodID, VoucherID=@VoucherID, Fee=@Fee, FeeAdjust=@FeeAdjust ");
            sb.Append(" Where FeeId=@FeeId;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@FeeId", DbType.String, this.FeeId);
            _db.AddInParameter(dbCommand, "@PolPeriodID", DbType.String, this.PolPeriodID);
            _db.AddInParameter(dbCommand, "@VoucherID", DbType.String, this.VoucherID);

            _db.AddInParameter(dbCommand, "@Fee", DbType.Decimal, this.Fee);
            _db.AddInParameter(dbCommand, "@FeeAdjust", DbType.Decimal, this.FeeAdjust);

            _db.ExecuteNonQuery(dbCommand);

        }



        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT  FeeId, PolPeriodID, VoucherID, Fee, FeeAdjust ");
            sb.Append(" FROM Fee ");
            sb.Append(" WHERE FeeId = @FeeId");
            sb.Append(" ");
            sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@FeeId", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.FeeId = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.FeeId));
                    this.PolPeriodID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolPeriodID));
                    this.VoucherID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.VoucherID));
                    
                    this.Fee = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.Fee));

                    this.FeeAdjust = Utility.GetDecimalFromReader(reader, Convert.ToInt32(FieldList.FeeAdjust));

                }
            }
        }



        #endregion Procedure



    }
}
