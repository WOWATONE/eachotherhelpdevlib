using System;
using System.Collections.Generic;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;

namespace BusinessObjects
{
    public class SampleTemplate : BaseObject
    {
        public SampleTemplate(){ }

        public SampleTemplate(Int32 id)
        {
            fetchByID(id);
        }



        public enum FieldList
        {
            ResearchID,
            Title,
            Enable,
            CreatedDate
        }



        #region Property

        private Int32 _researchID;
        public Int32 ResearchID
        {
            get { return _researchID; }
        }

        public string Title
        {
            get;set;
        }

        public bool Enable
        {
            get;set;
        }

        private DateTime _createdDate;
        public DateTime CreatedDate
        {
            get { return _createdDate; }
        }

        #endregion Property


        #region Methods

        public void Save()
        {
            if (this.ResearchID > IdentityInitialValue)
            {
                update();
            }
            else
            {
                add();
            }
        }

        public static List<SampleTemplate> FetchList()
        {
            List<SampleTemplate> list = new List<SampleTemplate>();

            string query = "SELECT ResearchID, Title, Enable, CreatedDate FROM ReasearchList";

            DbCommand dbCommand = _db.GetSqlStringCommand(query);

            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    SampleTemplate newObj = new SampleTemplate();

                    newObj._researchID = reader.GetInt32(Convert.ToInt32(FieldList.ResearchID));
                    newObj.Title = reader.GetString(Convert.ToInt32(FieldList.Title));
                    newObj.Enable = reader.GetBoolean(Convert.ToInt32(FieldList.Enable));
                    newObj._createdDate = reader.GetDateTime(Convert.ToInt32(FieldList.CreatedDate));
                    list.Add(newObj);
                }                
            } 

            return list;
        }


        public static List<SampleTemplate> FetchAttendedList(Int32 userid)
        {
            List<SampleTemplate> list = new List<SampleTemplate>();

            string query = " SELECT C.ResearchID ,C.Title,C.Enable, C.CreatedDate ";
            query += " FROM ResearchEmailListUsers A ";
            query += " INNER JOIN ResearchEmailList B ON A.ResearchEmailListID = B.ResearchEmailListID ";
            query += " INNER JOIN ReasearchList C ON B.ResearchListID =C.ResearchID ";
            query += " WHERE A.UserID = @UserID AND C.ResearchID IN ( ";
            query += " SELECT ResearchID FROM UserAnswer ";
            query += " WHERE UserID = @UserID) ";

            DbCommand dbCommand = _db.GetSqlStringCommand(query);

            _db.AddInParameter(dbCommand, "@UserID", DbType.Int32, userid);

            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    SampleTemplate newObj = new SampleTemplate();

                    newObj._researchID = reader.GetInt32(Convert.ToInt32(FieldList.ResearchID));
                    newObj.Title = reader.GetString(Convert.ToInt32(FieldList.Title));
                    newObj.Enable = reader.GetBoolean(Convert.ToInt32(FieldList.Enable));
                    newObj._createdDate = reader.GetDateTime(Convert.ToInt32(FieldList.CreatedDate));
                    list.Add(newObj);
                }
            }

            return list;
        }

        public static List<SampleTemplate> FetchNotAttendedList(Int32 userid)
        {
            List<SampleTemplate> list = new List<SampleTemplate>();

            string query = " SELECT C.ResearchID ,C.Title,C.Enable, C.CreatedDate ";
            query += " FROM ResearchEmailListUsers A ";
            query += " INNER JOIN ResearchEmailList B ON A.ResearchEmailListID = B.ResearchEmailListID ";
            query += " INNER JOIN ReasearchList C ON B.ResearchListID =C.ResearchID ";
            query += " WHERE A.UserID = @UserID AND C.ResearchID NOT IN ( ";
            query += " SELECT ResearchID FROM UserAnswer ";
            query += " WHERE UserID = @UserID )";


            DbCommand dbCommand = _db.GetSqlStringCommand(query);

            _db.AddInParameter(dbCommand, "@UserID", DbType.Int32, userid);

            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    SampleTemplate newObj = new SampleTemplate();

                    newObj._researchID = reader.GetInt32(Convert.ToInt32(FieldList.ResearchID));
                    newObj.Title = reader.GetString(Convert.ToInt32(FieldList.Title));
                    newObj.Enable = reader.GetBoolean(Convert.ToInt32(FieldList.Enable));
                    newObj._createdDate = reader.GetDateTime(Convert.ToInt32(FieldList.CreatedDate));
                    list.Add(newObj);
                }
            }

            return list;
        }

        #endregion Methods



        #region Procedure

        private void fetchByID(Int32 id)
        {
            string query = "SELECT ResearchID, Title, Enable, CreatedDate FROM ReasearchList Where ResearchID = @ResearchID";

            DbCommand dbCommand = _db.GetSqlStringCommand(query);

            _db.AddInParameter(dbCommand, "@ResearchID", DbType.Int32, id);

            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this._researchID = reader.GetInt32(Convert.ToInt32(FieldList.ResearchID));
                    this.Title = reader.GetString(Convert.ToInt32(FieldList.Title));
                    this.Enable = reader.GetBoolean(Convert.ToInt32(FieldList.Enable));
                    this._createdDate = reader.GetDateTime(Convert.ToInt32(FieldList.CreatedDate));  
                }
            }       
        }

        private void add()
        {
            Int32 theNewID;
            //@@IDENTITY SCOPE_IDENTITY(). there are difference between them. 
            //in Access can execute only one SQL statement in one command,more than one need more execution,
            //in SQL Server can execute more than one SQL statement in command.

            string query = "INSERT INTO ReasearchList(Title, Enable) VALUES(@Title,@Enable); SELECT CAST(SCOPE_IDENTITY() AS INT);";

            DbCommand dbCommand = _db.GetSqlStringCommand(query);

            _db.AddInParameter(dbCommand, "@Title", DbType.String, this.Title);
            _db.AddInParameter(dbCommand, "@Enable", DbType.Boolean, this.Enable);

            //ExecuteScalar return the value of first column in first row.
            theNewID = Convert.ToInt32(_db.ExecuteScalar(dbCommand));
            
            fetchByID(theNewID);
        }

        private void update()
        {
            string query = "UPDATE ReasearchList SET Title= @Title, Enable=@Enable WHERE ResearchID=@ResearchID;";

            DbCommand dbCommand = _db.GetSqlStringCommand(query);

            _db.AddInParameter(dbCommand, "@Title", DbType.String, this.Title);
            _db.AddInParameter(dbCommand, "@Enable", DbType.Boolean, this.Enable);
            _db.AddInParameter(dbCommand, "@ResearchID", DbType.Int32, this.ResearchID);

            _db.ExecuteNonQuery(dbCommand);

            fetchByID(this.ResearchID);
        }

        #endregion Procedure


    }
}
