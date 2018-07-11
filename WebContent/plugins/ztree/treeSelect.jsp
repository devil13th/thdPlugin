<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>

<meta charset="utf-8"/>
<title>jquery zTree</title>


<style>

div#rMenu {z-index:4;position:absolute;width:100px;visibility:hidden; top:0; background-color: #555;padding: 1px;}
div#rMenu ul{margin:0px;padding:0px;}
div#rMenu ul li{
	font-size:12px;line-height:20px;
	margin:0px;padding:0px;
	cursor: pointer;
	list-style: none outside none;
	background-color: #DFDFDF;
	border-bottom:1px solid #fff;
	padding-left:3px;
}

div#rMenu ul li:hover{background:#eee;}
</style>

<!-- jquery ztree css -->
<link rel="stylesheet" href="${ctx}/js/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<!-- jquery js -->
<script src="${ctx}/js/jquery/jquery-1.8.0.min.js"></script>
<!-- jquery ztree -->
<script src="${ctx}/js/ztree/js/jquery.ztree.all-3.5.js"></script>


<script>
var setting = {
		async: {
			enable: true,
			url:"${ctx}/tree/tree_getData.do",
			autoParam:["id", "code=tree.treeCode"]
		},
		check: {
			enable: true,
			
			<c:if test="${ckType == 'radio'}">
				//选择类型 默认是checkbox
				chkStyle: "radio", 
				//整棵树只能选择一个  默认同级只能选择一个 只针对radio形式
				radioType : "all",
			</c:if>
			
			
			<c:if test="${ckType == 'checkbox'}">
				//选择类型 默认是checkbox
				chkStyle: "checkbox", 
				//选择级联形式
				chkboxType : { "Y" : "", "N" : "" },
			</c:if>
			
			end:"-"
		}
}; 

var zNodes =[
	{ id:"root", pId:"ROOT", name:"根节点",code:"root",isParent:true}
];

var zTree, rMenu;
$(document).ready(function(){
	zTree=$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	rMenu = $("#rMenu");
	
	
	
	//打开根目节点
	openNode("root");
	
	//展开某节点以及父亲以上节点...
	//openNodeAndParent("root.00001.00001");
	
	//获取焦点  并展开节点及父亲以上节点...
	//focusNodeAndOpenParnet("root.00001.00001.00001");
	
	//勾选节点，并展开其父亲以上节点
	//checkNodeAndOpenParent("root.00001.00001.00001");
	//checkNodeAndOpenParent("root.00002.00001.00001");
	//checkNodeAndOpenParent("root.00003.00001.00001");
	
	

	
	
	<c:forEach items="${focusCodes}"  var="s">
		focusNodeAndOpenParnet("${s}");
	</c:forEach>
	
	<c:forEach items="${openCodes}"  var="s">
		openNodeAndParent("${s}");
	</c:forEach>
	
	<c:forEach items="${checkCodes}"  var="s">
		checkNodeAndOpenParent("${s}");
	</c:forEach>


});





function getAllNodeByCode(code){
	var r = [];
	if($.trim(code) == "" || $.trim(code).split(".").length == 1){
		return 
	}
	var codes = code.split(".");
	var c = "root";
	for(var i = 1 , j = codes.length ; i < j ; i++){
		c+=("." + codes[i]);
		r.push(c);
	}
	return r;
}
 
//直接打开某节点
function openNode(code){
	var node = zTree.getNodeByParam("code",code, null);
	if(node){
		if(!node.open){
			zTree.reAsyncChildNodes(node, "refresh");
		}
	}else{
		setTimeout(function(){openNode(code);},10)
	}
};

//直接获取焦点
function focusNode(code){
	var node = zTree.getNodeByParam("code",code, null);
	if(node){
		zTree.selectNode(node,true);
	}else{
		setTimeout(function(){focusNode(code);},10);
	}
}


//勾选某节点
function checkNode(code){
	var node = zTree.getNodeByParam("code",code, null);
	if(node){
		zTree.checkNode(node, true, false);
	}else{
		setTimeout(function(){checkNode(code);},10);
	}
}

//打开某节点以及父亲节点
function openNodeAndParent(code){
	var r = getAllNodeByCode(code);
	for(var i = 0 , j = r.length ; i < j ; i++){
		openNode(r[i]);
	}
}

//打开某节点的所有父节点并且该节点获取焦点
function focusNodeAndOpenParnet(code){
	var r = getAllNodeByCode(code);
	for(var i = 0 , j = r.length - 1 ; i < j ; i++){
		openNode(r[i]);
	}
	focusNode(r[r.length-1]);
}

//勾选某节点并展开其父亲以上节点
function checkNodeAndOpenParent(code){
	var r = getAllNodeByCode(code);
	for(var i = 0 , j = r.length - 1 ; i < j ; i++){
		openNode(r[i]);
	}
	checkNode(r[r.length-1]);
}

//获取勾选的id
function getSelected(){
	var ids = "";
	var nodes = zTree.getCheckedNodes(true);

	if(nodes.length > 0){
		for(var i = 0 , j = nodes.length ; i < j ; i++){
			ids +=(nodes[i].id + ",");
		}
	}
	if(ids!=""){
		ids = ids.substring(0,ids.length -1 );
	} 
	alert(ids);
	return ids;
}

function parentCallBack(){
	<c:if test="${callBackPath!=null && callBackPath!='' }">
		${callBackPath}(getSelected());
	</c:if>
}

</script>
</head>
<body style="padding:0px;margin:0px;">




<ul id="treeDemo" class="ztree"></ul>
<input type="button" value="确定" onclick="getSelected()"/>

</body>
</html>