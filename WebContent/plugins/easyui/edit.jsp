<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>
<meta charset="utf-8"/>
<title>jquery datagrid</title>

<style>
*{font-size:14px;line-height:1.5em;}
</style>


<!-- dhtmlxcalendar css -->
<link rel="stylesheet" type="text/css" href="${ctx}/js/dhtmlxcalendar/dhtmlxcalendar.css"></link>
<link rel="stylesheet" type="text/css" href="${ctx}/js/dhtmlxcalendar/skins/dhtmlxcalendar_dhx_skyblue.css"></link>

<!-- dhtmlxcalendar js -->
<script src="${ctx}/js/dhtmlxcalendar/dhtmlxcalendar.js"></script>

<!-- jquery js -->
<script src="${ctx}/js/jquery/jquery-1.8.0.min.js"></script>


<!-- jqueryui css -->
<link rel="stylesheet" type="text/css" href="${ctx}/js/jqueryui/themes/base/jquery-ui.css"></link>

<!-- jqueryui js -->
<script src="${ctx}/js/jqueryui/jquery-ui-1.9.1.custom.min.js"></script>


<script>

$(function(){
	//myCalendar = new dhtmlXCalendarObject(["dgBirthday"]);
	//myCalendar.hideTime();
	
	$( ".radio" ).buttonset();
	
	$( "input[type=submit], button" ).button();
	
	$( "#dgBirthday" ).datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat:"yy-mm-dd",
		yearRange: 'c-100:c+100'
	});

})
</script>
</head>
<body style="padding:0px;margin:0px;">
<s:form action="easyUi!editSubmit.do" namespace="easyui" method="post">
<s:fielderror></s:fielderror>
	主键：<s:textfield name="sysUser.id" readonly="true"/><br/>   
	姓名：<s:textfield name="sysUser.userName"/><br/>
	性别：<span class="radio" style="font-size:10px;">
		<s:radio list="%{#{'1':'男','0':'女'}}" name="sysUser.userSex"></s:radio>
	</span>
	<br/>
	状态：<span class="radio" style="font-size:10px;">
		<s:radio list="%{#{'1':'有效','-1':'无效'}}" name="sysUser.userStatus"></s:radio>
	</span><br/>
	
	
	生日：<s:textfield name="sysUser.userBirthday" id="dgBirthday" > 
			<s:param name="value"><s:date name="sysUser.userBirthday" format="yyyy-MM-dd"/></s:param> 
		</s:textfield> <br/>
<input type="submit" value="提交" style="font-size:12px;"/>

	
</s:form>
</body>
</html>