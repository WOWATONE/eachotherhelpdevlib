
function SetFormInputPopUpVisible() {
    var popupControl = GetPopupControl('SelectInsurance');
    popupControl.ShowWindow();
    //    var hintWindow = popupControl.GetWindowByName(name);
    //    if (value)
    //        popupControl.ShowWindow(hintWindow);
    //    else
    //        popupControl.HideWindow(hintWindow);
}


function GetPopupControl(name) {
    if (name == 'SelectInsurance')
        return ASPxPopupSelectInsuranceClientControl;
    else
        return null;

    //    else if (name == 'Error')
    //        return ASPxPopupErrorClientControl;
    

    
}