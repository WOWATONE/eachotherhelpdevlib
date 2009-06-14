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
    public class BO_Carrier : BaseObject
    {
        public BO_Carrier() { }


        public enum FieldList
        {
            CarrierID, 
            CarrierNameCn, 
            CarrierNameEn, 
            ShortName, 
            InsType, 
            GrdType, 
            Address, 
            Postcode, 
            Tel, 
            Fax, 
            Contact, 
            Email, 
            URL, 
            Profile, 
            BankName,
            BankAccount, 
            PolicyNoHeader, 
            Remark, 
            PremiumSize, 
            LossRation, 
            PayoffLevel, 
            Province
        }


        #region Property

        public String CarrierID
        {
            get;
            set;
        }

        public String CarrierNameCn
        {
            get;
            set;
        }

        public String CarrierNameEn
        {
            get;
            set;
        }

        public String ShortName
        {
            get;
            set;
        }

        public String InsType
        {
            get;
            set;
        }

        public String GrdType
        {
            get;
            set;
        }

        public String Address
        {
            get;
            set;
        }

        public String Postcode
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

        public String Contact
        {
            get;
            set;
        }

        public String Email
        {
            get;
            set;
        }

        public String URL
        {
            get;
            set;
        }

        public String Profile
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

        public String PolicyNoHeader
        {
            get;
            set;
        }

        public String Remark
        {
            get;
            set;
        }

        public String PremiumSize
        {
            get;
            set;
        }

        public String LossRation
        {
            get;
            set;
        }

        public String PayoffLevel
        {
            get;
            set;
        }

        public String Province
        {
            get;
            set;
        }


        #endregion Property


        #region Methods


        public static List<BO_Carrier> FetchList()
        {
            List<BO_Carrier> list = new List<BO_Carrier>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT CarrierID, CarrierNameCn, CarrierNameEn, ShortName, InsType, GrdType, Address, Postcode, Tel, ");
            sb.Append(" Fax, Contact, Email, URL, Profile, BankName, ");
            sb.Append(" BankAccount, PolicyNoHeader, Remark, PremiumSize, LossRation, PayoffLevel, Province ");
            sb.Append(" FROM Carrier ");
            sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_Carrier newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_Carrier();

                    // , , , , 
                    //, , Remark, , , , Province
                    newObj.CarrierID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierID));
                    newObj.CarrierNameCn = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierNameCn));
                    newObj.CarrierNameEn = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CarrierNameEn));
                    newObj.ShortName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ShortName));
                    newObj.InsType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.InsType));
                    newObj.GrdType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.GrdType));
                    newObj.Address = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Address));

                    newObj.Postcode = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Postcode));
                    newObj.Tel = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Tel));
                    newObj.Fax = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Fax));
                    newObj.Contact = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Contact));
                    
                    newObj.Email = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Email));
                    newObj.URL = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.URL));
                    newObj.Profile = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Profile));
                    newObj.BankName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankName));
                    newObj.BankAccount = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankAccount));
                    
                    newObj.PolicyNoHeader = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PolicyNoHeader));
                    newObj.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                    
                    newObj.PremiumSize = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PremiumSize));
                    newObj.LossRation = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.LossRation));
                    newObj.PayoffLevel = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PayoffLevel));
                    newObj.Province = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Province));
                    
                    //newObj. = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.));
                    //newObj. = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.));
                    
                    list.Add(newObj);
                }
            }

            return list;
        }

        #endregion Methods


    }
}
