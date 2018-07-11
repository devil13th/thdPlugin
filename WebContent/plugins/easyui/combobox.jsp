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
$(function(){
	$('#orgId1').combobox({
	    url:'${ctx}/easyUi/easyUi!getOrgData.do',
	    valueField:'code',
	    textField:'name' ,
	    //输入的项目必须匹配某个下拉菜单,否则置空
	    onHidePanel : function() {  
	        var _options = $(this).combobox('options');  
	        var _data = $(this).combobox('getData');/* 下拉框所有选项 */  
	        var _value = $(this).combobox('getValue');/* 用户输入的值 */  
	        var _b = false;/* 标识是否在下拉列表中找到了用户输入的字符 */  
	        for (var i = 0; i < _data.length; i++) {  
	            if (_data[i][_options.valueField] == _value) {  
	                _b=true;  
	                break;  
	            }  
	        }  
	        if(!_b){  
	            $(this).combobox('setValue', '');  
	        }  
	    }
	});	
	
	$('#orgId1 input').click(function(){
		alert(1);
	});	
	
	$('#orgId2').combobox({
	    url:'${ctx}/easyUi/easyUi!getOrgData.do',
	    valueField:'code',
	    textField:'name' ,
	    formatter: formatItem,
	    onSelect: function(rec){
	    	var url = '${ctx}/easyUi/easyUi!getOrgData.do?sysOrg.orgCode='+rec.code;
            $('#orgId3').combobox('reload', url);
	    	$.messager.alert('My Title', rec.code +"|" + rec.name);
        }
	});	
	
	
	
	$('#orgId3').combobox({
	    url:'${ctx}/easyUi/easyUi!getOrgData.do',
	    valueField:'code',
	    textField:'name' 
	});	
	$('#orgId4').combobox({
		mode:'remote',
	    url:'${ctx}/easyUi/easyUi!getOrgData2.do',
	    valueField:'code',
	    textField:'name',
	    editable: true,
        method: 'post',
		mode: 'remote',
		//输入的项目必须匹配某个下拉菜单,否则置空
	    onHidePanel : function() {  
	        var _options = $(this).combobox('options');  
	        var _data = $(this).combobox('getData');/* 下拉框所有选项 */  
	        var _value = $(this).combobox('getValue');/* 用户输入的值 */  
	        var _b = false;/* 标识是否在下拉列表中找到了用户输入的字符 */  
	        for (var i = 0; i < _data.length; i++) {  
	            if (_data[i][_options.valueField] == _value) {  
	                _b=true;  
	                break;  
	            }  
	        }  
	        if(!_b){  
	            $(this).combobox('setValue', '');  
	        }  
	    }
	});	
	
	
	 function formatItem(row){
         var s = '<span style="font-weight:bold">' + row.code + '</span><br/>' +
                 '<span style="color:#888">' + row.name + '</span>';
         return s;
     }
	
})

function getValue(){
	var v = $('#orgId4').combobox("getValue");
	alert(v);
}

</script>
</head>
<body style="padding:0px;margin:0px; ">
组织机构：
<input type="text" id="orgId1" value="SH" onclick="alert(1)"/>   

<hr/>
联动：
<input type="text" id="orgId2" value="BJ"/>
<input type="text" id="orgId3"/>
<hr/>
查询匹配：
<input type="text" id="orgId4"/>
<input type="button" value="Get Value" onclick="getValue()"/>
</body> 
</html>