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
//用于跨域的父子页面访问
document.domain = "thd.com"; 

function cb(){
	getParent().myMethod("成功跨域");
}
</script>
</head>
<body>

跨域调用父页面函数<input type="button" onclick="cb()" value="跨域调用父页面函数"/>
</body>
</html>