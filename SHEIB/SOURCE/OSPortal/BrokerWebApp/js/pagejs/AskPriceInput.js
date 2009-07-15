

function policyCheckNessary() {
    var pid = dxetxtAskPriceID.GetValueString();    
    var cid = getCustomerID();
    if (isEmpty(pid) || isEmpty(pt) || isEmpty(bf) || isEmpty(cid)) {
        return true;
    }
    else {
        return false;
    }

}

function setDxeButtonsUnableOrEnable(val) {
    dxebtnBottomAdd.SetEnabled(val);
    dxebtnBottomSave.SetEnabled(val);
    dxebtnBottomCheck.SetEnabled(val);
    dxebtnCancel.SetEnabled(val);

    insuranceDetailTabPage.tabs[1].SetEnabled(val);
    insuranceDetailTabPage.tabs[2].SetEnabled(val);

    if ((typeof gridPolicyItem != 'undefined') && gridPolicyItem != null) {
        gridPolicyItem.SetClientVisible(val);
    }
}

function policyBaseCompleteUnable() {

    //input
    if (pagemode.value == "input") {
        if (policyCheckNessary()) {
            npGridPolicyItemDetail.parentElement.setAttribute('disabled', 'true');
            setDxeButtonsUnableOrEnable(false);            
        }

    }

    //audit
    if (pagemode.value == "audit") {
        npbasicdetail.parentElement.setAttribute('disabled', 'true');

        npGridPolicyItemDetail.parentElement.setAttribute('disabled', 'true');

    }


}


function policyBaseCompleteEnable() {
    
    if (pagemode.value == "input") {
        npGridPolicyItemDetail.parentElement.removeAttribute('disabled');
        setDxeButtonsUnableOrEnable(true);
    }

    
}










function makePolicyJSON() {

    var AciPolicyNo = null;
    var AciPremium = null;
    var AciProcess = null;
    var AciProcessRate = null;
    var AltNO = null;
    var AskPriceID = null;
    var AuditPerson = null;
    var AuditTime = null;
    var BankAccount = null;
    var BankName = null;
    var Beneficiary = dxetxtBeneficiary.GetValueString();
    var Capacity = null;
    var CarNo = null;
    var CarUser = null;
    var CarValue = null;
    var CarcaseNo = null;
    var CarrierSales = null;
    var CiPremium = null;
    var CiProcess = null;
    var CiProcessRate = null;
    var ConversionRate = dxetxtConversionRate.GetValueString();
    var Coverage = dxetxtCoverage.GetValueString();
    var CreatePerson = dxetxtCreatePerson.GetValueString();
    var CreateTime = dxedtCreateTime.GetValue();
    var CstPremium = null;
    var Currency = dxeddlCurrency.GetValue();
    var CustomerID = getCustomerID();
    var DeptId = dxeddlDeptID.GetValue();
    var EndDate = dxeEndDate.GetValue();
    var EngineNo = null;
    var FlagAlt = null;
    var FlagReinsure = null;
    var FlagTogether = null;
    var GatheringType = dxeddlGatheringType.GetValue();
    var ModifyPerson = null;
    var ModifyTime = null;
    var OperationType = dxeddlOperationType.GetValue();
    var PeriodTimes = dxetxtStage.GetValueString();
    var PolicyID = dxetxtPolicyID.GetValueString();
    var PolicyNo = dxetxtPolicyNo.GetValueString();
    var PolicyStatus = null;
    var PolicyType = null;
    var Premium = dxetxtPremium.GetValueString();
    var PremiumBase = dxetxtPremiumBase.GetValueString();
    var PremiumRate = dxetxtPremiumRate.GetValueString();
    var PrevPolicyID = getPrePolicyID();
    var Process = dxetxtProcess.GetValueString();
    var ProcessBase = dxetxtProcessBase.GetValueString();
    var ProcessRate = dxetxtProcessRate.GetValueString();
    var ProdTypeID = getProductTypeID();
    var RegisterDate = null;
    var Remark = null;
    var SalesId = dxeddlSalesId.GetValue();
    var SignDate = null;
    var SourceTypeID = dxeddlSourceTypeID.GetValue();
    var Special = null;
    var StartDate = dxeStartDate.GetValue();
    var UseCharacter = null;
    var VolumnNo = null;
    var CustomerName = dxetxtCustomer.GetValueString();
    var ProdTypeName = dxetxtProdTypeName.GetValueString();



    var plc = new Policy(AciPolicyNo, AciPremium, AciProcess, AciProcessRate,
            AltNO, AskPriceID, AuditPerson, AuditTime, BankAccount,
            BankName, Beneficiary, Capacity, CarNo, CarUser,
            CarValue, CarcaseNo, CarrierSales, CiPremium, CiProcess,
            CiProcessRate, ConversionRate, Coverage, CreatePerson, CreateTime,
            CstPremium, Currency, CustomerID, DeptId, EndDate,
            EngineNo, FlagAlt, FlagReinsure, FlagTogether, GatheringType,
            ModifyPerson, ModifyTime, OperationType, PeriodTimes, PolicyID, PolicyNo,
            PolicyStatus, PolicyType, Premium, PremiumBase, PremiumRate, PrevPolicyID,
            Process, ProcessBase, ProcessRate, ProdTypeID, RegisterDate,
            Remark, SalesId, SignDate, SourceTypeID, Special,
            StartDate, UseCharacter, VolumnNo);

    //deserialize JSON string, make a JSON object
    //var jsonObject = Sys.Serialization.JavaScriptSerializer.deserialize(jsonStringServer)

    //serialize a JOSN object，make a JSON string.
    var jsonStringClient = Sys.Serialization.JavaScriptSerializer.serialize(plc);

    return jsonStringClient;

}


