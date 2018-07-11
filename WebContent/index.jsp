<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="pub/TagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>INDEX</title>

<!-- easyui css -->
<link rel="stylesheet" href="${ctx}/js/easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="${ctx}/js/easyui/themes/icon.css" />

<!-- jquery js -->
<script src="${ctx}/js/jquery/jquery-1.8.0.min.js"></script>

<!--  easyui js -->
<script src="${ctx}/js/easyui/jquery.easyui.min.js"></script>
<script src="${ctx}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script>
var win;
$(function(){
	win = $('#win').window({
	    width:900,
	    height:600,
	    modal:true
	});
	$('#win').window('close');
})
function showThis(o){
	document.getElementById("winSrc").src = o.href;
	$('#win').window('open');// open a window
}

var docObj = {
	easydatagrid:{
		interduce : " ** datagrid加载数据 **toolbar的使用 ** datagrid带有初始化参数的查询 ** 数据增删改查 ** datagrid编辑与新增 ** propertygrid使用 ** propertygrid加载数据 ** form数据加载"
	},
	easydatagridstandard:{
		interduce : " ** datagrid快速开发 ** datagrid开发标准代码  **Gson的使用  **分页 "
	},
	easyuidatagridselector:{
		interduce : "** datagrid选择器 ** GSON的使用  ** spring jdbcTemplate的使用"
	},
	easyuidatagridinwin:{
		interduce : " ** easyui 布局"
	},
	easyuidatagridapi:{
		interduce : " ** datagrid api "
	},
	easyuipropertygrid:{
		interduce : " ** propertygrid的使用"
	},
	easyuitree:{
		interduce : " ** easyui tree的使用"
	},
	easyuitreegrid:{
		interduce : "easyuitreegrid"
	},
	easyuiform:{
		interduce : "easyuiform"
	},
	easyuicombobox:{
		interduce : "easyuicombobox"
	},
	jqueryztree:{
		interduce : "jqueryztree"
	},
	jqueryztreeselector:{
		interduce : "jqueryztreeselector"
	},
	jqueryztreeselector2:{
		interduce : "jqueryztreeselector2"
	},
	uploadify:{
		interduce : "uploadify"
	},
	layout:{
		interduce : "easy layout"
	},
	layout2:{
		interduce : "easy layout"
	},
	combotree:{
		interduce : "combotree"
	},
	combogrid:{
		interduce : "combogrid"
	},
	ueditor:{
		interduce : "百度在线编辑器"
	},
	datatables:{
		interduce : "表格"
	},
	datatablesApi:{
		interduce : "表格API"
	},
	
	select2:{
		interduce : "下拉菜单"
	},
	cors:{
		interduce : "解决ajax跨域问题 以及父子页面跨域访问问题 <br/>设置cookie 修改C:\Windows\System32\drivers\etc\hosts文件 加入以下内容<br/>  127.0.0.1 devil13th.thd.com<br/>  192.168.191.1  thd.thd.com"
	},
	cookieSet:{
		interduce : "设置cookie 修改C:\Windows\System32\drivers\etc\hosts文件 加入以下内容<br/>  127.0.0.1 devil13th.thd.com<br/>  192.168.191.1  thd.thd.com<br/>设置cookie的请求使用其中一个域名,获取cookie的请求使用另一个域名"
	},
	cookieGet:{
		interduce : "获取cookie 修改C:\Windows\System32\drivers\etc\hosts文件 加入以下内容<br/>  127.0.0.1 devil13th.thd.com<br/>  192.168.191.1  thd.thd.com<br/>设置cookie的请求使用其中一个域名,获取cookie的请求使用另一个域名"
	},
	formvalidation:{
		interduce : "表单验证"
	},
	datetimepicker:{
		interduce : "日期选择器"
	},
	fileinput:{
		interduce : "附件上传，拖拽上传，多文件上传"
	},
	fileinputExample:{
		interduce : "拖拽附件多文件上传例子"
	},
	icheck:{
		interduce : "多选，单选"
	},
	layer:{
		interduce : "layer插件，弹出层，提示，确认窗口"
	}
	

}

