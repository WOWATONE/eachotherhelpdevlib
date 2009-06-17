﻿using System;
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
    public class BO_Customer : BaseObject
    {
        public BO_Customer() { }

        public BO_Customer(String id)
        {
            //FetchByID(id);
        }

        public enum FieldList
        {
            CustID,
            CustName,
            Risk,
            InsureStatus,
            Remark,
            TradeTypeID,
            TradeTypeName,
            Birthday,
            Area,
            AreaName,
            Address,
            PostCode,
            CustTypeID,
            DeprtmentID,
            DeprtmentName,
            SalesID,
            SalesName,
            CustClassifyID,
            Email,
            Tel,
            Fax,
            Mobile,
            IDNO,
            BankName,
            BankAccount,
            Hobby,
            MainOper,
            AssetSize,
            MainProduct,
            AssetDistribute,
            UnitCharacter,
            Background,
            OtherInfo,
            Contact
        }

        #region Property
        /*客户编号*/
        public string CustID { get; set; }
        /*客户姓名*/
        public string CustName { get; set; }
        /*风险*/
        public string Risk { get; set; }
        /*保险状况*/
        public string InsureStatus { get; set; }
        /*备注*/
        public string Remark { get; set; }
        /*行业类型编号*/
        public string TradeTypeID { get; set; }
        /*行业类型*/
        public string TradeTypeName { get; set; }
        /*生日*/
        public DateTime Birthday { get; set; }
        /*区域*/
        public string Area { get; set; }
        /*区域名称*/
        public string AreaName { get; set; }
        /*地址*/
        public string Address { get; set; }
        /*邮政编码*/
        public string PostCode { get; set; }
        /*客户类型*/
        public int CustTypeID { get; set; }
        /*部门*/
        public string DeprtmentID { get; set; }
        /*部门名称*/
        public string DeprtmentName { get; set; }
        /*客户经理*/
        public string SalesID { get; set; }
        /*客户经理姓名*/
        public string SalesName { get; set; }
        /*级别(CustClassify.CustClassify*/
        public string CustClassifyID { get; set; }
        /*电子信箱*/
        public string Email { get; set; }
        /*电话*/
        public string Tel { get; set; }
        /*传真*/
        public string Fax { get; set; }
        /*手机*/
        public string Mobile { get; set; }
        /*企业注册号（身份证号码）*/
        public string IDNO { get; set; }
        /*开户银行*/
        public string BankName { get; set; }
        /*银行账号*/
        public string BankAccount { get; set; }
        /*兴趣爱好*/
        public string Hobby { get; set; }
        /*主要业务*/
        public string MainOper { get; set; }
        /*资产规模*/
        public string AssetSize { get; set; }
        /*主要产品*/
        public string MainProduct { get; set; }
        /*资产分部*/
        public string AssetDistribute { get; set; }
        /*单位性质*/
        public string UnitCharacter { get; set; }
        /*背景资料*/
        public string Background { get; set; }
        /*其他信息*/
        public string OtherInfo { get; set; }
        /*第一联系人姓名*/
        public string Contact { get; set; }
        #endregion

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
        /// 根据查询条件取得客户列表
        /// </summary>
        /// <param name="customer"></param>
        /// <returns></returns>
        public static DataTable GetCustomerList(string sWhere)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select C.CustID, C.CustName, CO1.CodeName As AreaName, D.DeptName As DeprtmentName, C.Address,");
            sb.Append("C.PostCode, CO2.CodeName As TradeTypeName, C.IDNO, C.Contact, C.Tel, C.Mobile,");
            sb.Append("C.Fax, C.Email, U.UserNameCn As SalesName ");
            sb.Append("From Customer C (nolock) ");
            sb.Append("Left Join P_Code CO1 (nolock) On CO1.CodeType='Area' And CO1.CodeID=C.Area ");
            sb.Append("Left Join P_Code CO2 (nolock) On CO2.CodeType='TradeName' And CO2.CodeID=C.TradeTypeID ");
            sb.Append("Left Join P_Department D (nolock) On D.DeptID=C.DeprtmentID ");
            sb.Append("Left Join P_User U (nolock) On U.UserID=C.SalesID ");
            sb.Append("Where 1=1 ");
            sb.Append(sWhere);
            sb.Append(" Order By C.CustID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand).Tables[0];
        }

        /// <summary>
        /// 保存客户信息
        /// </summary>
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO Customer(CustID, CustName, TradeTypeID, Birthday, Area, Address, PostCode, CustTypeID, DeprtmentID, SalesID, CustClassifyID, ");
            sb.Append("Email, Tel, Fax, Mobile, IDNO, BankName, BankAccount, Hobby, MainOper, AssetSize, MainProduct, AssetDistribute, UnitCharacter, Background, ");
            sb.Append("OtherInfo, Risk, InsureStatus, Remark, Contact) ");
            sb.Append(" VALUES( ");
            sb.Append("@CustID, @CustName, @TradeTypeID, @Birthday, @Area, @Address, @PostCode, @CustTypeID, @DeprtmentID, @SalesID, @CustClassifyID, ");
            sb.Append("@Email, @Tel, @Fax, @Mobile, @IDNO, @BankName, @BankAccount, @Hobby, @MainOper, @AssetSize, @MainProduct, @AssetDistribute, @UnitCharacter, @Background, ");
            sb.Append("@OtherInfo, @Risk, @InsureStatus, @Remark, @Contact");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, this.CustID);
            _db.AddInParameter(dbCommand, "@CustName", DbType.AnsiString, this.CustName);
            _db.AddInParameter(dbCommand, "@TradeTypeID", DbType.AnsiString, this.TradeTypeID);
            _db.AddInParameter(dbCommand, "@Birthday", DbType.DateTime, DBNull.Value);
            _db.AddInParameter(dbCommand, "@Area", DbType.AnsiString, this.Area);
            _db.AddInParameter(dbCommand, "@Address", DbType.AnsiString, this.Address);
            _db.AddInParameter(dbCommand, "@PostCode", DbType.AnsiString, this.PostCode);
            _db.AddInParameter(dbCommand, "@CustTypeID", DbType.Int32, this.CustTypeID);
            _db.AddInParameter(dbCommand, "@DeprtmentID", DbType.AnsiString, this.DeprtmentID);
            _db.AddInParameter(dbCommand, "@SalesID", DbType.AnsiString, this.SalesID);
            _db.AddInParameter(dbCommand, "@CustClassifyID", DbType.AnsiString, this.CustClassifyID);
            _db.AddInParameter(dbCommand, "@Email", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@Tel", DbType.AnsiString, this.Tel);
            _db.AddInParameter(dbCommand, "@Fax", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@Mobile", DbType.AnsiString, this.Mobile);
            _db.AddInParameter(dbCommand, "@IDNO", DbType.AnsiString, this.IDNO);
            _db.AddInParameter(dbCommand, "@BankName", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@BankAccount", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@Hobby", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@MainOper", DbType.AnsiString, this.MainOper);
            _db.AddInParameter(dbCommand, "@AssetSize", DbType.AnsiString, this.AssetSize);
            _db.AddInParameter(dbCommand, "@MainProduct", DbType.AnsiString, this.MainProduct);
            _db.AddInParameter(dbCommand, "@AssetDistribute", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@UnitCharacter", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@Background", DbType.AnsiString, this.Background);
            _db.AddInParameter(dbCommand, "@OtherInfo", DbType.AnsiString, this.OtherInfo);
            _db.AddInParameter(dbCommand, "@Risk", DbType.AnsiString, this.Risk);
            _db.AddInParameter(dbCommand, "@InsureStatus", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@Remark", DbType.AnsiString, this.Remark);
            _db.AddInParameter(dbCommand, "@Contact", DbType.AnsiString, this.Contact);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 修改客户信息
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update Customer ");
            sb.Append("Set CustName=@CustName, TradeTypeID=@TradeTypeID, Birthday=@Birthday, Area=@Area, Address=@Address, PostCode=@PostCode, CustTypeID=@CustTypeID, DeprtmentID=@DeprtmentID, SalesID=@SalesID, CustClassifyID=@CustClassifyID, ");
            sb.Append("Email=@Email, Tel=@Tel, Fax=@Fax, Mobile=@Mobile, IDNO=@IDNO, BankName=@BankName, BankAccount=@BankAccount, Hobby=@Hobby,MainOper=@MainOper, AssetSize=@AssetSize, MainProduct=@MainProduct, AssetDistribute=@AssetDistribute, UnitCharacter=@UnitCharacter, Background=@Background, ");
            sb.Append("OtherInfo=@OtherInfo, Risk=@Risk, InsureStatus=@InsureStatus, Remark=@Remark, Contact=@Contact ");
            sb.Append("Where CustID=@CustID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, this.CustID);
            _db.AddInParameter(dbCommand, "@CustName", DbType.AnsiString, this.CustName);
            _db.AddInParameter(dbCommand, "@TradeTypeID", DbType.AnsiString, this.TradeTypeID);
            _db.AddInParameter(dbCommand, "@Birthday", DbType.DateTime, DBNull.Value);
            _db.AddInParameter(dbCommand, "@Area", DbType.AnsiString, this.Area);
            _db.AddInParameter(dbCommand, "@Address", DbType.AnsiString, this.Address);
            _db.AddInParameter(dbCommand, "@PostCode", DbType.AnsiString, this.PostCode);
            _db.AddInParameter(dbCommand, "@CustTypeID", DbType.Int32, this.CustTypeID);
            _db.AddInParameter(dbCommand, "@DeprtmentID", DbType.AnsiString, this.DeprtmentID);
            _db.AddInParameter(dbCommand, "@SalesID", DbType.AnsiString, this.SalesID);
            _db.AddInParameter(dbCommand, "@CustClassifyID", DbType.AnsiString, this.CustClassifyID);
            _db.AddInParameter(dbCommand, "@Email", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@Tel", DbType.AnsiString, this.Tel);
            _db.AddInParameter(dbCommand, "@Fax", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@Mobile", DbType.AnsiString, this.Mobile);
            _db.AddInParameter(dbCommand, "@IDNO", DbType.AnsiString, this.IDNO);
            _db.AddInParameter(dbCommand, "@BankName", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@BankAccount", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@Hobby", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@MainOper", DbType.AnsiString, this.MainOper);
            _db.AddInParameter(dbCommand, "@AssetSize", DbType.AnsiString, this.AssetSize);
            _db.AddInParameter(dbCommand, "@MainProduct", DbType.AnsiString, this.MainProduct);
            _db.AddInParameter(dbCommand, "@AssetDistribute", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@UnitCharacter", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@Background", DbType.AnsiString, this.Background);
            _db.AddInParameter(dbCommand, "@OtherInfo", DbType.AnsiString, this.OtherInfo);
            _db.AddInParameter(dbCommand, "@Risk", DbType.AnsiString, this.Risk);
            _db.AddInParameter(dbCommand, "@InsureStatus", DbType.AnsiString, DBNull.Value);
            _db.AddInParameter(dbCommand, "@Remark", DbType.AnsiString, this.Remark);
            _db.AddInParameter(dbCommand, "@Contact", DbType.AnsiString, this.Contact);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 判断是否存在客户编号
        /// </summary>
        /// <param name="custID"></param>
        /// <returns></returns>
        public static bool IfExistsCustID(string custID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select CustID From Customer (nolock) ");
            sb.Append("Where CustID=@CustID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, custID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 删除客户信息
        /// </summary>
        /// <param name="custID"></param>
        public static void Delete(string custID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM Customer ");
            sb.Append(" WHERE CustID = @CustID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, custID);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 根据用户ID取得用户信息
        /// </summary>
        /// <param name="custID"></param>
        /// <returns></returns>
        public static BO_Customer GetCustomerByID(string custID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select * From Customer (nolock) ");
            sb.Append("Where CustID=@CustID");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, custID);

            BO_Customer customer = null;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    customer = new BO_Customer();
                    customer.CustID = Utility.GetStringFromReader(reader, FieldList.CustID.ToString());
                    customer.CustName = Utility.GetStringFromReader(reader, FieldList.CustName.ToString());
                    customer.TradeTypeID = Utility.GetStringFromReader(reader, FieldList.TradeTypeID.ToString());
                    customer.Birthday = Utility.GetDatetimeFromReader(reader, FieldList.Birthday.ToString());
                    customer.Area = Utility.GetStringFromReader(reader, FieldList.Area.ToString());
                    customer.Address = Utility.GetStringFromReader(reader, FieldList.Address.ToString());
                    customer.PostCode = Utility.GetStringFromReader(reader, FieldList.PostCode.ToString());
                    customer.CustTypeID = Utility.GetIntFromReader(reader, FieldList.CustTypeID.ToString());
                    customer.DeprtmentID = Utility.GetStringFromReader(reader, FieldList.DeprtmentID.ToString());
                    customer.SalesID = Utility.GetStringFromReader(reader, FieldList.SalesID.ToString());
                    customer.CustClassifyID = Utility.GetStringFromReader(reader, FieldList.CustClassifyID.ToString());
                    customer.Email = Utility.GetStringFromReader(reader, FieldList.Email.ToString());
                    customer.Tel = Utility.GetStringFromReader(reader, FieldList.Tel.ToString());
                    customer.Fax = Utility.GetStringFromReader(reader, FieldList.Fax.ToString());
                    customer.Mobile = Utility.GetStringFromReader(reader, FieldList.Mobile.ToString());
                    customer.IDNO = Utility.GetStringFromReader(reader, FieldList.IDNO.ToString());
                    customer.BankName = Utility.GetStringFromReader(reader, FieldList.BankName.ToString());
                    customer.BankAccount = Utility.GetStringFromReader(reader, FieldList.BankAccount.ToString());
                    customer.Hobby = Utility.GetStringFromReader(reader, FieldList.Hobby.ToString());
                    customer.MainOper = Utility.GetStringFromReader(reader, FieldList.MainOper.ToString());
                    customer.AssetSize = Utility.GetStringFromReader(reader, FieldList.AssetSize.ToString());
                    customer.MainProduct = Utility.GetStringFromReader(reader, FieldList.MainProduct.ToString());
                    customer.AssetDistribute = Utility.GetStringFromReader(reader, FieldList.AssetDistribute.ToString());
                    customer.UnitCharacter = Utility.GetStringFromReader(reader, FieldList.UnitCharacter.ToString());
                    customer.Background = Utility.GetStringFromReader(reader, FieldList.Background.ToString());
                    customer.OtherInfo = Utility.GetStringFromReader(reader, FieldList.OtherInfo.ToString());
                    customer.Risk = Utility.GetStringFromReader(reader, FieldList.Risk.ToString());
                    customer.InsureStatus = Utility.GetStringFromReader(reader, FieldList.InsureStatus.ToString());
                    customer.Remark = Utility.GetStringFromReader(reader, FieldList.Remark.ToString());
                    customer.Contact = Utility.GetStringFromReader(reader, FieldList.Contact.ToString());
                    break;
                }
            }

            return customer;
        }
        #endregion
    }
}
