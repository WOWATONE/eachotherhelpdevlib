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
            //客户列表查询(全部)
            Customer_List_Search_All = 101010,
            //客户列表查询(团队)
            Customer_List_Search_Group = 101011,
            //客户列表查询(个人)
            Customer_List_Search_Personal = 101012,

            //客户列表新建
            Customer_List_Add = 101013,
            //客户列表编辑
            Customer_List_Modify = 101014,
            //客户列表删除
            Customer_List_Delete = 101015,

            //联系人列表查询(全部)
            Contact_List_Search_All = 101020,
            //联系人列表查询(团队)
            Contact_List_Search_Group = 101021,
            //联系人列表查询(个人)
            Contact_List_Search_Personal = 101022,

            //业务跟进列表查询(全部)
            ServiceFollowUp_List_Search_All = 101030,
            //业务跟进列表查询(团队)
            ServiceFollowUp_List_Search_Group = 101031,
            //业务跟进列表查询(个人)
            ServiceFollowUp_List_Search_Personal = 101032,

            //保单录入列表查询 (全部)
            PolicyInput_List_Search_All = 102010,
            //保单录入列表查询 (团队)
            PolicyInput_List_Search_Group = 102011,
            //保单录入列表查询 (个人)
            PolicyInput_List_Search_Personal = 102012,

            //保单录入新建
            PolicyInput_Add = 102013,
            //保单录入编辑
            PolicyInput_Modify = 102014,
            //保单录入删除
            PolicyInput_Delete = 102015,

            //批单列表查询(全部)
            PolicyAltInput_List_Search_All = 102020,
            //批单列表查询(团队)
            PolicyAltInput_List_Search_Group = 102021,
            //批单列表查询(个人)
            PolicyAltInput_List_Search_Personal = 102022,

            //批单新建
            PolicyAltInput_Add = 102023,
            //批单编辑
            PolicyAltInput_Modify = 102024,
            //批单删除
            PolicyAltInput_Delete = 102025,

            //保单审核列表查询(全部)
            PolicyAudit_List_Search_All = 102030,
            //保单审核列表查询(团队)
            PolicyAudit_List_Search_Group = 102031,
            //保单审核列表查询(个人)
            PolicyAudit_List_Search_Personal = 102032,

            //保单审核
            PolicyAudit_Audit = 102033,
            //保单反审核
            PolicyAudit_AuditBack = 102034,

            //询价单列表查询 (全部)
            AskPriceInput_List_Search_All = 103010,
            //询价单列表查询 (团队)
            AskPriceInput_List_Search_Group = 103011,
            //询价单列表查询 (个人)
            AskPriceInput_List_Search_Personal = 103012,

            //询价单新建
            AskPriceInput_Add = 103013,
            //询价单编辑
            AskPriceInput_Modify = 103014,
            //询价单删除
            AskPriceInput_Delete = 103015,


            //询价单审核列表查询(全部)
            AskPriceInput_AuditList_Search_All = 103020,
            //询价单审核列表查询(团队)
            AskPriceInput_AuditList_Search_Group = 103021,
            //询价单审核列表查询(个人)
            AskPriceInput_AuditList_Search_Personal = 103022,

            //询价单审核
            AskPriceInput_Audit = 103023,
            //询价单反审核
            AskPriceInput_AuditBack = 103024,

            //批单审核列表查询(全部)
            PolicyAlt_AuditList_Search_All = 103030,
            //批单审核列表查询(团队)
            PolicyAlt_AuditList_Search_Group = 103031,
            //批单审核列表查询(个人)
            PolicyAlt_AuditList_Search_Personal = 103032,

            //保单信息补录
            //PolicyInfo_Append = 103043,

            //保单批改新建
            //PolicyAlt_Add = 103034,
            //保单批改编辑
            //PolicyAlt_Modify = 103035,
            //保单批改删除
            //PolicyAlt_Delete = 103036,

            //保单信息补录列表查询(全部)
            PolicyInfo_AppendList_Search_All = 103040,
            //保单信息补录列表查询(团队)
            PolicyInfo_AppendList_Search_Group = 103041,
            //保单信息补录列表查询(个人)
            PolicyInfo_AppendList_Search_Personal = 103042,
            //保单信息补录
            PolicyInfo_Append = 103043,

            //保单批改列表查询(全部)
            PolicyAlt_List_Search_All = 103050,
            //保单批改列表查询(团队)
            PolicyAlt_List_Search_Group = 103051,
            //保单批改列表查询(个人)
            PolicyAlt_List_Search_Personal = 103052,

            //保单批改新建
            PolicyAlt_Add = 103053,
            //保单批改编辑
            PolicyAlt_Modify = 103054,
            //保单批改删除
            PolicyAlt_Delete = 103055,


            //赔案登记新建
            PaymentClaims_Register = 104010,
            //赔案登记编辑
            PaymentClaims_Modify = 104011,
            //赔案登记删除
            PaymentClaims_Delete = 104012,
            //赔案登记查询
            PaymentClaims_Search = 104013,

            //PaymentClaimsDocManage = 104020,

            //业务咨询列表查看(全部)
            BusinessConsultList_View_All = 105010,
            //业务咨询列表查看(团队)
            BusinessConsultList_View_Group = 105011,
            //业务咨询列表查看(个人)
            BusinessConsultList_View_Personal = 105012,

            //业务咨询新增
            BusinessConsultList_Add = 105013,
            //业务咨询编辑
            BusinessConsultList_Modify = 105014,
            //业务咨询删除
            BusinessConsultList_Delete = 105015,
            //业务咨询审核
            BusinessConsultList_Audit = 105016,
            //业务咨询反审核
            BusinessConsultList_AuditBack = 105017,

            //保费通知书列表查询(全部)
            FeeNoticeList_Search_All = 106010,
            //保费通知书列表查询(团队)
            FeeNoticeList_Search_Group = 106011,
            //保费通知书列表查询(个人)
            FeeNoticeList_Search_Personal = 106012,

            //保费通知书新建
            FeeNotice_Add = 106013,
            //保费通知书编辑
            FeeNotice_Modify = 106014,
            //保费通知书删除
            FeeNotice_Delete = 106015,
            //保费通知书审核
            FeeNotice_Audit = 106016,
            //保费通知书反审核
            FeeNotice_AuditBack = 106017,
            //保费通知书单证打印
            FeeNotice_SignReport_Print = 106018,


            //客户收费列表查询(全部)
            FeeCustomerList_Search_All = 106020,
            //客户收费列表查询(团队)
            FeeCustomerList_Search_Group = 106021,
            //客户收费列表查询(个人)
            FeeCustomerList_Search_Personal = 106022,

            //客户收费新建
            FeeCustomer_Add = 106023,
            //客户收费编辑
            FeeCustomer_Modify = 106024,
            //客户收费删除
            FeeCustomer_Delete = 106025,
            //客户收费审核
            FeeCustomer_Audit = 106026,
            //客户收费反审核
            FeeCustomer_AuditBack = 106027,


            //解付保费列表查询(全部)
            FeePayList_Search_All = 106030,
            //解付保费列表查询(团队)
            FeePayList_Search_Group = 106031,
            //解付保费列表查询(个人)
            FeePayList_Search_Personal = 106032,

            //解付保费新建
            FeePay_Add = 106033,
            //解付保费编辑
            FeePay_Modify = 106034,
            //解付保费删除
            FeePay_Delete = 106035,
            //解付保费审核
            FeePay_Audit = 106036,
            //解付保费反审核
            FeePay_AuditBack = 106037,
            //解付保费通知书打印
            FeePay_NoticeReport_Print = 106038,


            //经纪费开票列表查询(全部)
            FeeVoiceList_Search_All = 106040,
            //经纪费开票列表查询(团队)
            FeeVoiceList_Search_Group = 106041,
            //经纪费开票列表查询(个人)
            FeeVoiceList_Search_Personal = 106042,

            //经纪费开票新建
            FeeVoice_Add = 106043,
            //经纪费开票编辑
            FeeVoice_Modify = 106044,
            //经纪费开票删除
            FeeVoice_Delete = 106045,
            //经纪费开票审核
            FeeVoice_Audit = 106046,
            //经纪费开票反审核
            FeeVoice_AuditBack = 106047,
            //开票通知书打印
            FeeVoice_NoticeReport_Print = 106048,


            //经纪费结算列表查询(全部)
            FeeBalanceList_Search_All = 106050,
            //经纪费结算列表查询(团队)
            FeeBalanceList_Search_Group = 106051,
            //经纪费结算列表查询(个人)
            FeeBalanceList_Search_Personal = 106052,

            //经纪费结算新建
            FeeBalance_Add = 106053,
            //经纪费结算编辑
            FeeBalance_Modify = 106054,
            //经纪费结算删除
            FeeBalance_Delete = 106055,
            //经纪费结算审核
            FeeBalance_Audit = 106056,
            //经纪费结算反审核
            FeeBalance_AuditBack = 106057,
            //经纪费入账单打印
            FeeBalance_PayListReport_Print = 106058,


            //已通知未收费清单查询
            FeeNotice_NoPay_List = 106060,
            //已收费未解付清单查询
            FeeCustomer_NoFeePay_List = 106070,
            //已解付未开票清单查询
            FeePay_NoFeeVoice_List = 106080,
            //已开票未结算清单查询
            FeeVoice_NoFeeBalance_List = 106090,


            //保单查询(全部)
            Policy_Search_All = 107010,
            //保单查询(团队)
            Policy_Search_Group = 107011,
            //保单查询(个人)
            Policy_Search_Personal = 107012,

            //保单查询(保险公司)(全部)
            Policy_Search_Carrier_All = 107020,

            //保单查询(保险公司)(团队)
            Policy_Search_Carrier_Group = 107021,

            //保单查询(保险公司)(个人)
            Policy_Search_Carrier_Personal = 107022,

            //AchievementReport = 107010,

            //员工管理
            Employee_Manage = 108010,

            //角色管理
            Role_Manage = 108020,

            //组织机构
            Organ_Schema = 108030,

            //保险公司
            Policy_Carrier = 108040,

            //分支机构
            PolicyCarrier_Branch = 108050,

            //险种定义
            PolicyProduction_Type = 108060,

            //数据字典
            Data_Dictionary = 108070,

            //企业目录
            Enterprise_List = 108080,

            //系统选项
            System_Option = 108090,

            //服务提醒
            ServiceAlert = 108100,
            ServiceAlert_Group = 108101,
            ServiceAlert_Personal = 108101,



            //签约预算清单(全部)
            SignupBudget_List = 109010,

            SignupBudget_List_Group = 109011,

            //保单查询(保险公司)(个人)
            SignupBudget_List_Personal = 109012,

            SignupBudget_List_Add = 109013,

            SignupBudget_List_Modify = 109014,

            SignupBudget_List_Delete = 109015,


            //签约预算完成情况
            SignupBudget_RunDetail = 109020,

            SignupBudget_RunDetail_Group = 109021,

            SignupBudget_RunDetail_Personal = 109022,


            //签约预算完成汇总
            SignupBudget_CompleteSummary = 109030,

            //预算基础表
            Budget_BaseList = 109040,

            Budget_BaseList_Group = 109041,

            Budget_BaseList_Personal = 109042,

            //109010	签约预算清单(全部)	10901	109
            //109011	签约预算清单(团队)	10901	109
            //109012	签约预算清单(个人)	10901	109
            //109013	签约预算清单(新建)	10901	109
            //109014	签约预算清单(编辑)	10901	109
            //109015	签约预算清单(删除)	10901	109
            //109020	签约预算完成情况(全部)	10902	109
            //109021	签约预算完成情况(团队)	10902	109
            //109022	签约预算完成情况(个人)	10902	109
            //109040	预算基础表(全部)	10904	109
            //109041	预算基础表(团队)	10904	109
            //109042	预算基础表(个人)	10904	109


            //保险经纪业务台帐(全部)
            InsuranceBrokerBusinessReport_All = 111010,
            //保险经纪业务台帐(团队)
            InsuranceBrokerBusinessReport_Group = 111011,
            //保险经纪业务台帐(个人)
            InsuranceBrokerBusinessReport_Personal = 111012,

            //应收保费帐期报表(全部)
            ReceivablePremiumReport_All = 111020,
            //应收保费帐期报表(团队)
            ReceivablePremiumReport_Group = 111021,
            //应收保费帐期报表(个人)
            ReceivablePremiumReport_Personal = 111022,

            //应收佣金帐期报表(全部)
            ReceivableProcessReport_All = 111030,
            //应收佣金帐期报表(团队)
            ReceivableProcessReport_Group = 111031,
            //应收佣金帐期报表(个人)
            ReceivableProcessReport_Personal = 111032,

            //实收保费逾期报表(全部)
            RealPremiumOverTimeReport_All = 111040,
            //实收保费逾期报表(团队)
            RealPremiumOverTimeReport_Group = 111041,
            //实收保费逾期报表(个人)
            RealPremiumOverTimeReport_Personal = 111042,

            //保监会报表(按险种分类)
            CIRC_Report_ByAddress = 102010,
            //保监会报表(按签单地分类)
            CIRC_Report_BySignAdress = 102020,

            //同业公会报表
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
