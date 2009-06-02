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
            Birthday,
            Area,
            Address,
            PostCode,
            CustTypeID,
            DeprtmentID,
            SalesID,
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
            AreaName,
            PlateName,
            TradeTypeName,
            ContactName,
            SalesName
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
        /*行业分类*/
        public string TradeTypeID { get; set; }
        /*生日*/
        public DateTime Birthday { get; set; }
        /*区域*/
        public string Area { get; set; }
        /*地址*/
        public string Address { get; set; }
        /*邮政编码*/
        public string PostCode { get; set; }
        /*客户类型*/
        public int CustTypeID { get; set; }
        /*部门*/
        public string DeprtmentID { get; set; }
        /*客户经理*/
        public string SalesID { get; set; }
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
        /*区域名称*/
        public string AreaName { get; set; }
        /*所属板块*/
        public string PlateName { get; set; }
        /*行业分类*/
        public string TradeTypeName { get; set; }
        /*第一联系人姓名*/
        public string ContactName { get; set; }
        /*客户经理姓名*/
        public string SalesName { get; set; }
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

        public static List<BO_Customer> FetchList()
        {
            List<BO_Customer> list = new List<BO_Customer>();

            StringBuilder sb = new StringBuilder();
            sb.Append("Select C.CustID, C.CustName, CO1.CodeName As AreaName, '' As PlateName, C.Address,");
            sb.Append("C.PostCode, CO2.CodeName As TradeTypeName, C.IDNO, '' As ContactName, C.Tel, C.Mobile,");
            sb.Append("C.Fax, C.Email, U.UserNameCn As SalesName ");
            sb.Append("From Customer C (nolock) ");
            sb.Append("Left Join P_Code CO1 (nolock) On CO1.CodeType='Area' And CO1.CodeID=C.Area ");
            sb.Append("Left Join P_Code CO2 (nolock) On CO2.CodeType='TradeName' And CO2.CodeID=C.TradeTypeID ");
            sb.Append("Left Join P_User U (nolock) On U.UserID=C.SalesID ");
            sb.Append("Order By C.CustID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_Customer newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_Customer();

                    newObj.CustID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustID));
                    newObj.CustName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustName));
                    //newObj.Risk = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Risk));
                    //newObj.InsureStatus = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.InsureStatus));
                    //newObj.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                    //newObj.TradeTypeID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.TradeTypeID));
                    //newObj.Birthday = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.Birthday));
                    //newObj.Area = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Area));
                    newObj.Address = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Address));
                    newObj.PostCode = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PostCode));
                    //newObj.CustTypeID = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.CustTypeID));
                    //newObj.DeprtmentID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeprtmentID));
                    //newObj.SalesID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.SalesID));
                    //newObj.CustClassifyID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.CustClassifyID));
                    newObj.Email = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Email));
                    newObj.Tel = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Tel));
                    newObj.Fax = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Fax));
                    newObj.Mobile = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Mobile));
                    newObj.IDNO = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.IDNO));
                    //newObj.BankName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankName));
                    //newObj.BankAccount = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.BankAccount));
                    //newObj.Hobby = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Hobby));
                    //newObj.MainOper = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.MainOper));
                    //newObj.AssetSize = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AssetSize));
                    //newObj.MainProduct = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.MainProduct));
                    //newObj.AssetDistribute = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AssetDistribute));
                    //newObj.UnitCharacter = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.UnitCharacter));
                    //newObj.Background = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Background));
                    //newObj.OtherInfo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.OtherInfo));
                    newObj.OtherInfo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.AreaName));
                    newObj.OtherInfo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PlateName));
                    newObj.OtherInfo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.TradeTypeName));
                    newObj.OtherInfo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ContactName));
                    newObj.OtherInfo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.SalesName));

                    list.Add(newObj);
                }
            }

            return list;
        }
        #endregion
    }
}
