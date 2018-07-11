<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>

<meta charset="utf-8"/>
<title>jquery easyui tree</title>

<!-- easyui css -->
<link rel="stylesheet" href="${ctx}/js/easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="${ctx}/js/easyui/themes/icon.css" />

<!-- jquery js -->
<script src="${ctx}/js/jquery/jquery-1.8.0.min.js"></script>

<!--  easyui js -->
<script src="${ctx}/js/easyui/jquery.easyui.min.js"></script>
<script src="${ctx}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script>
var t ;
var t2;
function setValued(){
	t.combotree('setValue', "3");
}
function setValues(){
	t2.combotree('setValues', [11,12]); 
}

function getValued(){
	var str = t.combotree("getValue");
	alert(str);
}
function getValueds(){
	var str = t2.combotree("getValues");
	alert(str);
}
function getText(){
	var str = t.combotree("getText");
	alert(str);
	str = t2.combotree("getText");
	alert(str);
}
$(function(){
	 t = $('#cc').combotree({
		url:'${ctx}/easyUi/easyUi!getTreeData.do',
	    required: true,
	    //是否有checkbox
	    checkbox:true,
	    //是否只显示叶子节点前的checkbox
	    onlyLeafCheck:true,
	    //默认查询参数
	    queryParams:{a:1,b:'ssss'},
	    formatter:function(node){
			return node.text + "(" + node.state + ")";
		}
	});
	t2 = $('#cc2').combotree({
		required:true,
		multiple:true
	});
	$('#cc2').combotree('loadData', [{
		id: 1,
		text: 'Languages',
		children: [{
			id: 11,
			text: 'Java'
		},{
			id: 12,
			text: 'C++'
		}]
	}]);
})


	
</script>
</head>
<body class="easyui-layout">
<div id="win" style="overflow:hidden; ">
		<iframe id="winSrc" frameborder="0" width="100%" height="100%"></iframe>
</div>

<div data-options="region:'center',title:'Center'" style="padding:2px;">
	单选<input id="cc" value="01" type="text"/><br/><br/><br/><br/>
	多选<input id="cc2" value="01" type="text"/>
</div>

<div data-options="region:'east',split:true,title:'East'" style="width:300px;padding:2px;">
	<a href="#" class="easyui-linkbutton"  onclick="setValued();">设置单值</a>setValue  <br/>
	<a href="#" class="easyui-linkbutton"  onclick="setValues();">设置多值</a>setValues<br/>
	<a href="#" class="easyui-linkbutton"  onclick="getValued();">获取单值</a> getValue <br/>
	<a href="#" class="easyui-linkbutton"  onclick="getValueds();">获取多值</a> getValues<br/>
	<a href="#" class="easyui-linkbutton"  onclick="getText();">获取文本</a> getText <br/>
	
	
</div>
	
<div data-options="region:'south',split:true,border:true" style="height:100px;background:#fff;padding:2px;">
	<div id ="editInfo"></div>
</div>

</body>
</html>