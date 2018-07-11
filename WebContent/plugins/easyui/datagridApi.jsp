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
<script src="${ctx}/js/jquery/jquery-2.0.min.js"></script>

<!--  easyui js -->
<script src="${ctx}/js/easyui/jquery.easyui.min.js"></script>
<script src="${ctx}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script>
function printInfo(tit,str){
	$("#editInfo").html(new Date() + "<br/>" +"<b>" + tit + ":</b>" + str + "<hr/>"+$("#editInfo").html()); 
}
var tab ;
var pd;
var lastIndex =0;

var products = [
    		    {vl:'0',sexname:'女'},
    		    {vl:'1',sexname:'男'}
    		   
    		];

//datagrid combobox编辑器修改后的回调函数
function datagridComboFun(newValue,oldValue){ 
	//alert(newValue+"|"+oldValue);
}


//自定义编辑器
$.extend($.fn.datagrid.defaults.editors, {
    myText: {
        init: function(container, options){
            var input = $('<input type="text" onclick="ccsck(this)" style="border:1px solid #000;width:18px;height:16px;overflow:hidden;text-align:center"/>').appendTo(container);
            return input;
        },
        destroy: function(target){
        	$(target).remove();
        },
        getValue: function(target){
            return $(target).val();
        },
        setValue: function(target, value){
            $(target).val(value);
        },
        resize: function(target, width){
            //$(target)._outerWidth(width);
        }
    }
});


