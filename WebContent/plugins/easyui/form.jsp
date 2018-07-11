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
<script src="${ctx}/js/jquery/jquery-1.11.1.min.js"></script>

<!--  easyui js -->

<script src="${ctx}/js/easyui/jquery.easyui.min.js"></script>
<script src="${ctx}/js/easyui/locale/easyui-lang-zh_CN.js"></script> 
<script>

function printInfo(tit,str){
	$("#editInfo").html(new Date() + "<br/>" +"<b>" + tit + ":</b>" + str + "<hr/>"+$("#editInfo").html()); 
}

$(function(){
	
	 $("#ff").form({
		 ajax:false
	 })
	 
	 
	$('#vv').textbox({
	    required: true,
	    validType:['email','length[0,20]']
	});
	
	$('#tb').textbox({
	    buttonText:'Search',
	    iconCls:'icon-man',
	    iconAlign:'left'
	})
	
	
	$('#orgId1').combobox({
	    url:'${ctx}/easyUi/easyUi!getOrgData2.do',
	    valueField:'code',
	    textField:'name',
	    required:true,
	    method: 'post',
		mode: 'remote'
	});	
	
})

 function loadLocal(){
     $('#ff').form('load',{
         userName:'myname',
         userMail:'mymail@gmail.com',
         userSex:0,
         id:'message',
         userBirthday:'2014-04-02',
         orgId:'SH'
     });
 }
 function loadRemote(){
     $('#ff').form('load', '${ctx}/easyUi/easyUi!loadFormData.do');
 }
 function clearForm(){
     $('#ff').form('clear');
 }
 
 function validateForm(){
	 var a = $('#ff').form('validate');
	 alert(a);
 }
 
 function getData(){
	var obj = $("#ff").serializeArray();
	printInfo("form data :" , JSON.stringify(obj)); 
	printInfo("form data str :" , $("#ff").serialize()); 
 }
 
  
function checkform(){
	alert($("#ff").form('validate'));
	if(!$("#ff").form('validate')){
		alert(验证不通过);
	}else{
		alert("验证通过");
	};
}
 
 //自定义表单的验证规则
 
 $.extend($.fn.validatebox.defaults.rules, {
	    number: {
	        validator: function(value){
        		if(value.substring(value.length-1)=="."){
            		return false;
            	}
	            return !isNaN(value);
	        },
	        message: '必须填写数字'
	    }
	});
	$.extend($.fn.validatebox.defaults.rules, {
	    minLength: {
	        validator: function(value, param){
	            return value.length >= param[0];
	        },
	        message: '请输入至少 {0}个字符.'
	    }
	});
	
	$.extend($.fn.validatebox.defaults.rules,{
	    maxLength: {
	        validator: function(value, param){
	            return value.length <= param[0];
	        },
	        message: '最多输入{0}个字符'
	    }
	});
	$.extend($.fn.validatebox.defaults.rules, {
	    min: {
	        validator: function(value, param){
	            return value >= param[0]; 
	        },
	        message: '请输入大于 {0} 的数字'
	    }
	});
	$.extend($.fn.validatebox.defaults.rules, {
	    max: {
	        validator: function(value, param){
	            return value <= param[0];
	        },
	        message: '请输入小于 {0} 的数字'
	    }
	});
	
	$.extend($.fn.validatebox.defaults.rules, {
	    compare: {
	        validator: function(value, param){
	        	var bv = $("#"+param).numberbox("getValue");
	            return value <= bv;
	        },
	        message: '必须大于a'
	    }
	});
	
	$.extend($.fn.validatebox.defaults.rules, {
	    mustselect: {
	        validator: function(value){
	        	//alert(value);
	            return value !='请选择';
	        },
	        message: '必须选择'
	    }
	});
	
	
</script>
</head>
<body class="easyui-layout">


<div data-options="region:'center',title:'Center'" style="padding:2px;">
	validatebox:<input id="vv" />
	<input id="vv" class="easyui-textbox"  data-options="required:true,validType:'email'"/>
	<br/>
	textbox:
	<input id="tb"/>
	<input class="easyui-textbox" data-options="iconCls:'icon-search',buttonText:'Search'" style="width:100px"/>
	<br/>
	<input type="text" class="easyui-numberbox" value="100" data-options="min:0,precision:2"/>
	
	<input id="dd" type="text" class="easyui-datebox" required="required"/>
	
	<hr/> 
	
	<form id="ff" method="post">
            <table cellpadding="5" width="100%">
                <tr>
                    <td>Name:</td>
                    <td><input class="easyui-textbox" type="text" name="userName" data-options="required:true"></input></td>
                    <td>Email:</td>
                    <td><input class="easyui-textbox" type="text" name="userMail" data-options="required:true,validType:'email'"></input></td>
                	<td>Sex:</td>
                    <td><input class="easyui-numberbox" type="text" name="userSex" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>Bir:</td>
                    <td><input class="easyui-datebox" data-options="required:true" name="userBirthday" ></input></td>
                    <td>Org:</td>
                    <td colspan="3">
                        <input type="text" name="orgId" id="orgId1" />
                    </td>
                </tr>
                <tr>
                  	<td>Id:</td>
                    <td colspan="5"><input class="easyui-textbox" name="id" data-options="multiline:true,required:true" style="height:60px;width:100%;"></input></td>
                </tr>
                <tr>
                  	<td>验证:</td>
                    <td colspan="5">
                    	<input 
                    	class="easyui-textbox" 
                    	name="ckipt" 
                    	data-options="required:true,validType:['number','maxLength[5]','min[0]','max[100]']" 
                    	></input>
                    	必须是数字、不超过5位字符串、且大于0、且小于100 (自定义验证规则)
                    
                    </td>
                </tr> 
                <tr>
                  	<td>a:</td>
                    <td colspan="5">
                    	<input 
                    	class="easyui-numberbox" 
                    	name="a" 
                    	id="a"
                    	data-options="required:true,precision:1,min:5,max:10" 
                    	></input>
                    	必填 、必须数字 、1位小数、大于5、小于10 (数字文本框的使用)
                    </td>
                </tr>
                <tr>
                  	<td>b:</td>
                    <td colspan="5">
                    	<input 
                    	class="easyui-numberbox" 
                    	name="b" 
                    	id="b"
                    	data-options="required:true,precision:1,min:5,max:10,validType:['compare[\'a\']']" 
                    	></input>
                    	必须大于a的值 (自定义验证规则)
                    
                    </td>
                </tr>
                
            </table>
            
            <input type="button" value="验证" onclick="checkform()"/>
        </form>
	
	
</div>

<div data-options="region:'east',split:true,title:'East'" style="width:300px;padding:2px;">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="loadLocal()">加载本地数据LoadLocal</a><br/>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="loadRemote()">动态加载数据LoadRemote</a><br/>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除信息Clear</a><br/>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="validateForm()">表单验证validate</a><br/>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="getData()">获取数据getData</a><br/>
 
</div>
	
<div data-options="region:'south',split:true,border:true,title:'INFO'" style="height:200px;background:#fff;padding:2px;">
<div id ="editInfo"></div>
</div>

</body>
</html>