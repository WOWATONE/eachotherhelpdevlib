//InitNavBar
function InitNavBar(sender, args) {
    //UpdateItemsCombo(cbGroups.GetValue());
    //ShowProperties();
}

//SelectedItemChanged
function SelectedItemChanged(sender, args) {
    var name = args.item.name;
    //for (var i in args) {
    //    if ("inherit" != i && "constructor" != i)
    //        s += i + " = " + eval("args." + i) + "<br />";
    //}
    parent.mainFrame.location = name;       
}

//GroupExpandedChanged
function GroupExpandedChanged(sender, args) {
    //if (e.group.GetExpanded())
    //    UpdateItemsCombo(e.group.name);
    //else
    //    ShowProperties();
}

//GroupExpandedChanging
function GroupExpandedChanging(sender, args) {
    //if (!e.group.GetExpanded())
    //    NavBar.CollapseAll();
}

//function GetNavBarGroup() {
//    return NavBar.GetGroupByName(cbGroups.GetValue());
//}
//function GetNavBarItem() {
//    return NavBar.GetItemByName(cbItems.GetValue());
//}
//function ToggleItemEnabled() {
//    var item = GetNavBarItem();
//    item.SetEnabled(chbItemEnabled.GetChecked());
//    ShowProperties();
//}
//function ToggleItemVisible() {
//    var item = GetNavBarItem();
//    item.SetVisible(chbItemVisible.GetChecked());
//    ShowProperties();
//}
//function ToggleItemSelected() {
//    var item = GetNavBarItem();
//    if (!item.GetVisible())
//        chbItemSelected.SetChecked(false);
//    else {
//        NavBar.SetSelectedItem(chbItemSelected.GetChecked() ? GetNavBarItem() : null);
//        ShowProperties();
//    }
//}
//function ToggleGroupVisible() {
//    GetNavBarGroup().SetVisible(chbGroupVisible.GetChecked());
//}
//function ToggleGroupExpanded() {
//    GetNavBarGroup().SetExpanded(chbGroupExpanded.GetChecked());
//}
//function ChangeActiveGroup() {
//    UpdateItemsCombo(GetNavBarGroup().name);
//    ShowProperties();
//}
//function ChangeSelectedItem() {
//    ShowProperties();
//}
//function UpdateItemsCombo(groupName) {
//    cbGroups.SetValue(groupName);
//    cbItems.ClearItems();
//    var group = GetNavBarGroup();
//    for (var i = 0; i < group.GetItemCount(); i++) {
//        var item = group.GetItem(i);
//        cbItems.AddItem(Trim(item.name), Trim(item.name));
//    }
//    cbItems.SetSelectedIndex(0);

//    ShowProperties();
//}
//function ShowProperties() {
//    chbGroupVisible.SetChecked(!GetNavBarGroup() ? false : GetNavBarGroup().GetVisible());
//    chbGroupExpanded.SetChecked(!GetNavBarGroup() ? false : GetNavBarGroup().GetExpanded());
//    chbItemEnabled.SetChecked(!GetNavBarItem() ? false : GetNavBarItem().GetEnabled());
//    chbItemVisible.SetChecked(!GetNavBarItem() ? false : GetNavBarItem().GetVisible());
//    chbItemSelected.SetChecked(GetNavBarItem() && GetNavBarItem() == NavBar.GetSelectedItem() ? true : false);
//}

