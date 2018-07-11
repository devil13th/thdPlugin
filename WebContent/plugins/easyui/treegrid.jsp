<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../../pub/TagLib.jsp"%>
<!DOCTYPE html >

<html>
<head>

<meta charset="utf-8"/>
<title>jquery datagrid</title>

<!-- easyui css -->
<link rel="stylesheet" href="${ctx}/js/easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="${ctx}/js/easyui/themes/icon.css" />

<!-- jquery js -->
<script src="${ctx}/js/jquery/jquery-1.8.0.min.js"></script>

<!--  easyui js -->
<script src="${ctx}/js/easyui/jquery.easyui.min.js"></script>
<script src="${ctx}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script>
var tab ;
$(function(){
	tab = $('#treegrid').treegrid({
		title:'Jquery Tree Grid',
		iconCls:'icon-ok',
		//数据来源
		url:'${ctx}/easyUi/easyUi!getTreeData2.do', 
		//默认参数
		//queryParams:{'sysUser.userName':'${sysUser.userName}'},
		//斑马纹
		//striped:true,
		//主键字段
		idField:'id',
		treeField:'name',
		//表单提交方式
		method:"post", 
		//是否只能选择一行
		singleSelect:false,
		//自动宽度
		fit:true,
		fitColumns:true,
		//高度
		height:350,
		//宽度
		//width:900, 
		//是否分页
		pagination:true,
		//分页信息
		pageSize:5, 
		//每页显示条目下拉菜单
		pageList:[5,10,15,20,100],
		
		//pageNumber:5,
		//rownumbers:true,//行号 
		//分页工具所在位置
		//pagePosition:"both",
		
		loadMsg:"正在加载数据,请稍后",
		//冻结的列
		frozenColumns:[[
		        //选择框
               {field:'ck',checkbox:true},
               {field:'id',title:'ID',width:200,sortable:true}
		]],
		//不冻结的列
		columns:[[
			{field:'name',title:'Name',sortable:true,width:100,dtype:"a"},
			{field:'age',width:100,title:'AGE',sortable:true,dtype:"b"}, 
			{field:'bir',title:'BIRTHDAY',width:100,sortable:true,dtype:"e"}
		]],
		toolbar:[
			{
				text:'Resresh',
				iconCls:'icon-search',
				handler:function(){tab.treegrid("reload")}
			}
		]
	})
})
</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center',title:'Center'" style="padding:1px;">
<table id="treegrid"></table>
</div>
<div data-options="region:'east',split:true,title:'East'" style="width:300px;padding:2px;">
</div>
<div data-options="region:'south',split:true,border:false" style="height:100px;background:#fff;padding:2px;">
</div>

</body>
</html>