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
    public class BO_NotifyClaimFollow: BaseObject
    {
        public BO_NotifyClaimFollow() { }

        public BO_NotifyClaimFollow(Int32 id)
        {
            fetchByID(id);
        }
        public enum FieldList
        {
            FollowID, 
            NotifyID, 
            FollowDate, 
            FollowContent, 
            FollowNextContent, 
            LoseStatus, 
            EstimateFeel
        }

        #region Property

        /**/
        public Int32 FollowID { get; set; }

        /**/
        public string NotifyID { get; set; }

        /**/
        public DateTime FollowDate { get; set; }

        /**/
        public string FollowContent { get; set; }

        /**/
        public string FollowNextContent { get; set; }

        /**/
        public string LoseStatus { get; set; }

        /**/
        public string LoseStatusName { get; set; }

        /**/
        public Double EstimateFeel { get; set; }
        
        #endregion

        #region Methods

        private void fetchByID(Int32 id)
        {
            string query = "SELECT  FollowID, NotifyID, FollowDate,  ";
            query += " FollowContent, FollowNextContent, ";
            query += "LoseStatus, EstimateFeel ";
            query += "";
            query += " FROM NotifyClaimFollow Where FollowID = @ID";
            query += "";

            DbCommand dbCommand = _db.GetSqlStringCommand(query);

            _db.AddInParameter(dbCommand, "@ID", DbType.Int32, id);

            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.FollowID = Utility.GetIntFromReader(reader, FieldList.FollowID.ToString());
                    this.NotifyID = reader.GetString(Convert.ToInt32(FieldList.NotifyID));
                    this.FollowDate = Utility.GetDatetimeFromReader(reader, FieldList.FollowDate.ToString());
                    this.FollowContent = Utility.GetStringFromReader(reader, FieldList.FollowContent.ToString());
                    this.FollowNextContent = Utility.GetStringFromReader(reader, FieldList.FollowNextContent.ToString());
                    this.LoseStatus = Utility.GetStringFromReader(reader, FieldList.LoseStatus.ToString());
                    this.EstimateFeel = Utility.GetDoubleFromReader(reader, FieldList.EstimateFeel.ToString());        
                }
            }
        }

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

        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO NotifyClaimFollow( ");
            sb.Append("NotifyID, FollowDate, FollowContent, ");
            sb.Append("FollowNextContent, LoseStatus, EstimateFeel ");
            sb.Append(" ");
            sb.Append(") ");
            sb.Append(" VALUES(");
            sb.Append("@NotifyID, @FollowDate, @FollowContent, ");
            sb.Append("@FollowNextContent, @LoseStatus, @EstimateFeel "); 
            sb.Append(" ");
            sb.Append(") ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "NotifyID", DbType.AnsiString, this.NotifyID);
            _db.AddInParameter(dbCommand, "FollowDate", DbType.DateTime, this.FollowDate);
            _db.AddInParameter(dbCommand, "FollowContent", DbType.AnsiString, this.FollowContent);
            _db.AddInParameter(dbCommand, "FollowNextContent", DbType.DateTime, this.FollowNextContent);

            _db.AddInParameter(dbCommand, "LoseStatus", DbType.AnsiString, this.LoseStatus);
            _db.AddInParameter(dbCommand, "EstimateFeel", DbType.Double, this.EstimateFeel);

            Int32 theNewID;
            theNewID = Convert.ToInt32(_db.ExecuteScalar(dbCommand));

            fetchByID(theNewID);
        }

        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update NotifyClaimFollow ");
            sb.Append("Set ");
            sb.Append("NotifyID=@NotifyID, ");
            sb.Append("FollowDate=@FollowDate, ");
            sb.Append("FollowContent=@FollowContent, ");
            sb.Append("FollowNextContent=@FollowNextContent, ");
            sb.Append("LoseStatus=@LoseStatus, ");
            sb.Append("EstimateFeel=@EstimateFeel ");
            sb.Append(" ");
            sb.Append("Where FollowID=@FollowID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "FollowID", DbType.Int32, this.FollowID);
            _db.AddInParameter(dbCommand, "NotifyID", DbType.AnsiString, this.NotifyID);
            _db.AddInParameter(dbCommand, "FollowDate", DbType.DateTime, this.FollowDate);
            _db.AddInParameter(dbCommand, "FollowContent", DbType.AnsiString, this.FollowContent);
            _db.AddInParameter(dbCommand, "FollowNextContent", DbType.DateTime, this.FollowNextContent);

            _db.AddInParameter(dbCommand, "LoseStatus", DbType.AnsiString, this.LoseStatus);
            _db.AddInParameter(dbCommand, "EstimateFeel", DbType.Double, this.EstimateFeel);

            _db.ExecuteNonQuery(dbCommand);
        }

        public static void Delete(Int32 ID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM NotifyClaimFollow WHERE FollowID = @FollowID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@FollowID", DbType.Int32, ID);

            _db.ExecuteNonQuery(dbCommand);
        }


        public static DataSet GetNotifyClaimFollowListByNotifyID(String notifyID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT FollowID, NotifyID, FollowDate, ");
            sb.Append("FollowContent, FollowNextContent, ");
            sb.Append("LoseStatus, EstimateFeel, ");
            sb.Append("(select CodeName from p_code where codeType='LoseStatus' and CodeID=LoseStatus) LoseStatusName ");
            
            sb.Append("");
            sb.Append("");
            sb.Append("FROM NotifyClaimFollow");
            sb.Append("WHERE NotifyID = @NotifyID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@NotifyID", DbType.AnsiString, notifyID);
            return _db.ExecuteDataSet(dbCommand);
        }


        #endregion


        #region reference list

        public static DataSet GetLoseStatusList()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select ");
            sb.Append("CodeID AccountTypeID,CodeName AccountTypeName,SortNo ");
            sb.Append(" from p_code where codeType='LoseStatus' ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }

        #endregion reference list


    }
}
