

function policyCheckNessary() {
    var pid = dxetxtAskPriceID.GetValueString();    
    var cid = getCustomerID();
    if (isEmpty(pid)) {
        return true;
    }
    else {
        return false;
    }

}

function setOnlyDxeButtonsUnableOrEnable(val) {
    if (typeof (dxebtnBottomAdd) == 'undefined' && dxebtnBottomAdd !=null)
        dxebtnBottomAdd.SetEnabled(val);

    if (typeof (dxebtnBottomSave) == 'undefined' && dxebtnBottomSave != null)
        dxebtnBottomSave.SetEnabled(val);

    if (typeof (dxebtnBottomCheck) == 'undefined' && dxebtnBottomCheck != null)
        dxebtnBottomCheck.SetEnabled(val);

    if (typeof (dxebtnCancel) == 'undefined' && dxebtnCancel != null)
        dxebtnCancel.SetEnabled(val);

    if (typeof (dxebtnAuditBack) == 'undefined' && dxebtnAuditBack != null)
        dxebtnAuditBack.SetEnabled(val);

    if (typeof (dxebtnAuditOk) == 'undefined' && dxebtnAuditOk != null)
        dxebtnAuditOk.SetEnabled(val);
    
}

function setDxeButtonsUnableOrEnable(val) {
    setOnlyDxeButtonsUnableOrEnable(val);

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

    var AskPriceID = dxetxtAskPriceID.GetValueString();
    var CarrierID = dxeddlCarrierId.GetValue();
    var BranchID = dxeddlBranchId.GetValue();
    var CarrierSales = dxetxtCarrierSales.GetValueString();
    var CustomerID = getCustomerID();
    var SalesId = dxeddlSalesId.GetValue();      
    var DeptId = dxeddlDeptID.GetValue();    
    var GatheringTypeID = dxeddlGatheringType.GetValue();    
    var OperationTypeID = dxeddlOperationType.GetValue();    
    var SourceTypeID = dxeddlSourceTypeID.GetValue(); 
    var Remark = null;
    var AuditOrNot = null;

    var plc = new Policy(AskPriceID, CarrierID, BranchID, CarrierSales,
            CustomerID, SalesId, DeptId, GatheringTypeID,
            OperationTypeID, SourceTypeID, Remark, AuditOrNot);

    //deserialize JSON string, make a JSON object
    //var jsonObject = Sys.Serialization.JavaScriptSerializer.deserialize(jsonStringServer)

    //serialize a JOSN object，make a JSON string.
    var jsonStringClient = Sys.Serialization.JavaScriptSerializer.serialize(plc);

    return jsonStringClient;

}


function dxebtntopSave_Click(s, e) {
    //
    if (s.CauseValidation()) {
        var thejsonstring = makePolicyJSON();
        dxeSaveCallback.PerformCallback(thejsonstring);
    }
        
}

function saveCallbackComplete(s, e) {
    //do nothing;
    policyBaseCompleteEnable();

    var pid = dxetxtAskPriceID.GetValueString();
    
    if (isEmpty(pid)) {
        dxetxtAskPriceID.SetValue(e.result);
    }
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
    setOnlyDxeButtonsUnableOrEnable(false);
}



function btnAddCustomerClick() {
    var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=500px;dialogHeight=300px;center=yes;help=no";
    //window.showModalDialog("NewCustomer.aspx", self, myArguments);
}


function GridCarrierCarrier_SelectedIndexChanged(s, e) {
    var thejsonstring = dxecbGridCarrierCarrierID.GetSelectedItem().value;
    dxecbGridCarrierBranchID.PerformCallback(thejsonstring);
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
        setCustomerID(thesplit_array[0]);
    }
}

function imgNewCustomerClick() {
    var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
    //window.showModalDialog("NewCustomer.aspx", self, myArguments);

}