function dxebtntopSave_Click(s, e) {
    //
    if (s.CauseValidation()) {
        var thejsonstring = ""; //makePolicyJSON();
        dxeSaveCallback.PerformCallback(thejsonstring);
    }
        
}

function saveCallbackComplete(s, e) {
    //do nothing;
    policyBaseCompleteEnable();
    
    //var pid = dxetxtPolicyID.GetValueString();
    //if (isEmpty(pid)) {
    //    dxetxtPolicyID.SetValue(e.result);
    //}
}

function btnAddClick(s, e) {
    var thejsonstring = makePolicyJSON();

    dxeAddCallback.PerformCallback(thejsonstring);
}

function addCallbackComplete(s, e) {
    //do nothing;
    var result = $("#hrefnewpolicy");
    var hrefPolicyNew = result[0];
    hrefPolicyNew.click();
}

function btnSaveCheckClick(s, e) {
    var thejsonstring = makePolicyJSON();
    dxeSaveAndCheckCallback.PerformCallback(thejsonstring);
}


function saveCheckCallbackComplete(s, e) {
    if (dxebtnBottomAdd != null) {
        dxebtnBottomAdd.SetEnabled(false);
    }
    if (dxebtnBottomSave != null) {
        dxebtnBottomSave.SetEnabled(false);
    }
    if (dxebtnBottomCheck != null) {
        dxebtnBottomCheck.SetEnabled(false);
    }
    if (dxebtnCancel != null) {
        dxebtnCancel.SetEnabled(false);
    }
    if (dxeClose != null) {
        dxeClose.SetEnabled(true);
    }
}



function btnAddCustomerClick() {
    var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
    window.showModalDialog("NewCustomer.aspx", self, myArguments);
}


function btnSelectCustomerClick() {
    var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
    window.showModalDialog("SelectCustomer.aspx", self, myArguments);
}



function GridCarrierCarrier_SelectedIndexChanged(s, e) {
    var thejsonstring = dxecbGridCarrierCarrierID.GetSelectedItem().value;
    dxecbGridCarrierBranchID.PerformCallback(thejsonstring);
}


