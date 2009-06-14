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
            BankAccount
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


        #endregion Property




        #region Methods


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


        #endregion Methods




    }
}
