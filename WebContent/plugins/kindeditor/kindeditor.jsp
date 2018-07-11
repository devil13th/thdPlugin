<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>

<meta charset="utf-8"/>
<title>jquery easyui tree</title>

<!-- easyui css -->
<link rel="stylesheet" href="${ctx}/js/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="${ctx}/js/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="${ctx}/js/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="${ctx}/js/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="${ctx}/js/kindeditor/plugins/code/prettify.js"></script>
<script>
var editor1;
KindEditor.ready(function(K) {
	editor1 = K.create('textarea[id="content"]', {
		cssPath : '${ctx}/js/kindeditor/plugins/code/prettify.css',
		//uploadJson : '${ctx}/editor/jsp/upload_json.jsp',
		uploadJson : '${ctx}/kindeditor/kindeditor!upload.do',
		fileManagerJson : '${ctx}/editor/jsp/file_manager_json.jsp',
		allowFileManager : true,
		height:400,
		width:740,
		filterMode:false,
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
		}
	});
});
</script>
</head>
<body>
<textarea id="content"></textarea>
</body>
</html>