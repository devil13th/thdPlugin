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
var pd;
var lastIndex =0;

var products = [
    		    {vl:'0',sexname:'女'},
    		    {vl:'1',sexname:'男'}
    		   
    		];
    		
    		
$(function(){
	
	pd = $('#pg').propertygrid({
		url:'${ctx}/easyUi/easyUi!getUserInfoData.do', 
	    showGroup: true,
	    scrollbarSize: 0,
	    height:250,
	    fit:true,
		fitColumns:true
	});
	 
	$('#orgId1').combobox({
	    url:'${ctx}/easyUi/easyUi!getOrgData.do',
	    valueField:'code',
	    textField:'name' 
	});	
	
	tab = $('#datagridtab').datagrid({
		title:'Jquery DataGrid',
		iconCls:'icon-ok',
		//数据来源
		url:'${ctx}/easyUi/easyUi!getUserData.do', 
		//默认参数
		queryParams:{'sysUser.userName':'${sysUser.userName}'},
		//斑马纹
		striped:true,
		//主键字段
		idField:'id',
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
		pageSize:10, 
		//每页显示条目下拉菜单
		pageList:[5,10,15,20,100],
		
		//pageNumber:5,
		rownumbers:true,//行号 
		//分页工具所在位置
		//pagePosition:"both",
		
		loadMsg:"正在加载数据,请稍后",
		//冻结的列
		frozenColumns:[[
		        //选择框
               {field:'ck',checkbox:true},
               {field:'selectRow',title:'s',formatter:function(v){
            	   if(v == 0){
            		   return "z";
            	   }else{
            		   return "x";
            	   }
               }},
               {field:'id',title:'ID',width:200,sortable:true}
		]],
		//不冻结的列
		columns:[[
			{field:'name',editor:'text',title:'Name',sortable:true,width:100,type:"string",dtype:"a"},
			{field:'sex',width:100,editor:{type:'combobox',options:{valueField:'vl',textField:'sexname',data:products}},title:'SEX',sortable:true,formatter:sexformatter,type:"string",dtype:"b"}, 
			{field:'bir',title:'BIRTHDAY',width:100,editor:'datebox',sortable:true,type:"date",dtype:"e"},
			{field:'email',title:'EMAIL',width:100,editor:{type:'validatebox', options:{required: true,validType:['email','length[0,30]']}},sortable:true,/*formatter:statusformatter,*/type:"int",dtype:"f"},
			{field:'status',title:'STATUS',width:100,editor:'text',sortable:true,/*formatter:statusformatter,*/type:"int",dtype:"f"},
			{field:'orgId',width:100,editor:{type:'combobox',options:{url:'${ctx}/easyUi/easyUi!getOrgData.do',valueField:'code',textField:'name'}},title:'ORG',sortable:true,type:"string",dtype:"b"}
		]],
		
		onLoadSuccess:function(data){
			pd.propertygrid("load",{
				'sysUser.id':data.rows[0].id,
				'a':Math.random()
			});
		},
		onSelect:function(v,data){
			//alert(v);
			//alert(data.selectRow);
			
			data.selectRow = 1;
			$('#datagridtab').datagrid('updateRow',{
				index: v,
				row: data

			})
		},
		
		
		//单击事件
		onClickRow:function(rowIndex,rowData){
			//alert(lastIndex+"||"+rowIndex);
			//alert(tab);
			var state = tab.datagrid("validateRow",lastIndex);
			if(state){
				tab.datagrid('endEdit', lastIndex);
				tab.datagrid('beginEdit', rowIndex); 
				//alert(lastIndex+"||"+rowIndex);
				lastIndex = rowIndex;
				
				if(rowData.id){
					pd.propertygrid("load",{
						'sysUser.id':rowData.id,
						'a':Math.random()
					});
					
					 $('#ff').form('load', '${ctx}/easyUi/easyUi!loadFormData.do?ids=' + rowData.id);
				}
				
			}else{
		        $.messager.alert('ERROR','数据不符合规范!');
			}
			//加载属性信息
		},
		onAfterEdit:function(rowIndex,rowData,changes){
			var changeInfo = "change info:";
			
			var str = "";
			for(var pro in changes){
				
				str+= pro +":" +  changes[pro] + " || "; 
			}
			changeInfo += str;
			$("#editInfo").html(new Date()+"<br/>after edit:"+rowData.id+":" + rowData.name + ","+ rowData.bir + "," + rowData.sex + "<br/>" + changeInfo + "<hr/>" + $("#editInfo").html()); 
			
			
		},
		onCancelEdit:function(rowIndex,rowData,changes){
			alert("cancel edit:" + rowData.name + ":" + rowData.sex);   
		},
		//双击事件 
		onDblClickRow:function(rowIndex, rowData){
			openWin("${ctx}/easyUi/easyUi!edit.do?sysUser.id=" + rowData.id,500,320);
		},
		//表头右键菜单
		onHeaderContextMenu: function(e, field){
			
			e.preventDefault();
			
			if (!$('#tmenu').length){
				createColumnMenu();
			}
			$('#tmenu').menu('show', {
				left:e.pageX,
				top:e.pageY
			});
		},
		//工具条
		toolbar:
		[
	         {
				text:'Action新增',
				iconCls:'icon-add',
				handler:function(){
					openWin("${ctx}/easyUi/easyUi!edit.do",600,420);
				}
			},
			'-',
			{
				text:'Action修改',
				iconCls:'icon-edit',
				handler:function(){
					var ds = tab.datagrid('getSelections');
					if(ds.length == 0){
						alert("请选择要修改的数据");
					   
						 
						return false;
					}
					if(ds.length >1){
						alert("只能选择一条修改的数据");
						return false;
					}
					openWin("${ctx}/easyUi/easyUi!edit.do?sysUser.id=" + ds[0].id,500,320);
				}
			},
			'-',
			{
				text:'datagrid新增',
				iconCls:'icon-save',
				handler:function(){
					var row = tab.datagrid('appendRow',{
						name: 'new name',
						age: 0,
						sex:0
					});
				}
			},
			'-',
			{
				text:'保存全部修改',
				iconCls:'icon-save',
				handler:function(){
					var ds = tab.datagrid('getSelections');
					if(ds.length == 0){
						alert("请选择要修改的数据");
						return false;
					}
					if(ds.length >1){
						alert("只能选择一条修改的数据");
						return false;
					}
					openWin("${ctx}/easyUi/easyUi!edit.do?sysUser.id=" + ds[0].id,500,320);
				}
			},
			'-',
			{
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
					if(confirm("确定要删除么?")){
						var ds = tab.datagrid('getSelections');
						if(ds.length > 0){
							//alert(ds.length);
							var ids=  "";
							for(var i = 0 , j = ds.length ; i < j ; i++){
								//alert(ds[i].id);
								ids += ds[i].id +",";
							}
							ids = ids.substring(0,ids.length -1 );
							//alert(ids);
							
							$.ajax({
								url: '${ctx}/easyUi/easyUi!deleteAllUser.do?ids=' + ids,
								cache:false,
								success: function(data) {
									//alert('${ctx}/easyUi/easyUi!deleteAll.do?ids=' + ids)
									
									//alert("var a = " + data)
									eval("var a = " + data);
									if(a.status == "success"){
										tab.datagrid('clearSelections');
										tab.datagrid("reload");
									}else{
										alert("错误：" + a.msg);
										tab.datagrid('clearSelections');
										tab.datagrid("reload");
									}
									
								}
							});
						}
					}
				}
			},
			'-',
			{
				text:'刷新',
				iconCls:'icon-reload',
				handler:function(){
					tab.datagrid("reload");
				}
			},
			'-',
			{
				text:'获取数据',
				iconCls:'icon-reload',
				handler:function(){
					tab.datagrid('endEdit', lastIndex);
					var data = tab.datagrid("getData");
					//alert(data.rows);
					var r = new Date()+"<br/>";
					if(data.rows.length > 0){
						for(var i = 0 , j = data.rows.length ; i < j ; i++){
							var usr = data.rows[i];
							var str = "";
							str += "id:" + usr.id + " || ";
							str += "name:" + usr.name + " || ";
							str += "sex:" + usr.sex + " || ";
							str += "status:" + usr.status + " || ";
							str += "orgId:" + usr.orgId + " || ";
							
							r += (str+"<br/>");
						}
						
						$("#editInfo").html(r +  "<hr/>" + $("#editInfo").html()); 
					}
					
				}
			},
			'-',
			{
				text:'更改数据',
				iconCls:'icon-reload',
				handler:function(){
					tab.datagrid('loading');
					tab.datagrid('updateRow',{
						index: 2,
						row: {
							name: "正在改变数据...",
							
						}
					});
					
					setTimeout(function(){
						tab.datagrid('updateRow',{
							index: 2,
							row: {
								name: "更改数据完成",
								
							}
						});
						
						tab.datagrid('loaded');
						
					},2000);
					
					
					
				}
			},'-',
			{
				text:'变更内容',
				iconCls:'icon-reload',
				handler:function(){
					tab.datagrid('endEdit', lastIndex);
					var changes = tab.datagrid('getChanges');
					//alert(changes.length);
					if(changes.length >= 1){
						for(var i = 0 , j = changes.length ; i < j ; i++){
							var usr = changes[i];
							alert(usr.id+"||" + usr.name+"||" + usr.sex); 
						}
					};
				}
			}
		]
	})

	
	//var page = tab.datagrid("getPager");
	/*
	page.pagination({
        pageSize: 5,//每页显示的记录条数，默认为10  
        pageList: [5,10,15,20],//可以设置每页记录条数的列表  
        beforePageText: '第',//页数文本框前显示的汉字  
        afterPageText: '页    共{pages} 页',  
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
    })*/

	//隐藏某列
	//tab.datagrid("hideColumn","sex");
	//alert(1)
	
	//创建右键菜单
	function createColumnMenu(){
		var tmenu = $('<div id="tmenu" style="width:100px;"></div>').appendTo('body');
		var fields = tab.datagrid('getColumnFields');
		for(var i=0; i<fields.length; i++){
			//alert(i)
			//alert(fields[i].data("dtype"))
			var c = tab.datagrid('getColumnOption',fields[i]);
			//alert(c.dtype)
			/*var s = ""
			for(var p in c){
				s+= p + ":" + c[p] +"\n";
			}
			alert(s);*/
			$('<div iconCls="icon-ok"/>').html(fields[i]).appendTo(tmenu);
			
		}
		
		tmenu.menu({
			
			onClick: function(item){
				if (item.iconCls=='icon-ok'){
					tab.datagrid('hideColumn', item.text);
					tmenu.menu('setIcon', {
						target: item.target,
						iconCls: 'icon-empty'
					});
				} else {
					tab.datagrid('showColumn', item.text);
					tmenu.menu('setIcon', {
						target: item.target,
						iconCls: 'icon-ok' 
					});
				}
			}
		});
	}

	
	//查询按钮点击
	$("#queryBton").click(function(){
		tab.datagrid("load",{
			'sysUser.userName':$("#name").val(),
			'a':Math.random()
		});
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
	


	function openWin(url,width,height){
		
		$('#win').window("open");
		var opt = {}

		if(width){
			opt.width = width;
		}
		if(height){
			opt.height = height;
		}
		
		$('#win').panel('resize',opt);
		document.getElementById("winSrc").src = url;
	}
	
	function closeWin(){
		$('#win').window("close");
	}
	function resizeDataGrid(){
		window.onresize = function(){
			
		}
	}
	
	function saveForm(){
		var obj = $("#ff").serializeArray();
		alert(JSON.stringify(obj));
	}
</script>
</head>
<body class="easyui-layout">
<div id="win" style="overflow:hidden; ">
		<iframe id="winSrc" frameborder="0" width="100%" height="100%"></iframe>
	</div>

<div data-options="region:'center',title:'Center'" style="padding:2px;">
	
	
	
	<div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'north',split:true,border:false" style="height:50px">
            	姓名：<input type="text" id="name" value="${sysUser.userName}"/>
				年龄：<input type="text" id="age" />
				<input type="button" value="查询" id="queryBton"/>
            </div>
            <div data-options="region:'center',border:false">
            	<table id="datagridtab"></table>
            </div>
    </div>
    
    
	
</div>

<div data-options="region:'east',split:true,title:'East'" style="width:300px;padding:2px;">
	
	
	
	<div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'north',split:true,border:false" style="height:250px">
            	<table id="pg"></table>
            </div>
            <div data-options="region:'center',border:false">
            	
				<form id="ff" method="post">
		            <table cellpadding="5">
		                <tr>
		                    <td>Name:</td>
		                    <td><input class="easyui-textbox" type="text" name="userName" data-options="required:true"></input></td>
		                </tr>
		                <tr>
		                    <td>Email:</td>
		                    <td><input class="easyui-textbox" type="text" name="userMail" data-options="required:true,validType:'email'"></input></td>
		                </tr>
		                <tr>
		                    <td>Sex:</td>
		                    <td><input class="easyui-numberbox" type="text" name="userSex" data-options="required:true"></input></td>
		                </tr>
		                <tr>
		                    <td>Id:</td>
		                    <td><input class="easyui-textbox" name="id" data-options="multiline:true" style="height:60px"></input></td>
		                </tr>
		                <tr>
		                    <td>Bir:</td>
		                    <td><input class="easyui-datebox" name="userBirthday" ></input></td>
		                </tr>
		                
		                <tr>
		                    <td>Org:</td>
		                    <td>
		                        <input type="text" name="orgId" id="orgId1" />
		                    </td> 
		                </tr>
		            </table>
		            
		            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveForm()">saveForm</a>
		        </form>
        
            </div>
    </div>
    
    
</div>
	
<div data-options="region:'south',split:true,border:false" style="height:100px;background:#fff;padding:2px;">
	<div id ="editInfo"></div>
</div>

</body>
</html>