function gridGridProdIDChange() {
    var theValue = decbGridProdID.GetText();
    //detxtGridProdName.SetValue(theValue);
}

function dxeddlDeptID_SelectedIndexChanged(s, e) {
    var thejsonstring = dxeddlDeptID.GetSelectedItem().value;
    dxeddlSalesId.PerformCallback(thejsonstring);
}

function FileUploadStart(s, e) {
    //var refplcid = dxetxtPolicyID.GetValueString();
    //filesUploadControl;            
}


function FileUploaded(s, e) {
    gridDocList.PerformCallback();
}


function imgPolicyProdTypeClick() {
    var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=600px;dialogHeight=500px;center=yes;help=no";
    var retrunval = window.showModalDialog("../popupselectrefs/PolicyProdType.aspx", self, myArguments);
    if (isEmpty(retrunval)) {
        //do nothing;
    }
    else {
        //split the return value;
        var thesplit_array = retrunval.split(";");
        dxetxtProdTypeName.SetValue(thesplit_array[1]);
        setProductTypeID(thesplit_array[0]);
    }
}


function imgSelectCustomerClick() {
    var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
    var retrunval = window.showModalDialog("../popupselectrefs/PolicyCustomer.aspx", self, myArguments);
    if (isEmpty(retrunval)) {
        //do nothing;
    }
    else {
        //split the return value;
        var thesplit_array = retrunval.split(";");
        dxetxtCustomer.SetValue(thesplit_array[1]);
        dxetxtBeneficiary.SetValue(thesplit_array[1]);
        setCustomerID(thesplit_array[0]);
        //
    }
}

function imgNewCustomerClick() {
    var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
    //window.showModalDialog("NewCustomer.aspx", self, myArguments);

}




