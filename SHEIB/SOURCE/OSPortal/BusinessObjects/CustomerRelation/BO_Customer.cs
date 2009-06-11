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
    public class BO_Customer : BaseObject
    {
        public BO_Customer() { }

        public BO_Customer(String id)
        {
            //fetchByID(id);
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
            ContactName
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
        public string ContactName { get; set; }
        #endregion

        #region Methods
        public void Save(ModifiedAction action)
        {
            if (action == ModifiedAction.Insert)
            {
                //add();
            }
            else
            {
                //update();
            }
        }

        /// <summary>
        /// 根据查询条件取得客户列表
        /// </summary>
        /// <param name="customer"></param>
        /// <returns></returns>
        public static DataTable GetCustomerList(BO_Customer customer)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select C.CustID, C.CustName, CO1.CodeName As AreaName, D.DeptName As DeprtmentName, C.Address,");
            sb.Append("C.PostCode, CO2.CodeName As TradeTypeName, C.IDNO, '' As ContactName, C.Tel, C.Mobile,");
            sb.Append("C.Fax, C.Email, U.UserNameCn As SalesName ");
            sb.Append("From Customer C (nolock) ");
            sb.Append("Left Join P_Code CO1 (nolock) On CO1.CodeType='Area' And CO1.CodeID=C.Area ");
            sb.Append("Left Join P_Code CO2 (nolock) On CO2.CodeType='TradeName' And CO2.CodeID=C.TradeTypeID ");
            sb.Append("Left Join P_Department D (nolock) On D.DeptID=C.DeprtmentID ");
            sb.Append("Left Join P_User U (nolock) On U.UserID=C.SalesID ");
            sb.Append("Where C.CustTypeID=@CustTypeID ");
            if (!string.IsNullOrEmpty(customer.CustID))
                sb.Append("And C.CustID=@CustID ");
            if (!string.IsNullOrEmpty(customer.Area))
                sb.Append("And C.Area=@Area ");
            if (!string.IsNullOrEmpty(customer.Address))
                sb.Append("And C.Address like '%'+@Address+'%' ");
            if (!string.IsNullOrEmpty(customer.CustName))
                sb.Append("And C.CustName like '%'+@CustName+'%' ");
            if (!string.IsNullOrEmpty(customer.TradeTypeID))
                sb.Append("And C.TradeTypeID=@TradeTypeID ");
            if (!string.IsNullOrEmpty(customer.DeprtmentID))
                sb.Append("And C.DeprtmentID=@DeprtmentID ");
            if (!string.IsNullOrEmpty(customer.IDNO))
                sb.Append("And C.IDNO=@IDNO ");
            if (!string.IsNullOrEmpty(customer.SalesID))
                sb.Append("And C.SalesID=@SalesID ");
            sb.Append("Order By C.CustID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustTypeID", DbType.Int32, customer.CustTypeID);
            if (!string.IsNullOrEmpty(customer.CustID))
                _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, customer.CustID);
            if (!string.IsNullOrEmpty(customer.Area))
                _db.AddInParameter(dbCommand, "@Area", DbType.AnsiString, customer.Area);
            if (!string.IsNullOrEmpty(customer.Address))
                _db.AddInParameter(dbCommand, "@Address", DbType.AnsiString, customer.Address);
            if (!string.IsNullOrEmpty(customer.CustName))
                _db.AddInParameter(dbCommand, "@CustName", DbType.AnsiString, customer.CustName);
            if (!string.IsNullOrEmpty(customer.TradeTypeID))
                _db.AddInParameter(dbCommand, "@TradeTypeID", DbType.AnsiString, customer.TradeTypeID);
            if (!string.IsNullOrEmpty(customer.DeprtmentID))
                _db.AddInParameter(dbCommand, "@DeprtmentID", DbType.AnsiString, customer.DeprtmentID);
            if (!string.IsNullOrEmpty(customer.IDNO))
                _db.AddInParameter(dbCommand, "@IDNO", DbType.AnsiString, customer.IDNO);
            if (!string.IsNullOrEmpty(customer.SalesID))
                _db.AddInParameter(dbCommand, "@SalesID", DbType.AnsiString, customer.SalesID);


            return _db.ExecuteDataSet(dbCommand).Tables[0];
        }
        #endregion
    }
}
