<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>

<meta charset="utf-8"/>
<title>jquery zTree</title>


<style>
</style>

<!-- jquery ztree css -->
<link rel="stylesheet" href="${ctx}/js/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">

<!-- jquery js -->
<script src="${ctx}/js/jquery/jquery-1.8.0.min.js"></script>
<!-- jquery ztree -->
<script src="${ctx}/js/ztree/js/jquery.ztree.all-3.5.js"></script>


<script>


</script>
</head>
<body style="padding:0px;margin:0px; ">

<s:form action="tree_editSubmit.do" namespace="tree" method="post">
        主键：<s:textfield name="tree.treeId" readonly="true"></s:textfield><br/>
	编码：<s:textfield name="tree.treeCode" readonly="true"></s:textfield><br/>
	名称：<s:textfield name="tree.treeName"></s:textfield><br/>
	状态：<s:textfield name="tree.treeStatus"></s:textfield><br/>
	叶子节点：<s:textfield name="tree.treeIsLeaf"></s:textfield><br/>
	<input type="submit" value="保存"/>
	
	
</s:form>

</body>
</html>