function showKN(name){
	$("#kn").html(docObj[name].interduce)
}
</script>
</head>

<body class="easyui-layout">
<%
session.setAttribute("user", "devil13th");
%>
	<div data-options="region:'north',split:true,title:'North'" style="height:60px;background:#fff;padding:10px">north region</div>
	<div data-options="region:'west',split:true,title:'West'" style="width:250px;padding:10px;overflow:auto;">
		<a 
			href="${ctx}/easyUi/easyUi!layout.do" 
			onmouseover="showKN(this.id)" 
			id="layout"
		>
			easyui layout
		</a>
		<br/>
		<a 
			href="${ctx}/easyUi/easyUi!layout2.do" 
			onmouseover="showKN(this.id)" 
			id="layout2"
		>
			easyui layout
		</a>
		<br/>
		<a 
			href="${ctx}/easyUi/easyUi!datagrid.do?sysUser.userName=2" 
			onmouseover="showKN(this.id)" 
			id="easydatagrid"
		>
			easyui datagrid
		</a>
		<br/>
		<a 
			href="${ctx}/easyUi/easyUi!datagridStandard.do" 
			onmouseover="showKN(this.id)" 
			id="easydatagridstandard"
		>
			easyui datagrid 快速开发
		</a>
		<br/>
		<a 
			href="${ctx}/easyUi/easyUi!datagridSelect.do?ids=402881e846e119dc0146e119e29c0013,402881e846e119dc0146e119e2a80014" 
			onmouseover="showKN(this.id)" 
			id="easyuidatagridselector"
		>
			easyui datagrid selector
		</a>
		<br/>
		<a 
			href="${ctx}/easyUi/easyUi!datagrid.do" 
			onclick="showThis(this);return false"  
			onmouseover="showKN(this.id)" 
			id="easyuidatagridinwin"
		>
			easyui datagrid in win
		</a>
		<br/>
		<a 
			href="${ctx}/easyUi/easyUi!datagridApi.do"  
			onmouseover="showKN(this.id)" 
			id="easyuidatagridapi"
		>
			easyui datagrid api
		</a>
		<br/>
		<a 
			href="${ctx}/easyUi/easyUi!propertyGrid.do"
			onmouseover="showKN(this.id)" 
			id="easyuipropertygrid"
		>
			easyui propertygrid
		</a>
		<br/>
		<a 
			href="${ctx}/easyUi/easyUi!tree.do"
			onmouseover="showKN(this.id)" 
			id="easyuitree"
		>
			easyui tree
		</a>
		
		
		<br/> 
		<a 
			href="${ctx}/easyUi/easyUi!treegrid.do"
			onmouseover="showKN(this.id)" 
			id="easyuitreegrid"
		>
		easyui treegrid
		</a>
		<br/>
		<a 
			href="${ctx}/easyUi/easyUi!form.do"
			onmouseover="showKN(this.id)" 
			id="easyuiform"
		>
			easyui form
		</a>
		<br/>
		<a 
			href="${ctx}/easyUi/easyUi!combobox.do"
			onmouseover="showKN(this.id)" 
			id="easyuicombobox"
		>
			easyui combobox
		</a>
		<br/>
		<a 
			href="${ctx}/easyUi/easyUi!combotree.do"
			onmouseover="showKN(this.id)" 
			id="combotree"
		>
			easyui combotree
		</a>
		<br/>
		<a 
			href="${ctx}/easyUi/easyUi!combogrid.do"
			onmouseover="showKN(this.id)" 
			id="combogrid"
		>
			easyui combogrid
		</a>
		<br/>
		<a 
			href="${ctx}/tree/tree_index.do"
			onmouseover="showKN(this.id)" 
			id="jqueryztree"
		>
			jquery ztree
		</a>
		<br/> 
		<a 
			href="${ctx}/tree/tree_select.do?ckType=checkbox&checkCodes=root.00001,root.00001.00001,root.00002,root.00003.00001.00001"
			onmouseover="showKN(this.id)" 
			id="jqueryztreeselector"
		>
			jquery ztree selector
		</a>
		<br/>
		
		<a 
			href="${ctx}/tree/tree_openCheckTree.do"
			onmouseover="showKN(this.id)" 
			id="jqueryztreeselector2"
		>
			jquery ztree selector2
		</a>
		<br/>  
		<a 
			href="${ctx}/upload/upload!uploadify.do"
			onmouseover="showKN(this.id)" 
			id="uploadify"
		>
			uploadify
		</a>
		<br/> 
		<a 
			href="${ctx}/ueditor/ueditor!ueditor.do"
			onmouseover="showKN(this.id)" 
			id="ueditor"
		>
			ueditor
		</a>
		<br/> 
		<a 
			href="${ctx}/datatables/datatables!dataTables.do"
			onmouseover="showKN(this.id)" 
			id="datatables"
		>
			datatables
		</a>
		<br/> 
		<a 
			href="${ctx}/datatables/datatables!dataTablesApi.do"
			onmouseover="showKN(this.id)" 
			id="datatablesApi"
		>
			datatablesApi
		</a>
		<br/> 
		<a 
			href="${ctx}/bootstrap/bootstrap!select2.do"
			onmouseover="showKN(this.id)" 
			id="select2"
		>
			select2
		</a>
		<br/>
		<a 
			href="${ctx}/bootstrap/bootstrap!icheck.do"
			onmouseover="showKN(this.id)" 
			id="icheck"
		>
			icheck
		</a>
		<br/> 
		<a 
			href="http://devil13th.thd.com:8090/thdPlugins/cors/cors!sendAjax.do"
			onmouseover="showKN(this.id)" 
			id="cors"
		>
			cors(ajax跨域)
		</a>
		<br/> 
		<a 
			href="http://devil13th.thd.com:8090/thdPlugins/cookie/cookie!setCookie.do"
			onmouseover="showKN(this.id)" 
			id="cookieSet"
		>
			cookie跨域(设置)
		</a>
		<br/> 
		<a 
			href="http://thd.thd.com:8090/thdPlugins/cookie/cookie!getCookie.do"
			onmouseover="showKN(this.id)" 
			id="cookieGet"
		>
			cookie跨域(获取)
		</a>
		<br/> 
		<a 
			href="${ctx}/bootstrap/bootstrap!formvalidation.do"
			onmouseover="showKN(this.id)" 
			id="formvalidation"
		>
			formvalidation表单验证
		</a>
		<br/> 
		<a 
			href="${ctx}/bootstrap/bootstrap!datetimepicker.do"
			onmouseover="showKN(this.id)" 
			id="datetimepicker"
		>
			datetimepicker时间日期选择
		</a>
		<br/> 
		<a 
			href="${ctx}/bootstrap/bootstrap!layer.do"
			onmouseover="showKN(this.id)" 
			id="layer"
		>
			layer
		</a>
		<br/> 
		
		<a 
			href="${ctx}/bootstrap/bootstrap!fileinput.do"
			onmouseover="showKN(this.id)" 
			id="fileinput"
		>
			拖拽上传fileinput
		</a>
		
		<br/> 
		<a 
			href="${ctx}/bootstrap/bootstrap!fileinputExample.do"
			onmouseover="showKN(this.id)" 
			id="fileinputExample"
		>
			拖拽上传fileinput
		</a>
		
		
		
		
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
	<div data-options="region:'south',split:true,border:false" style="height:50px;background:#fff;padding:10px;">south region</div>
	<div data-options="region:'center',title:'Center'">
		<div id="kn"></div>
	</div>
	
	<div id="win"><iframe id="winSrc" frameborder="0" width="100%" height="100%"></iframe></div>
</body>


</html>