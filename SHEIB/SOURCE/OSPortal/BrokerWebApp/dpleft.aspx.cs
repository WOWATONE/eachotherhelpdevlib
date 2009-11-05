using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using BusinessObjects;

namespace BrokerWebApp
{
    public partial class dpleft : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //
            generateMenus();

        }


        protected virtual void mSelector_ItemDataBound(object source, DevExpress.Web.ASPxMenu.MenuItemEventArgs e)
        {
            if (GetStatus(e.Item.DataItem, "IsUpdated"))
                e.Item.Text += " <span style=\"color: #2D9404;\">(updated)</span>";
            if (GetStatus(e.Item.DataItem, "IsNew"))
                e.Item.Text += " <span style=\"color: #BD0808;\">(new)</span>";
        }

        private void generateMenus()
        {
            bool checkResult = false;
            bool existItemInGroup = false;


            //客户关系
            existItemInGroup = false;
            //客户列表
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Customer_List_Search_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Customer_List_Search_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Contact_List_Search_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[0].Items[0].ClientEnabled = true; 
            }
            else
            {
                this.ASPxNavBar1.Groups[0].Items[0].ClientEnabled = false; 
            }
            

            
            //联系人
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Contact_List_Search_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Contact_List_Search_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Contact_List_Search_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[0].Items[1].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[0].Items[1].ClientEnabled = false;
            }
            
            //业务跟进
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.ServiceFollowUp_List_Search_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.ServiceFollowUp_List_Search_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.ServiceFollowUp_List_Search_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[0].Items[2].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[0].Items[2].ClientEnabled = false;
            }
            
            //group
            //if (existItemInGroup)
            //    this.ASPxNavBar1.Groups[0].ClientEnabled = true;
            //else
            //    this.ASPxNavBar1.Groups[0].ClientEnabled = false;

            
            //非车险保单管理
            existItemInGroup = false;
            //保单录入
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyInput_Add);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyInput_Modify);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyInput_Delete);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyInput_List_Search_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyInput_List_Search_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyInput_List_Search_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[1].Items[0].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[1].Items[0].ClientEnabled = false;
            }
            
            
            //保单批改
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyAltInput_Add);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyAltInput_Modify);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyAltInput_Delete);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyAltInput_List_Search_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyAltInput_List_Search_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyAltInput_List_Search_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[1].Items[1].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[1].Items[1].ClientEnabled = false;
            }
                        
            //保单审核
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyAudit_Audit);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyAudit_AuditBack);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[1].Items[2].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[1].Items[2].ClientEnabled = false;
            }
            
            //group
            //if (existItemInGroup)
            //    this.ASPxNavBar1.Groups[1].ClientEnabled = true;
            //else
            //    this.ASPxNavBar1.Groups[1].ClientEnabled = false;





            //车险保单管理
            existItemInGroup = false;
            //询价单录入
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.AskPriceInput_Add);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.AskPriceInput_Modify);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.AskPriceInput_Delete);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.AskPriceInput_List_Search_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.AskPriceInput_List_Search_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.AskPriceInput_List_Search_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[2].Items[0].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[2].Items[0].ClientEnabled = false;
            }
            
            //询价单审核
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.AskPriceInput_Audit);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.AskPriceInput_AuditBack);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[2].Items[1].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[2].Items[1].ClientEnabled = false;
            }
            
            //保单批改
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.CarPolicyAlt_Add);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.CarPolicyAlt_Modify);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.CarPolicyAlt_Delete);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.CarPolicyAlt_List_Search_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.CarPolicyAlt_List_Search_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.CarPolicyAlt_List_Search_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[2].Items[2].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[2].Items[2].ClientEnabled = false;
            }
            
            //批单审核
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyAudit_Audit);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyAudit_AuditBack);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[2].Items[3].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[2].Items[3].ClientEnabled = false;
            }
            
            //保单信息补录
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyInfo_Append);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[2].Items[4].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[2].Items[4].ClientEnabled = false;
            }
            
            //group
            //if (existItemInGroup)
            //    this.ASPxNavBar1.Groups[2].ClientEnabled = true;
            //else
            //    this.ASPxNavBar1.Groups[2].ClientEnabled = false;



            //客户理赔
            existItemInGroup = false;
            //理赔登记
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PaymentClaims_Register);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[3].Items[0].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[3].Items[0].ClientEnabled = false;
            }

            //group
            //if (existItemInGroup)
            //    this.ASPxNavBar1.Groups[3].ClientEnabled = true;
            //else
            //    this.ASPxNavBar1.Groups[3].ClientEnabled = false;


            //业务咨询
            existItemInGroup = false;
            //业务咨询
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.BusinessConsultList_View_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.BusinessConsultList_View_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.BusinessConsultList_View_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[4].Items[0].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[4].Items[0].ClientEnabled = false;
            }

            //group
            //if (existItemInGroup)
            //    this.ASPxNavBar1.Groups[4].ClientEnabled = true;
            //else
            //    this.ASPxNavBar1.Groups[4].ClientEnabled = false;


            //收付结算
            existItemInGroup = false;
            //保费通知书
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeNoticeList_Search_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeNoticeList_Search_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeNoticeList_Search_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[5].Items[0].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[5].Items[0].ClientEnabled = false;
            }

            //客户收费
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeCustomerList_Search_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeCustomerList_Search_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeCustomerList_Search_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[5].Items[1].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[5].Items[1].ClientEnabled = false;
            }
            
            //解付保费
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeePayList_Search_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeePayList_Search_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeePayList_Search_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[5].Items[2].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[5].Items[2].ClientEnabled = false;
            }
            
            //经纪费开票
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeVoiceList_Search_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeVoiceList_Search_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeVoiceList_Search_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[5].Items[3].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[5].Items[3].ClientEnabled = false;
            }
            
            //经纪费结算
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeBalanceList_Search_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeBalanceList_Search_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeBalanceList_Search_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[5].Items[4].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[5].Items[4].ClientEnabled = false;
            }
            
            //已通知未收费清单
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeNotice_NoPay_List);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[5].Items[5].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[5].Items[5].ClientEnabled = false;
            }
            
            //已收费未解付清单
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeCustomer_NoFeePay_List);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[5].Items[6].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[5].Items[6].ClientEnabled = false;
            }
            
            //已解付未开票清单
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeePay_NoFeeVoice_List);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[5].Items[7].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[5].Items[7].ClientEnabled = false;
            }
            
            //已开票未结算清单
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.FeeVoice_NoFeeBalance_List);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[5].Items[8].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[5].Items[8].ClientEnabled = false;
            }
            
            //group
            //if (existItemInGroup)
            //    this.ASPxNavBar1.Groups[5].ClientEnabled = true;
            //else
            //    this.ASPxNavBar1.Groups[5].ClientEnabled = false;


            //综合查询
            existItemInGroup = false;
            //保单查询
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Policy_Search_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Policy_Search_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Policy_Search_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[6].Items[0].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[6].Items[0].ClientEnabled = false;
            }
            
            //保单查询(保险公司)
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Policy_Search_Carrier_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Policy_Search_Carrier_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Policy_Search_Carrier_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[6].Items[1].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[6].Items[1].ClientEnabled = false;
            }

            //group
            //if (existItemInGroup)
            //    this.ASPxNavBar1.Groups[6].ClientEnabled = true;
            //else
            //    this.ASPxNavBar1.Groups[6].ClientEnabled = false;




            //系统设置
            existItemInGroup = false;
            //员工管理
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Employee_Manage);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[7].Items[0].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[7].Items[0].ClientEnabled = false;
            }
            
            //角色管理
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Role_Manage);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[7].Items[1].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[7].Items[1].ClientEnabled = false;
            }
            
            //组织机构
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Organ_Schema);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[7].Items[2].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[7].Items[2].ClientEnabled = false;
            }
            
            //保险公司
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Policy_Carrier);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[7].Items[3].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[7].Items[3].ClientEnabled = false;
            }
            
            //分支机构
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyCarrier_Branch);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[7].Items[4].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[7].Items[4].ClientEnabled = false;
            }
            
            //险种定义
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.PolicyProduction_Type);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[7].Items[5].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[7].Items[5].ClientEnabled = false;
            }
            
            //数据字典
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Data_Dictionary);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[7].Items[6].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[7].Items[6].ClientEnabled = false;
            }
            
            //企业目录
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Enterprise_List);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[7].Items[7].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[7].Items[7].ClientEnabled = false;
            }
            
            //系统选项
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.System_Option);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[7].Items[8].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[7].Items[8].ClientEnabled = false;
            }
            
            //服务提醒
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.ServiceAlert_All);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[7].Items[9].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[7].Items[9].ClientEnabled = false;
            }
            
            //group
            //if (existItemInGroup)
            //    this.ASPxNavBar1.Groups[7].ClientEnabled = true;
            //else
            //    this.ASPxNavBar1.Groups[7].ClientEnabled = false;


            //统计报表
            existItemInGroup = false;            
            //保监会报表1
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.InsuranceBrokerBusinessReport_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.InsuranceBrokerBusinessReport_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.InsuranceBrokerBusinessReport_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[8].Items[0].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[8].Items[0].ClientEnabled = false;
            }
            
            //保监会报表2
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.InsuranceBrokerBusinessReport_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.InsuranceBrokerBusinessReport_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.InsuranceBrokerBusinessReport_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[8].Items[1].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[8].Items[1].ClientEnabled = false;
            }
            
            //同业公会报表
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Trade_Association_Report);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[8].Items[2].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[8].Items[2].ClientEnabled = false;
            }

            //group
            //if (existItemInGroup)
            //    this.ASPxNavBar1.Groups[8].ClientEnabled = true;
            //else
            //    this.ASPxNavBar1.Groups[8].ClientEnabled = false;



            //预算管理
            existItemInGroup = false;            
            //签约预算清单
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.SignupBudget_List_All);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[9].Items[0].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[9].Items[0].ClientEnabled = false;
            }
            
            //签约预算完成情况
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.SignupBudget_RunDetail_All);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[9].Items[1].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[9].Items[1].ClientEnabled = false;
            }
            
            //签约预算完成汇总
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.SignupBudget_CompleteSummary);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[9].Items[2].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[9].Items[2].ClientEnabled = false;
            }
            
            //预算基础表
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.Budget_BaseList_All);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[9].Items[3].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[9].Items[3].ClientEnabled = false;
            }
            
            //group
            //if (existItemInGroup)
            //    this.ASPxNavBar1.Groups[9].ClientEnabled = true;
            //else
            //    this.ASPxNavBar1.Groups[9].ClientEnabled = false;



            //台帐
            existItemInGroup = false;
            //保险经纪业务台帐
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.InsuranceBrokerBusinessReport_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.InsuranceBrokerBusinessReport_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.InsuranceBrokerBusinessReport_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[10].Items[0].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[10].Items[0].ClientEnabled = false;
            }
            
            //应收保费帐期报表
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.ReceivablePremiumReport_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.ReceivablePremiumReport_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.ReceivablePremiumReport_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[10].Items[1].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[10].Items[1].ClientEnabled = false;
            }
            
            //应收佣金帐期报表
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.ReceivableProcessReport_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.ReceivableProcessReport_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.ReceivableProcessReport_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[10].Items[2].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[10].Items[2].ClientEnabled = false;
            }
            
            //实收保费逾期报表
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.RealPremiumOverTimeReport_All);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.RealPremiumOverTimeReport_Group);
            checkResult = checkResult || this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.RealPremiumOverTimeReport_Personal);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[10].Items[3].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[10].Items[3].ClientEnabled = false;
            }


            //group
            //if (existItemInGroup)
            //    this.ASPxNavBar1.Groups[10].ClientEnabled = true;
            //else
            //    this.ASPxNavBar1.Groups[10].ClientEnabled = false;

            //服务提醒
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.MessageRemindPayInOut);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[11].Items[0].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[11].Items[0].ClientEnabled = false;
            }

            //服务提醒
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.MessageRemindPremiumContinue);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[11].Items[1].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[11].Items[1].ClientEnabled = false;
            }

            //服务提醒
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.MessageRemindCustomerPtFollow);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[11].Items[2].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[11].Items[2].ClientEnabled = false;
            }

            //服务提醒
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.MessageRemindCustomerBirthday);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[11].Items[3].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[11].Items[3].ClientEnabled = false;
            }

            //服务提醒
            checkResult = false;
            checkResult = this.CurrentUser.CheckPermission(BO_P_Priv.PrivListEnum.MessageRemindProcess);
            if (checkResult)
            {
                existItemInGroup = true;
                this.ASPxNavBar1.Groups[11].Items[4].ClientEnabled = true;
            }
            else
            {
                this.ASPxNavBar1.Groups[11].Items[4].ClientEnabled = false;
            }


        }



        protected virtual string GetHeaderTitle(string title, string text)
        {
            string name = title + " - ";
            if (text.IndexOf("<") > 0)
                name += text.Substring(0, text.IndexOf("<"));
            else
                name += text;
            return name;
        }

        protected virtual string GetCurrentAppearanceName()
        {
            return "Appearances/" + GetCurrentAppearanceNameCore() + ".ascx";
        }

        protected virtual string GetCurrentAppearanceNameCore()
        {
            string name = Page.Request.QueryString["Name"];
            if (String.IsNullOrEmpty(name))
                name = "";
            return name;
        }

        protected virtual bool GetStatus(object dataItem, string name)
        {
            IHierarchyData hierarchyData = (dataItem as IHierarchyData);
            XmlElement xmlElement = hierarchyData.Item as XmlElement;
            return GetStatusCore(xmlElement, name);
        }

        private bool GetStatusCore(XmlElement element, string name)
        {
            bool ret = false;

            string value = GetAttributeValue(element.Attributes, name);
            bool.TryParse(value, out ret);
            return ret;
        }

        private bool GetStatusCore(XmlNode node, string name)
        {
            bool ret = false;
            string value = GetAttributeValue(node.Attributes, name);
            bool.TryParse(value, out ret);
            return ret;
        }

        private string GetAttributeValue(XmlAttributeCollection attributes, string name)
        {
            if (attributes[name] != null)
                return attributes[name].Value;
            else
                return "";
        }

    }
}