function Policy(AciPolicyNo, AciPremium, AciProcess, AciProcessRate,
        AltNO, AskPriceID, AuditPerson, AuditTime, BankAccount,
        BankName, Beneficiary, Capacity, CarNo, CarUser,
        CarValue, CarcaseNo, CarrierSales, CiPremium, CiProcess,
        CiProcessRate, ConversionRate, Coverage, CreatePerson, CreateTime,
        CstPremium, Currency, CustomerID, DeptId, EndDate,
        EngineNo, FlagAlt, FlagReinsure, FlagTogether, GatheringType,
        ModifyPerson, ModifyTime, OperationType, PeriodTimes, PolicyID, PolicyNo,
        PolicyStatus, PolicyType, Premium, PremiumBase, PremiumRate, PrevPolicyID,
        Process, ProcessBase, ProcessRate, ProdTypeID, RegisterDate,
        Remark, SalesId, SignDate, SourceTypeID, Special,
        StartDate, UseCharacter, VolumnNo) {
    if (!isEmpty(AciPolicyNo))
        this.AciPolicyNo = AciPolicyNo;

    if (!isEmpty(AciPremium))
        this.AciPremium = AciPremium;

    if (!isEmpty(AciProcess))
        this.AciProcess = AciProcess;

    if (!isEmpty(AciProcessRate))
        this.AciProcessRate = AciProcessRate;

    if (!isEmpty(AltNO))
        this.AltNO = AltNO;

    if (!isEmpty(AskPriceID))
        this.AskPriceID = AskPriceID;

    if (!isEmpty(AuditPerson))
        this.AuditPerson = AuditPerson;

    if (!isEmpty(AuditTime))
        this.AuditTime = AuditTime;

    if (!isEmpty(BankAccount))
        this.BankAccount = BankAccount;

    if (!isEmpty(BankName))
        this.BankName = BankName;

    if (!isEmpty(Beneficiary))
        this.Beneficiary = Beneficiary;

    if (!isEmpty(Capacity))
        this.Capacity = Capacity;

    if (!isEmpty(CarNo))
        this.CarNo = CarNo;

    if (!isEmpty(CarUser))
        this.CarUser = CarUser;

    if (!isEmpty(CarValue))
        this.CarValue = CarValue;

    if (!isEmpty(CarcaseNo))
        this.CarcaseNo = CarcaseNo;

    if (!isEmpty(CarrierSales))
        this.CarrierSales = CarrierSales;

    if (!isEmpty(CiPremium))
        this.CiPremium = CiPremium;

    if (!isEmpty(CiProcess))
        this.CiProcess = CiProcess;

    if (!isEmpty(CiProcessRate))
        this.CiProcessRate = CiProcessRate;

    if (!isEmpty(ConversionRate))
        this.ConversionRate = ConversionRate;

    if (!isEmpty(Coverage))
        this.Coverage = Coverage;

    if (!isEmpty(CreatePerson))
        this.CreatePerson = CreatePerson;

    if (!isEmpty(CreateTime))
        this.CreateTime = CreateTime;

    if (!isEmpty(CstPremium))
        this.CstPremium = CstPremium;

    if (!isEmpty(Currency))
        this.Currency = Currency;

    if (!isEmpty(CustomerID))
        this.CustomerID = CustomerID;

    if (!isEmpty(DeptId))
        this.DeptId = DeptId;

    if (!isEmpty(EndDate))
        this.EndDate = EndDate;

    if (!isEmpty(EngineNo))
        this.EngineNo = EngineNo;

    if (!isEmpty(FlagAlt))
        this.FlagAlt = FlagAlt;

    if (!isEmpty(FlagReinsure))
        this.FlagReinsure = FlagReinsure;

    if (!isEmpty(FlagTogether))
        this.FlagTogether = FlagTogether;

    if (!isEmpty(GatheringType))
        this.GatheringType = GatheringType;

    if (!isEmpty(ModifyPerson))
        this.ModifyPerson = ModifyPerson;

    if (!isEmpty(ModifyTime))
        this.ModifyTime = ModifyTime;

    if (!isEmpty(OperationType))
        this.OperationType = OperationType;

    if (!isEmpty(PeriodTimes))
        this.PeriodTimes = PeriodTimes;

    if (!isEmpty(PolicyID))
        this.PolicyID = PolicyID;

    if (!isEmpty(PolicyNo))
        this.PolicyNo = PolicyNo;

    if (!isEmpty(PolicyStatus))
        this.PolicyStatus = PolicyStatus;

    if (!isEmpty(PolicyType))
        this.PolicyType = PolicyType;

    if (!isEmpty(Premium))
        this.Premium = Premium;

    if (!isEmpty(PremiumBase))
        this.PremiumBase = PremiumBase;

    if (!isEmpty(PremiumRate))
        this.PremiumRate = PremiumRate;

    if (!isEmpty(PrevPolicyID))
        this.PrevPolicyID = PrevPolicyID;

    if (!isEmpty(Process))
        this.Process = Process;

    if (!isEmpty(ProcessBase))
        this.ProcessBase = ProcessBase;

    if (!isEmpty(ProcessRate))
        this.ProcessRate = ProcessRate;

    if (!isEmpty(ProdTypeID))
        this.ProdTypeID = ProdTypeID;

    if (!isEmpty(RegisterDate))
        this.RegisterDate = RegisterDate;

    if (!isEmpty(Remark))
        this.Remark = Remark;

    if (!isEmpty(SalesId))
        this.SalesId = SalesId;

    if (!isEmpty(SignDate))
        this.SignDate = SignDate;

    if (!isEmpty(SourceTypeID))
        this.SourceTypeID = SourceTypeID;

    if (!isEmpty(Special))
        this.Special = Special;

    if (!isEmpty(StartDate))
        this.StartDate = StartDate;

    if (!isEmpty(UseCharacter))
        this.UseCharacter = UseCharacter;

    if (!isEmpty(VolumnNo))
        this.VolumnNo = VolumnNo;

}


function isEmpty(testVar) {
    if ((testVar == null) || (testVar.length == 0)) {
        return true;
    } else {
        return false;
    }
}

