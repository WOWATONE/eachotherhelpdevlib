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
    public class BO_CustContact : BaseObject
    {
        public BO_CustContact() { }

        public BO_CustContact(String id)
        {
            //FetchByID(id);
        }

        public enum FieldList
        {
            ContactID,
            ContactName,
            CustID,
            Position,
            Sex,
            Tel,
            Fax,
            MobilePhone,
            Email,
            Interest,
            Remark,
            NewContactID
        }

        #region Property
        /*联系人GUID*/
        public string ContactID { get; set; }
        /*联系人姓名*/
        public string ContactName { get; set; }
        /*所属客户GUID*/
        public string CustID { get; set; }
        /*职位*/
        public string Position { get; set; }
        /*性别*/
        public string Sex { get; set; }
        /*电话*/
        public string Tel { get; set; }
        /*传真*/
        public string Fax { get; set; }
        /*手机*/
        public string MobilePhone { get; set; }
        /*电子信箱*/
        public string Email { get; set; }
        /*兴趣爱好*/
        public string Interest { get; set; }
        /*备注*/
        public string Remark { get; set; }
        /*新联系人GUID*/
        public string NewContactID { get; set; }
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
        /// 保存联系人信息
        /// </summary>
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO CustContact(ContactID, ContactName, CustID, [Position], Sex, Tel, Fax, MobilePhone, Email, Interest, Remark) ");
            sb.Append(" VALUES(@ContactID, @ContactName, @CustID, @Position, @Sex, @Tel, @Fax, @MobilePhone, @Email, @Interest, @Remark)");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ContactID", DbType.AnsiString, this.ContactID);
            _db.AddInParameter(dbCommand, "@ContactName", DbType.AnsiString, this.ContactName);
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, this.CustID);
            _db.AddInParameter(dbCommand, "@Position", DbType.AnsiString, this.Position);
            _db.AddInParameter(dbCommand, "@Sex", DbType.AnsiString, this.Sex);
            _db.AddInParameter(dbCommand, "@Tel", DbType.AnsiString, this.Tel);
            _db.AddInParameter(dbCommand, "@Fax", DbType.AnsiString, this.Fax);
            _db.AddInParameter(dbCommand, "@MobilePhone", DbType.AnsiString, this.MobilePhone);
            _db.AddInParameter(dbCommand, "@Email", DbType.AnsiString, this.Email);
            _db.AddInParameter(dbCommand, "@Interest", DbType.AnsiString, this.Interest);
            _db.AddInParameter(dbCommand, "@Remark", DbType.AnsiString, this.Remark);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 修改联系人信息
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update CustContact ");
            sb.Append("Set ContactID=@NewContactID, ContactName=@ContactName, CustID=@CustID, Position=@Position, Sex=@Sex, Tel=@Tel, ");
            sb.Append("Fax=@Fax, MobilePhone=@MobilePhone, Email=@Email, Interest=@Interest, Remark=@Remark  ");
            sb.Append("Where ContactID=@ContactID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@ContactID", DbType.AnsiString, this.ContactID);
            _db.AddInParameter(dbCommand, "@ContactName", DbType.AnsiString, this.ContactName);
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, this.CustID);
            _db.AddInParameter(dbCommand, "@Position", DbType.AnsiString, this.Position);
            _db.AddInParameter(dbCommand, "@Sex", DbType.AnsiString, this.Sex);
            _db.AddInParameter(dbCommand, "@Tel", DbType.AnsiString, this.Tel);
            _db.AddInParameter(dbCommand, "@Fax", DbType.AnsiString, this.Fax);
            _db.AddInParameter(dbCommand, "@MobilePhone", DbType.AnsiString, this.MobilePhone);
            _db.AddInParameter(dbCommand, "@Email", DbType.AnsiString, this.Email);
            _db.AddInParameter(dbCommand, "@Interest", DbType.AnsiString, this.Interest);
            _db.AddInParameter(dbCommand, "@Remark", DbType.AnsiString, this.Remark);
            _db.AddInParameter(dbCommand, "@NewContactID", DbType.AnsiString, this.NewContactID);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 根据用户ID取得联系人信息
        /// </summary>
        /// <param name="custID"></param>
        /// <returns></returns>
        public static DataTable GetCustContactByCustID(string custID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ContactID, ContactName, Position, isnull(Sex,'') as Sex, Tel, Fax, MobilePhone, Email, Interest, Remark ");
            sb.Append("From CustContact (nolock) ");
            sb.Append("Where CustID=@CustID ");
            sb.Append("Order By ContactID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, custID);

            return _db.ExecuteDataSet(dbCommand).Tables[0];
        }

        /// <summary>
        /// 判断是否存在联系人编号
        /// </summary>
        /// <param name="contactID"></param>
        /// <returns></returns>
        public static bool IfExistsContactID(string contactID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ContactID From CustContact (nolock) ");
            sb.Append("Where ContactID=@ContactID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ContactID", DbType.AnsiString, contactID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 删除联系人信息
        /// </summary>
        /// <param name="contactID"></param>
        public static void Delete(string contactID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM CustContact ");
            sb.Append(" WHERE ContactID = @ContactID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@ContactID", DbType.AnsiString, contactID);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 根据查询条件取得保险公司列表
        /// </summary>
        /// <param name="sWhere"></param>
        /// <returns></returns>
        public static DataSet GetCustContactList(string sWhere)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select ");
            sb.Append("CC.ContactID, CC.ContactName, CC.Sex, C.CustName, P.UserNameCn as SalesName, CC.Position, CC.Tel, CC.Fax, CC.MobilePhone, CC.Email, CC.Interest, CC.Remark ");
            sb.Append("From CustContact CC (nolock) ");
            sb.Append("Left Join Customer C (nolock) On C.CustID=CC.CustID ");
            sb.Append("Left Join P_User P (nolock) On P.UserID=C.SalesID ");
            sb.Append("Where 1=1 ");
            if (sWhere != "")
            {
                sb.Append(sWhere);
            }
            sb.Append(" Order By CC.ContactID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }
        #endregion
    }
}