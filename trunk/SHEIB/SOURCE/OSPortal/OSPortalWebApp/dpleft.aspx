<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dpleft.aspx.cs" Theme="Aqua"
    Inherits="OSPortalWebApp.dpleft" %>

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
<body>
    <form id="form1" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td valign="top" style="width: 100%;">
                <dxnb:ASPxNavBar ID="ASPxNavBar1" AutoCollapse="True" runat="server" AllowSelectItem="True"
                    EnableTheming="True" EnableViewState="False" Width="155px" 
                    EnableAnimation="True">
                    <GroupHeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
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
                                <dxnb:NavBarItem Text="询价单批改" Name="vehicleinsurance/AskPriceAlertList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="询价单审核" Name="vehicleinsurance/AskPriceCheckList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="询价单保单录入" Name="vehicleinsurance/CarPolicyInputList.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="客户理赔" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="理赔登记" Name="CustomerClaim/NotifyClaimList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="理赔资料管理" Name="http://www.google.cn">
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
                                <dxnb:NavBarItem Text="经纪费开票" Name="inoutbalance/FeePayinInvoice.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="经纪费结算" Name="inoutbalance/FeeProcess.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="综合查询" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="非车险保单综合查询" Name="otherinsurance/PolicySearch.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="车险保单综合查询" Name="vehicleinsurance/AskPriceSearch.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="预算管理" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="签约预算清单" Name="http://www.google.cn">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="签约预算执行明细" Name="http://www.google.cn">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="签约预算完成汇总" Name="http://www.google.cn">
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
                                <dxnb:NavBarItem Text="保险公司" Name="ProductSetup/CarrierList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="分支机构" Name="ProductSetup/BranchList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="险种定义" Name="ProductSetup/ProductTypeList.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="数据字典" Name="http://www.google.cn">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="企业目录" Name="CustomerRelation/AreaSetting.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="系统选项" Name="http://www.google.cn">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="系统日志" Name="http://www.google.cn">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="消息提醒" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="服务提醒" Name="CustomerRelation/AlertService.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="台帐" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="财产险经纪业务台帐" Name="accounting/PropertyBrokerageBusiness.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="财产险经纪批改业务" Name="accounting/PropertyBrokerageMarkBusiness.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="人身险经纪业务台帐" Name="accounting/LifeBrokerageBusiness.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="人身险经纪批改业务台帐" Name="accounting/LifeBrokerageMarkBusiness.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="再保险经纪业务台帐" Name="accounting/ReinsuranceBrokerageBusiness.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="保险经纪咨询业务台帐" Name="accounting/InsuranceBrokerageConsultingService.aspx">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="保险经纪机构人员台帐" Name="accounting/InsuranceBrokerageAgency.aspx">
                                </dxnb:NavBarItem>
                            </Items>
                        </dxnb:NavBarGroup>
                        <dxnb:NavBarGroup Text="统计报表" Expanded="false">
                            <Items>
                                <dxnb:NavBarItem Text="分险种经纪业务统计" Name="http://www.google.cn">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="保费、经纪费统计表" Name="http://www.google.cn">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="客户保费佣金统计表" Name="http://www.google.cn">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="客户保费结构统计" Name="http://www.google.cn">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="集团客户佣金结构统计" Name="http://www.google.cn">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="应收帐款明细" Name="http://www.google.cn">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="保监会:经纪公司业务报表(按险种分类)" Name="http://www.google.cn">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="保监会:经纪公司业务报表（按签单地分类）" Name="http://www.google.cn">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="保监会:持证情况与学历情况表" Name="http://www.google.cn">
                                </dxnb:NavBarItem>
                                <dxnb:NavBarItem Text="保险经纪会员公司业务统计表" Name="http://www.google.cn">
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
