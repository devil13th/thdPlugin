<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../pub/TagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>cookie</title>

<script src="${ctx}/js/jquery/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/jquery/jquery.cookie.js"></script>
<script>
$.cookie('sex', 'males', { expires: 7 });
</script>
</head>
<body>
*_* || ^_^

<a href ="${ctx}/cookie/cookie!getCookie.do" target="_blank">getCookie</a>
</body>
</html>