function ccsck(o){
	 var arr = ["1","0"];
	 if($.trim($(o).val()) != ''){
		var loc = findLocInArr(arr, $(o).val()); //查询当前值在元素中的位置
		if (loc == (arr.length -1)) { //为数组最后一个元素
			$(o).val(arr[0]);
		} else { 
			$(o).val(arr[loc + 1]); 
		}
	} else{
		$(o).val(arr[0]);
	}
	$(this).blur();
	
}
//查找一个元素在数组中的位置
function findLocInArr(arr, item) {
   if (arr) {
	 var length = arr.length;
	 for (var i = 0; i < length; i++) {
		   if (arr[i] == item) {
			     return i;
			   }
		 }    
   }	 
   return -1;
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
		singleSelect:false,
		checkOnSelect:false,
		selectOnCheck:false,
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
		pagePosition:"bottom",
		
		loadMsg:"正在加载数据,请稍后",
		//冻结的列
		frozenColumns:[[
		        //选择框t
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
			{field:'bir',title:'BIRTHDAY',width:250,editor:'datebox',sortable:true,type:"date",dtype:"e"},
			{field:'email',title:'EMAIL',width:100,editor:{type:'validatebox', options:{required: true,validType:['email','length[0,30]']}},sortable:true,/*formatter:statusformatter,*/type:"int",dtype:"f"},
			{field:'status',title:'STATUS',width:100,editor:'myText',sortable:true,/*formatter:statusformatter,*/type:"int",dtype:"f"},
			{field:'orgId',width:500 ,fixed:true, editor:{type:'combobox',options:{url:'${ctx}/easyUi/easyUi!getOrgData.do',valueField:'code',textField:'name',onChange:datagridComboFun}},title:'ORG',sortable:true,type:"string",dtype:"b"}
		]],
		
		
		onLoadSuccess:function(data){ 
			printInfo("on load success data" , JSON.stringify(data));
		},
		onSelect:function(v,data){
			//alert(v);
			//alert(data.selectRow);
			data.selectRow = 1;
			$('#datagridtab').datagrid('updateRow',{
				index: v,
				row: data
			})
			printInfo("on select data:" , JSON.stringify(data));
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
				//加载属性信息
				printInfo("on click data :" , JSON.stringify(rowData)); 
			}else{
		        $.messager.alert('ERROR','数据不符合规范!');
			}
		},
		onAfterEdit:function(rowIndex,rowData,changes){
			var changeInfo = "change info:";
			
			var str = "";
			for(var pro in changes){
				
				str+= pro +":" +  changes[pro] + " || "; 
			}
			changeInfo += str;
			printInfo("on after edit:" , JSON.stringify(rowData)); 
		},
		onCancelEdit:function(rowIndex,rowData,changes){
			printInfo("on Cancel edit data:" , JSON.stringify(rowData));   
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
							r += (JSON.stringify(usr)+"<br/>");
						}
						printInfo("all date",r);
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
							name: "正在改变数据... 请查看第三行的name",
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
				text:'显示更改内容',
				iconCls:'icon-reload',
				handler:function(){
					tab.datagrid('endEdit', lastIndex);
					var changes = tab.datagrid('getChanges');
					//alert(changes.length);
					if(changes.length >= 1){
						var r = "";
						for(var i = 0 , j = changes.length ; i < j ; i++){
							r += (JSON.stringify(changes[i])+"<br/>");
						}
						printInfo("changed date",r);
					};
				}
			}
		]
	})


	//隐藏某列
	//tab.datagrid("hideColumn","sex");
	
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
	
	
	function dg_loading(){
		tab.datagrid("loading");
		return false;
	}
	function dg_loaded(){
		tab.datagrid("loaded");
		return false;
	}
	function dg_getRowIndex(){
		var i = tab.datagrid("getRowIndex","402881e846e119dc0146e119e1d00004"); 
		printInfo("getRowIndex" , i);
		return false;
	}
	function dg_getChecked(){
		var objs = tab.datagrid("getChecked"); 
		printInfo("getChecked" , JSON.stringify(objs));
		return false;
	}
	function dg_getSelections(){
		var objs = tab.datagrid("getSelections");
		printInfo("getSelections" , JSON.stringify(objs));
		return false;
	}
	function dg_clearSelections(){
		tab.datagrid("clearSelections");
		return false;
	}
	function dg_clearChecked(){
		tab.datagrid("clearChecked");
		return false;
	}
	function dg_beginEdit(){
		tab.datagrid("beginEdit",0);
		return false;
	}
	function dg_endEdit(){
		tab.datagrid("endEdit",0);
		return false;
	}
	function dg_hideColumn(){
		tab.datagrid("hideColumn","sex");
		return false;
	}
	function dg_showColumn(){
		tab.datagrid("showColumn","sex");
		return false;
	}
	
	function dg_selectRecord(){
		tab.datagrid("selectRecord","402881e846e119dc0146e119e1d00004");
		return false;
	}
	function dg_selectRow(){
		tab.datagrid("selectRow",0);
		return false;
	}
	function dg_unselectRow(){
		tab.datagrid("unselectRow",0);
		return false;
	}
	function dg_checkRow(){
		tab.datagrid("checkRow",0);
		return false;
	}
	function dg_uncheckRow(){
		tab.datagrid("uncheckRow",0);
		return false;
	}
	
	
	
	function dg_unselectAll(){
		tab.datagrid("unselectAll");
		return false;
	}
	function dg_selectAll(){
		tab.datagrid("selectAll");
		return false;
	}
	function dg_uncheckAll(){
		tab.datagrid("uncheckAll");
		return false;
	}
	function dg_checkAll(){
		tab.datagrid("checkAll");
		return false;
	}
	function dg_highlightRow(){
		tab.datagrid("highlightRow",0);
		return false;
	}
	function dg_updateRow(){
		tab.datagrid("updateRow",{
			index: 2,
			row: {
				name: "正在改变数据... ",
			}
		});
		return false;
	}
	
	function dg_getData(){
		var data = tab.datagrid("getData");
		printInfo("get Data" , JSON.stringify(data));
	}
	
	function dg_getChanges(){
		tab.datagrid('endEdit', lastIndex);
		var changes = tab.datagrid('getChanges');
		//alert(changes.length);
		if(changes.length >= 1){
			var r = "";
			for(var i = 0 , j = changes.length ; i < j ; i++){
				r += (JSON.stringify(changes[i])+"<br/>");
			}
			printInfo("changed date",r);
		};
	}
	function dg_appendRow(){
		var row = tab.datagrid('appendRow',{
			name: 'new name',
			age: 0,
			sex:0
		});
	}
	function dg_deleteRow(){
		var row = tab.datagrid('deleteRow',0);
	}
	
	function dg_getEditor(){
		tab.datagrid("beginEdit",0);
		
		var editor_bir = tab.datagrid('getEditor', {index:0,field:"bir"});
		$(editor_bir.target).datebox('setValue', '2014-05-06');
		
		var editor_org = tab.datagrid('getEditor', {index:0,field:"orgId"});
		$(editor_org.target).combobox('setValue', 'DL');
		
		printInfo("editor value : ", $(editor_bir.target).datebox('getValue') + "||" + $(editor_org.target).combobox('getValue'));
	}
	
	 
