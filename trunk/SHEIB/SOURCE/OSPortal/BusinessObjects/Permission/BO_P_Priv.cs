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
    public class BO_P_Priv : BaseObject
    {

        public BO_P_Priv() { }

        public BO_P_Priv(String id)
        {
            //fetchByID(id);
        }

        public enum FieldList
        {
            PrivID, 
            PrivName, 
            MenuID, 
            PrivType
        }


        public enum RoleFieldList
        {
            RolePrivID, 
            RoleID,  
            PrivID, 
            PrivName, 
            MenuID, 
            PrivType
        }



        #region Priv Enum

        public enum PrivListEnum
        {
            Customer_List_Search_All = 101010,
            Customer_List_Search_Group = 101011,
            Customer_List_Search_Personal = 101012,
            Customer_List_Add = 101013,
            Customer_List_Modify = 101014,
            Customer_List_Delete = 101015,

            Contact_List_Search_All = 101020,
            Contact_List_Search_Group = 101021,
            Contact_List_Search_Personal = 101022,

            ServiceFollowUp_List_Search_All = 101030,
            ServiceFollowUp_List_Search_Group = 101031,
            ServiceFollowUp_List_Search_Personal = 101032,

            PolicyInput_List_Search_All = 102010,
            PolicyInput_List_Search_Group = 102011,
            PolicyInput_List_Search_Personal = 102012,
            PolicyInput_Add = 102013,
            PolicyInput_Modify = 102014,
            PolicyInput_Delete = 102015,
            
            PolicyAltInput_List_Search_All = 102020,
            PolicyAltInput_List_Search_Group = 102021,
            PolicyAltInput_List_Search_Personal = 102022,
            PolicyAltInput_Add = 102023,
            PolicyAltInput_Modify = 102024,
            PolicyAltInput_Delete = 102025,

            PolicyAudit_List_Search_All = 102030,
            PolicyAudit_List_Search_Group = 102031,
            PolicyAudit_List_Search_Personal = 102032,
            PolicyAudit_Audit = 102033,
            PolicyAudit_AuditBack = 102034,

            AskPriceInput_List_Search_All = 103010,
            AskPriceInput_List_Search_Group = 103011,
            AskPriceInput_List_Search_Personal = 103012,
            AskPriceInput_Add = 103013,
            AskPriceInput_Modify = 103014,
            AskPriceInput_Delete = 103015,


            AskPriceInput_AuditList_Search_All = 103020,
            AskPriceInput_AuditList_Search_Group = 103021,
            AskPriceInput_AuditList_Search_Personal = 103022,
            AskPriceInput_Audit = 103023,
            AskPriceInput_AuditBack = 103024,

            PolicyAlt_AuditList_Search_All = 103030,
            PolicyAlt_AuditList_Search_Group = 103031,
            PolicyAlt_AuditList_Search_Personal = 103032,
            //PolicyInfo_Append = 103043,
            //PolicyAlt_Add = 103034,
            //PolicyAlt_Modify = 103035,
            //PolicyAlt_Delete = 103036,

            PolicyInfo_AppendList_Search_All = 103040,
            PolicyInfo_AppendList_Search_Group = 103041,
            PolicyInfo_AppendList_Search_Personal = 103042,
            PolicyInfo_Append = 103043,

            Alt_List_Search_All = 103050,
            Alt_List_Search_Group = 103051,
            Alt_List_Search_Personal = 103052,
            PolicyAlt_Add = 103053,
            PolicyAlt_Modify = 103054,
            PolicyAlt_Delete = 103055,


            
            PaymentClaims_Register = 104010,
            PaymentClaims_Modify = 104011,
            PaymentClaims_Delete = 104012,
            PaymentClaims_Search = 104013,

            //PaymentClaimsDocManage = 104020,

            BusinessConsultList_View_All = 105010,
            BusinessConsultList_View_Group = 105011,
            BusinessConsultList_View_Personal = 105012,
            BusinessConsultList_Add = 105013,
            BusinessConsultList_Modify = 105014,
            BusinessConsultList_Delete = 105015,
            BusinessConsultList_Audit = 105016,
            BusinessConsultList_AuditBack = 105017,

            FeeNoticeList_Search_All = 106010,
            FeeNoticeList_Search_Group = 106011,
            FeeNoticeList_Search_Personal = 106012,
            FeeNotice_Add = 106013,
            FeeNotice_Modify = 106014,
            FeeNotice_Delete = 106015,
            FeeNotice_Audit = 106016,
            FeeNotice_AuditBack = 106017,
            FeeNotice_SignReport_Print = 106018,


            FeeCustomerList_Search_All = 106020,
            FeeCustomerList_Search_Group = 106021,
            FeeCustomerList_Search_Personal = 106022,
            FeeCustomer_Add = 106023,
            FeeCustomer_Modify = 106024,
            FeeCustomer_Delete = 106025,
            FeeCustomer_Audit = 106026,
            FeeCustomer_AuditBack = 106027,


            FeePayList_Search_All = 106030,
            FeePayList_Search_Group = 106031,
            FeePayList_Search_Personal = 106032,
            FeePay_Add = 106033,
            FeePay_Modify = 106034,
            FeePay_Delete = 106035,
            FeePay_Audit = 106036,
            FeePay_AuditBack = 106037,
            FeePay_NoticeReport_Print = 106038,



            FeeVoiceList_Search_All = 106040,
            FeeVoiceList_Search_Group = 106041,
            FeeVoiceList_Search_Personal = 106042,
            FeeVoice_Add = 106043,
            FeeVoice_Modify = 106044,
            FeeVoice_Delete = 106045,
            FeeVoice_Audit = 106046,
            FeeVoice_AuditBack = 106047,
            FeeVoice_NoticeReport_Print = 106048,


            FeeBalanceList_Search_All = 106050,
            FeeBalanceList_Search_Group = 106051,
            FeeBalanceList_Search_Personal = 106052,
            FeeBalance_Add = 106053,
            FeeBalance_Modify = 106054,
            FeeBalance_Delete = 106055,
            FeeBalance_Audit = 106056,
            FeeBalance_AuditBack = 106057,
            FeeBalance_PayListReport_Print = 106058,

            FeeNotice_NoPay_List = 106060,
            FeeCustomer_NoFeePay_List = 106070,
            FeePay_NoFeeVoice_List = 106080,
            FeeVoice_NoFeeBalance_List = 106090,

            Policy_Search_All = 107010,
            Policy_Search_Group = 107011,
            Policy_Search_Personal = 107012,

            Policy_Search_Carrier_All = 107020,
            Policy_Search_Carrier_Group = 107021,
            Policy_Search_Carrier_Personal = 107022,

            //AchievementReport = 107010,
            Employee_Manage = 108010,

            Role_Manage = 108020,

            Organ_Schema = 108030,

            Policy_Carrier = 108040,

            PolicyCarrier_Branch = 108050,

            PolicyProduction_Type = 108060,

            Data_Dictionary = 108070,

            Enterprise_List = 108080,

            System_Option = 108090,

            ServiceAlert = 108100,

            
            SignupBudget_List = 109010,

            SignupBudget_RunDetail = 109020,

            SignupBudget_CompleteSummary = 109030,

            Budget_BaseList = 109040,

            InsuranceBrokerBusinessReport_All  = 111010,
            InsuranceBrokerBusinessReport_Group = 111011,
            InsuranceBrokerBusinessReport_Personal = 111012,

            ReceivablePremiumReport_All = 111020,
            ReceivablePremiumReport_Group = 111021,
            ReceivablePremiumReport_Personal = 111022,

            ReceivableProcessReport_All = 111030,
            ReceivableProcessReport_Group = 111031,
            ReceivableProcessReport_Personal = 111032,

            RealPremiumOverTimeReport_All = 111040,
            RealPremiumOverTimeReport_Group = 111041,
            RealPremiumOverTimeReport_Personal = 111042,


            CIRC_Report_ByAddress = 102010,
            CIRC_Report_BySignAdress = 102020,

            Trade_Association_Report = 102030

        }


        #endregion Priv Enum



        #region Property

        public string PrivID
        {
            get;
            set;
        }

        public string PrivName
        {
            get;
            set;
        }

        public string MenuID
        {
            get;
            set;
        }

        public string PrivType
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

        public static List<BO_P_Priv> FetchList()
        {
            List<BO_P_Priv> list = new List<BO_P_Priv>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT PrivID, PrivName, MenuID, PrivType");
            sb.Append(" FROM P_Priv;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_P_Priv newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_P_Priv();

                    newObj.PrivID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PrivID));
                    newObj.PrivName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PrivName));
                    newObj.MenuID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.MenuID));
                    newObj.PrivType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PrivType));

                    list.Add(newObj);
                }
            }

            return list;
        }


        public static void Delete(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM P_Priv ");
            sb.Append(" WHERE PrivID = @PrivID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@PrivID", DbType.String, id);

            _db.ExecuteNonQuery(dbCommand);

        }


        public static List<BO_P_Priv> FetchListByRoleID(String roleID)
        {
            List<BO_P_Priv> list = new List<BO_P_Priv>();

            StringBuilder sb = new StringBuilder();
            sb.Append(" SELECT A.RolePrivID, A.RoleID, A.PrivID, ");
            sb.Append(" C.PrivName, C.MenuID, PrivType ");
            sb.Append(" FROM P_RolePriv A ");
            sb.Append(" INNER JOIN P_Role B ON A.RoleID = B.RoleID ");
            sb.Append(" INNER JOIN P_Priv C ON C.PrivID = A.PrivID ");
            sb.Append(" WHERE A.RoleID = @RoleID ");
            sb.Append(" ");
            sb.Append(" ");
            sb.Append(" ;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@RoleID", DbType.String, roleID);

            BO_P_Priv newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_P_Priv();

                    newObj.PrivID = Utility.GetStringFromReader(reader, Convert.ToInt32(RoleFieldList.PrivID));
                    newObj.PrivName = Utility.GetStringFromReader(reader, Convert.ToInt32(RoleFieldList.PrivName));
                    newObj.MenuID = Utility.GetStringFromReader(reader, Convert.ToInt32(RoleFieldList.MenuID));
                    newObj.PrivType = Utility.GetStringFromReader(reader, Convert.ToInt32(RoleFieldList.PrivType));

                    list.Add(newObj);
                }
            }

            return list;
        }


        #endregion Methods




        #region Procedure

        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT  PrivID, PrivName, MenuID, PrivType ");
            sb.Append(" FROM P_Priv;");
            sb.Append(" WHERE PrivID = @PrivID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PrivID", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.PrivID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PrivID));
                    this.PrivName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PrivName));
                    this.MenuID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.MenuID));
                    this.PrivType = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.PrivType));
                }
            }
        }


        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO P_Priv(PrivID, PrivName, MenuID, PrivType)");
            sb.Append(" VALUES( ");
            sb.Append("@PrivID, @PrivName, @MenuID, @PrivType");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PrivID", DbType.String, this.PrivID);
            _db.AddInParameter(dbCommand, "@PrivName", DbType.String, this.PrivName);
            _db.AddInParameter(dbCommand, "@MenuID", DbType.String, this.MenuID);
            _db.AddInParameter(dbCommand, "@PrivType", DbType.String, this.PrivType);

            _db.ExecuteNonQuery(dbCommand);
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE P_Priv SET ");
            sb.Append(" PrivName=@PrivName, MenuID=@MenuID, PrivType=@PrivType ");
            sb.Append(" Where PrivID=@PrivID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@PrivID", DbType.String, this.PrivID);
            _db.AddInParameter(dbCommand, "@PrivName", DbType.String, this.PrivName);
            _db.AddInParameter(dbCommand, "@MenuID", DbType.String, this.MenuID);
            _db.AddInParameter(dbCommand, "@PrivType", DbType.String, this.PrivType);


            _db.ExecuteNonQuery(dbCommand);

        }


        #endregion Procedure





    }
}
