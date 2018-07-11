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
var cbg;
var cbg2;


function setValued(){
	cbg.combogrid('setValue', "402881e846e119dc0146e119e1d00004");
}
function setValues(){
	cbg2.combogrid('setValues', ['402881e846e119dc0146e119e1a30002','402881e846e119dc0146e119e1d00004','402881e846e119dc0146e119e249000d']); 
} 

function getValued(){
	var str = cbg.combogrid("getValue");
	alert(str);
}
function getValueds(){
	var str = cbg2.combogrid("getValues");
	alert(str);
}
function getText(){
	var str = cbg.combogrid("getText");
	alert(str);
	str = cbg2.combogrid("getText");
	alert(str);
}
$(function(){
	cbg = $("#cbg").combogrid({
		panelWidth: 500,
		url:'${ctx}/easyUi/easyUi!getUserData.do', 
		//斑马纹
		striped:true,
        idField: 'id',
        textField: 'name',
        method: 'get',
        columns: [[
			{field:'name',editor:'text',title:'Name',sortable:true,width:100},
			{field:'bir',title:'BIRTHDAY',width:100,sortable:true,type:"date"},
			{field:'email',title:'EMAIL',width:100,sortable:true},
			{field:'status',title:'STATUS',width:100,editor:'text',sortable:true},
			{field:'orgId',width:100,title:'ORG',sortable:true}
        ]],
        fitColumns: true
	})
	
	
	cbg2 = $("#cbg2").combogrid({
		panelWidth: 500,
		url:'${ctx}/easyUi/easyUi!getUserData.do', 
		//斑马纹
		striped:true,
		multiple: true,
        idField: 'id',
        textField: 'name',
        method: 'get',
        columns: [[
             {field:'id',checkbox:true},
			{field:'name',editor:'text',title:'Name',sortable:true,width:100},
			{field:'bir',title:'BIRTHDAY',width:100,sortable:true,type:"date"},
			{field:'email',title:'EMAIL',width:100,sortable:true},
			{field:'status',title:'STATUS',width:100,editor:'text',sortable:true},
			{field:'orgId',width:100,title:'ORG',sortable:true}
        ]],
        fitColumns: true
	})
})


	
</script>
</head>
<body class="easyui-layout">

<div data-options="region:'center',title:'Center'" style="padding:2px;">
	单选<input class="easyui-combogrid" id="cbg" style="width:150px" value="402881e846e119dc0146e119e22d000c" /><br/><br/><br/><br/>
	多选<input class="easyui-combogrid" id="cbg2" style="width:150px" value="402881e846e119dc0146e119e1a30002,402881e846e119dc0146e119e1d00004" />
	
	
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