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
        /// 根据客户分类ID取得客户分类信息
        /// </summary>
        /// <param name="sCustClassifyID"></param>
        /// <returns></returns>
        public static DataSet GetCustClassifyByID(string sCustClassifyID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select CustClassifyID, isnull(ParentID, '0') as ParentID, isnull(CustClassifyName, '') as CustClassifyName, OrderNo ");
            sb.Append("FROM CustClassify (nolock) ");
            if (sCustClassifyID.Trim() != "")
            {
                sb.Append("where CustClassifyID = '" + sCustClassifyID + "' ");
            }
            //sb.Append("ORDER BY OrderNo");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            return _db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// 保存客户信息
        /// </summary>
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO Carrier(CarrierID, CarrierNameCn, CarrierNameEn, ShortName, InsType, GrdType, Address, Postcode, Tel, Fax, Contact, ");
            sb.Append("Email, URL, Profile, BankName, BankAccount, PolicyNoHeader, Remark, PremiumSize, LossRation, PayoffLevel, Province) ");
            sb.Append(" VALUES(@CarrierID, @CarrierNameCn, @CarrierNameEn, @ShortName, @InsType, @GrdType, @Address, @Postcode, @Tel, @Fax, @Contact, ");
            sb.Append("@Email, @URL, @Profile, @BankName, @BankAccount, @PolicyNoHeader, @Remark, @PremiumSize, @LossRation, @PayoffLevel, @Province");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CarrierID", DbType.AnsiString, this.CarrierID);
            _db.AddInParameter(dbCommand, "@CarrierNameCn", DbType.AnsiString, this.CarrierNameCn);
            _db.AddInParameter(dbCommand, "@CarrierNameEn", DbType.AnsiString, this.CarrierNameEn);
            _db.AddInParameter(dbCommand, "@ShortName", DbType.AnsiString, this.ShortName);
            _db.AddInParameter(dbCommand, "@InsType", DbType.AnsiString, this.InsType);
            _db.AddInParameter(dbCommand, "@GrdType", DbType.AnsiString, this.GrdType);
            _db.AddInParameter(dbCommand, "@Address", DbType.AnsiString, this.Address);
            _db.AddInParameter(dbCommand, "@Postcode", DbType.AnsiString, this.Postcode);
            _db.AddInParameter(dbCommand, "@Tel", DbType.AnsiString, this.Tel);
            _db.AddInParameter(dbCommand, "@Fax", DbType.AnsiString, this.Fax);
            _db.AddInParameter(dbCommand, "@Contact", DbType.AnsiString, this.Contact);
            _db.AddInParameter(dbCommand, "@Email", DbType.AnsiString, this.Email);
            _db.AddInParameter(dbCommand, "@URL", DbType.AnsiString, this.URL);
            _db.AddInParameter(dbCommand, "@Profile", DbType.AnsiString, this.Profile);
            _db.AddInParameter(dbCommand, "@BankName", DbType.AnsiString, this.BankName);
            _db.AddInParameter(dbCommand, "@BankAccount", DbType.AnsiString, this.BankAccount);
            _db.AddInParameter(dbCommand, "@PolicyNoHeader", DbType.AnsiString, this.PolicyNoHeader);
            _db.AddInParameter(dbCommand, "@Remark", DbType.AnsiString, this.Remark);
            _db.AddInParameter(dbCommand, "@PremiumSize", DbType.AnsiString, this.PremiumSize);
            _db.AddInParameter(dbCommand, "@LossRation", DbType.AnsiString, this.LossRation);
            _db.AddInParameter(dbCommand, "@PayoffLevel", DbType.AnsiString, this.PayoffLevel);
            _db.AddInParameter(dbCommand, "@Province", DbType.AnsiString, this.Province);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 修改保险公司信息
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update Carrier ");
            sb.Append("Set CarrierNameCn=@CarrierNameCn, CarrierNameEn=@CarrierNameEn, ShortName=@ShortName, InsType=@InsType, GrdType=@GrdType, Address=@Address, Postcode=@Postcode, Tel=@Tel, @Fax=Fax, Contact=@Contact, ");
            sb.Append("Email=@Email, URL=@URL, Profile=@Profile, BankName=@BankName, BankAccount=@BankAccount, PolicyNoHeader=@PolicyNoHeader, Remark=@Remark, PremiumSize=@PremiumSize, LossRation=@LossRation, PayoffLevel=@PayoffLevel, Province=@Province ");
            sb.Append("Where CarrierID=@CarrierID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CarrierID", DbType.AnsiString, this.CarrierID);
            _db.AddInParameter(dbCommand, "@CarrierNameCn", DbType.AnsiString, this.CarrierNameCn);
            _db.AddInParameter(dbCommand, "@CarrierNameEn", DbType.AnsiString, this.CarrierNameEn);
            _db.AddInParameter(dbCommand, "@ShortName", DbType.AnsiString, this.ShortName);
            _db.AddInParameter(dbCommand, "@InsType", DbType.AnsiString, this.InsType);
            _db.AddInParameter(dbCommand, "@GrdType", DbType.AnsiString, this.GrdType);
            _db.AddInParameter(dbCommand, "@Address", DbType.AnsiString, this.Address);
            _db.AddInParameter(dbCommand, "@Postcode", DbType.AnsiString, this.Postcode);
            _db.AddInParameter(dbCommand, "@Tel", DbType.AnsiString, this.Tel);
            _db.AddInParameter(dbCommand, "@Fax", DbType.AnsiString, this.Fax);
            _db.AddInParameter(dbCommand, "@Contact", DbType.AnsiString, this.Contact);
            _db.AddInParameter(dbCommand, "@Email", DbType.AnsiString, this.Email);
            _db.AddInParameter(dbCommand, "@URL", DbType.AnsiString, this.URL);
            _db.AddInParameter(dbCommand, "@Profile", DbType.AnsiString, this.Profile);
            _db.AddInParameter(dbCommand, "@BankName", DbType.AnsiString, this.BankName);
            _db.AddInParameter(dbCommand, "@BankAccount", DbType.AnsiString, this.BankAccount);
            _db.AddInParameter(dbCommand, "@PolicyNoHeader", DbType.AnsiString, this.PolicyNoHeader);
            _db.AddInParameter(dbCommand, "@Remark", DbType.AnsiString, this.Remark);
            _db.AddInParameter(dbCommand, "@PremiumSize", DbType.AnsiString, this.PremiumSize);
            _db.AddInParameter(dbCommand, "@LossRation", DbType.AnsiString, this.LossRation);
            _db.AddInParameter(dbCommand, "@PayoffLevel", DbType.AnsiString, this.PayoffLevel);
            _db.AddInParameter(dbCommand, "@Province", DbType.AnsiString, this.Province);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 根据查询条件取得保险公司列表
        /// </summary>
        /// <param name="sWhere"></param>
        /// <returns></returns>
        public static DataSet GetCarrierList(string sWhere)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ");
            sb.Append("CarrierID,CarrierNameCn,CarrierNameEn,ShortName,InsType,GrdType,Address,Postcode,Tel,Fax,Contact,Email,URL,Profile,BankName,BankAccount,PolicyNoHeader,Remark,PremiumSize,LossRation,PayoffLevel,Province ");
            sb.Append("From Carrier (nolock) ");
            sb.Append("Where 1=1 ");
            if (sWhere != "")
            {
                sb.Append(sWhere);
            }
            sb.Append(" Order By CarrierID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// 判断是否存在保险公司编号
        /// </summary>
        /// <param name="carrierID"></param>
        /// <returns></returns>
        public static bool IfExistsCarrierID(string carrierID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select CarrierID From Carrier (nolock) ");
            sb.Append("Where CarrierID=@CarrierID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CarrierID", DbType.AnsiString, carrierID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 删除客户信息
        /// </summary>
        /// <param name="carrierID"></param>
        public static void Delete(string carrierID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM Carrier ");
            sb.Append(" WHERE CarrierID = @CarrierID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CarrierID", DbType.AnsiString, carrierID);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 根据保险公司编号取得保险公司信息
        /// </summary>
        /// <param name="custID"></param>
        /// <returns></returns>
        public static BO_Carrier GetCarrierByID(string carrierID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select * From Carrier (nolock) ");
            sb.Append("Where CarrierID=@CarrierID");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CarrierID", DbType.AnsiString, carrierID);

            BO_Carrier carrier = null;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    carrier = new BO_Carrier();
                    carrier.CarrierID = Utility.GetStringFromReader(reader, FieldList.CarrierID.ToString());
                    carrier.CarrierNameCn = Utility.GetStringFromReader(reader, FieldList.CarrierNameCn.ToString());
                    carrier.CarrierNameEn = Utility.GetStringFromReader(reader, FieldList.CarrierNameEn.ToString());
                    carrier.ShortName = Utility.GetStringFromReader(reader, FieldList.ShortName.ToString());
                    carrier.InsType = Utility.GetStringFromReader(reader, FieldList.InsType.ToString());
                    carrier.GrdType = Utility.GetStringFromReader(reader, FieldList.GrdType.ToString());
                    carrier.Address = Utility.GetStringFromReader(reader, FieldList.Address.ToString());
                    carrier.Postcode = Utility.GetStringFromReader(reader, FieldList.Postcode.ToString());
                    carrier.Tel = Utility.GetStringFromReader(reader, FieldList.Tel.ToString());
                    carrier.Fax = Utility.GetStringFromReader(reader, FieldList.Fax.ToString());
                    carrier.Contact = Utility.GetStringFromReader(reader, FieldList.Contact.ToString());
                    carrier.Email = Utility.GetStringFromReader(reader, FieldList.Email.ToString());
                    carrier.URL = Utility.GetStringFromReader(reader, FieldList.URL.ToString());
                    carrier.Profile = Utility.GetStringFromReader(reader, FieldList.Profile.ToString());
                    carrier.BankName = Utility.GetStringFromReader(reader, FieldList.BankName.ToString());
                    carrier.BankAccount = Utility.GetStringFromReader(reader, FieldList.BankAccount.ToString());
                    carrier.PolicyNoHeader = Utility.GetStringFromReader(reader, FieldList.PolicyNoHeader.ToString());
                    carrier.Remark = Utility.GetStringFromReader(reader, FieldList.Remark.ToString());
                    carrier.PremiumSize = Utility.GetStringFromReader(reader, FieldList.PremiumSize.ToString());
                    carrier.LossRation = Utility.GetStringFromReader(reader, FieldList.LossRation.ToString());
                    carrier.PayoffLevel = Utility.GetStringFromReader(reader, FieldList.PayoffLevel.ToString());
                    carrier.Province = Utility.GetStringFromReader(reader, FieldList.Province.ToString());
                    break;
                }
            }

            return carrier;
        }
        #endregion Methods
        
    }
}
