using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Runtime.Serialization;

namespace BusinessObjects.SchemaSetting
{
    [Serializable()]
    public class BO_Branch : BaseObject
    {
        public BO_Branch() { }

        public BO_Branch(String id)
        {
            fetchByID(id);
        }

        public enum FieldList
        {
            BranchID, 
            BranchName, 
            ShortName, 
            CarrierID, 
            Address, 
            PostCode, 
            Tel, 
            Fax, 
            EMail, 
            Contact, 
            Remark, 
            Province, 
            BankName, 
            BankAccount,
            NewBranchID
        }

        #region Property

        public String BranchID
        {
            get;
            set;
        }

        public String BranchName
        {
            get;
            set;
        }

        public String ShortName
        {
            get;
            set;
        }

        public String CarrierID
        {
            get;
            set;
        }

        public String Address
        {
            get;
            set;
        }

        public String PostCode
        {
            get;
            set;
        }

        public String Tel
        {
            get;
            set;
        }

        public String Fax
        {
            get;
            set;
        }

        public String EMail
        {
            get;
            set;
        }

        public String Contact
        {
            get;
            set;
        }

        public String Remark
        {
            get;
            set;
        }

        public String Province
        {
            get;
            set;
        }

        public String BankName
        {
            get;
            set;
        }

        public String BankAccount
        {
            get;
            set;
        }

        /// <summary>
        /// 新分支机构编号
        /// </summary>
        public String NewBranchID
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
            else if (action == ModifiedAction.Update)
            {
                update();
            }
        }

        /// <summary>
        /// 保存分支机构信息
        /// </summary>
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO Branch(BranchID, BranchName, ShortName, CarrierID, Address, PostCode, Tel, Fax, EMail, Contact, Remark, Province, BankName, BankAccount) ");
            sb.Append(" VALUES(@BranchID, @BranchName, @ShortName, @CarrierID, @Address, @PostCode, @Tel, @Fax, @EMail, @Contact, @Remark, @Province, @BankName, @BankAccount)");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@BranchID", DbType.AnsiString, this.BranchID);
            _db.AddInParameter(dbCommand, "@BranchName", DbType.AnsiString, this.BranchName);
            _db.AddInParameter(dbCommand, "@ShortName", DbType.AnsiString, this.ShortName);
            _db.AddInParameter(dbCommand, "@CarrierID", DbType.AnsiString, this.CarrierID);
            _db.AddInParameter(dbCommand, "@Address", DbType.AnsiString, this.Address);
            _db.AddInParameter(dbCommand, "@PostCode", DbType.AnsiString, this.PostCode);
            _db.AddInParameter(dbCommand, "@Tel", DbType.AnsiString, this.Tel);
            _db.AddInParameter(dbCommand, "@Fax", DbType.AnsiString, this.Fax);
            _db.AddInParameter(dbCommand, "@EMail", DbType.AnsiString, this.EMail);
            _db.AddInParameter(dbCommand, "@Contact", DbType.AnsiString, this.Contact);
            _db.AddInParameter(dbCommand, "@Remark", DbType.AnsiString, this.Remark);
            _db.AddInParameter(dbCommand, "@Province", DbType.AnsiString, this.Province);
            _db.AddInParameter(dbCommand, "@BankName", DbType.AnsiString, this.BankName);
            _db.AddInParameter(dbCommand, "@BankAccount", DbType.AnsiString, this.BankAccount);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 修改分支机构信息
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update Branch ");
            sb.Append("Set BranchID=@NewBranchID, BranchName=@BranchName, ShortName=@ShortName, CarrierID=@CarrierID, Address=@Address, PostCode=@PostCode, ");
            sb.Append("Tel=@Tel, Fax=@Fax, EMail=@EMail, Contact=@Contact, Remark=@Remark, Province=@Province, BankName=@BankName, BankAccount=@BankAccount ");
            sb.Append("Where BranchID=@BranchID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@NewBranchID", DbType.AnsiString, this.NewBranchID);
            _db.AddInParameter(dbCommand, "@BranchName", DbType.AnsiString, this.BranchName);
            _db.AddInParameter(dbCommand, "@ShortName", DbType.AnsiString, this.ShortName);
            _db.AddInParameter(dbCommand, "@CarrierID", DbType.AnsiString, this.CarrierID);
            _db.AddInParameter(dbCommand, "@Address", DbType.AnsiString, this.Address);
            _db.AddInParameter(dbCommand, "@PostCode", DbType.AnsiString, this.PostCode);
            _db.AddInParameter(dbCommand, "@Tel", DbType.AnsiString, this.Tel);
            _db.AddInParameter(dbCommand, "@Fax", DbType.AnsiString, this.Fax);
            _db.AddInParameter(dbCommand, "@EMail", DbType.AnsiString, this.EMail);
            _db.AddInParameter(dbCommand, "@Contact", DbType.AnsiString, this.Contact);
            _db.AddInParameter(dbCommand, "@Remark", DbType.AnsiString, this.Remark);
            _db.AddInParameter(dbCommand, "@Province", DbType.AnsiString, this.Province);
            _db.AddInParameter(dbCommand, "@BankName", DbType.AnsiString, this.BankName);
            _db.AddInParameter(dbCommand, "@BankAccount", DbType.AnsiString, this.BankAccount);
            _db.AddInParameter(dbCommand, "@BranchID", DbType.AnsiString, this.BranchID);

