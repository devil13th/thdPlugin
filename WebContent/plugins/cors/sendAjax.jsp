<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../pub/TagLib.jsp"%>
<% response.setHeader("Access-Control-Allow-Origin", "*"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script src="${ctx}/js/jquery/jquery-1.8.0.min.js"></script>
<script src="${ctx}/js/fun.js"></script>

<script>
//普通方式发送ajax请求
function generalAjax(){ 
	$.ajax({
	     type: "post",
	     async: false,
	     dataType :"json",
	     url :"http://thd.thd.com:8090/thdPlugins/cors/cors!general.do",
	     success: function(data){
	         alert(data);
	     },
	     error: function(){
	         alert('普通的ajax跨域访问失败');
	     }
	});
}
//jsonp方式发送ajax请求
function jsonpAjax(){
	$.ajax({
	     type: "get",//jsonp只能发送get方式请求,即使设置成post也是get方式
	     async: false,
	     //ajax直接请求其他域名下的资源是不允许的,但可以通过jsonp的方式去访问
	     //url :"http://thd.thd.com:8090/thdPlugins/auth/auth!getCookie.do",
	     url :"http://thd.thd.com:8090/thdPlugins/cors/cors!jsonp.do",
	     dataType: "jsonp",
	     jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
	     jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
	     success: function(json){
	         alert(json.userInfo.name);
	     },
	     error: function(){
	         alert('jsonp ajax 请求失败');
	     }
	});
}
//cors方式发送ajax请求
function corsAjax(){ 
	$.ajax({
	     type: "post",
	     async: false,
	     dataType :"json",
	     url :"http://thd.thd.com:8090/thdPlugins/cors/cors!cors.do",
	     success: function(data){
	         alert(data.userInfo.name);
	     },
	     error: function(){
	         alert('cors ajax 请求失败');
	     }
	});
}


function corsPage(){ 
	var url = "http://thd.thd.com:8090/thdPlugins/cors/cors!corsPage.do";
	//var url = "${ctx}/cors/cors!corsPage.do";
	showWin(url,500,500);
}

function  myMethod(xx){
	alert(xx);
}
//用于跨域的父子页面访问
document.domain = "thd.com";

</script>
</head>
<body>
普通跨域ajax访问，会报错 <input type="button" onclick="generalAjax()" value="普通ajax跨域访问"/> <br/>
jsonp的ajax跨域访问方式成功<input type="button" onclick="jsonpAjax()" value="jsonp方式ajax跨域访问"/><br/>
cors的ajax跨域访问方式成功<input type="button" onclick="corsAjax()" value="cors方式ajax跨域访问"/><br/>
<br/><br/>
页面的跨域访问方式成功<input type="button" onclick="corsPage()" value="cors方式打开界面访问"/>
</body>
</html>