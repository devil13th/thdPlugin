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

var pg=null;

$(function(){
	pg = $('#pg').propertygrid({
	    url: '${ctx}/easyUi/easyUi!queryPropertyGridData.do',
	    fit:true,
	    showGroup: true,
	    scrollbarSize: 0,
	    loadMsg:"正在加载数据,请稍后"
	});
	
})
function dg_getData(){
		var data = pg.propertygrid("getData");
		printInfo("get Data" , JSON.stringify(data));
	}

function dg_appendRow(){
	var row = {
			  name:'AddName',
			  value:'xxx',
			  group:'ID Settings',
			  editor:'text'
			};
	pg.propertygrid('appendRow',row);
}

function dg_load(){
	//pg.propertygrid("loading");
	
	pg.propertygrid("load",{
		'ids':"402881e846e119dc0146e119e1f60007",
		'r':Math.random()
	});
	
	//pg.propertygrid("loaded");
}
</script>
</head>
<body class="easyui-layout">


<div data-options="region:'center',title:'Center'" style="padding:2px;">
	<table id="pg" style="width:300px"></table>
</div>

<div data-options="region:'east',split:true,title:'East'" style="width:300px;padding:2px;">
<a href="#" class="easyui-linkbutton"  onclick="return dg_appendRow();">添加属性</a>appendRow<br/>
<a href="#" class="easyui-linkbutton"  onclick="return dg_getData();">获取数据</a>getData<br/>
<a href="#" class="easyui-linkbutton"  onclick="return dg_load();">加载数据</a>load<br/>

 
</div>
	
<div data-options="region:'south',split:true,border:false,title:'INFO'" style="height:200px;background:#fff;padding:2px;">
<div id ="editInfo"></div>
</div>

</body>
</html>