            _db.ExecuteNonQuery(dbCommand);
        }

        public static List<BO_Branch> FetchList()
        {
            List<BO_Branch> list = new List<BO_Branch>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT BranchID, BranchName, ShortName, CarrierID, Address, PostCode, Tel, Fax, EMail, Contact, Remark, Province, BankName, BankAccount ");
            sb.Append(" FROM Branch ");
            sb.Append(" ");
            sb.Append(" ");
            sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_Branch newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_Branch();
                     

                    newObj.BranchID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchID));
                    newObj.BranchName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchName));
                    newObj.ShortName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ShortName));
                    newObj.CarrierID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierID));
                    newObj.Address = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Address));

                    newObj.PostCode = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PostCode));
                    newObj.Tel = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Tel));
                    newObj.Fax = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Fax));
                    newObj.EMail = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.EMail));
                    newObj.Contact = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Contact));
                    newObj.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                    newObj.Province = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Province));
                    newObj.BankName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankName));
                    newObj.BankAccount = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankAccount));

                    list.Add(newObj);
                }
            }

            return list;
        }

        public static List<BO_Branch> FetchListByCarrier(String carrierID)
        {
            List<BO_Branch> list = new List<BO_Branch>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT BranchID, BranchName, ShortName, CarrierID, Address, PostCode, Tel, Fax, EMail, Contact, Remark, Province, BankName, BankAccount ");
            sb.Append(" FROM Branch ");
            sb.Append(" WHERE CarrierID = @CarrierID");
            sb.Append(" ");
            sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CarrierID", DbType.String, carrierID);

            BO_Branch newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_Branch();


                    newObj.BranchID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchID));
                    newObj.BranchName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchName));
                    newObj.ShortName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ShortName));
                    newObj.CarrierID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierID));
                    newObj.Address = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Address));

                    newObj.PostCode = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PostCode));
                    newObj.Tel = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Tel));
                    newObj.Fax = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Fax));
                    newObj.EMail = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.EMail));
                    newObj.Contact = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Contact));
                    newObj.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                    newObj.Province = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Province));
                    newObj.BankName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankName));
                    newObj.BankAccount = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankAccount));

                    list.Add(newObj);
                }
            }

            return list;
        }



        public static DataSet GetBranchList(string sWhere)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ");
            sb.Append(" BranchID,BranchName,ShortName,CarrierID,Address,PostCode,Tel,Fax,EMail,Contact,Remark,Province,BankName,BankAccount,");
            sb.Append(" (Select CarrierNameCn from Carrier where CarrierID=a.CarrierID) CarrierName");
            sb.Append(" From Branch a ");
            sb.Append(" where 1=1 ");
            if (sWhere != "")
            {
                sb.Append(sWhere);
            }
            sb.Append(" Order By BranchID");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            return _db.ExecuteDataSet(dbCommand);
        }

        public static DataSet GetBranchListByCarrierID(string sCarrierID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ");
            sb.Append(" BranchID,BranchName,ShortName,CarrierID,Address,PostCode,Tel,Fax,EMail,Contact,Remark,Province,BankName,BankAccount,");
            sb.Append(" (Select CarrierNameCn from Carrier where CarrierID=a.CarrierID) CarrierName");
            sb.Append(" From Branch a ");
            if (sCarrierID.Trim() != "")
            {
                sb.Append(" where a.CarrierID='" + sCarrierID + "'");
            }

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            return _db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// 删除分支机构
        /// </summary>
        /// <param name="branchID"></param>
        public static void Delete(string branchID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM Branch ");
            sb.Append(" WHERE BranchID = @BranchID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@BranchID", DbType.AnsiString, branchID);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 判断是否存在分支机构编号
        /// </summary>
        /// <param name="branchID"></param>
        /// <returns></returns>
        public static bool IfExistsBranchID(string branchID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select BranchID From Branch (nolock) ");
            sb.Append("Where BranchID=@BranchID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@BranchID", DbType.AnsiString, branchID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }
        #endregion Methods

        #region Procedure

        private void fetchByID(string id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select BranchID, BranchName, ShortName, CarrierID, Address, PostCode, Tel, Fax, EMail, Contact, Remark, Province, BankName, BankAccount ");
            sb.Append("From Branch (nolock) ");
            sb.Append("Where BranchID=@BranchID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@BranchID", DbType.String, id);

            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    this.BranchID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchID));
                    this.BranchName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BranchName));
                    this.ShortName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ShortName));
                    this.CarrierID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierID));
                    this.Address = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Address));
                    this.PostCode = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PostCode));
                    this.Tel = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Tel));
                    this.Fax = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Fax));
                    this.EMail = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.EMail));
                    this.Contact = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Contact));
                    this.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                    this.Province = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Province));
                    this.BankName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankName));
                    this.BankAccount = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankAccount));
                    break;
                }
            }
        }

        #endregion Procedure
    }
}
