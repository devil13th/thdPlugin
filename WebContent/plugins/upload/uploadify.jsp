<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>

<meta charset="utf-8"/>
<title>jquery uploadify</title>

<link rel="stylesheet" href="${ctx}/js/uploadify/uploadify.css" />
<style>

</style>
<!-- jquery js -->
<script src="${ctx}/js/jquery/jquery-1.8.0.min.js"></script>
<!-- jquery uploadify js -->
<script src="${ctx}/js/uploadify/jquery.uploadify.js?_r=<%=Math.random()%>"></script>

<script>
$(function() {
	setTimeout(function(){ //setTimeout防止chrome崩溃
		$('#file_upload').uploadify({
			swf      : "${ctx}/js/uploadify/uploadify.swf",
			uploader : "${ctx}/upload/upload!uploadifySubmit.do",
			fileObjName:"file",
			formData : {str:"aabbcc",a:1,b:2,c:3},
			method:"post"
		});
	},100)
});

</script>
</head>
<body style="padding:0px;margin:0px;">
<form>
	<div id="queue"></div>
	<input id="file_upload" name="file" type="file" multiple="true"/>
</form>
11 23 54 66 77

</body>
</html>