</script>
</head>
<body class="easyui-layout">


<div data-options="region:'center',title:'Center'" style="padding:2px;">
	<div class="easyui-layout" data-options="fit:true">
                <div data-options="region:'north',split:true,border:false" style="height:50px">
                	1姓名：<input type="text" id="name" />
					年龄：<input type="text" id="age" />
					<input type="button" value="查询" id="queryBton"/>
                </div>
                <div data-options="region:'center',border:false">
                	<table id="datagridtab"></table>
                </div>
    </div>
            
</div>

<div data-options="region:'east',split:true,title:'East'" style="width:300px;padding:2px;"> 
	<a href="#" class="easyui-linkbutton"  onclick="return dg_loading();">显示加载loading</a>loading<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_loaded();">关闭加载loading</a>loaded<br/>
	<hr/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_getRowIndex();">获取某id的index</a>getRowIndex<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_highlightRow();">高亮</a>highlightRow<br/>
	<hr/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_selectAll();">全选</a>selectAll<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_unselectAll();">全不选</a>unselectAll<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_getSelections();">获取选中(变色)数据</a>getSelections<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_clearSelections();">清除选中(变色)</a>clearSelections<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_selectRow();">选择某一行</a>selectRow<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_unselectRow();">取消选择某一行</a>unselectRow<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_selectRecord();">选择某ID列</a>selectRecord<br/>
	<hr/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_checkAll();">全勾选</a>checkAll<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_uncheckAll();">全不勾选</a>uncheckAll<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_getChecked();">获取勾选数据</a>getCheced<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_clearChecked();">清除勾选</a>clearChecked<br/> 
	<a href="#" class="easyui-linkbutton"  onclick="return dg_checkRow();">勾选某一行</a>checkRow<br/> 
	<a href="#" class="easyui-linkbutton"  onclick="return dg_uncheckRow();">清除勾某一行</a>uncheckRow<br/> 
	<hr/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_beginEdit();">编辑第一行</a>beginEdit<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_endEdit();">完成编辑第一行</a>endEdit<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_hideColumn();">隐藏性别列</a>hideColumn<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_showColumn();">显示性别列</a>showColumn<br/>
	<hr/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_getData();">获取全部数据</a>getData<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_updateRow();">修改某行显示的数据</a>updateRow<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_getChanges();">获取修改的数据</a>getChanges<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_appendRow();">新增一行</a>appendRow<br/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_deleteRow();">删除某一行</a>deleteRow<br/>
	<hr/>
	<a href="#" class="easyui-linkbutton"  onclick="return dg_getEditor();">获取editor</a>获取editor<br/>
	
	
</div>
	
<div data-options="region:'south',split:true,border:false,title:'INFO'" style="height:200px;background:#fff;padding:2px;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north',split:true,border:false" style="height:35px">
        	 <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="$('#editInfo').html('')">CLEAR INFO</a>
        </div>
        <div data-options="region:'center',split:true,border:false" >
        	<div id ="editInfo"></div>
        </div>
    </div>
</div>

</body>
</html>