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
    public class BO_P_User : BaseObject
    {

        public BO_P_User(){ }

        public BO_P_User(String id)
        {
            fetchByID(id);
        }



        public enum FieldList
        {
            UserID, 
            DeptID, 
            UserNameCn, 
            UserNameEn, 
            Sex, 
            IDNo, 
            Birthday, 
            JoinDate, 
            Title, 
            Status, 
            Address, 
            PostCode, 
            Tel, 
            Fax, 
            Email, 
            CertNo, 
            Password,
            Remark, 
            Mobile, 
            BankName, 
            BankAccount,
            DeptName
        }



        #region Property

        public string UserID
        {
            get;
            set;
        }

        public string DeptID
        {
            get;set;
        }

        public string UserNameCn
        {
            get;set;
        }

        public string UserNameEn
        {
            get;set;
        }

        public string Sex
        {
            get;
            set;
        }

        public string IDNo
        {
            get;
            set;
        }

        public DateTime Birthday
        {
            get;
            set;
        }

        public DateTime JoinDate
        {
            get;
            set;
        }

        public string Title
        {
            get;
            set;
        }

        public string Status
        {
            get;
            set;
        }

        public string Address
        {
            get;
            set;
        }

        public string PostCode
        {
            get;
            set;
        }

        public string Tel
        {
            get;
            set;
        }

        public string Fax
        {
            get;
            set;
        }

        public string Email
        {
            get;
            set;
        }

        public string CertNo
        {
            get;
            set;
        }

        public string Password
        {
            get;
            set;
        }

        public string Remark
        {
            get;
            set;
        }

        public string Mobile
        {
            get;
            set;
        }

        public string BankName
        {
            get;
            set;
        }

        public string BankAccount
        {
            get;
            set;
        }

        public String DeptName
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

        public static List<BO_P_User> FetchList()
        {
            List<BO_P_User> list = new List<BO_P_User>();
            
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT A.UserID, A.DeptID, A.UserNameCn, A.UserNameEn,");
            sb.Append("A.Sex, A.IDNo, A.Birthday, A.JoinDate, A.Title, A.Status,");
            sb.Append("A.Address, A.PostCode, A.Tel, A.Fax, A.Email, A.CertNo,");
            sb.Append("A.Password, A.Remark, A.Mobile, A.BankName, A.BankAccount, B.DeptName");
            sb.Append(" FROM P_User A");
            sb.Append(" LEFT JOIN P_Department B ON A.DeptID=B.DeptID ");
            
            
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_P_User newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_P_User();

                    newObj.UserID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserID));
                    newObj.DeptID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptID));
                    newObj.DeptName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptName));
                    newObj.UserNameCn = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    newObj.UserNameEn = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));
                    newObj.Sex = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Sex));

                    newObj.IDNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.IDNo));
                    newObj.Birthday = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.Birthday));
                    newObj.JoinDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.JoinDate));
                    newObj.Title = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Title));
                    newObj.Status = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Status));

                    newObj.Address = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Address));
                    newObj.PostCode = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PostCode));
                    newObj.Tel = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Tel));
                    newObj.Fax = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Fax));
                    newObj.Email = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Email));

                    newObj.CertNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CertNo));
                    newObj.Password = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Password));
                    newObj.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                    newObj.Mobile = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Mobile));
                    newObj.BankName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankName));

                    newObj.BankAccount = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankAccount));
                    
                    list.Add(newObj);
                }                
            } 

            return list;
        }


        public static void Delete(String userID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM P_User ");
            sb.Append(" WHERE UserID = @UserID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@UserID", DbType.String, userID);

            _db.ExecuteNonQuery(dbCommand);

        }

        /// <summary>
        /// 根据用户编号取得用户姓名等信息
        /// </summary>
        /// <param name="sCodetype"></param>
        /// <returns></returns>
        public static DataSet GetUserByUserID(string sUserID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select [UserID], [UserNameCn] ");
            sb.Append("FROM P_User (nolock) ");
            if (sUserID.Trim() != "")
            {
                sb.Append("where UserID = '" + sUserID + "' ");
            }
            sb.Append("ORDER BY UserID");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            return _db.ExecuteDataSet(dbCommand);
        }
        #endregion Methods



        #region Procedure

        private void fetchByID(String userID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT A.UserID, A.DeptID, A.UserNameCn, A.UserNameEn,");
            sb.Append("A.Sex, A.IDNo, A.Birthday, A.JoinDate, A.Title, A.Status,");
            sb.Append("A.Address, A.PostCode, A.Tel, A.Fax, A.Email, A.CertNo,");
            sb.Append("A.Password, A.Remark, A.Mobile, A.BankName, A.BankAccount, B.DeptName");
            sb.Append(" FROM P_User A ");
            sb.Append(" LEFT JOIN P_Department B ON A.DeptID=B.DeptID ");
            sb.Append(" WHERE A.UserID = @UserID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@UserID", DbType.String, userID);

            
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.UserID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserID));
                    this.DeptID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptID));
                    this.DeptName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptName));
                    
                    this.UserNameCn = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    this.UserNameEn = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));
                    this.Sex = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Sex));

                    this.IDNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.IDNo));
                    this.Birthday = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.Birthday));
                    this.JoinDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.JoinDate));
                    this.Title = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Title));
                    this.Status = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Status));

                    this.Address = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Address));
                    this.PostCode = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PostCode));
                    this.Tel = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Tel));
                    this.Fax = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Fax));
                    this.Email = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Email));

                    this.CertNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CertNo));
                    this.Password = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PostCode));
                    this.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                    this.Mobile = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Mobile));
                    this.BankName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankName));

                    this.BankAccount = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankAccount)); 
                }
            }       
        }

        private void add()
        {
            //@@IDENTITY SCOPE_IDENTITY(). there are difference between them. 
            //in Access can execute only one SQL statement in one command,more than one need more execution,
            //in SQL Server can execute more than one SQL statement in command.

            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO P_User(UserID, DeptID, UserNameCn, UserNameEn,");
            sb.Append("Sex, IDNo, Birthday, JoinDate, Title, Status,");
            sb.Append("Address, PostCode, Tel, Fax, Email, CertNo,");
            sb.Append("Password, Remark, Mobile, BankName, BankAccount)");
            sb.Append(" VALUES( ");
            sb.Append("@UserID, @DeptID, @UserNameCn, @UserNameEn,");
            sb.Append("@Sex, @IDNo, @Birthday, @JoinDate, @Title, @Status,");
            sb.Append("@Address, @PostCode, @Tel, @Fax, @Email, @CertNo,");
            sb.Append("@Password, @Remark, @Mobile, @BankName, @BankAccount");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@UserID", DbType.String, this.UserID);
            _db.AddInParameter(dbCommand, "@DeptID", DbType.String, this.DeptID);
            _db.AddInParameter(dbCommand, "@UserNameCn", DbType.String, this.UserNameCn);
            _db.AddInParameter(dbCommand, "@UserNameEn", DbType.String, this.UserNameEn);
            _db.AddInParameter(dbCommand, "@Sex", DbType.String, this.Sex);

            _db.AddInParameter(dbCommand, "@IDNo", DbType.String, this.IDNo);

            if (this.Birthday == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@Birthday", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@Birthday", DbType.DateTime, this.Birthday);

            if (this.JoinDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@JoinDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@JoinDate", DbType.DateTime, this.JoinDate);
            

            _db.AddInParameter(dbCommand, "@Title", DbType.String, this.Title);
            _db.AddInParameter(dbCommand, "@Status", DbType.String, this.Status);

            _db.AddInParameter(dbCommand, "@Address", DbType.String, this.Address);
            _db.AddInParameter(dbCommand, "@PostCode", DbType.String, this.PostCode);
            _db.AddInParameter(dbCommand, "@Tel", DbType.String, this.Tel);
            _db.AddInParameter(dbCommand, "@Fax", DbType.String, this.Fax);
            _db.AddInParameter(dbCommand, "@Email", DbType.String, this.Email);

            _db.AddInParameter(dbCommand, "@CertNo", DbType.String, this.CertNo);
            _db.AddInParameter(dbCommand, "@Password", DbType.String, this.Password);
            _db.AddInParameter(dbCommand, "@Remark", DbType.String, this.Remark);
            _db.AddInParameter(dbCommand, "@Mobile", DbType.String, this.Mobile);
            _db.AddInParameter(dbCommand, "@BankName", DbType.String, this.BankName);

            _db.AddInParameter(dbCommand, "@BankAccount", DbType.String, this.BankAccount);
            
            //ExecuteScalar return the value of first column in first row.
            _db.ExecuteNonQuery(dbCommand);
        }

        private void update()
        {
            //string query = "UPDATE ReasearchList SET Title= @Title, Enable=@Enable WHERE ResearchID=@ResearchID;";
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE P_User SET DeptID=@DeptID, ");
            sb.Append(" UserNameCn=@UserNameCn, UserNameEn=@UserNameEn, ");
            sb.Append(" Sex=@Sex, IDNo=@IDNo, Birthday=@Birthday, ");
            sb.Append(" JoinDate=@JoinDate, Title=@Title, Status=@Status, ");
            sb.Append(" Address=@Address, PostCode=@PostCode, Tel=@Tel, ");
            sb.Append(" Fax=@Fax, Email=@Email, CertNo=@CertNo, ");
            sb.Append(" Password=@Password, Remark=@Remark, Mobile=@Mobile, ");
            sb.Append(" BankName=@BankName, BankAccount=@BankAccount ");
            sb.Append(" Where UserID=@UserID;");            
            
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
                        
            _db.AddInParameter(dbCommand, "@UserID", DbType.String, this.UserID);
            _db.AddInParameter(dbCommand, "@DeptID", DbType.String, this.DeptID);
            _db.AddInParameter(dbCommand, "@UserNameCn", DbType.String, this.UserNameCn);
            _db.AddInParameter(dbCommand, "@UserNameEn", DbType.String, this.UserNameEn);
            _db.AddInParameter(dbCommand, "@Sex", DbType.String, this.Sex);

            _db.AddInParameter(dbCommand, "@IDNo", DbType.String, this.IDNo);
            
            if (this.Birthday == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@Birthday", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@Birthday", DbType.DateTime, this.Birthday);

            if (this.JoinDate == DateTime.MinValue)
                _db.AddInParameter(dbCommand, "@JoinDate", DbType.DateTime, null);
            else
                _db.AddInParameter(dbCommand, "@JoinDate", DbType.DateTime, this.JoinDate);
            

            _db.AddInParameter(dbCommand, "@Title", DbType.String, this.Title);
            _db.AddInParameter(dbCommand, "@Status", DbType.String, this.Status);

            _db.AddInParameter(dbCommand, "@Address", DbType.String, this.Address);
            _db.AddInParameter(dbCommand, "@PostCode", DbType.String, this.PostCode);
            _db.AddInParameter(dbCommand, "@Tel", DbType.String, this.Tel);
            _db.AddInParameter(dbCommand, "@Fax", DbType.String, this.Fax);
            _db.AddInParameter(dbCommand, "@Email", DbType.String, this.Email);

            _db.AddInParameter(dbCommand, "@CertNo", DbType.String, this.CertNo);
            _db.AddInParameter(dbCommand, "@Password", DbType.String, this.Password);
            _db.AddInParameter(dbCommand, "@Remark", DbType.String, this.Remark);
            _db.AddInParameter(dbCommand, "@Mobile", DbType.String, this.Mobile);
            _db.AddInParameter(dbCommand, "@BankName", DbType.String, this.BankName);

            _db.AddInParameter(dbCommand, "@BankAccount", DbType.String, this.BankAccount);
            

            _db.ExecuteNonQuery(dbCommand);

        }

        #endregion Procedure


    }
}