function isDecimal(str) {
    if (isEmpty(str)) {
        return false;
    }
    else {
        if (/[^d.]/i.test(str)) {
            return true;
        }
        return false;
    }
}

function dxeStartDate_DateChanged(s, e) {
    //http://www.w3school.com.cn/js/jsref_obj_date.asp
    var thesource = dxeStartDate.GetDate();
    var theYear = thesource.getFullYear();
    var theMonth = thesource.getMonth();
    var theDate = thesource.getDate();
    theYear = theYear + 1;
    theMonth = theMonth + 1;
    var endDateString = theMonth.toString() + "/" + theDate.toString() + "/" + theYear.toString();

    dxeEndDate.SetDate(new Date(endDateString));
}


function btnCancelClick() {
    window.document.forms[0].reset();
    //ASPxClientEdit.ClearEditorsInContainer(null);
}

function btnCloseClick() {
    window.close();
}

function gridPolicyItem_EndCallback(s, e) {
    //sum                        
    var itemVal;
    var sumCoverageVal = 0;
    var sumPremiumVal = 0;
    var sumProcessVal = 0;
    for (i = 0; i < gridPolicyItem.pageRowCount; i++) {
        //Coverage
        itemVal = gridPolicyItem.GetDataRow(i).cells[2].innerText;
        if (isDecimal(itemVal)) {
            sumCoverageVal = parseFloat(sumCoverageVal) + parseFloat(itemVal);
        }
        //Premium
        itemVal = gridPolicyItem.GetDataRow(i).cells[3].innerText;
        if (isDecimal(itemVal)) {
            sumPremiumVal = parseFloat(sumPremiumVal) + parseFloat(itemVal);
        }
        //ProcRate
        itemVal = gridPolicyItem.GetDataRow(i).cells[4].innerText;
        //Process
        itemVal = gridPolicyItem.GetDataRow(i).cells[5].innerText;
        if (isDecimal(itemVal)) {
            sumProcessVal = parseFloat(sumProcessVal) + parseFloat(itemVal);
        }
    }
    var rtn = sumCoverageVal.toFixed(2);
    dxetxtCoverage.SetValue(rtn);
    rtn = sumPremiumVal.toFixed(2);
    dxetxtPremium.SetValue(rtn);
    rtn = sumProcessVal.toFixed(2);
    dxetxtProcess.SetValue(rtn);
}


function policyTab_Changing(s, e) {
    //debugger;
    if (e.tab.index == 1 || e.tab.index == 2) {
        //refresh perieodtime grid
        //gridPeriod.PerformCallback();
        var element = s.GetContentElement(e.tab.index);
        if (element != null) element.loaded = false;
    }
}

function policyTab_Click(s, e) {
    //
}


function dxebtnAuditOkClick(s, e) {
    //debugger;
    var buttonID = s.GetText();
    var AuditOrNot;
    switch (buttonID) {
        case "审核":
            AuditOrNot = true;
            break
        case "反审核":
            AuditOrNot = false;
            break
        default:
            //do nothing;
    }
    var Memo = dxeMemo.GetValueString();

    var plcAuditInfo = new PolicyAuditInfo(Memo, AuditOrNot);

    var jsonStringClient = Sys.Serialization.JavaScriptSerializer.serialize(plcAuditInfo);

    dxeAuditOkCallback.PerformCallback(jsonStringClient);

}

function auditOkCallbackComplete(s, e) {

    var buttonID = dxebtnAuditOk.GetText();
    switch (buttonID) {
        case "审核":
            dxebtnAuditOk.SetText("反审核");
            break
        case "反审核":
            dxebtnAuditOk.SetText("审核");
            break
        default:
            //do nothing;
    }

}

function PolicyAuditInfo(Memo, AuditOrNot) {
    if (!isEmpty(Memo))
        this.Memo = Memo;

    this.AuditOrNot = AuditOrNot;
}

function hlPolicyItemTogetherClick(params) {
    var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
    var url = params;
    window.open(url);
}




  