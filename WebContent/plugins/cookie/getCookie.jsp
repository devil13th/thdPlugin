<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../pub/TagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script src="${ctx}/js/jquery/jquery-1.8.0.min.js"></script>

<script>
</script>
</head>
<body>
*_* || ^_^
<a href ="${ctx}/cookie/cookie!setCookie.do" target="_blank">setCookie</a>
<hr/>
<c:forEach items="${cookieList}" var="c">
${c}<br/>
</c:forEach>
</body>
</html>