function Policy(AskPriceID, CarrierID, BranchID, CarrierSales,
            CustomerID, SalesId, DeptId, GatheringTypeID,
            OperationTypeID, SourceTypeID, Remark, AuditOrNot) {

    if (!isEmpty(AskPriceID))
        this.AskPriceID = AskPriceID;

    if (!isEmpty(CarrierID))
        this.CarrierID = CarrierID;

    if (!isEmpty(BranchID))
        this.BranchID = BranchID;
        
    if (!isEmpty(CarrierSales))
        this.CarrierSales = CarrierSales;

    if (!isEmpty(CustomerID))
        this.CustomerID = CustomerID;

    if (!isEmpty(SalesId))
        this.SalesId = SalesId;
        
    if (!isEmpty(DeptId))
        this.DeptId = DeptId;

    if (!isEmpty(GatheringTypeID))
        this.GatheringTypeID = GatheringTypeID;

    if (!isEmpty(OperationTypeID))
        this.OperationTypeID = OperationTypeID;

    if (!isEmpty(SourceTypeID))
        this.SourceTypeID = SourceTypeID;
        
    if (!isEmpty(Remark))
        this.Remark = Remark;

    if (!isEmpty(AuditOrNot))
        this.AuditOrNot = AuditOrNot;

}





function btnCancelClick() {
    window.document.forms[0].reset();
    //ASPxClientEdit.ClearEditorsInContainer(null);
}

function btnCloseClick() {
    window.close();
}

function gridPolicyItem_EndCallback(s, e) {
    //
}


function policyTab_Changing(s, e) {
    //debugger;
    if (e.tab.index == 1 || e.tab.index == 2) {
        var element = s.GetContentElement(e.tab.index);
        if (element != null) element.loaded = false;
    }
}

function policyTab_Click(s, e) {
    //
}


function dxebtnAuditBackClick(s, e) {
        
    var AuditOrNot = 0;
    
    var AskPriceID = dxetxtAskPriceID.GetValueString();
    var CarrierID = null;
    var BranchID = null;
    var CarrierSales = null;
    var CustomerID = null;
    var SalesId = null;
    var DeptId = null;
    var GatheringTypeID = null;
    var OperationTypeID = null;
    var SourceTypeID = null;
    var Remark = dxeMemo.GetValueString();

    var plc = new Policy(AskPriceID, CarrierID, BranchID, CarrierSales,
            CustomerID, SalesId, DeptId, GatheringTypeID,
            OperationTypeID, SourceTypeID, Remark, AuditOrNot);

    var jsonStringClient = Sys.Serialization.JavaScriptSerializer.serialize(plc);

    dxeAuditOkCallback.PerformCallback(jsonStringClient);

}


function auditBackCallbackComplete(s, e) {
    //do nothing;
    setOnlyDxeButtonsUnableOrEnable(false);
}

function dxebtnAuditOkClick(s, e) {
    //debugger;
    var buttonID = s.GetText();
    var AuditOrNot;
    switch (buttonID) {
        case "通过审核":
            AuditOrNot = true;
            break
        case "反审核":
            AuditOrNot = false;
            break
        default:
            //do nothing;
    }

    var AskPriceID = dxetxtAskPriceID.GetValueString();
    var CarrierID = null;
    var BranchID = null;
    var CarrierSales = null;
    var CustomerID = null;
    var SalesId = null;
    var DeptId = null;
    var GatheringTypeID = null;
    var OperationTypeID = null;
    var SourceTypeID = null;
    

    var Remark = dxeMemo.GetValueString();
    
    var plc = new Policy(AskPriceID, CarrierID, BranchID, CarrierSales,
            CustomerID, SalesId, DeptId, GatheringTypeID,
            OperationTypeID, SourceTypeID, Remark, AuditOrNot);

    var jsonStringClient = Sys.Serialization.JavaScriptSerializer.serialize(plc);

    dxeAuditOkCallback.PerformCallback(jsonStringClient);

}

function auditOkCallbackComplete(s, e) {

    setOnlyDxeButtonsUnableOrEnable(false);
    dxebtnAuditOk.SetEnabled(true);
    var buttonID = dxebtnAuditOk.GetText();
    switch (buttonID) {
        case "通过审核":
            dxebtnAuditOk.SetText("反审核");
            break
        case "反审核":
            dxebtnAuditOk.SetText("通过审核");
            break
        default:
            //do nothing;
    }

}


function hlPolicyItemTogetherClick(params) {
    var myArguments = "resizable:yes;scroll:yes;status:no;dialogWidth=800px;dialogHeight=600px;center=yes;help=no";
    var url = params;
    window.open(url);
}

function Carrier_SelectedIndexChanged(s, e) {
    var thejsonstring = dxeddlCarrierId.GetSelectedItem().value;
    dxeddlBranchId.PerformCallback(thejsonstring);
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
  