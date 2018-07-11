<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../../../pub/TagLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${title}</title>
<link rel="stylesheet" href="${ctx}/js/layer/skin/default/layer.css"/>

<script src="${ctx}/js/jquery/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/layer/layer.js"></script>
  
  
<script>
<%
int x = (int)(Math.random()*100);
%>
var i ;
function fun18(){
	//iframe层
	i = top.layer.open({
	  type: 2,
	  title: 'layer mobile页',
	  shadeClose: true,
	  shade: 0.1,
	  area: ['380px', '90%'],
	  content: '${ctx}//bootstrap/bootstrap!layerIn.do?title=<%=x%>' //iframe的url
	}); 
	alert("第" + i + "层");
}

function cc(){
	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	parent.layer.close(index);
}


  </script>
</head>
<body>

[${title }]

<button onclick="fun18()">最外层再次嵌套弹出层</button>
<button onclick="cc()">关闭本层</button>

</body>
</html>