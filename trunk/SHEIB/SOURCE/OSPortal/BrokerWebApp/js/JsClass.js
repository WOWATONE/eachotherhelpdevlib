function getCurDate()
{
		var curDate = new Date();
		var curYear = curDate.getFullYear();
		var curMonth = curDate.getMonth() + 1;
		var curDay = curDate.getDate();
		var curWeek;
		if(curDate.getDay()==0) curWeek = "������"
		if(curDate.getDay()==1) curWeek = "����һ"
		if(curDate.getDay()==2) curWeek = "���ڶ�"
		if(curDate.getDay()==3) curWeek = "������"
		if(curDate.getDay()==4) curWeek = "������"
		if(curDate.getDay()==5) curWeek = "������"
		if(curDate.getDay()==6) curWeek = "������"
		document.write(curYear+"��"+curMonth+"��"+curDay+"��  "+curWeek);
}