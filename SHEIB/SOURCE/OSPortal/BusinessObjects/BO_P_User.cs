using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;

namespace BusinessObjects
{
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
            BankAccount
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
        
        #endregion Property


        #region Methods

        public void Save()
        {
            if (this.UserID != "")
            {
                update();
            }
            else
            {
                add();
            }
        }

        public static List<BO_P_User> FetchList()
        {
            List<BO_P_User> list = new List<BO_P_User>();
            
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT UserID, DeptID, UserNameCn, UserNameEn,");
            sb.Append("Sex, IDNo, Birthday, JoinDate, Title, Status,");
            sb.Append("Address, PostCode, Tel, Fax, Email, CertNo,");
            sb.Append("Password, Remark, Mobile, BankName, BankAccount");
            sb.Append(" FROM P_User ");
            
            
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_P_User newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_P_User();

                    newObj.UserID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserID));
                    newObj.DeptID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptID));
                    newObj.UserNameCn = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    newObj.UserNameEn = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));
                    newObj.Sex = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserID));

                    newObj.IDNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptID));
                    newObj.Birthday = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    newObj.JoinDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));
                    newObj.Title = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    newObj.Status = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));

                    newObj.Address = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptID));
                    newObj.PostCode = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    newObj.Tel = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));
                    newObj.Fax = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    newObj.Email = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));

                    newObj.CertNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptID));
                    newObj.Password = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    newObj.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));
                    newObj.Mobile = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    newObj.BankName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));

                    newObj.BankAccount = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptID));
                    
                    list.Add(newObj);
                }                
            } 

            return list;
        }

                        
        #endregion Methods



        #region Procedure

        private void fetchByID(String userID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT UserID, DeptID, UserNameCn, UserNameEn,");
            sb.Append("Sex, IDNo, Birthday, JoinDate, Title, Status,");
            sb.Append("Address, PostCode, Tel, Fax, Email, CertNo,");
            sb.Append("Password, Remark, Mobile, BankName, BankAccount");
            sb.Append(" FROM P_User ");
            sb.Append(" UserID = @UserID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@UserID", DbType.String, userID);

            
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.UserID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserID));
                    this.DeptID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptID));
                    this.UserNameCn = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    this.UserNameEn = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));
                    this.Sex = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserID));

                    this.IDNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptID));
                    this.Birthday = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    this.JoinDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));
                    this.Title = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    this.Status = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));

                    this.Address = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptID));
                    this.PostCode = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    this.Tel = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));
                    this.Fax = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    this.Email = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));

                    this.CertNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptID));
                    this.Password = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    this.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));
                    this.Mobile = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameCn));
                    this.BankName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UserNameEn));

                    this.BankAccount = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptID)); 
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
            sb.Append("@Password, @Remark, @Mobile, @BankName, @BankAccount)");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@UserID", DbType.String, this.UserID);
            _db.AddInParameter(dbCommand, "@DeptID", DbType.String, this.DeptID);
            _db.AddInParameter(dbCommand, "@UserNameCn", DbType.String, this.UserNameCn);
            _db.AddInParameter(dbCommand, "@UserNameEn", DbType.String, this.UserNameEn);
            _db.AddInParameter(dbCommand, "@Sex", DbType.String, this.Sex);

            _db.AddInParameter(dbCommand, "@IDNo", DbType.String, this.IDNo);
            _db.AddInParameter(dbCommand, "@Birthday", DbType.DateTime, this.Birthday );
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
            _db.AddInParameter(dbCommand, "@Remark", DbType.String, this.PostCode);
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
            sb.Append(" Password=@Password, Remark=@Remark, Mobile=@Mobile, )");
            sb.Append(" BankName=@BankName, BankAccount=@BankAccount ");
            sb.Append(" Where UserID=@UserID;");            
            
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
                        
            _db.AddInParameter(dbCommand, "@UserID", DbType.String, this.UserID);
            _db.AddInParameter(dbCommand, "@DeptID", DbType.String, this.DeptID);
            _db.AddInParameter(dbCommand, "@UserNameCn", DbType.String, this.UserNameCn);
            _db.AddInParameter(dbCommand, "@UserNameEn", DbType.String, this.UserNameEn);
            _db.AddInParameter(dbCommand, "@Sex", DbType.String, this.Sex);

            _db.AddInParameter(dbCommand, "@IDNo", DbType.String, this.IDNo);
            _db.AddInParameter(dbCommand, "@Birthday", DbType.DateTime, this.Birthday);
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
            _db.AddInParameter(dbCommand, "@Remark", DbType.String, this.PostCode);
            _db.AddInParameter(dbCommand, "@Mobile", DbType.String, this.Mobile);
            _db.AddInParameter(dbCommand, "@BankName", DbType.String, this.BankName);

            _db.AddInParameter(dbCommand, "@BankAccount", DbType.String, this.BankAccount);
            

            _db.ExecuteNonQuery(dbCommand);

        }

        #endregion Procedure


    }
}
