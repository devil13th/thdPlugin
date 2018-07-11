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
var tab2 ;

var tab1_load = false;
var tab2_load = false;
function initSelectData(){
	//alert(tab1_load + "|" + tab2_load);
	if(tab1_load && tab2_load){
		var selected="";	//已选中用户
		var datasTab2 = tab2.datagrid('getRows');
		//alert(datasTab2.length);
		for ( var i = 0; i < datasTab2.length; i++) {
			selected+=datasTab2[i].id+",";
		}
		//alert(selected)
		
		
		if(selected){
			var rows = tab.datagrid("getRows");
			for(var i=0;i<rows.length;i++){
				if(selected.indexOf(rows[i].id)>-1){
					tab.datagrid('selectRow',i);
				}
			}
		}
	}
	
}



$(function(){
	
	tab = $('#datagridtab').datagrid({
		title:'Jquery DataGrid',
		iconCls:'icon-ok',
		//数据来源
		url:'${ctx}/easyUi/easyUi!getUserData.do',  
		//斑马纹
		striped:true,
		//主键字段
		idField:'id',
		//表单提交方式
		method:"post",
		//是否只能选择一行
		//singleSelect:true,
		//自动适应
		fit:true,
		//是否有边框
		border:false,
		//高度
		//height:250,
		//宽度
		//width:600,
		
		//是否分页
		pagination:true,
		//分页信息
		//pageSize:10, 
		//每页显示条目下拉菜单
		//pageList:[5,10,15,20,100],
		
		//pageNumber:5,
		rownumbers:true,//行号 
		//分页工具所在位置
		//pagePosition:"both",
		//冻结的列
		frozenColumns:[[
               {field:'id',title:'ID',checkbox:true},
               {field:'name',title:'Name',width:120,sortable:true}
		]],
		//不冻结的列
		columns:[[
			{field:'sex',title:'SEX',width:150,sortable:true,formatter:sexformatter},
			{field:'age',title:'AGE',width:50,sortable:true},
			{field:'bir',title:'BIRTHDAY',width:100,sortable:true},
			{field:'status',title:'STATUS',width:50,sortable:true,formatter:statusformatter}
			
		]] ,
		onSelect : function(index,row){
			var datas = tab2.datagrid("getRows");
			var has = false;
			if(datas){
				for(var i = 0 , j = datas.length ;i < j ; i++){
					//alert(datas[i].PERSON_CODE);
					if(row.id== datas[i].id){
						has=true;
						break;
					}
				}
			}
			if(!has){
				tab2.datagrid("insertRow",{
					index: 1,	// index start with 0
					row: row
				})
			}

		},
		onLoadSuccess:function(data){
			tab1_load = true;
			initSelectData();
		},
		onUnselect : function(index,row){
			var datas = tab2.datagrid("getRows");
			if(datas){
				for(var i = 0 , j = datas.length ;i < j ; i++){
					//alert(datas[i].PERSON_CODE);
					if(row.id == datas[i].id){
						tab2.datagrid("deleteRow",i);
						break;
					}
				}
			}
		},
		onSelectAll : function(rows){
			if(rows){
				for(var x = 0 , y = rows.length ; x < y ; x++){
					var row = rows[x];
					var datas = tab2.datagrid("getRows");
					var has = false;
					if(datas){
						for(var i = 0 , j = datas.length ;i < j ; i++){
							//alert(datas[i].PERSON_CODE);
							if(row.id == datas[i].id){
								has=true;
								break;
							}
						}
					}
					if(!has){
						tab2.datagrid("insertRow",{
							index: 1,	// index start with 0
							row: row
						})
					}
				}
			}
		},
		onUnselectAll : function(rows){
			if(rows){
				for(var x = 0 , y = rows.length ; x < y ; x++){
					var row = rows[x];
					var datas = tab2.datagrid("getRows");
					if(datas){
						for(var i = 0 , j = datas.length ;i < j ; i++){
							if(row.id == datas[i].id){
								tab2.datagrid("deleteRow",i);
								break;
							}
						}
					}
				} 
			}
		}
	});
	
	tab2 = $('#datagridtab2').datagrid({
		title:'Jquery DataGrid',
		iconCls:'icon-ok',
		//数据来源
		url:'${ctx}/easyUi/easyUi!getUserData2.do',  
		//斑马纹
		striped:true,
		//主键字段
		idField:'id',
		//默认参数
		queryParams:{'ids':'${ids}'},
		//表单提交方式
		method:"post",
		//是否只能选择一行
		//singleSelect:true,
		//自动适应
		fit:true,
		//高度
		//height:250,
		//宽度
		//width:600,
		border:false, 
		//是否分页
		pagination:false,
		//分页信息
		//pageSize:10, 
		//每页显示条目下拉菜单
		//pageList:[5,10,15,20,100],
		
		//pageNumber:5,
		//行号 
		rownumbers:true,
		//分页工具所在位置
		//pagePosition:"both",
		//冻结的列
		frozenColumns:[[
			{field:'id',title:'ID',width:200,sortable:true,hidden:true}, 
			{field:'name',title:'Name',width:120,sortable:true}
		]],
		//不冻结的列
		columns:[[
			
			{field:'sex',title:'SEX',width:150,sortable:true,formatter:sexformatter},
			{field:'age',title:'AGE',width:50,sortable:true},
			{field:'bir',title:'BIRTHDAY',width:100,sortable:true},
			{field:'status',title:'STATUS',width:50,sortable:true,formatter:statusformatter}
			
		]] ,
		//双击事件
		/*onDblClickRow:function(rowIndex,rowData){
			//alert(rowData.id);
			tab2.datagrid("deleteRow",rowIndex);
		},*/
		onDblClickRow : function(index,row){
			var datas = tab.datagrid("getRows");
			if(datas){
				for(var i = 0 , j = datas.length ; i < j ; i++){
					//alert(i);
					if(datas[i].id == row.id){
						tab.datagrid("unselectRow",i); 
						return ;
					}
				}
			}
			tab2.datagrid("deleteRow",index);
		},
		onLoadSuccess:function(data){
			tab2_load = true;
			initSelectData();
		}
	});
	
	//查询按钮点击
	$("#queryBton").click(function(){
		tab.datagrid("load",{
			'sysUser.userName':$("#name").val(),
			'a':Math.random()
		});
	})

	
})
	
	//格式化数据
	var sexformatter = function(value,row,index){
		if (row.sex == "1"){
			return "男";
		} else {
			return "女";
		}
	}
	
	var statusformatter = function(value,row,index){
		if (row.status == "-1"){
			return "无效";
		} else if(row.status == "1"){
			return "有效";
		} else if(row.status == "0"){
			return "已删除";
		}else {
			return "未知";
		}
	}
	
	function getSelected(){
		var datas = tab2.datagrid("getData");
		var objs = [];
		for( var i = 0 , j = datas.rows.length ; i < j ; i++){
			var tmp = datas.rows[i];
			objs.push(tmp);
		}
		alert(JSON.stringify(objs));
		return objs;
	}
</script>
</head>
<body class="easyui-layout">
	
	
	<div data-options="region:'west',split:true" style="width:650px;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'north',split:true,title:'查询',border:false" style="height:80px;background:#fff;padding:10px">
				姓名：<input type="text" id="name" />
				年龄：<input type="text" id="age" />
				<input type="button" value="查询" id="queryBton"/>
			</div>
			<div data-options="region:'center',border:false">
				<table id="datagridtab" ></table>
			</div>
		</div>
	</div>
	<div data-options="region:'center', title:'已选择'" >
		<table id="datagridtab2" ></table>
	</div> 
	<div data-options="region:'south',split:true,border:false" style="height:50px;background:#fff;">
		<center>
			<a href="#" class="easyui-linkbutton" onclick="getSelected();">获取选中的数据</a> 注：双击进行新增和删除
		</center>
	</div>
	
	


</body>
</html>