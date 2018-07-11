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
$(function(){
	t = $('#tree').tree({
		//是否显示树节点前的竖线
		lines:true,
		//是否需要动画效果
		animate:true,
		//查询节点提交方式
		method:"get",
		//查询节点地址
	    url:'${ctx}/easyUi/easyUi!getTreeData.do',
	    //是否有checkbox
	    checkbox:true,
	    //是否只显示叶子节点前的checkbox
	    onlyLeafCheck:true,
	    //默认查询参数
	    queryParams:{a:1,b:'ssss'},
	    formatter:function(node){
			return node.text + "(" + node.state + ")";
		},
	    onClick: function(node){
	    	$("#editInfo").html(new Date()+"<br/>on click : node id -&gt; "+node.id+ " | node text -&gt; " + node.text+ "<br/> "+$("#editInfo").html()); 
		}
	});
})


//展开所有
function expendAll(){
	t.tree("expandAll");
}
//关闭所有
function collapseAll(){
	t.tree("collapseAll");
}
//查找节点
function find(){
	//alert(1);
	//根据id查找节点
	var n = t.tree("find","8a808af13c1e45d4013c1e78c68a0004");
	//alert(n.text);
	t.tree("expand",n.target);  
}
//打开/关闭某节点
function toggle(){
	//alert(1);
	//根据id查找节点
	var n = t.tree("find","8a808af13c1e45d4013c1e78c68a0004");
	//alert(n.text);
	t.tree("toggle",n.target);  
}
//添加节点
function append(){
	 
	
	var selected = t.tree('getSelected');
	if(!selected ){
		alert("请选择节点");
		return;
		
	}
	t.tree('append', {
		parent: selected.target,
		data: [{
			id: 23,
			text: 'node23'
		},{
			text: 'node24',
			state: 'closed',
			children: [{
				text: 'node241'
			},{
				text: 'node242'
			}]
		}]
	});
	
}
	
</script>
</head>
<body class="easyui-layout">
<div id="win" style="overflow:hidden; ">
		<iframe id="winSrc" frameborder="0" width="100%" height="100%"></iframe>
</div>

<div data-options="region:'center',title:'Center'" style="padding:2px;">
	<ul id="tree" class="easyui-tree">
    </ul>
</div>

<div data-options="region:'east',split:true,title:'East'" style="width:300px;padding:2px;">
	<a href="#" class="easyui-linkbutton"  onclick=" expendAll();">展开所有</a> expendAll <br/>
	<a href="#" class="easyui-linkbutton"  onclick=" collapseAll();">关闭所有</a> collapseAll<br/>
	<a href="#" class="easyui-linkbutton"  onclick=" find();">查找并打开节点</a> find & expand<br/>
	<a href="#" class="easyui-linkbutton"  onclick=" toggle();">打开/关闭某节点</a> toggle<br/>
	
	<a href="#" class="easyui-linkbutton"  onclick=" append();">添加节点</a>append<br/>
	
</div>
	
<div data-options="region:'south',split:true,border:true" style="height:100px;background:#fff;padding:2px;">
	<div id ="editInfo"></div>
</div>

</body>
</html>