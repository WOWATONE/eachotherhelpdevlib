function makewelcomeString() {
    var curDate = new Date();
    var curYear = curDate.getFullYear();
    var curMonth = curDate.getMonth() + 1;
    var curDay = curDate.getDate();
    var curWeek;
    if (curDate.getDay() == 0) curWeek = "星期日"
    if (curDate.getDay() == 1) curWeek = "星期一"
    if (curDate.getDay() == 2) curWeek = "星期二"
    if (curDate.getDay() == 3) curWeek = "星期三"
    if (curDate.getDay() == 4) curWeek = "星期四"
    if (curDate.getDay() == 5) curWeek = "星期五"
    if (curDate.getDay() == 6) curWeek = "星期六"

    var result = curYear + "年" + curMonth + "月" + curDay + "日  " + curWeek;
    return result;
}