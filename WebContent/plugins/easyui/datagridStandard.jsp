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
<script src="${ctx}/js/fun.js"></script>
<script>
 

 
// ========= 快速开发  ============   loadDg()方法：只要是查询就调用该方法
//重新查询
function loadDg() {
	var jsonData = $("#theForm").serializeArray();
	var params = formToJson(jsonData);
	params.a = Math.random();
	//showObj(params);
	tab.datagrid("load", params);
}
//格式化json
function formToJson(objArray){
	var jsonObj = {};
	for(var i = 0 , j = objArray.length ; i < j ;i++){
		var obj = objArray[i];
		jsonObj[obj.name] = obj.value;
	}
	return jsonObj;
}

//========= 快速开发  ============   reloadDg()方法：只要是刷新彪哥就调用该方法
function reloadDg() {
	tab.datagrid("reload");
}


function getSelectOne(){
	var row = tab.datagrid("getSelected");
	return row;
}


//获取选择数据
function getSelectFirst(){
	var row = getSelectOne();
	if(row){
		alert(JSON.stringify(row)); 
		return  row;
	}else{
		$.messager.alert('警告','未选择数据!','warning');
		
	}
}


//新增数据
function addData(){
	showWin("${ctx}/easyUi/easyUi!userEdit.do", 900, 700);
}

//编辑数据
function editData(){
	var row = getSelectOne();
	if(row){
		showWin("${ctx}/easyUi/easyUi!userEdit.do?sysUser.id=" + row.USER_ID, 900, 700);
	}else{
		$.messager.alert('警告','未选择数据!','info');
	}
	
}

//删除数据
function deleteData(){
	var row = getSelectOne();
	if(row){
		$.messager.confirm('Confirm', '确定删除此条记录么?', function(r){
			if (r){
				$.ajax("${ctx}/easyUi/easyUi!doajax.do?ajaxMethod=deleteUser&id=" + row.USER_ID + "&_r="+Math.random,
					{
						type:"GET",
						success:function(r){
							var str = $.trim(r);
							if(str == "success"){
								$.messager.show({
									title:'提示',
									msg:'操作成功!',
									timeout:2000,
									showType:'slide'
								});
								reloadDg();
							}else{
								alert(str);
							};
						}
					}
				)
			}
		});
			
	}else{
		$.messager.alert('警告','未选择数据!','error');
	}
}

var tab ;
var pd;
var lastIndex =0;

var products = [
    		    {vl:'0',sexname:'女'},
    		    {vl:'1',sexname:'男'}
    		   
    		];
    		
var toolbar = [
{
    text:'打开关闭搜索栏',
    iconCls:'icon-clear',
    handler:function(){hideQuery()}
},{
    text:'新增',
    iconCls:'icon-add',
    handler:function(){addData()}
},{
    text:'编辑',
    iconCls:'icon-edit',
    handler:function(){editData()}
},'-',{
    text:'删除',
    iconCls:'icon-clear',
    handler:function(){deleteData()}
},'-',{
    text:'获取选择数据',
    iconCls:'icon-search',
    handler:function(){getSelectFirst()}
}];





$(function(){
	
	
	tab = $('#datagridtab').datagrid({
		title:'Jquery DataGrid',
		iconCls:'icon-ok',
		//数据来源
		url:'${ctx}/easyUi/easyUi!datagridStandardGetData.do', 
		//斑马纹
		striped:true,
		//主键字段
		idField:'USER_ID',
		//表单提交方式
		method:"post", 
		//是否只能选择一行
		singleSelect:true,
		//高度
		//height:350,
		//宽度
		//width:900, 
		fit:true,
		//自动宽度
		fitColumns:true,
		resizable:true,
		//排序的列
		sortName : 'USER_NAME',
		//排序方式
		sortOrder : "desc",
		//是否分页
		pagination:true,
		//分页信息
		pageSize:10, 
		//每页显示条目下拉菜单
		pageList:[5,10,15,20,100],
		
		//pageNumber:5,
		rownumbers:true,//行号 
		//分页工具所在位置
		//pagePosition:"both",
		
		loadMsg:"正在加载数据,请稍后",

		// =========== 快速开发 ============  冻结列字段和不冻结列字段的添加方法为 将service中的查询SQL直接粘过来 一个一个复制字段
		//冻结的列
		frozenColumns:[[
			{field:'USER_ID',checkbox:true},
			{
				field : 'USER_NAME',
				title : '用户名',
				width:150,
				sortable : true
			}
		]],
		//不冻结的列
		columns:[[
			{
				field : 'USER_SEX',
				title : ' 用户性别',
				formatter : function(value, row, index) {
					if(value=='1'){
						return "男"
					}
					if(value=='0'){
						return "女"
					}
				},
				width:100,
				sortable : true
			}, 
			{
				field : 'USER_MAIL',
				title : '用户邮箱',
				width:100,
				sortable : true
			},
			{
				field : 'USER_TEL', 
				title : '用户电话',
				width:100,
				sortable : true
			},
			{
				field : 'USER_BIRTHDAY',
				title : '用户生日',
				width:100,
				sortable : true
			},
		]],
		
		
		//工具条
		toolbar:toolbar,
		//在用户排序一列的时候触发参数包括：sort：排序列字段名称。order：排序列的顺序(ASC或DESC)
		onSortColumn : function(sort, order) {
			$('#sort').val(sort);
			$('#order').val(order);
		}
		
	})
	//查询按钮点击
	$("#rbton").linkbutton({
		onClick:function(){
			reloadDg();  
		}
	})
	$('#win').window({
	    title: 'Window',
	    width: 400,
	    height: 200,
	    closed: true,
	    minimizable:false,
	    top:50,
	    //cache: false, 
	    //href: '${ctx}/pages/test.html',  
	    modal: true  
	});
})
	
	//格式化数据
	var sexformatter = function(value,row,index){
		if (row.sex == "1"){
			return "男";
		} else {
			return "女";
		}
	}
var queryState = "open";
function hideQuery(){
	if("open" == queryState){
		$('body').layout('collapse','north');
		queryState = "close";
	}else{
		$('body').layout('expand','north');
		queryState = "open";
	}
}
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',split:true,border:false" style="height:50px">
	<form id="theForm" method="post">
	<!--  =======快速开发 ======== 确保id和name与后台service中的sql字段保持一致 -->
	
		<!-- 排序 写死了就行了 -->
		<input type="hidden" id="sort" name="sort" value="status" />
		<!-- 排序 写死了就行了 -->
		<input type="hidden" id="order" name="order" value="desc" />
		
		姓名：<input type="text" id="USER_NAME" name="USER_NAME" />
		邮箱：<input type="text" id="USER_MAIL" name="USER_MAIL" />
		<a  href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="loadDg()" >查询</a>
		<a  href="#" id="rbton" class="easyui-linkbutton" data-options="iconCls:'icon-search'"  >刷新本页</a>
	 
	</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="datagridtab"></table>
		 
		
	</div>

</body>
</html>