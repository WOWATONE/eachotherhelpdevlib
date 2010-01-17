<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dpleft.aspx.cs" Theme="Aqua"
    Inherits="BrokerWebApp.dpleft" %>

<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxNavBar"
    TagPrefix="dxnb" %>
<%@ Register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxRoundPanel"
    TagPrefix="dxrp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="js/dpleftmenu.js" type="text/javascript"></script>

</head>
<body style="overflow-x:hidden; overflow-y:auto;">
    <form id="form1" runat="server" >
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td valign="top" style="width: 100%;">
                <dxnb:ASPxNavBar  ID="ASPxNavBar1" AutoCollapse="True" runat="server" AllowSelectItem="True"
                    EnableTheming="True" EnableViewState="False" Width="150px" EnableAnimation="True">
                    <GroupHeaderStyle HorizontalAlign="Left" VerticalAlign="Top"  />
                    <ItemStyle HorizontalAlign="Left" />
                    <ClientSideEvents ItemClick="function(s, e) {SelectedItemChanged(s,e);}" Init="function(s, e) {InitNavBar(s,e);}"
                        ExpandedChanged="function(s, e) {GroupExpandedChanged(s,e);}" ExpandedChanging="function(s, e) {GroupExpandedChanging(s,e);}">
                    </ClientSideEvents>
                    <Groups>
                        <dxnb:NavBarGroup Text="客户关系" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem ClientEnabled="true" Text="客户列表" Name="CustomerRelation/CustomerList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="联系人" Name="CustomerRelation/CustContact.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="业务跟进" Name="CustomerRelation/CustomerPtFollow.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="非车险保单管理" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="保单录入" Name="otherinsurance/PolicyInputList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="保单批改" Name="otherinsurance/PolicyAlterList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="保单审核" Name="otherinsurance/PolicyCheckList.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="车险保单管理" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="询价单录入" Name="vehicleinsurance/AskPriceInputList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="询价单审核" Name="vehicleinsurance/AskPriceCheckList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="保单批改" Name="vehicleinsurance/CarPolicyAlertList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="批单审核" Name="vehicleinsurance/CarPolicyCheckList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="保单信息补录" Name="vehicleinsurance/CarPolicyList.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="客户理赔" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="理赔登记" Name="CustomerClaim/NotifyClaimList.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="业务咨询" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="业务咨询" Name="BusinessConsult/BusinessConsultList.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="收付结算" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="保费通知书" Name="inoutbalance/FeeNotice.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="客户收费" Name="inoutbalance/FeeCustomer.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="解付保费" Name="inoutbalance/FeePayin.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="经纪费开票" Name="inoutbalance/FeeInvoice.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="经纪费结算" Name="inoutbalance/FeeProcess.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="已通知未收费清单" Name="inoutbalance/FeeCustomerAddSelect.aspx?ID=q">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="已收费未解付清单" Name="inoutbalance/FeePayinAddSelect.aspx?ID=q">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="已解付未开票清单" Name="inoutbalance/FeeInvoiceAddSelect.aspx?ID=q">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="已开票未结算清单" Name="inoutbalance/FeeProcessAddSelect.aspx?ID=q">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="综合查询" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="保单查询" Name="IntegrateSearch/PolicyList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="保单查询(保险公司)" Name="IntegrateSearch/PolicyListByCarrier.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="系统设置" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="员工管理" Name="schemasetting/UserManager.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="角色管理" Name="schemasetting/RoleManager.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="组织机构" Name="schemasetting/DepartmentManager.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="保险公司" Name="schemasetting/CarrierList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="分支机构" Name="schemasetting/BranchList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="险种定义" Name="schemasetting/ProductTypeList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="数据字典" Name="schemasetting/DataDictionary.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="企业目录" Name="schemasetting/EnterpriseList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="系统选项" Name="http://www.google.cn" Visible="false">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="服务提醒" Name="schemasetting/AlertService.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="统计报表" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="保监会报表1" Name="Report/InsuranceCommission1.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="保监会报表2" Name="Report/InsuranceCommission2.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="同业公会报表" Name="Report/TYGH.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="按险种统计报表" Name="Report/RptStatisticByProdType.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="按客户统计报表" Name="Report/RptStatisticByCustomer.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="按保险公司统计报表" Name="Report/RptStatisticByCarrier.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="客户保费结构报表" Name="Report/RptCustomerPremiumStruct.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="客户经纪费结构报表" Name="Report/RptCustomerProcessStruct.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="应收保费(佣金)账龄明细表" Name="accounting/PremiumReceivablePeriodReport.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="应收账款账龄明细表" Name="accounting/ProcessReceivablePeriodReport.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="实收保费(佣金)完成明细表" Name="accounting/PremiumActualOverdueReport.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="预算管理" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="签约预算明细表" Name="BudgetManagement/SignPremiumBudgetList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="签约预算完成明细表" Name="BudgetManagement/RptSignBudgetBase.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="签约预算完成汇总表" Name="BudgetManagement/SignPremiumBudgetRpt.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="签约预算汇总表" Name="BudgetManagement/RptSignBudgetGatherBySales.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="台帐" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="保险经纪业务台帐" Name="accounting/BrokerAccounting.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="服务提醒" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="收付提醒列表" Name="MessageRemind/MessageRemindPayInOut.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="续保提醒列表" Name="MessageRemind/MessageRemindPremiumContinue.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="跟进提醒列表" Name="MessageRemind/MessageRemindCustomerPtFollow.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="生日提醒列表" Name="MessageRemind/MessageRemindCustomerBirthday.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="佣金提醒列表" Name="MessageRemind/MessageRemindProcess.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                    </Groups>
                </dxnb:ASPxNavBar>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
